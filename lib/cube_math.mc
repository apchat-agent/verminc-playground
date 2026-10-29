// Local vec3/mat4 helpers for the spinning cube and its deterministic check.
// The cube demo is informed by floooh/sokol-samples sapp/cube-sapp.c at
// https://github.com/floooh/sokol-samples/commit/b38ef3fd4417c673a51e2c23e206cde4a53eb96a.

f32 cube_sqrt(f32 value) {
    if value <= 0.0f { return 0.0f; }
    f32 guess = value > 1.0f ? value : 1.0f;
    for i32 i = 0; i < 12; i++ { guess = (guess + value / guess) * 0.5f; }
    return guess;
}

f32 cube_sin(f32 angle) {
    const f32 PI = 3.14159265358979323846f;
    const f32 TAU = 6.28318530717958647692f;
    while angle > PI { angle = angle - TAU; }
    while angle < -PI { angle = angle + TAU; }
    if angle > PI * 0.5f { angle = PI - angle; }
    else if angle < -PI * 0.5f { angle = -PI - angle; }
    f32 square = angle * angle;
    f32 term = angle;
    f32 sum = angle;
    for i32 n = 1; n <= 6; n++ {
        term = -term * square / cast(f32, (2 * n) * (2 * n + 1));
        sum = sum + term;
    }
    return sum;
}

f32 cube_cos(f32 angle) {
    const f32 PI = 3.14159265358979323846f;
    const f32 TAU = 6.28318530717958647692f;
    while angle > PI { angle = angle - TAU; }
    while angle < -PI { angle = angle + TAU; }
    if angle > PI * 0.5f { angle = PI - angle; }
    else if angle < -PI * 0.5f { angle = -PI - angle; }
    f32 square = angle * angle;
    f32 term = 1.0f;
    f32 sum = 1.0f;
    for i32 n = 1; n <= 6; n++ {
        term = -term * square / cast(f32, (2 * n - 1) * (2 * n));
        sum = sum + term;
    }
    return sum;
}

float3 cube_sub3(float3 a, float3 b) {
    return float3{a.x - b.x, a.y - b.y, a.z - b.z};
}

float3 cube_scale3(float3 a, f32 scale) {
    return float3{a.x * scale, a.y * scale, a.z * scale};
}

f32 cube_dot3(float3 a, float3 b) {
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

float3 cube_cross3(float3 a, float3 b) {
    return float3{
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
    };
}

float3 cube_normalize3(float3 value) {
    f32 length = cube_sqrt(cube_dot3(value, value));
    return cube_scale3(value, 1.0f / length);
}

float4x4 cube_identity() {
    return float4x4{
        1.0f, 0.0f, 0.0f, 0.0f,
        0.0f, 1.0f, 0.0f, 0.0f,
        0.0f, 0.0f, 1.0f, 0.0f,
        0.0f, 0.0f, 0.0f, 1.0f
    };
}

float4x4 cube_mat4_mul(float4x4 left, float4x4 right) {
    float4x4 result;
    f32* a = cast(f32*, &left);
    f32* b = cast(f32*, &right);
    f32* out = cast(f32*, &result);
    for i32 column = 0; column < 4; column++ {
        for i32 row = 0; row < 4; row++ {
            f32 sum = 0.0f;
            for i32 k = 0; k < 4; k++ {
                sum = sum + a[k * 4 + row] * b[column * 4 + k];
            }
            out[column * 4 + row] = sum;
        }
    }
    return result;
}

float4x4 cube_perspective(f32 aspect) {
    const f32 near_plane = 0.1f;
    const f32 far_plane = 20.0f;
    const f32 cot_half_fov = 1.73205080756887729353f;
    float4x4 result;
    f32* m = cast(f32*, &result);
    for i32 i = 0; i < 16; i++ { m[i] = 0.0f; }
    m[0] = cot_half_fov / aspect;
    m[5] = cot_half_fov;
    m[10] = (far_plane + near_plane) / (near_plane - far_plane);
    m[11] = -1.0f;
    m[14] = (2.0f * far_plane * near_plane) / (near_plane - far_plane);
    return result;
}

float4x4 cube_look_at(float3 eye, float3 target, float3 up) {
    float3 z_axis = cube_normalize3(cube_sub3(eye, target));
    float3 x_axis = cube_normalize3(cube_cross3(up, z_axis));
    float3 y_axis = cube_cross3(z_axis, x_axis);
    float4x4 result;
    f32* m = cast(f32*, &result);
    for i32 i = 0; i < 16; i++ { m[i] = 0.0f; }
    m[0] = x_axis.x; m[1] = y_axis.x; m[2] = z_axis.x;
    m[4] = x_axis.y; m[5] = y_axis.y; m[6] = z_axis.y;
    m[8] = x_axis.z; m[9] = y_axis.z; m[10] = z_axis.z;
    m[12] = -cube_dot3(x_axis, eye);
    m[13] = -cube_dot3(y_axis, eye);
    m[14] = -cube_dot3(z_axis, eye);
    m[15] = 1.0f;
    return result;
}

float4x4 cube_rotate_x(f32 angle) {
    f32 sine = cube_sin(angle);
    f32 cosine = cube_cos(angle);
    float4x4 result = cube_identity();
    f32* m = cast(f32*, &result);
    m[5] = cosine;
    m[6] = sine;
    m[9] = -sine;
    m[10] = cosine;
    return result;
}

float4x4 cube_rotate_y(f32 angle) {
    f32 sine = cube_sin(angle);
    f32 cosine = cube_cos(angle);
    float4x4 result = cube_identity();
    f32* m = cast(f32*, &result);
    m[0] = cosine;
    m[2] = -sine;
    m[8] = sine;
    m[10] = cosine;
    return result;
}

float4x4 cube_mvp(f32 seconds, f32 aspect) {
    float4x4 projection = cube_perspective(aspect);
    float4x4 view = cube_look_at(
        float3{0.0f, 0.0f, 4.0f},
        float3{0.0f, 0.0f, 0.0f},
        float3{0.0f, 1.0f, 0.0f}
    );
    float4x4 rotate_x = cube_rotate_x(seconds * 0.35f);
    float4x4 rotate_y = cube_rotate_y(seconds * 0.70f);
    float4x4 model = cube_mat4_mul(rotate_y, rotate_x);
    return cube_mat4_mul(projection, cube_mat4_mul(view, model));
}
