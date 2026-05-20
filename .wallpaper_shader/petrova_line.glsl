#define MAX_DIST 100.0
#define MAX_ITER 100
#define N 4

#define dot2(v) dot(v, v)

float hash12(vec2 p) {
  p = fract(p * vec2(12.9898, 78.233));
  p += dot(p, p + 45.32);
  return fract(p.x * p.y);
}

// https://www.shadertoy.com/view/WltSD7
float cos_acos_3(in float x) {
  x = sqrt(0.5 + 0.5 * x);
  return x * (x * (x * (x * -0.008972 + 0.039071) - 0.107074) + 0.576975) + 0.5;
}

// https://www.shadertoy.com/view/ltXSDB
vec2 sdBezier(vec3 pos, vec3 A, vec3 B, vec3 C) {
  vec3 a = B - A;
  vec3 b = A - 2.0 * B + C;
  vec3 c = a * 2.0;
  vec3 d = A - pos;

  float kk = 1.0 / dot(b, b);
  float kx = kk * dot(a, b);
  float ky = kk * (2.0 * dot(a, a) + dot(d, b)) / 3.0;
  float kz = kk * dot(d, a);

  vec2 res;

  float p = ky - kx * kx;
  float p3 = p * p * p;
  float q = kx * (2.0 * kx * kx - 3.0 * ky) + kz;
  float q2 = q * q;
  float h = q2 + 4.0 * p3;

  if (h >= 0.0) {
    h = sqrt(h);
    vec2 x = (vec2(h, -h) - q) / 2.0;
    vec2 uv = sign(x) * pow(abs(x), vec2(1.0 / 3.0));
    float t = clamp(uv.x + uv.y - kx, 0.0, 1.0);
    res = vec2(dot2(d + (c + b * t) * t), t);
  } else {
    float z = sqrt(-p);
#if 0
        float v = acos( q/(p*z*2.0) ) / 3.0;
        float m = cos(v);
        float n = sin(v)*1.732050808;
#else
    float m = cos_acos_3(q / (p * z * 2.0));
    float n = sqrt(1.0 - m * m) * 1.732050808;
#endif
    vec3 t = clamp(vec3(m + m, -n - m, n - m) * z - kx, 0.0, 1.0);

    // 3 roots, but only need two
    float dis = dot2(d + (c + b * t.x) * t.x);
    res = vec2(dis, t.x);

    dis = dot2(d + (c + b * t.y) * t.y);
    if (dis < res.x)
      res = vec2(dis, t.y);
  }

  res.x = sqrt(res.x);
  return res;
}

// https://www.shadertoy.com/view/Xc3yzM
// Based on http://www.oscars.org/science-technology/sci-tech-projects/aces
vec3 aces_tonemap(vec3 color) {
  mat3 m1 = mat3(0.59719, 0.07600, 0.02840, 0.35458, 0.90834, 0.33383, 0.04823,
                 0.01566, 0.83777);
  mat3 m2 = mat3(1.60475, -0.10208, -0.00327, -0.53108, 1.10813, -0.07276,
                 -0.07367, -0.00605, 1.07602);
  vec3 v = m1 * color;
  vec3 a = v * (v + 0.0245786) - 0.000090537;
  vec3 b = v * (0.983729 * v + 0.4329510) + 0.238081;

  return m2 * (a / b); // changed
}

// Fork: Star Nest by Pablo Roman Andrioli
// https://www.shadertoy.com/view/XlfGRj
vec3 stars(vec3 o, vec3 dir, float d) {
#define iterations 20
#define formuparam 0.53
#define volsteps 5
#define stepsize 0.1
#define tile 0.850
#define brightness 0.0015
#define distfading 0.730
  o += vec3(731, 392, 1923);
  // volumetric rendering
  float s = 0.1, fade = 1.;
  vec3 v = vec3(0.);
  for (int r = 0; r < volsteps; r++) {
    vec3 p = o + s * dir * .5;
    p = abs(vec3(tile) - mod(p, vec3(tile * 2.))); // tiling fold
    float pa, a = pa = 0.;
    for (int i = 0; i < iterations; i++) {
      p = abs(p) / dot(p, p) - formuparam; // the magic formula
      a += abs(length(p) - pa);            // absolute sum of average change
      pa = length(p);
    }
    a *= a * a; // add contrast
    v += fade;
    v += vec3(s, s * s, s * s * s * s) * a * brightness *
         fade;          // coloring based on distance
    fade *= distfading; // distance fading
    s += stepsize;

    if (s > d)
      break;
  }

  return v * .01;
}

vec3 orbit(float t, float d, float y) {
  return vec3(sin(t), sin(t) * y, cos(t)) * d;
}

float curveDist(vec3 p, vec3 pts[N]) {
  float dm = MAX_DIST;
  for (int i = 0; i < N - 2; i++) {
    vec3 a = (pts[i] + pts[i + 1]) * 0.5;
    vec3 b = pts[i + 1];
    vec3 c = (pts[i + 1] + pts[i + 2]) * 0.5;
    if (i == 0)
      a = pts[0];
    if (i == N - 3)
      c = pts[N - 1];

    vec2 h = sdBezier(p, a, b, c);

    float u = (float(i) + h.y) / float(N - 2);
    float r = pow(1. - sin(u * 3.14 - 0.3), 1.) * (pow(1. - u, 5.) + .1) * .5;
    r += sin((u - iTime * .07) * 100.0) * .01 * pow(1. - u, .8);
    r += sin((u - iTime * .03) * 200.0) * .005 * pow(1. - u, .8);
    r += sin((u - iTime * .05) * 20.0) * .02;

    dm = min(h.x - r, dm);
  }
  return dm;
}

vec2 sdf(vec3 p) {
  int mat = -1;
  float d = MAX_DIST;
  float sunRad = 25.0;
  vec3 sunPos = vec3(-40, -13, 10);

  float planetRad = .5;
  vec3 planetPos = vec3(0, 0, 0);

#define hit(_mat, _d)                                                          \
  if (_d < d) {                                                                \
    d = _d;                                                                    \
    mat = _mat;                                                                \
  }

  hit(0, distance(planetPos, p) - planetRad);
  hit(1, distance(sunPos, p) - sunRad);
  hit(2, distance(orbit(iTime * .2, 5., -.5) * vec3(1, 1, 3), p) - 0.02);

  vec3 sunSurface =
      sunPos + normalize((planetPos - sunPos) * vec3(1, 1, -3)) * sunRad;
  vec3 planetSurface = planetPos + normalize(sunPos - planetPos) * planetRad;
#define pos(a) mix(sunSurface, planetSurface, a)
  hit(3,
      curveDist(p, vec3[](pos(0.0), pos(0.4) + vec3(0, 2, 3) * sin(iTime * .2),
                          pos(0.9) + vec3(0, -0.5, -3) * cos(iTime * .5),
                          pos(1.0))));

  return vec2(d, mat);
}

vec3 render(vec3 ro, vec3 rd, vec2 uv) {

  float t = 0.;
  int mat = -1;
  float d = MAX_DIST;

  float fog = 0.0;
  for (int i = 0; i < MAX_ITER; i++) {
    vec2 h = sdf(ro + rd * t);
    mat = int(h.y);
    d = h.x;
    if (t > MAX_DIST)
      mat = -1;
    if (h.x < 0.01 || t > MAX_DIST)
      break;
    fog += .01;
    t += h.x * (0.7 + hash12(uv + vec2(0, iTime * .000002)) * .3);
  }

  vec3 c = (pow(fog, 1.5) * 3. + pow(fog, .5) * .5) * vec3(1, .2, .2);

  if (mat == 1)
    c += vec3(pow(smoothstep(25., 50., t), 1.5) * .4) * vec3(5, 1, 1);
  else if (mat == 2)
    c += vec3(5, 1, 1);
  else if (mat == 3)
    c += vec3(1, .2, .2) + vec3(smoothstep(.2, .4, fog)) * vec3(5, 1, 1);

  float time = iTime * -.0005;
  ro = ro * .005 + vec3(time, time * .4, 0);
  c += stars(ro, rd, d) * vec3(1., .5, .5);

  return c;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
  vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
  uv = uv * (1.0 + .04 * dot(uv, uv));

  vec3 o = vec3(0, 0, -20.0);
  vec3 d = normalize(vec3(uv * .3, 1));
  if (iMouse.xy != vec2(0))
    o.xy += ((iMouse.xy / iResolution.xy) - vec2(.5)) * 10.;

  vec3 raw = render(o, d, uv);

  fragColor = vec4(aces_tonemap(raw), 1.0);
}