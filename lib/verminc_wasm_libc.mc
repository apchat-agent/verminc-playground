// Local WebAssembly C-runtime subset required by sokol_all.mc.
// This module is written for verminc and does not copy minc.dev host sources.

extern "libSystem.B.dylib" void* __sokol_malloc(u64 size) from "malloc";
extern "libSystem.B.dylib" void __sokol_free(void* ptr) from "free";
extern "env" i64 __sokol_exit(i64 code) from "__sys_exit";
extern "env" i64 __sokol_write(i64 fd, i64 data, i64 length) from "write";
extern "env" i64 clock();

void __sokol_abort() {
    u8* message = "verminc: assertion failed\n";
    ignore __sokol_write(2, cast(i64, message), 25);
    ignore __sokol_exit(134);
}

void assert(bool condition) {
    if !condition { __sokol_abort(); }
}

void assert(i64 condition) {
    if condition == 0 { __sokol_abort(); }
}

when !defined(VERMINC_IMGUI_EXT_LIBC) {
f64 round(f64 value) {
    if value < 0.0 { return ceil(value - 0.5); }
    return floor(value + 0.5);
}

u64 strlen(u8* text) {
    u64 length = 0;
    while text[length] != 0 { length++; }
    return length;
}

u8* strncpy(u8* destination, u8* source, u64 count) {
    u64 i = 0;
    while i < count && source[i] != 0 {
        destination[i] = source[i];
        i++;
    }
    while i < count {
        destination[i] = 0;
        i++;
    }
    return destination;
}
}

when !defined(VERMINC_IMGUI_EXT_LIBC) {
void* memmove(void* dst, void* src, u64 count) {
    u8* destination = cast(u8*, dst);
    u8* source = cast(u8*, src);
    if cast(u64, dst) < cast(u64, src) {
        for u64 i = 0; i < count; i++ { destination[i] = source[i]; }
    } else if cast(u64, dst) > cast(u64, src) {
        for u64 i = count; i > 0; i-- { destination[i - 1] = source[i - 1]; }
    }
    return dst;
}
}


when !defined(VERMINC_IMGUI_EXT_LIBC) {
u8* strstr(u8* text, u8* needle) {
    if needle[0] == 0 { return text; }
    for u64 start = 0; text[start] != 0; start++ {
        u64 offset = 0;
        while needle[offset] != 0 && text[start + offset] == needle[offset] {
            offset++;
        }
        if needle[offset] == 0 { return &text[start]; }
    }
    return null;
}
}

const f32 FLT_MAX = 3.4028234e+38f;
const f32 FLT_MIN = 1.17549435e-38f;
const f64 DBL_MAX = 1.7976931348623157e+308;
