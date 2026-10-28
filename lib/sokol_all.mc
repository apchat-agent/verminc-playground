// =====================================================================
// Derived from the sokol headers (https://github.com/floooh/sokol):
// sokol_app.h, sokol_gfx.h, sokol_glue.h.
// Copyright (c) 2018 Andre Weissflog, zlib/libpng license
//
// Altered source: transpiled to minc.
// WebGL adaptation: enum-valued struct fields use i32, matching the C ABI.
// =====================================================================
// sokol: web GLES3 build (app + gfx + glue).
when os(wasm) {
    import verminc_wasm_libc;
    import verminc_webgl;
}
when os(wasm) {
enum __enum_SAPP_MAX_TOUCHPOINTS {
    SAPP_MAX_TOUCHPOINTS = 8,
    SAPP_MAX_MOUSEBUTTONS = 3,
    SAPP_MAX_KEYCODES = 512,
    SAPP_MAX_ICONIMAGES = 8,
}

/*
    sapp_event_type

    The type of event that's passed to the event handler callback
    in the sapp_event.type field. These are not just "traditional"
    input events, but also notify the application about state changes
    or other user-invoked actions.
*/
enum sapp_event_type {
    SAPP_EVENTTYPE_INVALID = 0,
    SAPP_EVENTTYPE_KEY_DOWN = 1,
    SAPP_EVENTTYPE_KEY_UP = 2,
    SAPP_EVENTTYPE_CHAR = 3,
    SAPP_EVENTTYPE_MOUSE_DOWN = 4,
    SAPP_EVENTTYPE_MOUSE_UP = 5,
    SAPP_EVENTTYPE_MOUSE_SCROLL = 6,
    SAPP_EVENTTYPE_MOUSE_MOVE = 7,
    SAPP_EVENTTYPE_MOUSE_ENTER = 8,
    SAPP_EVENTTYPE_MOUSE_LEAVE = 9,
    SAPP_EVENTTYPE_TOUCHES_BEGAN = 10,
    SAPP_EVENTTYPE_TOUCHES_MOVED = 11,
    SAPP_EVENTTYPE_TOUCHES_ENDED = 12,
    SAPP_EVENTTYPE_TOUCHES_CANCELLED = 13,
    SAPP_EVENTTYPE_RESIZED = 14,
    SAPP_EVENTTYPE_ICONIFIED = 15,
    SAPP_EVENTTYPE_RESTORED = 16,
    SAPP_EVENTTYPE_FOCUSED = 17,
    SAPP_EVENTTYPE_UNFOCUSED = 18,
    SAPP_EVENTTYPE_SUSPENDED = 19,
    SAPP_EVENTTYPE_RESUMED = 20,
    SAPP_EVENTTYPE_QUIT_REQUESTED = 21,
    SAPP_EVENTTYPE_CLIPBOARD_PASTED = 22,
    SAPP_EVENTTYPE_FILES_DROPPED = 23,
    _SAPP_EVENTTYPE_NUM = 24,
    _SAPP_EVENTTYPE_FORCE_U32 = 2147483647,
}

/*
    sapp_keycode

    The 'virtual keycode' of a KEY_DOWN or KEY_UP event in the
    struct field sapp_event.key_code.

    Note that the keycode values are identical with GLFW.
*/
enum sapp_keycode {
    SAPP_KEYCODE_INVALID = 0,
    SAPP_KEYCODE_SPACE = 32,
    SAPP_KEYCODE_APOSTROPHE = 39,
    SAPP_KEYCODE_COMMA = 44,
    SAPP_KEYCODE_MINUS = 45,
    SAPP_KEYCODE_PERIOD = 46,
    SAPP_KEYCODE_SLASH = 47,
    SAPP_KEYCODE_0 = 48,
    SAPP_KEYCODE_1 = 49,
    SAPP_KEYCODE_2 = 50,
    SAPP_KEYCODE_3 = 51,
    SAPP_KEYCODE_4 = 52,
    SAPP_KEYCODE_5 = 53,
    SAPP_KEYCODE_6 = 54,
    SAPP_KEYCODE_7 = 55,
    SAPP_KEYCODE_8 = 56,
    SAPP_KEYCODE_9 = 57,
    SAPP_KEYCODE_SEMICOLON = 59,
    SAPP_KEYCODE_EQUAL = 61,
    SAPP_KEYCODE_A = 65,
    SAPP_KEYCODE_B = 66,
    SAPP_KEYCODE_C = 67,
    SAPP_KEYCODE_D = 68,
    SAPP_KEYCODE_E = 69,
    SAPP_KEYCODE_F = 70,
    SAPP_KEYCODE_G = 71,
    SAPP_KEYCODE_H = 72,
    SAPP_KEYCODE_I = 73,
    SAPP_KEYCODE_J = 74,
    SAPP_KEYCODE_K = 75,
    SAPP_KEYCODE_L = 76,
    SAPP_KEYCODE_M = 77,
    SAPP_KEYCODE_N = 78,
    SAPP_KEYCODE_O = 79,
    SAPP_KEYCODE_P = 80,
    SAPP_KEYCODE_Q = 81,
    SAPP_KEYCODE_R = 82,
    SAPP_KEYCODE_S = 83,
    SAPP_KEYCODE_T = 84,
    SAPP_KEYCODE_U = 85,
    SAPP_KEYCODE_V = 86,
    SAPP_KEYCODE_W = 87,
    SAPP_KEYCODE_X = 88,
    SAPP_KEYCODE_Y = 89,
    SAPP_KEYCODE_Z = 90,
    SAPP_KEYCODE_LEFT_BRACKET = 91,
    SAPP_KEYCODE_BACKSLASH = 92,
    SAPP_KEYCODE_RIGHT_BRACKET = 93,
    SAPP_KEYCODE_GRAVE_ACCENT = 96,
    SAPP_KEYCODE_WORLD_1 = 161,
    SAPP_KEYCODE_WORLD_2 = 162,
    SAPP_KEYCODE_ESCAPE = 256,
    SAPP_KEYCODE_ENTER = 257,
    SAPP_KEYCODE_TAB = 258,
    SAPP_KEYCODE_BACKSPACE = 259,
    SAPP_KEYCODE_INSERT = 260,
    SAPP_KEYCODE_DELETE = 261,
    SAPP_KEYCODE_RIGHT = 262,
    SAPP_KEYCODE_LEFT = 263,
    SAPP_KEYCODE_DOWN = 264,
    SAPP_KEYCODE_UP = 265,
    SAPP_KEYCODE_PAGE_UP = 266,
    SAPP_KEYCODE_PAGE_DOWN = 267,
    SAPP_KEYCODE_HOME = 268,
    SAPP_KEYCODE_END = 269,
    SAPP_KEYCODE_CAPS_LOCK = 280,
    SAPP_KEYCODE_SCROLL_LOCK = 281,
    SAPP_KEYCODE_NUM_LOCK = 282,
    SAPP_KEYCODE_PRINT_SCREEN = 283,
    SAPP_KEYCODE_PAUSE = 284,
    SAPP_KEYCODE_F1 = 290,
    SAPP_KEYCODE_F2 = 291,
    SAPP_KEYCODE_F3 = 292,
    SAPP_KEYCODE_F4 = 293,
    SAPP_KEYCODE_F5 = 294,
    SAPP_KEYCODE_F6 = 295,
    SAPP_KEYCODE_F7 = 296,
    SAPP_KEYCODE_F8 = 297,
    SAPP_KEYCODE_F9 = 298,
    SAPP_KEYCODE_F10 = 299,
    SAPP_KEYCODE_F11 = 300,
    SAPP_KEYCODE_F12 = 301,
    SAPP_KEYCODE_F13 = 302,
    SAPP_KEYCODE_F14 = 303,
    SAPP_KEYCODE_F15 = 304,
    SAPP_KEYCODE_F16 = 305,
    SAPP_KEYCODE_F17 = 306,
    SAPP_KEYCODE_F18 = 307,
    SAPP_KEYCODE_F19 = 308,
    SAPP_KEYCODE_F20 = 309,
    SAPP_KEYCODE_F21 = 310,
    SAPP_KEYCODE_F22 = 311,
    SAPP_KEYCODE_F23 = 312,
    SAPP_KEYCODE_F24 = 313,
    SAPP_KEYCODE_F25 = 314,
    SAPP_KEYCODE_KP_0 = 320,
    SAPP_KEYCODE_KP_1 = 321,
    SAPP_KEYCODE_KP_2 = 322,
    SAPP_KEYCODE_KP_3 = 323,
    SAPP_KEYCODE_KP_4 = 324,
    SAPP_KEYCODE_KP_5 = 325,
    SAPP_KEYCODE_KP_6 = 326,
    SAPP_KEYCODE_KP_7 = 327,
    SAPP_KEYCODE_KP_8 = 328,
    SAPP_KEYCODE_KP_9 = 329,
    SAPP_KEYCODE_KP_DECIMAL = 330,
    SAPP_KEYCODE_KP_DIVIDE = 331,
    SAPP_KEYCODE_KP_MULTIPLY = 332,
    SAPP_KEYCODE_KP_SUBTRACT = 333,
    SAPP_KEYCODE_KP_ADD = 334,
    SAPP_KEYCODE_KP_ENTER = 335,
    SAPP_KEYCODE_KP_EQUAL = 336,
    SAPP_KEYCODE_LEFT_SHIFT = 340,
    SAPP_KEYCODE_LEFT_CONTROL = 341,
    SAPP_KEYCODE_LEFT_ALT = 342,
    SAPP_KEYCODE_LEFT_SUPER = 343,
    SAPP_KEYCODE_RIGHT_SHIFT = 344,
    SAPP_KEYCODE_RIGHT_CONTROL = 345,
    SAPP_KEYCODE_RIGHT_ALT = 346,
    SAPP_KEYCODE_RIGHT_SUPER = 347,
    SAPP_KEYCODE_MENU = 348,
    _SAPP_KEYCODE_FORCE_U32 = 2147483647,
}

/*
    Android specific 'tool type' enum for touch events. This lets the
    application check what type of input device was used for
    touch events.

    NOTE: the values must remain in sync with the corresponding
    Android SDK type, so don't change those.

    See https://developer.android.com/reference/android/view/MotionEvent#TOOL_TYPE_UNKNOWN
*/
enum sapp_android_tooltype {
    SAPP_ANDROIDTOOLTYPE_UNKNOWN = 0,
    SAPP_ANDROIDTOOLTYPE_FINGER = 1,
    SAPP_ANDROIDTOOLTYPE_STYLUS = 2,
    SAPP_ANDROIDTOOLTYPE_MOUSE = 3,
    _SAPP_ANDROIDTOOLTYPE_FORCE_U32 = 2147483647,
}

/*
    sapp_mousebutton

    The currently pressed mouse button in the events MOUSE_DOWN
    and MOUSE_UP, stored in the struct field sapp_event.mouse_button.
*/
enum sapp_mousebutton {
    SAPP_MOUSEBUTTON_LEFT = 0,
    SAPP_MOUSEBUTTON_RIGHT = 1,
    SAPP_MOUSEBUTTON_MIDDLE = 2,
    SAPP_MOUSEBUTTON_INVALID = 256,
    _SAPP_MOUSEBUTTON_FORCE_U32 = 2147483647,
}

enum __enum_SAPP_MODIFIER_SHIFT {
    SAPP_MODIFIER_SHIFT = 1,
    SAPP_MODIFIER_CTRL = 2,
    SAPP_MODIFIER_ALT = 4,
    SAPP_MODIFIER_SUPER = 8,
    SAPP_MODIFIER_LMB = 256,
    SAPP_MODIFIER_RMB = 512,
    SAPP_MODIFIER_MMB = 1024,
}

/*
    sapp_log_item

    Log items are defined via X-Macros and expanded to an enum
    'sapp_log_item', and in debug mode to corresponding
    human readable error messages.
*/
enum sapp_log_item {
    SAPP_LOGITEM_OK = 0,
    SAPP_LOGITEM_MALLOC_FAILED = 1,
    SAPP_LOGITEM_SWAPCHAIN_DEPTHFORMAT_INVALID = 2,
    SAPP_LOGITEM_MACOS_INVALID_NSOPENGL_PROFILE = 3,
    SAPP_LOGITEM_METAL_CREATE_SWAPCHAIN_DEPTH_TEXTURE_FAILED = 4,
    SAPP_LOGITEM_METAL_CREATE_SWAPCHAIN_MSAA_TEXTURE_FAILED = 5,
    SAPP_LOGITEM_WIN32_LOAD_OPENGL32_DLL_FAILED = 6,
    SAPP_LOGITEM_WIN32_CREATE_HELPER_WINDOW_FAILED = 7,
    SAPP_LOGITEM_WIN32_HELPER_WINDOW_GETDC_FAILED = 8,
    SAPP_LOGITEM_WIN32_DUMMY_CONTEXT_SET_PIXELFORMAT_FAILED = 9,
    SAPP_LOGITEM_WIN32_CREATE_DUMMY_CONTEXT_FAILED = 10,
    SAPP_LOGITEM_WIN32_DUMMY_CONTEXT_MAKE_CURRENT_FAILED = 11,
    SAPP_LOGITEM_WIN32_GET_PIXELFORMAT_ATTRIB_FAILED = 12,
    SAPP_LOGITEM_WIN32_WGL_FIND_PIXELFORMAT_FAILED = 13,
    SAPP_LOGITEM_WIN32_WGL_DESCRIBE_PIXELFORMAT_FAILED = 14,
    SAPP_LOGITEM_WIN32_WGL_SET_PIXELFORMAT_FAILED = 15,
    SAPP_LOGITEM_WIN32_WGL_ARB_CREATE_CONTEXT_REQUIRED = 16,
    SAPP_LOGITEM_WIN32_WGL_ARB_CREATE_CONTEXT_PROFILE_REQUIRED = 17,
    SAPP_LOGITEM_WIN32_WGL_OPENGL_VERSION_NOT_SUPPORTED = 18,
    SAPP_LOGITEM_WIN32_WGL_OPENGL_PROFILE_NOT_SUPPORTED = 19,
    SAPP_LOGITEM_WIN32_WGL_INCOMPATIBLE_DEVICE_CONTEXT = 20,
    SAPP_LOGITEM_WIN32_WGL_CREATE_CONTEXT_ATTRIBS_FAILED_OTHER = 21,
    SAPP_LOGITEM_WIN32_D3D11_CREATE_DEVICE_AND_SWAPCHAIN_WITH_DEBUG_FAILED = 22,
    SAPP_LOGITEM_WIN32_D3D11_GET_IDXGIFACTORY_FAILED = 23,
    SAPP_LOGITEM_WIN32_D3D11_GET_IDXGIADAPTER_FAILED = 24,
    SAPP_LOGITEM_WIN32_D3D11_QUERY_INTERFACE_IDXGIDEVICE1_FAILED = 25,
    SAPP_LOGITEM_WIN32_REGISTER_RAW_INPUT_DEVICES_FAILED_MOUSE_LOCK = 26,
    SAPP_LOGITEM_WIN32_REGISTER_RAW_INPUT_DEVICES_FAILED_MOUSE_UNLOCK = 27,
    SAPP_LOGITEM_WIN32_GET_RAW_INPUT_DATA_FAILED = 28,
    SAPP_LOGITEM_WIN32_DESTROYICON_FOR_CURSOR_FAILED = 29,
    SAPP_LOGITEM_LINUX_GLX_LOAD_LIBGL_FAILED = 30,
    SAPP_LOGITEM_LINUX_GLX_LOAD_ENTRY_POINTS_FAILED = 31,
    SAPP_LOGITEM_LINUX_GLX_EXTENSION_NOT_FOUND = 32,
    SAPP_LOGITEM_LINUX_GLX_QUERY_VERSION_FAILED = 33,
    SAPP_LOGITEM_LINUX_GLX_VERSION_TOO_LOW = 34,
    SAPP_LOGITEM_LINUX_GLX_NO_GLXFBCONFIGS = 35,
    SAPP_LOGITEM_LINUX_GLX_NO_SUITABLE_GLXFBCONFIG = 36,
    SAPP_LOGITEM_LINUX_GLX_GET_VISUAL_FROM_FBCONFIG_FAILED = 37,
    SAPP_LOGITEM_LINUX_GLX_REQUIRED_EXTENSIONS_MISSING = 38,
    SAPP_LOGITEM_LINUX_GLX_CREATE_CONTEXT_FAILED = 39,
    SAPP_LOGITEM_LINUX_GLX_CREATE_WINDOW_FAILED = 40,
    SAPP_LOGITEM_LINUX_X11_CREATE_WINDOW_FAILED = 41,
    SAPP_LOGITEM_LINUX_EGL_BIND_OPENGL_API_FAILED = 42,
    SAPP_LOGITEM_LINUX_EGL_BIND_OPENGL_ES_API_FAILED = 43,
    SAPP_LOGITEM_LINUX_EGL_GET_DISPLAY_FAILED = 44,
    SAPP_LOGITEM_LINUX_EGL_INITIALIZE_FAILED = 45,
    SAPP_LOGITEM_LINUX_EGL_NO_CONFIGS = 46,
    SAPP_LOGITEM_LINUX_EGL_NO_NATIVE_VISUAL = 47,
    SAPP_LOGITEM_LINUX_EGL_GET_VISUAL_INFO_FAILED = 48,
    SAPP_LOGITEM_LINUX_EGL_CREATE_WINDOW_SURFACE_FAILED = 49,
    SAPP_LOGITEM_LINUX_EGL_CREATE_CONTEXT_FAILED = 50,
    SAPP_LOGITEM_LINUX_EGL_MAKE_CURRENT_FAILED = 51,
    SAPP_LOGITEM_LINUX_X11_OPEN_DISPLAY_FAILED = 52,
    SAPP_LOGITEM_LINUX_X11_QUERY_SYSTEM_DPI_FAILED = 53,
    SAPP_LOGITEM_LINUX_X11_DROPPED_FILE_URI_WRONG_SCHEME = 54,
    SAPP_LOGITEM_LINUX_X11_FAILED_TO_BECOME_OWNER_OF_CLIPBOARD = 55,
    SAPP_LOGITEM_ANDROID_UNSUPPORTED_INPUT_EVENT_INPUT_CB = 56,
    SAPP_LOGITEM_ANDROID_UNSUPPORTED_INPUT_EVENT_MAIN_CB = 57,
    SAPP_LOGITEM_ANDROID_READ_MSG_FAILED = 58,
    SAPP_LOGITEM_ANDROID_WRITE_MSG_FAILED = 59,
    SAPP_LOGITEM_ANDROID_MSG_CREATE = 60,
    SAPP_LOGITEM_ANDROID_MSG_RESUME = 61,
    SAPP_LOGITEM_ANDROID_MSG_PAUSE = 62,
    SAPP_LOGITEM_ANDROID_MSG_FOCUS = 63,
    SAPP_LOGITEM_ANDROID_MSG_NO_FOCUS = 64,
    SAPP_LOGITEM_ANDROID_MSG_SET_NATIVE_WINDOW = 65,
    SAPP_LOGITEM_ANDROID_MSG_SET_INPUT_QUEUE = 66,
    SAPP_LOGITEM_ANDROID_MSG_DESTROY = 67,
    SAPP_LOGITEM_ANDROID_UNKNOWN_MSG = 68,
    SAPP_LOGITEM_ANDROID_LOOP_THREAD_STARTED = 69,
    SAPP_LOGITEM_ANDROID_LOOP_THREAD_DONE = 70,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONSTART = 71,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONRESUME = 72,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONSAVEINSTANCESTATE = 73,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONWINDOWFOCUSCHANGED = 74,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONPAUSE = 75,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONSTOP = 76,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONNATIVEWINDOWCREATED = 77,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONNATIVEWINDOWDESTROYED = 78,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONINPUTQUEUECREATED = 79,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONINPUTQUEUEDESTROYED = 80,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONCONFIGURATIONCHANGED = 81,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONLOWMEMORY = 82,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONDESTROY = 83,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_DONE = 84,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_ONCREATE = 85,
    SAPP_LOGITEM_ANDROID_CREATE_THREAD_PIPE_FAILED = 86,
    SAPP_LOGITEM_ANDROID_NATIVE_ACTIVITY_CREATE_SUCCESS = 87,
    SAPP_LOGITEM_ANDROID_CHOREOGRAPHER_ENABLED = 88,
    SAPP_LOGITEM_ANDROID_CHOREOGRAPHER_UNAVAILABLE = 89,
    SAPP_LOGITEM_WGPU_DEVICE_LOST = 90,
    SAPP_LOGITEM_WGPU_DEVICE_LOG = 91,
    SAPP_LOGITEM_WGPU_DEVICE_UNCAPTURED_ERROR = 92,
    SAPP_LOGITEM_WGPU_SWAPCHAIN_CREATE_SURFACE_FAILED = 93,
    SAPP_LOGITEM_WGPU_SWAPCHAIN_SURFACE_GET_CAPABILITIES_FAILED = 94,
    SAPP_LOGITEM_WGPU_SWAPCHAIN_CREATE_DEPTH_STENCIL_TEXTURE_FAILED = 95,
    SAPP_LOGITEM_WGPU_SWAPCHAIN_CREATE_DEPTH_STENCIL_VIEW_FAILED = 96,
    SAPP_LOGITEM_WGPU_SWAPCHAIN_CREATE_MSAA_TEXTURE_FAILED = 97,
    SAPP_LOGITEM_WGPU_SWAPCHAIN_CREATE_MSAA_VIEW_FAILED = 98,
    SAPP_LOGITEM_WGPU_SWAPCHAIN_GETCURRENTTEXTURE_FAILED = 99,
    SAPP_LOGITEM_WGPU_REQUEST_DEVICE_STATUS_ERROR = 100,
    SAPP_LOGITEM_WGPU_REQUEST_DEVICE_STATUS_UNKNOWN = 101,
    SAPP_LOGITEM_WGPU_REQUEST_ADAPTER_STATUS_UNAVAILABLE = 102,
    SAPP_LOGITEM_WGPU_REQUEST_ADAPTER_STATUS_ERROR = 103,
    SAPP_LOGITEM_WGPU_REQUEST_ADAPTER_STATUS_UNKNOWN = 104,
    SAPP_LOGITEM_WGPU_CREATE_INSTANCE_FAILED = 105,
    SAPP_LOGITEM_VULKAN_DEBUG_GENERAL = 106,
    SAPP_LOGITEM_VULKAN_DEBUG_VALIDATION = 107,
    SAPP_LOGITEM_VULKAN_DEBUG_PERFORMANCE = 108,
    SAPP_LOGITEM_VULKAN_REQUIRED_INSTANCE_EXTENSION_FUNCTION_MISSING = 109,
    SAPP_LOGITEM_VULKAN_ALLOC_DEVICE_MEMORY_NO_SUITABLE_MEMORY_TYPE = 110,
    SAPP_LOGITEM_VULKAN_ALLOCATE_MEMORY_FAILED = 111,
    SAPP_LOGITEM_VULKAN_CREATE_INSTANCE_FAILED = 112,
    SAPP_LOGITEM_VULKAN_ENUMERATE_PHYSICAL_DEVICES_FAILED = 113,
    SAPP_LOGITEM_VULKAN_NO_PHYSICAL_DEVICES_FOUND = 114,
    SAPP_LOGITEM_VULKAN_NO_SUITABLE_PHYSICAL_DEVICE_FOUND = 115,
    SAPP_LOGITEM_VULKAN_CREATE_DEVICE_FAILED_EXTENSION_NOT_PRESENT = 116,
    SAPP_LOGITEM_VULKAN_CREATE_DEVICE_FAILED_FEATURE_NOT_PRESENT = 117,
    SAPP_LOGITEM_VULKAN_CREATE_DEVICE_FAILED_INITIALIZATION_FAILED = 118,
    SAPP_LOGITEM_VULKAN_CREATE_DEVICE_FAILED_OTHER = 119,
    SAPP_LOGITEM_VULKAN_CREATE_SURFACE_FAILED = 120,
    SAPP_LOGITEM_VULKAN_CREATE_SWAPCHAIN_FAILED = 121,
    SAPP_LOGITEM_VULKAN_SWAPCHAIN_CREATE_IMAGE_VIEW_FAILED = 122,
    SAPP_LOGITEM_VULKAN_SWAPCHAIN_CREATE_IMAGE_FAILED = 123,
    SAPP_LOGITEM_VULKAN_SWAPCHAIN_ALLOC_IMAGE_DEVICE_MEMORY_FAILED = 124,
    SAPP_LOGITEM_VULKAN_SWAPCHAIN_BIND_IMAGE_MEMORY_FAILED = 125,
    SAPP_LOGITEM_VULKAN_ACQUIRE_NEXT_IMAGE_FAILED = 126,
    SAPP_LOGITEM_VULKAN_QUEUE_PRESENT_FAILED = 127,
    SAPP_LOGITEM_IMAGE_DATA_SIZE_MISMATCH = 128,
    SAPP_LOGITEM_DROPPED_FILE_PATH_TOO_LONG = 129,
    SAPP_LOGITEM_CLIPBOARD_STRING_TOO_BIG = 130,
    _SAPP_LOGITEM_FORCE_U32 = 2147483647,
}

/*
    sapp_pixel_format

    Defines the pixel format for swapchain surfaces.

    NOTE: DO NOT directly cast this enum to sokol_gfx.h's sg_pixel_format,
    the enum values are totally different!
*/
enum sapp_pixel_format {
    _SAPP_PIXELFORMAT_DEFAULT = 0,
    SAPP_PIXELFORMAT_NONE = 1,
    SAPP_PIXELFORMAT_RGBA8 = 2,
    SAPP_PIXELFORMAT_SRGB8A8 = 3,
    SAPP_PIXELFORMAT_BGRA8 = 4,
    SAPP_PIXELFORMAT_SBGR8A8 = 5,
    SAPP_PIXELFORMAT_RGBA16F = 6,
    SAPP_PIXELFORMAT_DEPTH = 7,
    SAPP_PIXELFORMAT_DEPTH_STENCIL = 8,
    _SAPP_PIXELFORMAT_FORCE_U32 = 2147483647,
}

/*
    sapp_composite_mode

    Preferred composition mode for the framebuffer surface with background.
    This is a highly optional feature and may only be fully implemented
    on the web APIs (WebGL2 and WebGPU)
*/
enum sapp_composite_mode {
    _SAPP_COMPOSITEMODE_DEFAULT = 0,
    SAPP_COMPOSITEMODE_OPAQUE = 1,
    SAPP_COMPOSITEMODE_PREMULTIPLIED = 2,
    _SAPP_COMPOSITEMODE_FORCE_U32 = 2147483647,
}

/* HTML5 specific: request and response structs for
   asynchronously loading dropped-file content.
*/
enum sapp_html5_fetch_error {
    SAPP_HTML5_FETCH_ERROR_NO_ERROR = 0,
    SAPP_HTML5_FETCH_ERROR_BUFFER_TOO_SMALL = 1,
    SAPP_HTML5_FETCH_ERROR_OTHER = 2,
    _SAPP_HTML5_FORCE_U32 = 2147483647,
}

/*
    sapp_mouse_cursor

    Predefined cursor image definitions, set with sapp_set_mouse_cursor(sapp_mouse_cursor cursor)
*/
enum sapp_mouse_cursor {
    SAPP_MOUSECURSOR_DEFAULT = 0,
    SAPP_MOUSECURSOR_ARROW = 1,
    SAPP_MOUSECURSOR_IBEAM = 2,
    SAPP_MOUSECURSOR_CROSSHAIR = 3,
    SAPP_MOUSECURSOR_POINTING_HAND = 4,
    SAPP_MOUSECURSOR_RESIZE_EW = 5,
    SAPP_MOUSECURSOR_RESIZE_NS = 6,
    SAPP_MOUSECURSOR_RESIZE_NWSE = 7,
    SAPP_MOUSECURSOR_RESIZE_NESW = 8,
    SAPP_MOUSECURSOR_RESIZE_ALL = 9,
    SAPP_MOUSECURSOR_NOT_ALLOWED = 10,
    SAPP_MOUSECURSOR_CUSTOM_0 = 11,
    SAPP_MOUSECURSOR_CUSTOM_1 = 12,
    SAPP_MOUSECURSOR_CUSTOM_2 = 13,
    SAPP_MOUSECURSOR_CUSTOM_3 = 14,
    SAPP_MOUSECURSOR_CUSTOM_4 = 15,
    SAPP_MOUSECURSOR_CUSTOM_5 = 16,
    SAPP_MOUSECURSOR_CUSTOM_6 = 17,
    SAPP_MOUSECURSOR_CUSTOM_7 = 18,
    SAPP_MOUSECURSOR_CUSTOM_8 = 19,
    SAPP_MOUSECURSOR_CUSTOM_9 = 20,
    SAPP_MOUSECURSOR_CUSTOM_10 = 21,
    SAPP_MOUSECURSOR_CUSTOM_11 = 22,
    SAPP_MOUSECURSOR_CUSTOM_12 = 23,
    SAPP_MOUSECURSOR_CUSTOM_13 = 24,
    SAPP_MOUSECURSOR_CUSTOM_14 = 25,
    SAPP_MOUSECURSOR_CUSTOM_15 = 26,
    _SAPP_MOUSECURSOR_NUM = 27,
    _SAPP_MOUSECURSOR_FORCE_U32 = 2147483647,
}

enum __enum_SG_INVALID_ID {
    SG_INVALID_ID = 0,
    SG_NUM_INFLIGHT_FRAMES = 2,
    SG_MAX_COLOR_ATTACHMENTS = 8,
    SG_MAX_UNIFORMBLOCK_MEMBERS = 16,
    SG_MAX_VERTEX_ATTRIBUTES = 16,
    SG_MAX_MIPMAPS = 16,
    SG_MAX_VERTEXBUFFER_BINDSLOTS = 8,
    SG_MAX_UNIFORMBLOCK_BINDSLOTS = 8,
    SG_MAX_VIEW_BINDSLOTS = 32,
    SG_MAX_SAMPLER_BINDSLOTS = 12,
    SG_MAX_TEXTURE_SAMPLER_PAIRS = 32,
    SG_MAX_PORTABLE_COLOR_ATTACHMENTS = 4,
    SG_MAX_PORTABLE_TEXTURE_BINDINGS_PER_STAGE = 16,
    SG_MAX_PORTABLE_STORAGEBUFFER_BINDINGS_PER_STAGE = 8,
    SG_MAX_PORTABLE_STORAGEIMAGE_BINDINGS_PER_STAGE = 4,
}

/*
    sg_backend

    The active 3D-API backend, use the function sg_query_backend()
    to get the currently active backend.
*/
enum sg_backend {
    SG_BACKEND_GLCORE = 0,
    SG_BACKEND_GLES3 = 1,
    SG_BACKEND_D3D11 = 2,
    SG_BACKEND_METAL_IOS = 3,
    SG_BACKEND_METAL_MACOS = 4,
    SG_BACKEND_METAL_SIMULATOR = 5,
    SG_BACKEND_WGPU = 6,
    SG_BACKEND_VULKAN = 7,
    SG_BACKEND_DUMMY = 8,
}

/*
    sg_pixel_format

    sokol_gfx.h basically uses the same pixel formats as WebGPU, since these
    are supported on most newer GPUs.

    A pixelformat name consist of three parts:

        - components (R, RG, RGB or RGBA)
        - bit width per component (8, 16 or 32)
        - component data type:
            - unsigned normalized (no postfix)
            - signed normalized (SN postfix)
            - unsigned integer (UI postfix)
            - signed integer (SI postfix)
            - float (F postfix)

    Not all pixel formats can be used for everything, call sg_query_pixelformat()
    to inspect the capabilities of a given pixelformat. The function returns
    an sg_pixelformat_info struct with the following members:

        - sample: the pixelformat can be sampled as texture at least with
                  nearest filtering
        - filter: the pixelformat can be sampled as texture with linear
                  filtering
        - render: the pixelformat can be used as render-pass attachment
        - blend:  blending is supported when used as render-pass attachment
        - msaa:   multisample-antialiasing is supported when used
                  as render-pass attachment
        - depth:  the pixelformat can be used for depth-stencil attachments
        - compressed: this is a block-compressed format
        - bytes_per_pixel: the numbers of bytes in a pixel (0 for compressed formats)

    The default pixel format for texture images is SG_PIXELFORMAT_RGBA8.

    The default pixel format for pass attachment images is platform-dependent
    and taken from the sg_environment struct passed into sg_setup(). Typically
    the default formats are:

        - for the Metal, D3D11 and WebGPU backends: SG_PIXELFORMAT_BGRA8
        - for GL backends: SG_PIXELFORMAT_RGBA8
*/
enum sg_pixel_format {
    _SG_PIXELFORMAT_DEFAULT = 0,
    SG_PIXELFORMAT_NONE = 1,
    SG_PIXELFORMAT_R8 = 2,
    SG_PIXELFORMAT_R8SN = 3,
    SG_PIXELFORMAT_R8UI = 4,
    SG_PIXELFORMAT_R8SI = 5,
    SG_PIXELFORMAT_R16 = 6,
    SG_PIXELFORMAT_R16SN = 7,
    SG_PIXELFORMAT_R16UI = 8,
    SG_PIXELFORMAT_R16SI = 9,
    SG_PIXELFORMAT_R16F = 10,
    SG_PIXELFORMAT_RG8 = 11,
    SG_PIXELFORMAT_RG8SN = 12,
    SG_PIXELFORMAT_RG8UI = 13,
    SG_PIXELFORMAT_RG8SI = 14,
    SG_PIXELFORMAT_R32UI = 15,
    SG_PIXELFORMAT_R32SI = 16,
    SG_PIXELFORMAT_R32F = 17,
    SG_PIXELFORMAT_RG16 = 18,
    SG_PIXELFORMAT_RG16SN = 19,
    SG_PIXELFORMAT_RG16UI = 20,
    SG_PIXELFORMAT_RG16SI = 21,
    SG_PIXELFORMAT_RG16F = 22,
    SG_PIXELFORMAT_RGBA8 = 23,
    SG_PIXELFORMAT_SRGB8A8 = 24,
    SG_PIXELFORMAT_RGBA8SN = 25,
    SG_PIXELFORMAT_RGBA8UI = 26,
    SG_PIXELFORMAT_RGBA8SI = 27,
    SG_PIXELFORMAT_BGRA8 = 28,
    SG_PIXELFORMAT_SBGR8A8 = 29,
    SG_PIXELFORMAT_RGB10A2 = 30,
    SG_PIXELFORMAT_RG11B10F = 31,
    SG_PIXELFORMAT_RGB9E5 = 32,
    SG_PIXELFORMAT_RG32UI = 33,
    SG_PIXELFORMAT_RG32SI = 34,
    SG_PIXELFORMAT_RG32F = 35,
    SG_PIXELFORMAT_RGBA16 = 36,
    SG_PIXELFORMAT_RGBA16SN = 37,
    SG_PIXELFORMAT_RGBA16UI = 38,
    SG_PIXELFORMAT_RGBA16SI = 39,
    SG_PIXELFORMAT_RGBA16F = 40,
    SG_PIXELFORMAT_RGBA32UI = 41,
    SG_PIXELFORMAT_RGBA32SI = 42,
    SG_PIXELFORMAT_RGBA32F = 43,
    SG_PIXELFORMAT_DEPTH = 44,
    SG_PIXELFORMAT_DEPTH_STENCIL = 45,
    SG_PIXELFORMAT_BC1_RGBA = 46,
    SG_PIXELFORMAT_BC2_RGBA = 47,
    SG_PIXELFORMAT_BC3_RGBA = 48,
    SG_PIXELFORMAT_BC3_SRGBA = 49,
    SG_PIXELFORMAT_BC4_R = 50,
    SG_PIXELFORMAT_BC4_RSN = 51,
    SG_PIXELFORMAT_BC5_RG = 52,
    SG_PIXELFORMAT_BC5_RGSN = 53,
    SG_PIXELFORMAT_BC6H_RGBF = 54,
    SG_PIXELFORMAT_BC6H_RGBUF = 55,
    SG_PIXELFORMAT_BC7_RGBA = 56,
    SG_PIXELFORMAT_BC7_SRGBA = 57,
    SG_PIXELFORMAT_ETC2_RGB8 = 58,
    SG_PIXELFORMAT_ETC2_SRGB8 = 59,
    SG_PIXELFORMAT_ETC2_RGB8A1 = 60,
    SG_PIXELFORMAT_ETC2_RGBA8 = 61,
    SG_PIXELFORMAT_ETC2_SRGB8A8 = 62,
    SG_PIXELFORMAT_EAC_R11 = 63,
    SG_PIXELFORMAT_EAC_R11SN = 64,
    SG_PIXELFORMAT_EAC_RG11 = 65,
    SG_PIXELFORMAT_EAC_RG11SN = 66,
    SG_PIXELFORMAT_ASTC_4x4_RGBA = 67,
    SG_PIXELFORMAT_ASTC_4x4_SRGBA = 68,
    _SG_PIXELFORMAT_NUM = 69,
    _SG_PIXELFORMAT_FORCE_U32 = 2147483647,
}

/*
    sg_resource_state

    The current state of a resource in its resource pool.
    Resources start in the INITIAL state, which means the
    pool slot is unoccupied and can be allocated. When a resource is
    created, first an id is allocated, and the resource pool slot
    is set to state ALLOC. After allocation, the resource is
    initialized, which may result in the VALID, UNSEALED or FAILED state.
    UNSEALED is a special state for immutable buffers and images which
    allows to write data into the resource after the creation call.
    The reason why allocation and initialization are separate is because
    some resource types (e.g. buffers and images) might be asynchronously
    initialized by the user application. If a resource which is not
    in the VALID state is attempted to be used for rendering, rendering
    operations will silently be dropped.

    The special INVALID state is returned in sg_query_xxx_state() if no
    resource object exists for the provided resource id.
*/
enum sg_resource_state {
    SG_RESOURCESTATE_INITIAL = 0,
    SG_RESOURCESTATE_ALLOC = 1,
    SG_RESOURCESTATE_UNSEALED = 2,
    SG_RESOURCESTATE_VALID = 3,
    SG_RESOURCESTATE_FAILED = 4,
    SG_RESOURCESTATE_INVALID = 5,
    _SG_RESOURCESTATE_FORCE_U32 = 2147483647,
}

/*
    sg_index_type

    Indicates whether indexed rendering (fetching vertex-indices from an
    index buffer) is used, and if yes, the index data type (16- or 32-bits).

    This is used in the sg_pipeline_desc.index_type member when creating a
    pipeline object.

    The default index type is SG_INDEXTYPE_NONE.
*/
enum sg_index_type {
    _SG_INDEXTYPE_DEFAULT = 0,
    SG_INDEXTYPE_NONE = 1,
    SG_INDEXTYPE_UINT16 = 2,
    SG_INDEXTYPE_UINT32 = 3,
    _SG_INDEXTYPE_NUM = 4,
    _SG_INDEXTYPE_FORCE_U32 = 2147483647,
}

/*
    sg_image_type

    Indicates the basic type of an image object (2D-texture, cubemap,
    3D-texture or 2D-array-texture). Used in the sg_image_desc.type member when
    creating an image, and in sg_shader_image_desc to describe a sampled texture
    in the shader (both must match and will be checked in the validation layer
    when calling sg_apply_bindings).

    The default image type when creating an image is SG_IMAGETYPE_2D.
*/
enum sg_image_type {
    _SG_IMAGETYPE_DEFAULT = 0,
    SG_IMAGETYPE_2D = 1,
    SG_IMAGETYPE_CUBE = 2,
    SG_IMAGETYPE_3D = 3,
    SG_IMAGETYPE_ARRAY = 4,
    _SG_IMAGETYPE_NUM = 5,
    _SG_IMAGETYPE_FORCE_U32 = 2147483647,
}

/*
    sg_image_sample_type

    The basic data type of a texture sample as expected by a shader.
    Must be provided in sg_shader_image and used by the validation
    layer in sg_apply_bindings() to check if the provided image object
    is compatible with what the shader expects. Apart from the sokol-gfx
    validation layer, WebGPU is the only backend API which actually requires
    matching texture and sampler type to be provided upfront for validation
    (other 3D APIs treat texture/sampler type mismatches as undefined behaviour).

    NOTE that the following texture pixel formats require the use
    of SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT, combined with a sampler
    of type SG_SAMPLERTYPE_NONFILTERING:

    - SG_PIXELFORMAT_R32F
    - SG_PIXELFORMAT_RG32F
    - SG_PIXELFORMAT_RGBA32F

    (when using sokol-shdc, also check out the meta tags `@image_sample_type`
    and `@sampler_type`)
*/
enum sg_image_sample_type {
    _SG_IMAGESAMPLETYPE_DEFAULT = 0,
    SG_IMAGESAMPLETYPE_FLOAT = 1,
    SG_IMAGESAMPLETYPE_DEPTH = 2,
    SG_IMAGESAMPLETYPE_SINT = 3,
    SG_IMAGESAMPLETYPE_UINT = 4,
    SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT = 5,
    _SG_IMAGESAMPLETYPE_NUM = 6,
    _SG_IMAGESAMPLETYPE_FORCE_U32 = 2147483647,
}

/*
    sg_sampler_type

    The basic type of a texture sampler (sampling vs comparison) as
    defined in a shader. Must be provided in sg_shader_sampler_desc.

    sg_image_sample_type and sg_sampler_type for a texture/sampler
    pair must be compatible with each other, specifically only
    the following pairs are allowed:

    - SG_IMAGESAMPLETYPE_FLOAT => (SG_SAMPLERTYPE_FILTERING or SG_SAMPLERTYPE_NONFILTERING)
    - SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT => SG_SAMPLERTYPE_NONFILTERING
    - SG_IMAGESAMPLETYPE_SINT => SG_SAMPLERTYPE_NONFILTERING
    - SG_IMAGESAMPLETYPE_UINT => SG_SAMPLERTYPE_NONFILTERING
    - SG_IMAGESAMPLETYPE_DEPTH => SG_SAMPLERTYPE_COMPARISON
*/
enum sg_sampler_type {
    _SG_SAMPLERTYPE_DEFAULT = 0,
    SG_SAMPLERTYPE_FILTERING = 1,
    SG_SAMPLERTYPE_NONFILTERING = 2,
    SG_SAMPLERTYPE_COMPARISON = 3,
    _SG_SAMPLERTYPE_NUM = 4,
    _SG_SAMPLERTYPE_FORCE_U32 = 5,
}

/*
    sg_primitive_type

    This is the common subset of 3D primitive types supported across all 3D
    APIs. This is used in the sg_pipeline_desc.primitive_type member when
    creating a pipeline object.

    The default primitive type is SG_PRIMITIVETYPE_TRIANGLES.
*/
enum sg_primitive_type {
    _SG_PRIMITIVETYPE_DEFAULT = 0,
    SG_PRIMITIVETYPE_POINTS = 1,
    SG_PRIMITIVETYPE_LINES = 2,
    SG_PRIMITIVETYPE_LINE_STRIP = 3,
    SG_PRIMITIVETYPE_TRIANGLES = 4,
    SG_PRIMITIVETYPE_TRIANGLE_STRIP = 5,
    _SG_PRIMITIVETYPE_NUM = 6,
    _SG_PRIMITIVETYPE_FORCE_U32 = 2147483647,
}

/*
    sg_filter

    The filtering mode when sampling a texture image. This is
    used in the sg_sampler_desc.min_filter, sg_sampler_desc.mag_filter
    and sg_sampler_desc.mipmap_filter members when creating a sampler object.

    For the default is SG_FILTER_NEAREST.
*/
enum sg_filter {
    _SG_FILTER_DEFAULT = 0,
    SG_FILTER_NEAREST = 1,
    SG_FILTER_LINEAR = 2,
    _SG_FILTER_NUM = 3,
    _SG_FILTER_FORCE_U32 = 2147483647,
}

/*
    sg_wrap

    The texture coordinates wrapping mode when sampling a texture
    image. This is used in the sg_image_desc.wrap_u, .wrap_v
    and .wrap_w members when creating an image.

    The default wrap mode is SG_WRAP_REPEAT.

    NOTE: SG_WRAP_CLAMP_TO_BORDER is not supported on all backends
    and platforms. To check for support, call sg_query_features()
    and check the "clamp_to_border" boolean in the returned
    sg_features struct.

    Platforms which don't support SG_WRAP_CLAMP_TO_BORDER will silently fall back
    to SG_WRAP_CLAMP_TO_EDGE without a validation error.
*/
enum sg_wrap {
    _SG_WRAP_DEFAULT = 0,
    SG_WRAP_REPEAT = 1,
    SG_WRAP_CLAMP_TO_EDGE = 2,
    SG_WRAP_CLAMP_TO_BORDER = 3,
    SG_WRAP_MIRRORED_REPEAT = 4,
    _SG_WRAP_NUM = 5,
    _SG_WRAP_FORCE_U32 = 2147483647,
}

/*
    sg_border_color

    The border color to use when sampling a texture, and the UV wrap
    mode is SG_WRAP_CLAMP_TO_BORDER.

    The default border color is SG_BORDERCOLOR_OPAQUE_BLACK
*/
enum sg_border_color {
    _SG_BORDERCOLOR_DEFAULT = 0,
    SG_BORDERCOLOR_TRANSPARENT_BLACK = 1,
    SG_BORDERCOLOR_OPAQUE_BLACK = 2,
    SG_BORDERCOLOR_OPAQUE_WHITE = 3,
    _SG_BORDERCOLOR_NUM = 4,
    _SG_BORDERCOLOR_FORCE_U32 = 2147483647,
}

/*
    sg_vertex_format

    The data type of a vertex component. This is used to describe
    the layout of input vertex data when creating a pipeline object.

    NOTE that specific mapping rules exist from the CPU-side vertex
    formats to the vertex attribute base type in the vertex shader code
    (see doc header section 'ON VERTEX FORMATS').
*/
enum sg_vertex_format {
    SG_VERTEXFORMAT_INVALID = 0,
    SG_VERTEXFORMAT_FLOAT = 1,
    SG_VERTEXFORMAT_FLOAT2 = 2,
    SG_VERTEXFORMAT_FLOAT3 = 3,
    SG_VERTEXFORMAT_FLOAT4 = 4,
    SG_VERTEXFORMAT_INT = 5,
    SG_VERTEXFORMAT_INT2 = 6,
    SG_VERTEXFORMAT_INT3 = 7,
    SG_VERTEXFORMAT_INT4 = 8,
    SG_VERTEXFORMAT_UINT = 9,
    SG_VERTEXFORMAT_UINT2 = 10,
    SG_VERTEXFORMAT_UINT3 = 11,
    SG_VERTEXFORMAT_UINT4 = 12,
    SG_VERTEXFORMAT_BYTE4 = 13,
    SG_VERTEXFORMAT_BYTE4N = 14,
    SG_VERTEXFORMAT_UBYTE4 = 15,
    SG_VERTEXFORMAT_UBYTE4N = 16,
    SG_VERTEXFORMAT_SHORT2 = 17,
    SG_VERTEXFORMAT_SHORT2N = 18,
    SG_VERTEXFORMAT_USHORT2 = 19,
    SG_VERTEXFORMAT_USHORT2N = 20,
    SG_VERTEXFORMAT_SHORT4 = 21,
    SG_VERTEXFORMAT_SHORT4N = 22,
    SG_VERTEXFORMAT_USHORT4 = 23,
    SG_VERTEXFORMAT_USHORT4N = 24,
    SG_VERTEXFORMAT_INT10_N2 = 25,
    SG_VERTEXFORMAT_UINT10_N2 = 26,
    SG_VERTEXFORMAT_HALF2 = 27,
    SG_VERTEXFORMAT_HALF4 = 28,
    _SG_VERTEXFORMAT_NUM = 29,
    _SG_VERTEXFORMAT_FORCE_U32 = 2147483647,
}

/*
    sg_vertex_step

    Defines whether the input pointer of a vertex input stream is advanced
    'per vertex' or 'per instance'. The default step-func is
    SG_VERTEXSTEP_PER_VERTEX. SG_VERTEXSTEP_PER_INSTANCE is used with
    instanced-rendering.

    The vertex-step is part of the vertex-layout definition
    when creating pipeline objects.
*/
enum sg_vertex_step {
    _SG_VERTEXSTEP_DEFAULT = 0,
    SG_VERTEXSTEP_PER_VERTEX = 1,
    SG_VERTEXSTEP_PER_INSTANCE = 2,
    _SG_VERTEXSTEP_NUM = 3,
    _SG_VERTEXSTEP_FORCE_U32 = 2147483647,
}

/*
    sg_uniform_type

    The data type of a uniform block member. This is used to
    describe the internal layout of uniform blocks when creating
    a shader object. This is only required for the GL backend, all
    other backends will ignore the interior layout of uniform blocks.
*/
enum sg_uniform_type {
    SG_UNIFORMTYPE_INVALID = 0,
    SG_UNIFORMTYPE_FLOAT = 1,
    SG_UNIFORMTYPE_FLOAT2 = 2,
    SG_UNIFORMTYPE_FLOAT3 = 3,
    SG_UNIFORMTYPE_FLOAT4 = 4,
    SG_UNIFORMTYPE_INT = 5,
    SG_UNIFORMTYPE_INT2 = 6,
    SG_UNIFORMTYPE_INT3 = 7,
    SG_UNIFORMTYPE_INT4 = 8,
    SG_UNIFORMTYPE_MAT4 = 9,
    _SG_UNIFORMTYPE_NUM = 10,
    _SG_UNIFORMTYPE_FORCE_U32 = 2147483647,
}

/*
    sg_uniform_layout

    A hint for the interior memory layout of uniform blocks. This is
    only relevant for the GL backend where the internal layout
    of uniform blocks must be known to sokol-gfx. For all other backends the
    internal memory layout of uniform blocks doesn't matter, sokol-gfx
    will just pass uniform data as an opaque memory blob to the
    3D backend.

    SG_UNIFORMLAYOUT_NATIVE (default)
        Native layout means that a 'backend-native' memory layout
        is used. For the GL backend this means that uniforms
        are packed tightly in memory (e.g. there are no padding
        bytes).

    SG_UNIFORMLAYOUT_STD140
        The memory layout is a subset of std140. Arrays are only
        allowed for the FLOAT4, INT4 and MAT4. Alignment is as
        is as follows:

            FLOAT, INT:         4 byte alignment
            FLOAT2, INT2:       8 byte alignment
            FLOAT3, INT3:       16 byte alignment(!)
            FLOAT4, INT4:       16 byte alignment
            MAT4:               16 byte alignment
            FLOAT4[], INT4[]:   16 byte alignment

        The overall size of the uniform block must be a multiple
        of 16.

    For more information search for 'UNIFORM DATA LAYOUT' in the documentation block
    at the start of the header.
*/
enum sg_uniform_layout {
    _SG_UNIFORMLAYOUT_DEFAULT = 0,
    SG_UNIFORMLAYOUT_NATIVE = 1,
    SG_UNIFORMLAYOUT_STD140 = 2,
    _SG_UNIFORMLAYOUT_NUM = 3,
    _SG_UNIFORMLAYOUT_FORCE_U32 = 2147483647,
}

/*
    sg_cull_mode

    The face-culling mode, this is used in the
    sg_pipeline_desc.cull_mode member when creating a
    pipeline object.

    The default cull mode is SG_CULLMODE_NONE
*/
enum sg_cull_mode {
    _SG_CULLMODE_DEFAULT = 0,
    SG_CULLMODE_NONE = 1,
    SG_CULLMODE_FRONT = 2,
    SG_CULLMODE_BACK = 3,
    _SG_CULLMODE_NUM = 4,
    _SG_CULLMODE_FORCE_U32 = 2147483647,
}

/*
    sg_face_winding

    The vertex-winding rule that determines a front-facing primitive. This
    is used in the member sg_pipeline_desc.face_winding
    when creating a pipeline object.

    The default winding is SG_FACEWINDING_CW (clockwise)
*/
enum sg_face_winding {
    _SG_FACEWINDING_DEFAULT = 0,
    SG_FACEWINDING_CCW = 1,
    SG_FACEWINDING_CW = 2,
    _SG_FACEWINDING_NUM = 3,
    _SG_FACEWINDING_FORCE_U32 = 2147483647,
}

/*
    sg_compare_func

    The compare-function for configuring depth- and stencil-ref tests
    in pipeline objects, and for texture samplers which perform a comparison
    instead of regular sampling operation.

    Used in the following structs:

    sg_pipeline_desc
        .depth
            .compare
        .stencil
            .front.compare
            .back.compare

    sg_sampler_desc
        .compare

    The default compare func for depth- and stencil-tests is
    SG_COMPAREFUNC_ALWAYS.

    The default compare func for samplers is SG_COMPAREFUNC_NEVER.
*/
enum sg_compare_func {
    _SG_COMPAREFUNC_DEFAULT = 0,
    SG_COMPAREFUNC_NEVER = 1,
    SG_COMPAREFUNC_LESS = 2,
    SG_COMPAREFUNC_EQUAL = 3,
    SG_COMPAREFUNC_LESS_EQUAL = 4,
    SG_COMPAREFUNC_GREATER = 5,
    SG_COMPAREFUNC_NOT_EQUAL = 6,
    SG_COMPAREFUNC_GREATER_EQUAL = 7,
    SG_COMPAREFUNC_ALWAYS = 8,
    _SG_COMPAREFUNC_NUM = 9,
    _SG_COMPAREFUNC_FORCE_U32 = 2147483647,
}

/*
    sg_stencil_op

    The operation performed on a currently stored stencil-value when a
    comparison test passes or fails. This is used when creating a pipeline
    object in the following sg_pipeline_desc struct items:

    sg_pipeline_desc
        .stencil
            .front
                .fail_op
                .depth_fail_op
                .pass_op
            .back
                .fail_op
                .depth_fail_op
                .pass_op

    The default value is SG_STENCILOP_KEEP.
*/
enum sg_stencil_op {
    _SG_STENCILOP_DEFAULT = 0,
    SG_STENCILOP_KEEP = 1,
    SG_STENCILOP_ZERO = 2,
    SG_STENCILOP_REPLACE = 3,
    SG_STENCILOP_INCR_CLAMP = 4,
    SG_STENCILOP_DECR_CLAMP = 5,
    SG_STENCILOP_INVERT = 6,
    SG_STENCILOP_INCR_WRAP = 7,
    SG_STENCILOP_DECR_WRAP = 8,
    _SG_STENCILOP_NUM = 9,
    _SG_STENCILOP_FORCE_U32 = 2147483647,
}

/*
    sg_blend_factor

    The source and destination factors in blending operations.
    This is used in the following members when creating a pipeline object:

    sg_pipeline_desc
        .colors[i]
            .blend
                .src_factor_rgb
                .dst_factor_rgb
                .src_factor_alpha
                .dst_factor_alpha

    The default value is SG_BLENDFACTOR_ONE for source
    factors, and for the destination SG_BLENDFACTOR_ZERO if the associated
    blend-op is ADD, SUBTRACT or REVERSE_SUBTRACT or SG_BLENDFACTOR_ONE
    if the associated blend-op is MIN or MAX.
*/
enum sg_blend_factor {
    _SG_BLENDFACTOR_DEFAULT = 0,
    SG_BLENDFACTOR_ZERO = 1,
    SG_BLENDFACTOR_ONE = 2,
    SG_BLENDFACTOR_SRC_COLOR = 3,
    SG_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 4,
    SG_BLENDFACTOR_SRC_ALPHA = 5,
    SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 6,
    SG_BLENDFACTOR_DST_COLOR = 7,
    SG_BLENDFACTOR_ONE_MINUS_DST_COLOR = 8,
    SG_BLENDFACTOR_DST_ALPHA = 9,
    SG_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 10,
    SG_BLENDFACTOR_SRC_ALPHA_SATURATED = 11,
    SG_BLENDFACTOR_BLEND_COLOR = 12,
    SG_BLENDFACTOR_ONE_MINUS_BLEND_COLOR = 13,
    SG_BLENDFACTOR_BLEND_ALPHA = 14,
    SG_BLENDFACTOR_ONE_MINUS_BLEND_ALPHA = 15,
    SG_BLENDFACTOR_SRC1_COLOR = 16,
    SG_BLENDFACTOR_ONE_MINUS_SRC1_COLOR = 17,
    SG_BLENDFACTOR_SRC1_ALPHA = 18,
    SG_BLENDFACTOR_ONE_MINUS_SRC1_ALPHA = 19,
    _SG_BLENDFACTOR_NUM = 20,
    _SG_BLENDFACTOR_FORCE_U32 = 2147483647,
}

/*
    sg_blend_op

    Describes how the source and destination values are combined in the
    fragment blending operation. It is used in the following struct items
    when creating a pipeline object:

    sg_pipeline_desc
        .colors[i]
            .blend
                .op_rgb
                .op_alpha

    The default value is SG_BLENDOP_ADD.
*/
enum sg_blend_op {
    _SG_BLENDOP_DEFAULT = 0,
    SG_BLENDOP_ADD = 1,
    SG_BLENDOP_SUBTRACT = 2,
    SG_BLENDOP_REVERSE_SUBTRACT = 3,
    SG_BLENDOP_MIN = 4,
    SG_BLENDOP_MAX = 5,
    _SG_BLENDOP_NUM = 6,
    _SG_BLENDOP_FORCE_U32 = 2147483647,
}

/*
    sg_color_mask

    Selects the active color channels when writing a fragment color to the
    framebuffer. This is used in the members
    sg_pipeline_desc.colors[i].write_mask when creating a pipeline object.

    The default colormask is SG_COLORMASK_RGBA (write all colors channels)

    NOTE: since the color mask value 0 is reserved for the default value
    (SG_COLORMASK_RGBA), use SG_COLORMASK_NONE if all color channels
    should be disabled.
*/
enum sg_color_mask {
    _SG_COLORMASK_DEFAULT = 0,
    SG_COLORMASK_NONE = 16,
    SG_COLORMASK_R = 1,
    SG_COLORMASK_G = 2,
    SG_COLORMASK_RG = 3,
    SG_COLORMASK_B = 4,
    SG_COLORMASK_RB = 5,
    SG_COLORMASK_GB = 6,
    SG_COLORMASK_RGB = 7,
    SG_COLORMASK_A = 8,
    SG_COLORMASK_RA = 9,
    SG_COLORMASK_GA = 10,
    SG_COLORMASK_RGA = 11,
    SG_COLORMASK_BA = 12,
    SG_COLORMASK_RBA = 13,
    SG_COLORMASK_GBA = 14,
    SG_COLORMASK_RGBA = 15,
    _SG_COLORMASK_FORCE_U32 = 2147483647,
}

/*
    sg_load_action

    Defines the load action that should be performed at the start of a render pass:

    SG_LOADACTION_CLEAR:        clear the render target
    SG_LOADACTION_LOAD:         load the previous content of the render target
    SG_LOADACTION_DONTCARE:     leave the render target in an undefined state

    This is used in the sg_pass_action structure.

    The default load action for all pass attachments is SG_LOADACTION_CLEAR,
    with the values rgba = { 0.5f, 0.5f, 0.5f, 1.0f }, depth=1.0f and stencil=0.

    If you want to override the default behaviour, it is important to not
    only set the clear color, but the 'action' field as well (as long as this
    is _SG_LOADACTION_DEFAULT, the value fields will be ignored).
*/
enum sg_load_action {
    _SG_LOADACTION_DEFAULT = 0,
    SG_LOADACTION_CLEAR = 1,
    SG_LOADACTION_LOAD = 2,
    SG_LOADACTION_DONTCARE = 3,
    _SG_LOADACTION_FORCE_U32 = 2147483647,
}

/*
    sg_store_action

    Defines the store action that should be performed at the end of a render pass:

    SG_STOREACTION_STORE:       store the rendered content to the color attachment image
    SG_STOREACTION_DONTCARE:    allows the GPU to discard the rendered content
*/
enum sg_store_action {
    _SG_STOREACTION_DEFAULT = 0,
    SG_STOREACTION_STORE = 1,
    SG_STOREACTION_DONTCARE = 2,
    _SG_STOREACTION_FORCE_U32 = 2147483647,
}

/*
    sg_pass_state

    Result of sg_query_pass_state().
*/
enum sg_pass_state {
    SG_PASSSTATE_NONE = 0,
    SG_PASSSTATE_RENDER = 1,
    SG_PASSSTATE_COMPUTE = 2,
    _SG_PASSSTATE_NUM = 3,
    _SG_PASSSTATE_FORCE_U32 = 2147483647,
}

/*
    sg_view_type

    Allows to query the type of a view object via the function sg_query_view_type()
*/
enum sg_view_type {
    SG_VIEWTYPE_INVALID = 0,
    SG_VIEWTYPE_STORAGEBUFFER = 1,
    SG_VIEWTYPE_STORAGEIMAGE = 2,
    SG_VIEWTYPE_TEXTURE = 3,
    SG_VIEWTYPE_COLORATTACHMENT = 4,
    SG_VIEWTYPE_RESOLVEATTACHMENT = 5,
    SG_VIEWTYPE_DEPTHSTENCILATTACHMENT = 6,
    _SG_VIEWTYPE_FORCE_U32 = 2147483647,
}

/*
    sg_shader_desc

    Used as parameter of sg_make_shader() to create a shader object which
    communicates shader source or bytecode and shader interface
    reflection information to sokol-gfx.

    If you use sokol-shdc you can ignore the following information since
    the sg_shader_desc struct will be code-generated.

    Otherwise you need to provide the following information to the
    sg_make_shader() call:

    - a vertex- and fragment-shader function:
        - the shader source or bytecode
        - an optional entry point name
        - for D3D11: an optional compile target when source code is provided
          (the defaults are "vs_4_0" and "ps_4_0")

    - ...or alternatively, a compute function:
        - the shader source or bytecode
        - an optional entry point name
        - for D3D11: an optional compile target when source code is provided
          (the default is "cs_5_0")

    - vertex attributes required by some backends (not for compute shaders):
        - the vertex attribute base type (undefined, float, signed int, unsigned int),
          this information is only used in the validation layer to check that the
          pipeline object vertex formats are compatible with the input vertex attribute
          type used in the vertex shader. NOTE that the default base type
          'undefined' skips the validation layer check.
        - for the GL backend: optional vertex attribute names used for name lookup
        - for the D3D11 backend: semantic names and indices

    - only for compute shaders on the Metal backend:
        - the workgroup size aka 'threads per thread-group'

          In other 3D APIs this is declared in the shader code:
            - GLSL: `layout(local_size_x=x, local_size_y=y, local_size_y=z) in;`
            - HLSL: `[numthreads(x, y, z)]`
            - WGSL: `@workgroup_size(x, y, z)`
          ...but in Metal the workgroup size is declared on the CPU side

    - reflection information for each uniform block binding used by the shader:
        - the shader stage the uniform block appears in (SG_SHADERSTAGE_*)
        - the size in bytes of the uniform block
        - backend-specific bindslots:
            - HLSL: the constant buffer register `register(b0..7)`
            - MSL: the buffer attribute `[[buffer(0..7)]]`
            - WGSL: the binding in `@group(0) @binding(0..15)`
        - GLSL only: a description of the uniform block interior
            - the memory layout standard (SG_UNIFORMLAYOUT_*)
            - for each member in the uniform block:
                - the member type (SG_UNIFORM_*)
                - if the member is an array, the array count
                - the member name

    - reflection information for each texture-, storage-buffer and
      storage-image bindings by the shader, each with an associated
      view type:
        - texture bindings => texture views
        - storage-buffer bindings => storage-buffer views
        - storage-image bindings => storage-image views

    - texture bindings must provide the following information:
        - the shader stage the texture binding appears in (SG_SHADERSTAGE_*)
        - the image type (SG_IMAGETYPE_*)
        - the image-sample type (SG_IMAGESAMPLETYPE_*)
        - whether the texture is multisampled
        - backend specific bindslots:
            - HLSL: the texture register `register(t0..31)`
            - MSL: the texture attribute `[[texture(0..31)]]`
            - WGSL: the binding in `@group(1) @binding(0..127)`

    - storage-buffer bindings must provide the following information:
        - the shader stage the storage buffer appears in (SG_SHADERSTAGE_*)
        - whether the storage buffer is readonly (must be true in vertex shaders)
        - backend specific bindslots:
            - HLSL:
                - for readonly storage buffer bindings: `register(t0..31)`
                - for read/write storage buffer bindings: `register(u0..31)`
                  in compute shaders, and `register(uN..31)` in fragment shaders
                  where N must be >= the number of color attachments used
                  in the fragment shader
            - MSL: the buffer attribute `[[buffer(8..23)]]`
            - WGSL: the binding in `@group(1) @binding(0..127)`
            - GL: the binding in `layout(binding=0..sg_limits.max_storage_buffer_bindings_per_stage)`

    - storage-image bindings must provide the following information:
        - the shader stage (*must* be SG_SHADERSTAGE_COMPUTE)
        - whether the storage image is writeonly or readwrite (for readonly
          access use a regular texture binding instead)
        - the image type expected by the shader (SG_IMAGETYPE_*)
        - the access pixel format expected by the shader (SG_PIXELFORMAT_*),
          note that only a subset of pixel formats is allowed for storage image
          bindings
        - backend specific bindslots:
            - HLSL: the UAV register `register(u0..31)`
            - MSL: the texture attribute `[[texture(0..31)]]`
            - WGSL: the binding in `@group(1) @binding(0..127)`
            - GLSL: the binding in `layout(binding=0..sg_imits.max_storage_buffer_bindings_per_stage, [access_format])`

    - reflection information for each sampler used by the shader:
        - the shader stage the sampler appears in (SG_SHADERSTAGE_*)
        - the sampler type (SG_SAMPLERTYPE_*)
        - backend specific bindslots:
            - HLSL: the sampler register `register(s0..11)`
            - MSL: the sampler attribute `[[sampler(0..11)]]`
            - WGSL: the binding in `@group(0) @binding(0..127)`

    - reflection information for each texture-sampler pair used by
      the shader:
        - the shader stage (SG_SHADERSTAGE_*)
        - the texture's array index in the sg_shader_desc.views[] array
        - the sampler's array index in the sg_shader_desc.samplers[] array
        - GLSL only: the name of the combined image-sampler object

    The number and order of items in the sg_shader_desc.attrs[]
    array corresponds to the items in sg_pipeline_desc.layout.attrs.

        - sg_shader_desc.attrs[N] => sg_pipeline_desc.layout.attrs[N]

    NOTE that vertex attribute indices currently cannot have gaps.

    The items index in the sg_shader_desc.uniform_blocks[] array corresponds
    to the ub_slot arg in sg_apply_uniforms():

        - sg_shader_desc.uniform_blocks[N] => sg_apply_uniforms(N, ...)

    The items in the sg_shader_desc.views[] array directly map to
    the views in the sg_bindings.views[] array!

    For all GL backends, shader source-code must be provided. For D3D11 and Metal,
    either shader source-code or byte-code can be provided.

    NOTE that the uniform-block, view and sampler arrays may have gaps. This
    allows to use the same sg_bindings struct for different but related
    shader variations.

    For D3D11, if source code is provided, the d3dcompiler_47.dll will be loaded
    on demand. If this fails, shader creation will fail. When compiling HLSL
    source code, you can provide an optional target string via
    sg_shader_stage_desc.d3d11_target, the default target is "vs_4_0" for the
    vertex shader stage and "ps_4_0" for the pixel shader stage.
    You may optionally provide the file path to enable the default #include handler
    behavior when compiling source code.
*/
enum sg_shader_stage {
    SG_SHADERSTAGE_NONE = 0,
    SG_SHADERSTAGE_VERTEX = 1,
    SG_SHADERSTAGE_FRAGMENT = 2,
    SG_SHADERSTAGE_COMPUTE = 3,
    _SG_SHADERSTAGE_FORCE_U32 = 2147483647,
}

enum sg_shader_attr_base_type {
    SG_SHADERATTRBASETYPE_UNDEFINED = 0,
    SG_SHADERATTRBASETYPE_FLOAT = 1,
    SG_SHADERATTRBASETYPE_SINT = 2,
    SG_SHADERATTRBASETYPE_UINT = 3,
    _SG_SHADERATTRBASETYPE_FORCE_U32 = 2147483647,
}

/*
    sg_log_item

    An enum with a unique item for each log message, warning, error
    and validation layer message. Note that these messages are only
    visible when a logger function is installed in the sg_setup() call.
*/
enum sg_log_item {
    SG_LOGITEM_OK = 0,
    SG_LOGITEM_MALLOC_FAILED = 1,
    SG_LOGITEM_GL_TEXTURE_FORMAT_NOT_SUPPORTED = 2,
    SG_LOGITEM_GL_3D_TEXTURES_NOT_SUPPORTED = 3,
    SG_LOGITEM_GL_ARRAY_TEXTURES_NOT_SUPPORTED = 4,
    SG_LOGITEM_GL_STORAGEBUFFER_GLSL_BINDING_OUT_OF_RANGE = 5,
    SG_LOGITEM_GL_STORAGEIMAGE_GLSL_BINDING_OUT_OF_RANGE = 6,
    SG_LOGITEM_GL_SHADER_COMPILATION_FAILED = 7,
    SG_LOGITEM_GL_SHADER_LINKING_FAILED = 8,
    SG_LOGITEM_GL_VERTEX_ATTRIBUTE_NOT_FOUND_IN_SHADER = 9,
    SG_LOGITEM_GL_UNIFORMBLOCK_NAME_NOT_FOUND_IN_SHADER = 10,
    SG_LOGITEM_GL_IMAGE_SAMPLER_NAME_NOT_FOUND_IN_SHADER = 11,
    SG_LOGITEM_GL_FRAMEBUFFER_STATUS_UNDEFINED = 12,
    SG_LOGITEM_GL_FRAMEBUFFER_STATUS_INCOMPLETE_ATTACHMENT = 13,
    SG_LOGITEM_GL_FRAMEBUFFER_STATUS_INCOMPLETE_MISSING_ATTACHMENT = 14,
    SG_LOGITEM_GL_FRAMEBUFFER_STATUS_UNSUPPORTED = 15,
    SG_LOGITEM_GL_FRAMEBUFFER_STATUS_INCOMPLETE_MULTISAMPLE = 16,
    SG_LOGITEM_GL_FRAMEBUFFER_STATUS_UNKNOWN = 17,
    SG_LOGITEM_GL_APPLE_PIXEL_UNPACK_OFFSET_BUG = 18,
    SG_LOGITEM_D3D11_FEATURE_LEVEL_0_DETECTED = 19,
    SG_LOGITEM_D3D11_CREATE_BUFFER_FAILED = 20,
    SG_LOGITEM_D3D11_CREATE_BUFFER_SRV_FAILED = 21,
    SG_LOGITEM_D3D11_CREATE_BUFFER_UAV_FAILED = 22,
    SG_LOGITEM_D3D11_CREATE_DEPTH_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 23,
    SG_LOGITEM_D3D11_CREATE_DEPTH_TEXTURE_FAILED = 24,
    SG_LOGITEM_D3D11_CREATE_2D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 25,
    SG_LOGITEM_D3D11_CREATE_2D_TEXTURE_FAILED = 26,
    SG_LOGITEM_D3D11_CREATE_2D_SRV_FAILED = 27,
    SG_LOGITEM_D3D11_CREATE_3D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 28,
    SG_LOGITEM_D3D11_CREATE_3D_TEXTURE_FAILED = 29,
    SG_LOGITEM_D3D11_CREATE_3D_SRV_FAILED = 30,
    SG_LOGITEM_D3D11_CREATE_MSAA_TEXTURE_FAILED = 31,
    SG_LOGITEM_D3D11_CREATE_SAMPLER_STATE_FAILED = 32,
    SG_LOGITEM_D3D11_UNIFORMBLOCK_HLSL_REGISTER_B_OUT_OF_RANGE = 33,
    SG_LOGITEM_D3D11_STORAGEBUFFER_HLSL_REGISTER_T_OUT_OF_RANGE = 34,
    SG_LOGITEM_D3D11_STORAGEBUFFER_HLSL_REGISTER_U_OUT_OF_RANGE = 35,
    SG_LOGITEM_D3D11_IMAGE_HLSL_REGISTER_T_OUT_OF_RANGE = 36,
    SG_LOGITEM_D3D11_STORAGEIMAGE_HLSL_REGISTER_U_OUT_OF_RANGE = 37,
    SG_LOGITEM_D3D11_SAMPLER_HLSL_REGISTER_S_OUT_OF_RANGE = 38,
    SG_LOGITEM_D3D11_LOAD_D3DCOMPILER_47_DLL_FAILED = 39,
    SG_LOGITEM_D3D11_SHADER_COMPILATION_FAILED = 40,
    SG_LOGITEM_D3D11_SHADER_COMPILATION_OUTPUT = 41,
    SG_LOGITEM_D3D11_CREATE_CONSTANT_BUFFER_FAILED = 42,
    SG_LOGITEM_D3D11_CREATE_INPUT_LAYOUT_FAILED = 43,
    SG_LOGITEM_D3D11_CREATE_RASTERIZER_STATE_FAILED = 44,
    SG_LOGITEM_D3D11_CREATE_DEPTH_STENCIL_STATE_FAILED = 45,
    SG_LOGITEM_D3D11_CREATE_BLEND_STATE_FAILED = 46,
    SG_LOGITEM_D3D11_CREATE_RTV_FAILED = 47,
    SG_LOGITEM_D3D11_CREATE_DSV_FAILED = 48,
    SG_LOGITEM_D3D11_CREATE_UAV_FAILED = 49,
    SG_LOGITEM_D3D11_MAP_FOR_WRITE_BUFFER_TRANSIENT_FAILED = 50,
    SG_LOGITEM_METAL_CREATE_BUFFER_FAILED = 51,
    SG_LOGITEM_METAL_TEXTURE_FORMAT_NOT_SUPPORTED = 52,
    SG_LOGITEM_METAL_CREATE_TEXTURE_FAILED = 53,
    SG_LOGITEM_METAL_CREATE_SAMPLER_FAILED = 54,
    SG_LOGITEM_METAL_SHADER_COMPILATION_FAILED = 55,
    SG_LOGITEM_METAL_SHADER_CREATION_FAILED = 56,
    SG_LOGITEM_METAL_SHADER_COMPILATION_OUTPUT = 57,
    SG_LOGITEM_METAL_SHADER_ENTRY_NOT_FOUND = 58,
    SG_LOGITEM_METAL_UNIFORMBLOCK_MSL_BUFFER_SLOT_OUT_OF_RANGE = 59,
    SG_LOGITEM_METAL_STORAGEBUFFER_MSL_BUFFER_SLOT_OUT_OF_RANGE = 60,
    SG_LOGITEM_METAL_STORAGEIMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE = 61,
    SG_LOGITEM_METAL_IMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE = 62,
    SG_LOGITEM_METAL_SAMPLER_MSL_SAMPLER_SLOT_OUT_OF_RANGE = 63,
    SG_LOGITEM_METAL_CREATE_CPS_FAILED = 64,
    SG_LOGITEM_METAL_CREATE_CPS_OUTPUT = 65,
    SG_LOGITEM_METAL_CREATE_RPS_FAILED = 66,
    SG_LOGITEM_METAL_CREATE_RPS_OUTPUT = 67,
    SG_LOGITEM_METAL_CREATE_DSS_FAILED = 68,
    SG_LOGITEM_METAL_CREATE_TEXTUREVIEW_FAILED = 69,
    SG_LOGITEM_WGPU_BINDGROUPS_POOL_EXHAUSTED = 70,
    SG_LOGITEM_WGPU_BINDGROUPSCACHE_SIZE_GREATER_ONE = 71,
    SG_LOGITEM_WGPU_BINDGROUPSCACHE_SIZE_POW2 = 72,
    SG_LOGITEM_WGPU_CREATEBINDGROUP_FAILED = 73,
    SG_LOGITEM_WGPU_CREATE_BUFFER_FAILED = 74,
    SG_LOGITEM_WGPU_CREATE_TEXTURE_FAILED = 75,
    SG_LOGITEM_WGPU_CREATE_TEXTURE_VIEW_FAILED = 76,
    SG_LOGITEM_WGPU_CREATE_SAMPLER_FAILED = 77,
    SG_LOGITEM_WGPU_CREATE_SHADER_MODULE_FAILED = 78,
    SG_LOGITEM_WGPU_SHADER_CREATE_BINDGROUP_LAYOUT_FAILED = 79,
    SG_LOGITEM_WGPU_UNIFORMBLOCK_WGSL_GROUP0_BINDING_OUT_OF_RANGE = 80,
    SG_LOGITEM_WGPU_TEXTURE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 81,
    SG_LOGITEM_WGPU_STORAGEBUFFER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 82,
    SG_LOGITEM_WGPU_STORAGEIMAGE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 83,
    SG_LOGITEM_WGPU_SAMPLER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 84,
    SG_LOGITEM_WGPU_CREATE_PIPELINE_LAYOUT_FAILED = 85,
    SG_LOGITEM_WGPU_CREATE_RENDER_PIPELINE_FAILED = 86,
    SG_LOGITEM_WGPU_CREATE_COMPUTE_PIPELINE_FAILED = 87,
    SG_LOGITEM_VULKAN_REQUIRED_EXTENSION_FUNCTION_MISSING = 88,
    SG_LOGITEM_VULKAN_ALLOC_DEVICE_MEMORY_NO_SUITABLE_MEMORY_TYPE = 89,
    SG_LOGITEM_VULKAN_ALLOCATE_MEMORY_FAILED = 90,
    SG_LOGITEM_VULKAN_ALLOC_BUFFER_DEVICE_MEMORY_FAILED = 91,
    SG_LOGITEM_VULKAN_ALLOC_IMAGE_DEVICE_MEMORY_FAILED = 92,
    SG_LOGITEM_VULKAN_DELETE_QUEUE_EXHAUSTED = 93,
    SG_LOGITEM_VULKAN_STAGING_CREATE_BUFFER_FAILED = 94,
    SG_LOGITEM_VULKAN_STAGING_ALLOCATE_MEMORY_FAILED = 95,
    SG_LOGITEM_VULKAN_STAGING_BIND_BUFFER_MEMORY_FAILED = 96,
    SG_LOGITEM_VULKAN_STAGING_TRANSIENT_BUFFER_OVERFLOW = 97,
    SG_LOGITEM_VULKAN_STAGING_IMAGE_ROW_PITCH_GREATER_STAGING_BUFFER = 98,
    SG_LOGITEM_VULKAN_CREATE_SHARED_BUFFER_FAILED = 99,
    SG_LOGITEM_VULKAN_ALLOCATE_SHARED_BUFFER_MEMORY_FAILED = 100,
    SG_LOGITEM_VULKAN_BIND_SHARED_BUFFER_MEMORY_FAILED = 101,
    SG_LOGITEM_VULKAN_MAP_SHARED_BUFFER_MEMORY_FAILED = 102,
    SG_LOGITEM_VULKAN_CREATE_BUFFER_FAILED = 103,
    SG_LOGITEM_VULKAN_BIND_BUFFER_MEMORY_FAILED = 104,
    SG_LOGITEM_VULKAN_CREATE_IMAGE_FAILED = 105,
    SG_LOGITEM_VULKAN_BIND_IMAGE_MEMORY_FAILED = 106,
    SG_LOGITEM_VULKAN_CREATE_SHADER_MODULE_FAILED = 107,
    SG_LOGITEM_VULKAN_UNIFORMBLOCK_SPIRV_SET0_BINDING_OUT_OF_RANGE = 108,
    SG_LOGITEM_VULKAN_TEXTURE_SPIRV_SET1_BINDING_OUT_OF_RANGE = 109,
    SG_LOGITEM_VULKAN_STORAGEBUFFER_SPIRV_SET1_BINDING_OUT_OF_RANGE = 110,
    SG_LOGITEM_VULKAN_STORAGEIMAGE_SPIRV_SET1_BINDING_OUT_OF_RANGE = 111,
    SG_LOGITEM_VULKAN_SAMPLER_SPIRV_SET1_BINDING_OUT_OF_RANGE = 112,
    SG_LOGITEM_VULKAN_CREATE_DESCRIPTOR_SET_LAYOUT_FAILED = 113,
    SG_LOGITEM_VULKAN_SHADER_UNIFORM_DESCRIPTOR_SET_SIZE_VS_CACHE_SIZE = 114,
    SG_LOGITEM_VULKAN_CREATE_PIPELINE_LAYOUT_FAILED = 115,
    SG_LOGITEM_VULKAN_CREATE_GRAPHICS_PIPELINE_FAILED = 116,
    SG_LOGITEM_VULKAN_CREATE_COMPUTE_PIPELINE_FAILED = 117,
    SG_LOGITEM_VULKAN_CREATE_IMAGE_VIEW_FAILED = 118,
    SG_LOGITEM_VULKAN_VIEW_MAX_DESCRIPTOR_SIZE = 119,
    SG_LOGITEM_VULKAN_CREATE_SAMPLER_FAILED = 120,
    SG_LOGITEM_VULKAN_SAMPLER_MAX_DESCRIPTOR_SIZE = 121,
    SG_LOGITEM_VULKAN_WAIT_FOR_FENCE_FAILED = 122,
    SG_LOGITEM_VULKAN_UNIFORM_BUFFER_OVERFLOW = 123,
    SG_LOGITEM_VULKAN_DESCRIPTOR_BUFFER_OVERFLOW = 124,
    SG_LOGITEM_IDENTICAL_COMMIT_LISTENER = 125,
    SG_LOGITEM_COMMIT_LISTENER_ARRAY_FULL = 126,
    SG_LOGITEM_TRACE_HOOKS_NOT_ENABLED = 127,
    SG_LOGITEM_DEALLOC_BUFFER_INVALID_STATE = 128,
    SG_LOGITEM_DEALLOC_IMAGE_INVALID_STATE = 129,
    SG_LOGITEM_DEALLOC_SAMPLER_INVALID_STATE = 130,
    SG_LOGITEM_DEALLOC_SHADER_INVALID_STATE = 131,
    SG_LOGITEM_DEALLOC_PIPELINE_INVALID_STATE = 132,
    SG_LOGITEM_DEALLOC_VIEW_INVALID_STATE = 133,
    SG_LOGITEM_INIT_BUFFER_INVALID_STATE = 134,
    SG_LOGITEM_INIT_IMAGE_INVALID_STATE = 135,
    SG_LOGITEM_INIT_SAMPLER_INVALID_STATE = 136,
    SG_LOGITEM_INIT_SHADER_INVALID_STATE = 137,
    SG_LOGITEM_INIT_PIPELINE_INVALID_STATE = 138,
    SG_LOGITEM_INIT_VIEW_INVALID_STATE = 139,
    SG_LOGITEM_UNINIT_BUFFER_INVALID_STATE = 140,
    SG_LOGITEM_UNINIT_IMAGE_INVALID_STATE = 141,
    SG_LOGITEM_UNINIT_SAMPLER_INVALID_STATE = 142,
    SG_LOGITEM_UNINIT_SHADER_INVALID_STATE = 143,
    SG_LOGITEM_UNINIT_PIPELINE_INVALID_STATE = 144,
    SG_LOGITEM_UNINIT_VIEW_INVALID_STATE = 145,
    SG_LOGITEM_FAIL_BUFFER_INVALID_STATE = 146,
    SG_LOGITEM_FAIL_IMAGE_INVALID_STATE = 147,
    SG_LOGITEM_FAIL_SAMPLER_INVALID_STATE = 148,
    SG_LOGITEM_FAIL_SHADER_INVALID_STATE = 149,
    SG_LOGITEM_FAIL_PIPELINE_INVALID_STATE = 150,
    SG_LOGITEM_FAIL_VIEW_INVALID_STATE = 151,
    SG_LOGITEM_BUFFER_POOL_EXHAUSTED = 152,
    SG_LOGITEM_IMAGE_POOL_EXHAUSTED = 153,
    SG_LOGITEM_SAMPLER_POOL_EXHAUSTED = 154,
    SG_LOGITEM_SHADER_POOL_EXHAUSTED = 155,
    SG_LOGITEM_PIPELINE_POOL_EXHAUSTED = 156,
    SG_LOGITEM_VIEW_POOL_EXHAUSTED = 157,
    SG_LOGITEM_BEGINPASS_TOO_MANY_COLOR_ATTACHMENTS = 158,
    SG_LOGITEM_BEGINPASS_TOO_MANY_RESOLVE_ATTACHMENTS = 159,
    SG_LOGITEM_BEGINPASS_ATTACHMENTS_ALIVE = 160,
    SG_LOGITEM_DRAW_WITHOUT_BINDINGS = 161,
    SG_LOGITEM_WRITE_BUFFER_TRANSIENT_BUFFER_ALIVE = 162,
    SG_LOGITEM_WRITE_BUFFER_TRANSIENT_BUFFER_VALID = 163,
    SG_LOGITEM_WRITE_IMAGE_TRANSIENT_IMAGE_ALIVE = 164,
    SG_LOGITEM_WRITE_IMAGE_TRANSIENT_IMAGE_VALID = 165,
    SG_LOGITEM_WRITE_BUFFER_UNSEALED_BUFFER_ALIVE = 166,
    SG_LOGITEM_WRITE_BUFFER_UNSEALED_BUFFER_UNSEALED = 167,
    SG_LOGITEM_WRITE_IMAGE_UNSEALED_IMAGE_ALIVE = 168,
    SG_LOGITEM_WRITE_IMAGE_UNSEALED_IMAGE_UNSEALED = 169,
    SG_LOGITEM_SEAL_BUFFER_ALIVE = 170,
    SG_LOGITEM_SEAL_IMAGE_ALIVE = 171,
    SG_LOGITEM_COPY_BUFFER_TO_BUFFER_SRC_ALIVE = 172,
    SG_LOGITEM_COPY_BUFFER_TO_BUFFER_DST_ALIVE = 173,
    SG_LOGITEM_COPY_BUFFER_TO_BUFFER_SRC_VALID = 174,
    SG_LOGITEM_COPY_BUFFER_TO_BUFFER_DST_VALID = 175,
    SG_LOGITEM_COPY_BUFFER_TO_IMAGE_SRC_ALIVE = 176,
    SG_LOGITEM_COPY_BUFFER_TO_IMAGE_DST_ALIVE = 177,
    SG_LOGITEM_COPY_BUFFER_TO_IMAGE_SRC_VALID = 178,
    SG_LOGITEM_COPY_BUFFER_TO_IMAGE_DST_VALID = 179,
    SG_LOGITEM_SHADERDESC_TOO_MANY_VERTEXSTAGE_TEXTURES = 180,
    SG_LOGITEM_SHADERDESC_TOO_MANY_FRAGMENTSTAGE_TEXTURES = 181,
    SG_LOGITEM_SHADERDESC_TOO_MANY_COMPUTESTAGE_TEXTURES = 182,
    SG_LOGITEM_SHADERDESC_TOO_MANY_VERTEXSTAGE_STORAGEBUFFERS = 183,
    SG_LOGITEM_SHADERDESC_TOO_MANY_FRAGMENTSTAGE_STORAGEBUFFERS = 184,
    SG_LOGITEM_SHADERDESC_TOO_MANY_COMPUTESTAGE_STORAGEBUFFERS = 185,
    SG_LOGITEM_SHADERDESC_TOO_MANY_VERTEXSTAGE_STORAGEIMAGES = 186,
    SG_LOGITEM_SHADERDESC_TOO_MANY_FRAGMENTSTAGE_STORAGEIMAGES = 187,
    SG_LOGITEM_SHADERDESC_TOO_MANY_COMPUTESTAGE_STORAGEIMAGES = 188,
    SG_LOGITEM_SHADERDESC_TOO_MANY_VERTEXSTAGE_TEXTURESAMPLERPAIRS = 189,
    SG_LOGITEM_SHADERDESC_TOO_MANY_FRAGMENTSTAGE_TEXTURESAMPLERPAIRS = 190,
    SG_LOGITEM_SHADERDESC_TOO_MANY_COMPUTESTAGE_TEXTURESAMPLERPAIRS = 191,
    SG_LOGITEM_VALIDATE_BUFFERDESC_CANARY = 192,
    SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_NONZERO_SIZE = 193,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_VERTEXBUFFER = 194,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INDEXBUFFER = 195,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_STORAGEBUFFER = 196,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INJECTED = 197,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_COPYDST = 198,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INITIALDATA = 199,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_COPYSRC = 200,
    SG_LOGITEM_VALIDATE_BUFFERDESC_SEPARATE_BUFFER_TYPES = 201,
    SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_WRITETRANSIENT = 202,
    SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_COPYDST = 203,
    SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_STAGING = 204,
    SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_INITIALDATA = 205,
    SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_COPYDST = 206,
    SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_INITIALDATA = 207,
    SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_INJECTED = 208,
    SG_LOGITEM_VALIDATE_BUFFERDESC_COPYDST_VS_INITIALDATA = 209,
    SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_MATCHING_DATA_SIZE = 210,
    SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_ZERO_DATA_SIZE = 211,
    SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_DATA = 212,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STORAGEBUFFER_SUPPORTED = 213,
    SG_LOGITEM_VALIDATE_BUFFERDESC_STORAGEBUFFER_SIZE_MULTIPLE_4 = 214,
    SG_LOGITEM_VALIDATE_IMAGEDATA_NODATA = 215,
    SG_LOGITEM_VALIDATE_IMAGEDATA_DATA_SIZE = 216,
    SG_LOGITEM_VALIDATE_IMAGEDESC_CANARY = 217,
    SG_LOGITEM_VALIDATE_IMAGEDESC_IMMUTABLE_VS_WRITABLE = 218,
    SG_LOGITEM_VALIDATE_IMAGEDESC_WRITEUNSEALED_VS_IMMUTABLE = 219,
    SG_LOGITEM_VALIDATE_IMAGEDESC_WRITEUNSEALED_VS_ATTACHMENT = 220,
    SG_LOGITEM_VALIDATE_IMAGEDESC_WRITETRANSIENT_VS_ATTACHMENT = 221,
    SG_LOGITEM_VALIDATE_IMAGEDESC_WRITETRANSIENT_VS_INJECTED = 222,
    SG_LOGITEM_VALIDATE_IMAGEDESC_COPYDST_VS_ATTACHMENT = 223,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_COLOR_DEPTH_STENCIL = 224,
    SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_2D_NUMSLICES = 225,
    SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_CUBE_NUMSLICES = 226,
    SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_ARRAY_NUMSLICES = 227,
    SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_3D_NUMSLICES = 228,
    SG_LOGITEM_VALIDATE_IMAGEDESC_NUMSLICES = 229,
    SG_LOGITEM_VALIDATE_IMAGEDESC_WIDTH = 230,
    SG_LOGITEM_VALIDATE_IMAGEDESC_HEIGHT = 231,
    SG_LOGITEM_VALIDATE_IMAGEDESC_NONRT_PIXELFORMAT = 232,
    SG_LOGITEM_VALIDATE_IMAGEDESC_MSAA_BUT_NO_ATTACHMENT = 233,
    SG_LOGITEM_VALIDATE_IMAGEDESC_DEPTH_3D_IMAGE = 234,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_IMMUTABLE = 235,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_NO_DATA = 236,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_PIXELFORMAT = 237,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_RESOLVE_EXPECT_NO_MSAA = 238,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_NO_MSAA_SUPPORT = 239,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_NUM_MIPMAPS = 240,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_3D_IMAGE = 241,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_CUBE_IMAGE = 242,
    SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_ARRAY_IMAGE = 243,
    SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_IMMUTABLE = 244,
    SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_DATA = 245,
    SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_PIXELFORMAT = 246,
    SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_MSAA = 247,
    SG_LOGITEM_VALIDATE_IMAGEDESC_INJECTED_NO_DATA = 248,
    SG_LOGITEM_VALIDATE_IMAGEDESC_WRITABLE_NO_DATA = 249,
    SG_LOGITEM_VALIDATE_SAMPLERDESC_CANARY = 250,
    SG_LOGITEM_VALIDATE_SAMPLERDESC_ANISTROPIC_REQUIRES_LINEAR_FILTERING = 251,
    SG_LOGITEM_VALIDATE_SHADERDESC_CANARY = 252,
    SG_LOGITEM_VALIDATE_SHADERDESC_VERTEX_SOURCE = 253,
    SG_LOGITEM_VALIDATE_SHADERDESC_FRAGMENT_SOURCE = 254,
    SG_LOGITEM_VALIDATE_SHADERDESC_COMPUTE_SOURCE = 255,
    SG_LOGITEM_VALIDATE_SHADERDESC_VERTEX_SOURCE_OR_BYTECODE = 256,
    SG_LOGITEM_VALIDATE_SHADERDESC_FRAGMENT_SOURCE_OR_BYTECODE = 257,
    SG_LOGITEM_VALIDATE_SHADERDESC_COMPUTE_SOURCE_OR_BYTECODE = 258,
    SG_LOGITEM_VALIDATE_SHADERDESC_INVALID_SHADER_COMBO = 259,
    SG_LOGITEM_VALIDATE_SHADERDESC_NO_BYTECODE_SIZE = 260,
    SG_LOGITEM_VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP_INITIALIZED = 261,
    SG_LOGITEM_VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP_MULTIPLE_32 = 262,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_CONT_MEMBERS = 263,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_IS_ZERO = 264,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_METAL_BUFFER_SLOT_COLLISION = 265,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_HLSL_REGISTER_B_COLLISION = 266,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_WGSL_GROUP0_BINDING_COLLISION = 267,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_SPIRV_SET0_BINDING_COLLISION = 268,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_MEMBERS = 269,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_UNIFORM_GLSL_NAME = 270,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_MISMATCH = 271,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_ARRAY_COUNT = 272,
    SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_STD140_ARRAY_TYPE = 273,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_VERTEXSHADER_READWRITE = 274,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_METAL_BUFFER_SLOT_COLLISION = 275,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_T_COLLISION = 276,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_U_COLLISION = 277,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_GLSL_BINDING_COLLISION = 278,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_WGSL_GROUP1_BINDING_COLLISION = 279,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_SPIRV_SET1_BINDING_COLLISION = 280,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_EXPECT_COMPUTE_STAGE = 281,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_METAL_TEXTURE_SLOT_COLLISION = 282,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_HLSL_REGISTER_U_COLLISION = 283,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_GLSL_BINDING_COLLISION = 284,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_WGSL_GROUP1_BINDING_COLLISION = 285,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_SPIRV_SET1_BINDING_COLLISION = 286,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_TEXTURE_METAL_TEXTURE_SLOT_COLLISION = 287,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_TEXTURE_HLSL_REGISTER_T_COLLISION = 288,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_TEXTURE_WGSL_GROUP1_BINDING_COLLISION = 289,
    SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_TEXTURE_SPIRV_SET1_BINDING_COLLISION = 290,
    SG_LOGITEM_VALIDATE_SHADERDESC_SAMPLER_METAL_SAMPLER_SLOT_COLLISION = 291,
    SG_LOGITEM_VALIDATE_SHADERDESC_SAMPLER_HLSL_REGISTER_S_COLLISION = 292,
    SG_LOGITEM_VALIDATE_SHADERDESC_SAMPLER_WGSL_GROUP1_BINDING_COLLISION = 293,
    SG_LOGITEM_VALIDATE_SHADERDESC_SAMPLER_SPIRV_SET1_BINDING_COLLISION = 294,
    SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_VIEW_SLOT_OUT_OF_RANGE = 295,
    SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_SLOT_OUT_OF_RANGE = 296,
    SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_TEXTURE_STAGE_MISMATCH = 297,
    SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_EXPECT_TEXTURE_VIEW = 298,
    SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_STAGE_MISMATCH = 299,
    SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_GLSL_NAME = 300,
    SG_LOGITEM_VALIDATE_SHADERDESC_NONFILTERING_SAMPLER_REQUIRED = 301,
    SG_LOGITEM_VALIDATE_SHADERDESC_COMPARISON_SAMPLER_REQUIRED = 302,
    SG_LOGITEM_VALIDATE_SHADERDESC_TEXVIEW_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS = 303,
    SG_LOGITEM_VALIDATE_SHADERDESC_SAMPLER_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS = 304,
    SG_LOGITEM_VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG = 305,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_CANARY = 306,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER = 307,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_COMPUTE_SHADER_EXPECTED = 308,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_NO_COMPUTE_SHADER_EXPECTED = 309,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_NO_CONT_ATTRS = 310,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH = 311,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_VERTEXFORMAT_INT10_N2_NOT_SUPPORTED = 312,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_LAYOUT_STRIDE4 = 313,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_SEMANTICS = 314,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER_READONLY_STORAGEBUFFERS = 315,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER_HLSL_REGISTER_U_VS_COLOR_COUNT = 316,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER_HLSL_REGISTER_U_LIMIT = 317,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE = 318,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_DUAL_SOURCE_BLENDING_NOT_SUPPORTED = 319,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_DEPTH_FORMAT_NONE_BUT_DEPTH_WRITE_ENABLED = 320,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_DEPTH_FORMAT_NONE_COMPARE_FUNC_MISMATCH = 321,
    SG_LOGITEM_VALIDATE_PIPELINEDESC_COLOR_COUNT = 322,
    SG_LOGITEM_VALIDATE_VIEWDESC_CANARY = 323,
    SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE = 324,
    SG_LOGITEM_VALIDATE_VIEWDESC_ANY_VIEWTYPE = 325,
    SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_ALIVE = 326,
    SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_VALID = 327,
    SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_VALID_UNSEALED = 328,
    SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_VS_BUFFER_SIZE = 329,
    SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_MULTIPLE_256 = 330,
    SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_USAGE = 331,
    SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEIMAGE_USAGE = 332,
    SG_LOGITEM_VALIDATE_VIEWDESC_COLORATTACHMENT_USAGE = 333,
    SG_LOGITEM_VALIDATE_VIEWDESC_RESOLVEATTACHMENT_USAGE = 334,
    SG_LOGITEM_VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_USAGE = 335,
    SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_MIPLEVEL = 336,
    SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_2D_SLICE = 337,
    SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_CUBEMAP_SLICE = 338,
    SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_ARRAY_SLICE = 339,
    SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_3D_SLICE = 340,
    SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_EXPECT_NO_MSAA = 341,
    SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_MIPLEVELS = 342,
    SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_2D_SLICES = 343,
    SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_CUBEMAP_SLICES = 344,
    SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_ARRAY_SLICES = 345,
    SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_3D_SLICES = 346,
    SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEIMAGE_PIXELFORMAT = 347,
    SG_LOGITEM_VALIDATE_VIEWDESC_COLORATTACHMENT_PIXELFORMAT = 348,
    SG_LOGITEM_VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_PIXELFORMAT = 349,
    SG_LOGITEM_VALIDATE_VIEWDESC_RESOLVEATTACHMENT_SAMPLECOUNT = 350,
    SG_LOGITEM_VALIDATE_BEGINPASS_CANARY = 351,
    SG_LOGITEM_VALIDATE_BEGINPASS_COMPUTEPASS_EXPECT_NO_ATTACHMENTS = 352,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH = 353,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH_NOTSET = 354,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT = 355,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT_NOTSET = 356,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT = 357,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT_NOTSET = 358,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT = 359,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT_NOTSET = 360,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_DEPTHFORMAT_NOTSET = 361,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE = 362,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE_NOTSET = 363,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE = 364,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE_NOTSET = 365,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE = 366,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE_NOTSET = 367,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW = 368,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW_NOTSET = 369,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW = 370,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW_NOTSET = 371,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW = 372,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW_NOTSET = 373,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW = 374,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW_NOTSET = 375,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW = 376,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW_NOTSET = 377,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW = 378,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW_NOTSET = 379,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_GL_EXPECT_FRAMEBUFFER_NOTSET = 380,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERIMAGE = 381,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERIMAGE_NOTSET = 382,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERVIEW = 383,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERVIEW_NOTSET = 384,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_DEPTHSTENCILIMAGE = 385,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_DEPTHSTENCILIMAGE_NOTSET = 386,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_DEPTHSTENCILVIEW = 387,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_DEPTHSTENCILVIEW_NOTSET = 388,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RESOLVEIMAGE = 389,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RESOLVEIMAGE_NOTSET = 390,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RESOLVEVIEW = 391,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RESOLVEVIEW_NOTSET = 392,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERFINISHEDSEMAPHORE = 393,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERFINISHEDSEMAPHORE_NOTSET = 394,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_PRESENTCOMPLETESEMAPHORE = 395,
    SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_PRESENTCOMPLETESEMAPHORE_NOTSET = 396,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEWS_CONTINUOUS = 397,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_ALIVE = 398,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_VALID = 399,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_TYPE = 400,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_ALIVE = 401,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_VALID = 402,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SIZES = 403,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNT = 404,
    SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNTS_EQUAL = 405,
    SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_NO_COLORATTACHMENTVIEW = 406,
    SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_ALIVE = 407,
    SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_VALID = 408,
    SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_TYPE = 409,
    SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_ALIVE = 410,
    SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_VALID = 411,
    SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_SIZES = 412,
    SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEWS_CONTINUOUS = 413,
    SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_ALIVE = 414,
    SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_VALID = 415,
    SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_TYPE = 416,
    SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_ALIVE = 417,
    SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_VALID = 418,
    SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SIZES = 419,
    SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SAMPLECOUNT = 420,
    SG_LOGITEM_VALIDATE_BEGINPASS_ATTACHMENTS_EXPECTED = 421,
    SG_LOGITEM_VALIDATE_AVP_RENDERPASS_EXPECTED = 422,
    SG_LOGITEM_VALIDATE_ASR_RENDERPASS_EXPECTED = 423,
    SG_LOGITEM_VALIDATE_APIP_PIPELINE_VALID_ID = 424,
    SG_LOGITEM_VALIDATE_APIP_PIPELINE_EXISTS = 425,
    SG_LOGITEM_VALIDATE_APIP_PIPELINE_VALID = 426,
    SG_LOGITEM_VALIDATE_APIP_PASS_EXPECTED = 427,
    SG_LOGITEM_VALIDATE_APIP_PIPELINE_SHADER_ALIVE = 428,
    SG_LOGITEM_VALIDATE_APIP_PIPELINE_SHADER_VALID = 429,
    SG_LOGITEM_VALIDATE_APIP_COMPUTEPASS_EXPECTED = 430,
    SG_LOGITEM_VALIDATE_APIP_RENDERPASS_EXPECTED = 431,
    SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_COLOR_COUNT = 432,
    SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_COLOR_FORMAT = 433,
    SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_DEPTH_FORMAT = 434,
    SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_SAMPLE_COUNT = 435,
    SG_LOGITEM_VALIDATE_APIP_ATTACHMENTS_ALIVE = 436,
    SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_COUNT = 437,
    SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_VIEW_VALID = 438,
    SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_IMAGE_VALID = 439,
    SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_FORMAT = 440,
    SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_VIEW_VALID = 441,
    SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_IMAGE_VALID = 442,
    SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_FORMAT = 443,
    SG_LOGITEM_VALIDATE_APIP_ATTACHMENT_SAMPLE_COUNT = 444,
    SG_LOGITEM_VALIDATE_ABND_PASS_EXPECTED = 445,
    SG_LOGITEM_VALIDATE_ABND_EMPTY_BINDINGS = 446,
    SG_LOGITEM_VALIDATE_ABND_NO_PIPELINE = 447,
    SG_LOGITEM_VALIDATE_ABND_PIPELINE_ALIVE = 448,
    SG_LOGITEM_VALIDATE_ABND_PIPELINE_VALID = 449,
    SG_LOGITEM_VALIDATE_ABND_PIPELINE_SHADER_ALIVE = 450,
    SG_LOGITEM_VALIDATE_ABND_PIPELINE_SHADER_VALID = 451,
    SG_LOGITEM_VALIDATE_ABND_COMPUTE_EXPECTED_NO_VBUFS = 452,
    SG_LOGITEM_VALIDATE_ABND_COMPUTE_EXPECTED_NO_IBUF = 453,
    SG_LOGITEM_VALIDATE_ABND_EXPECTED_VBUF = 454,
    SG_LOGITEM_VALIDATE_ABND_VBUF_ALIVE = 455,
    SG_LOGITEM_VALIDATE_ABND_VBUF_USAGE = 456,
    SG_LOGITEM_VALIDATE_ABND_VBUF_VS_SBVIEW_READWRITE = 457,
    SG_LOGITEM_VALIDATE_ABND_EXPECTED_NO_IBUF = 458,
    SG_LOGITEM_VALIDATE_ABND_EXPECTED_IBUF = 459,
    SG_LOGITEM_VALIDATE_ABND_IBUF_ALIVE = 460,
    SG_LOGITEM_VALIDATE_ABND_IBUF_USAGE = 461,
    SG_LOGITEM_VALIDATE_ABND_IBUF_VS_SBVIEW_READWRITE = 462,
    SG_LOGITEM_VALIDATE_ABND_EXPECTED_VIEW_BINDING = 463,
    SG_LOGITEM_VALIDATE_ABND_VIEW_ALIVE = 464,
    SG_LOGITEM_VALIDATE_ABND_EXPECT_TEXVIEW = 465,
    SG_LOGITEM_VALIDATE_ABND_EXPECT_SBVIEW = 466,
    SG_LOGITEM_VALIDATE_ABND_SBVIEW_READWRITE_VS_WRITETRANSIENT = 467,
    SG_LOGITEM_VALIDATE_ABND_SBVIEW_READONLY_VS_READWRITE = 468,
    SG_LOGITEM_VALIDATE_ABND_SBVIEW_READWRITE_VS_READ = 469,
    SG_LOGITEM_VALIDATE_ABND_EXPECT_SIMGVIEW = 470,
    SG_LOGITEM_VALIDATE_ABND_TEXVIEW_IMAGETYPE_MISMATCH = 471,
    SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_MULTISAMPLED_IMAGE = 472,
    SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_NON_MULTISAMPLED_IMAGE = 473,
    SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_FILTERABLE_IMAGE = 474,
    SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_DEPTH_IMAGE = 475,
    SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_COMPUTE_PASS_EXPECTED = 476,
    SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_IMAGETYPE_MISMATCH = 477,
    SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_ACCESSFORMAT = 478,
    SG_LOGITEM_VALIDATE_ABND_EXPECTED_SAMPLER_BINDING = 479,
    SG_LOGITEM_VALIDATE_ABND_UNEXPECTED_SAMPLER_COMPARE_NEVER = 480,
    SG_LOGITEM_VALIDATE_ABND_EXPECTED_SAMPLER_COMPARE_NEVER = 481,
    SG_LOGITEM_VALIDATE_ABND_EXPECTED_NONFILTERING_SAMPLER = 482,
    SG_LOGITEM_VALIDATE_ABND_SAMPLER_ALIVE = 483,
    SG_LOGITEM_VALIDATE_ABND_SAMPLER_VALID = 484,
    SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_DEPTHSTENCIL_ATTACHMENT = 485,
    SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_COLOR_ATTACHMENT = 486,
    SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_RESOLVE_ATTACHMENT = 487,
    SG_LOGITEM_VALIDATE_ABND_TEXTURE_VS_STORAGEIMAGE_BINDING = 488,
    SG_LOGITEM_VALIDATE_AU_PASS_EXPECTED = 489,
    SG_LOGITEM_VALIDATE_AU_NO_PIPELINE = 490,
    SG_LOGITEM_VALIDATE_AU_PIPELINE_ALIVE = 491,
    SG_LOGITEM_VALIDATE_AU_PIPELINE_VALID = 492,
    SG_LOGITEM_VALIDATE_AU_PIPELINE_SHADER_ALIVE = 493,
    SG_LOGITEM_VALIDATE_AU_PIPELINE_SHADER_VALID = 494,
    SG_LOGITEM_VALIDATE_AU_NO_UNIFORMBLOCK_AT_SLOT = 495,
    SG_LOGITEM_VALIDATE_AU_SIZE = 496,
    SG_LOGITEM_VALIDATE_DRAW_RENDERPASS_EXPECTED = 497,
    SG_LOGITEM_VALIDATE_DRAW_BASEELEMENT_GE_ZERO = 498,
    SG_LOGITEM_VALIDATE_DRAW_NUMELEMENTS_GE_ZERO = 499,
    SG_LOGITEM_VALIDATE_DRAW_NUMINSTANCES_GE_ZERO = 500,
    SG_LOGITEM_VALIDATE_DRAW_EX_RENDERPASS_EXPECTED = 501,
    SG_LOGITEM_VALIDATE_DRAW_EX_BASEELEMENT_GE_ZERO = 502,
    SG_LOGITEM_VALIDATE_DRAW_EX_NUMELEMENTS_GE_ZERO = 503,
    SG_LOGITEM_VALIDATE_DRAW_EX_NUMINSTANCES_GE_ZERO = 504,
    SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_GE_ZERO = 505,
    SG_LOGITEM_VALIDATE_DRAW_EX_BASEVERTEX_VS_INDEXED = 506,
    SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_VS_INSTANCED = 507,
    SG_LOGITEM_VALIDATE_DRAW_EX_BASEVERTEX_NOT_SUPPORTED = 508,
    SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_NOT_SUPPORTED = 509,
    SG_LOGITEM_VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING = 510,
    SG_LOGITEM_VALIDATE_DRAW_WRITE_BUFFER_TRANSIENT_MISSING = 511,
    SG_LOGITEM_VALIDATE_DRAW_WRITE_IMAGE_TRANSIENT_MISSING = 512,
    SG_LOGITEM_VALIDATE_DISPATCH_COMPUTEPASS_EXPECTED = 513,
    SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSX = 514,
    SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSY = 515,
    SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSZ = 516,
    SG_LOGITEM_VALIDATE_DISPATCH_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING = 517,
    SG_LOGITEM_VALIDATE_DISPATCH_WRITE_BUFFER_TRANSIENT_MISSING = 518,
    SG_LOGITEM_VALIDATE_DISPATCH_WRITE_IMAGE_TRANSIENT_MISSING = 519,
    SG_LOGITEM_VALIDATE_WRITEBUFFERUNSEALED_USAGE = 520,
    SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_USAGE = 521,
    SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_WRITE_BEFORE_BIND = 522,
    SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_WRITE_BEFORE_COPY = 523,
    SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_DST_OFFSET_ALIGNMENT = 524,
    SG_LOGITEM_VALIDATE_WRITEBUFFER_SRC_DATA_POINTER = 525,
    SG_LOGITEM_VALIDATE_WRITEBUFFER_SRC_DATA_SIZE = 526,
    SG_LOGITEM_VALIDATE_WRITEBUFFER_SIZE = 527,
    SG_LOGITEM_VALIDATE_WRITEBUFFER_WRITE_OVERFLOW = 528,
    SG_LOGITEM_VALIDATE_WRITEBUFFER_READ_OVERFLOW = 529,
    SG_LOGITEM_VALIDATE_WRITEIMAGEUNSEALED_USAGE = 530,
    SG_LOGITEM_VALIDATE_WRITEIMAGETRANSIENT_USAGE = 531,
    SG_LOGITEM_VALIDATE_WRITEIMAGETRANSIENT_WRITE_BEFORE_BIND = 532,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_SRC_DATA_POINTER = 533,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_SRC_DATA_SIZE = 534,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERROW = 535,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERSLICE = 536,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERROW_TOO_SMALL = 537,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERSLICE_TOO_SMALL = 538,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_MIPLEVEL = 539,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_WIDTH = 540,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_HEIGHT = 541,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_NUMSLICES = 542,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_READ_OVERFLOW = 543,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_X_RANGE = 544,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_Y_RANGE = 545,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_SLICE_RANGE = 546,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_WIDTH_OVERFLOW = 547,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_HEIGHT_OVERFLOW = 548,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_NUMSLICES_OVERFLOW = 549,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_X_ALIGNMENT = 550,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_Y_ALIGNMENT = 551,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_WIDTH_MULTIPLE = 552,
    SG_LOGITEM_VALIDATE_WRITEIMAGE_HEIGHT_MULTIPLE = 553,
    SG_LOGITEM_VALIDATE_SEALBUFFER_RESOURCESTATE = 554,
    SG_LOGITEM_VALIDATE_SEALIMAGE_RESOURCESTATE = 555,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_INSIDE_PASS = 556,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_VS_DST_BUFFER = 557,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_COPY_SRC = 558,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_COPY_DST = 559,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_ZERO_SIZE = 560,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_OFFSET_ALIGNMENT = 561,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_DST_OFFSET_ALIGNMENT = 562,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_OVERFLOW = 563,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_DST_OVERFLOW = 564,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_WEBGL2_INDEX_BUFFER = 565,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_WEBGL2_INDEX_BUFFER = 566,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_TOO_SMALL = 567,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERSLICE_TOO_SMALL = 568,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_STAGING_INDEX_BUFFER = 569,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_STAGING_BUFFER = 570,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_INSIDE_PASS = 571,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_COPY_SRC = 572,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_COPY_DST = 573,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_OFFSET_ALIGNMENT = 574,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_MULTIPLE_BLOCKSIZE = 575,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_MULTIPLE_256 = 576,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERSLICE = 577,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_OVERFLOW = 578,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_MIPLEVEL = 579,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH = 580,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT = 581,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH_MULTIPLE = 582,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT_MULTIPLE = 583,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_NUMSLICES = 584,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_X_RANGE = 585,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_Y_RANGE = 586,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_X_ALIGNMENT = 587,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_Y_ALIGNMENT = 588,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_SLICE_RANGE = 589,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH_OVERFLOW = 590,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT_OVERFLOW = 591,
    SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_NUMSLICES_OVERFLOW = 592,
    SG_LOGITEM_VALIDATION_FAILED = 593,
}

enum __enum__SG_STRING_SIZE {
    _SG_STRING_SIZE = 32,
    _SG_SLOT_SHIFT = 16,
    _SG_SLOT_MASK = 65535,
    _SG_MAX_POOL_SIZE = 65536,
    _SG_DEFAULT_BUFFER_POOL_SIZE = 128,
    _SG_DEFAULT_IMAGE_POOL_SIZE = 128,
    _SG_DEFAULT_SAMPLER_POOL_SIZE = 64,
    _SG_DEFAULT_SHADER_POOL_SIZE = 32,
    _SG_DEFAULT_PIPELINE_POOL_SIZE = 64,
    _SG_DEFAULT_VIEW_POOL_SIZE = 256,
    _SG_DEFAULT_UB_SIZE = 4194304,
    _SG_DEFAULT_MAX_COMMIT_LISTENERS = 1024,
    _SG_DEFAULT_WGPU_BINDGROUP_CACHE_SIZE = 1024,
    _SG_DEFAULT_VK_COPY_STAGING_SIZE = 4194304,
    _SG_DEFAULT_VK_TRANSIENT_STAGING_SIZE = 16777216,
    _SG_DEFAULT_VK_DESCRIPTOR_BUFFER_SIZE = 16777216,
    _SG_MAX_STORAGEBUFFER_BINDINGS_PER_STAGE = 32,
    _SG_MAX_STORAGEIMAGE_BINDINGS_PER_STAGE = 32,
    _SG_MAX_TEXTURE_BINDINGS_PER_STAGE = 32,
    _SG_MAX_UNIFORMBLOCK_BINDINGS_PER_STAGE = 8,
}

enum _sg_gl_gpudirty_t {
    _SG_GL_GPUDIRTY_VERTEXBUFFER = 1,
    _SG_GL_GPUDIRTY_INDEXBUFFER = 2,
    _SG_GL_GPUDIRTY_STORAGEBUFFER = 4,
    _SG_GL_GPUDIRTY_TEXTURE = 8,
    _SG_GL_GPUDIRTY_STORAGEIMAGE = 16,
    _SG_GL_GPUDIRTY_ATTACHMENT = 32,
    _SG_GL_GPUDIRTY_BUFFER_ALL = 7,
    _SG_GL_GPUDIRTY_IMAGE_ALL = 56,
}

type _sg_sref_t = _sg_sref_s;
type _sg_buffer_ref_t = _sg_buffer_ref_s;
type _sg_image_ref_t = _sg_image_ref_s;
type _sg_shader_ref_t = _sg_shader_ref_s;
type _sg_pipeline_ref_t = _sg_pipeline_ref_s;
type _sg_view_ref_t = _sg_view_ref_s;
type _sg_gl_buffer_t = _sg_buffer_s;
type _sg_buffer_t = _sg_gl_buffer_t;
type _sg_gl_image_t = _sg_image_s;
type _sg_image_t = _sg_gl_image_t;
type _sg_gl_sampler_t = _sg_sampler_s;
type _sg_sampler_t = _sg_gl_sampler_t;
type _sg_gl_shader_t = _sg_shader_s;
type _sg_shader_t = _sg_gl_shader_t;
type _sg_gl_pipeline_t = _sg_pipeline_s;
type _sg_pipeline_t = _sg_gl_pipeline_t;
type _sg_gl_view_t = _sg_view_s;
type _sg_view_t = _sg_gl_view_t;
type _sg_pools_t = _sg_pools_s;
/*
    sapp_touchpoint

    Describes a single touchpoint in a multitouch event (TOUCHES_BEGAN,
    TOUCHES_MOVED, TOUCHES_ENDED).

    Touch points are stored in the nested array sapp_event.touches[],
    and the number of touches is stored in sapp_event.num_touches.
*/
struct sapp_touchpoint {
    u64 identifier;
    f32 pos_x;
    f32 pos_y;
    i32 android_tooltype;
    bool changed;
}

/*
    sapp_event

    This is an all-in-one event struct passed to the event handler
    user callback function. Note that it depends on the event
    type what struct fields actually contain useful values, so you
    should first check the event type before reading other struct
    fields.
*/
struct sapp_event {
    u64 frame_count;
    i32 type;
    i32 key_code;
    u32 char_code;
    bool key_repeat;
    u32 modifiers;
    i32 mouse_button;
    f32 mouse_x;
    f32 mouse_y;
    f32 mouse_dx;
    f32 mouse_dy;
    f32 scroll_x;
    f32 scroll_y;
    i32 num_touches;
    sapp_touchpoint[8] touches;
    i32 window_width;
    i32 window_height;
    i32 framebuffer_width;
    i32 framebuffer_height;
}

/*
    sg_range

    A general pointer/size-pair struct and constructor macros for passing binary blobs
    into sokol_app.h.
*/
struct sapp_range {
    void* ptr;
    u64 size;
}

// disabling this for every includer isn't great, but the warnings are also quite pointless
/*
    sapp_image_desc

    This is used to describe image data to sokol_app.h (window icons and cursor images).

    The pixel format is RGBA8.

    cursor_hotspot_x and _y are used only for cursors, to define which pixel
    of the image should be aligned with the mouse position.
*/
struct sapp_image_desc {
    i32 width;
    i32 height;
    i32 cursor_hotspot_x;
    i32 cursor_hotspot_y;
    sapp_range pixels;
}

/*
    sapp_icon_desc

    An icon description structure for use in sapp_desc.icon and
    sapp_set_icon().

    When setting a custom image, the application can provide a number of
    candidates differing in size, and sokol_app.h will pick the image(s)
    closest to the size expected by the platform's window system.

    To set sokol-app's default icon, set .sokol_default to true.

    Otherwise provide candidate images of different sizes in the
    images[] array.

    If both the sokol_default flag is set to true, any image candidates
    will be ignored and the sokol_app.h default icon will be set.
*/
struct sapp_icon_desc {
    bool sokol_default;
    sapp_image_desc[8] images;
}

/*
    sapp_allocator

    Used in sapp_desc to provide custom memory-alloc and -free functions
    to sokol_app.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
struct sapp_allocator {
    fn(u64, void*): void* alloc_fn;
    fn(void*, void*): void free_fn;
    void* user_data;
}

/*
    sapp_environment

    Used to provide runtime environment information to the
    outside world (like default pixel formats and the backend
    3D API device pointer) via a call to sapp_get_environment().

    NOTE: when using sokol_gfx.h, don't assume that sapp_environment
    is binary compatible with sg_environment! Always use a translation
    function like sglue_environment() to populate sg_environment
    from sapp_environment!
*/
struct sapp_environment_defaults {
    i32 color_format;
    i32 depth_format;
    i32 sample_count;
}

struct sapp_metal_environment {
    void* device;
}

struct sapp_d3d11_environment {
    void* device;
    void* device_context;
}

struct sapp_wgpu_environment {
    void* device;
}

struct sapp_vulkan_environment {
    void* instance;
    void* physical_device;
    void* device;
    void* queue;
    u32 queue_family_index;
}

struct sapp_environment {
    sapp_environment_defaults defaults;
    sapp_metal_environment metal;
    sapp_d3d11_environment d3d11;
    sapp_wgpu_environment wgpu;
    sapp_vulkan_environment vulkan;
}

/*
    sapp_swapchain

    Provides swapchain information for the next swapchain render pass,
    result of sapp_acquire_swapchain()

    NOTE: sapp_acquire_swapchain() must be called exactly once per frame,
    and ideally right before the swapchain render pass (e.g. not earlier
    in the frame).

    NOTE: when using sokol_gfx.h, don't assume that the sapp_swapchain struct
    has the same memory layout as sg_swapchain! Use the sokol_log.h helper
    function sglue_swapchain() to translate sapp_swapchain into a
    sg_swapchain instead.
*/
struct sapp_metal_swapchain {
    void* current_drawable;
    void* depth_stencil_texture;
    void* msaa_color_texture;
}

struct sapp_d3d11_swapchain {
    void* render_view;
    void* resolve_view;
    void* depth_stencil_view;
}

struct sapp_wgpu_swapchain {
    void* render_view;
    void* resolve_view;
    void* depth_stencil_view;
}

struct sapp_vulkan_swapchain {
    void* render_image;
    void* render_view;
    void* resolve_image;
    void* resolve_view;
    void* depth_stencil_image;
    void* depth_stencil_view;
    void* render_finished_semaphore;
    void* present_complete_semaphore;
}

struct sapp_gl_swapchain {
    u32 framebuffer;
}

struct sapp_swapchain {
    bool invalid;
    i32 width;
    i32 height;
    i32 sample_count;
    i32 color_format;
    i32 depth_format;
    sapp_metal_swapchain metal;
    sapp_d3d11_swapchain d3d11;
    sapp_wgpu_swapchain wgpu;
    sapp_vulkan_swapchain vulkan;
    sapp_gl_swapchain gl;
}

/*
    sapp_logger

    Used in sapp_desc to provide a logging function. Please be aware that
    without logging function, sokol-app will be completely silent, e.g. it will
    not report errors or warnings. For maximum error verbosity, compile in
    debug mode (e.g. NDEBUG *not* defined) and install a logger (for instance
    the standard logging function from sokol_log.h).
*/
struct sapp_logger {
    fn(u8*, u32, u32, u8*, u32, u8*, void*): void func;
    void* user_data;
}

/*
    sokol-app initialization options, used as return value of sokol_main()
    or sapp_run() argument.
*/
struct sapp_gl_desc {
    i32 major_version;
    i32 minor_version;
}

struct sapp_win32_desc {
    bool console_utf8;
    bool console_create;
    bool console_attach;
}

struct sapp_html5_desc {
    u8* canvas_selector;
    bool canvas_resize;
    bool preserve_drawing_buffer;
    bool ask_leave_site;
    bool update_document_title;
    bool bubble_mouse_events;
    bool bubble_touch_events;
    bool bubble_wheel_events;
    bool bubble_key_events;
    bool bubble_char_events;
    bool use_emsc_set_main_loop;
    bool emsc_set_main_loop_simulate_infinite_loop;
}

struct sapp_ios_desc {
    bool keyboard_resizes_canvas;
}

struct sapp_metal_desc {
    bool disable_display_sync;
}

struct sapp_android_desc {
    fn(void*): bool native_event_cb;
}

struct sapp_desc {
    fn(): void init_cb;
    fn(): void frame_cb;
    fn(): void cleanup_cb;
    fn(sapp_event*): void event_cb;
    void* user_data;
    fn(void*): void init_userdata_cb;
    fn(void*): void frame_userdata_cb;
    fn(void*): void cleanup_userdata_cb;
    fn(sapp_event*, void*): void event_userdata_cb;
    i32 width;
    i32 height;
    i32 depth_format;
    i32 composite_mode;
    i32 sample_count;
    i32 swap_interval;
    bool srgb;
    bool hdr;
    bool disable_vsync;
    bool high_dpi;
    bool fullscreen;
    bool maximized;
    u8* window_title;
    bool enable_clipboard;
    i32 clipboard_size;
    bool enable_dragndrop;
    i32 max_dropped_files;
    i32 max_dropped_file_path_length;
    sapp_icon_desc icon;
    sapp_allocator allocator;
    sapp_logger logger;
    sapp_gl_desc gl;
    sapp_metal_desc metal;
    sapp_win32_desc win32;
    sapp_html5_desc html5;
    sapp_ios_desc ios;
    sapp_android_desc android;
}

struct sapp_html5_fetch_response {
    bool succeeded;
    i32 error_code;
    i32 file_index;
    sapp_range data;
    sapp_range buffer;
    void* user_data;
}

struct sapp_html5_fetch_request {
    i32 dropped_file_index;
    fn(sapp_html5_fetch_response*): void callback;
    sapp_range buffer;
    void* user_data;
}

// ███████ ██████   █████  ███    ███ ███████     ████████ ██ ███    ███ ██ ███    ██  ██████
// ██      ██   ██ ██   ██ ████  ████ ██             ██    ██ ████  ████ ██ ████   ██ ██
// █████   ██████  ███████ ██ ████ ██ █████          ██    ██ ██ ████ ██ ██ ██ ██  ██ ██   ███
// ██      ██   ██ ██   ██ ██  ██  ██ ██             ██    ██ ██  ██  ██ ██ ██  ██ ██ ██    ██
// ██      ██   ██ ██   ██ ██      ██ ███████        ██    ██ ██      ██ ██ ██   ████  ██████
//
// >>frame timing
struct _sapp_timestamp_t {
    i32 _dummy;
}

struct _sapp_timing_t {
    _sapp_timestamp_t timestamp;
    f64 dt_min;
    f64 dt_max;
    f64 dt_threshold;
    f64 alpha;
    f64 last;
    f64 dt;
    f64 ema;
    f64 smooth_dt;
}

// ███████ ████████ ██████  ██    ██  ██████ ████████ ███████
// ██         ██    ██   ██ ██    ██ ██         ██    ██
// ███████    ██    ██████  ██    ██ ██         ██    ███████
//      ██    ██    ██   ██ ██    ██ ██         ██         ██
// ███████    ██    ██   ██  ██████   ██████    ██    ███████
//
// >> structs
struct _sapp_emsc_t {
    bool mouse_lock_requested;
    u16 mouse_buttons;
}

struct _sapp_gl_t {
    u32 framebuffer;
}

struct _sapp_clipboard_t {
    bool enabled;
    i32 buf_size;
    u8* buffer;
}

struct _sapp_drop_t {
    bool enabled;
    i32 max_files;
    i32 max_path_length;
    i32 num_files;
    i32 buf_size;
    u8* buffer;
}

struct _sapp_mouse_t {
    f32 x;
    f32 y;
    f32 dx;
    f32 dy;
    bool shown;
    bool locked;
    bool pos_valid;
    i32 current_cursor;
}

struct _sapp_t {
    sapp_desc desc;
    bool valid;
    bool fullscreen;
    bool first_frame;
    bool init_called;
    bool cleanup_called;
    bool quit_requested;
    bool quit_ordered;
    bool event_consumed;
    bool html5_ask_leave_site;
    bool onscreen_keyboard_shown;
    i32 window_width;
    i32 window_height;
    i32 framebuffer_width;
    i32 framebuffer_height;
    f32 dpi_scale;
    u64 frame_count;
    sapp_event event;
    _sapp_mouse_t mouse;
    _sapp_clipboard_t clipboard;
    _sapp_drop_t drop;
    sapp_icon_desc default_icon_desc;
    u32* default_icon_pixels;
    _sapp_timing_t timing;
    _sapp_emsc_t emsc;
    _sapp_gl_t gl;
    u8[128] html5_canvas_selector;
    u8[128] window_title;
    i32[128] window_title_wide;
    i32[512] keycodes;
    bool[27] custom_cursor_bound;
}

/*
    Resource id typedefs:

    sg_buffer:      vertex- and index-buffers
    sg_image:       images used as textures and render-pass attachments
    sg_sampler      sampler objects describing how a texture is sampled in a shader
    sg_shader:      vertex- and fragment-shaders and shader interface information
    sg_pipeline:    associated shader and vertex-layouts, and render states
    sg_view:        a resource view object used for bindings and render-pass attachments

    Instead of pointers, resource creation functions return a 32-bit
    handle which uniquely identifies the resource object.

    The 32-bit resource id is split into a 16-bit pool index in the lower bits,
    and a 16-bit 'generation counter' in the upper bits. The index allows fast
    pool lookups, and combined with the generation-counter it allows to detect
    'dangling accesses' (trying to use an object which no longer exists, and
    its pool slot has been reused for a new object)

    The resource ids are wrapped into a strongly-typed struct so that
    trying to pass an incompatible resource id is a compile error.
*/
struct sg_buffer {
    u32 id;
}

struct sg_image {
    u32 id;
}

struct sg_sampler {
    u32 id;
}

struct sg_shader {
    u32 id;
}

struct sg_pipeline {
    u32 id;
}

struct sg_view {
    u32 id;
}

/*
    sg_range is a pointer-size-pair struct used to pass memory blobs into
    sokol-gfx. When initialized from a value type (array or struct), you can
    use the SG_RANGE() macro to build an sg_range struct. For functions which
    take either a sg_range pointer, or a (C++) sg_range reference, use the
    SG_RANGE_REF macro as a solution which compiles both in C and C++.
*/
struct sg_range {
    void* ptr;
    u64 size;
}

/*
    sg_color

    An RGBA color value.
*/
struct sg_color {
    f32 r;
    f32 g;
    f32 b;
    f32 a;
}

/*
    Runtime information about a pixel format, returned by sg_query_pixelformat().
*/
struct sg_pixelformat_info {
    bool sample;
    bool filter;
    bool render;
    bool blend;
    bool msaa;
    bool depth;
    bool compressed;
    bool read;
    bool write;
    i32 bytes_per_pixel;
}

/*
    Runtime information about available optional features, returned by sg_query_features()
*/
struct sg_features {
    bool origin_top_left;
    bool image_clamp_to_border;
    bool mrt_independent_blend_state;
    bool mrt_independent_write_mask;
    bool compute;
    bool msaa_texture_bindings;
    bool separate_buffer_types;
    bool draw_base_vertex;
    bool draw_base_instance;
    bool dual_source_blending;
    bool vertexformat_int10_n2;
    bool copy_buffer_to_image_relaxed_buffer_type;
    bool copy_buffer_to_image_relaxed_bytes_per_row;
    bool gl_texture_views;
}

/*
    Runtime information about resource limits, returned by sg_query_limit()
*/
struct sg_limits {
    i32 max_image_size_2d;
    i32 max_image_size_cube;
    i32 max_image_size_3d;
    i32 max_image_size_array;
    i32 max_image_array_layers;
    i32 max_vertex_attrs;
    i32 max_color_attachments;
    i32 max_texture_bindings_per_stage;
    i32 max_storage_buffer_bindings_per_stage;
    i32 max_storage_image_bindings_per_stage;
    i32 gl_max_vertex_uniform_components;
    i32 gl_max_combined_texture_image_units;
    i32 d3d11_max_unordered_access_views;
    i32 vk_min_uniform_buffer_offset_alignment;
}

/*
    sg_pass_action

    The sg_pass_action struct defines the actions to be performed
    at the start and end of a render pass.

    - at the start of the pass: whether the render attachments should be cleared,
      loaded with their previous content, or start in an undefined state
    - for clear operations: the clear value (color, depth, or stencil values)
    - at the end of the pass: whether the rendering result should be
      stored back into the render attachment or discarded
*/
struct sg_color_attachment_action {
    i32 load_action;
    i32 store_action;
    sg_color clear_value;
}

struct sg_depth_attachment_action {
    i32 load_action;
    i32 store_action;
    f32 clear_value;
}

struct sg_stencil_attachment_action {
    i32 load_action;
    i32 store_action;
    u8 clear_value;
}

struct sg_pass_action {
    sg_color_attachment_action[8] colors;
    sg_depth_attachment_action depth;
    sg_stencil_attachment_action stencil;
}

/*
    sg_swapchain

    Used in sg_begin_pass() to provide details about an external swapchain
    (pixel formats, sample count and backend-API specific render surface objects).

    The following information must be provided:

    - the width and height of the swapchain surfaces in number of pixels,
    - the pixel format of the render- and optional msaa-resolve-surface
    - the pixel format of the optional depth- or depth-stencil-surface
    - the MSAA sample count for the render and depth-stencil surface

    If the pixel formats and MSAA sample counts are left zero-initialized,
    their defaults are taken from the sg_environment struct provided in the
    sg_setup() call.

    The width and height *must* be > 0.

    The boolean `sg_swapchain.invalid` is used to communicate an invalid
    swapchain state to sokol-gfx (for instance the swapchain code outside of
    sokol-gfx not being able to create swapchain surfaces). When the .invalid
    boolean is set to true, all other sg_swapchain struct items must be zeroed
    (checked in the validation layer), and all rendering in this swapchain-pass
    will be silently skipped.

    For valid swapchains, the following backend API specific objects must be passed in
    as 'type erased' void pointers:

    GL:
        - on all GL backends, a GL framebuffer object must be provided. This
          can be zero for the default framebuffer.

    D3D11:
        - an ID3D11RenderTargetView for the rendering surface, without
          MSAA rendering this surface will also be displayed
        - an optional ID3D11DepthStencilView for the depth- or depth/stencil
          buffer surface
        - when MSAA rendering is used, another ID3D11RenderTargetView
          which serves as MSAA resolve target and will be displayed

    WebGPU (same as D3D11, except different types)
        - a WGPUTextureView for the rendering surface, without
          MSAA rendering this surface will also be displayed
        - an optional WGPUTextureView for the depth- or depth/stencil
          buffer surface
        - when MSAA rendering is used, another WGPUTextureView
          which serves as MSAA resolve target and will be displayed

    Metal (NOTE that the roles of provided surfaces is slightly different
    than on D3D11 or WebGPU in case of MSAA vs non-MSAA rendering):

        - A current CAMetalDrawable (NOT an MTLDrawable!) which will be presented.
          This will either be rendered to directly (if no MSAA is used), or serve
          as MSAA-resolve target.
        - an optional MTLTexture for the depth- or depth-stencil buffer
        - an optional multisampled MTLTexture which serves as intermediate
          rendering surface which will then be resolved into the
          CAMetalDrawable.

    NOTE that for Metal you must use an ObjC __bridge cast to
    properly tunnel the ObjC object id through a C void*, e.g.:

        swapchain.metal.current_drawable = (__bridge const void*) [mtkView currentDrawable];

    On all other backends you shouldn't need to mess with the reference count.

    It's a good practice to write a helper function which returns an initialized
    sg_swapchain struct, which can then be plugged directly into
    sg_pass.swapchain. Look at the function sglue_swapchain() in the sokol_glue.h
    as an example.
*/
struct sg_metal_swapchain {
    void* current_drawable;
    void* depth_stencil_texture;
    void* msaa_color_texture;
}

struct sg_d3d11_swapchain {
    void* render_view;
    void* resolve_view;
    void* depth_stencil_view;
}

struct sg_wgpu_swapchain {
    void* render_view;
    void* resolve_view;
    void* depth_stencil_view;
}

struct sg_vulkan_swapchain {
    void* render_image;
    void* render_view;
    void* resolve_image;
    void* resolve_view;
    void* depth_stencil_image;
    void* depth_stencil_view;
    void* render_finished_semaphore;
    void* present_complete_semaphore;
}

struct sg_gl_swapchain {
    u32 framebuffer;
}

struct sg_swapchain {
    bool invalid;
    i32 width;
    i32 height;
    i32 sample_count;
    i32 color_format;
    i32 depth_format;
    sg_metal_swapchain metal;
    sg_d3d11_swapchain d3d11;
    sg_wgpu_swapchain wgpu;
    sg_vulkan_swapchain vulkan;
    sg_gl_swapchain gl;
}

/*
    sg_attachments

    Used in sg_pass to provide render pass attachment views. Each
    type of pass attachment has it corresponding view type:

    sg_attachments.colors[]:
        populate with color-attachment views, e.g.:

        sg_make_view(&(sg_view_desc){
            .color_attachment = { ... },
        });

    sg_attachments.resolves[]:
        populate with resolve-attachment views, e.g.:

        sg_make_view(&(sg_view_desc){
            .resolve_attachment = { ... },
        });

    sg_attachments.depth_stencil:
        populate with depth-stencil-attachment views, e.g.:

        sg_make_view(&(sg_view_desc){
            .depth_stencil_attachment = { ... },
        });
*/
struct sg_attachments {
    sg_view[8] colors;
    sg_view[8] resolves;
    sg_view depth_stencil;
}

/*
    sg_pass

    The sg_pass structure is passed as argument into the sg_begin_pass()
    function.

    For a swapchain render pass, provide an sg_pass_action and sg_swapchain
    struct (for instance via the sglue_swapchain() helper function from
    sokol_glue.h):

        sg_begin_pass(&(sg_pass){
            .action = { ... },
            .swapchain = sglue_swapchain(),
        });

    For an offscreen render pass, provide an sg_pass_action struct with
    attachment view objects:

        sg_begin_pass(&(sg_pass){
            .action = { ... },
            .attachments = {
                .colors = { ... },
                .resolves = { ... },
                .depth_stencil = ...,
            },
        });

    You can also omit the .action object to get default pass action behaviour
    (clear to color=grey, depth=1 and stencil=0).

    For a compute pass, just set the sg_pass.compute boolean to true:

        sg_begin_pass(&(sg_pass){ .compute = true });
*/
struct sg_pass {
    u32 _start_canary;
    bool compute;
    sg_pass_action action;
    sg_attachments attachments;
    sg_swapchain swapchain;
    u8* label;
    u32 _end_canary;
}

/*
    sg_bindings

    The sg_bindings structure defines the resource bindings for
    the next draw call.

    To update the resource bindings, call sg_apply_bindings() with
    a pointer to a populated sg_bindings struct. Note that
    sg_apply_bindings() must be called after sg_apply_pipeline()
    and that bindings are not preserved across sg_apply_pipeline()
    calls, even when the new pipeline uses the same 'bindings layout'.

    A resource binding struct contains:

    - 1..N vertex buffers
    - 1..N vertex buffer offsets
    - 0..1 index buffer
    - 0..1 index buffer offset
    - 0..N resource views (texture-, storage-image, storage-buffer-views)
    - 0..N samplers

    Where 'N' is defined in the following constants:

    - SG_MAX_VERTEXBUFFER_BINDSLOTS
    - SG_MAX_VIEW_BINDSLOTS
    - SG_MAX_SAMPLER_BINDSLOTS

    Note that inside compute passes vertex- and index-buffer-bindings are
    disallowed.

    When using sokol-shdc for shader authoring, the `layout(binding=N)`
    for texture-, storage-image- and storage-buffer-bindings directly
    maps to the views-array index, for instance the following vertex-
    and fragment-shader interface for sokol-shdc:

        @vs vs
        layout(binding=0) uniform vs_params { ... };
        layout(binding=0) readonly buffer ssbo { ... };
        layout(binding=1) uniform texture2D vs_tex;
        layout(binding=0) uniform sampler vs_smp;
        ...
        @end

        @fs fs
        layout(binding=1) uniform fs_params { ... };
        layout(binding=2) uniform texture2D fs_tex;
        layout(binding=1) uniform sampler fs_smp;
        ...
        @end

    ...would map to the following sg_bindings struct:

        const sg_bindings bnd = {
            .vertex_buffers[0] = ...,
            .views[0] = ssbo_view,
            .views[1] = vs_tex_view,
            .views[2] = fs_tex_view,
            .samplers[0] = vs_smp,
            .samplers[1] = fs_smp,
        };

    ...alternatively you can use code-generated slot indices:

        const sg_bindings bnd = {
            .vertex_buffers[0] = ...,
            .views[VIEW_ssbo] = ssbo_view,
            .views[VIEW_vs_tex] = vs_tex_view,
            .views[VIEW_fs_tex] = fs_tex_view,
            .samplers[SMP_vs_smp] = vs_smp,
            .samplers[SMP_fs_smp] = fs_smp,
        };

    Resource bindslots for a specific shader/pipeline may have gaps, and an
    sg_bindings struct may have populated bind slots which are not used by a
    specific shader. This allows to use the same sg_bindings struct across
    different shader variants.

    When not using sokol-shdc, the bindslot indices in the sg_bindings
    struct need to match the per-binding reflection info slot indices
    in the sg_shader_desc struct (for details about that see the
    sg_shader_desc struct documentation).

    The optional buffer offsets can be used to put different unrelated
    chunks of vertex- and/or index-data into the same buffer objects.
*/
struct sg_bindings {
    u32 _start_canary;
    sg_buffer[8] vertex_buffers;
    i32[8] vertex_buffer_offsets;
    sg_buffer index_buffer;
    i32 index_buffer_offset;
    sg_view[32] views;
    sg_sampler[12] samplers;
    u32 _end_canary;
}

/*
    sg_buffer_usage

    Describes how a buffer object is going to be used:

    .vertex_buffer (default: true)
        the buffer will be bound as vertex buffer via sg_bindings.vertex_buffers[]
    .index_buffer (default: false)
        the buffer will be bound as index buffer via sg_bindings.index_buffer
    .storage_buffer (default: false)
        the buffer will be bound as storage buffer via storage-buffer-view
        in sg_bindings.views[]
    .staging_buffer (default: false)
        the buffer cannot be bound as rendering or compute resource and
        can only be used as copy source, used together with .write_transient
        for uploading CPU data into GPU buffers or images via a combination
        of `sg_write_buffer_transient()` followed by `sg_copy_buffer_to_buffer()`
        or `sg_copy_buffer_to_image()`
    .staging_index_buffer (default: false)
        special staging buffer type for WebGL2 for copying data into index
        buffers (in WebGL2 such copies are only allowed between index buffers)
    .write_unsealed (default: false)
        when true, creates an immutable buffer in 'unsealed' resource state,
        unsealed buffers can be populated with data by one or multiple
        `sg_write_buffer_unsealed()` calls before being 'sealed' by
        calling `sg_seal_buffer()` which transitions from 'unsealed'
        to 'valid' resource state
    .write_transient (default: false)
        the buffer is going to be used as destination in
        sg_write_buffer_transient() calls, write-transient buffers are used for
        scenarios where data that's written from the CPU side is consumed in the
        same frame by the GPU-side and doesn't need to survive into the next
        frame
    .copy_src (default: false)
        the buffer is used as source in a sg_copy_buffer_to_buffer()
        or sg_copy_buffer_to_image() call
    .copy_dst (default: false)
        the buffer is used as destination in an sg_copy_buffer_to_buffer() call
*/
struct sg_buffer_usage {
    bool vertex_buffer;
    bool index_buffer;
    bool storage_buffer;
    bool staging_buffer;
    bool staging_index_buffer;
    bool write_unsealed;
    bool write_transient;
    bool copy_src;
    bool copy_dst;
}

/*
    sg_buffer_desc

    Creation parameters for sg_buffer objects, used in the sg_make_buffer() call.

    The default configuration is:

    .size:      0       (*must* be >0 for buffers without data)
    .usage      { .vertex_buffer = true }
    .data.ptr   0
    .data.size  0
    .label      0       (optional string label)

    For immutable buffers which are initialized with initial data,
    keep the .size item zero-initialized, and set the size together with the
    pointer to the initial data in the .data item.

    For buffers without initial data, keep the .data item zero-initialized, and
    set the buffer size in the .size item instead.

    You can also set both size values, but both size values must
    be identical.

    NOTE: Buffers without initial data will have undefined content, e.g.
    do *not* expect the buffer to be zero-initialized!

    ADVANCED TOPIC: Injecting native 3D-API buffers:

    The following struct members allow to inject your own GL, Metal
    or D3D11 buffers into sokol_gfx:

    .gl_buffer
    .mtl_buffer
    .d3d11_buffer
    .wgpu_buffer

    You must still provide all other struct items except the .data item, and
    these must match the creation parameters of the native buffers you provide.

    Note that it is expected that injected buffer have already been
    initialized with content, and the .content member must be 0!

    Also you need to call sg_reset_state_cache() after calling native 3D-API
    functions, and before calling any sokol_gfx function.
*/
struct sg_buffer_desc {
    u32 _start_canary;
    u64 size;
    sg_buffer_usage usage;
    sg_range data;
    u8* label;
    u32 gl_buffer;
    void* mtl_buffer;
    void* d3d11_buffer;
    void* wgpu_buffer;
    u32 _end_canary;
}

/*
    sg_image_usage

    Describes the intended usage of an image object:

    .storage_image (default: false)
        the image can be used as parent resource of a storage-image-view,
        which allows compute shaders to write to the image in a compute
        pass (for read-only access in compute shaders bind the image
        via a texture view instead
    .color_attachment (default: false)
        the image can be used as parent resource of a color-attachment-view,
        which is then passed into sg_begin_pass via sg_pass.attachments.colors[]
        so that fragment shaders can render into the image
    .resolve_attachment (default: false)
        the image can be used as parent resource of a resolve-attachment-view,
        which is then passed into sg_begin_pass via sg_pass.attachments.resolves[]
        as target for an MSAA-resolve operation in sg_end_pass()
    .depth_stencil_attachment (default: false)
        the image can be used as parent resource of a depth-stencil-attachmnet-view
        which is then passes into sg_begin_pass via sg_pass.attachments.depth_stencil
        as depth-stencil-buffer
    .write_unsealed (default: false)
        when true, creates an immutable image in 'unsealed' resource state,
        unsealed images can be populated with data by one or multiple
        `sg_write_image_unsealed()` calls before being 'sealed' by
        calling `sg_seal_image()` which transitions from 'unsealed'
        to 'valid' resource state
    .write_transient (default: false)
        the image is going to be used as destination in
        sg_write_image_transient() calls, write-transient images are used for
        scenarios where data that's written from the CPU side is consumed in the
        same frame by the GPU-side and doesn't need to survive into the next
        frame
    .copy_src (default: false)
        TODO: currently unused, will become useful when the rest of the
        sg_copy_* functions are implemented
    .copy_dst (default: false)
        the image is going to be used as destination in an `sg_copy_buffer_to_image()`
        call
    .immutable (default: true, deprecated)
        the image content cannot be updated from the CPU side
        (but may be updated by the GPU in a render- or compute-pass)

    Note that creating a texture view from the image to be used for
    texture-sampling in vertex-, fragment- or compute-shaders
    is always implicitly allowed.
*/
struct sg_image_usage {
    bool storage_image;
    bool color_attachment;
    bool resolve_attachment;
    bool depth_stencil_attachment;
    bool write_unsealed;
    bool write_transient;
    bool copy_src;
    bool copy_dst;
    bool immutable;
}

/*
    sg_image_data

    Defines the content of an image through an array of sg_range structs, each
    range pointing to the pixel data for one mip-level. For array-, cubemap- and
    3D-images each mip-level contains all slice-surfaces for that mip-level in a
    single tightly packed memory block.

    The size of a single surface in a mip-level for a regular 2D texture
    can be computed via:

        sg_query_surface_pitch(pixel_format, mip_width, mip_height, 1);

    For array- and 3d-images the size of a single miplevel is:

        num_slices * sg_query_surface_pitch(pixel_format, mip_width, mip_height, 1);

    For cubemap-images the size of a single mip-level is:

        6 * sg_query_surface_pitch(pixel_format, mip_width, mip_height, 1);

    The order of cubemap-faces is in a mip-level data chunk is:

        [0] => +X
        [1] => -X
        [2] => +Y
        [3] => -Y
        [4] => +Z
        [5] => -Z

    NOTE: for more flexible resource initialization of immutable images
    also consider the sg_write_image_unsealed() function!
*/
struct sg_image_data {
    sg_range[16] mip_levels;
}

/*
    sg_image_extent

    Defines the size of a region within an image's mip level.
*/
struct sg_image_extent {
    i32 width;
    i32 height;
    i32 num_slices;
}

/*
    sg_image_location

    Describes a source or destination location in an image.
*/
struct sg_image_location {
    sg_image image;
    i32 mip_level;
    i32 x;
    i32 y;
    i32 slice;
}

/*
    sg_write_image_source

    Describes the data to be written from CPU memory into an image:

    .data
        Pointer to and size (in bytes) of the data in CPU memory
    .offset
        Optional offset that's added to data.ptr
    .bytes_per_row
        Optional number of bytes between rows of image data,
        can be left zero-initialized when the image data is tighly packed
        (e.g. no gaps between rows). For uncompressed pixel formats,
        .bytes_per_row must be a multiple of the pixel size in bytes
        (e.g. for RGBA4 a multiple of 4), for compressed pixel formats,
        .bytes_per_row must be a multiple of the compression block
        size in bytes
    .bytes_per_slice
        Optional number of bytes of between the start of array/cubemap/volume
        slices, can be left zero-initialized when the image data is tightly
        packed (e.g. no gaps between slices). Must be a multiple of
        .bytes_per_row

    NOTE: use the helper functions sg_query_row_pitch() and sg_query_surface_pitch()
    to compute values compatible with the .bytes_per_row and .bytes_per_slice
    restrictions.
*/
struct sg_write_image_source {
    sg_range data;
    u64 offset;
    i32 bytes_per_row;
    i32 bytes_per_slice;
}

/*
    sg_write_image_desc

    Describes a write operation into a single mipmap from CPU memory into
    an image object. Parameter of the sg_write_image_*() functions.

    .src
        Defines the location and layout of the source data in CPU memory.
        See documentation of the struct `sg_write_image_source` for details.
    .dst
        Defines the destination image object and the location of the
        destination region to write the data to. See documentation of the
        struct `sg_image_location` for details.
    .size
        Defines the size of the destination region. See the documentation
        of the struct `sg_image_extent` for details.

    Note the following rules for zero-initialized default values:

    .src.bytes_per_row
        Default-zero indicates that the source data is layed out as a tightly
        packed complete mip-map (e.g. when writing data into miplevel 0 of
        a 256x256 RGBA8 image, .src.bytes_per_row will be 1024.
    .src.bytes_per_slice
        Same as above, default-zero indicates that the source data is layed
        out as a tightly packed complete mip-map (e.g. when writing data into
        miplevel 0 of a 256x256 image, .src.bytes_per_slice will be 256*256*4).
    .size.width, .size.height, .size.num_slices
        Default-zero means 'the remaining width, height and num_slices' taking
        .dst.x/y/slice into account. E.g. when .dst.x/y/num_slices are all zero,
        .size.width/height/num_slices for instance for a 256x256 cubemap the
        default sizes are: .width=256, .height=256, .num_slices=6
*/
struct sg_write_image_desc {
    sg_write_image_source src;
    sg_image_location dst;
    sg_image_extent size;
}

/*
    sg_buffer_location

    Describes the source or destination location in a buffer.

    Caveats:
        - .offset must be 4-byte aligned (ensured by the validation layer)
*/
struct sg_buffer_location {
    sg_buffer buffer;
    u64 offset;
}

/*
    sg_buffer_image_location

    A buffer location for image data with row- and surface-pitch.

    Caveats (all checked by the validation layer):
        - .offset must be a multiple of the destination image pixel- or
          compression-block size
        - .bytes_per_row must be a multiple of the destination image's
          per-pixel or per-compression-block size
        - .bytes_per_slice must be a multiple of .bytes_per_row
*/
struct sg_buffer_image_location {
    sg_buffer buffer;
    u64 offset;
    i32 bytes_per_row;
    i32 bytes_per_slice;
}

/*
    sg_write_buffer_source

    Describes the CPU-side source data to be written into a buffer.

    .data
        Pointer to and size of the data in CPU memory
    .offset
        Optional offset that's added to data.ptr
*/
struct sg_write_buffer_source {
    sg_range data;
    u64 offset;
}

/*
    sg_write_buffer_desc

    Describes a write operation into a buffer from CPU memory into
    a buffer object. Parameter of the sg_write_buffer_*() functions.

    .src
        Defines the location of the source data in CPU memory.
        See documentation of the struct `sg_write_buffer_source` for details.
    .dst
        Defines the destination buffer object and offset into the buffer's
        memory.
    .size
        Number of bytes to be copied. When this is default-zero, the
        size will be taken from .src.data.size instead.
*/
struct sg_write_buffer_desc {
    sg_write_buffer_source src;
    sg_buffer_location dst;
    u64 size;
}

/*
    sg_copy_buffer_to_buffer_desc

    Describes a buffer-to-buffer copy operation via sg_copy_buffer_to_buffer()

    .src
        .buffer     the source buffer
        .offset     byte offset into the source buffer
    .dst
        .buffer     the destination buffer
        .offset     byte offset into the destination buffer
    .size           number of bytes to copy (must be > 0)

    Caveats (all checked by the validation layer):
        - sg_copy_buffer_to_buffer() must be called outside a pass
        - the source buffer must have been created with .usage.copy_src
        - the destination buffer must have been created with .usage.copy_dst
        - the source and destination buffer cannot be identical
        - src and dst offset must be 4-byte aligned
        - WebGL2 specific: when copying into an index buffer, the source
          buffer must have been created with .usage.index_buffer or
          .usage.staging_index_buffer (this requirement can be checked
          via `sg_query_features().separate_buffer_types`)
*/
struct sg_copy_buffer_to_buffer_desc {
    sg_buffer_location src;
    sg_buffer_location dst;
    u64 size;
}

/*
    sg_copy_buffer_to_image_desc

    Describes a buffer-to-image copy operation via sg_copy_buffer_to_image():

    .src
        .buffer             the source buffer
        .offset             offset into the buffer
        .bytes_per_row      row pitch in bytes of the source data (default: see below)
        .bytes_per_slice    slice pitch in bytes of the source data (default: see below)
    .dst
        .image              the destination image
        .mip_level          the mip level to copy to
        .x, .y              destination [x,y] coordinate
        .slice              destination array or 3d slice
    .size
        .width              copy region width in pixels
        .height             copy region height in pixels
        .num_slices         number of array or 3d slices to copy

    Note on default values:

        The default values are the same as sg_write_image_desc, which may
        be a bit unintuitive for a copy operation. TL;DR: the defaults
        are for copying a whole, tightly packed mip level into the
        destination image:

        .src.bytes_per_row
            Default is the row pitch of the selected destination image miplevel
            (e.g. *not* computed from the copy-width)
        .src.bytes_per_slice
            Likewise, the default is the slice pitch of the destination image
            mip level (e.g. *not* computed from the copy width and height)
        .size
            The size default is the 'rest after offset' for the destination mip
            level, e.g.:
                .size.width = mip_width - .dst.x
                .size.height = mip_height - .dst.y
                .size.num_slices = mip_depth_or_slices - .dst.slice

    Caveats (all checked by the validation layer or via logged errors and warnings):
        - sg_copy_buffer_to_image() must be called outside a pass
        - for compressed image formats, .size.width and .size.height must be
          a multiple of the compression block size
        - the source buffer must have been created with .usage.copy_src
        - the destination image must have been created with .usage.copy_dst
        - the source buffer type cannot be .usage.staging_index_buffer
        - the source buffer type cannot be .usage.index_buffer when
          `sg_query_features().separate_buffer_types` is true (this is a
           WebGL2 restriction)
        - only .usage.staging_buffer sources are allowed when
          `sg_query_features().copy_buffer_to_image_relaxed_buffer_type` is false
          (this is a D3D11 restriction)
        - when copying from a *non-staging buffer*, .src.bytes_per_row must be a
          multiple of 256 when `sg_query_features().copy_buffer_to_image_relaxed_bytes_per_row`
          is false (this is a WebGPU restriction)
        - 'fuzzy' GL restriction (this is not currently enforced by the validation layer):
          when copying into compressed textures, the source data must be tightly packed
          (e.g. .src.bytes_per_row and .src.bytes_per_slice will be ignored)
        - On the Apple GL/GLES3 backends, when calling `sg_copy_buffer_to_image()`
          from a non-staging buffer, the source buffer offset is ignored because
          of a GL driver bug (which is unlikely to be fixed because
          GL on macOS is long deprecated), sokol_gfx.h will log a one-time message
          when the bug would be triggered. For copying from staging buffers, the
          offset works because of a special workaround in the sokol-gfx GL backend
          (staging buffers are actually heap memory allocations).
*/
struct sg_copy_buffer_to_image_desc {
    sg_buffer_image_location src;
    sg_image_location dst;
    sg_image_extent size;
}

/*
    sg_image_desc

    Creation parameters for sg_image objects, used in the sg_make_image() call.

    The default configuration is:

    .type               SG_IMAGETYPE_2D
    .usage              .immutable = true
    .width              0 (must be set to >0)
    .height             0 (must be set to >0)
    .num_slices         1 (3D textures: depth; array textures: number of layers)
    .num_mipmaps        1
    .pixel_format       SG_PIXELFORMAT_RGBA8 for textures, or sg_desc.environment.defaults.color_format for render targets
    .sample_count       1 for textures, or sg_desc.environment.defaults.sample_count for render targets
    .data               an sg_image_data struct to define the initial content
    .label              0 (optional string label for trace hooks)

    Q: Why is the default sample_count for render targets identical with the
    "default sample count" from sg_desc.environment.defaults.sample_count?

    A: So that it matches the default sample count in pipeline objects. Even
    though it is a bit strange/confusing that offscreen render targets by default
    get the same sample count as 'default swapchains', but it's better that
    an offscreen render target created with default parameters matches
    a pipeline object created with default parameters.

    NOTE:

    Regular images used as texture binding with usage.immutable must be fully
    initialized by providing a valid .data member which points to initialization
    data.

    Images with usage.*_attachment or usage.storage_image must
    *not* be created with initial content. Be aware that the initial
    content of pass attachment and storage images is undefined
    (not guaranteed to be zeroed).

    ADVANCED TOPIC: Injecting native 3D-API textures:

    The following struct members allow to inject your own GL, Metal or D3D11
    textures into sokol_gfx:

    .gl_textures[SG_NUM_INFLIGHT_FRAMES]
    .mtl_textures[SG_NUM_INFLIGHT_FRAMES]
    .d3d11_texture
    .wgpu_texture

    For GL, you can also specify the texture target or leave it empty to use
    the default texture target for the image type (GL_TEXTURE_2D for
    SG_IMAGETYPE_2D etc)

    The same rules apply as for injecting native buffers (see sg_buffer_desc
    documentation for more details).
*/
struct sg_image_desc {
    u32 _start_canary;
    i32 type;
    sg_image_usage usage;
    i32 width;
    i32 height;
    i32 num_slices;
    i32 num_mipmaps;
    i32 pixel_format;
    i32 sample_count;
    sg_image_data data;
    u8* label;
    u32 gl_texture;
    u32 gl_texture_target;
    void* mtl_texture;
    void* d3d11_texture;
    void* wgpu_texture;
    u32 _end_canary;
}

/*
    sg_sampler_desc

    Creation parameters for sg_sampler objects, used in the sg_make_sampler() call

    .min_filter:        SG_FILTER_NEAREST
    .mag_filter:        SG_FILTER_NEAREST
    .mipmap_filter      SG_FILTER_NEAREST
    .wrap_u:            SG_WRAP_REPEAT
    .wrap_v:            SG_WRAP_REPEAT
    .wrap_w:            SG_WRAP_REPEAT (only SG_IMAGETYPE_3D)
    .min_lod            0.0f
    .max_lod            FLT_MAX
    .border_color       SG_BORDERCOLOR_OPAQUE_BLACK
    .compare            SG_COMPAREFUNC_NEVER
    .max_anisotropy     1 (must be 1..16)
*/
struct sg_sampler_desc {
    u32 _start_canary;
    i32 min_filter;
    i32 mag_filter;
    i32 mipmap_filter;
    i32 wrap_u;
    i32 wrap_v;
    i32 wrap_w;
    f32 min_lod;
    f32 max_lod;
    i32 border_color;
    i32 compare;
    u32 max_anisotropy;
    u8* label;
    u32 gl_sampler;
    void* mtl_sampler;
    void* d3d11_sampler;
    void* wgpu_sampler;
    u32 _end_canary;
}

struct sg_shader_function {
    u8* source;
    sg_range bytecode;
    u8* entry;
    u8* d3d11_target;
    u8* d3d11_filepath;
}

struct sg_shader_vertex_attr {
    i32 base_type;
    u8* glsl_name;
    u8* hlsl_sem_name;
    u8 hlsl_sem_index;
}

struct sg_glsl_shader_uniform {
    i32 type;
    u16 array_count;
    u8* glsl_name;
}

struct sg_shader_uniform_block {
    i32 stage;
    u32 size;
    u8 hlsl_register_b_n;
    u8 msl_buffer_n;
    u8 wgsl_group0_binding_n;
    u8 spirv_set0_binding_n;
    i32 layout;
    sg_glsl_shader_uniform[16] glsl_uniforms;
}

struct sg_shader_texture_view {
    i32 stage;
    i32 image_type;
    i32 sample_type;
    bool multisampled;
    u8 hlsl_register_t_n;
    u8 msl_texture_n;
    u8 wgsl_group1_binding_n;
    u8 spirv_set1_binding_n;
}

struct sg_shader_storage_buffer_view {
    i32 stage;
    bool readonly;
    u8 hlsl_register_t_n;
    u8 hlsl_register_u_n;
    u8 msl_buffer_n;
    u8 wgsl_group1_binding_n;
    u8 spirv_set1_binding_n;
    u8 glsl_binding_n;
}

struct sg_shader_storage_image_view {
    i32 stage;
    i32 image_type;
    i32 access_format;
    bool writeonly;
    u8 hlsl_register_u_n;
    u8 msl_texture_n;
    u8 wgsl_group1_binding_n;
    u8 spirv_set1_binding_n;
    u8 glsl_binding_n;
}

struct sg_shader_view {
    sg_shader_texture_view texture;
    sg_shader_storage_buffer_view storage_buffer;
    sg_shader_storage_image_view storage_image;
}

struct sg_shader_sampler {
    i32 stage;
    i32 sampler_type;
    u8 hlsl_register_s_n;
    u8 msl_sampler_n;
    u8 wgsl_group1_binding_n;
    u8 spirv_set1_binding_n;
}

struct sg_shader_texture_sampler_pair {
    i32 stage;
    u8 view_slot;
    u8 sampler_slot;
    u8* glsl_name;
}

struct sg_mtl_shader_threads_per_threadgroup {
    i32 x;
    i32 y;
    i32 z;
}

struct sg_shader_desc {
    u32 _start_canary;
    sg_shader_function vertex_func;
    sg_shader_function fragment_func;
    sg_shader_function compute_func;
    sg_shader_vertex_attr[16] attrs;
    sg_shader_uniform_block[8] uniform_blocks;
    sg_shader_view[32] views;
    sg_shader_sampler[12] samplers;
    sg_shader_texture_sampler_pair[32] texture_sampler_pairs;
    sg_mtl_shader_threads_per_threadgroup mtl_threads_per_threadgroup;
    u8* label;
    u32 _end_canary;
}

/*
    sg_pipeline_desc

    The sg_pipeline_desc struct defines all creation parameters for an
    sg_pipeline object, used as argument to the sg_make_pipeline() function:

    Pipeline objects come in two flavours:

    - render pipelines for use in render passes
    - compute pipelines for use in compute passes

    A compute pipeline only requires a compute shader object but no
    'render state', while a render pipeline requires a vertex/fragment shader
    object and additional render state declarations:

    - the vertex layout for all input vertex buffers
    - a shader object
    - the 3D primitive type (points, lines, triangles, ...)
    - the index type (none, 16- or 32-bit)
    - all the fixed-function-pipeline state (depth-, stencil-, blend-state, etc...)

    If the vertex data has no gaps between vertex components, you can omit
    the .layout.buffers[].stride and layout.attrs[].offset items (leave them
    default-initialized to 0), sokol-gfx will then compute the offsets and
    strides from the vertex component formats (.layout.attrs[].format).
    Please note that ALL vertex attribute offsets must be 0 in order for the
    automatic offset computation to kick in.

    Note that if you use vertex-pulling from storage buffers instead of
    fixed-function vertex input you can simply omit the entire nested .layout
    struct.

    The default configuration is as follows:

    .compute:               false (must be set to true for a compute pipeline)
    .shader:                0 (must be initialized with a valid sg_shader id!)
    .layout:
        .buffers[]:         vertex buffer layouts
            .stride:        0 (if no stride is given it will be computed)
            .step_func      SG_VERTEXSTEP_PER_VERTEX
            .step_rate      1
        .attrs[]:           vertex attribute declarations
            .buffer_index   0 the vertex buffer bind slot
            .offset         0 (offsets can be omitted if the vertex layout has no gaps)
            .format         SG_VERTEXFORMAT_INVALID (must be initialized!)
    .depth:
        .pixel_format:      sg_desc.context.depth_format
        .compare:           SG_COMPAREFUNC_ALWAYS
        .write_enabled:     false
        .bias:              0.0f
        .bias_slope_scale:  0.0f
        .bias_clamp:        0.0f
    .stencil:
        .enabled:           false
        .front/back:
            .compare:       SG_COMPAREFUNC_ALWAYS
            .fail_op:       SG_STENCILOP_KEEP
            .depth_fail_op: SG_STENCILOP_KEEP
            .pass_op:       SG_STENCILOP_KEEP
        .read_mask:         0
        .write_mask:        0
        .ref:               0
    .color_count            1
    .colors[0..color_count]
        .pixel_format       sg_desc.context.color_format
        .write_mask:        SG_COLORMASK_RGBA
        .blend:
            .enabled:           false
            .src_factor_rgb:    SG_BLENDFACTOR_ONE
            .dst_factor_rgb:    SG_BLENDFACTOR_ZERO
            .op_rgb:            SG_BLENDOP_ADD
            .src_factor_alpha:  SG_BLENDFACTOR_ONE
            .dst_factor_alpha:  SG_BLENDFACTOR_ZERO
            .op_alpha:          SG_BLENDOP_ADD
    .primitive_type:            SG_PRIMITIVETYPE_TRIANGLES
    .index_type:                SG_INDEXTYPE_NONE
    .cull_mode:                 SG_CULLMODE_NONE
    .face_winding:              SG_FACEWINDING_CW
    .sample_count:              sg_desc.context.sample_count
    .blend_color:               (sg_color) { 0.0f, 0.0f, 0.0f, 0.0f }
    .alpha_to_coverage_enabled: false
    .label  0       (optional string label for trace hooks)
*/
struct sg_vertex_buffer_layout_state {
    i32 stride;
    i32 step_func;
    i32 step_rate;
}

struct sg_vertex_attr_state {
    i32 buffer_index;
    i32 offset;
    i32 format;
}

struct sg_vertex_layout_state {
    sg_vertex_buffer_layout_state[8] buffers;
    sg_vertex_attr_state[16] attrs;
}

struct sg_stencil_face_state {
    i32 compare;
    i32 fail_op;
    i32 depth_fail_op;
    i32 pass_op;
}

struct sg_stencil_state {
    bool enabled;
    sg_stencil_face_state front;
    sg_stencil_face_state back;
    u8 read_mask;
    u8 write_mask;
    u8 ref;
}

struct sg_depth_state {
    i32 pixel_format;
    i32 compare;
    bool write_enabled;
    f32 bias;
    f32 bias_slope_scale;
    f32 bias_clamp;
}

struct sg_blend_state {
    bool enabled;
    i32 src_factor_rgb;
    i32 dst_factor_rgb;
    i32 op_rgb;
    i32 src_factor_alpha;
    i32 dst_factor_alpha;
    i32 op_alpha;
}

struct sg_color_target_state {
    i32 pixel_format;
    i32 write_mask;
    sg_blend_state blend;
}

struct sg_pipeline_desc {
    u32 _start_canary;
    bool compute;
    sg_shader shader;
    sg_vertex_layout_state layout;
    sg_depth_state depth;
    sg_stencil_state stencil;
    i32 color_count;
    sg_color_target_state[8] colors;
    i32 primitive_type;
    i32 index_type;
    i32 cull_mode;
    i32 face_winding;
    i32 sample_count;
    sg_color blend_color;
    bool alpha_to_coverage_enabled;
    u8* label;
    u32 _end_canary;
}

/*
    sg_view_desc

    Creation params for sg_view objects, passed into sg_make_view() calls.

    View objects are passed into sg_apply_bindings() (for texture-, storage-buffer-
    and storage-image views), and sg_begin_pass() (for color-, resolve-
    and depth-stencil-attachment views).

    The view type is determined by initializing one of the sub-structs of
    sg_view_desc:

    .texture            a texture-view object will be created
        .image          the sg_image parent resource
        .mip_levels     optional mip-level range, keep zero-initialized for the
                        entire mipmap chain
            .base       the first mip level
            .count      number of mip levels, keeping this zero-initialized means
                        'all remaining mip levels'
        .slices         optional slice range, keep zero-initialized to include
                        all slices
            .base       the first slice
            .count      number of slices, keeping this zero-initializied means 'all remaining slices'

    .storage_buffer     a storage-buffer-view object will be created
        .buffer         the sg_buffer parent resource, must have been created
                        with `sg_buffer_desc.usage.storage_buffer = true`
        .offset         optional 256-byte aligned byte-offset into the buffer

    .storage_image      a storage-image-view object will be created
        .image          the sg_image parent resource, must have been created
                        with `sg_image_desc.usage.storage_image = true`
        .mip_level      selects the mip-level for the compute shader to write
        .slice          selects the slice for the compute shader to write

    .color_attachment   a color-attachment-view object will be created
        .image          the sg_image parent resource, must have been created
                        with `sg_image_desc.usage.color_attachment = true`
        .mip_level      selects the mip-level to render into
        .slice          selects the slice to render into

    .resolve_attachment a resolve-attachment-view object will be created
        .image          the sg_image parent resource, must have been created
                        with `sg_image_desc.usage.resolve_attachment = true`
        .mip_level      selects the mip-level to msaa-resolve into
        .slice          selects the slice to msaa-resolve into

    .depth_stencil_attachment   a depth-stencil-attachment-view object will be created
        .image          the sg_image parent resource, must have been created
                        with `sg_image_desc.usage.depth_stencil_attachment = true`
        .mip_level      selects the mip-level to render into
        .slice          selects the slice to render into
*/
struct sg_buffer_view_desc {
    sg_buffer buffer;
    i32 offset;
}

struct sg_image_view_desc {
    sg_image image;
    i32 mip_level;
    i32 slice;
}

struct sg_texture_view_range {
    i32 base;
    i32 count;
}

struct sg_texture_view_desc {
    sg_image image;
    sg_texture_view_range mip_levels;
    sg_texture_view_range slices;
}

struct sg_view_desc {
    u32 _start_canary;
    sg_texture_view_desc texture;
    sg_buffer_view_desc storage_buffer;
    sg_image_view_desc storage_image;
    sg_image_view_desc color_attachment;
    sg_image_view_desc resolve_attachment;
    sg_image_view_desc depth_stencil_attachment;
    u8* label;
    u32 _end_canary;
}

/*
    sg_trace_hooks

    Installable callback functions to keep track of the sokol-gfx calls,
    this is useful for debugging, or keeping track of resource creation
    and destruction.

    Trace hooks are installed with sg_install_trace_hooks(), this returns
    another sg_trace_hooks struct with the previous set of
    trace hook function pointers. These should be invoked by the
    new trace hooks to form a proper call chain.
*/
struct sg_trace_hooks {
    void* user_data;
    fn(void*): void reset_state_cache;
    fn(sg_buffer_desc*, sg_buffer, void*): void make_buffer;
    fn(sg_image_desc*, sg_image, void*): void make_image;
    fn(sg_sampler_desc*, sg_sampler, void*): void make_sampler;
    fn(sg_shader_desc*, sg_shader, void*): void make_shader;
    fn(sg_pipeline_desc*, sg_pipeline, void*): void make_pipeline;
    fn(sg_view_desc*, sg_view, void*): void make_view;
    fn(sg_buffer, void*): void destroy_buffer;
    fn(sg_image, void*): void destroy_image;
    fn(sg_sampler, void*): void destroy_sampler;
    fn(sg_shader, void*): void destroy_shader;
    fn(sg_pipeline, void*): void destroy_pipeline;
    fn(sg_view, void*): void destroy_view;
    fn(sg_write_buffer_desc*, void*): void write_buffer_transient;
    fn(sg_write_image_desc*, void*): void write_image_transient;
    fn(sg_write_buffer_desc*, void*): void write_buffer_unsealed;
    fn(sg_write_image_desc*, void*): void write_image_unsealed;
    fn(sg_buffer, void*): void seal_buffer;
    fn(sg_image, void*): void seal_image;
    fn(sg_copy_buffer_to_buffer_desc*, void*): void copy_buffer_to_buffer;
    fn(sg_copy_buffer_to_image_desc*, void*): void copy_buffer_to_image;
    fn(sg_pass*, void*): void begin_pass;
    fn(i32, i32, i32, i32, bool, void*): void apply_viewport;
    fn(i32, i32, i32, i32, bool, void*): void apply_scissor_rect;
    fn(sg_pipeline, void*): void apply_pipeline;
    fn(sg_bindings*, void*): void apply_bindings;
    fn(i32, sg_range*, void*): void apply_uniforms;
    fn(i32, i32, i32, void*): void draw;
    fn(i32, i32, i32, i32, i32, void*): void draw_ex;
    fn(i32, i32, i32, void*): void dispatch;
    fn(void*): void end_pass;
    fn(void*): void commit;
    fn(sg_buffer, void*): void alloc_buffer;
    fn(sg_image, void*): void alloc_image;
    fn(sg_sampler, void*): void alloc_sampler;
    fn(sg_shader, void*): void alloc_shader;
    fn(sg_pipeline, void*): void alloc_pipeline;
    fn(sg_view, void*): void alloc_view;
    fn(sg_buffer, void*): void dealloc_buffer;
    fn(sg_image, void*): void dealloc_image;
    fn(sg_sampler, void*): void dealloc_sampler;
    fn(sg_shader, void*): void dealloc_shader;
    fn(sg_pipeline, void*): void dealloc_pipeline;
    fn(sg_view, void*): void dealloc_view;
    fn(sg_buffer, sg_buffer_desc*, void*): void init_buffer;
    fn(sg_image, sg_image_desc*, void*): void init_image;
    fn(sg_sampler, sg_sampler_desc*, void*): void init_sampler;
    fn(sg_shader, sg_shader_desc*, void*): void init_shader;
    fn(sg_pipeline, sg_pipeline_desc*, void*): void init_pipeline;
    fn(sg_view, sg_view_desc*, void*): void init_view;
    fn(sg_buffer, void*): void uninit_buffer;
    fn(sg_image, void*): void uninit_image;
    fn(sg_sampler, void*): void uninit_sampler;
    fn(sg_shader, void*): void uninit_shader;
    fn(sg_pipeline, void*): void uninit_pipeline;
    fn(sg_view, void*): void uninit_view;
    fn(sg_buffer, void*): void fail_buffer;
    fn(sg_image, void*): void fail_image;
    fn(sg_sampler, void*): void fail_sampler;
    fn(sg_shader, void*): void fail_shader;
    fn(sg_pipeline, void*): void fail_pipeline;
    fn(sg_view, void*): void fail_view;
    fn(u8*, void*): void push_debug_group;
    fn(void*): void pop_debug_group;
}

/*
    sg_buffer_info
    sg_image_info
    sg_sampler_info
    sg_shader_info
    sg_pipeline_info
    sg_view_info

    These structs contain various internal resource attributes which
    might be useful for debug-inspection. Please don't rely on the
    actual content of those structs too much, as they are quite closely
    tied to sokol_gfx.h internals and may change more frequently than
    the other public API elements.

    The *_info structs are used as the return values of the following functions:

    sg_query_buffer_info()
    sg_query_image_info()
    sg_query_sampler_info()
    sg_query_shader_info()
    sg_query_pipeline_info()
    sg_query_view_info()
*/
struct sg_slot_info {
    i32 state;
    u32 res_id;
    u32 uninit_count;
}

struct sg_buffer_info {
    sg_slot_info slot;
    i32 num_slots;
    i32 active_slot;
}

struct sg_image_info {
    sg_slot_info slot;
    i32 num_slots;
    i32 active_slot;
}

struct sg_sampler_info {
    sg_slot_info slot;
}

struct sg_shader_info {
    sg_slot_info slot;
}

struct sg_pipeline_info {
    sg_slot_info slot;
}

struct sg_view_info {
    sg_slot_info slot;
}

/*
    sg_stats

    Allows to track generic and backend-specific rendering stats,
    obtained via sg_query_stats().
*/
struct sg_frame_stats_gl {
    u32 num_bind_buffer;
    u32 num_active_texture;
    u32 num_bind_texture;
    u32 num_bind_sampler;
    u32 num_bind_image_texture;
    u32 num_use_program;
    u32 num_render_state;
    u32 num_vertex_attrib_pointer;
    u32 num_vertex_attrib_divisor;
    u32 num_enable_vertex_attrib_array;
    u32 num_disable_vertex_attrib_array;
    u32 num_uniform;
    u32 num_memory_barriers;
}

struct sg_frame_stats_d3d11_pass {
    u32 num_om_set_render_targets;
    u32 num_clear_render_target_view;
    u32 num_clear_depth_stencil_view;
    u32 num_resolve_subresource;
}

struct sg_frame_stats_d3d11_pipeline {
    u32 num_rs_set_state;
    u32 num_om_set_depth_stencil_state;
    u32 num_om_set_blend_state;
    u32 num_ia_set_primitive_topology;
    u32 num_ia_set_input_layout;
    u32 num_vs_set_shader;
    u32 num_vs_set_constant_buffers;
    u32 num_ps_set_shader;
    u32 num_ps_set_constant_buffers;
    u32 num_cs_set_shader;
    u32 num_cs_set_constant_buffers;
}

struct sg_frame_stats_d3d11_bindings {
    u32 num_ia_set_vertex_buffers;
    u32 num_ia_set_index_buffer;
    u32 num_vs_set_shader_resources;
    u32 num_vs_set_samplers;
    u32 num_ps_set_shader_resources;
    u32 num_ps_set_samplers;
    u32 num_cs_set_shader_resources;
    u32 num_cs_set_samplers;
    u32 num_cs_set_unordered_access_views;
    u32 num_om_set_rts_and_uavs;
}

struct sg_frame_stats_d3d11_uniforms {
    u32 num_update_subresource;
}

struct sg_frame_stats_d3d11_draw {
    u32 num_draw_indexed_instanced;
    u32 num_draw_indexed;
    u32 num_draw_instanced;
    u32 num_draw;
}

struct sg_frame_stats_d3d11 {
    sg_frame_stats_d3d11_pass pass;
    sg_frame_stats_d3d11_pipeline pipeline;
    sg_frame_stats_d3d11_bindings bindings;
    sg_frame_stats_d3d11_uniforms uniforms;
    sg_frame_stats_d3d11_draw draw;
    u32 num_map;
    u32 num_unmap;
}

struct sg_frame_stats_metal_idpool {
    u32 num_added;
    u32 num_released;
    u32 num_garbage_collected;
}

struct sg_frame_stats_metal_pipeline {
    u32 num_set_blend_color;
    u32 num_set_cull_mode;
    u32 num_set_front_facing_winding;
    u32 num_set_stencil_reference_value;
    u32 num_set_depth_bias;
    u32 num_set_render_pipeline_state;
    u32 num_set_depth_stencil_state;
}

struct sg_frame_stats_metal_bindings {
    u32 num_set_vertex_buffer;
    u32 num_set_vertex_buffer_offset;
    u32 num_skip_redundant_vertex_buffer;
    u32 num_set_vertex_texture;
    u32 num_skip_redundant_vertex_texture;
    u32 num_set_vertex_sampler_state;
    u32 num_skip_redundant_vertex_sampler_state;
    u32 num_set_fragment_buffer;
    u32 num_set_fragment_buffer_offset;
    u32 num_skip_redundant_fragment_buffer;
    u32 num_set_fragment_texture;
    u32 num_skip_redundant_fragment_texture;
    u32 num_set_fragment_sampler_state;
    u32 num_skip_redundant_fragment_sampler_state;
    u32 num_set_compute_buffer;
    u32 num_set_compute_buffer_offset;
    u32 num_skip_redundant_compute_buffer;
    u32 num_set_compute_texture;
    u32 num_skip_redundant_compute_texture;
    u32 num_set_compute_sampler_state;
    u32 num_skip_redundant_compute_sampler_state;
}

struct sg_frame_stats_metal_uniforms {
    u32 num_set_vertex_buffer_offset;
    u32 num_set_fragment_buffer_offset;
    u32 num_set_compute_buffer_offset;
}

struct sg_frame_stats_metal {
    sg_frame_stats_metal_idpool idpool;
    sg_frame_stats_metal_pipeline pipeline;
    sg_frame_stats_metal_bindings bindings;
    sg_frame_stats_metal_uniforms uniforms;
}

struct sg_frame_stats_wgpu_uniforms {
    u32 num_set_bindgroup;
    u32 size_write_buffer;
}

struct sg_frame_stats_wgpu_bindings {
    u32 num_set_vertex_buffer;
    u32 num_skip_redundant_vertex_buffer;
    u32 num_set_index_buffer;
    u32 num_skip_redundant_index_buffer;
    u32 num_create_bindgroup;
    u32 num_discard_bindgroup;
    u32 num_set_bindgroup;
    u32 num_skip_redundant_bindgroup;
    u32 num_bindgroup_cache_hits;
    u32 num_bindgroup_cache_misses;
    u32 num_bindgroup_cache_collisions;
    u32 num_bindgroup_cache_invalidates;
    u32 num_bindgroup_cache_hash_vs_key_mismatch;
}

struct sg_frame_stats_wgpu {
    sg_frame_stats_wgpu_uniforms uniforms;
    sg_frame_stats_wgpu_bindings bindings;
}

struct sg_frame_stats_vk {
    u32 num_cmd_pipeline_barrier;
    u32 num_allocate_memory;
    u32 num_free_memory;
    u32 size_allocate_memory;
    u32 num_delete_queue_added;
    u32 num_delete_queue_collected;
    u32 num_cmd_copy_buffer;
    u32 num_cmd_copy_buffer_to_image;
    u32 num_cmd_set_descriptor_buffer_offsets;
    u32 size_descriptor_buffer_writes;
}

struct sg_frame_resource_stats {
    u32 allocated;
    u32 deallocated;
    u32 inited;
    u32 uninited;
}

struct sg_total_resource_stats {
    u32 alive;
    u32 free;
    u32 allocated;
    u32 deallocated;
    u32 inited;
    u32 uninited;
}

struct sg_total_stats {
    sg_total_resource_stats buffers;
    sg_total_resource_stats images;
    sg_total_resource_stats samplers;
    sg_total_resource_stats views;
    sg_total_resource_stats shaders;
    sg_total_resource_stats pipelines;
}

struct sg_frame_stats {
    u32 frame_index;
    u32 num_passes;
    u32 num_apply_viewport;
    u32 num_apply_scissor_rect;
    u32 num_apply_pipeline;
    u32 num_apply_bindings;
    u32 num_apply_uniforms;
    u32 num_draw;
    u32 num_draw_ex;
    u32 num_dispatch;
    u32 num_write_buffer_transient;
    u32 num_write_image_transient;
    u32 num_write_buffer_unsealed;
    u32 num_write_image_unsealed;
    u32 num_seal_buffer;
    u32 num_seal_image;
    u32 num_copy_buffer_to_buffer;
    u32 num_copy_buffer_to_image;
    u32 size_apply_uniforms;
    u32 size_copy_buffer_to_buffer;
    u32 size_copy_buffer_to_image;
    sg_frame_resource_stats buffers;
    sg_frame_resource_stats images;
    sg_frame_resource_stats samplers;
    sg_frame_resource_stats views;
    sg_frame_resource_stats shaders;
    sg_frame_resource_stats pipelines;
    sg_frame_stats_gl gl;
    sg_frame_stats_d3d11 d3d11;
    sg_frame_stats_metal metal;
    sg_frame_stats_wgpu wgpu;
    sg_frame_stats_vk vk;
}

struct sg_stats {
    sg_frame_stats prev_frame;
    sg_frame_stats cur_frame;
    sg_total_stats total;
}

/*
    sg_desc

    The sg_desc struct contains configuration values for sokol_gfx,
    it is used as parameter to the sg_setup() call.

    The default configuration is:

    .buffer_pool_size                   128
    .image_pool_size                    128
    .sampler_pool_size                  64
    .shader_pool_size                   32
    .pipeline_pool_size                 64
    .view_pool_size                     256
    .uniform_buffer_size                4 MB (4*1024*1024)
    .max_commit_listeners               1024
    .disable_validation                 false
    .metal.force_managed_storage_mode   false
    .metal.use_command_buffer_with_retained_references  false
    .wgpu.disable_bindgroups_cache      false
    .wgpu.bindgroups_cache_size         1024
    .vulkan.copy_staging_buffer_size    4 MB
    .vulkan.transient_staging_buffer_size  16 MB
    .vulkan.descriptor_buffer_size      16 MB

    .allocator.alloc_fn     0 (in this case, malloc() will be called)
    .allocator.free_fn      0 (in this case, free() will be called)
    .allocator.user_data    0

    .environment.defaults.color_format: default value depends on selected backend:
        all GL backends:    SG_PIXELFORMAT_RGBA8
        Metal and D3D11:    SG_PIXELFORMAT_BGRA8
        WebGPU:             *no default* (must be queried from WebGPU swapchain object)
    .environment.defaults.depth_format: SG_PIXELFORMAT_DEPTH_STENCIL
    .environment.defaults.sample_count: 1

    Metal specific:
        (NOTE: All Objective-C object references are transferred through
        a bridged cast (__bridge const void*) to sokol_gfx, which will use an
        unretained bridged cast (__bridge id<xxx>) to retrieve the Objective-C
        references back. Since the bridge cast is unretained, the caller
        must hold a strong reference to the Objective-C object until sg_setup()
        returns.

        .metal.force_managed_storage_mode
            when enabled, Metal buffers and texture resources are created in managed storage
            mode, otherwise sokol-gfx will decide whether to create buffers and
            textures in managed or shared storage mode (this is mainly a debugging option)
        .metal.use_command_buffer_with_retained_references
            when true, the sokol-gfx Metal backend will use Metal command buffers which
            bump the reference count of resource objects as long as they are inflight,
            this is slower than the default command-buffer-with-unretained-references
            method, this may be a workaround when confronted with lifetime validation
            errors from the Metal validation layer until a proper fix has been implemented
        .environment.metal.device
            a pointer to the MTLDevice object

    D3D11 specific:
        .environment.d3d11.device
            a pointer to the ID3D11Device object, this must have been created
            before sg_setup() is called
        .environment.d3d11.device_context
            a pointer to the ID3D11DeviceContext object
        .d3d11.shader_debugging
            set this to true to compile shaders which are provided as HLSL source
            code with debug information and without optimization, this allows
            shader debugging in tools like RenderDoc, to output source code
            instead of byte code from sokol-shdc, omit the `--binary` cmdline
            option

    WebGPU specific:
        .wgpu.disable_bindgroups_cache
            When this is true, the WebGPU backend will create and immediately
            release a BindGroup object in the sg_apply_bindings() call, only
            use this for debugging purposes.
        .wgpu.bindgroups_cache_size
            The size of the bindgroups cache for re-using BindGroup objects
            between sg_apply_bindings() calls. The smaller the cache size,
            the more likely are cache slot collisions which will cause
            a BindGroups object to be destroyed and a new one created.
            Use the information returned by sg_query_stats() to check
            if this is a frequent occurrence, and increase the cache size as
            needed (the default is 1024).
            NOTE: wgpu_bindgroups_cache_size must be a power-of-2 number!
        .environment.wgpu.device
            a WGPUDevice handle

    Vulkan specific:
        .vulkan.copy_staging_buffer_size
            Size of the staging buffer in bytes for uploading the initial
            content of buffers and images and for write-unsealed writes.
            The default is 4 MB, bigger resource updates are split into
            multiple chunks of the staging buffer size
        .vulkan.transient_staging_buffer_size
            Size of the staging buffer in bytes for updating .usage.write_transient
            resources. The default is 16 MB. The size must be big enough
            to accomodate all writes into .usage.write_transient resources.
            Any additional data will cause an error log message and
            incomplete rendering. Note that the actually allocated size
            will be twice as much because the transient-staging-buffer is
            double-buffered.
        .vulkan.descriptor_buffer_size
            Size of the descriptor-upload buffer in bytes. The default
            size is 16 bytes. The size must be big enough to accomodate
            all unifrom-block, view- and sampler-bindings in a single
            frame (assume a worst-case of 256 bytes per binding). Note
            that the actually allocated size will be twice as much
            because the descriptor-buffer is double-buffered.

    When using sokol_gfx.h and sokol_app.h together, consider using the
    helper function sglue_environment() in the sokol_glue.h header to
    initialize the sg_desc.environment nested struct. sglue_environment() returns
    a completely initialized sg_environment struct with information
    provided by sokol_app.h.
*/
struct sg_environment_defaults {
    i32 color_format;
    i32 depth_format;
    i32 sample_count;
}

struct sg_metal_environment {
    void* device;
}

struct sg_d3d11_environment {
    void* device;
    void* device_context;
}

struct sg_wgpu_environment {
    void* device;
}

struct sg_vulkan_environment {
    void* instance;
    void* physical_device;
    void* device;
    void* queue;
    u32 queue_family_index;
}

struct sg_environment {
    sg_environment_defaults defaults;
    sg_metal_environment metal;
    sg_d3d11_environment d3d11;
    sg_wgpu_environment wgpu;
    sg_vulkan_environment vulkan;
}

/*
    sg_commit_listener

    Used with function sg_add_commit_listener() to add a callback
    which will be called in sg_commit(). This is useful for libraries
    building on top of sokol-gfx to be notified about when a frame
    ends (instead of having to guess, or add a manual 'new-frame'
    function.
*/
struct sg_commit_listener {
    fn(void*): void func;
    void* user_data;
}

/*
    sg_allocator

    Used in sg_desc to provide custom memory-alloc and -free functions
    to sokol_gfx.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
struct sg_allocator {
    fn(u64, void*): void* alloc_fn;
    fn(void*, void*): void free_fn;
    void* user_data;
}

/*
    sg_logger

    Used in sg_desc to provide a logging function. Please be aware
    that without logging function, sokol-gfx will be completely
    silent, e.g. it will not report errors, warnings and
    validation layer messages. For maximum error verbosity,
    compile in debug mode (e.g. NDEBUG *not* defined) and provide a
    compatible logger function in the sg_setup() call
    (for instance the standard logging function from sokol_log.h).
*/
struct sg_logger {
    fn(u8*, u32, u32, u8*, u32, u8*, void*): void func;
    void* user_data;
}

struct sg_d3d11_desc {
    bool shader_debugging;
}

struct sg_metal_desc {
    bool force_managed_storage_mode;
    bool use_command_buffer_with_retained_references;
}

struct sg_wgpu_desc {
    bool disable_bindgroups_cache;
    i32 bindgroups_cache_size;
}

struct sg_vulkan_desc {
    i32 copy_staging_buffer_size;
    i32 transient_staging_buffer_size;
    i32 descriptor_buffer_size;
}

struct sg_desc {
    u32 _start_canary;
    i32 buffer_pool_size;
    i32 image_pool_size;
    i32 sampler_pool_size;
    i32 shader_pool_size;
    i32 pipeline_pool_size;
    i32 view_pool_size;
    i32 uniform_buffer_size;
    i32 max_commit_listeners;
    bool disable_validation;
    bool enforce_portable_limits;
    sg_d3d11_desc d3d11;
    sg_metal_desc metal;
    sg_wgpu_desc wgpu;
    sg_vulkan_desc vulkan;
    sg_allocator allocator;
    sg_logger logger;
    sg_environment environment;
    u32 _end_canary;
}

/* Backend-specific structs and functions, these may come in handy for mixing
   sokol-gfx rendering with 'native backend' rendering functions.

   This group of functions will be expanded as needed.
*/
struct sg_d3d11_buffer_info {
    void* buf;
}

struct sg_d3d11_image_info {
    void* tex2d;
    void* tex3d;
    void* res;
}

struct sg_d3d11_sampler_info {
    void* smp;
}

struct sg_d3d11_shader_info {
    void*[8] cbufs;
    void* vs;
    void* fs;
}

struct sg_d3d11_pipeline_info {
    void* il;
    void* rs;
    void* dss;
    void* bs;
}

struct sg_d3d11_view_info {
    void* srv;
    void* uav;
    void* rtv;
    void* dsv;
}

struct sg_mtl_buffer_info {
    void*[2] buf;
    i32 active_slot;
}

struct sg_mtl_image_info {
    void*[2] tex;
    i32 active_slot;
}

struct sg_mtl_sampler_info {
    void* smp;
}

struct sg_mtl_shader_info {
    void* vertex_lib;
    void* fragment_lib;
    void* vertex_func;
    void* fragment_func;
}

struct sg_mtl_pipeline_info {
    void* rps;
    void* dss;
}

struct sg_wgpu_buffer_info {
    void* buf;
}

struct sg_wgpu_image_info {
    void* tex;
}

struct sg_wgpu_sampler_info {
    void* smp;
}

struct sg_wgpu_shader_info {
    void* vs_mod;
    void* fs_mod;
    void* bgl;
}

struct sg_wgpu_pipeline_info {
    void* render_pipeline;
    void* compute_pipeline;
}

struct sg_wgpu_view_info {
    void* view;
}

struct sg_gl_buffer_info {
    u32[2] buf;
    i32 active_slot;
}

struct sg_gl_image_info {
    u32[2] tex;
    u32 tex_target;
    i32 active_slot;
}

struct sg_gl_sampler_info {
    u32 smp;
}

struct sg_gl_shader_info {
    u32 prog;
}

struct sg_gl_view_info {
    u32[2] tex_view;
    u32 msaa_render_buffer;
    u32 msaa_resolve_frame_buffer;
}

// make some GL constants generally available to simplify compilation,
// use of those constants will be filtered by runtime flags
// on WebGL2, GL_FRAMEBUFFER_UNDEFINED technically doesn't exist (it is defined
// in the Emscripten headers, but may not exist in other WebGL2 shims)
// see: https://github.com/floooh/sokol/pull/933
// ███████ ████████ ██████  ██    ██  ██████ ████████ ███████
// ██         ██    ██   ██ ██    ██ ██         ██    ██
// ███████    ██    ██████  ██    ██ ██         ██    ███████
//      ██    ██    ██   ██ ██    ██ ██         ██         ██
// ███████    ██    ██   ██  ██████   ██████    ██    ███████
//
// >>structs
struct _sg_recti_t {
    i32 x;
    i32 y;
    i32 w;
    i32 h;
}

struct _sg_dimi_t {
    i32 width;
    i32 height;
}

// resource pool slots
struct _sg_slot_t {
    u32 id;
    u32 uninit_count;
    i32 state;
}

// resource pool housekeeping struct
struct _sg_pool_t {
    i32 size;
    i32 queue_top;
    u32* gen_ctrs;
    i32* free_queue;
}

// resource hazard tracking struct
struct _sg_track_t {
    i32 num_slots;
    i32 cur_slot;
    u32* slots;
    u32 occupy_num_bytes;
    u8* occupy_bits;
}

// a general resource slot reference useful for caches
struct _sg_sref_s {
    u32 id;
    u32 uninit_count;
}

// safe (in debug mode) internal resource references
struct _sg_buffer_ref_s {
    _sg_buffer_s* ptr;
    _sg_sref_t sref;
}

struct _sg_image_ref_s {
    _sg_image_s* ptr;
    _sg_sref_t sref;
}

struct _sg_sampler_ref_t {
    _sg_sampler_s* ptr;
    _sg_sref_t sref;
}

struct _sg_shader_ref_s {
    _sg_shader_s* ptr;
    _sg_sref_t sref;
}

struct _sg_pipeline_ref_s {
    _sg_pipeline_s* ptr;
    _sg_sref_t sref;
}

struct _sg_view_ref_s {
    _sg_view_s* ptr;
    _sg_sref_t sref;
}

// fixed-size string
struct _sg_str_t {
    u8[32] buf;
}

struct _sg_buffer_common_t {
    i32 size;
    i32 num_slots;
    i32 active_slot;
    u32 write_transient_frame_index;
    struct {
        u32 bind_frame_index;
        u32 copy_src_frame_index;
        u32 read_render_pass_index;
        u32 write_render_pass_index;
    } validate;
    sg_buffer_usage usage;
}

struct _sg_image_common_t {
    i32 num_slots;
    i32 active_slot;
    u32 write_transient_frame_index;
    struct {
        u32 bind_frame_index;
    } validate;
    i32 type;
    i32 width;
    i32 height;
    i32 num_slices;
    i32 num_mipmaps;
    sg_image_usage usage;
    i32 pixel_format;
    i32 sample_count;
    u32 upd_frame_index;
}

struct _sg_sampler_common_t {
    i32 min_filter;
    i32 mag_filter;
    i32 mipmap_filter;
    i32 wrap_u;
    i32 wrap_v;
    i32 wrap_w;
    f32 min_lod;
    f32 max_lod;
    i32 border_color;
    i32 compare;
    u32 max_anisotropy;
}

struct _sg_shader_attr_t {
    i32 base_type;
}

struct _sg_shader_uniform_block_t {
    i32 stage;
    u32 size;
}

struct _sg_shader_view_t {
    i32 stage;
    i32 view_type;
    i32 image_type;
    i32 access_format;
    i32 sample_type;
    bool sbuf_readonly;
    bool simg_writeonly;
    bool multisampled;
}

struct _sg_shader_sampler_t {
    i32 stage;
    i32 sampler_type;
}

struct _sg_shader_texture_sampler_t {
    i32 stage;
    u8 view_slot;
    u8 sampler_slot;
}

struct _sg_shader_common_t {
    u32 required_bindings_and_uniforms;
    bool is_compute;
    _sg_shader_attr_t[16] attrs;
    _sg_shader_uniform_block_t[8] uniform_blocks;
    _sg_shader_view_t[32] views;
    _sg_shader_sampler_t[12] samplers;
    _sg_shader_texture_sampler_t[32] texture_samplers;
}

struct _sg_pipeline_common_t {
    bool[8] vertex_buffer_layout_active;
    bool use_instanced_draw;
    bool is_compute;
    u32 required_bindings_and_uniforms;
    _sg_shader_ref_t shader;
    sg_vertex_layout_state layout;
    sg_depth_state depth;
    sg_stencil_state stencil;
    i32 color_count;
    sg_color_target_state[8] colors;
    i32 primitive_type;
    i32 index_type;
    i32 cull_mode;
    i32 face_winding;
    i32 sample_count;
    sg_color blend_color;
    bool alpha_to_coverage_enabled;
}

struct _sg_buffer_view_common_t {
    _sg_buffer_ref_t ref;
    i32 offset;
}

struct _sg_image_view_common_t {
    _sg_image_ref_t ref;
    i32 mip_level;
    i32 slice;
    i32 mip_level_count;
    i32 slice_count;
}

struct _sg_view_common_t {
    i32 type;
    _sg_buffer_view_common_t buf;
    _sg_image_view_common_t img;
}

struct _sg_buffer_s {
    _sg_slot_t slot;
    _sg_buffer_common_t cmn;
    struct {
        u32[2] buf;
        u8 gpu_dirty_flags;
        bool injected;
    } gl;
}

struct _sg_image_s {
    _sg_slot_t slot;
    _sg_image_common_t cmn;
    struct {
        u32 target;
        u32[2] tex;
        u8 gpu_dirty_flags;
        bool injected;
    } gl;
}

struct _sg_sampler_s {
    _sg_slot_t slot;
    _sg_sampler_common_t cmn;
    struct {
        u32 smp;
        bool injected;
    } gl;
}

struct _sg_gl_uniform_t {
    i32 gl_loc;
    i32 type;
    u16 count;
    u16 offset;
}

struct _sg_gl_uniform_block_t {
    i32 num_uniforms;
    _sg_gl_uniform_t[16] uniforms;
}

struct _sg_gl_shader_attr_t {
    _sg_str_t name;
}

struct _sg_shader_s {
    _sg_slot_t slot;
    _sg_shader_common_t cmn;
    struct {
        u32 prog;
        _sg_gl_shader_attr_t[16] attrs;
        _sg_gl_uniform_block_t[8] uniform_blocks;
        u8[32] sbuf_binding;
        u8[32] simg_binding;
        i8[32] tex_slot;
    } gl;
}

struct _sg_gl_attr_t {
    i8 vb_index;
    i8 divisor;
    u8 stride;
    u8 size;
    u8 normalized;
    i32 offset;
    u32 type;
    i32 base_type;
}

struct _sg_pipeline_s {
    _sg_slot_t slot;
    _sg_pipeline_common_t cmn;
    struct {
        _sg_gl_attr_t[16] attrs;
        sg_depth_state depth;
        sg_stencil_state stencil;
        i32 primitive_type;
        sg_blend_state blend;
        i32[8] color_write_mask;
        i32 cull_mode;
        i32 face_winding;
        i32 sample_count;
        bool alpha_to_coverage_enabled;
    } gl;
}

struct _sg_view_s {
    _sg_slot_t slot;
    _sg_view_common_t cmn;
    struct {
        u32[2] tex_view;
        u32 msaa_render_buffer;
        u32 msaa_resolve_frame_buffer;
    } gl;
}

struct _sg_gl_cache_attr_t {
    _sg_gl_attr_t gl_attr;
    u32 gl_vbuf;
}

struct _sg_gl_cache_texture_sampler_bind_slot {
    u32 target;
    u32 texture;
    u32 sampler;
}

struct _sg_gl_cache_t {
    sg_depth_state depth;
    sg_stencil_state stencil;
    sg_blend_state blend;
    i32[8] color_write_mask;
    i32 cull_mode;
    i32 face_winding;
    bool polygon_offset_enabled;
    i32 sample_count;
    sg_color blend_color;
    bool alpha_to_coverage_enabled;
    _sg_gl_cache_attr_t[16] attrs;
    u32 vertex_buffer;
    u32 index_buffer;
    u32 storage_buffer;
    u32[32] storage_buffers;
    i32[32] storage_buffer_offsets;
    u32 stored_vertex_buffer;
    u32 stored_index_buffer;
    u32 stored_storage_buffer;
    u32 prog;
    _sg_gl_cache_texture_sampler_bind_slot[32] texture_samplers;
    _sg_gl_cache_texture_sampler_bind_slot stored_texture_sampler;
    i32 cur_ib_offset;
    u32 cur_primitive_type;
    u32 cur_index_type;
    u32 cur_active_texture;
    _sg_sref_t cur_pip;
}

struct _sg_gl_backend_t {
    bool valid;
    u32 vao;
    u32 fb;
    _sg_gl_cache_t cache;
    bool ext_anisotropic;
    i32 max_anisotropy;
    i32[8] color_store_actions;
    i32 depth_store_action;
    i32 stencil_store_action;
}

// this *MUST* remain 0
struct _sg_pools_s {
    _sg_pool_t buffer_pool;
    _sg_pool_t image_pool;
    _sg_pool_t sampler_pool;
    _sg_pool_t shader_pool;
    _sg_pool_t pipeline_pool;
    _sg_pool_t view_pool;
    _sg_buffer_t* buffers;
    _sg_image_t* images;
    _sg_sampler_t* samplers;
    _sg_shader_t* shaders;
    _sg_pipeline_t* pipelines;
    _sg_view_t* views;
}

struct _sg_commit_listeners_t {
    i32 num;
    i32 upper;
    sg_commit_listener* items;
}

// resolved pass attachments struct
struct _sg_attachments_ptrs_t {
    bool empty;
    i32 num_color_views;
    _sg_view_t*[8] color_views;
    _sg_view_t*[8] resolve_views;
    _sg_view_t* ds_view;
}

// resolved resource bindings struct
struct _sg_bindings_ptrs_t {
    _sg_pipeline_t* pip;
    i32[8] vb_offsets;
    i32 ib_offset;
    _sg_buffer_t*[8] vbs;
    _sg_buffer_t* ib;
    _sg_view_t*[32] views;
    _sg_sampler_t*[12] smps;
}

struct _sg_pixelformat_info_t {
    bool sample;
    bool filter;
    bool render;
    bool blend;
    bool msaa;
    bool depth;
    bool read;
    bool write;
}

struct _sg_cur_pass_t {
    bool valid;
    bool in_pass;
    bool is_compute;
    _sg_dimi_t dim;
    sg_attachments atts;
    sg_pass_action action;
    struct {
        bool invalid;
        i32 color_fmt;
        i32 depth_fmt;
        i32 sample_count;
    } swapchain;
}

struct _sg_state_t {
    bool valid;
    sg_desc desc;
    u32 frame_index;
    _sg_cur_pass_t cur_pass;
    _sg_pipeline_ref_t cur_pip;
    bool next_draw_valid;
    bool use_indexed_draw;
    bool use_instanced_draw;
    struct {
        u32 pass_index;
        u32 required_bindings_and_uniforms;
        u32 applied_bindings_and_uniforms;
        bool write_buffer_transient_missing;
        bool write_image_transient_missing;
    } validate;
    i32 validate_error;
    _sg_pools_t pools;
    i32 backend;
    sg_features features;
    sg_limits limits;
    _sg_pixelformat_info_t[69] formats;
    bool stats_enabled;
    sg_stats stats;
    _sg_gl_backend_t gl;
    sg_trace_hooks hooks;
    _sg_commit_listeners_t commit_listeners;
}

struct _sg_u128_t {
    u64 lo;
    u64 hi;
}

/*
    sokol_app.h -- cross-platform application wrapper

    Project URL: https://github.com/floooh/sokol

    Do this:
        #define SOKOL_IMPL or
        #define SOKOL_APP_IMPL
    before you include this file in *one* C or C++ file to create the
    implementation.

    In the same place define one of the following to select the 3D-API
    which should be initialized by sokol_app.h (this must also match
    the backend selected for sokol_gfx.h if both are used in the same
    project):

        #define SOKOL_GLCORE
        #define SOKOL_GLES3
        #define SOKOL_D3D11
        #define SOKOL_METAL
        #define SOKOL_WGPU
        #define SOKOL_VULKAN
        #define SOKOL_NOAPI

    Optionally provide the following defines with your own implementations:

        SOKOL_ASSERT(c)             - your own assert macro (default: assert(c))
        SOKOL_UNREACHABLE()         - a guard macro for unreachable code (default: assert(false))
        SOKOL_WIN32_FORCE_MAIN      - define this on Win32 to add a main() entry point
        SOKOL_WIN32_FORCE_WINMAIN   - define this on Win32 to add a WinMain() entry point (enabled by default unless
                                      SOKOL_WIN32_FORCE_MAIN or SOKOL_NO_ENTRY is defined)
        SOKOL_NO_ENTRY              - define this if sokol_app.h shouldn't "hijack" the main() function
        SOKOL_APP_API_DECL          - public function declaration prefix (default: extern)
        SOKOL_API_DECL              - same as SOKOL_APP_API_DECL
        SOKOL_API_IMPL              - public function implementation prefix (default: -)

    Optionally define the following to force debug checks and validations
    even in release mode:

        SOKOL_DEBUG         - by default this is defined if NDEBUG is not defined

    If sokol_app.h is compiled as a DLL, define the following before
    including the declaration or implementation:

        SOKOL_DLL

    On Windows, SOKOL_DLL will define SOKOL_APP_API_DECL as __declspec(dllexport)
    or __declspec(dllimport) as needed.

    if SOKOL_WIN32_FORCE_MAIN and SOKOL_WIN32_FORCE_WINMAIN are both defined,
    it is up to the developer to define the desired subsystem.

    On Linux, SOKOL_GLCORE can use either GLX or EGL.
    GLX is default, set SOKOL_FORCE_EGL to override.

    For example code, see https://github.com/floooh/sokol-samples/tree/master/sapp

    Portions of the Windows and Linux GL initialization, event-, icon- etc... code
    have been taken from GLFW (http://www.glfw.org/).

    iOS onscreen keyboard support 'inspired' by libgdx.

    Link with the following system libraries:

    - on macOS:
        - all backends: AppKit, QuartzCore
        - with SOKOL_METAL: Metal
        - with SOKOL_GLCORE: OpenGL
        - with SOKOL_WGPU: a WebGPU implementation library (tested with webgpu_dawn)
    - on iOS:
        - all backends: Foundation, UIKit, QuartzCore
        - with SOKOL_METAL: Metal, CoreGraphics
        - with SOKOL_GLES3: OpenGLES, GLKit
    - on Linux:
        - all backends: X11, Xi, Xcursor, dl, pthread, m
        - with SOKOL_GLCORE: GL
        - with SOKOL_GLES3: GLESv2
        - with SOKOL_WGPU: a WebGPU implementation library (tested with webgpu_dawn)
        - with SOKOL_VULKAN: vulkan
        - with EGL: EGL
    - on Android: GLESv3, EGL, log, android
    - on Windows:
        - with MSVC or Clang: library dependencies are defined via `#pragma comment`
        - with SOKOL_WGPU: a WebGPU implementation library (tested with webgpu_dawn)
        - with SOKOL_VULKAN:
            - install the Vulkan SDK
            - set a header search path to $VULKAN_SDK/Include
            - set a library search path to $VULKAN_SDK/Lib
            - link with vulkan-1.lib
        - with MINGW/MSYS2 gcc:
            - compile with '-mwin32' so that _WIN32 is defined
            - link with the following libs: -lkernel32 -luser32 -lshell32
            - additionally with the GL backend: -lgdi32
            - additionally with the D3D11 backend: -ld3d11 -ldxgi

    On Linux, you also need to use the -pthread compiler and linker option, otherwise weird
    things will happen, see here for details: https://github.com/floooh/sokol/issues/376

    For Linux+Vulkan install the following packages (or equivalents):
        - libvulkan-dev
        - vulkan-validationlayers
        - vulkan-tools

    On macOS and iOS, the implementation must be compiled as Objective-C.

    On Emscripten:
        - for WebGL2: add the linker option `-s USE_WEBGL2=1`
        - for WebGPU: compile and link with `--use-port=emdawnwebgpu`
          (for more exotic situations read: https://dawn.googlesource.com/dawn/+/refs/heads/main/src/emdawnwebgpu/pkg/README.md)

    FEATURE OVERVIEW
    ================
    sokol_app.h provides a minimalistic cross-platform API which
    implements the 'application-wrapper' parts of a 3D application:

    - a common application entry function
    - creates a window and 3D-API context/device with a swapchain
      surface, depth-stencil-buffer surface and optionally MSAA surface
    - makes the rendered frame visible
    - provides keyboard-, mouse- and low-level touch-events
    - platforms: MacOS, iOS, HTML5, Win32, Linux/RaspberryPi, Android
    - 3D-APIs: Metal, D3D11, GL4.1, GL4.3, GLES3, WebGL2, WebGPU, NOAPI

    FEATURE/PLATFORM MATRIX
    =======================
                        | Windows | macOS | Linux  |  iOS  | Android | HTML5
    --------------------+---------+-------+--------+-------+---------+-------
    gl 4.x              | YES     | YES   | YES    | ---   | ---     | ---
    gles3/webgl2        | ---     | ---   | YES(2) | YES   | YES     | YES
    metal               | ---     | YES   | ---    | YES   | ---     | ---
    d3d11               | YES     | ---   | ---    | ---   | ---     | ---
    webgpu              | YES(4)  | YES(4)| YES(4) | ---   | ---     | YES
    vulkan              | YES(7)  | ---   | YES(7) | ---   | ---     | ---
    noapi               | YES     | TODO  | TODO   | ---   | ---     | ---
    key+char events     | YES     | YES   | YES    | ---   | ---     | YES
    mouse events        | YES     | YES   | YES    | ---   | ---     | YES
    touch events        | ---     | ---   | ---    | YES   | YES     | TES
    resized event       | YES     | YES   | YES    | YES   | YES     | YES
    iconifed/restored   | YES     | YES   | YES    | ---   | ---     | ---
    focused/unfocused   | YES     | YES   | YES    | ---   | ---     | YES
    suspended/resumed   | ---     | ---   | ---    | YES   | YES     | TODO
    programmatic quit   | YES     | YES   | YES    | ---   | ---     | YES
    key repeat flag     | YES     | YES   | YES    | ---   | ---     | YES
    windowed            | YES     | YES   | YES    | ---   | ---     | YES
    fullscreen          | YES     | YES   | YES    | YES   | YES     | YES(3)
    depth format        | YES     | YES   | YES    | YES   | YES     | YES
    mouse hide          | YES     | YES   | YES    | ---   | ---     | YES
    mouse lock          | YES     | YES   | YES    | ---   | ---     | YES
    set cursor type     | YES     | YES   | YES    | ---   | ---     | YES
    screen keyboard     | ---     | ---   | ---    | YES   | ---     | YES
    high-dpi            | YES     | YES   | TODO   | YES   | YES     | YES
    clipboard           | YES     | YES   | YES    | ---   | ---     | YES
    MSAA                | YES     | YES   | YES    | YES   | YES     | YES
    drag'n'drop         | YES     | YES   | YES    | ---   | ---     | YES
    window icon         | YES     | YES(1)| YES    | ---   | ---     | YES
    srgb framebuffer    | YES     | YES   | YES    | YES   | YES     | YES(5)
    hdr framebuffer     | ---     | YES(6)| ---    | YES(6)| ---     | YES(5)
    composite mode      | ---     | YES(6)| ---    | ---   | ---     | YES
    disable vsync       | YES     | ---(8)| YES    | ---   | ---     | ---
    swap interval       | YES(10) | YES(9)| YES(10)| YES   | ---     |

    (1) macOS has no regular window icons, instead the dock icon is changed
    (2) supported with EGL only (not GLX)
    (3) fullscreen in the browser not supported on iphones
    (4) WebGPU on native desktop platforms should be considered experimental
        and mainly useful for debugging and benchmarking
    (5) only supported on WebGPU, but not WebGL2
    (6) only supported on Metal, but not GL/GLES3
    (7) Vulkan support is highly experimental and has serious frame pacing
        issues on Windows+NVIDIA with FIFO presentation mode
    (8) on macOS+Metal, rendering is currently always vsync-throttled
        because CADisplayLink drives the frame loop, and this doesn't allow
        running faster than vsync, on macOS+GL, setting the swap interval
        has no effect since macOS 13
    (9) on macOS+GL, setting the swap interval has no effect since macOS 13
    (10) swap interval not supported on Vulkan

    STEP BY STEP
    ============
    --- Add a sokol_main() function to your code which returns a sapp_desc structure
        with initialization parameters and callback function pointers. This
        function is called very early, usually at the start of the
        platform's entry function (e.g. main or WinMain). You should do as
        little as possible here, since the rest of your code might be called
        from another thread (this depends on the platform):

            sapp_desc sokol_main(int argc, char* argv[]) {
                return (sapp_desc) {
                    .width = 640,
                    .height = 480,
                    .init_cb = my_init_func,
                    .frame_cb = my_frame_func,
                    .cleanup_cb = my_cleanup_func,
                    .event_cb = my_event_func,
                    ...
                };
            }

        To get any logging output in case of errors you need to provide a log
        callback. The easiest way is via sokol_log.h:

            #include "sokol_log.h"

            sapp_desc sokol_main(int argc, char* argv[]) {
                return (sapp_desc) {
                    ...
                    .logger.func = slog_func,
                };
            }

        There are many more setup parameters, but these are the most important.
        For a complete list search for the sapp_desc structure declaration
        below.

        DO NOT call any sokol-app function from inside sokol_main(), since
        sokol-app will not be initialized at this point.

        The .width and .height parameters are the preferred size of the 3D
        rendering canvas. The actual size may differ from this depending on
        platform and other circumstances. Also the canvas size may change at
        any time (for instance when the user resizes the application window,
        or rotates the mobile device). You can just keep .width and .height
        zero-initialized to open a default-sized window (what "default-size"
        exactly means is platform-specific, but usually it's a size that covers
        most of, but not all, of the display).

        All provided function callbacks will be called from the same thread,
        but this may be different from the thread where sokol_main() was called.

        .init_cb (void (*)(void))
            This function is called once after the application window,
            3D rendering context and swap chain have been created. The
            function takes no arguments and has no return value.
        .frame_cb (void (*)(void))
            This is the per-frame callback, which is usually called 60
            times per second. This is where your application would update
            most of its state and perform all rendering.
        .cleanup_cb (void (*)(void))
            The cleanup callback is called once right before the application
            quits.
        .event_cb (void (*)(const sapp_event* event))
            The event callback is mainly for input handling, but is also
            used to communicate other types of events to the application. Keep the
            event_cb struct member zero-initialized if your application doesn't require
            event handling.

        As you can see, those 'standard callbacks' don't have a user_data
        argument, so any data that needs to be preserved between callbacks
        must live in global variables. If keeping state in global variables
        is not an option, there's an alternative set of callbacks with
        an additional user_data pointer argument:

        .user_data (void*)
            The user-data argument for the callbacks below
        .init_userdata_cb (void (*)(void* user_data))
        .frame_userdata_cb (void (*)(void* user_data))
        .cleanup_userdata_cb (void (*)(void* user_data))
        .event_userdata_cb (void(*)(const sapp_event* event, void* user_data))

        The function sapp_userdata() can be used to query the user_data
        pointer provided in the sapp_desc struct.

        You can also call sapp_query_desc() to get a copy of the
        original sapp_desc structure.

        NOTE that there's also an alternative compile mode where sokol_app.h
        doesn't "hijack" the main() function. Search below for SOKOL_NO_ENTRY.

    --- Implement the initialization callback function (init_cb), this is called
        once after the rendering surface, 3D API and swap chain have been
        initialized by sokol_app. All sokol-app functions can be called
        from inside the initialization callback, the most useful functions
        at this point are:

        int sapp_width(void)
        int sapp_height(void)
            Returns the current width and height of the default framebuffer in pixels,
            this may change from one frame to the next, and it may be different
            from the initial size provided in the sapp_desc struct.

        float sapp_widthf(void)
        float sapp_heightf(void)
            These are alternatives to sapp_width() and sapp_height() which return
            the default framebuffer size as float values instead of integer. This
            may help to prevent casting back and forth between int and float
            in more strongly typed languages than C and C++.

        double sapp_frame_duration(void)
            Returns a smoothed frame duration.

        double sapp_frame_duration_unfiltered(void)
            Returns the unfiltered frame duration with varying degree of
            jitter (depending on platform and backend).

        int sapp_color_format(void)
        int sapp_depth_format(void)
            The color and depth-stencil pixelformats of the default framebuffer,
            as integer values which are compatible with sokol-gfx's
            sg_pixel_format enum (so that they can be plugged directly in places
            where sg_pixel_format is expected). Possible values are:

                23 == SG_PIXELFORMAT_RGBA8
                28 == SG_PIXELFORMAT_BGRA8
                42 == SG_PIXELFORMAT_DEPTH
                43 == SG_PIXELFORMAT_DEPTH_STENCIL

        int sapp_sample_count(void)
            Return the MSAA sample count of the default framebuffer.

        const void* sapp_metal_get_device(void)
        const void* sapp_metal_get_current_drawable(void)
        const void* sapp_metal_get_depth_stencil_texture(void)
        const void* sapp_metal_get_msaa_color_texture(void)
            If the Metal backend has been selected, these functions return pointers
            to various Metal API objects required for rendering, otherwise
            they return a null pointer. These void pointers are actually
            Objective-C ids converted with a (ARC) __bridge cast so that
            the ids can be tunneled through C code. Also note that the returned
            pointers may change from one frame to the next, only the Metal device
            object is guaranteed to stay the same.

        const void* sapp_macos_get_window(void)
            On macOS, get the NSWindow object pointer, otherwise a null pointer.
            Before being used as Objective-C object, the void* must be converted
            back with a (ARC) __bridge cast.

        const void* sapp_ios_get_window(void)
            On iOS, get the UIWindow object pointer, otherwise a null pointer.
            Before being used as Objective-C object, the void* must be converted
            back with a (ARC) __bridge cast.

        const void* sapp_d3d11_get_device(void)
        const void* sapp_d3d11_get_device_context(void)
        const void* sapp_d3d11_get_render_view(void)
        const void* sapp_d3d11_get_resolve_view(void);
        const void* sapp_d3d11_get_depth_stencil_view(void)
            Similar to the sapp_metal_* functions, the sapp_d3d11_* functions
            return pointers to D3D11 API objects required for rendering,
            only if the D3D11 backend has been selected. Otherwise they
            return a null pointer. Note that the returned pointers to the
            render-target-view and depth-stencil-view may change from one
            frame to the next!

        const void* sapp_win32_get_hwnd(void)
            On Windows, get the window's HWND, otherwise a null pointer. The
            HWND has been cast to a void pointer in order to be tunneled
            through code which doesn't include Windows.h.

        const void* sapp_x11_get_window(void)
            On Linux, get the X11 Window, otherwise a null pointer. The
            Window has been cast to a void pointer in order to be tunneled
            through code which doesn't include X11/Xlib.h.

        const void* sapp_x11_get_display(void)
            On Linux, get the X11 Display, otherwise a null pointer. The
            Display has been cast to a void pointer in order to be tunneled
            through code which doesn't include X11/Xlib.h.

        const void* sapp_wgpu_get_device(void)
        const void* sapp_wgpu_get_render_view(void)
        const void* sapp_wgpu_get_resolve_view(void)
        const void* sapp_wgpu_get_depth_stencil_view(void)
            These are the WebGPU-specific functions to get the WebGPU
            objects and values required for rendering. If sokol_app.h
            is not compiled with SOKOL_WGPU, these functions return null.

        uint32_t sapp_gl_get_framebuffer(void)
            This returns the 'default framebuffer' of the GL context.
            Typically this will be zero.

        int sapp_gl_get_major_version(void)
        int sapp_gl_get_minor_version(void)
        bool sapp_gl_is_gles(void)
            Returns the major and minor version of the GL context and
            whether the GL context is a GLES context

        const void* sapp_android_get_native_activity(void);
        const void* sapp_android_get_native_window(void);
            On Android, get the native activity ANativeActivity pointer,
            or native window ANativeWindow pointer, otherwise a null pointer.

    --- Implement the frame-callback function, this function will be called
        on the same thread as the init callback, but might be on a different
        thread than the sokol_main() function. Note that the size of
        the rendering framebuffer might have changed since the frame callback
        was called last. Call the functions sapp_width() and sapp_height()
        each frame to get the current size.

    --- Optionally implement the event-callback to handle input events.
        sokol-app provides the following type of input events:
            - a 'virtual key' was pressed down or released
            - a single text character was entered (provided as UTF-32 encoded
              UNICODE code point)
            - a mouse button was pressed down or released (left, right, middle)
            - mouse-wheel or 2D scrolling events
            - the mouse was moved
            - the mouse has entered or left the application window boundaries
            - low-level, portable multi-touch events (began, moved, ended, cancelled)
            - the application window was resized, iconified or restored
            - the application was suspended or restored (on mobile platforms)
            - the user or application code has asked to quit the application
            - a string was pasted to the system clipboard
            - one or more files have been dropped onto the application window

        To explicitly 'consume' an event and prevent that the event is
        forwarded for further handling to the operating system, call
        sapp_consume_event() from inside the event handler (NOTE that
        this behaviour is currently only implemented for some HTML5
        events and for tvOS key events (to allow menu button passthrough).
        Support for other platforms and event types will be added as needed,
        please open a GitHub ticket and/or provide a PR if needed).

        NOTE: Do *not* call any 3D API rendering functions in the event
        callback function, since the 3D API context may not be active when the
        event callback is called (it may work on some platforms and 3D APIs,
        but not others, and the exact behaviour may change between
        sokol-app versions).

    --- Implement the cleanup-callback function, this is called once
        after the user quits the application (see the section
        "APPLICATION QUIT" for detailed information on quitting
        behaviour, and how to intercept a pending quit - for instance to show a
        "Really Quit?" dialog box). Note that the cleanup-callback isn't
        guaranteed to be called on the web and mobile platforms.

    MOUSE CURSOR TYPE AND VISIBILITY
    ================================
    You can show and hide the mouse cursor with

        void sapp_show_mouse(bool show)

    And to get the current shown status:

        bool sapp_mouse_shown(void)

    NOTE that hiding the mouse cursor is different and independent from
    the MOUSE/POINTER LOCK feature which will also hide the mouse pointer when
    active (MOUSE LOCK is described below).

    To change the mouse cursor to one of several predefined types, call
    the function:

        void sapp_set_mouse_cursor(sapp_mouse_cursor cursor)

    Setting the default mouse cursor SAPP_MOUSECURSOR_DEFAULT will restore
    the standard look.

    To get the currently active mouse cursor type, call:

        sapp_mouse_cursor sapp_get_mouse_cursor(void)

    MOUSE LOCK (AKA POINTER LOCK, AKA MOUSE CAPTURE)
    ================================================
    In normal mouse mode, no mouse movement events are reported when the
    mouse leaves the windows client area or hits the screen border (whether
    it's one or the other depends on the platform), and the mouse move events
    (SAPP_EVENTTYPE_MOUSE_MOVE) contain absolute mouse positions in
    framebuffer pixels in the sapp_event items mouse_x and mouse_y, and
    relative movement in framebuffer pixels in the sapp_event items mouse_dx
    and mouse_dy.

    To get continuous mouse movement (also when the mouse leaves the window
    client area or hits the screen border), activate mouse-lock mode
    by calling:

        sapp_lock_mouse(true)

    When mouse lock is activated, the mouse pointer is hidden, the
    reported absolute mouse position (sapp_event.mouse_x/y) appears
    frozen, and the relative mouse movement in sapp_event.mouse_dx/dy
    no longer has a direct relation to framebuffer pixels but instead
    uses "raw mouse input" (what "raw mouse input" exactly means also
    differs by platform).

    To deactivate mouse lock and return to normal mouse mode, call

        sapp_lock_mouse(false)

    And finally, to check if mouse lock is currently active, call

        if (sapp_mouse_locked()) { ... }

    Note that mouse-lock state may not change immediately after sapp_lock_mouse(true/false)
    is called, instead on some platforms the actual state switch may be delayed
    to the end of the current frame or even to a later frame.

    The mouse may also be unlocked automatically without calling sapp_lock_mouse(false),
    most notably when the application window becomes inactive.

    On the web platform there are further restrictions to be aware of, caused
    by the limitations of the HTML5 Pointer Lock API:

        - sapp_lock_mouse(true) can be called at any time, but it will
          only take effect in a 'short-lived input event handler of a specific
          type', meaning when one of the following events happens:
            - SAPP_EVENTTYPE_MOUSE_DOWN
            - SAPP_EVENTTYPE_MOUSE_UP
            - SAPP_EVENTTYPE_MOUSE_SCROLL
            - SAPP_EVENTTYPE_KEY_UP
            - SAPP_EVENTTYPE_KEY_DOWN
        - The mouse lock/unlock action on the web platform is asynchronous,
          this means that sapp_mouse_locked() won't immediately return
          the new status after calling sapp_lock_mouse(), instead the
          reported status will only change when the pointer lock has actually
          been activated or deactivated in the browser.
        - On the web, mouse lock can be deactivated by the user at any time
          by pressing the Esc key. When this happens, sokol_app.h behaves
          the same as if sapp_lock_mouse(false) is called.

    For things like camera manipulation it's most straightforward to lock
    and unlock the mouse right from the sokol_app.h event handler, for
    instance the following code enters and leaves mouse lock when the
    left mouse button is pressed and released, and then uses the relative
    movement information to manipulate a camera (taken from the
    cgltf-sapp.c sample in the sokol-samples repository
    at https://github.com/floooh/sokol-samples):

        static void input(const sapp_event* ev) {
            switch (ev->type) {
                case SAPP_EVENTTYPE_MOUSE_DOWN:
                    if (ev->mouse_button == SAPP_MOUSEBUTTON_LEFT) {
                        sapp_lock_mouse(true);
                    }
                    break;

                case SAPP_EVENTTYPE_MOUSE_UP:
                    if (ev->mouse_button == SAPP_MOUSEBUTTON_LEFT) {
                        sapp_lock_mouse(false);
                    }
                    break;

                case SAPP_EVENTTYPE_MOUSE_MOVE:
                    if (sapp_mouse_locked()) {
                        cam_orbit(&state.camera, ev->mouse_dx * 0.25f, ev->mouse_dy * 0.25f);
                    }
                    break;

                default:
                    break;
            }
        }

    For a 'first person shooter mouse' the following code inside the sokol-app event handler
    is recommended somewhere in your frame callback:

        if (!sapp_mouse_locked()) {
            sapp_lock_mouse(true);
        }

    CLIPBOARD SUPPORT
    =================
    Applications can send and receive UTF-8 encoded text data from and to the
    system clipboard. By default, clipboard support is disabled and
    must be enabled at startup via the following sapp_desc struct
    members:

        sapp_desc.enable_clipboard  - set to true to enable clipboard support
        sapp_desc.clipboard_size    - size of the internal clipboard buffer in bytes

    Enabling the clipboard will dynamically allocate a clipboard buffer
    for UTF-8 encoded text data of the requested size in bytes, the default
    size is 8 KBytes. Strings that don't fit into the clipboard buffer
    (including the terminating zero) will be silently clipped, so it's
    important that you provide a big enough clipboard size for your
    use case.

    To send data to the clipboard, call sapp_set_clipboard_string() with
    a pointer to an UTF-8 encoded, null-terminated C-string.

    NOTE that on the HTML5 platform, sapp_set_clipboard_string() must be
    called from inside a 'short-lived event handler', and there are a few
    other HTML5-specific caveats to workaround. You'll basically have to
    tinker until it works in all browsers :/ (maybe the situation will
    improve when all browsers agree on and implement the new
    HTML5 navigator.clipboard API).

    To get data from the clipboard, check for the SAPP_EVENTTYPE_CLIPBOARD_PASTED
    event in your event handler function, and then call sapp_get_clipboard_string()
    to obtain the pasted UTF-8 encoded text.

    NOTE that behaviour of sapp_get_clipboard_string() is slightly different
    depending on platform:

        - on the HTML5 platform, the internal clipboard buffer will only be updated
          right before the SAPP_EVENTTYPE_CLIPBOARD_PASTED event is sent,
          and sapp_get_clipboard_string() will simply return the current content
          of the clipboard buffer
        - on 'native' platforms, the call to sapp_get_clipboard_string() will
          update the internal clipboard buffer with the most recent data
          from the system clipboard

    Portable code should check for the SAPP_EVENTTYPE_CLIPBOARD_PASTED event,
    and then call sapp_get_clipboard_string() right in the event handler.

    The SAPP_EVENTTYPE_CLIPBOARD_PASTED event will be generated by sokol-app
    as follows:

        - on macOS: when the Cmd+V key is pressed down
        - on HTML5: when the browser sends a 'paste' event to the global 'window' object
        - on all other platforms: when the Ctrl+V key is pressed down

    DRAG AND DROP SUPPORT
    =====================
    PLEASE NOTE: the drag'n'drop feature works differently on WASM/HTML5
    and on the native desktop platforms (Win32, Linux and macOS) because
    of security-related restrictions in the HTML5 drag'n'drop API. The
    WASM/HTML5 specifics are described at the end of this documentation
    section:

    Like clipboard support, drag'n'drop support must be explicitly enabled
    at startup in the sapp_desc struct.

        sapp_desc sokol_main(void) {
            return (sapp_desc) {
                .enable_dragndrop = true,   // default is false
                ...
            };
        }

    You can also adjust the maximum number of files that are accepted
    in a drop operation, and the maximum path length in bytes if needed:

        sapp_desc sokol_main(void) {
            return (sapp_desc) {
                .enable_dragndrop = true,               // default is false
                .max_dropped_files = 8,                 // default is 1
                .max_dropped_file_path_length = 8192,   // in bytes, default is 2048
                ...
            };
        }

    When drag'n'drop is enabled, the event callback will be invoked with an
    event of type SAPP_EVENTTYPE_FILES_DROPPED whenever the user drops files on
    the application window.

    After the SAPP_EVENTTYPE_FILES_DROPPED is received, you can query the
    number of dropped files, and their absolute paths by calling separate
    functions:

        void on_event(const sapp_event* ev) {
            if (ev->type == SAPP_EVENTTYPE_FILES_DROPPED) {

                // the mouse position where the drop happened
                float x = ev->mouse_x;
                float y = ev->mouse_y;

                // get the number of files and their paths like this:
                const int num_dropped_files = sapp_get_num_dropped_files();
                for (int i = 0; i < num_dropped_files; i++) {
                    const char* path = sapp_get_dropped_file_path(i);
                    ...
                }
            }
        }

    The returned file paths are UTF-8 encoded strings.

    You can call sapp_get_num_dropped_files() and sapp_get_dropped_file_path()
    anywhere, also outside the event handler callback, but be aware that the
    file path strings will be overwritten with the next drop operation.

    In any case, sapp_get_dropped_file_path() will never return a null pointer,
    instead an empty string "" will be returned if the drag'n'drop feature
    hasn't been enabled, the last drop-operation failed, or the file path index
    is out of range.

    Drag'n'drop caveats:

        - if more files are dropped in a single drop-action
          than sapp_desc.max_dropped_files, the additional
          files will be silently ignored
        - if any of the file paths is longer than
          sapp_desc.max_dropped_file_path_length (in number of bytes, after UTF-8
          encoding) the entire drop operation will be silently ignored (this
          needs some sort of error feedback in the future)
        - no mouse positions are reported while the drag is in
          process, this may change in the future

    Drag'n'drop on HTML5/WASM:

    The HTML5 drag'n'drop API doesn't return file paths, but instead
    black-box 'file objects' which must be used to load the content
    of dropped files. This is the reason why sokol_app.h adds two
    HTML5-specific functions to the drag'n'drop API:

        uint32_t sapp_html5_get_dropped_file_size(int index)
            Returns the size in bytes of a dropped file.

        void sapp_html5_fetch_dropped_file(const sapp_html5_fetch_request* request)
            Asynchronously loads the content of a dropped file into a
            provided memory buffer (which must be big enough to hold
            the file content)

    To start loading the first dropped file after an SAPP_EVENTTYPE_FILES_DROPPED
    event is received:

        sapp_html5_fetch_dropped_file(&(sapp_html5_fetch_request){
            .dropped_file_index = 0,
            .callback = fetch_cb
            .buffer = {
                .ptr = buf,
                .size = sizeof(buf)
            },
            .user_data = ...
        });

    Make sure that the memory pointed to by 'buf' stays valid until the
    callback function is called!

    As result of the asynchronous loading operation (no matter if succeeded or
    failed) the 'fetch_cb' function will be called:

        void fetch_cb(const sapp_html5_fetch_response* response) {
            // IMPORTANT: check if the loading operation actually succeeded:
            if (response->succeeded) {
                // the size of the loaded file:
                const size_t num_bytes = response->data.size;
                // and the pointer to the data (same as 'buf' in the fetch-call):
                const void* ptr = response->data.ptr;
            } else {
                // on error check the error code:
                switch (response->error_code) {
                    case SAPP_HTML5_FETCH_ERROR_BUFFER_TOO_SMALL:
                        ...
                        break;
                    case SAPP_HTML5_FETCH_ERROR_OTHER:
                        ...
                        break;
                }
            }
        }

    Check the droptest-sapp example for a real-world example which works
    both on native platforms and the web:

    https://github.com/floooh/sokol-samples/blob/master/sapp/droptest-sapp.c

    HIGH-DPI RENDERING
    ==================
    You can set the sapp_desc.high_dpi flag during initialization to request
    a full-resolution framebuffer on HighDPI displays. The default behaviour
    is sapp_desc.high_dpi=false, this means that the application will
    render to a lower-resolution framebuffer on HighDPI displays and the
    rendered content will be upscaled by the window system composer.

    In a HighDPI scenario, you still request the same window size during
    sokol_main(), but the framebuffer sizes returned by sapp_width()
    and sapp_height() will be scaled up according to the DPI scaling
    ratio.

    Note that on some platforms the DPI scaling factor may change at any
    time (for instance when a window is moved from a high-dpi display
    to a low-dpi display).

    To query the current DPI scaling factor, call the function:

    float sapp_dpi_scale(void);

    For instance on a Retina Mac, returning the following sapp_desc
    struct from sokol_main():

    sapp_desc sokol_main(void) {
        return (sapp_desc) {
            .width = 640,
            .height = 480,
            .high_dpi = true,
            ...
        };
    }

    ...the functions the functions sapp_width(), sapp_height()
    and sapp_dpi_scale() will return the following values:

    sapp_width:     1280
    sapp_height:    960
    sapp_dpi_scale: 2.0

    If the high_dpi flag is false, or you're not running on a Retina display,
    the values would be:

    sapp_width:     640
    sapp_height:    480
    sapp_dpi_scale: 1.0

    If the window is moved from the Retina display to a low-dpi external display,
    the values would change as follows:

    sapp_width:     1280 => 640
    sapp_height:    960  => 480
    sapp_dpi_scale: 2.0  => 1.0

    Currently there is no event associated with a DPI change, but an
    SAPP_EVENTTYPE_RESIZED will be sent as a side effect of the
    framebuffer size changing.

    Per-monitor DPI is currently supported on macOS and Windows.

    APPLICATION QUIT
    ================
    Without special quit handling, a sokol_app.h application will quit
    'gracefully' when the user clicks the window close-button unless a
    platform's application model prevents this (e.g. on web or mobile).
    'Graceful exit' means that the application-provided cleanup callback will
    be called before the application quits.

    On native desktop platforms sokol_app.h provides more control over the
    application-quit-process. It's possible to initiate a 'programmatic quit'
    from the application code, and a quit initiated by the application user can
    be intercepted (for instance to show a custom dialog box).

    This 'programmatic quit protocol' is implemented through 3 functions
    and 1 event:

        - sapp_quit(): This function simply quits the application without
          giving the user a chance to intervene. Usually this might
          be called when the user clicks the 'Ok' button in a 'Really Quit?'
          dialog box
        - sapp_request_quit(): Calling sapp_request_quit() will send the
          event SAPP_EVENTTYPE_QUIT_REQUESTED to the applications event handler
          callback, giving the user code a chance to intervene and cancel the
          pending quit process (for instance to show a 'Really Quit?' dialog
          box). If the event handler callback does nothing, the application
          will be quit as usual. To prevent this, call the function
          sapp_cancel_quit() from inside the event handler.
        - sapp_cancel_quit(): Cancels a pending quit request, either initiated
          by the user clicking the window close button, or programmatically
          by calling sapp_request_quit(). The only place where calling this
          function makes sense is from inside the event handler callback when
          the SAPP_EVENTTYPE_QUIT_REQUESTED event has been received.
        - SAPP_EVENTTYPE_QUIT_REQUESTED: this event is sent when the user
          clicks the window's close button or application code calls the
          sapp_request_quit() function. The event handler callback code can handle
          this event by calling sapp_cancel_quit() to cancel the quit.
          If the event is ignored, the application will quit as usual.

    On the web platform, the quit behaviour differs from native platforms,
    because of web-specific restrictions:

    A `programmatic quit` initiated by calling sapp_quit() or
    sapp_request_quit() will work as described above: the cleanup callback is
    called, platform-specific cleanup is performed (on the web
    this means that JS event handlers are unregistered), and then
    the request-animation-loop will be exited. However that's all. The
    web page itself will continue to exist (e.g. it's not possible to
    programmatically close the browser tab).

    On the web it's also not possible to run custom code when the user
    closes a browser tab, so it's not possible to prevent this with a
    fancy custom dialog box.

    Instead the standard "Leave Site?" dialog box can be activated (or
    deactivated) with the following function:

        sapp_html5_ask_leave_site(bool ask);

    The initial state of the associated internal flag can be provided
    at startup via sapp_desc.html5.ask_leave_site.

    This feature should only be used sparingly in critical situations - for
    instance when the user would loose data - since popping up modal dialog
    boxes is considered quite rude in the web world. Note that there's no way
    to customize the content of this dialog box or run any code as a result
    of the user's decision. Also note that the user must have interacted with
    the site before the dialog box will appear. These are all security measures
    to prevent fishing.

    The Dear ImGui HighDPI sample contains example code of how to
    implement a 'Really Quit?' dialog box with Dear ImGui (native desktop
    platforms only), and for showing the hardwired "Leave Site?" dialog box
    when running on the web platform:

        https://floooh.github.io/sokol-html5/wasm/imgui-highdpi-sapp.html

    MAXIMIZED WINDOW
    ================
    If the sapp_desc.maximized flag is true, the window starts maximized on
    Windows, macOS (zoomed) and Linux (X11). The window is maximized before
    it is first shown, so there is no maximize animation, and restoring it
    gives sapp_desc.width x sapp_desc.height. The flag is ignored when
    sapp_desc.fullscreen is true, on the web and on mobile platforms, and
    on Windows when the process is launched minimized.

    TRACKPAD PINCH ZOOM
    ===================
    On macOS a two-finger pinch on the trackpad is reported as a MOUSE_SCROLL
    event with SAPP_MODIFIER_CTRL set and the relative scale change in
    scroll_y (positive when spreading), which is how a pinch already arrives
    on Windows (precision touchpad) and in browsers. An app that zooms on
    Ctrl + scroll handles the pinch without change.

    FULLSCREEN
    ==========
    If the sapp_desc.fullscreen flag is true, sokol-app will try to create
    a fullscreen window on platforms with a 'proper' window system
    (mobile devices will always use fullscreen). The implementation details
    depend on the target platform, in general sokol-app will use a
    'soft approach' which doesn't interfere too much with the platform's
    window system (for instance borderless fullscreen window instead of
    a 'real' fullscreen mode). Such details might change over time
    as sokol-app is adapted for different needs.

    The most important effect of fullscreen mode to keep in mind is that
    the requested canvas width and height will be ignored for the initial
    window size, calling sapp_width() and sapp_height() will instead return
    the resolution of the fullscreen canvas (however the provided size
    might still be used for the non-fullscreen window, in case the user can
    switch back from fullscreen- to windowed-mode).

    To toggle fullscreen mode programmatically, call sapp_toggle_fullscreen().

    To check if the application window is currently in fullscreen mode,
    call sapp_is_fullscreen().

    On the web, sapp_desc.fullscreen will have no effect, and the application
    will always start in non-fullscreen mode. Call sapp_toggle_fullscreen()
    from within or 'near' an input event to switch to fullscreen programatically.
    Note that on the web, the fullscreen state may change back to windowed at
    any time (either because the browser had rejected switching into fullscreen,
    or the user leaves fullscreen via Esc), this means that the result
    of sapp_is_fullscreen() may change also without calling sapp_toggle_fullscreen()!


    WINDOW ICON SUPPORT
    ===================
    Some sokol_app.h backends allow to change the window icon programmatically:

        - on Win32: the small icon in the window's title bar, and the
          bigger icon in the task bar
        - on Linux: highly dependent on the used window manager, but usually
          the window's title bar icon and/or the task bar icon
        - on HTML5: the favicon shown in the page's browser tab
        - on macOS: the application icon shown in the dock, but only
          for currently running applications

    NOTE that it is not possible to set the actual application icon which is
    displayed by the operating system on the desktop or 'home screen'. Those
    icons must be provided 'traditionally' through operating-system-specific
    resources which are associated with the application (sokol_app.h might
    later support setting the window icon from platform specific resource data
    though).

    There are two ways to set the window icon:

        - at application start in the sokol_main() function by initializing
          the sapp_desc.icon nested struct
        - or later by calling the function sapp_set_icon()

    As a convenient shortcut, sokol_app.h comes with a builtin default-icon
    (a rainbow-colored 'S', which at least looks a bit better than the Windows
    default icon for applications), which can be activated like this:

    At startup in sokol_main():

        sapp_desc sokol_main(...) {
            return (sapp_desc){
                ...
                icon.sokol_default = true
            };
        }

    Or later by calling:

        sapp_set_icon(&(sapp_icon_desc){ .sokol_default = true });

    NOTE that a completely zero-initialized sapp_icon_desc struct will not
    update the window icon in any way. This is an 'escape hatch' so that you
    can handle the window icon update yourself (or if you do this already,
    sokol_app.h won't get in your way, in this case just leave the
    sapp_desc.icon struct zero-initialized).

    Providing your own icon images works exactly like in GLFW (down to the
    data format):

    You provide one or more 'candidate images' in different sizes, and the
    sokol_app.h platform backends pick the best match for the specific backend
    and icon type.

    For each candidate image, you need to provide:

        - the width in pixels
        - the height in pixels
        - and the actual pixel data in RGBA8 pixel format (e.g. 0xFFCC8844
          on a little-endian CPU means: alpha=0xFF, blue=0xCC, green=0x88, red=0x44)

    For instance, if you have 3 candidate images (small, medium, big) of
    sizes 16x16, 32x32 and 64x64 the corresponding sapp_icon_desc struct is setup
    like this:

        // the actual pixel data (RGBA8, origin top-left)
        const uint32_t small[16][16]  = { ... };
        const uint32_t medium[32][32] = { ... };
        const uint32_t big[64][64]    = { ... };

        const sapp_icon_desc icon_desc = {
            .images = {
                { .width = 16, .height = 16, .pixels = SAPP_RANGE(small) },
                { .width = 32, .height = 32, .pixels = SAPP_RANGE(medium) },
                // ...or without the SAPP_RANGE helper macro:
                { .width = 64, .height = 64, .pixels = { .ptr=big, .size=sizeof(big) } }
            }
        };

    An sapp_icon_desc struct initialized like this can then either be applied
    at application start in sokol_main:

        sapp_desc sokol_main(...) {
            return (sapp_desc){
                ...
                icon = icon_desc
            };
        }

    ...or later by calling sapp_set_icon():

        sapp_set_icon(&icon_desc);

    Some window icon caveats:

        - once the window icon has been updated, there's no way to go back to
          the platform's default icon, this is because some platforms (Linux
          and HTML5) don't switch the icon visual back to the default even if
          the custom icon is deleted or removed
        - on HTML5, if the sokol_app.h icon doesn't show up in the browser
          tab, check that there's no traditional favicon 'link' element
          is defined in the page's index.html, sokol_app.h will only
          append a new favicon link element, but not delete any manually
          defined favicon in the page

    For an example and test of the window icon feature, check out the
    'icon-sapp' sample on the sokol-samples git repository.

    ONSCREEN KEYBOARD
    =================
    On some platforms which don't provide a physical keyboard, sokol-app
    can display the platform's integrated onscreen keyboard for text
    input. To request that the onscreen keyboard is shown, call

        sapp_show_keyboard(true);

    Likewise, to hide the keyboard call:

        sapp_show_keyboard(false);

    Note that onscreen keyboard functionality is no longer supported
    on the browser platform (the previous hacks and workarounds to make browser
    keyboards work for on web applications that don't use HTML UIs
    never really worked across browsers).

    INPUT EVENT BUBBLING ON THE WEB PLATFORM
    ========================================
    By default, input event bubbling on the web platform is configured in
    a way that makes the most sense for 'full-canvas' apps that cover the
    entire browser client window area:

    - mouse, touch and wheel events do not bubble up, this prevents various
      ugly side events, like:
        - HTML text overlays being selected on double- or triple-click into
          the canvas
        - 'scroll bumping' even when the canvas covers the entire client area
    - key_up/down events for 'character keys' *do* bubble up (otherwise
      the browser will not generate UNICODE character events)
    - all other key events *do not* bubble up by default (this prevents side effects
      like F1 opening help, or F7 starting 'caret browsing')
    - character events do not bubble up (although I haven't noticed any side effects
      otherwise)

    Event bubbling can be enabled for input event categories during initialization
    in the sapp_desc struct:

        sapp_desc sokol_main(int argc, char* argv[]) {
            return (sapp_desc){
                //...
                .html5 = {
                    .bubble_mouse_events = true,
                    .bubble_touch_events = true,
                    .bubble_wheel_events = true,
                    .bubble_key_events = true,
                    .bubble_char_events = true,
                }
            };
        }

    This basically opens the floodgates and lets *all* input events bubble up to the browser.

    To prevent individual events from bubbling, call sapp_consume_event() from within
    the sokol_app.h event callback when that specific event is reported.


    SETTING THE CANVAS OBJECT ON THE WEB PLATFORM
    =============================================
    On the web, sokol_app.h and the Emscripten SDK functions need to find
    the WebGL/WebGPU canvas intended for rendering and attaching event
    handlers. This can happen in four ways:

    1. do nothing and just set the id of the canvas object to 'canvas' (preferred)
    2. via a CSS Selector string (preferred)
    3. by setting the `Module.canvas` property to the canvas object
    4. by adding the canvas object to the global variable `specialHTMLTargets[]`
       (this is a special variable used by the Emscripten runtime to lookup
       event target objects for which document.querySelector() cannot be used)

    The easiest way is to just name your canvas object 'canvas':

        <canvas id="canvas" ...></canvas>

    This works because the default css selector string used by sokol_app.h
    is '#canvas'.

    If you name your canvas differently, you need to communicate that name to
    sokol_app.h via `sapp_desc.html5.canvas_selector` as a regular css selector
    string that's compatible with `document.querySelector()`. E.g. if your canvas
    object looks like this:

        <canvas id="bla" ...></canvas>

    The `sapp_desc.html5.canvas_selector` string must be set to '#bla':

        .html5.canvas_selector = "#bla"

    If the canvas object cannot be looked up via `document.querySelector()` you
    need to use one of the alternative methods, both involve the special
    Emscripten runtime `Module` object which is usually setup in the index.html
    like this before the WASM blob is loaded and instantiated:

        <script type='text/javascript'>
            var Module = {
                // ...
            };
        </script>

    The first option is to set the `Module.canvas` property to your canvas object:

        <script type='text/javascript'>
            var Module = {
                canvas: my_canvas_object,
            };
        </script>

    When sokol_app.h initializes, it will check the global Module object whether
    a `Module.canvas` property exists and is an object. This method will add
    a new entry to the `specialHTMLTargets[]` object

    The other option is to add the canvas under a name chosen by you to the
    special `specialHTMLTargets[]` map, which is used by the Emscripten runtime
    to lookup 'event target objects' which are not visible to `document.querySelector()`.
    Note that `specialHTMLTargets[]` must be updated after the Emscripten runtime
    has started but before the WASM code is running. A good place for this is
    the special `Module.preRun` array in index.html:

        <script type='text/javascript'>
            var Module = {
                preRun: [
                    () => {
                        specialHTMLTargets['my_canvas'] = my_canvas_object;
                    }
                ],
            };
        </script>

    In that case, pass the same string to sokol_app.h which is used as key
    in the specialHTMLTargets[] map:

        .html5.canvas_selector = "my_canvas"

    If sokol_app.h can't find your canvas for some reason check for warning
    messages on the browser console.


    OPTIONAL: DON'T HIJACK main() (#define SOKOL_NO_ENTRY)
    ======================================================
    NOTE: SOKOL_NO_ENTRY and sapp_run() is currently not supported on Android.

    In its default configuration, sokol_app.h "hijacks" the platform's
    standard main() function. This was done because different platforms
    have different entry point conventions which are not compatible with
    C's main() (for instance WinMain on Windows has completely different
    arguments). However, this "main hijacking" posed a problem for
    usage scenarios like integrating sokol_app.h with other languages than
    C or C++, so an alternative SOKOL_NO_ENTRY mode has been added
    in which the user code provides the platform's main function:

    - define SOKOL_NO_ENTRY before including the sokol_app.h implementation
    - do *not* provide a sokol_main() function
    - instead provide the standard main() function of the platform
    - from the main function, call the function ```sapp_run()``` which
      takes a pointer to an ```sapp_desc``` structure.
    - from here on```sapp_run()``` takes over control and calls the provided
      init-, frame-, event- and cleanup-callbacks just like in the default model.

    sapp_run() behaves differently across platforms:

        - on some platforms, sapp_run() will return when the application quits
        - on other platforms, sapp_run() will never return, even when the
          application quits (the operating system is free to simply terminate
          the application at any time)
        - on Emscripten specifically, sapp_run() will return immediately while
          the frame callback keeps being called

    This different behaviour of sapp_run() essentially means that there shouldn't
    be any code *after* sapp_run(), because that may either never be called, or in
    case of Emscripten will be called at an unexpected time (at application start).

    An application also should not depend on the cleanup-callback being called
    when cross-platform compatibility is required.

    Since sapp_run() returns immediately on Emscripten you shouldn't activate
    the 'EXIT_RUNTIME' linker option (this is disabled by default when compiling
    for the browser target), since the C/C++ exit runtime would be called immediately at
    application start, causing any global objects to be destroyed and global
    variables to be zeroed.

    WINDOWS CONSOLE OUTPUT
    ======================
    On Windows, regular windowed applications don't show any stdout/stderr text
    output, which can be a bit of a hassle for printf() debugging or generally
    logging text to the console. Also, console output by default uses a local
    codepage setting and thus international UTF-8 encoded text is printed
    as garbage.

    To help with these issues, sokol_app.h can be configured at startup
    via the following Windows-specific sapp_desc flags:

        sapp_desc.win32.console_utf8 (default: false)
            When set to true, the output console codepage will be switched
            to UTF-8 (and restored to the original codepage on exit)

        sapp_desc.win32.console_attach (default: false)
            When set to true, stdout and stderr will be attached to the
            console of the parent process (if the parent process actually
            has a console). This means that if the application was started
            in a command line window, stdout and stderr output will be printed
            to the terminal, just like a regular command line program. But if
            the application is started via double-click, it will behave like
            a regular UI application, and stdout/stderr will not be visible.

        sapp_desc.win32.console_create (default: false)
            When set to true, a new console window will be created and
            stdout/stderr will be redirected to that console window. It
            doesn't matter if the application is started from the command
            line or via double-click.

            NOTE: setting both win32.console_attach and win32.console_create
            to true also makes sense and has the effect that output
            will appear in the existing terminal when started from the cmdline, and
            otherwise (when started via double-click) will open a console window.

    MEMORY ALLOCATION OVERRIDE
    ==========================
    You can override the memory allocation functions at initialization time
    like this:

        void* my_alloc(size_t size, void* user_data) {
            return __sokol_malloc(size);
        }

        void my_free(void* ptr, void* user_data) {
            __sokol_free(ptr);
        }

        sapp_desc sokol_main(int argc, char* argv[]) {
            return (sapp_desc){
                // ...
                .allocator = {
                    .alloc_fn = my_alloc,
                    .free_fn = my_free,
                    .user_data = ...,
                }
            };
        }

    If no overrides are provided, malloc and free will be used.

    This only affects memory allocation calls done by sokol_app.h
    itself though, not any allocations in OS libraries.


    ERROR REPORTING AND LOGGING
    ===========================
    To get any logging information at all you need to provide a logging callback in the setup call
    the easiest way is to use sokol_log.h:

        #include "sokol_log.h"

        sapp_desc sokol_main(int argc, char* argv[]) {
            return (sapp_desc) {
                ...
                .logger.func = slog_func,
            };
        }

    To override logging with your own callback, first write a logging function like this:

        void my_log(const char* tag,                // e.g. 'sapp'
                    uint32_t log_level,             // 0=panic, 1=error, 2=warn, 3=info
                    uint32_t log_item_id,           // SAPP_LOGITEM_*
                    const char* message_or_null,    // a message string, may be nullptr in release mode
                    uint32_t line_nr,               // line number in sokol_app.h
                    const char* filename_or_null,   // source filename, may be nullptr in release mode
                    void* user_data)
        {
            ...
        }

    ...and then setup sokol-app like this:

        sapp_desc sokol_main(int argc, char* argv[]) {
            return (sapp_desc) {
                ...
                .logger = {
                    .func = my_log,
                    .user_data = my_user_data,
                }
            };
        }

    The provided logging function must be reentrant (e.g. be callable from
    different threads).

    If you don't want to provide your own custom logger it is highly recommended to use
    the standard logger in sokol_log.h instead, otherwise you won't see any warnings or
    errors.

    TEMP NOTE DUMP
    ==============
    - sapp_desc needs a bool whether to initialize depth-stencil surface
    - the Android implementation calls cleanup_cb() and destroys the egl context in onDestroy
      at the latest but should do it earlier, in onStop, as an app is "killable" after onStop
      on Android Honeycomb and later (it can't be done at the moment as the app may be started
      again after onStop and the sokol lifecycle does not yet handle context teardown/bringup)


    LICENSE
    =======
    zlib/libpng license

    Copyright (c) 2018 Andre Weissflog

    This software is provided 'as-is', without any express or implied warranty.
    In no event will the authors be held liable for any damages arising from the
    use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:

        1. The origin of this software must not be misrepresented; you must not
        claim that you wrote the original software. If you use this software in a
        product, an acknowledgment in the product documentation would be
        appreciated but is not required.

        2. Altered source versions must be plainly marked as such, and must not
        be misrepresented as being the original software.

        3. This notice may not be removed or altered from any source
        distribution.
*/
// ██ ███    ███ ██████  ██      ███████ ███    ███ ███████ ███    ██ ████████  █████  ████████ ██  ██████  ███    ██
// ██ ████  ████ ██   ██ ██      ██      ████  ████ ██      ████   ██    ██    ██   ██    ██    ██ ██    ██ ████   ██
// ██ ██ ████ ██ ██████  ██      █████   ██ ████ ██ █████   ██ ██  ██    ██    ███████    ██    ██ ██    ██ ██ ██  ██
// ██ ██  ██  ██ ██      ██      ██      ██  ██  ██ ██      ██  ██ ██    ██    ██   ██    ██    ██ ██    ██ ██  ██ ██
// ██ ██      ██ ██      ███████ ███████ ██      ██ ███████ ██   ████    ██    ██   ██    ██    ██  ██████  ██   ████
//
// >>implementation
// helper macros
// check if the config defines are alright
// Emscripten

private {
i64 _sapp_int64_muldiv(i64 value, i64 numer, i64 denom) {
    i64 q = value / denom;
    i64 r = value % denom;
    return q * numer + r * numer / denom;
}

void _sapp_timestamp_init(_sapp_timestamp_t* ts) {
    ignore ts;
}

f64 _sapp_timestamp_now(_sapp_timestamp_t* ts) {
    ignore ts;
    return cast(f64, clock()) / 1.0e9;
}

void _sapp_timing_init(_sapp_timing_t* t) {
    _sapp_timestamp_init(&t.timestamp);
    t.dt_min = 1.0e-6;
    t.dt_max = 0.1;
    t.dt_threshold = 0.004;
    t.alpha = 0.025;
    t.dt = 1.0 / 60.0;
    t.ema = t.dt;
    t.smooth_dt = t.dt;
}

f64 _sapp_timing_clamp(_sapp_timing_t* t, f64 dt) {
    assert(t.dt_min > 0.0 && t.dt_max > 0.0 && t.dt_max >= t.dt_min);
    if dt < t.dt_min {
        return t.dt_min;
    } else if dt > t.dt_max {
        return t.dt_max;
    } else {
        return dt;
    }
}

void _sapp_timing_delta(_sapp_timing_t* t, f64 dt) {
    dt = _sapp_timing_clamp(t, dt);
    t.dt = dt;
    f64 error = fabs(dt - t.smooth_dt);
    if error > t.dt_threshold {
        t.ema = dt;
        t.smooth_dt = dt;
    } else {
        t.ema = t.ema + t.alpha * (dt - t.ema);
        t.smooth_dt = _sapp_timing_clamp(t, t.ema);
    }
}

void _sapp_timing_update(_sapp_timing_t* t, f64 external_now) {
    f64 now;
    if external_now == 0.0 {
        now = _sapp_timestamp_now(&t.timestamp);
    } else {
        now = external_now;
    }
    if t.last > 0.0 {
        f64 dt = now - t.last;
        _sapp_timing_delta(t, dt);
    }
    t.last = now;
}

f64 _sapp_timing_get(_sapp_timing_t* t) {
    return t.smooth_dt;
}
_sapp_t _sapp;
}
// ██       ██████   ██████   ██████  ██ ███    ██  ██████
// ██      ██    ██ ██       ██       ██ ████   ██ ██
// ██      ██    ██ ██   ███ ██   ███ ██ ██ ██  ██ ██   ███
// ██      ██    ██ ██    ██ ██    ██ ██ ██  ██ ██ ██    ██
// ███████  ██████   ██████   ██████  ██ ██   ████  ██████
//
// >>logging
when defined(SOKOL_DEBUG) {
private {
u8*[131] _sapp_log_messages = {
    "OK: Ok", "MALLOC_FAILED: memory allocation failed",
    "SWAPCHAIN_DEPTHFORMAT_INVALID: sapp_desc.swapchain.depth_format must be zero, SAPP_PIXELFORMAT_NONE, SAPP_PIXELFORMAT_DEPTH or SAPP_PIXELFORMAT_DEPTH_STENCIL",
    "MACOS_INVALID_NSOPENGL_PROFILE: macos: invalid NSOpenGLProfile (valid choices are 1.0 and 4.1)",
    "METAL_CREATE_SWAPCHAIN_DEPTH_TEXTURE_FAILED: metal: failed to create swapchain depth-buffer texture",
    "METAL_CREATE_SWAPCHAIN_MSAA_TEXTURE_FAILED: metal: failed to create swapchain msaa texture",
    "WIN32_LOAD_OPENGL32_DLL_FAILED: failed loading opengl32.dll",
    "WIN32_CREATE_HELPER_WINDOW_FAILED: failed to create helper window",
    "WIN32_HELPER_WINDOW_GETDC_FAILED: failed to get helper window DC",
    "WIN32_DUMMY_CONTEXT_SET_PIXELFORMAT_FAILED: failed to set pixel format for dummy GL context",
    "WIN32_CREATE_DUMMY_CONTEXT_FAILED: failed to create dummy GL context",
    "WIN32_DUMMY_CONTEXT_MAKE_CURRENT_FAILED: failed to make dummy GL context current",
    "WIN32_GET_PIXELFORMAT_ATTRIB_FAILED: failed to get WGL pixel format attribute",
    "WIN32_WGL_FIND_PIXELFORMAT_FAILED: failed to find matching WGL pixel format",
    "WIN32_WGL_DESCRIBE_PIXELFORMAT_FAILED: failed to get pixel format descriptor",
    "WIN32_WGL_SET_PIXELFORMAT_FAILED: failed to set selected pixel format",
    "WIN32_WGL_ARB_CREATE_CONTEXT_REQUIRED: ARB_create_context required",
    "WIN32_WGL_ARB_CREATE_CONTEXT_PROFILE_REQUIRED: ARB_create_context_profile required",
    "WIN32_WGL_OPENGL_VERSION_NOT_SUPPORTED: requested OpenGL version not supported by GL driver (ERROR_INVALID_VERSION_ARB)",
    "WIN32_WGL_OPENGL_PROFILE_NOT_SUPPORTED: requested OpenGL profile not support by GL driver (ERROR_INVALID_PROFILE_ARB)",
    "WIN32_WGL_INCOMPATIBLE_DEVICE_CONTEXT: CreateContextAttribsARB failed with ERROR_INCOMPATIBLE_DEVICE_CONTEXTS_ARB",
    "WIN32_WGL_CREATE_CONTEXT_ATTRIBS_FAILED_OTHER: CreateContextAttribsARB failed for other reason",
    "WIN32_D3D11_CREATE_DEVICE_AND_SWAPCHAIN_WITH_DEBUG_FAILED: D3D11CreateDeviceAndSwapChain() with D3D11_CREATE_DEVICE_DEBUG failed, retrying without debug flag.",
    "WIN32_D3D11_GET_IDXGIFACTORY_FAILED: could not obtain IDXGIFactory object",
    "WIN32_D3D11_GET_IDXGIADAPTER_FAILED: could not obtain IDXGIAdapter object",
    "WIN32_D3D11_QUERY_INTERFACE_IDXGIDEVICE1_FAILED: could not obtain IDXGIDevice1 interface",
    "WIN32_REGISTER_RAW_INPUT_DEVICES_FAILED_MOUSE_LOCK: RegisterRawInputDevices() failed (on mouse lock)",
    "WIN32_REGISTER_RAW_INPUT_DEVICES_FAILED_MOUSE_UNLOCK: RegisterRawInputDevices() failed (on mouse unlock)",
    "WIN32_GET_RAW_INPUT_DATA_FAILED: GetRawInputData() failed",
    "WIN32_DESTROYICON_FOR_CURSOR_FAILED: DestroyIcon() for a cursor image failed",
    "LINUX_GLX_LOAD_LIBGL_FAILED: failed to load libGL",
    "LINUX_GLX_LOAD_ENTRY_POINTS_FAILED: failed to load GLX entry points",
    "LINUX_GLX_EXTENSION_NOT_FOUND: GLX extension not found",
    "LINUX_GLX_QUERY_VERSION_FAILED: failed to query GLX version",
    "LINUX_GLX_VERSION_TOO_LOW: GLX version too low (need at least 1.3)",
    "LINUX_GLX_NO_GLXFBCONFIGS: glXGetFBConfigs() returned no configs",
    "LINUX_GLX_NO_SUITABLE_GLXFBCONFIG: failed to find a suitable GLXFBConfig",
    "LINUX_GLX_GET_VISUAL_FROM_FBCONFIG_FAILED: glXGetVisualFromFBConfig failed",
    "LINUX_GLX_REQUIRED_EXTENSIONS_MISSING: GLX extensions ARB_create_context and ARB_create_context_profile missing",
    "LINUX_GLX_CREATE_CONTEXT_FAILED: Failed to create GL context via glXCreateContextAttribsARB",
    "LINUX_GLX_CREATE_WINDOW_FAILED: glXCreateWindow() failed",
    "LINUX_X11_CREATE_WINDOW_FAILED: XCreateWindow() failed",
    "LINUX_EGL_BIND_OPENGL_API_FAILED: eglBindAPI(EGL_OPENGL_API) failed",
    "LINUX_EGL_BIND_OPENGL_ES_API_FAILED: eglBindAPI(EGL_OPENGL_ES_API) failed",
    "LINUX_EGL_GET_DISPLAY_FAILED: eglGetDisplay() failed",
    "LINUX_EGL_INITIALIZE_FAILED: eglInitialize() failed",
    "LINUX_EGL_NO_CONFIGS: eglChooseConfig() returned no configs",
    "LINUX_EGL_NO_NATIVE_VISUAL: eglGetConfigAttrib() for EGL_NATIVE_VISUAL_ID failed",
    "LINUX_EGL_GET_VISUAL_INFO_FAILED: XGetVisualInfo() failed",
    "LINUX_EGL_CREATE_WINDOW_SURFACE_FAILED: eglCreateWindowSurface() failed",
    "LINUX_EGL_CREATE_CONTEXT_FAILED: eglCreateContext() failed",
    "LINUX_EGL_MAKE_CURRENT_FAILED: eglMakeCurrent() failed",
    "LINUX_X11_OPEN_DISPLAY_FAILED: XOpenDisplay() failed",
    "LINUX_X11_QUERY_SYSTEM_DPI_FAILED: failed to query system dpi value, assuming default 96.0",
    "LINUX_X11_DROPPED_FILE_URI_WRONG_SCHEME: dropped file URL doesn't start with 'file://'",
    "LINUX_X11_FAILED_TO_BECOME_OWNER_OF_CLIPBOARD: X11: Failed to become owner of clipboard selection",
    "ANDROID_UNSUPPORTED_INPUT_EVENT_INPUT_CB: unsupported input event encountered in _sapp_android_input_cb()",
    "ANDROID_UNSUPPORTED_INPUT_EVENT_MAIN_CB: unsupported input event encountered in _sapp_android_main_cb()",
    "ANDROID_READ_MSG_FAILED: failed to read message in _sapp_android_main_cb()",
    "ANDROID_WRITE_MSG_FAILED: failed to write message in _sapp_android_msg",
    "ANDROID_MSG_CREATE: MSG_CREATE", "ANDROID_MSG_RESUME: MSG_RESUME",
    "ANDROID_MSG_PAUSE: MSG_PAUSE", "ANDROID_MSG_FOCUS: MSG_FOCUS",
    "ANDROID_MSG_NO_FOCUS: MSG_NO_FOCUS", "ANDROID_MSG_SET_NATIVE_WINDOW: MSG_SET_NATIVE_WINDOW",
    "ANDROID_MSG_SET_INPUT_QUEUE: MSG_SET_INPUT_QUEUE", "ANDROID_MSG_DESTROY: MSG_DESTROY",
    "ANDROID_UNKNOWN_MSG: unknown msg type received",
    "ANDROID_LOOP_THREAD_STARTED: loop thread started",
    "ANDROID_LOOP_THREAD_DONE: loop thread done",
    "ANDROID_NATIVE_ACTIVITY_ONSTART: NativeActivity onStart()",
    "ANDROID_NATIVE_ACTIVITY_ONRESUME: NativeActivity onResume",
    "ANDROID_NATIVE_ACTIVITY_ONSAVEINSTANCESTATE: NativeActivity onSaveInstanceState",
    "ANDROID_NATIVE_ACTIVITY_ONWINDOWFOCUSCHANGED: NativeActivity onWindowFocusChanged",
    "ANDROID_NATIVE_ACTIVITY_ONPAUSE: NativeActivity onPause",
    "ANDROID_NATIVE_ACTIVITY_ONSTOP: NativeActivity onStop()",
    "ANDROID_NATIVE_ACTIVITY_ONNATIVEWINDOWCREATED: NativeActivity onNativeWindowCreated",
    "ANDROID_NATIVE_ACTIVITY_ONNATIVEWINDOWDESTROYED: NativeActivity onNativeWindowDestroyed",
    "ANDROID_NATIVE_ACTIVITY_ONINPUTQUEUECREATED: NativeActivity onInputQueueCreated",
    "ANDROID_NATIVE_ACTIVITY_ONINPUTQUEUEDESTROYED: NativeActivity onInputQueueDestroyed",
    "ANDROID_NATIVE_ACTIVITY_ONCONFIGURATIONCHANGED: NativeActivity onConfigurationChanged",
    "ANDROID_NATIVE_ACTIVITY_ONLOWMEMORY: NativeActivity onLowMemory",
    "ANDROID_NATIVE_ACTIVITY_ONDESTROY: NativeActivity onDestroy",
    "ANDROID_NATIVE_ACTIVITY_DONE: NativeActivity done",
    "ANDROID_NATIVE_ACTIVITY_ONCREATE: NativeActivity onCreate",
    "ANDROID_CREATE_THREAD_PIPE_FAILED: failed to create thread pipe",
    "ANDROID_NATIVE_ACTIVITY_CREATE_SUCCESS: NativeActivity successfully created",
    "ANDROID_CHOREOGRAPHER_ENABLED: Choreographer frame loop enabled",
    "ANDROID_CHOREOGRAPHER_UNAVAILABLE: Choreographer unavailable, using poll loop",
    "WGPU_DEVICE_LOST: wgpu: device lost", "WGPU_DEVICE_LOG: wgpu: device log",
    "WGPU_DEVICE_UNCAPTURED_ERROR: wgpu: uncaptured error",
    "WGPU_SWAPCHAIN_CREATE_SURFACE_FAILED: wgpu: failed to create surface for swapchain",
    "WGPU_SWAPCHAIN_SURFACE_GET_CAPABILITIES_FAILED: wgpu: wgpuSurfaceGetCapabilities failed",
    "WGPU_SWAPCHAIN_CREATE_DEPTH_STENCIL_TEXTURE_FAILED: wgpu: failed to create depth-stencil texture for swapchain",
    "WGPU_SWAPCHAIN_CREATE_DEPTH_STENCIL_VIEW_FAILED: wgpu: failed to create view object for swapchain depth-stencil texture",
    "WGPU_SWAPCHAIN_CREATE_MSAA_TEXTURE_FAILED: wgpu: failed to create msaa texture for swapchain",
    "WGPU_SWAPCHAIN_CREATE_MSAA_VIEW_FAILED: wgpu: failed to create view object for swapchain msaa texture",
    "WGPU_SWAPCHAIN_GETCURRENTTEXTURE_FAILED: wgpu: wgpuSurfaceGetCurrentTexture() failed",
    "WGPU_REQUEST_DEVICE_STATUS_ERROR: wgpu: requesting device failed with status 'error'",
    "WGPU_REQUEST_DEVICE_STATUS_UNKNOWN: wgpu: requesting device failed with status 'unknown'",
    "WGPU_REQUEST_ADAPTER_STATUS_UNAVAILABLE: wgpu: requesting adapter failed with 'unavailable'",
    "WGPU_REQUEST_ADAPTER_STATUS_ERROR: wgpu: requesting adapter failed with status 'error'",
    "WGPU_REQUEST_ADAPTER_STATUS_UNKNOWN: wgpu: requesting adapter failed with status 'unknown'",
    "WGPU_CREATE_INSTANCE_FAILED: wgpu: failed to create instance", "VULKAN_DEBUG_GENERAL: ",
    "VULKAN_DEBUG_VALIDATION: ", "VULKAN_DEBUG_PERFORMANCE: ",
    "VULKAN_REQUIRED_INSTANCE_EXTENSION_FUNCTION_MISSING: vulkan: could not lookup a required instance extension function pointer",
    "VULKAN_ALLOC_DEVICE_MEMORY_NO_SUITABLE_MEMORY_TYPE: vulkan: could not find suitable memory type",
    "VULKAN_ALLOCATE_MEMORY_FAILED: vulkan: vkAllocateMemory() failed!",
    "VULKAN_CREATE_INSTANCE_FAILED: vulkan: vkCreateInstance failed",
    "VULKAN_ENUMERATE_PHYSICAL_DEVICES_FAILED: vulkan: vkEnumeratePhysicalDevices failed",
    "VULKAN_NO_PHYSICAL_DEVICES_FOUND: vulkan: vkEnumeratePhysicalDevices return no devices",
    "VULKAN_NO_SUITABLE_PHYSICAL_DEVICE_FOUND: vulkan: no suitable physical device found",
    "VULKAN_CREATE_DEVICE_FAILED_EXTENSION_NOT_PRESENT: vulkan: vkCreateDevice failed (extension not present)",
    "VULKAN_CREATE_DEVICE_FAILED_FEATURE_NOT_PRESENT: vulkan: vkCreateDevice failed (feature not present)",
    "VULKAN_CREATE_DEVICE_FAILED_INITIALIZATION_FAILED: vulkan: vkCreateDevice failed (initialization failed)",
    "VULKAN_CREATE_DEVICE_FAILED_OTHER: vulkan: vkCreateDevice failed (other)",
    "VULKAN_CREATE_SURFACE_FAILED: vulkan: vkCreate*SurfaceKHR failed",
    "VULKAN_CREATE_SWAPCHAIN_FAILED: vulkan: vkCreateSwapchainKHR failed",
    "VULKAN_SWAPCHAIN_CREATE_IMAGE_VIEW_FAILED: vulkan: vkCreateImageView for swapchain image failed",
    "VULKAN_SWAPCHAIN_CREATE_IMAGE_FAILED: vulkan: vkCreateImage for depth-stencil image failed",
    "VULKAN_SWAPCHAIN_ALLOC_IMAGE_DEVICE_MEMORY_FAILED: vulkan: failed to allocate device memory for depth-stencil image",
    "VULKAN_SWAPCHAIN_BIND_IMAGE_MEMORY_FAILED: vulkan: vkBindImageMemory() for depth-stencil image failed",
    "VULKAN_ACQUIRE_NEXT_IMAGE_FAILED: vulkan: vkAcquireNextImageKHR failed",
    "VULKAN_QUEUE_PRESENT_FAILED: vulkan: vkQueuePresentKHR failed",
    "IMAGE_DATA_SIZE_MISMATCH: image data size mismatch (must be width*height*4 bytes)",
    "DROPPED_FILE_PATH_TOO_LONG: dropped file path too long (sapp_desc.max_dropped_filed_path_length)",
    "CLIPBOARD_STRING_TOO_BIG: clipboard string didn't fit into clipboard buffer",
};
}
}

private {
void _sapp_log(sapp_log_item log_item, u32 log_level, u8* msg, u32 line_nr) {
    if _sapp.desc.logger.func != null {
        u8* filename = null;
        when defined(SOKOL_DEBUG) {
            filename = __file__;
            if null == msg {
                msg = _sapp_log_messages[log_item];
            }
        }
        _sapp.desc.logger.func("sapp", log_level, cast(u32, log_item), msg, line_nr, filename, _sapp.desc.logger.user_data);
    } else {
        if log_level == 0 {
            __sokol_abort();
        }
    }
}

// ███    ███ ███████ ███    ███  ██████  ██████  ██    ██
// ████  ████ ██      ████  ████ ██    ██ ██   ██  ██  ██
// ██ ████ ██ █████   ██ ████ ██ ██    ██ ██████    ████
// ██  ██  ██ ██      ██  ██  ██ ██    ██ ██   ██    ██
// ██      ██ ███████ ██      ██  ██████  ██   ██    ██
//
// >>memory
void _sapp_clear(void* ptr, u64 size) {
    assert(ptr != null && size > 0);
    memset(ptr, 0, size);
}

void* _sapp_malloc(u64 size) {
    assert(size > 0);
    void* ptr;
    if _sapp.desc.allocator.alloc_fn != null {
        ptr = _sapp.desc.allocator.alloc_fn(size, _sapp.desc.allocator.user_data);
    } else {
        ptr = alloc(cast(i64, size));
    }
    if null == ptr {
        _sapp_log(SAPP_LOGITEM_MALLOC_FAILED, 0, null, __line__);
    }
    return ptr;
}

void* _sapp_malloc_clear(u64 size) {
    void* ptr = _sapp_malloc(size);
    _sapp_clear(ptr, size);
    return ptr;
}

void _sapp_free(void* ptr) {
    if _sapp.desc.allocator.free_fn != null {
        _sapp.desc.allocator.free_fn(ptr, _sapp.desc.allocator.user_data);
    } else {
        __sokol_free(ptr);
    }
}

// ██   ██ ███████ ██      ██████  ███████ ██████  ███████
// ██   ██ ██      ██      ██   ██ ██      ██   ██ ██
// ███████ █████   ██      ██████  █████   ██████  ███████
// ██   ██ ██      ██      ██      ██      ██   ██      ██
// ██   ██ ███████ ███████ ██      ███████ ██   ██ ███████
//
// >>helpers
// round float to int and at least 1
i32 _sapp_roundf_gzero(f32 f) {
    var val = cast(i32, round(f));
    if val <= 0 {
        val = 1;
    }
    return val;
}

void _sapp_call_init() {
    if _sapp.desc.init_cb != null {
        _sapp.desc.init_cb();
    } else if _sapp.desc.init_userdata_cb != null {
        _sapp.desc.init_userdata_cb(_sapp.desc.user_data);
    }
    _sapp.init_called = true;
}

void _sapp_call_frame() {
    if _sapp.init_called && !_sapp.cleanup_called {
        if _sapp.desc.frame_cb != null {
            _sapp.desc.frame_cb();
        } else if _sapp.desc.frame_userdata_cb != null {
            _sapp.desc.frame_userdata_cb(_sapp.desc.user_data);
        }
    }
}

void _sapp_call_cleanup() {
    if !_sapp.cleanup_called {
        if _sapp.desc.cleanup_cb != null {
            _sapp.desc.cleanup_cb();
        } else if _sapp.desc.cleanup_userdata_cb != null {
            _sapp.desc.cleanup_userdata_cb(_sapp.desc.user_data);
        }
        _sapp.cleanup_called = true;
    }
}

bool _sapp_call_event(sapp_event* e) {
    if !_sapp.cleanup_called {
        if _sapp.desc.event_cb != null {
            _sapp.desc.event_cb(e);
        } else if _sapp.desc.event_userdata_cb != null {
            _sapp.desc.event_userdata_cb(e, _sapp.desc.user_data);
        }
    }
    if _sapp.event_consumed {
        _sapp.event_consumed = false;
        return true;
    } else {
        return false;
    }
}

u8* _sapp_dropped_file_path_ptr(i32 index) {
    assert(cast(i64, _sapp.drop.buffer));
    assert(index >= 0 && index <= _sapp.drop.max_files);
    i32 offset = index * _sapp.drop.max_path_length;
    assert(offset < _sapp.drop.buf_size);
    return &_sapp.drop.buffer[offset];
}

/* Copy a string (either zero-terminated or with explicit length)
   into a fixed size buffer with guaranteed zero-termination.

   Return false if the string didn't fit into the buffer and had to be clamped.

   FIXME: Currently UTF-8 strings might become invalid if the string
   is clamped, because the last zero-byte might be written into
   the middle of a multi-byte sequence.
*/
bool _sapp_strcpy_range(u8* src, u64 src_len, u8* dst, u64 dst_buf_len) {
    assert(src != null && dst != null && dst_buf_len > 0);
    if 0 == src_len {
        src_len = dst_buf_len;
    }
    u8* end = &dst[dst_buf_len - 1];
    u8 c = 0;
    for u64 i = 0; i < dst_buf_len; i++ {
        c = *src;
        if i >= src_len {
            c = 0;
        }
        if c != 0 {
            src++;
        }
        *dst++ = c;
    }
    if c != 0 {
        *end = 0;
        return false;
    } else {
        return true;
    }
}

bool _sapp_strcpy(u8* src, u8* dst, u64 dst_buf_len) {
    return _sapp_strcpy_range(src, 0, dst, dst_buf_len);
}

sapp_desc _sapp_desc_defaults(sapp_desc* desc) {
    assert(desc != null && (desc.allocator.alloc_fn != null && desc.allocator.free_fn != null || desc.allocator.alloc_fn == null && desc.allocator.free_fn == null));
    sapp_desc res = *desc;
    res.depth_format = res.depth_format == 0 ? cast(i32, SAPP_PIXELFORMAT_DEPTH) : res.depth_format;
    res.composite_mode = res.composite_mode == 0 ? cast(i32, SAPP_COMPOSITEMODE_OPAQUE) : res.composite_mode;
    res.sample_count = res.sample_count == 0 ? 1 : res.sample_count;
    res.swap_interval = res.swap_interval == 0 ? 1 : res.swap_interval;
    if 0 == res.gl.major_version {
        res.gl.major_version = 3;
        res.gl.minor_version = 0;
    }
    res.html5.canvas_selector = res.html5.canvas_selector == null ? "#canvas" : res.html5.canvas_selector;
    res.clipboard_size = res.clipboard_size == 0 ? 8192 : res.clipboard_size;
    res.max_dropped_files = res.max_dropped_files == 0 ? 1 : res.max_dropped_files;
    res.max_dropped_file_path_length = res.max_dropped_file_path_length == 0 ? 2048 : res.max_dropped_file_path_length;
    res.window_title = res.window_title == null ? "sokol" : res.window_title;
    return res;
}

void _sapp_assert_desc(sapp_desc* desc) {
    switch desc.depth_format {
        case SAPP_PIXELFORMAT_NONE, SAPP_PIXELFORMAT_DEPTH, SAPP_PIXELFORMAT_DEPTH_STENCIL: {
        }
        default: {
            _sapp_log(SAPP_LOGITEM_SWAPCHAIN_DEPTHFORMAT_INVALID, 0, null, __line__);
        }
    }
}

void _sapp_init_state(sapp_desc* desc) {
    assert(cast(i64, desc));
    assert(desc.width >= 0);
    assert(desc.height >= 0);
    assert(desc.sample_count >= 0);
    assert(desc.swap_interval >= 0);
    assert(desc.clipboard_size >= 0);
    assert(desc.max_dropped_files >= 0);
    assert(desc.max_dropped_file_path_length >= 0);
    {
        _sapp_clear(&_sapp, cast(u64, sizeof(_sapp)));
    }
    _sapp.desc = _sapp_desc_defaults(desc);
    _sapp_assert_desc(&_sapp.desc);
    _sapp.first_frame = true;
    _sapp.window_width = _sapp.desc.width;
    _sapp.window_height = _sapp.desc.height;
    _sapp.framebuffer_width = _sapp.window_width;
    _sapp.framebuffer_height = _sapp.window_height;
    _sapp_strcpy(_sapp.desc.html5.canvas_selector, _sapp.html5_canvas_selector, 128);
    _sapp.desc.html5.canvas_selector = _sapp.html5_canvas_selector;
    _sapp.html5_ask_leave_site = _sapp.desc.html5.ask_leave_site;
    _sapp.clipboard.enabled = _sapp.desc.enable_clipboard;
    if _sapp.clipboard.enabled {
        _sapp.clipboard.buf_size = _sapp.desc.clipboard_size;
        _sapp.clipboard.buffer = cast(u8*, _sapp_malloc_clear(cast(u64, _sapp.clipboard.buf_size)));
    }
    _sapp.drop.enabled = _sapp.desc.enable_dragndrop;
    if _sapp.drop.enabled {
        _sapp.drop.max_files = _sapp.desc.max_dropped_files;
        _sapp.drop.max_path_length = _sapp.desc.max_dropped_file_path_length;
        _sapp.drop.buf_size = _sapp.drop.max_files * _sapp.drop.max_path_length;
        _sapp.drop.buffer = cast(u8*, _sapp_malloc_clear(cast(u64, _sapp.drop.buf_size)));
    }
    _sapp_strcpy(_sapp.desc.window_title, _sapp.window_title, 128);
    _sapp.desc.window_title = _sapp.window_title;
    _sapp.dpi_scale = 1.0f;
    _sapp.fullscreen = _sapp.desc.fullscreen;
    _sapp.mouse.shown = true;
    _sapp_timing_init(&_sapp.timing);
}

void _sapp_discard_state() {
    if _sapp.clipboard.enabled {
        assert(cast(i64, _sapp.clipboard.buffer));
        _sapp_free(cast(void*, _sapp.clipboard.buffer));
    }
    if _sapp.drop.enabled {
        assert(cast(i64, _sapp.drop.buffer));
        _sapp_free(cast(void*, _sapp.drop.buffer));
    }
    if _sapp.default_icon_pixels != null {
        _sapp_free(cast(void*, _sapp.default_icon_pixels));
    }
    for i32 i = 0; i < _SAPP_MOUSECURSOR_NUM; i++ {
        sapp_unbind_mouse_cursor_image(cast(sapp_mouse_cursor, i));
    }
    {
        _sapp_clear(&_sapp, cast(u64, sizeof(_sapp)));
    }
}

void _sapp_init_event(sapp_event_type type) {
    _sapp_clear(&_sapp.event, cast(u64, sizeof(sapp_event)));
    _sapp.event.type = type;
    _sapp.event.frame_count = _sapp.frame_count;
    _sapp.event.mouse_button = SAPP_MOUSEBUTTON_INVALID;
    _sapp.event.window_width = _sapp.window_width;
    _sapp.event.window_height = _sapp.window_height;
    _sapp.event.framebuffer_width = _sapp.framebuffer_width;
    _sapp.event.framebuffer_height = _sapp.framebuffer_height;
    _sapp.event.mouse_x = _sapp.mouse.x;
    _sapp.event.mouse_y = _sapp.mouse.y;
    _sapp.event.mouse_dx = _sapp.mouse.dx;
    _sapp.event.mouse_dy = _sapp.mouse.dy;
}

bool _sapp_events_enabled() {
    return (_sapp.desc.event_cb != null || _sapp.desc.event_userdata_cb != null) && _sapp.init_called;
}

sapp_keycode _sapp_translate_key(i32 scan_code) {
    if scan_code >= 0 && scan_code < SAPP_MAX_KEYCODES {
        return _sapp.keycodes[scan_code];
    } else {
        return SAPP_KEYCODE_INVALID;
    }
}

void _sapp_clear_drop_buffer() {
    if _sapp.drop.enabled {
        assert(cast(i64, _sapp.drop.buffer));
        _sapp_clear(_sapp.drop.buffer, cast(u64, _sapp.drop.buf_size));
    }
}

void _sapp_frame() {
    if _sapp.first_frame {
        _sapp.first_frame = false;
        _sapp_call_init();
    }
    _sapp_call_frame();
    _sapp.frame_count++;
}

bool _sapp_image_validate(sapp_image_desc* desc) {
    assert(desc.width > 0);
    assert(desc.height > 0);
    assert(desc.pixels.ptr != null);
    assert(desc.pixels.size > 0);
    u64 wh_size = cast(u64, desc.width * desc.height) * cast(u64, sizeof(u32));
    if wh_size != desc.pixels.size {
        _sapp_log(SAPP_LOGITEM_IMAGE_DATA_SIZE_MISMATCH, 1, null, __line__);
        return false;
    }
    return true;
}

i32 _sapp_image_bestmatch(sapp_image_desc* image_descs, i32 num_images, i32 width, i32 height) {
    i32 least_diff = 0x7FFFFFFF;
    i32 least_index = 0;
    for i32 i = 0; i < num_images; i++ {
        i32 diff = image_descs[i].width * image_descs[i].height - width * height;
        if diff < 0 {
            diff = -diff;
        }
        if diff < least_diff {
            least_diff = diff;
            least_index = i;
        }
    }
    return least_index;
}

i32 _sapp_icon_num_images(sapp_icon_desc* desc) {
    i32 index = 0;
    for ; index < SAPP_MAX_ICONIMAGES; index++ {
        if null == desc.images[index].pixels.ptr {
            break;
        }
    }
    return index;
}

bool _sapp_validate_icon_desc(sapp_icon_desc* desc, i32 num_images) {
    assert(num_images <= SAPP_MAX_ICONIMAGES);
    for i32 i = 0; i < num_images; i++ {
        sapp_image_desc* img_desc = &desc.images[i];
        if !_sapp_image_validate(img_desc) {
            return false;
        }
    }
    return true;
}

void _sapp_setup_default_icon() {
    assert(null == _sapp.default_icon_pixels);
    i32 num_icons = 3;
    i32[3] icon_sizes = {16, 32, 64};
    i32 all_num_pixels = 0;
    for i32 i = 0; i < num_icons; i++ {
        all_num_pixels += icon_sizes[i] * icon_sizes[i];
    }
    _sapp.default_icon_pixels = cast(u32*, _sapp_malloc_clear(cast(u64, all_num_pixels) * cast(u64, sizeof(u32))));
    u32* dst = _sapp.default_icon_pixels;
    u32* dst_end = dst + all_num_pixels;
    ignore dst_end;
    for i32 i = 0; i < num_icons; i++ {
        i32 dim = icon_sizes[i];
        i32 num_pixels = dim * dim;
        sapp_image_desc* img_desc = &_sapp.default_icon_desc.images[i];
        img_desc.width = dim;
        img_desc.height = dim;
        img_desc.pixels.ptr = dst;
        img_desc.pixels.size = cast(u64, num_pixels) * cast(u64, sizeof(u32));
        dst += num_pixels;
    }
    assert(dst == dst_end);
    u8[8] tile = {0x3C, 0x66, 0x60, 0x3C, 0x06, 0x66, 0x3C, 0x00};
    u32[8] colors = {
        0xFF4370FF, 0xFF26A7FF, 0xFF58EEFF, 0xFF57E1D4, 0xFF65CC9C, 0xFF6ABB66, 0xFFF5A542,
        0xFFC2577E,
    };
    dst = _sapp.default_icon_pixels;
    u32 blank = 0x00FFFFFF;
    u32 shadow = 0xFF000000;
    for i32 i = 0; i < num_icons; i++ {
        i32 dim = icon_sizes[i];
        assert(dim % 8 == 0);
        i32 scale = dim / 8;
        for i32 ty = 0; ty < 8; ty++ {
            u32 color = colors[ty];
            for i32 sy = 0; sy < scale; sy++ {
                u8 bits = tile[ty];
                for i32 tx = 0; tx < 8; tx++ {
                    u32 pixel = 0 == (bits & 0x80) ? blank : color;
                    for i32 sx = 0; sx < scale; sx++ {
                        assert(dst < dst_end);
                        *dst++ = pixel;
                    }
                    bits <<= 1;
                }
            }
        }
    }
    assert(dst == dst_end);
    dst = _sapp.default_icon_pixels;
    for i32 i = 0; i < num_icons; i++ {
        i32 dim = icon_sizes[i];
        for i32 y = 0; y < dim; y++ {
            u32 prev_color = blank;
            for i32 x = 0; x < dim; x++ {
                i32 dst_index = y * dim + x;
                u32 cur_color = dst[dst_index];
                if cur_color == blank && prev_color != blank {
                    dst[dst_index] = shadow;
                }
                prev_color = cur_color;
            }
        }
        dst += dim * dim;
    }
    assert(dst == dst_end);
    dst = _sapp.default_icon_pixels;
    for i32 i = 0; i < num_icons; i++ {
        i32 dim = icon_sizes[i];
        for i32 x = 0; x < dim; x++ {
            u32 prev_color = blank;
            for i32 y = 0; y < dim; y++ {
                i32 dst_index = y * dim + x;
                u32 cur_color = dst[dst_index];
                if cur_color == blank && prev_color != blank {
                    dst[dst_index] = shadow;
                }
                prev_color = cur_color;
            }
        }
        dst += dim * dim;
    }
    assert(dst == dst_end);
}
}

// ██     ██  ██████  ██████  ██    ██
// ██     ██ ██       ██   ██ ██    ██
// ██  █  ██ ██   ███ ██████  ██    ██
// ██ ███ ██ ██    ██ ██      ██    ██
//  ███ ███   ██████  ██       ██████
//
// >>wgpu
// ██    ██ ██    ██ ██      ██   ██  █████  ███    ██
// ██    ██ ██    ██ ██      ██  ██  ██   ██ ████   ██
// ██    ██ ██    ██ ██      █████   ███████ ██ ██  ██
//  ██  ██  ██    ██ ██      ██  ██  ██   ██ ██  ██ ██
//   ████    ██████  ███████ ██   ██ ██   ██ ██   ████
//
// >>vulkan
// >>vk
//  █████  ██████  ██████  ██      ███████
// ██   ██ ██   ██ ██   ██ ██      ██
// ███████ ██████  ██████  ██      █████
// ██   ██ ██      ██      ██      ██
// ██   ██ ██      ██      ███████ ███████
//
// >>apple
// ███████ ███    ███ ███████  ██████ ██████  ██ ██████  ████████ ███████ ███    ██
// ██      ████  ████ ██      ██      ██   ██ ██ ██   ██    ██    ██      ████   ██
// █████   ██ ████ ██ ███████ ██      ██████  ██ ██████     ██    █████   ██ ██  ██
// ██      ██  ██  ██      ██ ██      ██   ██ ██ ██         ██    ██      ██  ██ ██
// ███████ ██      ██ ███████  ██████ ██   ██ ██ ██         ██    ███████ ██   ████
//
//  ██████  ██          ██   ██ ███████ ██      ██████  ███████ ██████  ███████
// ██       ██          ██   ██ ██      ██      ██   ██ ██      ██   ██ ██
// ██   ███ ██          ███████ █████   ██      ██████  █████   ██████  ███████
// ██    ██ ██          ██   ██ ██      ██      ██      ██      ██   ██      ██
//  ██████  ███████     ██   ██ ███████ ███████ ██      ███████ ██   ██ ███████
//
// >>gl helpers
// ██     ██ ██ ███    ██ ██████   ██████  ██     ██ ███████
// ██     ██ ██ ████   ██ ██   ██ ██    ██ ██     ██ ██
// ██  █  ██ ██ ██ ██  ██ ██   ██ ██    ██ ██  █  ██ ███████
// ██ ███ ██ ██ ██  ██ ██ ██   ██ ██    ██ ██ ███ ██      ██
//  ███ ███  ██ ██   ████ ██████   ██████   ███ ███  ███████
//
// >>windows
//  █████  ███    ██ ██████  ██████   ██████  ██ ██████
// ██   ██ ████   ██ ██   ██ ██   ██ ██    ██ ██ ██   ██
// ███████ ██ ██  ██ ██   ██ ██████  ██    ██ ██ ██   ██
// ██   ██ ██  ██ ██ ██   ██ ██   ██ ██    ██ ██ ██   ██
// ██   ██ ██   ████ ██████  ██   ██  ██████  ██ ██████
//
// >>android
// ██      ██ ███    ██ ██    ██ ██   ██
// ██      ██ ████   ██ ██    ██  ██ ██
// ██      ██ ██ ██  ██ ██    ██   ███
// ██      ██ ██  ██ ██ ██    ██  ██ ██
// ███████ ██ ██   ████  ██████  ██   ██
//
// >>linux
// ██████  ██    ██ ██████  ██      ██  ██████
// ██   ██ ██    ██ ██   ██ ██      ██ ██
// ██████  ██    ██ ██████  ██      ██ ██
// ██      ██    ██ ██   ██ ██      ██ ██
// ██       ██████  ██████  ███████ ██  ██████
//
// >>public
void sapp_run(sapp_desc* desc) {
    assert(cast(i64, desc));
    _sapp_emsc_run(desc);
}

/* this is just a stub so the linker doesn't complain */
sapp_desc sokol_main(i32 argc, u8** argv) {
    ignore argc;
    ignore argv;
    sapp_desc desc;
    return desc;
}

bool sapp_isvalid() {
    return _sapp.valid;
}

void* sapp_userdata() {
    return _sapp.desc.user_data;
}

sapp_desc sapp_query_desc() {
    return _sapp.desc;
}

u64 sapp_frame_count() {
    return _sapp.frame_count;
}

f64 sapp_frame_duration() {
    if _sapp.desc.disable_vsync {
        return _sapp.timing.dt;
    } else {
        return _sapp_timing_get(&_sapp.timing);
    }
}

f64 sapp_frame_duration_unfiltered() {
    return _sapp.timing.dt;
}

i32 sapp_width() {
    return _sapp.framebuffer_width > 0 ? _sapp.framebuffer_width : 1;
}

f32 sapp_widthf() {
    return cast(f32, sapp_width());
}

i32 sapp_height() {
    return _sapp.framebuffer_height > 0 ? _sapp.framebuffer_height : 1;
}

f32 sapp_heightf() {
    return cast(f32, sapp_height());
}

sapp_pixel_format sapp_color_format() {
    return SAPP_PIXELFORMAT_RGBA8;
}

sapp_pixel_format sapp_depth_format() {
    return _sapp.desc.depth_format;
}

i32 sapp_sample_count() {
    return _sapp.desc.sample_count;
}

bool sapp_high_dpi() {
    return _sapp.desc.high_dpi && _sapp.dpi_scale >= 1.5f;
}

f32 sapp_dpi_scale() {
    return _sapp.dpi_scale;
}

void* sapp_egl_get_display() {
    assert(cast(i64, _sapp.valid));
    return null;
}

void* sapp_egl_get_context() {
    assert(cast(i64, _sapp.valid));
    return null;
}

void sapp_show_keyboard(bool show) {
    ignore show;
}

bool sapp_keyboard_shown() {
    return _sapp.onscreen_keyboard_shown;
}

bool sapp_is_fullscreen() {
    return _sapp.fullscreen;
}

void sapp_toggle_fullscreen() {
    _sapp_emsc_toggle_fullscreen();
}

private {
void _sapp_update_cursor(sapp_mouse_cursor cursor, bool shown) {
    _sapp_emsc_update_cursor(cursor, shown);
    _sapp.mouse.current_cursor = cursor;
    _sapp.mouse.shown = shown;
}
}

/* NOTE that sapp_show_mouse() does not "stack" like the Win32 or macOS API functions! */
void sapp_show_mouse(bool show) {
    if _sapp.mouse.shown != show {
        _sapp_update_cursor(_sapp.mouse.current_cursor, show);
    }
}

bool sapp_mouse_shown() {
    return _sapp.mouse.shown;
}

void sapp_lock_mouse(bool lock) {
    _sapp_emsc_lock_mouse(lock);
}

bool sapp_mouse_locked() {
    return _sapp.mouse.locked;
}

void sapp_set_mouse_cursor(sapp_mouse_cursor cursor) {
    assert(cursor >= 0 && cursor < _SAPP_MOUSECURSOR_NUM);
    if _sapp.mouse.current_cursor != cursor {
        _sapp_update_cursor(cursor, _sapp.mouse.shown);
    }
}

sapp_mouse_cursor sapp_get_mouse_cursor() {
    return _sapp.mouse.current_cursor;
}

sapp_mouse_cursor sapp_bind_mouse_cursor_image(sapp_mouse_cursor cursor, sapp_image_desc* desc) {
    assert(cursor >= 0 && cursor < _SAPP_MOUSECURSOR_NUM);
    assert(desc.cursor_hotspot_x < desc.width - 1 && desc.cursor_hotspot_y < desc.height - 1);
    assert(desc.width * desc.height * 4 == cast(i32, desc.pixels.size));
    sapp_unbind_mouse_cursor_image(cursor);
    bool res = false;
    res = _sapp_emsc_make_custom_mouse_cursor(cursor, desc);
    _sapp.custom_cursor_bound[cast(i32, cursor)] = res;
    if _sapp.mouse.current_cursor == cursor {
        _sapp_update_cursor(cursor, _sapp.mouse.shown);
    }
    return cursor;
}

void sapp_unbind_mouse_cursor_image(sapp_mouse_cursor cursor) {
    assert(cursor >= 0 && cursor < _SAPP_MOUSECURSOR_NUM);
    if _sapp.custom_cursor_bound[cast(i32, cursor)] {
        _sapp.custom_cursor_bound[cast(i32, cursor)] = false;
        if _sapp.mouse.current_cursor == cursor {
            _sapp_update_cursor(cursor, _sapp.mouse.shown);
        }
        _sapp_emsc_destroy_custom_mouse_cursor(cursor);
    }
}

void sapp_request_quit() {
    _sapp.quit_requested = true;
}

void sapp_cancel_quit() {
    _sapp.quit_requested = false;
}

void sapp_quit() {
    _sapp.quit_ordered = true;
}

void sapp_consume_event() {
    _sapp.event_consumed = true;
}

/* NOTE: on HTML5, sapp_set_clipboard_string() must be called from within event handler! */
void sapp_set_clipboard_string(u8* str_var) {
    if !_sapp.clipboard.enabled {
        return;
    }
    assert(cast(i64, str_var));
    _sapp_emsc_set_clipboard_string(str_var);
    _sapp_strcpy(str_var, _sapp.clipboard.buffer, cast(u64, _sapp.clipboard.buf_size));
}

u8* sapp_get_clipboard_string() {
    if !_sapp.clipboard.enabled {
        return "";
    }
    return _sapp.clipboard.buffer;
}

void sapp_set_window_title(u8* title) {
    assert(cast(i64, title));
    _sapp_strcpy(title, _sapp.window_title, 128);
}

void sapp_set_icon(sapp_icon_desc* desc) {
    assert(cast(i64, desc));
    if desc.sokol_default {
        if null == _sapp.default_icon_pixels {
            _sapp_setup_default_icon();
        }
        assert(null != _sapp.default_icon_pixels);
        desc = &_sapp.default_icon_desc;
    }
    i32 num_images = _sapp_icon_num_images(desc);
    if num_images == 0 {
        return;
    }
    assert(num_images > 0 && num_images <= SAPP_MAX_ICONIMAGES);
    if !_sapp_validate_icon_desc(desc, num_images) {
        return;
    }
    _sapp_emsc_set_icon(desc, num_images);
}

i32 sapp_get_num_dropped_files() {
    if !_sapp.drop.enabled {
        return 0;
    }
    return _sapp.drop.num_files;
}

u8* sapp_get_dropped_file_path(i32 index) {
    assert(index >= 0 && index < _sapp.drop.num_files);
    if !_sapp.drop.enabled {
        return "";
    }
    assert(cast(i64, _sapp.drop.buffer));
    if index < 0 || index >= _sapp.drop.max_files {
        return "";
    }
    return _sapp_dropped_file_path_ptr(index);
}

u32 sapp_html5_get_dropped_file_size(i32 index) {
    assert(index >= 0 && index < _sapp.drop.num_files);
    if !_sapp.drop.enabled {
        return 0;
    }
    return sapp_js_dropped_file_size(index);
}

void sapp_html5_fetch_dropped_file(sapp_html5_fetch_request* request) {
    assert(cast(i64, _sapp.drop.enabled));
    assert(cast(i64, request));
    assert(cast(i64, request.callback));
    assert(cast(i64, request.buffer.ptr));
    assert(request.buffer.size > 0);
    i32 index = request.dropped_file_index;
    sapp_html5_fetch_error error_code = SAPP_HTML5_FETCH_ERROR_NO_ERROR;
    if index < 0 || index >= _sapp.drop.num_files {
        error_code = SAPP_HTML5_FETCH_ERROR_OTHER;
    }
    if sapp_html5_get_dropped_file_size(index) > request.buffer.size {
        error_code = SAPP_HTML5_FETCH_ERROR_BUFFER_TOO_SMALL;
    }
    if SAPP_HTML5_FETCH_ERROR_NO_ERROR != error_code {
        _sapp_emsc_invoke_fetch_cb(index, false, cast(i32, error_code), request.callback, 0, request.buffer.ptr, request.buffer.size, request.user_data);
    } else {
        sapp_js_fetch_dropped_file(index, request.callback, request.buffer.ptr, request.buffer.size, request.user_data);
    }
}

sapp_environment sapp_get_environment() {
    assert(cast(i64, _sapp.valid));
    sapp_environment res;
    res.defaults.color_format = sapp_color_format();
    res.defaults.depth_format = sapp_depth_format();
    res.defaults.sample_count = sapp_sample_count();
    return res;
}

sapp_swapchain sapp_acquire_swapchain() {
    assert(cast(i64, _sapp.valid));
    sapp_swapchain res;
    res.gl.framebuffer = _sapp.gl.framebuffer;
    res.width = sapp_width();
    res.height = sapp_height();
    res.color_format = sapp_color_format();
    res.depth_format = sapp_depth_format();
    res.sample_count = sapp_sample_count();
    return res;
}

void* sapp_macos_get_window() {
    return null;
}

void* sapp_ios_get_window() {
    return null;
}

void* sapp_d3d11_get_swap_chain() {
    assert(cast(i64, _sapp.valid));
    return null;
}

void* sapp_win32_get_hwnd() {
    assert(cast(i64, _sapp.valid));
    return null;
}

i32 sapp_gl_get_major_version() {
    assert(cast(i64, _sapp.valid));
    return _sapp.desc.gl.major_version;
}

i32 sapp_gl_get_minor_version() {
    assert(cast(i64, _sapp.valid));
    return _sapp.desc.gl.minor_version;
}

bool sapp_gl_is_gles() {
    return true;
}

void* sapp_x11_get_window() {
    return null;
}

void* sapp_x11_get_display() {
    return null;
}

void* sapp_android_get_native_activity() {
    return null;
}

void* sapp_android_get_native_window() {
    return null;
}

void sapp_html5_ask_leave_site(bool ask) {
    _sapp.html5_ask_leave_site = ask;
}
/*
    sokol_gfx.h -- simple 3D API wrapper

    Project URL: https://github.com/floooh/sokol

    Example code: https://github.com/floooh/sokol-samples

    Do this:
        #define SOKOL_IMPL or
        #define SOKOL_GFX_IMPL
    before you include this file in *one* C or C++ file to create the
    implementation.

    In the same place define one of the following to select the rendering
    backend:
        #define SOKOL_GLCORE
        #define SOKOL_GLES3
        #define SOKOL_D3D11
        #define SOKOL_METAL
        #define SOKOL_WGPU
        #define SOKOL_VULKAN
        #define SOKOL_DUMMY_BACKEND

    I.e. for the desktop GL it should look like this:

    #include ...
    #include ...
    #define SOKOL_IMPL
    #define SOKOL_GLCORE
    #include "sokol_gfx.h"

    The dummy backend replaces the platform-specific backend code with empty
    stub functions. This is useful for writing tests that need to run on the
    command line.

    Optionally provide the following defines with your own implementations:

    SOKOL_ASSERT(c)             - your own assert macro (default: assert(c))
    SOKOL_UNREACHABLE()         - a guard macro for unreachable code (default: assert(false))
    SOKOL_GFX_API_DECL          - public function declaration prefix (default: extern)
    SOKOL_API_DECL              - same as SOKOL_GFX_API_DECL
    SOKOL_API_IMPL              - public function implementation prefix (default: -)
    SOKOL_TRACE_HOOKS           - enable trace hook callbacks (search below for TRACE HOOKS)
    SOKOL_EXTERNAL_GL_LOADER    - indicates that you're using your own GL loader, in this case
                                  sokol_gfx.h will not include any platform GL headers and disable
                                  the integrated Win32 GL loader

    If sokol_gfx.h is compiled as a DLL, define the following before
    including the declaration or implementation:

    SOKOL_DLL

    On Windows, SOKOL_DLL will define SOKOL_GFX_API_DECL as __declspec(dllexport)
    or __declspec(dllimport) as needed.

    Optionally define the following to force debug checks and validations
    even in release mode:

    SOKOL_DEBUG - by default this is defined if NDEBUG is not defined

    Link with the following system libraries (note that sokol_app.h has
    additional linker requirements):

    - on macOS/iOS with Metal: Metal
    - on macOS with GL: OpenGL
    - on iOS with GL: OpenGLES
    - on Linux with EGL: GL or GLESv2
    - on Linux with GLX: GL
    - on Linux with Vulkan: vulkan
    - on Android: GLESv3, log, android
    - on Windows:
        - with D3D11:
            - on MSVC or Clang: no action needed, libs are defined in-source via pragma-comment-lib
            - on MINGW/MSYS2 gcc: compile with '-mwin32' so that _WIN32 is defined and link with -ld3d11
        - with GL: no linking needed since sokol_gfx.h comes with its own GL loader on Windows
        - with Vulkan: explicitly link with vulkan-1 (this is explicit in case you want to use
          your own Vulkan loader)

    On macOS and iOS, the implementation must be compiled as Objective-C.

    For Linux+Vulkan install the following packages (or equivalents):
        - libvulkan-dev
        - vulkan-validationlayers
        - vulkan-tools

    For Windows+Vulkan install the Vulkan SDK and in your build system:
        - add a header search path to $ENV{VULKAN_SDK}/Include
        - add a link search path to $ENV{VULKAN_SDK}/Env

    On Emscripten:
        - for WebGL2: add the linker option `-s USE_WEBGL2=1`
        - for WebGPU: compile and link with `--use-port=emdawnwebgpu`
          (for more exotic situations, read: https://dawn.googlesource.com/dawn/+/refs/heads/main/src/emdawnwebgpu/pkg/README.md)
          NOTE that you may also need to pass `-sDEFAULT_TO_CXX` to the Emscripten
          linker when using emdaenwebgpu in C projects.

    sokol_gfx DOES NOT:
    ===================
    - create a window, swapchain or the 3D-API context/device, you must do this
      before sokol_gfx is initialized, and pass any required information
      (like 3D device pointers) to the sokol_gfx initialization call

    - present the rendered frame, how this is done exactly usually depends
      on how the window and 3D-API context/device was created

    - provide a unified shader language, instead 3D-API-specific shader
      source-code or shader-bytecode must be provided (for the "official"
      offline shader cross-compiler / code-generator, see here:
      https://github.com/floooh/sokol-tools/blob/master/docs/sokol-shdc.md)


    STEP BY STEP
    ============
    --- to initialize sokol_gfx, after creating a window and a 3D-API
        context/device, call:

            sg_setup(const sg_desc*)

        Depending on the selected 3D backend, sokol-gfx requires some
        information about its runtime environment, like a GPU device pointer,
        default swapchain pixel formats and so on. If you are using sokol_app.h
        for the window system glue, you can use a helper function provided in
        the sokol_glue.h header:

            #include "sokol_gfx.h"
            #include "sokol_app.h"
            #include "sokol_glue.h"
            //...
            sg_setup(&(sg_desc){
                .environment = sglue_environment(),
            });

        To get any logging output for errors and from the validation layer, you
        need to provide a logging callback. Easiest way is through sokol_log.h:

            #include "sokol_log.h"
            //...
            sg_setup(&(sg_desc){
                //...
                .logger.func = slog_func,
            });

    --- create resource objects (buffers, images, views, samplers, shaders
        and pipeline objects)

            sg_buffer sg_make_buffer(const sg_buffer_desc*)
            sg_image sg_make_image(const sg_image_desc*)
            sg_view sg_make_view(const sg_view_desc*)
            sg_sampler sg_make_sampler(const sg_sampler_desc*)
            sg_shader sg_make_shader(const sg_shader_desc*)
            sg_pipeline sg_make_pipeline(const sg_pipeline_desc*)

    --- start a render- or compute-pass:

            sg_begin_pass(const sg_pass* pass);

        Typically, render passes render into an externally provided swapchain which
        presents the rendering result on the display. Such a 'swapchain pass'
        is started like this:

            sg_begin_pass(&(sg_pass){ .action = { ... }, .swapchain = sglue_swapchain() })

        ...where .action is an sg_pass_action struct containing actions to be performed
        at the start and end of a render pass (such as clearing the render surfaces to
        a specific color), and .swapchain is an sg_swapchain struct with all the required
        information to render into the swapchain's surfaces.

        To start an 'offscreen render pass' into sokol-gfx image objects, populate
        the sg_pass.attachments nested struct with attachment view objects
        (1..N color-attachment-views to render into, a depth-stencil-attachment-view
        to provide the depth-stencil-buffer, and optionally 1..N resolve-attachment-views
        for an MSAA-resolve operation:

            sg_begin_pass(&(sg_pass){
                .action = { ... },
                .attachments = {
                    .colors[0] = color_attachment_view,
                    .resolves[0] = optional_resolve_attachment_view,
                    .depth_stencil = depth_stencil_attachment_view,
                },
            });

        To start a compute-pass, just set the .compute field to true:

            sg_begin_pass(&(sg_pass){ .compute = true });

    --- set the pipeline state for the next draw call with:

            sg_apply_pipeline(sg_pipeline pip)

    --- fill an sg_bindings struct with the resource bindings for the next
        draw- or dispatch-call (0..N vertex buffers, 0 or 1 index buffer, 0..N views,
        0..N samplers), and call

            sg_apply_bindings(const sg_bindings* bindings)

        ...to update the resource bindings. Note that in a compute pass, no vertex-
        or index-buffer bindings can be used, and in render passes, no storage-image bindings
        are allowed. Those restrictions will be checked by the sokol-gfx validation layer.

    --- optionally update shader uniform data with:

            sg_apply_uniforms(int ub_slot, const sg_range* data)

        Read the section 'UNIFORM DATA LAYOUT' to learn about the expected memory layout
        of the uniform data passed into sg_apply_uniforms().

    --- kick off a draw call with:

            sg_draw(int base_element, int num_elements, int num_instances)

        The sg_draw() function unifies all the different ways to render primitives
        in a single call (indexed vs non-indexed rendering, and instanced vs non-instanced
        rendering). In case of indexed rendering, base_element and num_element specify
        indices in the currently bound index buffer. In case of non-indexed rendering
        base_element and num_elements specify vertices in the currently bound
        vertex-buffer(s). To perform instanced rendering, the rendering pipeline
        must be setup for instancing (see sg_pipeline_desc below) and the num_instances
        parameter must be > 1.

        Alternatively, call:

            sg_draw_ex(...)

        to provide a base-vertex and/or base-instance which allows to render
        from different sections of a vertex buffer without rebinding the
        vertex buffer with a different offset. Note that `sg_draw_ex()`
        only has limited portability on OpenGL, check the sg_limits struct
        members .draw_base_vertex and .draw_base_instance for runtime support,
        those are generally true on non-GL-backends, and on GL the feature
        flags are set according to the GL version:

            - on GL base_instance != 0 is only supported since GL 4.2
            - on GLES3.x, base_instance != 0 is not supported
            - on GLES3.x, base_vertex is only supported since GLES3.2
              (e.g. not supported on WebGL2)

    --- ...or kick of a dispatch call to invoke a compute shader workload:

            sg_dispatch(int num_groups_x, int num_groups_y, int num_groups_z)

        The dispatch args define the number of 'compute workgroups' processed
        by the currently applied compute shader.

    --- finish the current pass with:

            sg_end_pass()

    --- when done with the current frame, call

            sg_commit()

    --- at the end of your program, shutdown sokol_gfx with:

            sg_shutdown()

    --- if you need to destroy resources before sg_shutdown(), call:

            sg_destroy_buffer(sg_buffer buf)
            sg_destroy_image(sg_image img)
            sg_destroy_sampler(sg_sampler smp)
            sg_destroy_shader(sg_shader shd)
            sg_destroy_pipeline(sg_pipeline pip)
            sg_destroy_view(sg_view view)

    --- to set a new viewport rectangle, call:

            sg_apply_viewport(int x, int y, int width, int height, bool origin_top_left)

        ...or if you want to specify the viewport rectangle with float values:

            sg_apply_viewportf(float x, float y, float width, float height, bool origin_top_left)

    --- to set a new scissor rect, call:

            sg_apply_scissor_rect(int x, int y, int width, int height, bool origin_top_left)

        ...or with float values:

            sg_apply_scissor_rectf(float x, float y, float width, float height, bool origin_top_left)

        Both sg_apply_viewport() and sg_apply_scissor_rect() must be called
        inside a rendering pass (e.g. not in a compute pass, or outside a pass)

        Note that sg_begin_pass() will reset both the viewport and scissor
        rectangles to cover the entire framebuffer.

    --- to populate immutable buffers and images after creation, call:

            sg_write_buffer_unsealed(const sg_write_buffer_desc* desc)
            sg_write_image_unsealed(const sg_write_image_desc* desc)

        These are more flexible alternatives to passing the content in the
        sg_make_buffer or sg_make_image calls. To use these write-unsealed
        calls, create the buffers and images with usage `desc.usage.write_unsealed = true`,
        which creates the resource in 'unsealed resource state'.
        The `sg_write_*_unsealed` functions can only be called on resources
        in unsealed state. After all data has been initialized, call the
        functions `sg_seal_buffer()` or `sg_seal_image()` to transition the
        resource from unsealed into valid state. For more details see the
        doc section `ON POPULATING IMMUTABLE RESOURCES` below.

    --- to write 'transient' data from the CPU side that's 'consumed'
        in the same frame by the GPU side (e.g. the data doesn't need
        to survive into the next frame):

            sg_write_buffer_transient(const sg_write_buffer_desc* desc);
            sg_write_image_transient(const sg_write_image_desc* desc);

        The buffer and image objects which are the destination of
        write-transient calls must have been created with
        `.usage.write_transient = true` and cannot be pass attachments.

        Multiple calls to the write-transient functions are allowed in a frame
        to incrementally populate the resource, but only until the resource is bound
        or used as a copy source.
        After a resource has been used in a frame it cannot be written to until
        the next frame.

        Expect that data written with the write-transient functions will not
        survive into the next frame, e.g. all data written by the CPU is
        expected to be 'consumed' by the GPU in the same frame. Trying to bind a
        write-transient buffer or image that hasn't been written to in the same
        frame is a validation layer error. Calling a write-transient function on
        a resource that isn't used for rendering or compute in the same frame is
        allowed but pointless (because the written data will not persist).

    --- to copy data between resources, call one of the `sg_copy_*` funcs:

            sg_copy_buffer_to_buffer(const sg_copy_buffer_to_buffer_desc* desc);
            sg_copy_buffer_to_image(const sg_copy_buffer_to_image_desc* desc);

        The source resource must have been created with usage .copy_src and
        the destination resource must have been created with usage .copy_dst.

        There are a few backend-specific caveats, for more information see
        the section ON COPYING DATA BETWEEN RESOURCES.

    --- to write CPU-side data persistently into buffer and image resources,
        use a combination of sg_write_buffer_transient() into a 'staging buffer',
        followed by an sg_copy_* call to perform a copy from the staging
        buffer into the destination resource.

        For more information on uploading data persistently into resources see
        the section ON UPLOADING PERSISTENT DATA INTO RESOURCES.

    --- to check at runtime for optional features, limits and pixelformat support,
        call:

            sg_features sg_query_features()
            sg_limits sg_query_limits()
            sg_pixelformat_info sg_query_pixelformat(sg_pixel_format fmt)

    --- if you need to call into the underlying 3D-API directly, you must call:

            sg_reset_state_cache()

        ...before calling sokol_gfx functions again

    --- you can inspect the original sg_desc structure handed to sg_setup()
        by calling sg_query_desc(). This will return an sg_desc struct with
        the default values patched in for any zero-initialized values

    --- you can get a desc struct matching the creation attributes of a
        specific resource object via:

            sg_buffer_desc sg_query_buffer_desc(sg_buffer buf)
            sg_image_desc sg_query_image_desc(sg_image img)
            sg_sampler_desc sg_query_sampler_desc(sg_sampler smp)
            sg_shader_desc sq_query_shader_desc(sg_shader shd)
            sg_pipeline_desc sg_query_pipeline_desc(sg_pipeline pip)
            sg_view_desc sg_query_view_desc(sg_view view)

        ...but NOTE that the returned desc structs may be incomplete, only
        creation attributes that are kept around internally after resource
        creation will be filled in, and in some cases (like shaders) that's
        very little. Any missing attributes will be set to zero. The returned
        desc structs might still be useful as partial blueprint for creating
        similar resources if filled up with the missing attributes.

        Calling the query-desc functions on an invalid resource will return
        completely zeroed structs (it makes sense to check  the resource state
        with sg_query_*_state() first)

    --- you can query the default resource creation parameters through the functions

            sg_buffer_desc sg_query_buffer_defaults(const sg_buffer_desc* desc)
            sg_image_desc sg_query_image_defaults(const sg_image_desc* desc)
            sg_sampler_desc sg_query_sampler_defaults(const sg_sampler_desc* desc)
            sg_shader_desc sg_query_shader_defaults(const sg_shader_desc* desc)
            sg_pipeline_desc sg_query_pipeline_defaults(const sg_pipeline_desc* desc)
            sg_view_desc sg_query_view_defaults(const sg_view_desc* desc)

        These functions take a pointer to a desc structure which may contain
        zero-initialized items for default values. These zero-init values
        will be replaced with their concrete values in the returned desc
        struct.

    --- you can inspect various internal resource runtime values via:

            sg_buffer_info sg_query_buffer_info(sg_buffer buf)
            sg_image_info sg_query_image_info(sg_image img)
            sg_sampler_info sg_query_sampler_info(sg_sampler smp)
            sg_shader_info sg_query_shader_info(sg_shader shd)
            sg_pipeline_info sg_query_pipeline_info(sg_pipeline pip)
            sg_view_info sg_query_view_info(sg_view view)

        ...please note that the returned info-structs are tied quite closely
        to sokol_gfx.h internals, and may change more often than other
        public API functions and structs.

    -- you can query the type/flavour and parent resource of a view:

            sg_view_type sg_query_view_type(sg_view view)
            sg_image sg_query_view_image(sg_view view)
            sg_buffer sg_query_view_buffer(sg_view view)

    --- you can query stats and control stats collection via:

            sg_query_stats()
            sg_enable_stats()
            sg_disable_stats()
            sg_stats_enabled()

    --- you can ask at runtime what backend sokol_gfx.h has been compiled for:

            sg_backend sg_query_backend(void)

    --- you can check if sokol_gfx.h is currently inside a pass, and what
        pass type via:

            sg_pass_state sg_query_pass_state(void)

    --- call the following helper functions to compute the number of
        bytes in a texture row or surface for a specific pixel format.
        These functions might be helpful when preparing image data for consumption
        by sg_make_image() or the sg_write_image_*() functions:

            int sg_query_row_pitch(sg_pixel_format fmt, int width, int row_align_bytes);
            int sg_query_surface_pitch(sg_pixel_format fmt, int width, int height, int row_align_bytes);

        Width and height are generally in number of pixels, but note that 'row' has different meaning
        for uncompressed vs compressed pixel formats: for uncompressed formats, a row is identical
        with a single line of pixels, while in compressed formats, one row is a line of *compression blocks*.

        This is why calling sg_query_surface_pitch() for a compressed pixel format and height
        N, N+1, N+2, ... may return the same result.

        The row_align_bytes parameter is for added flexibility. For tightly packed image
        this should generally be 1, otherwise the row pitch in bytes.

    ON INITIALIZATION:
    ==================
    When calling sg_setup(), a pointer to an sg_desc struct must be provided
    which contains initialization options. These options provide two types
    of information to sokol-gfx:

        (1) upper bounds and limits needed to allocate various internal
            data structures:
                - the max number of resources of each type that can
                  be alive at the same time, this is used for allocating
                  internal pools
                - the max overall size of uniform data that can be
                  updated per frame, including a worst-case alignment
                  per uniform update (this worst-case alignment is 256 bytes)
                - the max size of all transient resource updates
                  (sg_write_buffer/image_transient per frame
                - the max number of compute-dispatch calls in a compute pass
            Not all of those limit values are used by all backends, but it is
            good practice to provide them none-the-less.

        (2) 3D backend "environment information" in a nested sg_environment struct:
            - pointers to backend-specific context- or device-objects (for instance
              the D3D11, WebGPU or Metal device objects)
            - defaults for external swapchain pixel formats and sample counts,
              these will be used as default values in image and pipeline objects,
              and the sg_swapchain struct passed into sg_begin_pass()
            Usually you provide a complete sg_environment struct through
            a helper function, as an example look at the sglue_environment()
            function in the sokol_glue.h header.

    See the documentation block of the sg_desc struct below for more information.


    ON RENDER PASSES
    ================
    Relevant samples:
        - https://floooh.github.io/sokol-html5/offscreen-sapp.html
        - https://floooh.github.io/sokol-html5/offscreen-msaa-sapp.html
        - https://floooh.github.io/sokol-html5/mrt-sapp.html
        - https://floooh.github.io/sokol-html5/mrt-pixelformats-sapp.html

    A render pass groups rendering commands into a set of render target images
    (called 'render pass attachments'). Render target images can be used in subsequent
    passes as textures (it is invalid to use the same image both as render target
    and as texture in the same pass).

    The following sokol-gfx functions must only be called inside a render-pass:

        sg_apply_viewport[f]
        sg_apply_scissor_rect[f]
        sg_draw

    The following function may be called inside a render- or compute-pass, but
    not outside a pass:

        sg_apply_pipeline
        sg_apply_bindings
        sg_apply_uniforms

    A frame must have at least one 'swapchain render pass' which renders into an
    externally provided swapchain provided as an sg_swapchain struct to the
    sg_begin_pass() function. If you use sokol_gfx.h together with sokol_app.h,
    just call the sglue_swapchain() helper function in sokol_glue.h to
    provide the swapchain information. Otherwise the following information
    must be provided:

        - the color pixel-format of the swapchain's render surface
        - an optional depth/stencil pixel format if the swapchain
          has a depth/stencil buffer
        - an optional sample-count for MSAA rendering
        - NOTE: the above three values can be zero-initialized, in that
          case the defaults from the sg_environment struct will be used that
          had been passed to the sg_setup() function.
        - a number of backend specific objects:
            - GL/GLES3: just a GL framebuffer handle
            - D3D11:
                - an ID3D11RenderTargetView for the rendering surface
                - if MSAA is used, an ID3D11RenderTargetView as
                  MSAA resolve-target
                - an optional ID3D11DepthStencilView for the
                  depth/stencil buffer
            - WebGPU
                - a WGPUTextureView object for the rendering surface
                - if MSAA is used, a WGPUTextureView object as MSAA resolve target
                - an optional WGPUTextureView for the
            - Metal (NOTE that the roles of provided surfaces is slightly
              different in Metal than in D3D11 or WebGPU, notably, the
              CAMetalDrawable is either rendered to directly, or serves
              as MSAA resolve target):
                - a CAMetalDrawable object which is either rendered
                  into directly, or in case of MSAA rendering, serves
                  as MSAA-resolve-target
                - if MSAA is used, an multisampled MTLTexture where
                  rendering goes into
                - an optional MTLTexture for the depth/stencil buffer

    A sg_swapchain struct provided to sg_begin_pass() can indicate that the
    swapchain is in an 'invalid state' via the boolean `sg_swapchain.invalid`.
    When this flag is set, all other sg_swapchain members must be zeroed.
    An invalid swapchain will cause all rendering operations in that pass
    to be silently skipped.

    It's recommended that you create a helper function which returns an
    initialized sg_swapchain struct by value. This can then be directly plugged
    into the sg_begin_pass function like this:

        sg_begin_pass(&(sg_pass){ .swapchain = sglue_swapchain() });

    As an example for such a helper function check out the function sglue_swapchain()
    in the sokol_glue.h header.

    For offscreen render passes, the render target images used in a render pass
    must be provided as sg_view objects specialized for the specific pass-attachment
    types:

        - color-attachment-views for color-rendering
        - depth-stencil-attachment-views for the depth-stencil-buffer surface
        - resolve-attachment-views for MSAA-resolve operations

    For a simple offscreen scenario with one color-, one depth-stencil-render
    target and without multisampling, setting up the required image-
    and view-objects looks like this:

    First create two render target images, one with a color pixel format,
    and one with the depth- or depth-stencil pixel format. Both images
    must have the same dimensions. Also not the usage flags:

        const sg_image color_img = sg_make_image(&(sg_image_desc){
            .usage.color_attachment = true,
            .width = 256,
            .height = 256,
            .pixel_format = SG_PIXELFORMAT_RGBA8,
            .sample_count = 1,
        });
        const sg_image depth_img = sg_make_image(&(sg_image_desc){
            .usage.depth_stencil_attachment = true,
            .width = 256,
            .height = 256,
            .pixel_format = SG_PIXELFORMAT_DEPTH,
            .sample_count = 1,
        });

    NOTE: when creating render target images, have in mind that some default values
    are aligned with the default environment attributes in the sg_environment struct
    that was passed into the sg_setup() call:

        - the default value for sg_image_desc.pixel_format is taken from
          sg_environment.defaults.color_format
        - the default value for sg_image_desc.sample_count is taken from
          sg_environment.defaults.sample_count
        - the default value for sg_image_desc.num_mipmaps is always 1

    Next, create two view objects, one color-attachment-view and one
    depth-stencil-attachment view:

        const sg_view color_att_view = sg_make_view(&(sg_view_desc){
            .color_attachment.image = color_img,
        });
        const sg_view depth_att_view = sg_make_view(&(sg_view_desc){
            .depth_stencil_attachment.image = depth_img,
        });

    You'll typically also want to create a texture-view on the color image
    to sample the color attachment image as texture in a later pass:

        const sg_view tex_view = sg_make_view(&(sg_view_desc){
            .texture.image = color_img,
        });

    The attachment-view objects are then passed into the sg_begin_pass function in
    place of the nested swapchain struct:

        sg_begin_pass(&(sg_pass){
            .attachments = {
                .colors[0] = color_att_view,
                .depth_stencil = depth_att_view,
            },
        });

    ...in a later pass when you want to sample the color attachment image as
    texture, use the texture view in the sg_apply_bindings() call:

        sg_apply_bindings(&(sg_bindings){
            .vertex_buffers[0] = ...,
            .index_buffer = ...,
            .views[VIEW_tex] = tex_view,
            .samplers[SMP_smp] = smp,
        });

    Swapchain and offscreen passes form dependency trees with a swapchain
    pass at the root, offscreen passes as nodes, and attachment images as
    dependencies between passes.

    sg_pass_action structs are used to define actions that should happen at the
    start and end of render passes (such as clearing pass attachments to a
    specific color or depth-value, or performing an MSAA resolve operation at
    the end of a pass).

    A typical sg_pass_action object which clears the color attachment to black
    might look like this:

        const sg_pass_action = {
            .colors[0] = {
                .load_action = SG_LOADACTION_CLEAR,
                .clear_value = { 0.0f, 0.0f, 0.0f, 1.0f }
            }
        };

    This omits the defaults for the color attachment store action, and
    the depth-stencil-attachments actions. The same pass action with the
    defaults explicitly filled in would look like this:

        const sg_pass_action pass_action = {
            .colors[0] = {
                .load_action = SG_LOADACTION_CLEAR,
                .store_action = SG_STOREACTION_STORE,
                .clear_value = { 0.0f, 0.0f, 0.0f, 1.0f }
            },
            .depth = = {
                .load_action = SG_LOADACTION_CLEAR,
                .store_action = SG_STOREACTION_DONTCARE,
                .clear_value = 1.0f,
            },
            .stencil = {
                .load_action = SG_LOADACTION_CLEAR,
                .store_action = SG_STOREACTION_DONTCARE,
                .clear_value = 0
            }
        };

    With the sg_pass object and sg_pass_action struct in place everything
    is ready now for the actual render pass:

    Using such this prepared sg_pass_action in a swapchain pass looks like
    this:

        sg_begin_pass(&(sg_pass){
            .action = pass_action,
            .swapchain = sglue_swapchain()
        });
        ...
        sg_end_pass();

    ...of alternatively in one offscreen pass:

        sg_begin_pass(&(sg_pass){
            .action = pass_action,
            .attachments = {
                .colors[0] = color_att_view,
                .depth_stencil = ds_att_view,
            },
        });
        ...
        sg_end_pass();

    Offscreen rendering can also go into a mipmap, or a slice/face of
    a cube-, array- or 3d-image (which some restrictions, for instance
    it's not possible to create a 3D image with a depth/stencil pixel format,
    these exceptions are generally caught by the sokol-gfx validation layer).

    The mipmap/slice selection is baked into the attachment-view objects, for
    instance to create a color-attachment-view for rendering into mip-level
    2 and slice 3 of an array texture:

        const sg_view color_att_view = sg_make_view(&(sg_view_desc){
            .color_attachment = {
                .image = color_img,
                .mip_level = 2,
                .slice = 3,
            },
        });

    If MSAA offscreen rendering is desired, the multi-sample rendering result
    must be 'resolved' into a separate 'resolve image', before that image can
    be used as texture.

    Setting up MSAA offscreen 3D rendering requires three image objects
    (one color-attachment image with a sample count > 1), a resolve-attachment
    image with a sample count of 1, and a depth-stencil-attachment image
    with the same sample count as the color-attachment image:

        const sg_image color_img = sg_make_image(&(sg_image_desc){
            .usage.color_attachment = true,
            .width = 256,
            .height = 256,
            .pixel_format = SG_PIXELFORMAT_RGBA8,
            .sample_count = 4,
        });
        const sg_image resolve_img = sg_make_image(&(sg_image_desc){
            .usage.resolve_attachment = true,
            .width = 256,
            .height = 256,
            .pixel_format = SG_PIXELFORMAT_RGBA8,
            .sample_count = 1,
        });
        const sg_image depth_img = sg_make_image(&(sg_image_desc){
            .usage.depth_stencil_attachment = true,
            .width = 256,
            .height = 256,
            .pixel_format = SG_PIXELFORMAT_DEPTH,
            .sample_count = 4,
        });

    Next you'll need the corresponding attachment-view objects:

        const sg_view color_att_view = sg_make_view(&(sg_view_desc){
            .color_attachment.image = color_img,
        });
        const sg_view resolve_att_view = sg_make_view(&(sg_view_desc){
            .resolve_attachment.image = resolve_img,
        });
        const sg_view depth_att_view = sg_make_view(&(sg_view_desc){
            .depth_stencil_attachment.image = depth_img,
        });

    To sample the rendered image as a texture in a later pass you'll also
    need a texture-view on the resolve-attachment-image (not the color-attachment-image!):

        const sg_view tex_view = sg_make_view(&(sg_view_desc){
            .texture.image = resolve_img,
        });

    Next start the render pass with all attachment-views, as soon as a
    resolve-attachment-view is provided, an MSAA resolve operation will happen
    at the end of the pass. Also note that the content of the MSAA color-attachment-image
    doesn't need to be preserved, since it's only needed until the MSAA-resolve
    at the end of the pass, so the .store_action should be set to "don't care":

        sg_begin_pass(&(sg_pass){
            .attachments = {
                .colors[0] = color_att_view,
                .resolves[0] = resolve_att_view,
                .depth_stencil = depth_att_view,
            },
            .action = {
                .colors[0] = {
                    .load_action = SG_LOADACTION_CLEAR,
                    .store_action = SG_STOREACTION_DONTCARE,
                    .clear_value = { 0.0f, 0.0f, 0.0f, 1.0f },
                }
            },
        });

    ...in a later pass, use the texture-view that had been created on the
    resolve-image to use the rendering result as texture:

        sg_apply_bindings(&(sg_bindings){
            .vertex_buffers[0] = ...,
            .index_buffer = ...,
            .views[VIEW_tex] = tex_view,
            .samplers[SMP_smp] = smp,
        });

    ON COMPUTE PASSES
    =================
    Compute passes are used to update the content of storage buffers and
    storage images by running compute shader code on
    the GPU. Updating storage resources with a compute shader will almost always
    be more efficient than computing the same data on the CPU and then uploading
    it via `sg_write_buffer/image_transient()`.

    NOTE: compute passes are only supported on the following platforms and
    backends:

        - macOS and iOS with Metal
        - Windows with D3D11 and OpenGL
        - Linux with OpenGL or GLES3.1+
        - Web with WebGPU
        - Android with GLES3.1+

    ...this means compute shaders can't be used on the following platform/backend
    combos (the same restrictions apply to using storage buffers without compute
    shaders):

        - macOS with GL
        - iOS with GLES3
        - Web with WebGL2

    A compute pass is started with:

        sg_begin_pass(&(sg_pass){ .compute = true });

    ...and finished with a regular:

        sg_end_pass();

    Typically the following functions will be called inside a compute pass:

        sg_apply_pipeline()
        sg_apply_bindings()
        sg_apply_uniforms()
        sg_dispatch()

    The following functions are disallowed inside a compute pass
    and will cause validation layer errors:

        sg_apply_viewport[f]()
        sg_apply_scissor_rect[f]()
        sg_draw()

    Only special 'compute shaders' and 'compute pipelines' can be used in
    compute passes. A compute shader only has a compute-function instead
    of a vertex- and fragment-function pair, and it doesn't accept vertex-
    and index-buffers as bindings, only storage-buffer-views (readable
    and writable), storage-image-views (read/write or writeonly) and
    texture-views (read-only).

    A compute pipeline is created by providing a compute shader object,
    setting the .compute creation parameter to true and not defining any
    'render state':

        sg_pipeline pip = sg_make_pipeline(&(sg_pipeline_desc){
            .compute = true,
            .shader = compute_shader,
        });

    The sg_apply_bindings and sg_apply_uniforms calls are the same as in
    render passes, with the exception that no vertex- and index-buffers
    can be bound in the sg_apply_bindings call.

    Finally to kick off a compute workload, call sg_dispatch with the
    number of workgroups in the x, y and z-dimension:

        sg_dispatch(int num_groups_x, int num_groups_y, int num_groups_z)

    Also see the following compute-shader samples:

        - https://floooh.github.io/sokol-webgpu/instancing-compute-sapp.html
        - https://floooh.github.io/sokol-webgpu/computeboids-sapp.html
        - https://floooh.github.io/sokol-webgpu/imageblur-sapp.html


    ON SHADER CREATION
    ==================
    sokol-gfx doesn't come with an integrated shader cross-compiler, instead
    backend-specific shader sources or binary blobs need to be provided when
    creating a shader object, along with reflection information about the
    shader resource binding interface needed to bind sokol-gfx resources to the
    proper shader inputs.

    The easiest way to provide all this shader creation data is to use the
    sokol-shdc shader compiler tool to compile shaders from a common
    GLSL syntax into backend-specific sources or binary blobs, along with
    shader interface information and uniform blocks and storage buffer array items
    mapped to C structs.

    To create a shader using a C header which has been code-generated by sokol-shdc:

        // include the C header code-generated by sokol-shdc:
        #include "myshader.glsl.h"
        ...

        // create shader using a code-generated helper function from the C header:
        sg_shader shd = sg_make_shader(myshader_shader_desc(sg_query_backend()));

    The samples in the 'sapp' subdirectory of the sokol-samples project
    also use the sokol-shdc approach:

        https://github.com/floooh/sokol-samples/tree/master/sapp

    If you're planning to use sokol-shdc, you can stop reading here, instead
    continue with the sokol-shdc documentation:

        https://github.com/floooh/sokol-tools/blob/master/docs/sokol-shdc.md

    To create shaders with backend-specific shader code or binary blobs,
    the sg_make_shader() function requires the following information:

    - Shader code or shader binary blobs for the vertex- and fragment-, or the
      compute-shader-stage:
        - for the desktop GL backend, source code can be provided in '#version 410' or
          '#version 430', version 430 is required when using storage buffers and
          compute shaders, but note that this is not available on macOS
        - for the GLES3 backend, source code must be provided in '#version 300 es' or
          '#version 310 es' syntax (version 310 is required for storage buffer and
          compute shader support, but note that this is not supported on WebGL2)
        - for the D3D11 backend, shaders can be provided as source or binary
          blobs, the source code can be in HLSL4.0 (for compatibility with old
          low-end GPUs) or preferably in HLSL5.0 syntax, note that when
          shader source code is provided for the D3D11 backend, sokol-gfx will
          dynamically load 'd3dcompiler_47.dll'
        - for the Metal backends, shaders can be provided as source or binary blobs, the
          MSL version should be in 'metal-1.1' (other versions may work but are not tested)
        - for the WebGPU backend, shaders must be provided as WGSL source code
        - optionally the following shader-code related attributes can be provided:
            - an entry function name (only on D3D11 or Metal, but not OpenGL)
            - on D3D11 only, a compilation target (default is "vs_4_0" and "ps_4_0")

    - Information about the input vertex attributes used by the vertex shader,
      most of that backend-specific:
        - An optional 'base type' (float, signed-/unsigned-int) for each vertex
          attribute. When provided, this is used by the validation layer to check
          that the CPU-side input vertex format is compatible with the input
          vertex declaration of the vertex shader.
        - Metal: no location information needed since vertex attributes are always bound
          by their attribute location defined in the shader via '[[attribute(N)]]'
        - WebGPU: no location information needed since vertex attributes are always
          bound by their attribute location defined in the shader via `@location(N)`
        - GLSL: vertex attribute names can be optionally provided, in that case their
          location will be looked up by name, otherwise, the vertex attribute location
          can be defined with 'layout(location = N)'
        - D3D11: a 'semantic name' and 'semantic index' must be provided for each vertex
          attribute, e.g. if the vertex attribute is defined as 'TEXCOORD1' in the shader,
          the semantic name would be 'TEXCOORD', and the semantic index would be '1'

      NOTE that vertex attributes currently must not have gaps. This requirement
      may be relaxed in the future.

    - Specifically for Metal compute shaders, the 'number of threads per threadgroup'
      must be provided. Normally this is extracted by sokol-shdc from the GLSL
      shader source code. For instance the following statement in the input
      GLSL:

        layout(local_size_x=64, local_size_y=1, local_size_z=1) in;

      ...will be communicated to the sokol-gfx Metal backend in the
      code-generated sg_shader_desc struct:

        (sg_shader_desc){
            .mtl_threads_per_threadgroup = { .x = 64, .y = 1, .z = 1 },
        }

    - Information about each uniform block binding used in the shader:
        - the shader stage of the uniform block (vertex, fragment or compute)
        - the size of the uniform block in number of bytes
        - a memory layout hint (currently 'native' or 'std140') where 'native' defines a
          backend-specific memory layout which shouldn't be used for cross-platform code.
          Only std140 guarantees a backend-agnostic memory layout.
        - a backend-specific bind slot:
            - D3D11/HLSL: the buffer register N (`register(bN)`) where N is 0..7
            - Metal/MSL: the buffer bind slot N (`[[buffer(N)]]`) where N is 0..7
            - WebGPU: the binding N in `@group(0) @binding(N)` where N is 0..15
        - For GLSL only: a description of the internal uniform block layout, which maps
          member types and their offsets on the CPU side to uniform variable names
          in the GLSL shader
        - please also NOTE the documentation sections about UNIFORM DATA LAYOUT
          and CROSS-BACKEND COMMON UNIFORM DATA LAYOUT below!

    - A description of each resource binding (texture-, storage-buffer-
      and storage-image-bindings) which directly map to the sg_bindings.view[]
      array slots.

      Each resource binding slot comes in three flavours:

        1. Texture bindings with the following properties:
            - the shader stage of the texture (vertex, fragment or compute)
            - the expected image type:
                - SG_IMAGETYPE_2D
                - SG_IMAGETYPE_CUBE
                - SG_IMAGETYPE_3D
                - SG_IMAGETYPE_ARRAY
            - the expected 'image sample type':
                - SG_IMAGESAMPLETYPE_FLOAT
                - SG_IMAGESAMPLETYPE_DEPTH
                - SG_IMAGESAMPLETYPE_SINT
                - SG_IMAGESAMPLETYPE_UINT
                - SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT
            - a flag whether the texture is expected to be multisampled
            - a backend-specific bind slot:
                - D3D11/HLSL: the texture register N (`register(tN)`) where N is 0..31
                (in HLSL, readonly storage buffers and texture share the same bind space)
                - Metal/MSL: the texture bind slot N (`[[texture(N)]]`) where N is 0..31
                (the bind slot must not collide with storage image bindings on the same stage)
                - WebGPU/WGSL: the binding N in `@group(0) @binding(N)` where N is 0..127

        2. Storage buffer bindings with the following properties:
            - the shader stage of the storage buffer
            - a boolean 'readonly' flag, this is used for validation and hazard
            tracking in some 3D backends. Note that in render passes, read/write
            storage buffer bindings are only allowed in fragment shaders. Only
            use read/write storage buffer bindings when actually writing to the
            storage buffer in shaders, otherwise use readonly bindings.
            - a backend-specific bind slot:
                - D3D11/HLSL:
                    - for readonly storage buffer bindings: the texture register N
                    (`register(tN)`) where N is 0..31 (in HLSL, readonly storage
                    buffers and textures share the same bind space for
                    'shader resource views')
                    - for read/write storage buffer bindings in compute shaders:
                    the UAV register N (`register(uN)`) where N is 0..31
                    - for read/write storage buffer bindings in fragment shaders:
                    the UAV register N (`register(uN)`) where N must be offset
                    by the number of color attachments (e.g. for the normal
                    case of 1 color attachment, N must be 1..31)
                - Metal/MSL: the buffer bind slot N (`[[buffer(N)]]`) where N is 8..23
                - WebGPU/WGSL: the binding N in `@group(0) @binding(N)` where N is 0..127
                - GL/GLSL: the buffer binding N in `layout(binding=N)`
                  where N is 0..sg_limits.max_storage_buffer_bindings_per_stage
            - note that storage buffer bindings are not supported on all backends
            and platforms

        3. Storage image bindings with the following properties:
            - the shader stage (*must* be compute)
            - the expected image type:
                - SG_IMAGETYPE_2D
                - SG_IMAGETYPE_CUBE
                - SG_IMAGETYPE_3D
                - SG_IMAGETYPE_ARRAY
            - the 'access pixel format', this is currently limited to:
                - SG_PIXELFORMAT_RGBA8
                - SG_PIXELFORMAT_RGBA8SN/UI/SI
                - SG_PIXELFORMAT_RGBA16UI/SI/F
                - SG_PIXELFORMAT_R32UIUI/SI/F
                - SG_PIXELFORMAT_RG32UI/SI/F
                - SG_PIXELFORMAT_RGBA32UI/SI/F
            - the access type (readwrite or writeonly)
            - a backend-specific bind slot:
                - D3D11/HLSL: the UAV register N (`register(uN)` where N is 0..31, the
                bind slot must not collide with UAV storage buffer bindings
                - Metal/MSL: the texture bind slot N (`[[texture(N)]])` where N is 0..31,
                the bind slot must not collide with other texture bindings on the same
                stage
                - WebGPU/WGSL: the binding N in `@group(1) @binding(N)` where N is 0..127
                - GL/GLSL: the buffer binding N in `layout(binding=N)`
                  where N is 0.._sg.max_storage_image_bindings_per_stage
            - note that storage image bindings are not supported on all backends and platforms

    - A description of each sampler used in the shader:
        - the shader stage of the sampler (vertex, fragment or compute)
        - the expected sampler type:
            - SG_SAMPLERTYPE_FILTERING,
            - SG_SAMPLERTYPE_NONFILTERING,
            - SG_SAMPLERTYPE_COMPARISON,
        - a backend-specific bind slot:
            - D3D11/HLSL: the sampler register N (`register(sN)`) where N is 0..SG_MAX_SAMPLER_BINDINGS
            - Metal/MSL: the sampler bind slot N (`[[sampler(N)]]`) where N is 0..SG_MAX_SAMPLER_BINDINGS
            - WebGPU/WGSL: the binding N in `@group(0) @binding(N)` where N is 0..127

    - An array of 'texture-sampler-pairs' used by the shader to sample textures,
      for D3D11, Metal and WebGPU this is used for validation purposes to check
      whether the texture and sampler are compatible with each other (especially
      WebGPU is very picky about combining the correct
      texture-sample-type with the correct sampler-type). For GLSL an
      additional 'combined-image-sampler name' must be provided because 'OpenGL
      style GLSL' cannot handle separate texture and sampler objects, but still
      groups them into a traditional GLSL 'sampler object'.

    Compatibility rules for image-sample-type vs sampler-type are as follows:

        - SG_IMAGESAMPLETYPE_FLOAT => (SG_SAMPLERTYPE_FILTERING or SG_SAMPLERTYPE_NONFILTERING)
        - SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT => SG_SAMPLERTYPE_NONFILTERING
        - SG_IMAGESAMPLETYPE_SINT => SG_SAMPLERTYPE_NONFILTERING
        - SG_IMAGESAMPLETYPE_UINT => SG_SAMPLERTYPE_NONFILTERING
        - SG_IMAGESAMPLETYPE_DEPTH => SG_SAMPLERTYPE_COMPARISON

    Backend-specific bindslot ranges (not relevant when using sokol-shdc):

        - D3D11/HLSL:
            - separate bindslot space per shader stage
            - uniform block bindings (as cbuffer): `register(b0..b7)`
            - texture- and readonly storage-buffer-bindings: `register(t0..t31)`
            - read/write storage-buffer- and storage-image-bindings in
              compute shaders: `register(u0..u31)`
            - read/write storage-buffer-bindings in fragment shaders: `register(uN..u31)`
              where N is >= the number of color attachments
            - samplers: `register(s0..s11)`
        - Metal/MSL:
            - separate bindslot space per shader stage
            - uniform blocks: `[[buffer(0..7)]]`
            - storage buffers: `[[buffer(8..23)]]`
            - textures and storage image bindings: `[[texture(0..31)]]`
            - samplers: `[[sampler(0..11)]]`
        - WebGPU/WGSL:
            - common bindslot space across shader stages
            - uniform blocks: `@group(0) @binding(0..15)`
            - textures, storage-images, storage-buffers and sampler: `@group(1) @binding(0..127)`
        - GL/GLSL:
            - uniforms and image-samplers are bound by name
            - storage buffer bindings: `layout(std430, binding=0..sg_limits.max_storage_buffer_bindings_per_stage` (common
              bindslot space across shader stages)
            - storage image bindings: `layout(binding=0..sg_limits.max_storage_image_bindings_per_stage, [access_format])`

    For example code of how to create backend-specific shader objects,
    please refer to the following samples:

        - for D3D11:    https://github.com/floooh/sokol-samples/tree/master/d3d11
        - for Metal:    https://github.com/floooh/sokol-samples/tree/master/metal
        - for OpenGL:   https://github.com/floooh/sokol-samples/tree/master/glfw
        - for GLES3:    https://github.com/floooh/sokol-samples/tree/master/html5
        - for WebGPU:   https://github.com/floooh/sokol-samples/tree/master/wgpu


    ON SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT AND SG_SAMPLERTYPE_NONFILTERING
    ========================================================================
    The WebGPU backend introduces the concept of 'unfilterable-float' textures,
    which can only be combined with 'nonfiltering' samplers (this is a restriction
    specific to WebGPU, but since the same sokol-gfx code should work across
    all backend, the sokol-gfx validation layer also enforces this restriction
    - the alternative would be undefined behaviour in some backend APIs on
    some devices).

    The background is that some mobile devices (most notably iOS devices) can
    not perform linear filtering when sampling textures with certain pixel
    formats, most notable the 32F formats:

        - SG_PIXELFORMAT_R32F
        - SG_PIXELFORMAT_RG32F
        - SG_PIXELFORMAT_RGBA32F

    The information of whether a shader is going to be used with such an
    unfilterable-float texture must already be provided in the sg_shader_desc
    struct when creating the shader (see the above section "ON SHADER CREATION").

    If you are using the sokol-shdc shader compiler, the information whether a
    texture/sampler binding expects an 'unfilterable-float/nonfiltering'
    texture/sampler combination cannot be inferred from the shader source
    alone, you'll need to provide this hint via annotation-tags. For instance
    here is an example from the ozz-skin-sapp.c sample shader which samples an
    RGBA32F texture with skinning matrices in the vertex shader:

    ```glsl
    @image_sample_type joint_tex unfilterable_float
    uniform texture2D joint_tex;
    @sampler_type smp nonfiltering
    uniform sampler smp;
    ```

    This will result in SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT and
    SG_SAMPLERTYPE_NONFILTERING being written to the code-generated
    sg_shader_desc struct.


    ON VERTEX FORMATS
    =================
    Sokol-gfx implements the same strict mapping rules from CPU-side
    vertex component formats to GPU-side vertex input data types:

    - float and packed normalized CPU-side formats must be used as
      floating point base type in the vertex shader
    - packed signed-integer CPU-side formats must be used as signed
      integer base type in the vertex shader
    - packed unsigned-integer CPU-side formats must be used as unsigned
      integer base type in the vertex shader

    These mapping rules are enforced by the sokol-gfx validation layer,
    but only when sufficient reflection information is provided in
    `sg_shader_desc.attrs[].base_type`. This is the case when sokol-shdc
    is used, otherwise the default base_type will be SG_SHADERATTRBASETYPE_UNDEFINED
    which causes the sokol-gfx validation check to be skipped (of course you
    can also provide the per-attribute base type information manually when
    not using sokol-shdc).

    The detailed mapping rules from SG_VERTEXFORMAT_* to GLSL data types
    are as follows:

    - FLOAT[*] => float, vec*
    - BYTE4N => vec* (scaled to -1.0 .. +1.0)
    - UBYTE4N => vec* (scaled to 0.0 .. +1.0)
    - SHORT[*]N => vec* (scaled to -1.0 .. +1.0)
    - USHORT[*]N => vec* (scaled to 0.0 .. +1.0)
    - INT[*] => int, ivec*
    - UINT[*] => uint, uvec*
    - BYTE4 => int*
    - UBYTE4 => uint*
    - SHORT[*] => int*
    - USHORT[*] => uint*

    NOTE that sokol-gfx only provides vertex formats with sizes of a multiple
    of 4 (e.g. BYTE4N but not BYTE2N). This is because vertex components must
    be 4-byte aligned anyway.


    UNIFORM DATA LAYOUT:
    ====================
    NOTE: if you use the sokol-shdc shader compiler tool, you don't need to worry
    about the following details.

    The data that's passed into the sg_apply_uniforms() function must adhere to
    specific layout rules so that the GPU shader finds the uniform block
    items at the right offset.

    For the D3D11 and Metal backends, sokol-gfx only cares about the size of uniform
    blocks, but not about the internal layout. The data will just be copied into
    a uniform/constant buffer in a single operation and it's up you to arrange the
    CPU-side layout so that it matches the GPU side layout. This also means that with
    the D3D11 and Metal backends you are not limited to a 'cross-platform' subset
    of uniform variable types.

    If you ever only use one of the D3D11, Metal *or* WebGPU backend, you can stop reading here.

    For the GL backends, the internal layout of uniform blocks matters though,
    and you are limited to a small number of uniform variable types. This is
    because sokol-gfx must be able to locate the uniform block members in order
    to upload them to the GPU with glUniformXXX() calls.

    To describe the uniform block layout to sokol-gfx, the following information
    must be passed to the sg_make_shader() call in the sg_shader_desc struct:

        - a hint about the used packing rule (either SG_UNIFORMLAYOUT_NATIVE or
          SG_UNIFORMLAYOUT_STD140)
        - a list of the uniform block members types in the correct order they
          appear on the CPU side

    For example if the GLSL shader has the following uniform declarations:

        uniform mat4 mvp;
        uniform vec2 offset0;
        uniform vec2 offset1;
        uniform vec2 offset2;

    ...and on the CPU side, there's a similar C struct:

        typedef struct {
            float mvp[16];
            float offset0[2];
            float offset1[2];
            float offset2[2];
        } params_t;

    ...the uniform block description in the sg_shader_desc must look like this:

        sg_shader_desc desc = {
            .vs.uniform_blocks[0] = {
                .size = sizeof(params_t),
                .layout = SG_UNIFORMLAYOUT_NATIVE,  // this is the default and can be omitted
                .uniforms = {
                    // order must be the same as in 'params_t':
                    [0] = { .name = "mvp", .type = SG_UNIFORMTYPE_MAT4 },
                    [1] = { .name = "offset0", .type = SG_UNIFORMTYPE_VEC2 },
                    [2] = { .name = "offset1", .type = SG_UNIFORMTYPE_VEC2 },
                    [3] = { .name = "offset2", .type = SG_UNIFORMTYPE_VEC2 },
                }
            }
        };

    With this information sokol-gfx can now compute the correct offsets of the data items
    within the uniform block struct.

    The SG_UNIFORMLAYOUT_NATIVE packing rule works fine if only the GL backends are used,
    but for proper D3D11/Metal/GL a subset of the std140 layout must be used which is
    described in the next section:


    CROSS-BACKEND COMMON UNIFORM DATA LAYOUT
    ========================================
    For cross-platform / cross-3D-backend code it is important that the same uniform block
    layout on the CPU side can be used for all sokol-gfx backends. To achieve this,
    a common subset of the std140 layout must be used:

    - The uniform block layout hint in sg_shader_desc must be explicitly set to
      SG_UNIFORMLAYOUT_STD140.
    - Only the following GLSL uniform types can be used (with their associated sokol-gfx enums):
        - float => SG_UNIFORMTYPE_FLOAT
        - vec2  => SG_UNIFORMTYPE_FLOAT2
        - vec3  => SG_UNIFORMTYPE_FLOAT3
        - vec4  => SG_UNIFORMTYPE_FLOAT4
        - int   => SG_UNIFORMTYPE_INT
        - ivec2 => SG_UNIFORMTYPE_INT2
        - ivec3 => SG_UNIFORMTYPE_INT3
        - ivec4 => SG_UNIFORMTYPE_INT4
        - mat4  => SG_UNIFORMTYPE_MAT4
    - Alignment for those types must be as follows (in bytes):
        - float => 4
        - vec2  => 8
        - vec3  => 16
        - vec4  => 16
        - int   => 4
        - ivec2 => 8
        - ivec3 => 16
        - ivec4 => 16
        - mat4  => 16
    - Arrays are only allowed for the following types: vec4, int4, mat4.

    Note that the HLSL cbuffer layout rules are slightly different from the
    std140 layout rules, this means that the cbuffer declarations in HLSL code
    must be tweaked so that the layout is compatible with std140.

    The by far easiest way to tackle the common uniform block layout problem is
    to use the sokol-shdc shader cross-compiler tool!


    ON POPULATING IMMUTABLE RESOURCES
    =================================
    There's two ways to initialize immutable resources (buffers and images)
    with data:

    1. directly in the sg_make_buffer and sg_make_image calls via the nested
       structs sg_buffer_desc.data and sg_image_desc.data
    2. after creation via the sg_write_buffer_unsealed and sg_write_image_unsealed
       calls

    Passing the initial data (i.e. point (1)) right into the sg_make_buffer and
    sg_make_image functions is preferred when that data already exists as a data
    blob with the right data layout in memory, e.g.:

    ```c
    uint8_t vertex_data[] = { ... };
    const sg_buffer buf = sg_make_buffer(&(sg_buffer_desc){
        .data = SG_RANGE(vertex_data),
    });
    ```

    ```c
    uint8_t mip0_data[] = { ... };
    uint8_t mip1_data[] = { ... };
    // ... more mip levels
    const sg_image img = sg_make_image(&(sg_image_desc){
        .data.mip_levels = {
            [0] = SG_RANGE(mip0_data),
            [1] = SG_RANGE(mip1_data),
            // ...
        },
        // ... more create options
    });
    ```

    Using the 'write-unsealed' functions is a bit more effort but
    much more flexible (especially for initializing image data).

    The general procedure for initializing immutable resources after creation
    is:

    1. Create the resource in resource state 'unsealed' via the write_unsealed
       usage flag (note that `desc.usage.write_unsealed = true` implies
       `desc.usage.immutable = true`).

        For buffers:
        ```c
        const sg_buffer buf = sg_make_buffer(&(sg_buffer_desc){
            .usage.write_unsealed = true,
            .size = buffer_size,
        });

        For images:
        ```c
        const sg_image img = sg_make_image(&(sg_image_desc){
            .usage.write_unsealed = true,
            // ...further image creation options
        });
        ```

    2. Populate the unsealed resources with one or multiple write-unsealed
       calls.

        For buffers:
        ```c
        sg_write_buffer_unsealed(&(sg_write_buffer_desc){
            .src = {
                .data = {
                    .ptr = src_data_ptr,
                    .size = src_data_size,
                },
                .offset = ...,  // optional offset into src.data
            },
            .dst = {
                .buffer = buf,
                .offset = ...,  // optional offset into buffer
            },
            .size = ...,  // optional number of bytes to write
        });
        ```

        You can usually omit `.src.offset`, `.dst.offset` and `.size`. In
        that case all data pointed to by `.src.data` will be copied to the
        start of the buffer, e.g. the simplest possible `sg_write_buffer_unsealed`
        call looks like this:
        ```c
        uint8_t vertex_data[] = { ... };
        sg_write_buffer_unsealed(&(sg_write_buffer_desc){
            .src.data = SG_RANGE(vertex_data),
            .dst.buffer = buf,
        });
        ```

        For images the write-unsealed call works per mip-level:
        ```c
        sg_write_image_unsealed(&(sg_write_image_desc){
            .src = {
                .data = {
                    .ptr = src_data_ptr,
                    .size = src_data_size,
                },
                .offset = ...,          // optional offset into source data
                .bytes_per_row = ...,   // optional bytes per row of source data
                .bytes_per_slice = ..., // optional bytes per slice of source data
            },
            .dst = {
                .image = img,
                .mip_level = ...,       // the miplevel to write into
                .x = ...,               // x position of region to write in pixels
                .y = ...,               // y position of region to write in pixels
                .slice = ...,           // array/cubemap/3d slice index to write to
            },
            .size = {
                .width = ...,           // width in pixels of region to write in pixels
                .height = ...,          // height in pixels of region to write in pixels
                .num_slices = ...,      // number of array/cubemap/3d slices to write
            },
        });
        ```

        Most of the sg_write_image_unsealed options have useful defaults,
        for instance to initialize the entire first mip level with data that's
        tightly packed in memory the call looks much simpler:
        ```c
        uint8_t mip_data = { ... };
        sg_write_image_unsealed(&(sg_write_image_desc){
            .src.data = SG_RANGE(mip_data),
            .dst.image = img,
        });
        ```

    3. After all data has been written to the unsealed resources, 'seal'
       the resource by calling:
        ```c
        sg_seal_buffer(buf);
        sg_seal_image(img);
        ```

        This transitions the resource state from 'unsealed' to 'valid' and allows
        the resource to be bound via the `sg_apply_bindings` call (technically
        you can bind an unsealed resource, but this will cause the following
        sg_draw/sg_dispatch calls to be silently ignored).

        Once a resource has been sealed it can no longer be updated with CPU
        data, e.g. it's not possible to transition a resource back from
        'valid' to 'unsealed' resource state.

    ON COPYING DATA BETWEEN RESOURCES
    =================================
    NOTE: all `sg_copy_*` functions must be called outside passes!

    To copy data between buffers, call `sg_copy_buffer_to_buffer()`.

        ```c
        sg_copy_buffer_to_buffer(&(sg_copy_buffer_to_buffer_desc){
            .src = {
                .buffer = src_buffer,
                .offset = src_offset_in_bytes,
            },
            .dst = {
                .buffer = dst_buffer,
                .offset = dst_offset_in_bytes,
            },
            .size = copy_size_in_bytes,
        });
        ```

    The source buffer must have been created with `.usage.copy_src = true`,
    and the destination buffer with `.usage.copy_dst = true`:

        ```c
        sg_buffer src_buf = sg_make_buffer(&(sg_buffer_desc){
            .usage = {
                .vertex_buffer = true,
                .copy_src = true,
            },
            .data = { ... },
        });

        sg_buffer dst_buf = sg_make_buffer(&(sg_buffer_desc){
            .usage = {
                .vertex_buffer = true,
                .copy_dst = true,
            },
            .size = ...,
        });
        ```

    Likewise to copy data from a buffer into an image, call `sg_copy_buffer_to_image`:

        ```c
        sg_copy_buffer_to_image(&(sg_copy_buffer_to_image_desc){
            // source buffer and image data layout
            .src = {
                .buffer = src_buf,
                .offset = offset_in_bytes,
                .bytes_per_row = ...,
                .bytes_per_slice = ...,
            },
            // destination image, miplevel and location
            .dst = {
                .image = dst_img,
                .mip_level = ...,
                .x = ...,
                .y = ...,
                .slice = ...,
            },
            // size of region to copy in pixels
            .size = {
                .width = ...,
                .height = ...,
                .num_slices = ...,
            },
        });
        ```

    For detailed information on the parameter structs `sg_copy_buffer_to_buffer_desc` and
    `sg_copy_buffer_to_image_desc` (especially how default values are populated),
    see the struct documentation headers.

    Copying between resources comes with a lot of caveats caused by backend 3D API
    restrictions (alignments, valid resource types, etc...). These detailed
    requirements are listed in the struct documentation below, but for portable
    code you'll at least need to be aware of the following 'dynamic' restrictions
    that only trigger a validation check on certain backends:

    - D3D11 does not support copying from D3D buffers into textures, this means
      that sg_copy_buffer_to_image() is restricted to staging buffers as source
      (created with .usage.staging_buffer) - e.g. on the D3D11 backend,
      sg_copy_buffer_to_image() is *only* useful for uploading CPU-side data into
      images. To check for this restriction at runtime, look at the feature flag
      `sg_features.copy_buffer_to_image_relaxed_buffer_type`.  When this is true,
      sg_copy_buffer_to_image() supports copying from regular non-staging buffer
      types, when false, only `.usage.staging_buffer` buffers are supported.
    - WebGPU requires `sg_copy_buffer_to_image_desc.src.bytes_per_row` to be
      a multiple-of-256 when copying from a non-staging buffer (e.g. regular
      GPU buffers like storage buffers). To check for this restriction at runtime,
      look at the feature flag `sg_features.copy_buffer_to_image_relaxed_bytes_per_row`.
      When true, the multiple-of-256 bytes restriction does not apply for source
      buffers of any type. When false, the restriction applies for non-staging
      buffers.
    - WebGL2 has a restriction that a copy into a buffer with `.usage.index_buffer`
      can only happen from a compatible source buffer which also must contain
      index data (e.g. the source buffer must have been created with either
      `.usage.index_buffer` or the special `.usage.staging_index_buffer`).
      This restriction is gated by the common feature flag
      `sg_features.separate_buffer_types` which also prevents 'multi-usage'
      buffers (like combined vertex- and index-buffers).
    - Also on WebGL2 and for the same reason, attempting to copy from an
      index buffer into an image via `sg_copy_buffer_to_image` is prohibited
    - On the Apple GL/GLES3 backends, when calling `sg_copy_buffer_to_image()`
      from a non-staging buffer, the source buffer offset is ignored because
      of a GL driver bug (which is unlikely to be fixed because
      GL on macOS is long deprecated), sokol_gfx.h will log a one-time message
      when the bug would be triggered. For copying from staging buffers, the
      offset works because of a special workaround in the sokol-gfx GL backend
      (staging buffers are actually heap memory allocations).


    ON UPLOADING PERSISTENT DATA INTO RESOURCES
    ===========================================
    To upload CPU-side data into buffers and images (for instance to manage
    a dynamic texture atlas), first write the data into a 'staging buffer'
    with a `sg_write_buffer_transient()` call, and then copy the data
    into the destination resource via `sg_copy_buffer_to_buffer()` or
    `sg_copy_buffer_to_image()`.

    Create the staging buffer with the usage flags `.staging_buffer`, `.write_transient`
    and `.copy_src`, this is the same no matter if the destination is a buffer
    or image:

        ```c
        sg_buffer staging_buf = sg_make_buffer(&(sg_buffer_desc){
            .usage = {
                .staging_buffer = true,
                .write_transient = true,
                .copy_src = true,
            },
            .size = ...,
        });
        ```
    The destination resource must be created with the additional usage flag
    `.copy_dst`, e.g. for a destination buffer used as vertex buffer:

        ```c
        sg_buffer dst_buf = sg_make_buffer(&(sg_buffer_desc){
            .usage = {
                .vertex_buffer = true,
                .copy_dst = true,
            },
            .size = ...,
        });
        ```

    ...now first write the data into the staging buffer via a regular
    sg_write_buffer_transient() call:

        ```c
        sg_write_buffer_transient(&(sg_write_buffer_desc){
            .src.data = { .ptr = ..., .size = ... },
            .dst.buffer = staging_buf,
        });
        ```

    You can do multiple sg_write_buffer_transient() calls to the same
    buffer in a frame, but *only* until the first `sg_copy_*` call
    in the same frame using this buffer as source.

    Next, *outside* a pass, call sg_copy_buffer_to_buffer to copy the
    data from the transient staging buffer into the 'persistent' destination
    buffer:

        ```c
        sg_copy_buffer_to_buffer(&(sg_copy_buffer_to_buffer_desc){
            .src = {
                .buffer = staging_buf,
                .offset = ...,
            },
            .dst = {
                .buffer = dst_buf,
                .offset = ...,
            },
            .size = ...,
        });
        ```

    For images the process is similar: the destination image must be created
    with `usage.copy_dst` and no initial data:

        ```c
        sg_image dst_img = sg_make_image(&(sg_image_desc){
            .usage = {
                .copy_dst = true,
            },
            .width = ...,
            .height = ...,
            .pixel_format = ...,
        });
        ```

    ...then copy a pixel region from the source buffer into the destination
    image (note that you probably want to provide explicit bytes_per_row and
    bytes_per_slice values for the source data instead of relying on sokol-gfx
    filling in the defaults because the default values assume that the entire
    mip level is copied):

        ```c
        sg_copy_buffer_to_image(&(sg_copy_buffer_to_image_desc){
            // source buffer and image data layout
            .src = {
                .buffer = staging_buf,
                .offset = offset_in_bytes,
                .bytes_per_row = ...,
                .bytes_per_slice = ...,
            },
            // destination image, miplevel and location
            .dst = {
                .image = dst_img,
                .mip_level = ...,
                .x = ...,
                .y = ...,
                .slice = ...,
            },
            // size of region to copy in pixels
            .size = {
                .width = ...,
                .height = ...,
                .num_slices = ...,
            },
        });
        ```

    ON STORAGE BUFFERS
    ==================
    The two main purposes of storage buffers are:

        - to be populated by compute or fragment shaders with dynamically
          generated data
        - for providing random-access data to all shader stages

    Storage buffers can be used to pass large amounts of random-access structured
    data from the CPU side to the shaders. They are similar to data textures, but are
    more convenient to use both on the CPU and shader side since they can be accessed
    in shaders as a 1-dimensional array of struct items.

    Storage buffers are *NOT* supported on the following platform/backend combos:

    - macOS+GL (because storage buffers require GL 4.3, while macOS only goes up to GL 4.1)
    - platforms which only support a GLES3.0 context (WebGL2 and iOS)

    To use storage buffers, the following steps are required:

        - write a shader which uses storage buffers (vertex-shaders can only
          read from storage buffers, while compute- and fragment-shaders can both
          read and write storage buffers)
        - create one or more storage buffers via sg_make_buffer() with the
          `.usage.storage_buffer = true`
        - when creating a shader via sg_make_shader(), populate the sg_shader_desc
          struct with binding info (when using sokol-shdc, this step will be taken care
          of automatically)
            - which storage buffer bind slots on the vertex-, fragment- or compute-stage
              are occupied
            - whether the storage buffer on that bind slot is readonly (readonly
              bindings are required for vertex-shaders, and in fragment- and compute-
              shaders the readonly flag is used to control hazard tracking in some
              3D backends)

        - when calling sg_apply_bindings(), apply the matching bind slots with the previously
          created storage buffers
        - ...and that's it.

    For more details, see the following backend-agnostic sokol samples:

    - simple vertex pulling from a storage buffer:
        - C code: https://github.com/floooh/sokol-samples/blob/master/sapp/vertexpull-sapp.c
        - shader: https://github.com/floooh/sokol-samples/blob/master/sapp/vertexpull-sapp.glsl
    - instanced rendering via storage buffers (vertex- and instance-pulling):
        - C code: https://github.com/floooh/sokol-samples/blob/master/sapp/instancing-pull-sapp.c
        - shader: https://github.com/floooh/sokol-samples/blob/master/sapp/instancing-pull-sapp.glsl
    - storage buffers both on the vertex- and fragment-stage:
        - C code: https://github.com/floooh/sokol-samples/blob/master/sapp/sbuftex-sapp.c
        - shader: https://github.com/floooh/sokol-samples/blob/master/sapp/sbuftex-sapp.glsl
    - the Ozz animation sample rewritten to pull all rendering data from storage buffers:
        - C code: https://github.com/floooh/sokol-samples/blob/master/sapp/ozz-storagebuffer-sapp.cc
        - shader: https://github.com/floooh/sokol-samples/blob/master/sapp/ozz-storagebuffer-sapp.glsl
    - the instancing sample modified to use compute shaders:
        - C code: https://github.com/floooh/sokol-samples/blob/master/sapp/instancing-compute-sapp.c
        - shader: https://github.com/floooh/sokol-samples/blob/master/sapp/instancing-compute-sapp.glsl
    - the Compute Boids sample ported to sokol-gfx:
        - C code: https://github.com/floooh/sokol-samples/blob/master/sapp/computeboids-sapp.c
        - shader: https://github.com/floooh/sokol-samples/blob/master/sapp/computeboids-sapp.glsl
    - writing to a storage buffer from a fragment shader:
        - C code: https://github.com/floooh/sokol-samples/blob/master/sapp/histogram-sapp.c
        - shader: https://github.com/floooh/sokol-samples/blob/master/sapp/histogram-sapp.glsl

    ...also see the following backend-specific vertex pulling samples (those also don't use sokol-shdc):

    - D3D11: https://github.com/floooh/sokol-samples/blob/master/d3d11/vertexpulling-d3d11.c
    - desktop GL: https://github.com/floooh/sokol-samples/blob/master/glfw/vertexpulling-glfw.c
    - Metal: https://github.com/floooh/sokol-samples/blob/master/metal/vertexpulling-metal.c
    - WebGPU: https://github.com/floooh/sokol-samples/blob/master/wgpu/vertexpulling-wgpu.c

    ...and the backend specific compute shader samples:

    - D3D11: https://github.com/floooh/sokol-samples/blob/master/d3d11/instancing-compute-d3d11.c
    - desktop GL: https://github.com/floooh/sokol-samples/blob/master/glfw/instancing-compute-glfw.c
    - Metal: https://github.com/floooh/sokol-samples/blob/master/metal/instancing-compute-metal.c
    - WebGPU: https://github.com/floooh/sokol-samples/blob/master/wgpu/instancing-compute-wgpu.c

    Storage buffer shader authoring caveats when using sokol-shdc:

        - declare a read-only storage buffer interface block with `layout(binding=N) readonly buffer [name] { ... }`
          (where 'N' is the index in `sg_bindings.storage_buffers[N]`)
        - ...or a read/write storage buffer interface block with `layout(binding=N) buffer [name] { ... }`
        - declare a struct which describes a single array item in the storage buffer interface block
        - only put a single flexible array member into the storage buffer interface block

    E.g. a complete example in 'sokol-shdc GLSL':

        ```glsl
        @vs
        // declare a struct:
        struct sb_vertex {
            vec3 pos;
            vec4 color;
        }
        // declare a buffer interface block with a single flexible struct array:
        layout(binding=0) readonly buffer vertices {
            sb_vertex vtx[];
        }
        // in the shader function, access the storage buffer like this:
        void main() {
            vec3 pos = vtx[gl_VertexIndex].pos;
            ...
        }
        @end
        ```

    In a compute (or fragment) shader you can read and write the same item in the same
    storage buffer (but you'll have to be careful for random access since
    many threads of the same shader function run in parallel):

        @cs
        struct sb_item {
            vec3 pos;
            vec3 vel;
        }
        layout(binding=0) buffer items_ssbo {
            sb_item items[];
        }
        layout(local_size_x=64, local_size_y=1, local_size_z=1) in;
        void main() {
            uint idx = gl_GlobalInvocationID.x;
            vec3 pos = items[idx].pos;
            ...
            items[idx].pos = pos;
        }
        @end

    When writing to storage buffers in fragment shaders, the following additional
    restrictions apply:

    A storage buffer that's written to in a fragment shader cannot be used
    in another role in the same render pass, e.g. as vertex- or index-buffer,
    or bound as a readonly storage buffer. This means that writing to a storage
    buffer in one draw call, and then reading the results back in another draw
    call must happen in separate render passes (in compute passes this restriction
    does not apply, you can mix read/write and readonly access to the same resource
    in compute passes, but not in render passes).

    Backend-specific storage-buffer caveats (not relevant when using sokol-shdc):

        D3D11:
            - storage buffers are created as 'raw' Byte Address Buffers
              (https://learn.microsoft.com/en-us/windows/win32/direct3d11/overviews-direct3d-11-resources-intro#raw-views-of-buffers)
            - in HLSL, use a ByteAddressBuffer for readonly access of the buffer content:
              (https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/sm5-object-byteaddressbuffer)
            - ...or RWByteAddressBuffer for read/write access:
              (https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/sm5-object-rwbyteaddressbuffer)
            - readonly-storage buffers and textures are both bound as 'shader-resource-view' and
              share the same bind slots (declared as `register(tN)` in HLSL, where N must be in the range 0..31)
            - read/write storage buffers and storage images in compute shaders are bound as 'unordered-access-view'
              (declared as `register(uN)` in HLSL where N is in the range 0..31 on Feature Level 11.1
              devices and 0..7 on Feature Level 11.0 devices)
            - read/write storage buffers in fragment shaders are also bound as 'unordered-access-view'
              (declared as `register(uN)` in HLSL where N must not collide with color attachment
              'bind slots', e.g. when the fragment shader uses 4 color attachments, the UAV bind slots
              must start at 4: `register(u4..u31)`)

        Metal:
            - in Metal there is no internal difference between vertex-, uniform- and
              storage-buffers, all are bound to the same 'buffer bind slots' with the
              following reserved ranges:
                - vertex shader stage:
                    - uniform buffers: slots 0..7
                    - storage buffers: slots 8..15
                    - vertex buffers: slots 15..23
                - fragment shader stage:
                    - uniform buffers: slots 0..7
                    - storage buffers: slots 8..15
            - this means in MSL, storage buffer bindings start at [[buffer(8)]] both in
              the vertex and fragment stage

        GL:
            - the GL backend doesn't use name-lookup to find storage buffer bindings, this
              means you must annotate buffers with `layout(std430, binding=N)` in GLSL
            - ...where N is 0..sg_limits.max_storage_buffer_bindings_per_stage.

        WebGPU:
            - in WGSL, textures, samplers and storage buffers all use a shared
              bindspace across all shader stages on bindgroup 1:

              `@group(1) @binding(0..127)

    ON STORAGE IMAGES:
    ==================
    To write pixel data to texture objects in compute shaders, first an image
    object must be created with `storage_image usage`:

        sg_image storage_image = sg_make_image(&(sg_image_desc){
            .usage.storage_image = true,
            },
            .width = ...,
            .height = ...,
            .pixel_format = ...,
        });

    Next a storage-image-view object is required which also allows to pick
    a specific mip-level or slice for the compute-shader to access:

        sg_view simg_view = sg_make_view(&(sg_view_desc){
            .storage_image = {
                .image = storage_image,
                .mip_level = ...,
                .slice = ...
            },
        });

    Finally 'bind' the storage-image-view via a regular sg_apply_bindings() call
    inside a compute pass:

        sg_begin_pass(&(sg_pass){ .compute = true });
        sg_apply_pipeline(...);
        sg_apply_bindings(&(sg_bindings){
            .views[VIEW_simg] = simg_view,
        });
        sg_dispatch(...);
        sg_end_pass();

    Currently, storage images can only be used with `readwrite` or `writeonly` access in
    shaders. For readonly access use a regular texture binding instead.

    For an example of using storage images in compute shaders see imageblur-sapp:

        - C code: https://github.com/floooh/sokol-samples/blob/master/sapp/imageblur-sapp.c
        - shader: https://github.com/floooh/sokol-samples/blob/master/sapp/imageblur-sapp.glsl

    TRACE HOOKS:
    ============
    sokol_gfx.h optionally allows to install "trace hook" callbacks for
    each public API functions. When a public API function is called, and
    a trace hook callback has been installed for this function, the
    callback will be invoked with the parameters and result of the function.
    This is useful for things like debugging- and profiling-tools, or
    keeping track of resource creation and destruction.

    To use the trace hook feature:

    --- Define SOKOL_TRACE_HOOKS before including the implementation.

    --- Setup an sg_trace_hooks structure with your callback function
        pointers (keep all function pointers you're not interested
        in zero-initialized), optionally set the user_data member
        in the sg_trace_hooks struct.

    --- Install the trace hooks by calling sg_install_trace_hooks(),
        the return value of this function is another sg_trace_hooks
        struct which contains the previously set of trace hooks.
        You should keep this struct around, and call those previous
        functions pointers from your own trace callbacks for proper
        chaining.

    As an example of how trace hooks are used, have a look at the
    imgui/sokol_gfx_imgui.h header which implements a realtime
    debugging UI for sokol_gfx.h on top of Dear ImGui.


    MEMORY ALLOCATION OVERRIDE
    ==========================
    You can override the memory allocation functions at initialization time
    like this:

        void* my_alloc(size_t size, void* user_data) {
            return __sokol_malloc(size);
        }

        void my_free(void* ptr, void* user_data) {
            __sokol_free(ptr);
        }

        ...
            sg_setup(&(sg_desc){
                // ...
                .allocator = {
                    .alloc_fn = my_alloc,
                    .free_fn = my_free,
                    .user_data = ...,
                }
            });
        ...

    If no overrides are provided, malloc and free will be used.

    This only affects memory allocation calls done by sokol_gfx.h
    itself though, not any allocations in OS libraries.


    ERROR REPORTING AND LOGGING
    ===========================
    To get any logging information at all you need to provide a logging callback in the setup call
    the easiest way is to use sokol_log.h:

        #include "sokol_log.h"

        sg_setup(&(sg_desc){ .logger.func = slog_func });

    To override logging with your own callback, first write a logging function like this:

        void my_log(const char* tag,                // e.g. 'sg'
                    uint32_t log_level,             // 0=panic, 1=error, 2=warn, 3=info
                    uint32_t log_item_id,           // SG_LOGITEM_*
                    const char* message_or_null,    // a message string, may be nullptr in release mode
                    uint32_t line_nr,               // line number in sokol_gfx.h
                    const char* filename_or_null,   // source filename, may be nullptr in release mode
                    void* user_data)
        {
            ...
        }

    ...and then setup sokol-gfx like this:

        sg_setup(&(sg_desc){
            .logger = {
                .func = my_log,
                .user_data = my_user_data,
            }
        });

    The provided logging function must be reentrant (e.g. be callable from
    different threads).

    If you don't want to provide your own custom logger it is highly recommended to use
    the standard logger in sokol_log.h instead, otherwise you won't see any warnings or
    errors.


    COMMIT LISTENERS
    ================
    It's possible to hook callback functions into sokol-gfx which are called from
    inside sg_commit() in unspecified order. This is mainly useful for libraries
    that build on top of sokol_gfx.h to be notified about the end/start of a frame.

    To add a commit listener, call:

        static void my_commit_listener(void* user_data) {
            ...
        }

        bool success = sg_add_commit_listener((sg_commit_listener){
            .func = my_commit_listener,
            .user_data = ...,
        });

    The function returns false if the internal array of commit listeners is full,
    or the same commit listener had already been added.

    If the function returns true, my_commit_listener() will be called each frame
    from inside sg_commit().

    By default, 1024 distinct commit listeners can be added, but this number
    can be tweaked in the sg_setup() call:

        sg_setup(&(sg_desc){
            .max_commit_listeners = 2048,
        });

    An sg_commit_listener item is equal to another if both the function
    pointer and user_data field are equal.

    To remove a commit listener:

        bool success = sg_remove_commit_listener((sg_commit_listener){
            .func = my_commit_listener,
            .user_data = ...,
        });

    ...where the .func and .user_data field are equal to a previous
    sg_add_commit_listener() call. The function returns true if the commit
    listener item was found and removed, and false otherwise.


    RESOURCE CREATION AND DESTRUCTION IN DETAIL
    ===========================================
    The 'vanilla' way to create resource objects is with the 'make functions':

        sg_buffer sg_make_buffer(const sg_buffer_desc* desc)
        sg_image sg_make_image(const sg_image_desc* desc)
        sg_sampler sg_make_sampler(const sg_sampler_desc* desc)
        sg_shader sg_make_shader(const sg_shader_desc* desc)
        sg_pipeline sg_make_pipeline(const sg_pipeline_desc* desc)
        sg_view sg_make_view(const sg_view_desc* desc)

    This will result in one of three cases:

        1. The returned handle is invalid. This happens when there are no more
           free slots in the resource pool for this resource type. An invalid
           handle is associated with the INVALID resource state, for instance:

                sg_buffer buf = sg_make_buffer(...)
                if (sg_query_buffer_state(buf) == SG_RESOURCESTATE_INVALID) {
                    // buffer pool is exhausted
                }

        2. The returned handle is valid, but creating the underlying resource
           has failed for some reason. This results in a resource object in the
           FAILED state. The reason *why* resource creation has failed differ
           by resource type. Look for log messages with more details. A failed
           resource state can be checked with:

                sg_buffer buf = sg_make_buffer(...)
                if (sg_query_buffer_state(buf) == SG_RESOURCESTATE_FAILED) {
                    // creating the resource has failed
                }

        3. And finally, if everything goes right, the returned resource is
           in resource state VALID and ready to use. This can be checked
           with:

                sg_buffer buf = sg_make_buffer(...)
                if (sg_query_buffer_state(buf) == SG_RESOURCESTATE_VALID) {
                    // creating the resource has succeeded
                }

    When calling the 'make functions', the created resource goes through a number
    of states:

        - INITIAL: the resource slot associated with the new resource is currently
          free (technically, there is no resource yet, just an empty pool slot)
        - ALLOC: a handle for the new resource has been allocated, this just means
          a pool slot has been reserved.
        - VALID or FAILED: in VALID state any 3D API backend resource objects have
          been successfully created, otherwise if anything went wrong, the resource
          will be in FAILED state.

    Sometimes it makes sense to first grab a handle, but initialize the
    underlying resource at a later time. For instance when loading data
    asynchronously from a slow data source, you may know what buffers and
    textures are needed at an early stage of the loading process, but actually
    loading the buffer or texture content can only be completed at a later time.

    For such situations, sokol-gfx resource objects can be created in two steps.
    You can allocate a handle upfront with one of the 'alloc functions':

        sg_buffer sg_alloc_buffer(void)
        sg_image sg_alloc_image(void)
        sg_sampler sg_alloc_sampler(void)
        sg_shader sg_alloc_shader(void)
        sg_pipeline sg_alloc_pipeline(void)
        sg_view sg_alloc_view(void)

    This will return a handle with the underlying resource object in the
    ALLOC state:

        sg_image img = sg_alloc_image();
        if (sg_query_image_state(img) == SG_RESOURCESTATE_ALLOC) {
            // allocating an image handle has succeeded, otherwise
            // the image pool is full
        }

    Such an 'incomplete' handle can be used in most sokol-gfx rendering functions
    without doing any harm, sokol-gfx will simply skip any rendering operation
    that involve resources which are not in VALID state.

    At a later time (for instance once the texture has completed loading
    asynchronously), the resource creation can be completed by calling one of
    the 'init functions', those functions take an existing resource handle and
    'desc struct':

        void sg_init_buffer(sg_buffer buf, const sg_buffer_desc* desc)
        void sg_init_image(sg_image img, const sg_image_desc* desc)
        void sg_init_sampler(sg_sampler smp, const sg_sampler_desc* desc)
        void sg_init_shader(sg_shader shd, const sg_shader_desc* desc)
        void sg_init_pipeline(sg_pipeline pip, const sg_pipeline_desc* desc)
        void sg_init_view(sg_view view, const sg_view_desc* desc)

    The init functions expect a resource in ALLOC state, and after the function
    returns, the resource will be either in VALID or FAILED state. Calling
    an 'alloc function' followed by the matching 'init function' is fully
    equivalent with calling the 'make function' alone.

    Destruction can also happen as a two-step process. The 'uninit functions'
    will put a resource object from the VALID or FAILED state back into the
    ALLOC state:

        void sg_uninit_buffer(sg_buffer buf)
        void sg_uninit_image(sg_image img)
        void sg_uninit_sampler(sg_sampler smp)
        void sg_uninit_shader(sg_shader shd)
        void sg_uninit_pipeline(sg_pipeline pip)
        void sg_uninit_view(sg_view view)

    Calling the 'uninit functions' with a resource that is not in the VALID or
    FAILED state is a no-op.

    To finally free the pool slot for recycling call the 'dealloc functions':

        void sg_dealloc_buffer(sg_buffer buf)
        void sg_dealloc_image(sg_image img)
        void sg_dealloc_sampler(sg_sampler smp)
        void sg_dealloc_shader(sg_shader shd)
        void sg_dealloc_pipeline(sg_pipeline pip)
        void sg_dealloc_view(sg_view view)

    Calling the 'dealloc functions' on a resource that's not in ALLOC state is
    a no-op, but will generate a warning log message.

    Calling an 'uninit function' and 'dealloc function' in sequence is equivalent
    with calling the associated 'destroy function':

        void sg_destroy_buffer(sg_buffer buf)
        void sg_destroy_image(sg_image img)
        void sg_destroy_sampler(sg_sampler smp)
        void sg_destroy_shader(sg_shader shd)
        void sg_destroy_pipeline(sg_pipeline pip)
        void sg_destroy_view(sg_view view)

    The 'destroy functions' can be called on resources in any state and generally
    do the right thing (for instance if the resource is in ALLOC state, the destroy
    function will be equivalent to the 'dealloc function' and skip the 'uninit part').

    And finally to close the circle, the 'fail functions' can be called to manually
    put a resource in ALLOC state into the FAILED state:

        sg_fail_buffer(sg_buffer buf)
        sg_fail_image(sg_image img)
        sg_fail_sampler(sg_sampler smp)
        sg_fail_shader(sg_shader shd)
        sg_fail_pipeline(sg_pipeline pip)
        sg_fail_view(sg_view view)

    This is recommended if anything went wrong outside of sokol-gfx during asynchronous
    resource setup (for instance a file loading operation failed). In this case,
    the 'fail function' should be called instead of the 'init function'.

    Calling a 'fail function' on a resource that's not in ALLOC state is a no-op,
    but will generate a warning log message.

    NOTE: that two-step resource creation usually only makes sense for buffers,
    images and views, but not for samplers, shaders or pipelines. Most notably, trying
    to create a pipeline object with a shader that's not in VALID state will
    trigger a validation layer error, or if the validation layer is disabled,
    result in a pipeline object in FAILED state.


    WEBGPU CAVEATS
    ==============
    For a general overview and design notes of the WebGPU backend see:

        https://floooh.github.io/2023/10/16/sokol-webgpu.html

    In general, don't expect an automatic speedup when switching from the WebGL2
    backend to the WebGPU backend. Some WebGPU functions currently actually
    have a higher CPU overhead than similar WebGL2 functions, leading to the
    paradoxical situation that some WebGPU code may be slower than similar WebGL2
    code.

    - when writing WGSL shader code by hand, a specific bind-slot convention
      must be used:

      All uniform block structs must use `@group(0)` and bindings in the
      range 0..15

        @group(0) @binding(0..15)

      All textures, samplers, storage-buffers and storage-images must use `@group(1)`
      and bindings must be in the range 0..127:

        @group(1) @binding(0..127)

      Note that the number of texture, sampler, storage-buffer storage-image bindings
      is still limited despite the large bind range:

        - up to 16 textures and sampler across all shader stages
        - up to 8 storage buffers across all shader stages
        - up to 4 storage images on the compute shader stage

      If you use sokol-shdc to generate WGSL shader code, you don't need to worry
      about the above binding conventions since sokol-shdc will allocate
      the WGSL bindslots).

    - The sokol-gfx WebGPU backend uses the sg_desc.uniform_buffer_size item
      to allocate a single per-frame uniform buffer which must be big enough
      to hold all data written by sg_apply_uniforms() during a single frame,
      including a worst-case 256-byte alignment (e.g. each sg_apply_uniform
      call will cost at least 256 bytes of uniform buffer size). The default size
      is 4 MB, which is enough for 16384 sg_apply_uniform() calls per
      frame (assuming the uniform data 'payload' is less than 256 bytes
      per call). These rules are the same as for the Metal backend, so if
      you are already using the Metal backend you'll be fine.

    - sg_apply_bindings(): the sokol-gfx WebGPU backend implements a bindgroup
      cache to prevent excessive creation and destruction of BindGroup objects
      when calling sg_apply_bindings(). The number of slots in the bindgroups
      cache is defined in sg_desc.wgpu.bindgroups_cache_size when calling
      sg_setup. The cache size must be a power-of-2 number, with the default being
      1024. The bindgroups cache behaviour can be observed by calling the new
      function sg_query_stats(), where the following struct items are
      of interest:

        .wgpu.num_bindgroup_cache_hits
        .wgpu.num_bindgroup_cache_misses
        .wgpu.num_bindgroup_cache_collisions
        .wgpu_num_bindgroup_cache_invalidates
        .wgpu.num_bindgroup_cache_vs_hash_key_mismatch

      The value to pay attention to is `.wgpu.num_bindgroup_cache_collisions`,
      if this number is consistently higher than a few percent of the
      .wgpu.num_set_bindgroup value, it might be a good idea to bump the
      bindgroups cache size to the next power-of-2.

    - sg_apply_viewport(): WebGPU currently has a unique restriction that viewport
      rectangles must be contained entirely within the framebuffer. As a shitty
      workaround sokol_gfx.h will clip incoming viewport rectangles against
      the framebuffer, but this will distort the clipspace-to-screenspace mapping.
      There's no proper way to handle this inside sokol_gfx.h, this must be fixed
      in a future WebGPU update (see: https://github.com/gpuweb/gpuweb/issues/373
      and https://github.com/gpuweb/gpuweb/pull/5025)

    - The sokol shader compiler generally adds `diagnostic(off, derivative_uniformity);`
      into the WGSL output. Currently only the Chrome WebGPU implementation seems
      to recognize this.

    - Likewise, the following sokol-gfx pixel formats are not supported in WebGPU:
      R16, R16SN, RG16, RG16SN, RGBA16, RGBA16SN.
      Unlike unsupported vertex formats, unsupported pixel formats can be queried
      in cross-backend code via sg_query_pixelformat() though.

    - The Emscripten WebGPU shim currently doesn't support the Closure minification
      post-link-step (e.g. currently the emcc argument '--closure 1' or '--closure 2'
      will generate broken Javascript code.

    - sokol-gfx requires the WebGPU device feature `depth32float-stencil8` to be enabled
      (this should be widely supported)

    - sokol-gfx expects that the WebGPU device feature `float32-filterable` to *not* be
      enabled (since this would exclude all iOS devices)


    LICENSE
    =======
    zlib/libpng license

    Copyright (c) 2018 Andre Weissflog

    This software is provided 'as-is', without any express or implied warranty.
    In no event will the authors be held liable for any damages arising from the
    use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:

        1. The origin of this software must not be misrepresented; you must not
        claim that you wrote the original software. If you use this software in a
        product, an acknowledgment in the product documentation would be
        appreciated but is not required.

        2. Altered source versions must be plainly marked as such, and must not
        be misrepresented as being the original software.

        3. This notice may not be removed or altered from any source
        distribution.
*/
// ██ ███    ███ ██████  ██      ███████ ███    ███ ███████ ███    ██ ████████  █████  ████████ ██  ██████  ███    ██
// ██ ████  ████ ██   ██ ██      ██      ████  ████ ██      ████   ██    ██    ██   ██    ██    ██ ██    ██ ████   ██
// ██ ██ ████ ██ ██████  ██      █████   ██ ████ ██ █████   ██ ██  ██    ██    ███████    ██    ██ ██    ██ ██ ██  ██
// ██ ██  ██  ██ ██      ██      ██      ██  ██  ██ ██      ██  ██ ██    ██    ██   ██    ██    ██ ██    ██ ██  ██ ██
// ██ ██      ██ ██      ███████ ███████ ██      ██ ███████ ██   ████    ██    ██   ██    ██    ██  ██████  ██   ████
//
// >>implementation
// default clear values
// broad GL feature availability defines (DON'T merge this into the above ifdef-block!)
// optional GL loader definitions (only on Win32)
private { _sg_state_t _sg; }
// ██       ██████   ██████   ██████  ██ ███    ██  ██████
// ██      ██    ██ ██       ██       ██ ████   ██ ██
// ██      ██    ██ ██   ███ ██   ███ ██ ██ ██  ██ ██   ███
// ██      ██    ██ ██    ██ ██    ██ ██ ██  ██ ██ ██    ██
// ███████  ██████   ██████   ██████  ██ ██   ████  ██████
//
// >>logging
when defined(SOKOL_DEBUG) {
private {
u8*[594] _sg_log_messages = {
    "OK: Ok", "MALLOC_FAILED: memory allocation failed",
    "GL_TEXTURE_FORMAT_NOT_SUPPORTED: pixel format not supported for texture (gl)",
    "GL_3D_TEXTURES_NOT_SUPPORTED: 3d textures not supported (gl)",
    "GL_ARRAY_TEXTURES_NOT_SUPPORTED: array textures not supported (gl)",
    "GL_STORAGEBUFFER_GLSL_BINDING_OUT_OF_RANGE: GLSL storage buffer bindslot is out of range (sg_limits.max_storage_buffer_bindings_per_stage) (gl)",
    "GL_STORAGEIMAGE_GLSL_BINDING_OUT_OF_RANGE: GLSL storage image bindslot is out of range (sg.limits.max_storage_image_bindings_per_stage) (gl)",
    "GL_SHADER_COMPILATION_FAILED: shader compilation failed (gl)",
    "GL_SHADER_LINKING_FAILED: shader linking failed (gl)",
    "GL_VERTEX_ATTRIBUTE_NOT_FOUND_IN_SHADER: vertex attribute not found in shader; NOTE: may be caused by GL driver's GLSL compiler removing unused globals",
    "GL_UNIFORMBLOCK_NAME_NOT_FOUND_IN_SHADER: uniform block name not found in shader; NOTE: may be caused by GL driver's GLSL compiler removing unused globals",
    "GL_IMAGE_SAMPLER_NAME_NOT_FOUND_IN_SHADER: image-sampler name not found in shader; NOTE: may be caused by GL driver's GLSL compiler removing unused globals",
    "GL_FRAMEBUFFER_STATUS_UNDEFINED: framebuffer completeness check failed with GL_FRAMEBUFFER_UNDEFINED (gl)",
    "GL_FRAMEBUFFER_STATUS_INCOMPLETE_ATTACHMENT: framebuffer completeness check failed with GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT (gl)",
    "GL_FRAMEBUFFER_STATUS_INCOMPLETE_MISSING_ATTACHMENT: framebuffer completeness check failed with GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT (gl)",
    "GL_FRAMEBUFFER_STATUS_UNSUPPORTED: framebuffer completeness check failed with GL_FRAMEBUFFER_UNSUPPORTED (gl)",
    "GL_FRAMEBUFFER_STATUS_INCOMPLETE_MULTISAMPLE: framebuffer completeness check failed with GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE (gl)",
    "GL_FRAMEBUFFER_STATUS_UNKNOWN: framebuffer completeness check failed (unknown reason) (gl)",
    "GL_APPLE_PIXEL_UNPACK_OFFSET_BUG: sg_copy_buffer_to_image: NOTE: Apple's GL driver ignores source data offset when copying from GL buffer into a texture! (to fix: create source buffer with .usage.staging_buffer)",
    "D3D11_FEATURE_LEVEL_0_DETECTED: D3D11 Feature Level 0 device detected, this restricts the number of UAV slots to 8! (d3d11)",
    "D3D11_CREATE_BUFFER_FAILED: CreateBuffer() failed (d3d11)",
    "D3D11_CREATE_BUFFER_SRV_FAILED: CreateShaderResourceView() failed for storage buffer (d3d11)",
    "D3D11_CREATE_BUFFER_UAV_FAILED: CreateUnorderedAccessView() failed for storage buffer (d3d11)",
    "D3D11_CREATE_DEPTH_TEXTURE_UNSUPPORTED_PIXEL_FORMAT: pixel format not supported for depth-stencil texture (d3d11)",
    "D3D11_CREATE_DEPTH_TEXTURE_FAILED: CreateTexture2D() failed for depth-stencil texture (d3d11)",
    "D3D11_CREATE_2D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT: pixel format not supported for 2d-, cube- or array-texture (d3d11)",
    "D3D11_CREATE_2D_TEXTURE_FAILED: CreateTexture2D() failed for 2d-, cube- or array-texture (d3d11)",
    "D3D11_CREATE_2D_SRV_FAILED: CreateShaderResourceView() failed for 2d-, cube- or array-texture (d3d11)",
    "D3D11_CREATE_3D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT: pixel format not supported for 3D texture (d3d11)",
    "D3D11_CREATE_3D_TEXTURE_FAILED: CreateTexture3D() failed (d3d11)",
    "D3D11_CREATE_3D_SRV_FAILED: CreateShaderResourceView() failed for 3d texture (d3d11)",
    "D3D11_CREATE_MSAA_TEXTURE_FAILED: CreateTexture2D() failed for MSAA render target texture (d3d11)",
    "D3D11_CREATE_SAMPLER_STATE_FAILED: CreateSamplerState() failed (d3d11)",
    "D3D11_UNIFORMBLOCK_HLSL_REGISTER_B_OUT_OF_RANGE: sg_shader_desc.uniform_blocks[].hlsl_register_b_n is out of range (must be 0..7)",
    "D3D11_STORAGEBUFFER_HLSL_REGISTER_T_OUT_OF_RANGE: sg_shader_desc.views[].storage_buffer.hlsl_register_t_n is out of range (must be 0..31)",
    "D3D11_STORAGEBUFFER_HLSL_REGISTER_U_OUT_OF_RANGE: sg_shader_desc.views[].storage_buffer.hlsl_register_u_n is out of range (must be 0..31)",
    "D3D11_IMAGE_HLSL_REGISTER_T_OUT_OF_RANGE: sg_shader_desc.views[].texture.hlsl_register_t_n is out of range (must be 0..31)",
    "D3D11_STORAGEIMAGE_HLSL_REGISTER_U_OUT_OF_RANGE: sg_shader_desc.views[].storage_image.hlsl_register_u_n is out of range (must be 0..31)",
    "D3D11_SAMPLER_HLSL_REGISTER_S_OUT_OF_RANGE: sampler 'hlsl_register_s_n' is out of range (must be 0..11)",
    "D3D11_LOAD_D3DCOMPILER_47_DLL_FAILED: loading d3dcompiler_47.dll failed (d3d11)",
    "D3D11_SHADER_COMPILATION_FAILED: shader compilation failed (d3d11)",
    "D3D11_SHADER_COMPILATION_OUTPUT: ",
    "D3D11_CREATE_CONSTANT_BUFFER_FAILED: CreateBuffer() failed for uniform constant buffer (d3d11)",
    "D3D11_CREATE_INPUT_LAYOUT_FAILED: CreateInputLayout() failed (d3d11)",
    "D3D11_CREATE_RASTERIZER_STATE_FAILED: CreateRasterizerState() failed (d3d11)",
    "D3D11_CREATE_DEPTH_STENCIL_STATE_FAILED: CreateDepthStencilState() failed (d3d11)",
    "D3D11_CREATE_BLEND_STATE_FAILED: CreateBlendState() failed (d3d11)",
    "D3D11_CREATE_RTV_FAILED: CreateRenderTargetView() failed (d3d11)",
    "D3D11_CREATE_DSV_FAILED: CreateDepthStencilView() failed (d3d11)",
    "D3D11_CREATE_UAV_FAILED: CreateUnorderedAccessView() failed (d3d11)",
    "D3D11_MAP_FOR_WRITE_BUFFER_TRANSIENT_FAILED: Map() failed during sg_write_buffer_transient(d3d11)",
    "METAL_CREATE_BUFFER_FAILED: failed to create buffer object (metal)",
    "METAL_TEXTURE_FORMAT_NOT_SUPPORTED: pixel format not supported for texture (metal)",
    "METAL_CREATE_TEXTURE_FAILED: failed to create texture object (metal)",
    "METAL_CREATE_SAMPLER_FAILED: failed to create sampler object (metal)",
    "METAL_SHADER_COMPILATION_FAILED: shader compilation failed (metal)",
    "METAL_SHADER_CREATION_FAILED: shader creation failed (metal)",
    "METAL_SHADER_COMPILATION_OUTPUT: ",
    "METAL_SHADER_ENTRY_NOT_FOUND: shader entry function not found (metal)",
    "METAL_UNIFORMBLOCK_MSL_BUFFER_SLOT_OUT_OF_RANGE: uniform block 'msl_buffer_n' is out of range (must be 0..7)",
    "METAL_STORAGEBUFFER_MSL_BUFFER_SLOT_OUT_OF_RANGE: storage buffer 'msl_buffer_n' is out of range (must be 8..23)",
    "METAL_STORAGEIMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE: storage image 'msl_texture_n' is out of range (must be 0..31)",
    "METAL_IMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE: image 'msl_texture_n' is out of range (must be 0..31)",
    "METAL_SAMPLER_MSL_SAMPLER_SLOT_OUT_OF_RANGE: sampler 'msl_sampler_n' is out of range (must be 0..11)",
    "METAL_CREATE_CPS_FAILED: failed to create compute pipeline state (metal)",
    "METAL_CREATE_CPS_OUTPUT: ",
    "METAL_CREATE_RPS_FAILED: failed to create render pipeline state (metal)",
    "METAL_CREATE_RPS_OUTPUT: ",
    "METAL_CREATE_DSS_FAILED: failed to create depth stencil state (metal)",
    "METAL_CREATE_TEXTUREVIEW_FAILED: failed to create texture view object (metal)",
    "WGPU_BINDGROUPS_POOL_EXHAUSTED: bindgroups pool exhausted (increase sg_desc.bindgroups_cache_size) (wgpu)",
    "WGPU_BINDGROUPSCACHE_SIZE_GREATER_ONE: sg_desc.wgpu.bindgroups_cache_size must be > 1 (wgpu)",
    "WGPU_BINDGROUPSCACHE_SIZE_POW2: sg_desc.wgpu.bindgroups_cache_size must be a power of 2 (wgpu)",
    "WGPU_CREATEBINDGROUP_FAILED: wgpuDeviceCreateBindGroup failed",
    "WGPU_CREATE_BUFFER_FAILED: wgpuDeviceCreateBuffer() failed",
    "WGPU_CREATE_TEXTURE_FAILED: wgpuDeviceCreateTexture() failed",
    "WGPU_CREATE_TEXTURE_VIEW_FAILED: wgpuTextureCreateView() failed",
    "WGPU_CREATE_SAMPLER_FAILED: wgpuDeviceCreateSampler() failed",
    "WGPU_CREATE_SHADER_MODULE_FAILED: wgpuDeviceCreateShaderModule() failed",
    "WGPU_SHADER_CREATE_BINDGROUP_LAYOUT_FAILED: wgpuDeviceCreateBindGroupLayout() for shader stage failed",
    "WGPU_UNIFORMBLOCK_WGSL_GROUP0_BINDING_OUT_OF_RANGE: uniform block 'wgsl_group0_binding_n' is out of range (must be 0..15)",
    "WGPU_TEXTURE_WGSL_GROUP1_BINDING_OUT_OF_RANGE: texture 'wgsl_group1_binding_n' is out of range (must be 0..127)",
    "WGPU_STORAGEBUFFER_WGSL_GROUP1_BINDING_OUT_OF_RANGE: storage buffer 'wgsl_group1_binding_n' is out of range (must be 0..127)",
    "WGPU_STORAGEIMAGE_WGSL_GROUP1_BINDING_OUT_OF_RANGE: storage image 'wgsl_group1_binding_n' is out of range (must be 0..127)",
    "WGPU_SAMPLER_WGSL_GROUP1_BINDING_OUT_OF_RANGE: sampler 'wgsl_group1_binding_n' is out of range (must be 0..127)",
    "WGPU_CREATE_PIPELINE_LAYOUT_FAILED: wgpuDeviceCreatePipelineLayout() failed",
    "WGPU_CREATE_RENDER_PIPELINE_FAILED: wgpuDeviceCreateRenderPipeline() failed",
    "WGPU_CREATE_COMPUTE_PIPELINE_FAILED: wgpuDeviceCreateComputePipeline() failed",
    "VULKAN_REQUIRED_EXTENSION_FUNCTION_MISSING: vulkan: could not look up a required extension function pointer",
    "VULKAN_ALLOC_DEVICE_MEMORY_NO_SUITABLE_MEMORY_TYPE: vulkan: could not find suitable memory type",
    "VULKAN_ALLOCATE_MEMORY_FAILED: vulkan: vkAllocateMemory() failed!",
    "VULKAN_ALLOC_BUFFER_DEVICE_MEMORY_FAILED: vulkan: allocating buffer device memory failed",
    "VULKAN_ALLOC_IMAGE_DEVICE_MEMORY_FAILED: vulkan: allocating image device memory failed",
    "VULKAN_DELETE_QUEUE_EXHAUSTED: vulkan: internal delete queue exhausted (too many objects destroyed per frame)",
    "VULKAN_STAGING_CREATE_BUFFER_FAILED: vulkan: vkCreateBuffer() failed for staging buffer",
    "VULKAN_STAGING_ALLOCATE_MEMORY_FAILED: vulkan: allocating device memory for staging buffer failed",
    "VULKAN_STAGING_BIND_BUFFER_MEMORY_FAILED: vulkan: vkBindBufferMemory() failed for staging buffer",
    "VULKAN_STAGING_TRANSIENT_BUFFER_OVERFLOW: vulkan: per-frame transient staging buffer has overflown (sg_desc.vulkan.transient_staging_buffer_size)",
    "VULKAN_STAGING_IMAGE_ROW_PITCH_GREATER_STAGING_BUFFER: vulkan: the row-pitch of an image update operation is greater than the staging buffer size (increase sg_desc.vulkan.copy_staging_buffer_size)",
    "VULKAN_CREATE_SHARED_BUFFER_FAILED: vulkan: vkCreateBuffer() failed for cpu/gpu-shared buffer",
    "VULKAN_ALLOCATE_SHARED_BUFFER_MEMORY_FAILED: vulkan: allocating device memory for cpu/gpu-shared buffer failed",
    "VULKAN_BIND_SHARED_BUFFER_MEMORY_FAILED: vulkan: vkBindBufferMemory() failed for cpu/gpu-shared buffer",
    "VULKAN_MAP_SHARED_BUFFER_MEMORY_FAILED: vulkan: vkMapMemory() failed on cpu/gpu-shared buffer",
    "VULKAN_CREATE_BUFFER_FAILED: vulkan: vkCreateBuffer() failed!",
    "VULKAN_BIND_BUFFER_MEMORY_FAILED: vulkan: vkBindBufferMemory() failed!",
    "VULKAN_CREATE_IMAGE_FAILED: vulkan: vkCreateImage() failed!",
    "VULKAN_BIND_IMAGE_MEMORY_FAILED: vulkan: vkBindImageMemory() failed!",
    "VULKAN_CREATE_SHADER_MODULE_FAILED: vukan: vkCreateShaderModule() failed!",
    "VULKAN_UNIFORMBLOCK_SPIRV_SET0_BINDING_OUT_OF_RANGE: vulkan: uniform block 'spirv_set0_binding_n' is out of range (must be 0..15)",
    "VULKAN_TEXTURE_SPIRV_SET1_BINDING_OUT_OF_RANGE: vulkan: texture 'spirv_set1_binding_n' is out of range (must be 0..127)",
    "VULKAN_STORAGEBUFFER_SPIRV_SET1_BINDING_OUT_OF_RANGE: vulkan: storage buffer 'spirv_set1_binding_n' is out of range (must be 0..127)",
    "VULKAN_STORAGEIMAGE_SPIRV_SET1_BINDING_OUT_OF_RANGE: vulkan: storage image 'spirv_set1_binding_n' is out of range (must be 0..127)",
    "VULKAN_SAMPLER_SPIRV_SET1_BINDING_OUT_OF_RANGE: vulkan: sampler 'spirv_set1_binding_n' is out of range (must be 0..127)",
    "VULKAN_CREATE_DESCRIPTOR_SET_LAYOUT_FAILED: vulkan: vkCreateDescriptorSetLayout() failed!",
    "VULKAN_SHADER_UNIFORM_DESCRIPTOR_SET_SIZE_VS_CACHE_SIZE: vulkan: shader uniform descriptor set is too big for the descriptor set cache (please write a Github issue)",
    "VULKAN_CREATE_PIPELINE_LAYOUT_FAILED: vulkan: vkCreatePipelineLayout() failed!",
    "VULKAN_CREATE_GRAPHICS_PIPELINE_FAILED: vulkan: vkCreateGraphicsPipelines() failed!",
    "VULKAN_CREATE_COMPUTE_PIPELINE_FAILED: vulkan: vkCreateComputePipelines() failed!",
    "VULKAN_CREATE_IMAGE_VIEW_FAILED: vulkan: vkCreateImageView() failed!",
    "VULKAN_VIEW_MAX_DESCRIPTOR_SIZE: vulkan: required view descriptor size is greater than _SG_VK_MAX_DESCRIPTOR_DATA_SIZE",
    "VULKAN_CREATE_SAMPLER_FAILED: vulkan: vkCreateSampler() failed!",
    "VULKAN_SAMPLER_MAX_DESCRIPTOR_SIZE: vulkan: required sampler descriptor size is greater than _SG_VK_MAX_DESCRIPTOR_DATA_SIZE",
    "VULKAN_WAIT_FOR_FENCE_FAILED: vulkan: vkWaitForFence() failed!",
    "VULKAN_UNIFORM_BUFFER_OVERFLOW: vulkan: uniform buffer has overflown (increase sg_desc.uniform_buffer_size)",
    "VULKAN_DESCRIPTOR_BUFFER_OVERFLOW: vulkan: desccriptor buffer has overflown (increase sg_desc.vulkan.descriptor_buffer_size)",
    "IDENTICAL_COMMIT_LISTENER: attempting to add identical commit listener",
    "COMMIT_LISTENER_ARRAY_FULL: commit listener array full",
    "TRACE_HOOKS_NOT_ENABLED: sg_install_trace_hooks() called, but SOKOL_TRACE_HOOKS is not defined",
    "DEALLOC_BUFFER_INVALID_STATE: sg_dealloc_buffer(): buffer must be in ALLOC state",
    "DEALLOC_IMAGE_INVALID_STATE: sg_dealloc_image(): image must be in alloc state",
    "DEALLOC_SAMPLER_INVALID_STATE: sg_dealloc_sampler(): sampler must be in alloc state",
    "DEALLOC_SHADER_INVALID_STATE: sg_dealloc_shader(): shader must be in ALLOC state",
    "DEALLOC_PIPELINE_INVALID_STATE: sg_dealloc_pipeline(): pipeline must be in ALLOC state",
    "DEALLOC_VIEW_INVALID_STATE: sg_dealloc_view(): view must be in ALLOC state",
    "INIT_BUFFER_INVALID_STATE: sg_init_buffer(): buffer must be in ALLOC state",
    "INIT_IMAGE_INVALID_STATE: sg_init_image(): image must be in ALLOC state",
    "INIT_SAMPLER_INVALID_STATE: sg_init_sampler(): sampler must be in ALLOC state",
    "INIT_SHADER_INVALID_STATE: sg_init_shader(): shader must be in ALLOC state",
    "INIT_PIPELINE_INVALID_STATE: sg_init_pipeline(): pipeline must be in ALLOC state",
    "INIT_VIEW_INVALID_STATE: sg_init_view(): view must be in ALLOC state",
    "UNINIT_BUFFER_INVALID_STATE: sg_uninit_buffer(): buffer must be in VALID, FAILED or ALLOC state",
    "UNINIT_IMAGE_INVALID_STATE: sg_uninit_image(): image must be in VALID, FAILED or ALLOC state",
    "UNINIT_SAMPLER_INVALID_STATE: sg_uninit_sampler(): sampler must be in VALID, FAILED or ALLOC state",
    "UNINIT_SHADER_INVALID_STATE: sg_uninit_shader(): shader must be in VALID, FAILED or ALLOC state",
    "UNINIT_PIPELINE_INVALID_STATE: sg_uninit_pipeline(): pipeline must be in VALID, FAILED or ALLOC state",
    "UNINIT_VIEW_INVALID_STATE: sg_uninit_view(): view must be in VALID, FAILED or ALLOC state",
    "FAIL_BUFFER_INVALID_STATE: sg_fail_buffer(): buffer must be in ALLOC state",
    "FAIL_IMAGE_INVALID_STATE: sg_fail_image(): image must be in ALLOC state",
    "FAIL_SAMPLER_INVALID_STATE: sg_fail_sampler(): sampler must be in ALLOC state",
    "FAIL_SHADER_INVALID_STATE: sg_fail_shader(): shader must be in ALLOC state",
    "FAIL_PIPELINE_INVALID_STATE: sg_fail_pipeline(): pipeline must be in ALLOC state",
    "FAIL_VIEW_INVALID_STATE: sg_fail_view(): view must be in ALLOC state",
    "BUFFER_POOL_EXHAUSTED: buffer pool exhausted", "IMAGE_POOL_EXHAUSTED: image pool exhausted",
    "SAMPLER_POOL_EXHAUSTED: sampler pool exhausted",
    "SHADER_POOL_EXHAUSTED: shader pool exhausted",
    "PIPELINE_POOL_EXHAUSTED: pipeline pool exhausted", "VIEW_POOL_EXHAUSTED: view pool exhausted",
    "BEGINPASS_TOO_MANY_COLOR_ATTACHMENTS: sg_begin_pass: too many color attachments (sg_limits.max_color_attachments)",
    "BEGINPASS_TOO_MANY_RESOLVE_ATTACHMENTS: sg_begin_pass: too many resolve attachments (sg_limits.max_color_attachments)",
    "BEGINPASS_ATTACHMENTS_ALIVE: sg_begin_pass: an attachment was provided that no longer exists",
    "DRAW_WITHOUT_BINDINGS: attempting to draw without resource bindings",
    "WRITE_BUFFER_TRANSIENT_BUFFER_ALIVE: sg_write_buffer_transient: buffer is no longer alive",
    "WRITE_BUFFER_TRANSIENT_BUFFER_VALID: sg_write_buffer_transient: buffer is not in state SG_RESOURCESTATE_VALID",
    "WRITE_IMAGE_TRANSIENT_IMAGE_ALIVE: sg_write_image_transient: image is no longer alive",
    "WRITE_IMAGE_TRANSIENT_IMAGE_VALID: sg_write_image_transient: image is not in state SG_RESOURCESTATE_VALID",
    "WRITE_BUFFER_UNSEALED_BUFFER_ALIVE: sg_write_buffer_unsealed: buffer is no longer alive",
    "WRITE_BUFFER_UNSEALED_BUFFER_UNSEALED: sg_write_buffer_unsealed: buffer is not in state SG_RESOURCESTATE_UNSEALED",
    "WRITE_IMAGE_UNSEALED_IMAGE_ALIVE: sg_write_image_unsealed: image is no longer alive",
    "WRITE_IMAGE_UNSEALED_IMAGE_UNSEALED: sg_write_image_unsealed: image is not in state SG_RESOURCESTATE_UNSEALED",
    "SEAL_BUFFER_ALIVE: sg_seal_buffer: buffer is no longer alive",
    "SEAL_IMAGE_ALIVE: sg_seal_image: image is no longer alive",
    "COPY_BUFFER_TO_BUFFER_SRC_ALIVE: sg_copy_buffer_to_buffer: src buffer no longer alive",
    "COPY_BUFFER_TO_BUFFER_DST_ALIVE: sg_copy_buffer_to_buffer: dst buffer no longer alive",
    "COPY_BUFFER_TO_BUFFER_SRC_VALID: sg_copy_buffer_to_buffer: src buffer not in state SG_RESOURCESTATE_VALID",
    "COPY_BUFFER_TO_BUFFER_DST_VALID: sg_copy_buffer_to_buffer: dst buffer not in state SG_RESOURCESTATE_VALID",
    "COPY_BUFFER_TO_IMAGE_SRC_ALIVE: sg_copy_buffer_to_image: src buffer no longer alive",
    "COPY_BUFFER_TO_IMAGE_DST_ALIVE: sg_copy_buffer_to_image: dst image no longer alive",
    "COPY_BUFFER_TO_IMAGE_SRC_VALID: sg_copy_buffer_to_image: src buffer not in state SG_RESOURCESTATE_VALID",
    "COPY_BUFFER_TO_IMAGE_DST_VALID: sg_copy_buffer_to_image: dst image not in state SG_RESOURCESTATE_VALID",
    "SHADERDESC_TOO_MANY_VERTEXSTAGE_TEXTURES: sg_shader_desc: too many texture bindings on vertex shader stage (sg_limits.max_texture_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_FRAGMENTSTAGE_TEXTURES: sg_shader_desc: too many texture bindings on fragment shader stage (sg_limits.max_texture_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_COMPUTESTAGE_TEXTURES: sg_shader_desc: too many texture bindings on compute shader stage (sg_limits.max_texture_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_VERTEXSTAGE_STORAGEBUFFERS: sg_shader_desc: too many storage buffer bindings on vertex shader stage (sg_limits.max_storage_buffer_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_FRAGMENTSTAGE_STORAGEBUFFERS: sg_shader_desc: too many storage buffer bindings on fragment shader stage (sg_limits.max_storage_buffer_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_COMPUTESTAGE_STORAGEBUFFERS: sg_shader_desc: too many storage buffer bindings on compute shader stage (sg_limits.max_storage_buffer_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_VERTEXSTAGE_STORAGEIMAGES: sg_shader_desc: too many storage image bindings on vertex shader stage (sg_limits.max_storage_image_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_FRAGMENTSTAGE_STORAGEIMAGES: sg_shader_desc: too many storage image bindings on fragment shader stage (sg_limits.max_storage_image_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_COMPUTESTAGE_STORAGEIMAGES: sg_shader_desc: too many storage image bindings on compute shader stage (sg_limits.max_storage_image_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_VERTEXSTAGE_TEXTURESAMPLERPAIRS: sg_shader_desc: too many texture-sampler-pairs on vertex shader stage (sg_limits.max_texture_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_FRAGMENTSTAGE_TEXTURESAMPLERPAIRS: sg_shader_desc: too many texture-sampler-pairs on fragment shader stage (sg_limits.max_texture_bindings_per_stage)",
    "SHADERDESC_TOO_MANY_COMPUTESTAGE_TEXTURESAMPLERPAIRS: sg_shader_desc: too many texture-sampler-pairs on compute shader stage (sg_limits.max_texture_bindings_per_stage)",
    "VALIDATE_BUFFERDESC_CANARY: sg_buffer_desc not initialized",
    "VALIDATE_BUFFERDESC_EXPECT_NONZERO_SIZE: sg_buffer_desc.size must be greater zero",
    "VALIDATE_BUFFERDESC_STAGING_VS_VERTEXBUFFER: sg_buffer_desc.usage: .staging_buffer or .staging_index_buffer cannot be combined with .vertex_buffer",
    "VALIDATE_BUFFERDESC_STAGING_VS_INDEXBUFFER: sg_buffer_desc.usage: .staging_buffer or .staging_index_buffer cannot be combined with .index_buffer",
    "VALIDATE_BUFFERDESC_STAGING_VS_STORAGEBUFFER: sg_buffer_desc.usage: .staging_buffer or .staging_index_buffer cannot be combined with .storage_buffer",
    "VALIDATE_BUFFERDESC_STAGING_VS_INJECTED: sg_buffer_desc.usage: cannot inject backend-native buffers for .staging or .staging_index_buffer usage",
    "VALIDATE_BUFFERDESC_STAGING_VS_COPYDST: sg_buffer_desc.usage: .staging_buffer and .staging_index_buffer cannot be combined with .copy_dst",
    "VALIDATE_BUFFERDESC_STAGING_VS_INITIALDATA: sg_buffer_desc.usage: .staging_buffer and .staging_index_buffer cannot have initial data",
    "VALIDATE_BUFFERDESC_STAGING_COPYSRC: sg_buffer_desc.usage: .staging_buffer and .staging_index_buffer must be combined with .copy_src",
    "VALIDATE_BUFFERDESC_SEPARATE_BUFFER_TYPES: sg_buffer_desc.usage: on WebGL2, only one of .vertex_buffer or .index_buffer can be true (check sg_features.separate_buffer_types)",
    "VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_WRITETRANSIENT: sg_buffer_desc.usage: .write_unsealed cannot be combined with .write_transient",
    "VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_COPYDST: sg_buffer_desc.usage: .write_unsealed cannot be combined with .copy_dst",
    "VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_STAGING: sg_buffer_desc.usage: .write_unsealed cannot be combined with .staging_buffer or .staging_index_buffer",
    "VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_INITIALDATA: sg_buffer_desc.usage: .write_unsealed buffers cannot have initial data",
    "VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_COPYDST: sg_buffer_desc.usage: .write_transient cannot be combined with .copy_dst",
    "VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_INITIALDATA: sg_buffer_desc.usage: .write_transient buffers cannot have initial data",
    "VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_INJECTED: sg_buffer_desc.usage: cannot inject backend-native buffers for .write_transient usage",
    "VALIDATE_BUFFERDESC_COPYDST_VS_INITIALDATA: sg_buffer_desc.usage: .copy_dst buffers cannot have initial data",
    "VALIDATE_BUFFERDESC_EXPECT_MATCHING_DATA_SIZE: sg_buffer_desc.size and .data.size must be equal",
    "VALIDATE_BUFFERDESC_EXPECT_ZERO_DATA_SIZE: sg_buffer_desc.data.size expected to be zero",
    "VALIDATE_BUFFERDESC_EXPECT_DATA: sg_buffer_desc: buffer content can never be initialized (provide .data, or set .usage.write_unsealed, .usage.write_transient or .usage.copy_dst)",
    "VALIDATE_BUFFERDESC_STORAGEBUFFER_SUPPORTED: storage buffers not supported by the backend 3D API (requires OpenGL >= 4.3)",
    "VALIDATE_BUFFERDESC_STORAGEBUFFER_SIZE_MULTIPLE_4: size of storage buffers must be a multiple of 4",
    "VALIDATE_IMAGEDATA_NODATA: sg_image_data: no data (.ptr and/or .size is zero)",
    "VALIDATE_IMAGEDATA_DATA_SIZE: sg_image_data: data size doesn't match expected surface size",
    "VALIDATE_IMAGEDESC_CANARY: sg_image_desc not initialized",
    "VALIDATE_IMAGEDESC_IMMUTABLE_VS_WRITABLE: sg_image_desc.usage: only one of .immutable, .write_transient, .copy_dst can be true",
    "VALIDATE_IMAGEDESC_WRITEUNSEALED_VS_IMMUTABLE: sg_image_desc.usage: .write_unsealed only allowed for .immutable images",
    "VALIDATE_IMAGEDESC_WRITEUNSEALED_VS_ATTACHMENT: sg_image_desc.usage: .write_unsealed not allowed for images with attachment usage",
    "VALIDATE_IMAGEDESC_WRITETRANSIENT_VS_ATTACHMENT: sg_image_desc.usage: .write_transient not allowed for images with attachment usage",
    "VALIDATE_IMAGEDESC_WRITETRANSIENT_VS_INJECTED: sg_image_desc.usage: cannot inject backend-native textures for .write_transient usage",
    "VALIDATE_IMAGEDESC_COPYDST_VS_ATTACHMENT: sg_image_desc.usage: .copy_dst not allowed for images with attachment usage",
    "VALIDATE_IMAGEDESC_ATTACHMENT_COLOR_DEPTH_STENCIL: sg_image_desc.usage: only one of .color_attachment and .depth_stencil_attachment can be true",
    "VALIDATE_IMAGEDESC_IMAGETYPE_2D_NUMSLICES: sg_image_desc.num_slices must be exactly 1 for SG_IMAGETYPE_2D",
    "VALIDATE_IMAGEDESC_IMAGETYPE_CUBE_NUMSLICES: sg_image_desc.num_slices must be exactly 6 for SG_IMAGETYPE_CUBE",
    "VALIDATE_IMAGEDESC_IMAGETYPE_ARRAY_NUMSLICES: sg_image_desc.num_slices must be ((>= 1) && (<= sg_limits.max_image_array_layers)) for SG_IMAGETYPE_ARRAY",
    "VALIDATE_IMAGEDESC_IMAGETYPE_3D_NUMSLICES: sg_image_desc.num_slices must be ((>= 1) && (<= sg_limits.max_image_size_3d)) for SG_IMAGETYPE_ARRAY",
    "VALIDATE_IMAGEDESC_NUMSLICES: sg_image_desc.num_slices must be > 0",
    "VALIDATE_IMAGEDESC_WIDTH: sg_image_desc.width must be > 0",
    "VALIDATE_IMAGEDESC_HEIGHT: sg_image_desc.height must be > 0",
    "VALIDATE_IMAGEDESC_NONRT_PIXELFORMAT: invalid pixel format for non-render-target image",
    "VALIDATE_IMAGEDESC_MSAA_BUT_NO_ATTACHMENT: non-attachment images cannot be multisampled",
    "VALIDATE_IMAGEDESC_DEPTH_3D_IMAGE: 3D images cannot have a depth/stencil image format",
    "VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_IMMUTABLE: attachment and storage images must be sg_image_usage.immutable",
    "VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_NO_DATA: render/storage attachment images cannot be initialized with data",
    "VALIDATE_IMAGEDESC_ATTACHMENT_PIXELFORMAT: invalid pixel format for render attachment image",
    "VALIDATE_IMAGEDESC_ATTACHMENT_RESOLVE_EXPECT_NO_MSAA: resolve attachment images cannot be multisampled",
    "VALIDATE_IMAGEDESC_ATTACHMENT_NO_MSAA_SUPPORT: multisampling not supported for this pixel format",
    "VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_NUM_MIPMAPS: multisample images must have num_mipmaps == 1",
    "VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_3D_IMAGE: 3D images cannot have a sample_count > 1",
    "VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_CUBE_IMAGE: cube images cannot have sample_count > 1",
    "VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_ARRAY_IMAGE: array images cannot have sample_count > 1",
    "VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_IMMUTABLE: storage images must be sg_image_usage.immutable",
    "VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_DATA: storage images cannot be initialized with data",
    "VALIDATE_IMAGEDESC_STORAGEIMAGE_PIXELFORMAT: invalid pixel format for storage image",
    "VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_MSAA: storage images cannot be multisampled",
    "VALIDATE_IMAGEDESC_INJECTED_NO_DATA: images with injected textures cannot be initialized with data",
    "VALIDATE_IMAGEDESC_WRITABLE_NO_DATA: cpu-writable images cannot be initialized with data",
    "VALIDATE_SAMPLERDESC_CANARY: sg_sampler_desc not initialized",
    "VALIDATE_SAMPLERDESC_ANISTROPIC_REQUIRES_LINEAR_FILTERING: sg_sampler_desc.max_anisotropy > 1 requires min/mag/mipmap_filter to be SG_FILTER_LINEAR",
    "VALIDATE_SHADERDESC_CANARY: sg_shader_desc not initialized",
    "VALIDATE_SHADERDESC_VERTEX_SOURCE: vertex shader source code expected",
    "VALIDATE_SHADERDESC_FRAGMENT_SOURCE: fragment shader source code expected",
    "VALIDATE_SHADERDESC_COMPUTE_SOURCE: compute shader source code expected",
    "VALIDATE_SHADERDESC_VERTEX_SOURCE_OR_BYTECODE: vertex shader source or byte code expected",
    "VALIDATE_SHADERDESC_FRAGMENT_SOURCE_OR_BYTECODE: fragment shader source or byte code expected",
    "VALIDATE_SHADERDESC_COMPUTE_SOURCE_OR_BYTECODE: compute shader source or byte code expected",
    "VALIDATE_SHADERDESC_INVALID_SHADER_COMBO: cannot combine compute shaders with vertex or fragment shaders",
    "VALIDATE_SHADERDESC_NO_BYTECODE_SIZE: shader byte code length (in bytes) required",
    "VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP_INITIALIZED: sg_shader_desc.mtl_threads_per_threadgroup must be initialized for compute shaders (metal)",
    "VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP_MULTIPLE_32: sg_shader_desc.mtl_threads_per_threadgroup (x * y * z) must be a multiple of 32 (metal)",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_CONT_MEMBERS: sg_shader_desc.uniform_blocks[].glsl_uniforms[]: items must occupy continuous slots",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_IS_ZERO: sg_shader_desc.uniform_blocks[].size cannot be zero",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_METAL_BUFFER_SLOT_COLLISION: sg_shader_desc.uniform_blocks[].msl_buffer_n must be unique across uniform blocks and storage buffers in same shader stage",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_HLSL_REGISTER_B_COLLISION: sg_shader_desc.uniform_blocks[].hlsl_register_b_n must be unique across uniform blocks in same shader stage",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_WGSL_GROUP0_BINDING_COLLISION: sg_shader_desc.uniform_blocks[].wgsl_group0_binding_n must be unique across all uniform blocks",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_SPIRV_SET0_BINDING_COLLISION: sg_shader_desc.unifrom_blocks[].spirv_set0_binding_n must be unique across all uniform blocks",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_MEMBERS: sg_shader_desc.uniform_blocks[].glsl_uniforms[]: GL backend requires uniform block member declarations",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_UNIFORM_GLSL_NAME: sg_shader_desc.uniform_blocks[].glsl_uniforms[].glsl_name missing",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_MISMATCH: sg_shader_desc.uniform_blocks[].glsl_uniforms[]: size of uniform block members doesn't match uniform block size",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_ARRAY_COUNT: sg_shader_desc.uniform_blocks[].glsl_uniforms[].array_count must be >= 1",
    "VALIDATE_SHADERDESC_UNIFORMBLOCK_STD140_ARRAY_TYPE: sg_shader_desc.uniform_blocks[].glsl_uniforms[].type: uniform arrays only allowed for FLOAT4, INT4, MAT4 in std140 layout",
    "VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_VERTEXSHADER_READWRITE: sg_shader_desc.views[].storage_buffer.stage vs .readonly: vertex shaders cannot write to storage buffers",
    "VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_METAL_BUFFER_SLOT_COLLISION: sg_shader_desc.views[].storage_buffer.msl_buffer_n must be unique across uniform blocks and storage buffer in same shader stage",
    "VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_T_COLLISION: sg_shader_desc.views[].storage_buffer.hlsl_register_t_n must be unique across read-only storage buffers and images in same shader stage",
    "VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_U_COLLISION: sg_shader_desc.views[].storage_buffer.hlsl_register_u_n must be unique across read/write storage buffers and storage images in same shader stage",
    "VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_GLSL_BINDING_COLLISION: sg_shader_desc.views[].storage_buffer.glsl_binding_n must be unique across shader stages",
    "VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_WGSL_GROUP1_BINDING_COLLISION: sg_shader_desc.views[].storage_buffer.wgsl_group1_binding_n must be unique across all view and sampler bindings",
    "VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_SPIRV_SET1_BINDING_COLLISION: sg_shader_desc.views[].storage_buffer.spirv_set1_binding_n must be unique across all view and sampler bindings",
    "VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_EXPECT_COMPUTE_STAGE: sg_shader_desc.views[].storage_image: storage images are allowed on the compute stage",
    "VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_METAL_TEXTURE_SLOT_COLLISION: sg_shader_desc.views[].storage_image.msl_texture_n must be unique across images and storage images in same shader stage",
    "VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_HLSL_REGISTER_U_COLLISION: sg_shader_desc.views[].storage_image.hlsl_register_u_n must be unique across storage images and read/write storage buffers in same shader stage",
    "VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_GLSL_BINDING_COLLISION: sg_shader_desc.views[].storage_image.glsl_binding_n must be unique across shader stages",
    "VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_WGSL_GROUP1_BINDING_COLLISION: sg_shader_desc.views[].storage_image.wgsl_group1_binding_n must be unique across all view and sampler bindings",
    "VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_SPIRV_SET1_BINDING_COLLISION: sg_shader_desc.views[].storage_image.spirv_set1_binding_n must be unique across all view and sampler bindings",
    "VALIDATE_SHADERDESC_VIEW_TEXTURE_METAL_TEXTURE_SLOT_COLLISION: sg_shader_desc.views[].texture.msl_texture_n must be unique across textures and storage images in same shader stage",
    "VALIDATE_SHADERDESC_VIEW_TEXTURE_HLSL_REGISTER_T_COLLISION: sg_shader_desc.views[].texture.hlsl_register_t_n must be unique across textures and storage buffers in same shader stage",
    "VALIDATE_SHADERDESC_VIEW_TEXTURE_WGSL_GROUP1_BINDING_COLLISION: sg_shader_desc.views[].texture.wgsl_group1_binding_n must be unique across all view and sampler bindings",
    "VALIDATE_SHADERDESC_VIEW_TEXTURE_SPIRV_SET1_BINDING_COLLISION: sg_shader_desc.views[].texture.spirv_set1_binding_n must be unique across all view and sampler bindings",
    "VALIDATE_SHADERDESC_SAMPLER_METAL_SAMPLER_SLOT_COLLISION: sg_shader_desc.samplers[].msl_sampler_n must be unique in same shader stage",
    "VALIDATE_SHADERDESC_SAMPLER_HLSL_REGISTER_S_COLLISION: sg_shader_desc.samplers[].hlsl_register_s_n must be unique in same shader stage",
    "VALIDATE_SHADERDESC_SAMPLER_WGSL_GROUP1_BINDING_COLLISION: sg_shader_desc.samplers[].wgsl_group1_binding_n must be unique across all view and sampler bindings",
    "VALIDATE_SHADERDESC_SAMPLER_SPIRV_SET1_BINDING_COLLISION: sg_shader_desc.samplers[].spirv_set1_binding_n must be unique across all view and sampler bindings",
    "VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_VIEW_SLOT_OUT_OF_RANGE: texture-sampler-pair view slot index is out of range (sg_shader_desc.texture_sampler_pairs[].view_slot)",
    "VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_SLOT_OUT_OF_RANGE: texture-sampler-pair sampler slot index is out of range (sg_shader_desc.texture_sampler_pairs[].sampler_slot)",
    "VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_TEXTURE_STAGE_MISMATCH: texture-sampler-pair stage doesn't match referenced texture stage",
    "VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_EXPECT_TEXTURE_VIEW: texture-sampler-pair view must be a texture view (sg_shader_desc.texture_sampler_pairs[].view_slot => sg_shaders_desc.views[i].texture)",
    "VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_STAGE_MISMATCH: texture-sampler-pair stage doesn't match referenced sampler stage",
    "VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_GLSL_NAME: texture-sampler-pair 'glsl_name' missing",
    "VALIDATE_SHADERDESC_NONFILTERING_SAMPLER_REQUIRED: image sample type UNFILTERABLE_FLOAT, UINT, SINT can only be used with NONFILTERING sampler",
    "VALIDATE_SHADERDESC_COMPARISON_SAMPLER_REQUIRED: image sample type DEPTH can only be used with COMPARISON sampler",
    "VALIDATE_SHADERDESC_TEXVIEW_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS: one or more texture views are not referenced by by texture-sampler-pairs (sg_shader_desc.texture_sampler_pairs[].view_slot)",
    "VALIDATE_SHADERDESC_SAMPLER_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS: one or more samplers are not referenced by texture-sampler-pairs (sg_shader_desc.texture_sampler_pairs[].sampler_slot)",
    "VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG: vertex attribute name/semantic string too long (max len 16)",
    "VALIDATE_PIPELINEDESC_CANARY: sg_pipeline_desc not initialized",
    "VALIDATE_PIPELINEDESC_SHADER: sg_pipeline_desc.shader missing or invalid",
    "VALIDATE_PIPELINEDESC_COMPUTE_SHADER_EXPECTED: sg_pipeline_desc.shader must be a compute shader",
    "VALIDATE_PIPELINEDESC_NO_COMPUTE_SHADER_EXPECTED: sg_pipeline_desc.compute is false, but shader is a compute shader",
    "VALIDATE_PIPELINEDESC_NO_CONT_ATTRS: sg_pipeline_desc.layout.attrs is not continuous",
    "VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH: sg_pipeline_desc.layout.attrs[].format is incompatible with sg_shader_desc.attrs[].base_type",
    "VALIDATE_PIPELINEDESC_ATTR_VERTEXFORMAT_INT10_N2_NOT_SUPPORTED: sg_pipeline_desc.layout.attrs[].format: SG_VERTEXFORMAT_INT10_N2 not supported on this platform",
    "VALIDATE_PIPELINEDESC_LAYOUT_STRIDE4: sg_pipeline_desc.layout.buffers[].stride must be multiple of 4",
    "VALIDATE_PIPELINEDESC_ATTR_SEMANTICS: D3D11 missing vertex attribute semantics in shader",
    "VALIDATE_PIPELINEDESC_SHADER_READONLY_STORAGEBUFFERS: sg_pipeline_desc.shader: read/write storage buffer bindings are not allowed in vertex shaders",
    "VALIDATE_PIPELINEDESC_SHADER_HLSL_REGISTER_U_VS_COLOR_COUNT: sg_pipeline_desc.shader: on D3D11, fragment stage read/write storage buffer UAV register slots (register(uN)) must not overlap with the color attachment slots, i.e. N must be >= sg_pipeline_desc.color_count",
    "VALIDATE_PIPELINEDESC_SHADER_HLSL_REGISTER_U_LIMIT: sg_pipeline_desc.shader: on D3D11, fragment stage read/write storage buffer UAV register slots (register(uN)) must be < sg_limits.d3d11_max_unordered_access_views",
    "VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE: SG_BLENDOP_MIN/MAX requires all blend factors to be SG_BLENDFACTOR_ONE",
    "VALIDATE_PIPELINEDESC_DUAL_SOURCE_BLENDING_NOT_SUPPORTED: dual source blending not supported (sg_features.dual_source_blending)",
    "VALIDATE_PIPELINEDESC_DEPTH_FORMAT_NONE_BUT_DEPTH_WRITE_ENABLED: sg_pipeline_desc.depth.write_enabled cannot be true when sg_pipeline_desc.depth.pixel_format is SG_PIXELFORMAT_NONE",
    "VALIDATE_PIPELINEDESC_DEPTH_FORMAT_NONE_COMPARE_FUNC_MISMATCH: sg_pipeline_desc.depth.compare must be SG_COMPAREFUNC_ALWAYS or SG_COMPAREFUNC_NEVER when sg_pipeline_desc.pixel_format is SG_PIXELFORMAT_NONE",
    "VALIDATE_PIPELINEDESC_COLOR_COUNT: sg_pipeline_desc.color_count is out of range (must be >= 0 and <= SG_MAX_COLOR_ATTACHMENTS)",
    "VALIDATE_VIEWDESC_CANARY: sg_view_desc not initialized",
    "VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE: sg_view_desc: only one view type can be active",
    "VALIDATE_VIEWDESC_ANY_VIEWTYPE: sg_view_desc: exactly one view type must be active",
    "VALIDATE_VIEWDESC_RESOURCE_ALIVE: sg_view_desc: resource object is no longer alive (.buffer or .image)",
    "VALIDATE_VIEWDESC_RESOURCE_VALID: sg_view_desc: resource object must be in valid state (.buffer or .image)",
    "VALIDATE_VIEWDESC_IMAGE_VALID_UNSEALED: sg_view_desc: texture view image must be in valid or unsealed state",
    "VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_VS_BUFFER_SIZE: sg_view_desc.storage_buffer.offset is >= buffer size",
    "VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_MULTIPLE_256: sg_view_desc.storage_buffer.offset must be a multiple of 256",
    "VALIDATE_VIEWDESC_STORAGEBUFFER_USAGE: sg_view_desc.storage_buffer.buffer must have been created with sg_buffer_desc.usage.storage_buffer = true",
    "VALIDATE_VIEWDESC_STORAGEIMAGE_USAGE: sg_view_desc.storage_image.image must have been created with sg_image_desc.usage.storage_image = true",
    "VALIDATE_VIEWDESC_COLORATTACHMENT_USAGE: sg_view_desc.color_attachment.image must have been created with sg_image_desc.usage.color_attachment = true",
    "VALIDATE_VIEWDESC_RESOLVEATTACHMENT_USAGE: sg_view_desc.resolve_attachment.image must have been created with sg_image_desc.usage.resolve_attachment = true",
    "VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_USAGE: sg_view_desc.depth_stencil_attachment.image must have been created with sg_image_desc.usage.depth_stencil_attachment = true",
    "VALIDATE_VIEWDESC_IMAGE_MIPLEVEL: sg_view_desc: image/attachment view mip level is out of range (must be >=0 and <image.num_mipmaps)",
    "VALIDATE_VIEWDESC_IMAGE_2D_SLICE: sg_view_desc: image/attachment view slice is out of range for 2D image (must be 0)",
    "VALIDATE_VIEWDESC_IMAGE_CUBEMAP_SLICE: sg_view_desc: image/attachment view slice is out of range for cubemap image (must be >=0 and <6)",
    "VALIDATE_VIEWDESC_IMAGE_ARRAY_SLICE: sg_view_desc: image/attachment view slice is out of range for 2D array image (must be >=0 and <image.num_slices",
    "VALIDATE_VIEWDESC_IMAGE_3D_SLICE: sg_view_desc: image/attachment view slice is out of range for 3D image (must be 0)",
    "VALIDATE_VIEWDESC_TEXTURE_EXPECT_NO_MSAA: sg_view_desc: MSAA texture bindings not allowed on this backend (sg_features.msaa_texture_bindings)",
    "VALIDATE_VIEWDESC_TEXTURE_MIPLEVELS: sg_view_desc: texture view mip levels are out of range (must be >=0 and <image.num_mipmaps)",
    "VALIDATE_VIEWDESC_TEXTURE_2D_SLICES: sg_view_desc: texture view slices are out of range for 2D image (must be 0)",
    "VALIDATE_VIEWDESC_TEXTURE_CUBEMAP_SLICES: sg_view_desc: texture view slices are out of range for cubemap image (must be 0)",
    "VALIDATE_VIEWDESC_TEXTURE_ARRAY_SLICES: sg_view_desc: texture view slices are out of range for 2D array image (must be >=0 and <image.num_slices",
    "VALIDATE_VIEWDESC_TEXTURE_3D_SLICES: sg_view_desc: texture view slices are out of range for 3D image (must be 0)",
    "VALIDATE_VIEWDESC_STORAGEIMAGE_PIXELFORMAT: sg_view_desc.storage_image_binding: image pixel format must be GPU readable or writable (sg_pixelformat_info.read/write)",
    "VALIDATE_VIEWDESC_COLORATTACHMENT_PIXELFORMAT: sg_view_desc.color_attachment: pixel format of image must be renderable (sg_pixelformat_info.render)",
    "VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_PIXELFORMAT: sg_view_desc.depth_stencil_attachment: pixel format of image must be a depth or depth-stencil format (sg_pixelformat_info.depth)",
    "VALIDATE_VIEWDESC_RESOLVEATTACHMENT_SAMPLECOUNT: sg_view_desc.resolve_attachment: image cannot be multisampled",
    "VALIDATE_BEGINPASS_CANARY: sg_begin_pass: pass struct not initialized",
    "VALIDATE_BEGINPASS_COMPUTEPASS_EXPECT_NO_ATTACHMENTS: sg_begin_pass: compute passes cannot have attachments",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH: sg_begin_pass: expected pass.swapchain.width > 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH_NOTSET: sg_begin_pass: expected pass.swapchain.width == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT: sg_begin_pass: expected pass.swapchain.height > 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT_NOTSET: sg_begin_pass: expected pass.swapchain.height == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT: sg_begin_pass: expected pass.swapchain.sample_count > 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT_NOTSET: sg_begin_pass: expected pass.swapchain.sample_count == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT: sg_begin_pass: expected pass.swapchain.color_format to be valid",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT_NOTSET: sg_begin_pass: expected pass.swapchain.color_format to be unset",
    "VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_DEPTHFORMAT_NOTSET: sg_begin_pass: expected pass.swapchain.depth_format to be unset",
    "VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE: sg_begin_pass: expected pass.swapchain.metal.current_drawable != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE_NOTSET: sg_begin_pass: expected pass.swapchain.metal.current_drawable == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE: sg_begin_pass: expected pass.swapchain.metal.depth_stencil_texture != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE_NOTSET: sg_begin_pass: expected pass.swapchain.metal.depth_stencil_texture == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE: sg_begin_pass: expected pass.swapchain.metal.msaa_color_texture != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE_NOTSET: sg_begin_pass: expected pass.swapchain.metal.msaa_color_texture == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW: sg_begin_pass: expected pass.swapchain.d3d11.render_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.d3d11.render_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW: sg_begin_pass: expected pass.swapchain.d3d11.resolve_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.d3d11.resolve_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW: sg_begin_pass: expected pass.swapchain.d3d11.depth_stencil_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.d3d11.depth_stencil_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW: sg_begin_pass: expected pass.swapchain.wgpu.render_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.wgpu.render_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW: sg_begin_pass: expected pass.swapchain.wgpu.resolve_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.wgpu.resolve_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW: sg_begin_pass: expected pass.swapchain.wgpu.depth_stencil_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.wgpu.depth_stencil_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_GL_EXPECT_FRAMEBUFFER_NOTSET: sg_begin_pass: expected pass.swapchain.gl.framebuffer == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERIMAGE: sg_begin_pass: expected pass.swapchain.vk.render_image != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERIMAGE_NOTSET: sg_begin_pass: expected pass.swapchain.vk.render_image == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERVIEW: sg_begin_pass: expected pass.swapchain.vk.render_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.vk.render_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_DEPTHSTENCILIMAGE: sg_begin_pass: expected pass.swapchain.vk.depth_stencil_image != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_DEPTHSTENCILIMAGE_NOTSET: sg_begin_pass: expected pass.swapchain.vk.depth_stencil_image == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_DEPTHSTENCILVIEW: sg_begin_pass: expected pass.swapchain.vk.depth_stencil_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_DEPTHSTENCILVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.vk.depth_stencil_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RESOLVEIMAGE: sg_begin_pass: expected pass.swapchain.vk.resolve_image != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RESOLVEIMAGE_NOTSET: sg_begin_pass: expected pass.swapchain.vk.resolve_image == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RESOLVEVIEW: sg_begin_pass: expected pass.swapchain.vk.resolve_view != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RESOLVEVIEW_NOTSET: sg_begin_pass: expected pass.swapchain.vk.resolve_view == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERFINISHEDSEMAPHORE: sg_begin_pass: expected pass.swapchain.vk.render_finished_semaphore != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_RENDERFINISHEDSEMAPHORE_NOTSET: sg_begin_pass: expected pass.swapchain.vk.render_finished_semaphore == 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_PRESENTCOMPLETESEMAPHORE: sg_begin_pass: expected pass.swapchain.vk.present_complete_semaphore != 0",
    "VALIDATE_BEGINPASS_SWAPCHAIN_VULKAN_EXPECT_PRESENTCOMPLETESEMAPHORE_NOTSET: sg_begin_pass: expected pass.swapchain.vk.present_complete_semaphore == 0",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEWS_CONTINUOUS: sg_begin_pass: color attachment view array must be continuous",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_ALIVE: sg_begin_pass: color attachment view no longer alive",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_VALID: sg_begin_pass: color attachment view not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_TYPE: sg_begin_pass: color attachment view has wrong type (must be sg_view_desc.color_attachment)",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_ALIVE: sg_begin_pass: color attachment view's image object is uninitialized or no longer alive",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_VALID: sg_begin_pass: color attachment view's image is not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SIZES: sg_begin_pass: all color attachments must have the same width and height",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNT: sg_begin_pass: when resolve attachments are provided, the color attachment sample count must be > 1",
    "VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNTS_EQUAL: sg_begin_pass: all color attachments must have the same sample count",
    "VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_NO_COLORATTACHMENTVIEW: sg_begin_pass: a resolve attachment view must have an associated color attachment view at the same index",
    "VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_ALIVE: sg_begin_pass: resolve attachment view no longer alive",
    "VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_VALID: sg_begin_pass: resolve attachment view not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_TYPE: sg_begin_pass: resolve attachment view has wrong type (must be sg_view_desc.resolve_attachment)",
    "VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_ALIVE: sg_begin_pass: resolve attachment view's image object is uninitialized or no longer alive",
    "VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_VALID: sg_begin_pass: resolve attachment view's image is not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_SIZES: sg_begin_pass: all attachments must have the same width and height",
    "VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEWS_CONTINUOUS: sg_begin_pass: color attachment view array must be continuous",
    "VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_ALIVE: sg_begin_pass: depth-stencil attachment view no longer alive",
    "VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_VALID: sg_begin_pass: depth-stencil attachment view not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_TYPE: sg_begin_pass: depth-stencil attachment view has wrong type (must be sg_view_desc.depth_stencil_attachment)",
    "VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_ALIVE: sg_begin_pass: depth-stencil attachment view's image object is uninitialized or no longer alive",
    "VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_VALID: sg_begin_pass: depth-stencil attachment view's image is not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SIZES: sg_begin_pass: attachments must have the same width and height",
    "VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SAMPLECOUNT: sg_begin_pass: all color attachments must have the same sample count",
    "VALIDATE_BEGINPASS_ATTACHMENTS_EXPECTED: sg_begin_pass: offscreen render passes must have at least one color- or depth-stencil attachment",
    "VALIDATE_AVP_RENDERPASS_EXPECTED: sg_apply_viewport: must be called in a render pass",
    "VALIDATE_ASR_RENDERPASS_EXPECTED: sg_apply_scissor_rect: must be called in a render pass",
    "VALIDATE_APIP_PIPELINE_VALID_ID: sg_apply_pipeline: invalid pipeline id provided",
    "VALIDATE_APIP_PIPELINE_EXISTS: sg_apply_pipeline: pipeline object no longer alive",
    "VALIDATE_APIP_PIPELINE_VALID: sg_apply_pipeline: pipeline object not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_APIP_PASS_EXPECTED: sg_apply_pipeline: must be called in a pass",
    "VALIDATE_APIP_PIPELINE_SHADER_ALIVE: sg_apply_pipeline: shader object associated with pipeline no longer alive",
    "VALIDATE_APIP_PIPELINE_SHADER_VALID: sg_apply_pipeline: shader object associated with pipeline not in valid state",
    "VALIDATE_APIP_COMPUTEPASS_EXPECTED: sg_apply_pipeline: trying to apply compute pipeline in render pass",
    "VALIDATE_APIP_RENDERPASS_EXPECTED: sg_apply_pipeline: trying to apply render pipeline in compute pass",
    "VALIDATE_APIP_SWAPCHAIN_COLOR_COUNT: sg_apply_pipeline: the pipeline .color_count must be 1 in swapchain render passes",
    "VALIDATE_APIP_SWAPCHAIN_COLOR_FORMAT: sg_apply_pipeline: the pipeline .colors[0].pixel_format doesn't match the sg_pass.swapchain.color_format",
    "VALIDATE_APIP_SWAPCHAIN_DEPTH_FORMAT: sg_apply_pipeline: the pipeline .depth.pixel_format doesn't match the sg_pass.swapchain.depth_format",
    "VALIDATE_APIP_SWAPCHAIN_SAMPLE_COUNT: sg_apply_pipeline: the pipeline .sample_count doesn't match the sg_pass.swapchain.sample_count",
    "VALIDATE_APIP_ATTACHMENTS_ALIVE: sg_apply_pipeline: at least one pass attachment view or base image object is no longer alive",
    "VALIDATE_APIP_COLORATTACHMENTS_COUNT: sg_apply_pipeline: the pipeline .color_count doesn't match the number of render pass color attachments",
    "VALIDATE_APIP_COLORATTACHMENTS_VIEW_VALID: sg_apply_pipeline: a pass color attachment view is not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_APIP_COLORATTACHMENTS_IMAGE_VALID: sg_apply_pipeline: a pass color attachment view's image object is not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_APIP_COLORATTACHMENTS_FORMAT: sg_apply_pipeline: a pipeline .colors[n].pixel_format doesn't match sg_pass.attachments.colors[n] image pixel format",
    "VALIDATE_APIP_DEPTHSTENCILATTACHMENT_VIEW_VALID: sg_apply_pipeline: the pass depth-stencil attachment view is not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_APIP_DEPTHSTENCILATTACHMENT_IMAGE_VALID: sg_apply_pipeline: the pass depth-stencil attachment view's image object is not in valid state (SG_RESOURCESTATE_VALID)",
    "VALIDATE_APIP_DEPTHSTENCILATTACHMENT_FORMAT: sg_apply_pipeline: pipeline .depth.pixel_format doesn't match sg_pass.attachments.depth_stencil image pixel format",
    "VALIDATE_APIP_ATTACHMENT_SAMPLE_COUNT: sg_apply_pipeline: pipeline MSAA sample count doesn't match pass attachment sample count",
    "VALIDATE_ABND_PASS_EXPECTED: sg_apply_bindings: must be called in a pass",
    "VALIDATE_ABND_EMPTY_BINDINGS: sg_apply_bindings: the provided sg_bindings struct is empty",
    "VALIDATE_ABND_NO_PIPELINE: sg_apply_bindings: must be called after sg_apply_pipeline",
    "VALIDATE_ABND_PIPELINE_ALIVE: sg_apply_bindings: currently applied pipeline object no longer alive",
    "VALIDATE_ABND_PIPELINE_VALID: sg_apply_bindings: currently applied pipeline object not in valid state",
    "VALIDATE_ABND_PIPELINE_SHADER_ALIVE: sg_apply_bindings: shader associated with currently applied pipeline is no longer alive",
    "VALIDATE_ABND_PIPELINE_SHADER_VALID: sg_apply_bindings: shader associated with currently applied pipeline is not in valid state",
    "VALIDATE_ABND_COMPUTE_EXPECTED_NO_VBUFS: sg_apply_bindings: vertex buffer bindings not allowed in a compute pass",
    "VALIDATE_ABND_COMPUTE_EXPECTED_NO_IBUF: sg_apply_bindings: index buffer binding not allowed in compute pass",
    "VALIDATE_ABND_EXPECTED_VBUF: sg_apply_bindings: vertex buffer binding is missing or buffer handle is invalid",
    "VALIDATE_ABND_VBUF_ALIVE: sg_apply_bindings: vertex buffer no longer alive",
    "VALIDATE_ABND_VBUF_USAGE: sg_apply_bindings: buffer in vertex buffer bind slot must have usage.vertex_buffer",
    "VALIDATE_ABND_VBUF_VS_SBVIEW_READWRITE: sg_apply_bindings: same buffer cannot be bound as vertex buffer and read/write storage buffer in one render pass",
    "VALIDATE_ABND_EXPECTED_NO_IBUF: sg_apply_bindings: pipeline object defines non-indexed rendering, but index buffer binding provided",
    "VALIDATE_ABND_EXPECTED_IBUF: sg_apply_bindings: pipeline object defines indexed rendering, but no index buffer binding provided",
    "VALIDATE_ABND_IBUF_ALIVE: sg_apply_bindings: index buffer no longer alive",
    "VALIDATE_ABND_IBUF_USAGE: sg_apply_bindings: buffer in index buffer bind slot must have usage.index_buffer",
    "VALIDATE_ABND_IBUF_VS_SBVIEW_READWRITE: sg_apply_bindings: same buffer cannot be bound as index buffer and read/write storage buffer in one render pass",
    "VALIDATE_ABND_EXPECTED_VIEW_BINDING: sg_apply_bindings: view binding is missing or the view handle is invalid",
    "VALIDATE_ABND_VIEW_ALIVE: sg_apply_bindings: view no longer alive",
    "VALIDATE_ABND_EXPECT_TEXVIEW: sg_apply_bindings: view type mismatch in bindslot (shader expects a texture view)",
    "VALIDATE_ABND_EXPECT_SBVIEW: sg_apply_bindings: view type mismatch in bindslot (shader expects a storage buffer view)",
    "VALIDATE_ABND_SBVIEW_READWRITE_VS_WRITETRANSIENT: sg_apply_bindings: a storage buffer bound as read/write cannot have usage.write_transient",
    "VALIDATE_ABND_SBVIEW_READONLY_VS_READWRITE: sg_apply_bindings: same buffer cannot be bound as readonly and read/write storage buffer in one render pass",
    "VALIDATE_ABND_SBVIEW_READWRITE_VS_READ: sg_apply_bindings: same buffer cannot be bound as read/write storage buffer and vertex, index or readonly storage buffer in one render pass",
    "VALIDATE_ABND_EXPECT_SIMGVIEW: sg_apply_bindings: view type mismatch in bindslot (shader expects a storage image view)",
    "VALIDATE_ABND_TEXVIEW_IMAGETYPE_MISMATCH: sg_apply_bindings: image type of bound texture doesn't match shader desc",
    "VALIDATE_ABND_TEXVIEW_EXPECTED_MULTISAMPLED_IMAGE: sg_apply_bindings: texture bindings expects image with sample_count > 1",
    "VALIDATE_ABND_TEXVIEW_EXPECTED_NON_MULTISAMPLED_IMAGE: sg_apply_bindings: texture bindings expects image with sample_count == 1",
    "VALIDATE_ABND_TEXVIEW_EXPECTED_FILTERABLE_IMAGE: sg_apply_bindings: filterable image expected",
    "VALIDATE_ABND_TEXVIEW_EXPECTED_DEPTH_IMAGE: sg_apply_bindings: depth image expected",
    "VALIDATE_ABND_SIMGVIEW_COMPUTE_PASS_EXPECTED: sg_apply_bindings: storage image bindings can only appear on compute passes",
    "VALIDATE_ABND_SIMGVIEW_IMAGETYPE_MISMATCH: sg_apply_bindings: image type of bound storage image doesn't match shader desc",
    "VALIDATE_ABND_SIMGVIEW_ACCESSFORMAT: sg_apply_bindings: pixel format of storage image view doesn't match access format in shader desc",
    "VALIDATE_ABND_EXPECTED_SAMPLER_BINDING: sg_apply_bindings: sampler binding is missing or the sampler handle is invalid",
    "VALIDATE_ABND_UNEXPECTED_SAMPLER_COMPARE_NEVER: sg_apply_bindings: shader expects SG_SAMPLERTYPE_COMPARISON but sampler has SG_COMPAREFUNC_NEVER",
    "VALIDATE_ABND_EXPECTED_SAMPLER_COMPARE_NEVER: sg_apply_bindings: shader expects SG_SAMPLERTYPE_FILTERING or SG_SAMPLERTYPE_NONFILTERING but sampler doesn't have SG_COMPAREFUNC_NEVER",
    "VALIDATE_ABND_EXPECTED_NONFILTERING_SAMPLER: sg_apply_bindings: shader expected SG_SAMPLERTYPE_NONFILTERING, but sampler has SG_FILTER_LINEAR filters",
    "VALIDATE_ABND_SAMPLER_ALIVE: sg_apply_bindings: bound sampler no longer alive",
    "VALIDATE_ABND_SAMPLER_VALID: sg_apply_bindings: bound sampler not in valid state",
    "VALIDATE_ABND_TEXTURE_BINDING_VS_DEPTHSTENCIL_ATTACHMENT: sg_apply_bindings: cannot bind texture in the same pass it is used as depth-stencil attachment",
    "VALIDATE_ABND_TEXTURE_BINDING_VS_COLOR_ATTACHMENT: sg_apply_bindings: cannot bind texture in the same pass it is used as color attachment",
    "VALIDATE_ABND_TEXTURE_BINDING_VS_RESOLVE_ATTACHMENT: sg_apply_bindings: cannot bind texture in the same pass it is used as resolve attachment",
    "VALIDATE_ABND_TEXTURE_VS_STORAGEIMAGE_BINDING: sg_apply_bindings: an image cannot be bound as a texture and storage image at the same time",
    "VALIDATE_AU_PASS_EXPECTED: sg_apply_uniforms: must be called in a pass",
    "VALIDATE_AU_NO_PIPELINE: sg_apply_uniforms: must be called after sg_apply_pipeline()",
    "VALIDATE_AU_PIPELINE_ALIVE: sg_apply_uniforms: currently applied pipeline object no longer alive",
    "VALIDATE_AU_PIPELINE_VALID: sg_apply_uniforms: currently applied pipeline object not in valid state",
    "VALIDATE_AU_PIPELINE_SHADER_ALIVE: sg_apply_uniforms: shader associated with currently applied pipeline is no longer alive",
    "VALIDATE_AU_PIPELINE_SHADER_VALID: sg_apply_uniforms: shader associated with currently applied pipeline is not in valid state",
    "VALIDATE_AU_NO_UNIFORMBLOCK_AT_SLOT: sg_apply_uniforms: no uniform block declaration at this shader stage UB slot",
    "VALIDATE_AU_SIZE: sg_apply_uniforms: data size doesn't match declared uniform block size",
    "VALIDATE_DRAW_RENDERPASS_EXPECTED: sg_draw: must be called in a render pass",
    "VALIDATE_DRAW_BASEELEMENT_GE_ZERO: sg_draw: base_element cannot be < 0",
    "VALIDATE_DRAW_NUMELEMENTS_GE_ZERO: sg_draw: num_elements cannot be < 0",
    "VALIDATE_DRAW_NUMINSTANCES_GE_ZERO: sg_draw: num_instances cannot be < 0",
    "VALIDATE_DRAW_EX_RENDERPASS_EXPECTED: sg_draw: must be called in a render pass",
    "VALIDATE_DRAW_EX_BASEELEMENT_GE_ZERO: sg_draw_ex: base_element cannot be < 0",
    "VALIDATE_DRAW_EX_NUMELEMENTS_GE_ZERO: sg_draw_ex: num_elements cannot be < 0",
    "VALIDATE_DRAW_EX_NUMINSTANCES_GE_ZERO: sg_draw_ex: num_instances cannot be < 0",
    "VALIDATE_DRAW_EX_BASEINSTANCE_GE_ZERO: sg_draw_ex: base_instance cannot be < 0",
    "VALIDATE_DRAW_EX_BASEVERTEX_VS_INDEXED: sg_draw_ex(): base_vertex must be == 0 for non-indexed rendering",
    "VALIDATE_DRAW_EX_BASEINSTANCE_VS_INSTANCED: sg_draw_ex(): base_instance must be == 0 for non-instanced rendering",
    "VALIDATE_DRAW_EX_BASEVERTEX_NOT_SUPPORTED: sg_draw_ex(): base_vertex != 0 not supported on this backend (sg_features.draw_base_vertex)",
    "VALIDATE_DRAW_EX_BASEINSTANCE_NOT_SUPPORTED: sg_draw_ex(): base_instance > 0 not supported on this backend (sg_features.draw_base_instance)",
    "VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING: sg_draw: call to sg_apply_bindings() and/or sg_apply_uniforms() missing after sg_apply_pipeline()",
    "VALIDATE_DRAW_WRITE_BUFFER_TRANSIENT_MISSING: sg_draw: a bound usage.write_transient buffer hasn't been written this frame (missing sg_write_buffer_transient call)",
    "VALIDATE_DRAW_WRITE_IMAGE_TRANSIENT_MISSING: sg_draw: a bound usage.write_transient image hasn't been written this frame (missing sg_write_image_transient call)",
    "VALIDATE_DISPATCH_COMPUTEPASS_EXPECTED: sg_dispatch: must be called in a compute pass",
    "VALIDATE_DISPATCH_NUMGROUPSX: sg_dispatch: num_groups_x must be >=0 and <65536",
    "VALIDATE_DISPATCH_NUMGROUPSY: sg_dispatch: num_groups_y must be >=0 and <65536",
    "VALIDATE_DISPATCH_NUMGROUPSZ: sg_dispatch: num_groups_z must be >=0 and <65536",
    "VALIDATE_DISPATCH_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING: sg_dispatch: call to sg_apply_bindings() and/or sg_apply_uniforms() missing after sg_apply_pipeline()",
    "VALIDATE_DISPATCH_WRITE_BUFFER_TRANSIENT_MISSING: sg_dispatch: a bound usage.write_transient buffer hasn't been written this frame (missing sg_write_buffer_transient call)",
    "VALIDATE_DISPATCH_WRITE_IMAGE_TRANSIENT_MISSING: sg_dispatch: a bound usage.write_transient image hasn't been written this frame (missing sg_write_image_transient call)",
    "VALIDATE_WRITEBUFFERUNSEALED_USAGE: sg_write_buffer_unsealed: buffer usage must be .write_unsealed",
    "VALIDATE_WRITEBUFFERTRANSIENT_USAGE: sg_write_buffer_transient: buffer usage must be .write_transient",
    "VALIDATE_WRITEBUFFERTRANSIENT_WRITE_BEFORE_BIND: sg_write_buffer_transient: cannot be called after buffer has already been bound in this frame",
    "VALIDATE_WRITEBUFFERTRANSIENT_WRITE_BEFORE_COPY: sg_write_buffer_transient: cannot be called after buffer has been copied from",
    "VALIDATE_WRITEBUFFERTRANSIENT_DST_OFFSET_ALIGNMENT: sg_write_buffer_transient: dst.offset must be a multiple of 4",
    "VALIDATE_WRITEBUFFER_SRC_DATA_POINTER: sg_write_buffer_*: desc.src.data.ptr must be valid",
    "VALIDATE_WRITEBUFFER_SRC_DATA_SIZE: sg_write_buffer_*: desc.src.data.size must be > 0",
    "VALIDATE_WRITEBUFFER_SIZE: sg_write_buffer_*: desc.size must be > 0 and <= desc.src.data.size",
    "VALIDATE_WRITEBUFFER_WRITE_OVERFLOW: sg_write_buffer_*: desc.dst.offset + desc.size must be <= buffer size",
    "VALIDATE_WRITEBUFFER_READ_OVERFLOW: sg_write_buffer_*: desc.src.offset + desc.size must be <= desc.src.data.size",
    "VALIDATE_WRITEIMAGEUNSEALED_USAGE: sg_write_image_unsealed: image usage must be .immutable && .write_unsealed",
    "VALIDATE_WRITEIMAGETRANSIENT_USAGE: sg_write_image_transient: image usage must be !.immutable && .write_transient",
    "VALIDATE_WRITEIMAGETRANSIENT_WRITE_BEFORE_BIND: sg_write_image_transient: cannot be called after image has already been bound in this frame",
    "VALIDATE_WRITEIMAGE_SRC_DATA_POINTER: sg_write_image_*: desc.src.data.ptr must be valid",
    "VALIDATE_WRITEIMAGE_SRC_DATA_SIZE: sg_write_image_*: desc.src.data.size must be > 0",
    "VALIDATE_WRITEIMAGE_BYTESPERROW: sg_write_image_*: desc.src.bytes_per_row must be a multiple of the pixel or compression-block size",
    "VALIDATE_WRITEIMAGE_BYTESPERSLICE: sg_write_image_*: desc.src.bytes_per_slice must be a multiple of desc.src.bytes_per_row",
    "VALIDATE_WRITEIMAGE_BYTESPERROW_TOO_SMALL: sg_write_image_*: desc.src.bytes_per_row is smaller than required by desc.size.width",
    "VALIDATE_WRITEIMAGE_BYTESPERSLICE_TOO_SMALL: sg_write_image_*: desc.src.bytes_per_slice is smaller than required by desc.size.width and .height",
    "VALIDATE_WRITEIMAGE_MIPLEVEL: sg_write_image_*: desc.dst.mip_level must be >= 0 and less than the number of mipmaps in the destination image",
    "VALIDATE_WRITEIMAGE_WIDTH: sg_write_image_*: desc.size.width must be > 0 and <= destination image width",
    "VALIDATE_WRITEIMAGE_HEIGHT: sg_write_image_*: desc.size.height must be > 0 and <= destination image height",
    "VALIDATE_WRITEIMAGE_NUMSLICES: sg_write_image_*: desc.size.num_slices must be > 0 and <= destination image num slices",
    "VALIDATE_WRITEIMAGE_READ_OVERFLOW: sg_write_image_*: desc.src.offset + size of written data must be <= desc.src.data.size",
    "VALIDATE_WRITEIMAGE_DST_X_RANGE: sg_write_image_*: desc.dst.x must be >= 0 and < miplevel width",
    "VALIDATE_WRITEIMAGE_DST_Y_RANGE: sg_write_image_*: desc.dst.y must be >= 0 and < miplevel height",
    "VALIDATE_WRITEIMAGE_DST_SLICE_RANGE: sg_write_image_*: desc.dst.slice must be >= 0 and < miplevel depth or array/cubemap slices",
    "VALIDATE_WRITEIMAGE_WRITE_WIDTH_OVERFLOW: sg_write_image_*: desc.dst.x + desc.size.width must be <= destination mip level width",
    "VALIDATE_WRITEIMAGE_WRITE_HEIGHT_OVERFLOW: sg_write_image_*: desc.dst.y + desc.size.height must be <= destination mip level height",
    "VALIDATE_WRITEIMAGE_WRITE_NUMSLICES_OVERFLOW: sg_write_image_*: desc.dst.slice + desc.size.num_slices must be <= destination number of slices in mip level",
    "VALIDATE_WRITEIMAGE_DST_X_ALIGNMENT: sg_write_image_*: desc.dst.x must be a multiple of 4 for compressed pixel formats",
    "VALIDATE_WRITEIMAGE_DST_Y_ALIGNMENT: sg_write_image_*: desc.dst.y must be a multiple of 4 for compressed pixel formats",
    "VALIDATE_WRITEIMAGE_WIDTH_MULTIPLE: sg_write_image_*: for compressed pixel formats, desc.size.width must be a multiple of 4, or desc.dst.x + desc.size.width must be equal to the miplevel width",
    "VALIDATE_WRITEIMAGE_HEIGHT_MULTIPLE: sg_write_image_*: for compressed pixel formats, desc.size.height must be a multiple of 4, or desc.dst.y + desc.size.height must be equal to the miplevel height",
    "VALIDATE_SEALBUFFER_RESOURCESTATE: sg_seal_buffer: buffer resource state must be SG_RESOURCESTATE_UNSEALED",
    "VALIDATE_SEALIMAGE_RESOURCESTATE: sg_seal_image: image resource state must be SG_RESOURCESTATE_UNSEALED",
    "VALIDATE_COPYBUFFERTOBUFFER_INSIDE_PASS: sg_copy_buffer_to_buffer: must not be called inside a pass",
    "VALIDATE_COPYBUFFERTOBUFFER_SRC_VS_DST_BUFFER: sg_copy_buffer_to_buffer: src and dst buffer cannot be the same",
    "VALIDATE_COPYBUFFERTOBUFFER_COPY_SRC: sg_copy_buffer_to_buffer: source buffer must have .copy_src usage",
    "VALIDATE_COPYBUFFERTOBUFFER_COPY_DST: sg_copy_buffer_to_buffer: destination buffer must have .copy_dst usage",
    "VALIDATE_COPYBUFFERTOBUFFER_ZERO_SIZE: sg_copy_buffer_to_buffer: desc.size must be > 0",
    "VALIDATE_COPYBUFFERTOBUFFER_SRC_OFFSET_ALIGNMENT: sg_copy_buffer_to_buffer: desc.src.offset must be a multiple of 4",
    "VALIDATE_COPYBUFFERTOBUFFER_DST_OFFSET_ALIGNMENT: sg_copy_buffer_to_buffer: desc.dst.offset must be a multiple of 4",
    "VALIDATE_COPYBUFFERTOBUFFER_SRC_OVERFLOW: sg_copy_buffer_to_buffer: (desc.src.offset + desc.size) is greater than desc.src.buffer size",
    "VALIDATE_COPYBUFFERTOBUFFER_DST_OVERFLOW: sg_copy_buffer_to_buffer: (desc.dst.offset + desc.size) is greater than desc.dst.buffer size",
    "VALIDATE_COPYBUFFERTOBUFFER_WEBGL2_INDEX_BUFFER: sg_copy_buffer_to_buffer: on webgl2, src and dst buffer must both be index buffers or both be non-index buffers (usage.staging_index_buffer counts as index buffer)",
    "VALIDATE_COPYBUFFERTOIMAGE_WEBGL2_INDEX_BUFFER: sg_copy_buffer_to_image: on webgl2, source buffer cannot have usage.index_buffer",
    "VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_TOO_SMALL: sg_copy_buffer_to_image: desc.src.bytes_per_row is smaller than required by desc.size.width",
    "VALIDATE_COPYBUFFERTOIMAGE_BYTESPERSLICE_TOO_SMALL: sg_copy_buffer_to_image: desc.src.bytes_per_slice is smaller than required by desc.size.width and .height",
    "VALIDATE_COPYBUFFERTOIMAGE_SRC_STAGING_INDEX_BUFFER: sg_copy_buffer_to_image: source buffer cannot have .staging_index_buffer usage",
    "VALIDATE_COPYBUFFERTOIMAGE_SRC_STAGING_BUFFER: sg_copy_buffer_to_image: on d3d11, source buffer must have .staging_buffer usage (sg_features.copy_buffer_to_image_relaxed_buffer_type is false)",
    "VALIDATE_COPYBUFFERTOIMAGE_INSIDE_PASS: sg_copy_buffer_to_image: must not be called inside a pass",
    "VALIDATE_COPYBUFFERTOIMAGE_COPY_SRC: sg_copy_buffer_to_image: source buffer must have .copy_src usage",
    "VALIDATE_COPYBUFFERTOIMAGE_COPY_DST: sg_copy_buffer_to_image: destination image must have .copy_dst usage",
    "VALIDATE_COPYBUFFERTOIMAGE_SRC_OFFSET_ALIGNMENT: sg_copy_buffer_to_image: desc.src.offset must be a multiple of the dst image pixel format block size",
    "VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_MULTIPLE_BLOCKSIZE: sg_copy_buffer_to_image: desc.src.bytes_per_row must be a multiple of the pixel or compression-block size",
    "VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_MULTIPLE_256: sg_copy_buffer_to_image: desc.src.bytes_per_row must be a multiple of 256 when copying from a non-staging buffer (sg_features.copy_buffer_to_image_relaxed_bytes_per_row is false)",
    "VALIDATE_COPYBUFFERTOIMAGE_BYTESPERSLICE: sg_copy_buffer_to_image: desc.src.bytes_per_slice must be a multiple of desc.src.bytes_per_row",
    "VALIDATE_COPYBUFFERTOIMAGE_SRC_OVERFLOW: sg_copy_buffer_to_image: copy operation may read past end of source buffer",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_MIPLEVEL: sg_copy_buffer_to_image: desc.dst.mip_level must be >= 0 and less than the number of mipmaps in the destination image",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH: sg_copy_buffer_to_image: desc.size.width must be > 0 and <= destination image width",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT: sg_copy_buffer_to_image: desc.size.height must be > 0 and <= destination image height",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH_MULTIPLE: sg_copy_buffer_to_image: for compressed pixel formats, desc.size.width must be a multiple of 4, or desc.dst.x + desc.size.width must be equal to the miplevel width",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT_MULTIPLE: sg_copy_buffer_to_image: for compressed pixel formats, desc.size.height must be a multiple of 4, or desc.dst.y + desc.size.height must be equal to the miplevel height",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_NUMSLICES: sg_copy_buffer_to_image: desc.size.num_slices must be > 0 and <= destination image num slices",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_X_RANGE: sg_copy_buffer_to_image: desc.dst.x must be >= 0 and < miplevel width",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_Y_RANGE: sg_copy_buffer_to_image: desc.dst.y must be >= 0 and < miplevel height",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_X_ALIGNMENT: sg_copy_buffer_to_image: desc.dst.x must be a multiple of 4 for compressed pixel formats",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_Y_ALIGNMENT: sg_copy_buffer_to_image: desc.dst.y must be a multiple of 4 for compressed pixel formats",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_SLICE_RANGE: sg_copy_buffer_to_image: desc.dst.slice must be >= 0 and < miplevel depth or array/cubemap slices",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH_OVERFLOW: sg_copy_buffer_to_image: desc.dst.x + desc.size.width must be <= destination mip level width",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT_OVERFLOW: sg_copy_buffer_to_image: desc.dst.y + desc.size.height must be <= destination mip level height",
    "VALIDATE_COPYBUFFERTOIMAGE_DST_NUMSLICES_OVERFLOW: sg_copy_buffer_to_image: desc.dst.slice + desc.size.num_slices must be <= destination number of slices in mip level",
    "VALIDATION_FAILED: validation layer checks failed",
};
}
}

private {
void _sg_log(sg_log_item log_item, u32 log_level, u8* msg, u32 line_nr) {
    if _sg.desc.logger.func != null {
        u8* filename = null;
        when defined(SOKOL_DEBUG) {
            filename = __file__;
            if null == msg {
                msg = _sg_log_messages[log_item];
            }
        }
        _sg.desc.logger.func("sg", log_level, cast(u32, log_item), msg, line_nr, filename, _sg.desc.logger.user_data);
    } else {
        if log_level == 0 {
            __sokol_abort();
        }
    }
}

i32 _sg_roundup_pow2(i32 val, i32 round_to) {
    return val + (round_to - 1) & ~(round_to - 1);
}

u32 _sg_roundup_pow2_u32(u32 val, u32 round_to) {
    return val + (round_to - 1) & ~(round_to - 1);
}

u64 _sg_roundup_pow2_u64(u64 val, u64 round_to) {
    return val + (round_to - 1) & ~(round_to - 1);
}

bool _sg_multiple(i32 val, i32 of) {
    assert(val >= 0);
    assert(of > 0);
    return val % of == 0;
}

bool _sg_multiple_u64(u64 val, u64 of) {
    assert(of > 0);
    return val % of == 0;
}

void _sg_clear(void* ptr, u64 size) {
    assert(ptr != null && size > 0);
    memset(ptr, 0, size);
}

void* _sg_malloc(u64 size) {
    assert(size > 0);
    void* ptr;
    if _sg.desc.allocator.alloc_fn != null {
        ptr = _sg.desc.allocator.alloc_fn(size, _sg.desc.allocator.user_data);
    } else {
        ptr = alloc(cast(i64, size));
    }
    if null == ptr {
        _sg_log(SG_LOGITEM_MALLOC_FAILED, 0, null, __line__);
    }
    return ptr;
}

void* _sg_malloc_clear(u64 size) {
    void* ptr = _sg_malloc(size);
    _sg_clear(ptr, size);
    return ptr;
}

void _sg_free(void* ptr) {
    if _sg.desc.allocator.free_fn != null {
        _sg.desc.allocator.free_fn(ptr, _sg.desc.allocator.user_data);
    } else {
        __sokol_free(ptr);
    }
}

bool _sg_strempty(_sg_str_t* str_var) {
    return 0 == str_var.buf[0];
}

u8* _sg_strptr(_sg_str_t* str_var) {
    return &str_var.buf[0];
}

void _sg_strcpy(_sg_str_t* dst, u8* src) {
    assert(cast(i64, dst));
    if src != null {
        strncpy(dst.buf, src, cast(u64, _SG_STRING_SIZE));
        dst.buf[cast(i32, _SG_STRING_SIZE) - 1] = 0;
    } else {
        _sg_clear(dst.buf, cast(u64, _SG_STRING_SIZE));
    }
}

void _sg_pool_init(_sg_pool_t* pool, i32 num) {
    assert(pool != null && num >= 1);
    pool.size = num + 1;
    pool.queue_top = 0;
    u64 gen_ctrs_size = cast(u64, sizeof(u32)) * cast(u64, pool.size);
    pool.gen_ctrs = cast(u32*, _sg_malloc_clear(gen_ctrs_size));
    pool.free_queue = cast(i32*, _sg_malloc_clear(cast(u64, sizeof(i32)) * cast(u64, num)));
    for i32 i = pool.size - 1; i >= 1; i-- {
        pool.free_queue[pool.queue_top++] = i;
    }
}

void _sg_pool_discard(_sg_pool_t* pool) {
    assert(cast(i64, pool));
    assert(cast(i64, pool.free_queue));
    _sg_free(pool.free_queue);
    pool.free_queue = null;
    assert(cast(i64, pool.gen_ctrs));
    _sg_free(pool.gen_ctrs);
    pool.gen_ctrs = null;
    pool.size = 0;
    pool.queue_top = 0;
}

i32 _sg_pool_alloc_index(_sg_pool_t* pool) {
    assert(cast(i64, pool));
    assert(cast(i64, pool.free_queue));
    if pool.queue_top > 0 {
        i32 slot_index = pool.free_queue[--pool.queue_top];
        assert(slot_index > 0 && slot_index < pool.size);
        return slot_index;
    } else {
        return 0;
    }
}

void _sg_pool_free_index(_sg_pool_t* pool, i32 slot_index) {
    assert(slot_index > 0 && slot_index < pool.size);
    assert(cast(i64, pool));
    assert(cast(i64, pool.free_queue));
    assert(pool.queue_top < pool.size);
    when defined(SOKOL_DEBUG) {
        for i32 i = 0; i < pool.queue_top; i++ {
            assert(pool.free_queue[i] != slot_index);
        }
    }
    pool.free_queue[pool.queue_top++] = slot_index;
    assert(pool.queue_top <= pool.size - 1);
}

void _sg_slot_reset(_sg_slot_t* slot) {
    assert(cast(i64, slot));
    _sg_clear(slot, cast(u64, sizeof(_sg_slot_t)));
}

void _sg_reset_buffer_to_alloc_state(_sg_buffer_t* buf) {
    assert(cast(i64, buf));
    _sg_slot_t slot = buf.slot;
    _sg_clear(buf, cast(u64, sizeof(*buf)));
    buf.slot = slot;
    buf.slot.uninit_count += 1;
    buf.slot.state = SG_RESOURCESTATE_ALLOC;
}

void _sg_reset_image_to_alloc_state(_sg_image_t* img) {
    assert(cast(i64, img));
    _sg_slot_t slot = img.slot;
    _sg_clear(img, cast(u64, sizeof(*img)));
    img.slot = slot;
    img.slot.uninit_count += 1;
    img.slot.state = SG_RESOURCESTATE_ALLOC;
}

void _sg_reset_sampler_to_alloc_state(_sg_sampler_t* smp) {
    assert(cast(i64, smp));
    _sg_slot_t slot = smp.slot;
    _sg_clear(smp, cast(u64, sizeof(*smp)));
    smp.slot = slot;
    smp.slot.uninit_count += 1;
    smp.slot.state = SG_RESOURCESTATE_ALLOC;
}

void _sg_reset_shader_to_alloc_state(_sg_shader_t* shd) {
    assert(cast(i64, shd));
    _sg_slot_t slot = shd.slot;
    _sg_clear(shd, cast(u64, sizeof(*shd)));
    shd.slot = slot;
    shd.slot.uninit_count += 1;
    shd.slot.state = SG_RESOURCESTATE_ALLOC;
}

void _sg_reset_pipeline_to_alloc_state(_sg_pipeline_t* pip) {
    assert(cast(i64, pip));
    _sg_slot_t slot = pip.slot;
    _sg_clear(pip, cast(u64, sizeof(*pip)));
    pip.slot = slot;
    pip.slot.uninit_count += 1;
    pip.slot.state = SG_RESOURCESTATE_ALLOC;
}

void _sg_reset_view_to_alloc_state(_sg_view_t* view) {
    assert(cast(i64, view));
    _sg_slot_t slot = view.slot;
    _sg_clear(view, cast(u64, sizeof(*view)));
    view.slot = slot;
    view.slot.uninit_count += 1;
    view.slot.state = SG_RESOURCESTATE_ALLOC;
}

void _sg_setup_pools(_sg_pools_t* p, sg_desc* desc) {
    assert(cast(i64, p));
    assert(cast(i64, desc));
    assert(desc.buffer_pool_size > 0 && desc.buffer_pool_size < _SG_MAX_POOL_SIZE);
    _sg_pool_init(&p.buffer_pool, desc.buffer_pool_size);
    u64 buffer_pool_byte_size = cast(u64, sizeof(_sg_buffer_t)) * cast(u64, p.buffer_pool.size);
    p.buffers = cast(_sg_buffer_t*, _sg_malloc_clear(buffer_pool_byte_size));
    assert(desc.image_pool_size > 0 && desc.image_pool_size < _SG_MAX_POOL_SIZE);
    _sg_pool_init(&p.image_pool, desc.image_pool_size);
    u64 image_pool_byte_size = cast(u64, sizeof(_sg_image_t)) * cast(u64, p.image_pool.size);
    p.images = cast(_sg_image_t*, _sg_malloc_clear(image_pool_byte_size));
    assert(desc.sampler_pool_size > 0 && desc.sampler_pool_size < _SG_MAX_POOL_SIZE);
    _sg_pool_init(&p.sampler_pool, desc.sampler_pool_size);
    u64 sampler_pool_byte_size = cast(u64, sizeof(_sg_sampler_t)) * cast(u64, p.sampler_pool.size);
    p.samplers = cast(_sg_sampler_t*, _sg_malloc_clear(sampler_pool_byte_size));
    assert(desc.shader_pool_size > 0 && desc.shader_pool_size < _SG_MAX_POOL_SIZE);
    _sg_pool_init(&p.shader_pool, desc.shader_pool_size);
    u64 shader_pool_byte_size = cast(u64, sizeof(_sg_shader_t)) * cast(u64, p.shader_pool.size);
    p.shaders = cast(_sg_shader_t*, _sg_malloc_clear(shader_pool_byte_size));
    assert(desc.pipeline_pool_size > 0 && desc.pipeline_pool_size < _SG_MAX_POOL_SIZE);
    _sg_pool_init(&p.pipeline_pool, desc.pipeline_pool_size);
    u64 pipeline_pool_byte_size = cast(u64, sizeof(_sg_pipeline_t)) * cast(u64, p.pipeline_pool.size);
    p.pipelines = cast(_sg_pipeline_t*, _sg_malloc_clear(pipeline_pool_byte_size));
    assert(desc.view_pool_size > 0 && desc.view_pool_size < _SG_MAX_POOL_SIZE);
    _sg_pool_init(&p.view_pool, desc.view_pool_size);
    u64 view_pool_byte_size = cast(u64, sizeof(_sg_view_t)) * cast(u64, p.view_pool.size);
    p.views = cast(_sg_view_t*, _sg_malloc_clear(view_pool_byte_size));
}

void _sg_discard_pools(_sg_pools_t* p) {
    assert(cast(i64, p));
    _sg_free(p.views);
    p.views = null;
    _sg_free(p.pipelines);
    p.pipelines = null;
    _sg_free(p.shaders);
    p.shaders = null;
    _sg_free(p.samplers);
    p.samplers = null;
    _sg_free(p.images);
    p.images = null;
    _sg_free(p.buffers);
    p.buffers = null;
    _sg_pool_discard(&p.view_pool);
    _sg_pool_discard(&p.pipeline_pool);
    _sg_pool_discard(&p.shader_pool);
    _sg_pool_discard(&p.sampler_pool);
    _sg_pool_discard(&p.image_pool);
    _sg_pool_discard(&p.buffer_pool);
}

u32 _sg_slot_alloc(_sg_pool_t* pool, _sg_slot_t* slot, i32 slot_index) {
    assert(pool != null && pool.gen_ctrs != null);
    assert(slot_index > 0 && slot_index < pool.size);
    assert(slot.id == cast(u32, SG_INVALID_ID));
    assert(slot.state == SG_RESOURCESTATE_INITIAL);
    u32 ctr = ++pool.gen_ctrs[slot_index];
    slot.id = ctr << cast(u32, _SG_SLOT_SHIFT) | cast(u32, slot_index & cast(u32, _SG_SLOT_MASK));
    slot.state = SG_RESOURCESTATE_ALLOC;
    return slot.id;
}

i32 _sg_slot_index(u32 id) {
    var slot_index = cast(i32, id & cast(u32, _SG_SLOT_MASK));
    assert(0 != slot_index);
    return slot_index;
}

_sg_buffer_t* _sg_buffer_at(u32 buf_id) {
    assert(cast(u32, SG_INVALID_ID) != buf_id);
    i32 slot_index = _sg_slot_index(buf_id);
    assert(slot_index > 0 && slot_index < _sg.pools.buffer_pool.size);
    return &_sg.pools.buffers[slot_index];
}

_sg_image_t* _sg_image_at(u32 img_id) {
    assert(cast(u32, SG_INVALID_ID) != img_id);
    i32 slot_index = _sg_slot_index(img_id);
    assert(slot_index > 0 && slot_index < _sg.pools.image_pool.size);
    return &_sg.pools.images[slot_index];
}

_sg_sampler_t* _sg_sampler_at(u32 smp_id) {
    assert(cast(u32, SG_INVALID_ID) != smp_id);
    i32 slot_index = _sg_slot_index(smp_id);
    assert(slot_index > 0 && slot_index < _sg.pools.sampler_pool.size);
    return &_sg.pools.samplers[slot_index];
}

_sg_shader_t* _sg_shader_at(u32 shd_id) {
    assert(cast(u32, SG_INVALID_ID) != shd_id);
    i32 slot_index = _sg_slot_index(shd_id);
    assert(slot_index > 0 && slot_index < _sg.pools.shader_pool.size);
    return &_sg.pools.shaders[slot_index];
}

_sg_pipeline_t* _sg_pipeline_at(u32 pip_id) {
    assert(cast(u32, SG_INVALID_ID) != pip_id);
    i32 slot_index = _sg_slot_index(pip_id);
    assert(slot_index > 0 && slot_index < _sg.pools.pipeline_pool.size);
    return &_sg.pools.pipelines[slot_index];
}

_sg_view_t* _sg_view_at(u32 view_id) {
    assert(cast(u32, SG_INVALID_ID) != view_id);
    i32 slot_index = _sg_slot_index(view_id);
    assert(slot_index > 0 && slot_index < _sg.pools.view_pool.size);
    return &_sg.pools.views[slot_index];
}

_sg_buffer_t* _sg_lookup_buffer(u32 buf_id) {
    if cast(u32, SG_INVALID_ID) != buf_id {
        _sg_buffer_t* buf = _sg_buffer_at(buf_id);
        if buf.slot.id == buf_id {
            return buf;
        }
    }
    return null;
}

_sg_image_t* _sg_lookup_image(u32 img_id) {
    if cast(u32, SG_INVALID_ID) != img_id {
        _sg_image_t* img = _sg_image_at(img_id);
        if img.slot.id == img_id {
            return img;
        }
    }
    return null;
}

_sg_sampler_t* _sg_lookup_sampler(u32 smp_id) {
    if cast(u32, SG_INVALID_ID) != smp_id {
        _sg_sampler_t* smp = _sg_sampler_at(smp_id);
        if smp.slot.id == smp_id {
            return smp;
        }
    }
    return null;
}

_sg_shader_t* _sg_lookup_shader(u32 shd_id) {
    if cast(u32, SG_INVALID_ID) != shd_id {
        _sg_shader_t* shd = _sg_shader_at(shd_id);
        if shd.slot.id == shd_id {
            return shd;
        }
    }
    return null;
}

_sg_pipeline_t* _sg_lookup_pipeline(u32 pip_id) {
    if cast(u32, SG_INVALID_ID) != pip_id {
        _sg_pipeline_t* pip = _sg_pipeline_at(pip_id);
        if pip.slot.id == pip_id {
            return pip;
        }
    }
    return null;
}

_sg_view_t* _sg_lookup_view(u32 view_id) {
    if cast(u32, SG_INVALID_ID) != view_id {
        _sg_view_t* view = _sg_view_at(view_id);
        if view.slot.id == view_id {
            return view;
        }
    }
    return null;
}

void _sg_track_init(_sg_track_t* track, i32 num_slots) {
    assert(track != null && num_slots > 0);
    _sg_clear(track, cast(u64, sizeof(_sg_track_t)));
    track.num_slots = num_slots;
    track.slots = cast(u32*, _sg_malloc_clear(cast(u64, num_slots) * cast(u64, sizeof(u32))));
    track.occupy_num_bytes = _sg_roundup_pow2_u32(cast(u32, num_slots), 8) >> 3;
    track.occupy_bits = cast(u8*, _sg_malloc_clear(track.occupy_num_bytes));
}

void _sg_track_discard(_sg_track_t* track) {
    assert(cast(i64, track));
    if track.slots != null {
        _sg_free(track.slots);
        track.slots = null;
    }
    if track.occupy_bits != null {
        _sg_free(track.occupy_bits);
        track.occupy_num_bytes = 0;
        track.occupy_bits = null;
    }
    track.num_slots = 0;
    track.cur_slot = 0;
}

void _sg_track_reset(_sg_track_t* track) {
    assert(track != null && track.slots != null && track.occupy_bits != null);
    track.cur_slot = 0;
    _sg_clear(track.occupy_bits, track.occupy_num_bytes);
}

i32 _sg_track_occupy_index(i32 slot_index) {
    i32 occupy_index = slot_index >> 3;
    return occupy_index;
}

u8 _sg_track_occupy_mask(i32 slot_index) {
    return cast(u8, cast(u32, 1) << (slot_index & 7));
}

void _sg_track_add(_sg_track_t* track, u32 id) {
    assert(track != null && track.slots != null && track.occupy_bits != null);
    assert(id != cast(u32, SG_INVALID_ID));
    i32 slot_index = _sg_slot_index(id);
    i32 occupy_index = _sg_track_occupy_index(slot_index);
    assert(cast(u32, occupy_index) < track.occupy_num_bytes);
    u8 occupy_mask = _sg_track_occupy_mask(slot_index);
    if 0 == (track.occupy_bits[occupy_index] & occupy_mask) {
        assert(track.cur_slot < track.num_slots);
        track.slots[track.cur_slot++] = id;
        track.occupy_bits[occupy_index] |= occupy_mask;
    }
}

void _sg_track_remove(_sg_track_t* track, u32 id) {
    assert(track != null && track.slots != null && track.occupy_bits != null);
    assert(id != cast(u32, SG_INVALID_ID));
    i32 slot_index = _sg_slot_index(id);
    i32 occupy_index = _sg_track_occupy_index(slot_index);
    u8 occupy_mask = _sg_track_occupy_mask(slot_index);
    if (track.occupy_bits[occupy_index] & occupy_mask) != 0 {
        track.occupy_bits[occupy_index] &= ~occupy_mask;
        for i32 i = 0; i < track.cur_slot; i++ {
            if id == track.slots[i] {
                assert(track.cur_slot > 0);
                track.slots[i] = track.slots[--track.cur_slot];
                break;
            }
        }
    }
}

_sg_sref_t _sg_sref(_sg_slot_t* slot) {
    _sg_sref_t sref;
    if slot != null {
        sref.id = slot.id;
        sref.uninit_count = slot.uninit_count;
    }
    return sref;
}

bool _sg_sref_slot_eql(_sg_sref_t* sref, _sg_slot_t* slot) {
    assert(sref != null && slot != null);
    return sref.id == slot.id && sref.uninit_count == slot.uninit_count;
}

bool _sg_sref_sref_eql(_sg_sref_t* sref0, _sg_sref_t* sref1) {
    assert(sref0 != null && sref1 != null);
    return sref0.id == sref1.id && sref0.uninit_count == sref1.uninit_count;
}

_sg_buffer_ref_t _sg_buffer_ref(_sg_buffer_t* buf_or_null) {
    _sg_buffer_ref_t ref;
    if buf_or_null != null {
        _sg_buffer_t* buf = buf_or_null;
        assert(buf.slot.id != cast(u32, SG_INVALID_ID));
        ref.ptr = buf;
        ref.sref = _sg_sref(&buf.slot);
    }
    return ref;
}

_sg_image_ref_t _sg_image_ref(_sg_image_t* img_or_null) {
    _sg_image_ref_t ref;
    if img_or_null != null {
        _sg_image_t* img = img_or_null;
        assert(img.slot.id != cast(u32, SG_INVALID_ID));
        ref.ptr = img;
        ref.sref = _sg_sref(&img.slot);
    }
    return ref;
}

_sg_sampler_ref_t _sg_sampler_ref(_sg_sampler_t* smp_or_null) {
    _sg_sampler_ref_t ref;
    if smp_or_null != null {
        _sg_sampler_t* smp = smp_or_null;
        assert(smp.slot.id != cast(u32, SG_INVALID_ID));
        ref.ptr = smp;
        ref.sref = _sg_sref(&smp.slot);
    }
    return ref;
}

_sg_shader_ref_t _sg_shader_ref(_sg_shader_t* shd_or_null) {
    _sg_shader_ref_t ref;
    if shd_or_null != null {
        _sg_shader_t* shd = shd_or_null;
        assert(shd.slot.id != cast(u32, SG_INVALID_ID));
        ref.ptr = shd;
        ref.sref = _sg_sref(&shd.slot);
    }
    return ref;
}

_sg_pipeline_ref_t _sg_pipeline_ref(_sg_pipeline_t* pip_or_null) {
    _sg_pipeline_ref_t ref;
    if pip_or_null != null {
        _sg_pipeline_t* pip = pip_or_null;
        assert(pip.slot.id != cast(u32, SG_INVALID_ID));
        ref.ptr = pip;
        ref.sref = _sg_sref(&pip.slot);
    }
    return ref;
}

_sg_view_ref_t _sg_view_ref(_sg_view_t* view_or_null) {
    _sg_view_ref_t ref;
    if view_or_null != null {
        _sg_view_t* view = view_or_null;
        assert(view.slot.id != cast(u32, SG_INVALID_ID));
        ref.ptr = view;
        ref.sref = _sg_sref(&view.slot);
    }
    return ref;
}

bool _sg_buffer_ref_eql(_sg_buffer_ref_t* ref, _sg_buffer_t* res) {
    assert(ref != null && res != null);
    return _sg_sref_slot_eql(&ref.sref, &res.slot);
}

bool _sg_image_ref_eql(_sg_image_ref_t* ref, _sg_image_t* res) {
    assert(ref != null && res != null);
    return _sg_sref_slot_eql(&ref.sref, &res.slot);
}

bool _sg_sampler_ref_eql(_sg_sampler_ref_t* ref, _sg_sampler_t* res) {
    assert(ref != null && res != null);
    return _sg_sref_slot_eql(&ref.sref, &res.slot);
}

bool _sg_shader_ref_eql(_sg_shader_ref_t* ref, _sg_shader_t* res) {
    assert(ref != null && res != null);
    return _sg_sref_slot_eql(&ref.sref, &res.slot);
}

bool _sg_pipeline_ref_eql(_sg_pipeline_ref_t* ref, _sg_pipeline_t* res) {
    assert(ref != null && res != null);
    return _sg_sref_slot_eql(&ref.sref, &res.slot);
}

bool _sg_view_ref_eql(_sg_view_ref_t* ref, _sg_view_t* res) {
    assert(ref != null && res != null);
    return _sg_sref_slot_eql(&ref.sref, &res.slot);
}

bool _sg_buffer_ref_null(_sg_buffer_ref_t* ref) {
    assert(cast(i64, ref));
    return cast(u32, SG_INVALID_ID) == ref.sref.id;
}

bool _sg_image_ref_null(_sg_image_ref_t* ref) {
    assert(cast(i64, ref));
    return cast(u32, SG_INVALID_ID) == ref.sref.id;
}

bool _sg_sampler_ref_null(_sg_sampler_ref_t* ref) {
    assert(cast(i64, ref));
    return cast(u32, SG_INVALID_ID) == ref.sref.id;
}

bool _sg_shader_ref_null(_sg_shader_ref_t* ref) {
    assert(cast(i64, ref));
    return cast(u32, SG_INVALID_ID) == ref.sref.id;
}

bool _sg_pipeline_ref_null(_sg_pipeline_ref_t* ref) {
    assert(cast(i64, ref));
    return cast(u32, SG_INVALID_ID) == ref.sref.id;
}

bool _sg_view_ref_null(_sg_view_ref_t* ref) {
    assert(cast(i64, ref));
    return cast(u32, SG_INVALID_ID) == ref.sref.id;
}

bool _sg_buffer_ref_alive(_sg_buffer_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot);
}

bool _sg_image_ref_alive(_sg_image_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot);
}

bool _sg_sampler_ref_alive(_sg_sampler_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot);
}

bool _sg_shader_ref_alive(_sg_shader_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot);
}

bool _sg_pipeline_ref_alive(_sg_pipeline_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot);
}

bool _sg_view_ref_alive(_sg_view_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot);
}

bool _sg_buffer_ref_valid(_sg_buffer_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) && ref.ptr.slot.state == SG_RESOURCESTATE_VALID;
}

bool _sg_image_ref_valid(_sg_image_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) && ref.ptr.slot.state == SG_RESOURCESTATE_VALID;
}

bool _sg_sampler_ref_valid(_sg_sampler_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) && ref.ptr.slot.state == SG_RESOURCESTATE_VALID;
}

bool _sg_shader_ref_valid(_sg_shader_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) && ref.ptr.slot.state == SG_RESOURCESTATE_VALID;
}

bool _sg_pipeline_ref_valid(_sg_pipeline_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) && ref.ptr.slot.state == SG_RESOURCESTATE_VALID;
}

bool _sg_view_ref_valid(_sg_view_ref_t* ref) {
    assert(cast(i64, ref));
    return ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) && ref.ptr.slot.state == SG_RESOURCESTATE_VALID;
}

_sg_buffer_t* _sg_buffer_ref_ptr(_sg_buffer_ref_t* ref) {
    assert(ref != null && ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot));
    return ref.ptr;
}

_sg_image_t* _sg_image_ref_ptr(_sg_image_ref_t* ref) {
    assert(ref != null && ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot));
    return ref.ptr;
}

_sg_sampler_t* _sg_sampler_ref_ptr(_sg_sampler_ref_t* ref) {
    assert(ref != null && ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot));
    return ref.ptr;
}

_sg_shader_t* _sg_shader_ref_ptr(_sg_shader_ref_t* ref) {
    assert(ref != null && ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot));
    return ref.ptr;
}

_sg_pipeline_t* _sg_pipeline_ref_ptr(_sg_pipeline_ref_t* ref) {
    assert(ref != null && ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot));
    return ref.ptr;
}

_sg_view_t* _sg_view_ref_ptr(_sg_view_ref_t* ref) {
    assert(ref != null && ref.ptr != null && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot));
    return ref.ptr;
}

_sg_buffer_t* _sg_buffer_ref_ptr_or_null(_sg_buffer_ref_t* ref) {
    assert(cast(i64, ref));
    if cast(u32, SG_INVALID_ID) != ref.sref.id && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) {
        return ref.ptr;
    } else {
        return null;
    }
}

_sg_image_t* _sg_image_ref_ptr_or_null(_sg_image_ref_t* ref) {
    assert(cast(i64, ref));
    if cast(u32, SG_INVALID_ID) != ref.sref.id && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) {
        return ref.ptr;
    } else {
        return null;
    }
}

_sg_sampler_t* _sg_sampler_ref_ptr_or_null(_sg_sampler_ref_t* ref) {
    assert(cast(i64, ref));
    if cast(u32, SG_INVALID_ID) != ref.sref.id && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) {
        return ref.ptr;
    } else {
        return null;
    }
}

_sg_shader_t* _sg_shader_ref_ptr_or_null(_sg_shader_ref_t* ref) {
    assert(cast(i64, ref));
    if cast(u32, SG_INVALID_ID) != ref.sref.id && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) {
        return ref.ptr;
    } else {
        return null;
    }
}

_sg_pipeline_t* _sg_pipeline_ref_ptr_or_null(_sg_pipeline_ref_t* ref) {
    assert(cast(i64, ref));
    if cast(u32, SG_INVALID_ID) != ref.sref.id && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) {
        return ref.ptr;
    } else {
        return null;
    }
}

_sg_view_t* _sg_view_ref_ptr_or_null(_sg_view_ref_t* ref) {
    assert(cast(i64, ref));
    if cast(u32, SG_INVALID_ID) != ref.sref.id && _sg_sref_slot_eql(&ref.sref, &ref.ptr.slot) {
        return ref.ptr;
    } else {
        return null;
    }
}

void _sg_update_alive_free_resource_stats(sg_total_resource_stats* stats, _sg_pool_t* pool) {
    assert(stats != null && pool != null);
    stats.alive = cast(u32, pool.size - 1 - pool.queue_top);
    stats.free = cast(u32, pool.queue_top);
}

void _sg_update_stats() {
    _sg.stats.cur_frame.frame_index = _sg.frame_index;
    _sg.stats.prev_frame = _sg.stats.cur_frame;
    _sg_clear(&_sg.stats.cur_frame, cast(u64, sizeof(sg_frame_stats)));
}

u32 _sg_align_u32(u32 val, u32 align) {
    assert(align > 0 && (align & align - 1) == 0);
    return val + (align - 1) & ~(align - 1);
}

_sg_recti_t _sg_clipi(i32 x, i32 y, i32 w, i32 h, i32 clip_width, i32 clip_height) {
    x = (0 > x ? 0 : x) < clip_width - 1 ? 0 > x ? 0 : x : clip_width - 1;
    y = (0 > y ? 0 : y) < clip_height - 1 ? 0 > y ? 0 : y : clip_height - 1;
    if x + w > clip_width {
        w = clip_width - x;
    }
    if y + h > clip_height {
        h = clip_height - y;
    }
    w = w > 1 ? w : 1;
    h = h > 1 ? h : 1;
    var res = _sg_recti_t{x, y, w, h};
    return res;
}

bool _sg_resource_state_valid_failed(sg_resource_state s) {
    return s == SG_RESOURCESTATE_VALID || s == SG_RESOURCESTATE_FAILED;
}

bool _sg_resource_state_valid_failed_unsealed(sg_resource_state s) {
    return s == SG_RESOURCESTATE_VALID || s == SG_RESOURCESTATE_FAILED || s == SG_RESOURCESTATE_UNSEALED;
}

bool _sg_resource_state_valid_unsealed(sg_resource_state s) {
    return s == SG_RESOURCESTATE_VALID || s == SG_RESOURCESTATE_UNSEALED;
}

i32 _sg_miplevel_dim(i32 base_dim, i32 mip_level) {
    return base_dim >> mip_level > 1 ? base_dim >> mip_level : 1;
}

bool _sg_image_view_alive(_sg_view_t* view) {
    return view != null && _sg_image_ref_alive(&view.cmn.img.ref);
}

_sg_dimi_t _sg_image_view_dim(_sg_view_t* view) {
    assert(cast(i64, view));
    _sg_image_t* img = _sg_image_ref_ptr(&view.cmn.img.ref);
    assert(img.cmn.width > 0 && img.cmn.height > 0);
    _sg_dimi_t res;
    res.width = _sg_miplevel_dim(img.cmn.width, view.cmn.img.mip_level);
    res.height = _sg_miplevel_dim(img.cmn.height, view.cmn.img.mip_level);
    return res;
}

bool _sg_attachments_empty(sg_attachments* atts) {
    assert(cast(i64, atts));
    for u64 i = 0; i < cast(u64, SG_MAX_COLOR_ATTACHMENTS); i++ {
        if atts.colors[i].id != cast(u32, SG_INVALID_ID) {
            return false;
        }
        if atts.resolves[i].id != cast(u32, SG_INVALID_ID) {
            return false;
        }
    }
    if atts.depth_stencil.id != cast(u32, SG_INVALID_ID) {
        return false;
    }
    return true;
}

_sg_attachments_ptrs_t _sg_attachments_ptrs(sg_attachments* atts) {
    assert(cast(i64, atts));
    _sg_attachments_ptrs_t res;
    res.empty = true;
    for i32 i = 0; i < SG_MAX_COLOR_ATTACHMENTS; i++ {
        if atts.colors[i].id != cast(u32, SG_INVALID_ID) {
            res.empty = false;
            res.num_color_views += 1;
            res.color_views[i] = _sg_lookup_view(atts.colors[i].id);
        }
        if atts.resolves[i].id != cast(u32, SG_INVALID_ID) {
            assert(atts.colors[i].id != cast(u32, SG_INVALID_ID));
            res.empty = false;
            res.resolve_views[i] = _sg_lookup_view(atts.resolves[i].id);
        }
    }
    if atts.depth_stencil.id != cast(u32, SG_INVALID_ID) {
        res.empty = false;
        res.ds_view = _sg_lookup_view(atts.depth_stencil.id);
    }
    return res;
}

_sg_dimi_t _sg_attachments_dim(_sg_attachments_ptrs_t* atts_ptrs) {
    if atts_ptrs.ds_view != null {
        return _sg_image_view_dim(atts_ptrs.ds_view);
    } else {
        assert(cast(i64, atts_ptrs.color_views[0]));
        return _sg_image_view_dim(atts_ptrs.color_views[0]);
    }
}

bool _sg_attachments_alive(_sg_attachments_ptrs_t* atts_ptrs) {
    for i32 i = 0; i < atts_ptrs.num_color_views; i++ {
        if !_sg_image_view_alive(atts_ptrs.color_views[i]) {
            return false;
        }
        if atts_ptrs.resolve_views[i] != null && !_sg_image_view_alive(atts_ptrs.resolve_views[i]) {
            return false;
        }
    }
    if atts_ptrs.ds_view != null && !_sg_image_view_alive(atts_ptrs.ds_view) {
        return false;
    }
    return true;
}

bool _sg_is_dualsource_blendfactor(sg_blend_factor f) {
    switch f {
        case SG_BLENDFACTOR_SRC1_COLOR, SG_BLENDFACTOR_ONE_MINUS_SRC1_COLOR, SG_BLENDFACTOR_SRC1_ALPHA, SG_BLENDFACTOR_ONE_MINUS_SRC1_ALPHA: {
            return true;
        }
        default: {
            return false;
        }
    }
}

void _sg_buffer_common_init(_sg_buffer_common_t* cmn, sg_buffer_desc* desc) {
    cmn.size = cast(i32, desc.size);
    cmn.num_slots = desc.usage.write_transient ? cast(i32, SG_NUM_INFLIGHT_FRAMES) : 1;
    cmn.active_slot = 0;
    cmn.write_transient_frame_index = 0;
    cmn.validate.bind_frame_index = 0;
    cmn.validate.copy_src_frame_index = 0;
    cmn.validate.read_render_pass_index = 0;
    cmn.validate.write_render_pass_index = 0;
    cmn.usage = desc.usage;
}

void _sg_image_common_init(_sg_image_common_t* cmn, sg_image_desc* desc) {
    cmn.num_slots = desc.usage.write_transient ? cast(i32, SG_NUM_INFLIGHT_FRAMES) : 1;
    cmn.active_slot = 0;
    cmn.write_transient_frame_index = 0;
    cmn.validate.bind_frame_index = 0;
    cmn.type = desc.type;
    cmn.width = desc.width;
    cmn.height = desc.height;
    cmn.num_slices = desc.num_slices;
    cmn.num_mipmaps = desc.num_mipmaps;
    cmn.usage = desc.usage;
    cmn.pixel_format = desc.pixel_format;
    cmn.sample_count = desc.sample_count;
    cmn.upd_frame_index = 0;
}

void _sg_sampler_common_init(_sg_sampler_common_t* cmn, sg_sampler_desc* desc) {
    cmn.min_filter = desc.min_filter;
    cmn.mag_filter = desc.mag_filter;
    cmn.mipmap_filter = desc.mipmap_filter;
    cmn.wrap_u = desc.wrap_u;
    cmn.wrap_v = desc.wrap_v;
    cmn.wrap_w = desc.wrap_w;
    cmn.min_lod = desc.min_lod;
    cmn.max_lod = desc.max_lod;
    cmn.border_color = desc.border_color;
    cmn.compare = desc.compare;
    cmn.max_anisotropy = desc.max_anisotropy;
}

void _sg_shader_common_init(_sg_shader_common_t* cmn, sg_shader_desc* desc) {
    cmn.is_compute = desc.compute_func.source != null || desc.compute_func.bytecode.ptr != null;
    for u64 i = 0; i < cast(u64, SG_MAX_VERTEX_ATTRIBUTES); i++ {
        cmn.attrs[i].base_type = desc.attrs[i].base_type;
    }
    for u64 i = 0; i < cast(u64, SG_MAX_UNIFORMBLOCK_BINDSLOTS); i++ {
        sg_shader_uniform_block* src = &desc.uniform_blocks[i];
        _sg_shader_uniform_block_t* dst = &cmn.uniform_blocks[i];
        if src.stage != SG_SHADERSTAGE_NONE {
            cmn.required_bindings_and_uniforms |= cast(u32, cast(u32, 1) << cast(i32, i));
            dst.stage = src.stage;
            dst.size = src.size;
        }
    }
    var required_bindings_flag = cast(u32, cast(u32, 1) << cast(i32, SG_MAX_UNIFORMBLOCK_BINDSLOTS));
    for u64 i = 0; i < cast(u64, SG_MAX_VIEW_BINDSLOTS); i++ {
        _sg_shader_view_t* dst = &cmn.views[i];
        if desc.views[i].texture.stage != SG_SHADERSTAGE_NONE {
            sg_shader_texture_view* src = &desc.views[i].texture;
            dst.stage = src.stage;
            dst.view_type = SG_VIEWTYPE_TEXTURE;
            dst.image_type = src.image_type;
            dst.sample_type = src.sample_type;
            dst.multisampled = src.multisampled;
        } else if desc.views[i].storage_buffer.stage != SG_SHADERSTAGE_NONE {
            sg_shader_storage_buffer_view* src = &desc.views[i].storage_buffer;
            cmn.required_bindings_and_uniforms |= required_bindings_flag;
            dst.stage = src.stage;
            dst.view_type = SG_VIEWTYPE_STORAGEBUFFER;
            dst.sbuf_readonly = src.readonly;
        } else if desc.views[i].storage_image.stage != SG_SHADERSTAGE_NONE {
            sg_shader_storage_image_view* src = &desc.views[i].storage_image;
            cmn.required_bindings_and_uniforms |= required_bindings_flag;
            dst.stage = src.stage;
            dst.view_type = SG_VIEWTYPE_STORAGEIMAGE;
            dst.image_type = src.image_type;
            dst.access_format = src.access_format;
            dst.simg_writeonly = src.writeonly;
        }
    }
    for u64 i = 0; i < cast(u64, SG_MAX_SAMPLER_BINDSLOTS); i++ {
        sg_shader_sampler* src = &desc.samplers[i];
        _sg_shader_sampler_t* dst = &cmn.samplers[i];
        if src.stage != SG_SHADERSTAGE_NONE {
            cmn.required_bindings_and_uniforms |= required_bindings_flag;
            dst.stage = src.stage;
            dst.sampler_type = src.sampler_type;
        }
    }
    for u64 i = 0; i < cast(u64, SG_MAX_TEXTURE_SAMPLER_PAIRS); i++ {
        sg_shader_texture_sampler_pair* src = &desc.texture_sampler_pairs[i];
        _sg_shader_texture_sampler_t* dst = &cmn.texture_samplers[i];
        if src.stage != SG_SHADERSTAGE_NONE {
            dst.stage = src.stage;
            assert(src.view_slot >= 0 && cast(i32, src.view_slot) < SG_MAX_VIEW_BINDSLOTS);
            assert(cmn.views[src.view_slot].view_type == SG_VIEWTYPE_TEXTURE);
            assert(cmn.views[src.view_slot].stage == src.stage);
            dst.view_slot = src.view_slot;
            assert(src.sampler_slot >= 0 && cast(i32, src.sampler_slot) < SG_MAX_SAMPLER_BINDSLOTS);
            assert(desc.samplers[src.sampler_slot].stage == src.stage);
            dst.sampler_slot = src.sampler_slot;
        }
    }
}

void _sg_pipeline_common_init(_sg_pipeline_common_t* cmn, sg_pipeline_desc* desc, _sg_shader_t* shd) {
    assert(desc.color_count >= 0 && desc.color_count <= SG_MAX_COLOR_ATTACHMENTS);
    var required_bindings_flag = cast(u32, cast(u32, 1) << cast(i32, SG_MAX_UNIFORMBLOCK_BINDSLOTS));
    for u64 attr_idx = 0; attr_idx < cast(u64, SG_MAX_VERTEX_ATTRIBUTES); attr_idx++ {
        sg_vertex_attr_state* attr_state = &desc.layout.attrs[attr_idx];
        if attr_state.format != SG_VERTEXFORMAT_INVALID {
            assert(attr_state.buffer_index >= 0 && attr_state.buffer_index < SG_MAX_VERTEXBUFFER_BINDSLOTS);
            cmn.vertex_buffer_layout_active[attr_state.buffer_index] = true;
            cmn.required_bindings_and_uniforms |= required_bindings_flag;
        }
    }
    cmn.use_instanced_draw = false;
    for u64 vbuf_idx = 0; vbuf_idx < cast(u64, SG_MAX_VERTEXBUFFER_BINDSLOTS); vbuf_idx++ {
        sg_vertex_buffer_layout_state* vbuf_state = &desc.layout.buffers[vbuf_idx];
        if vbuf_state.step_func == SG_VERTEXSTEP_PER_INSTANCE {
            cmn.use_instanced_draw = true;
        }
    }
    cmn.is_compute = desc.compute;
    cmn.shader = _sg_shader_ref(shd);
    cmn.layout = desc.layout;
    cmn.depth = desc.depth;
    cmn.stencil = desc.stencil;
    cmn.color_count = desc.color_count;
    for i32 i = 0; i < desc.color_count; i++ {
        cmn.colors[i] = desc.colors[i];
    }
    cmn.primitive_type = desc.primitive_type;
    cmn.index_type = desc.index_type;
    if cmn.index_type != SG_INDEXTYPE_NONE {
        cmn.required_bindings_and_uniforms |= required_bindings_flag;
    }
    cmn.cull_mode = desc.cull_mode;
    cmn.face_winding = desc.face_winding;
    cmn.sample_count = desc.sample_count;
    cmn.blend_color = desc.blend_color;
    cmn.alpha_to_coverage_enabled = desc.alpha_to_coverage_enabled;
}

void _sg_buffer_view_common_init(_sg_buffer_view_common_t* cmn, sg_buffer_view_desc* desc, _sg_buffer_t* buf) {
    assert(SG_RESOURCESTATE_VALID == buf.slot.state);
    cmn.ref = _sg_buffer_ref(buf);
    cmn.offset = desc.offset;
}

void _sg_texture_view_common_init(_sg_image_view_common_t* cmn, sg_texture_view_desc* desc, _sg_image_t* img) {
    assert(cast(i64, _sg_resource_state_valid_unsealed(img.slot.state)));
    cmn.ref = _sg_image_ref(img);
    cmn.mip_level = desc.mip_levels.base;
    cmn.mip_level_count = desc.mip_levels.count == 0 ? img.cmn.num_mipmaps - cmn.mip_level : desc.mip_levels.count;
    cmn.slice = desc.slices.base;
    switch img.cmn.type {
        case SG_IMAGETYPE_2D: {
            cmn.slice_count = 1;
        }
        case SG_IMAGETYPE_CUBE: {
            cmn.slice_count = 6;
        }
        case SG_IMAGETYPE_3D: {
            cmn.slice_count = 1;
        }
        case SG_IMAGETYPE_ARRAY: {
            cmn.slice_count = desc.slices.count == 0 ? img.cmn.num_slices - cmn.slice : desc.slices.count;
        }
        default: {
            assert(cast(i64, false));
        }
    }
}

void _sg_image_view_common_init(_sg_image_view_common_t* cmn, sg_image_view_desc* desc, _sg_image_t* img) {
    assert(SG_RESOURCESTATE_VALID == img.slot.state);
    cmn.ref = _sg_image_ref(img);
    cmn.mip_level = desc.mip_level;
    cmn.mip_level_count = 1;
    cmn.slice = desc.slice;
    cmn.slice_count = 1;
}

void _sg_view_common_init(_sg_view_common_t* cmn, sg_view_desc* desc, _sg_buffer_t* buf, _sg_image_t* img) {
    if desc.texture.image.id != cast(u32, SG_INVALID_ID) {
        assert(cast(i64, img));
        cmn.type = SG_VIEWTYPE_TEXTURE;
        _sg_texture_view_common_init(&cmn.img, &desc.texture, img);
    } else if desc.storage_buffer.buffer.id != cast(u32, SG_INVALID_ID) {
        assert(cast(i64, buf));
        cmn.type = SG_VIEWTYPE_STORAGEBUFFER;
        _sg_buffer_view_common_init(&cmn.buf, &desc.storage_buffer, buf);
    } else if desc.storage_image.image.id != cast(u32, SG_INVALID_ID) {
        assert(cast(i64, img));
        cmn.type = SG_VIEWTYPE_STORAGEIMAGE;
        _sg_image_view_common_init(&cmn.img, &desc.storage_image, img);
    } else if desc.color_attachment.image.id != cast(u32, SG_INVALID_ID) {
        assert(cast(i64, img));
        cmn.type = SG_VIEWTYPE_COLORATTACHMENT;
        _sg_image_view_common_init(&cmn.img, &desc.color_attachment, img);
    } else if desc.resolve_attachment.image.id != cast(u32, SG_INVALID_ID) {
        assert(cast(i64, img));
        cmn.type = SG_VIEWTYPE_RESOLVEATTACHMENT;
        _sg_image_view_common_init(&cmn.img, &desc.resolve_attachment, img);
    } else if desc.depth_stencil_attachment.image.id != cast(u32, SG_INVALID_ID) {
        assert(cast(i64, img));
        cmn.type = SG_VIEWTYPE_DEPTHSTENCILATTACHMENT;
        _sg_image_view_common_init(&cmn.img, &desc.depth_stencil_attachment, img);
    } else {
        assert(cast(i64, false));
    }
}

i32 _sg_vertexformat_bytesize(sg_vertex_format fmt) {
    switch fmt {
        case SG_VERTEXFORMAT_FLOAT: {
            return 4;
        }
        case SG_VERTEXFORMAT_FLOAT2: {
            return 8;
        }
        case SG_VERTEXFORMAT_FLOAT3: {
            return 12;
        }
        case SG_VERTEXFORMAT_FLOAT4: {
            return 16;
        }
        case SG_VERTEXFORMAT_INT: {
            return 4;
        }
        case SG_VERTEXFORMAT_INT2: {
            return 8;
        }
        case SG_VERTEXFORMAT_INT3: {
            return 12;
        }
        case SG_VERTEXFORMAT_INT4: {
            return 16;
        }
        case SG_VERTEXFORMAT_UINT: {
            return 4;
        }
        case SG_VERTEXFORMAT_UINT2: {
            return 8;
        }
        case SG_VERTEXFORMAT_UINT3: {
            return 12;
        }
        case SG_VERTEXFORMAT_UINT4: {
            return 16;
        }
        case SG_VERTEXFORMAT_BYTE4: {
            return 4;
        }
        case SG_VERTEXFORMAT_BYTE4N: {
            return 4;
        }
        case SG_VERTEXFORMAT_UBYTE4: {
            return 4;
        }
        case SG_VERTEXFORMAT_UBYTE4N: {
            return 4;
        }
        case SG_VERTEXFORMAT_SHORT2: {
            return 4;
        }
        case SG_VERTEXFORMAT_SHORT2N: {
            return 4;
        }
        case SG_VERTEXFORMAT_USHORT2: {
            return 4;
        }
        case SG_VERTEXFORMAT_USHORT2N: {
            return 4;
        }
        case SG_VERTEXFORMAT_SHORT4: {
            return 8;
        }
        case SG_VERTEXFORMAT_SHORT4N: {
            return 8;
        }
        case SG_VERTEXFORMAT_USHORT4: {
            return 8;
        }
        case SG_VERTEXFORMAT_USHORT4N: {
            return 8;
        }
        case SG_VERTEXFORMAT_INT10_N2: {
            return 4;
        }
        case SG_VERTEXFORMAT_UINT10_N2: {
            return 4;
        }
        case SG_VERTEXFORMAT_HALF2: {
            return 4;
        }
        case SG_VERTEXFORMAT_HALF4: {
            return 8;
        }
        case SG_VERTEXFORMAT_INVALID: {
            return 0;
        }
        default: {
            assert(cast(i64, false));
            return -1;
        }
    }
}

u8* _sg_vertexformat_to_string(sg_vertex_format fmt) {
    switch fmt {
        case SG_VERTEXFORMAT_FLOAT: {
            return "FLOAT";
        }
        case SG_VERTEXFORMAT_FLOAT2: {
            return "FLOAT2";
        }
        case SG_VERTEXFORMAT_FLOAT3: {
            return "FLOAT3";
        }
        case SG_VERTEXFORMAT_FLOAT4: {
            return "FLOAT4";
        }
        case SG_VERTEXFORMAT_INT: {
            return "INT";
        }
        case SG_VERTEXFORMAT_INT2: {
            return "INT2";
        }
        case SG_VERTEXFORMAT_INT3: {
            return "INT3";
        }
        case SG_VERTEXFORMAT_INT4: {
            return "INT4";
        }
        case SG_VERTEXFORMAT_UINT: {
            return "UINT";
        }
        case SG_VERTEXFORMAT_UINT2: {
            return "UINT2";
        }
        case SG_VERTEXFORMAT_UINT3: {
            return "UINT3";
        }
        case SG_VERTEXFORMAT_UINT4: {
            return "UINT4";
        }
        case SG_VERTEXFORMAT_BYTE4: {
            return "BYTE4";
        }
        case SG_VERTEXFORMAT_BYTE4N: {
            return "BYTE4N";
        }
        case SG_VERTEXFORMAT_UBYTE4: {
            return "UBYTE4";
        }
        case SG_VERTEXFORMAT_UBYTE4N: {
            return "UBYTE4N";
        }
        case SG_VERTEXFORMAT_SHORT2: {
            return "SHORT2";
        }
        case SG_VERTEXFORMAT_SHORT2N: {
            return "SHORT2N";
        }
        case SG_VERTEXFORMAT_USHORT2: {
            return "USHORT2";
        }
        case SG_VERTEXFORMAT_USHORT2N: {
            return "USHORT2N";
        }
        case SG_VERTEXFORMAT_SHORT4: {
            return "SHORT4";
        }
        case SG_VERTEXFORMAT_SHORT4N: {
            return "SHORT4N";
        }
        case SG_VERTEXFORMAT_USHORT4: {
            return "USHORT4";
        }
        case SG_VERTEXFORMAT_USHORT4N: {
            return "USHORT4N";
        }
        case SG_VERTEXFORMAT_INT10_N2: {
            return "INT10_N2";
        }
        case SG_VERTEXFORMAT_UINT10_N2: {
            return "UINT10_N2";
        }
        case SG_VERTEXFORMAT_HALF2: {
            return "HALF2";
        }
        case SG_VERTEXFORMAT_HALF4: {
            return "HALF4";
        }
        default: {
            assert(cast(i64, false));
            return "INVALID";
        }
    }
}

u8* _sg_shaderattrbasetype_to_string(sg_shader_attr_base_type b) {
    switch b {
        case SG_SHADERATTRBASETYPE_UNDEFINED: {
            return "UNDEFINED";
        }
        case SG_SHADERATTRBASETYPE_FLOAT: {
            return "FLOAT";
        }
        case SG_SHADERATTRBASETYPE_SINT: {
            return "SINT";
        }
        case SG_SHADERATTRBASETYPE_UINT: {
            return "UINT";
        }
        default: {
            assert(cast(i64, false));
            return "INVALID";
        }
    }
}

sg_shader_attr_base_type _sg_vertexformat_basetype(sg_vertex_format fmt) {
    switch fmt {
        case SG_VERTEXFORMAT_FLOAT, SG_VERTEXFORMAT_FLOAT2, SG_VERTEXFORMAT_FLOAT3, SG_VERTEXFORMAT_FLOAT4, SG_VERTEXFORMAT_HALF2, SG_VERTEXFORMAT_HALF4, SG_VERTEXFORMAT_BYTE4N, SG_VERTEXFORMAT_UBYTE4N, SG_VERTEXFORMAT_SHORT2N, SG_VERTEXFORMAT_USHORT2N, SG_VERTEXFORMAT_SHORT4N, SG_VERTEXFORMAT_USHORT4N, SG_VERTEXFORMAT_INT10_N2, SG_VERTEXFORMAT_UINT10_N2: {
            return SG_SHADERATTRBASETYPE_FLOAT;
        }
        case SG_VERTEXFORMAT_INT, SG_VERTEXFORMAT_INT2, SG_VERTEXFORMAT_INT3, SG_VERTEXFORMAT_INT4, SG_VERTEXFORMAT_BYTE4, SG_VERTEXFORMAT_SHORT2, SG_VERTEXFORMAT_SHORT4: {
            return SG_SHADERATTRBASETYPE_SINT;
        }
        case SG_VERTEXFORMAT_UINT, SG_VERTEXFORMAT_UINT2, SG_VERTEXFORMAT_UINT3, SG_VERTEXFORMAT_UINT4, SG_VERTEXFORMAT_UBYTE4, SG_VERTEXFORMAT_USHORT2, SG_VERTEXFORMAT_USHORT4: {
            return SG_SHADERATTRBASETYPE_UINT;
        }
        default: {
            assert(cast(i64, false));
            return SG_SHADERATTRBASETYPE_UNDEFINED;
        }
    }
}

u32 _sg_uniform_alignment(sg_uniform_type type, i32 array_count, sg_uniform_layout ub_layout) {
    if ub_layout == SG_UNIFORMLAYOUT_NATIVE {
        return 1;
    } else {
        assert(array_count > 0);
        if array_count == 1 {
            switch type {
                case SG_UNIFORMTYPE_FLOAT, SG_UNIFORMTYPE_INT: {
                    return 4;
                }
                case SG_UNIFORMTYPE_FLOAT2, SG_UNIFORMTYPE_INT2: {
                    return 8;
                }
                case SG_UNIFORMTYPE_FLOAT3, SG_UNIFORMTYPE_FLOAT4, SG_UNIFORMTYPE_INT3, SG_UNIFORMTYPE_INT4: {
                    return 16;
                }
                case SG_UNIFORMTYPE_MAT4: {
                    return 16;
                }
                default: {
                    assert(cast(i64, false));
                    return 1;
                }
            }
        } else {
            return 16;
        }
    }
}

u32 _sg_uniform_size(sg_uniform_type type, i32 array_count, sg_uniform_layout ub_layout) {
    assert(array_count > 0);
    if array_count == 1 {
        switch type {
            case SG_UNIFORMTYPE_FLOAT, SG_UNIFORMTYPE_INT: {
                return 4;
            }
            case SG_UNIFORMTYPE_FLOAT2, SG_UNIFORMTYPE_INT2: {
                return 8;
            }
            case SG_UNIFORMTYPE_FLOAT3, SG_UNIFORMTYPE_INT3: {
                return 12;
            }
            case SG_UNIFORMTYPE_FLOAT4, SG_UNIFORMTYPE_INT4: {
                return 16;
            }
            case SG_UNIFORMTYPE_MAT4: {
                return 64;
            }
            default: {
                assert(cast(i64, false));
                return 0;
            }
        }
    } else {
        if ub_layout == SG_UNIFORMLAYOUT_NATIVE {
            switch type {
                case SG_UNIFORMTYPE_FLOAT, SG_UNIFORMTYPE_INT: {
                    return 4 * cast(u32, array_count);
                }
                case SG_UNIFORMTYPE_FLOAT2, SG_UNIFORMTYPE_INT2: {
                    return 8 * cast(u32, array_count);
                }
                case SG_UNIFORMTYPE_FLOAT3, SG_UNIFORMTYPE_INT3: {
                    return 12 * cast(u32, array_count);
                }
                case SG_UNIFORMTYPE_FLOAT4, SG_UNIFORMTYPE_INT4: {
                    return 16 * cast(u32, array_count);
                }
                case SG_UNIFORMTYPE_MAT4: {
                    return 64 * cast(u32, array_count);
                }
                default: {
                    assert(cast(i64, false));
                    return 0;
                }
            }
        } else {
            switch type {
                case SG_UNIFORMTYPE_FLOAT, SG_UNIFORMTYPE_FLOAT2, SG_UNIFORMTYPE_FLOAT3, SG_UNIFORMTYPE_FLOAT4, SG_UNIFORMTYPE_INT, SG_UNIFORMTYPE_INT2, SG_UNIFORMTYPE_INT3, SG_UNIFORMTYPE_INT4: {
                    return 16 * cast(u32, array_count);
                }
                case SG_UNIFORMTYPE_MAT4: {
                    return 64 * cast(u32, array_count);
                }
                default: {
                    assert(cast(i64, false));
                    return 0;
                }
            }
        }
    }
}

bool _sg_is_compressed_pixel_format(sg_pixel_format fmt) {
    switch fmt {
        case SG_PIXELFORMAT_BC1_RGBA, SG_PIXELFORMAT_BC2_RGBA, SG_PIXELFORMAT_BC3_RGBA, SG_PIXELFORMAT_BC3_SRGBA, SG_PIXELFORMAT_BC4_R, SG_PIXELFORMAT_BC4_RSN, SG_PIXELFORMAT_BC5_RG, SG_PIXELFORMAT_BC5_RGSN, SG_PIXELFORMAT_BC6H_RGBF, SG_PIXELFORMAT_BC6H_RGBUF, SG_PIXELFORMAT_BC7_RGBA, SG_PIXELFORMAT_BC7_SRGBA, SG_PIXELFORMAT_ETC2_RGB8, SG_PIXELFORMAT_ETC2_SRGB8, SG_PIXELFORMAT_ETC2_RGB8A1, SG_PIXELFORMAT_ETC2_RGBA8, SG_PIXELFORMAT_ETC2_SRGB8A8, SG_PIXELFORMAT_EAC_R11, SG_PIXELFORMAT_EAC_R11SN, SG_PIXELFORMAT_EAC_RG11, SG_PIXELFORMAT_EAC_RG11SN, SG_PIXELFORMAT_ASTC_4x4_RGBA, SG_PIXELFORMAT_ASTC_4x4_SRGBA: {
            return true;
        }
        default: {
            return false;
        }
    }
}

bool _sg_is_valid_attachment_color_format(sg_pixel_format fmt) {
    var fmt_index = cast(i32, fmt);
    assert(fmt_index >= 0 && fmt_index < _SG_PIXELFORMAT_NUM);
    return _sg.formats[fmt_index].render && !_sg.formats[fmt_index].depth;
}

bool _sg_is_valid_attachment_depth_format(sg_pixel_format fmt) {
    var fmt_index = cast(i32, fmt);
    assert(fmt_index >= 0 && fmt_index < _SG_PIXELFORMAT_NUM);
    return _sg.formats[fmt_index].render && _sg.formats[fmt_index].depth;
}

bool _sg_is_valid_storage_image_format(sg_pixel_format fmt) {
    var fmt_index = cast(i32, fmt);
    assert(fmt_index >= 0 && fmt_index < _SG_PIXELFORMAT_NUM);
    return _sg.formats[fmt_index].read || _sg.formats[fmt_index].write;
}

bool _sg_is_depth_or_depth_stencil_format(sg_pixel_format fmt) {
    return SG_PIXELFORMAT_DEPTH == fmt || SG_PIXELFORMAT_DEPTH_STENCIL == fmt;
}

bool _sg_is_depth_stencil_format(sg_pixel_format fmt) {
    return SG_PIXELFORMAT_DEPTH_STENCIL == fmt;
}

bool _sg_is_srgb_format(sg_pixel_format fmt) {
    switch fmt {
        case SG_PIXELFORMAT_SRGB8A8, SG_PIXELFORMAT_SBGR8A8: {
            return true;
        }
        default: {
            return false;
        }
    }
}

i32 _sg_pixelformat_bytesize(sg_pixel_format fmt) {
    switch fmt {
        case SG_PIXELFORMAT_R8, SG_PIXELFORMAT_R8SN, SG_PIXELFORMAT_R8UI, SG_PIXELFORMAT_R8SI: {
            return 1;
        }
        case SG_PIXELFORMAT_R16, SG_PIXELFORMAT_R16SN, SG_PIXELFORMAT_R16UI, SG_PIXELFORMAT_R16SI, SG_PIXELFORMAT_R16F, SG_PIXELFORMAT_RG8, SG_PIXELFORMAT_RG8SN, SG_PIXELFORMAT_RG8UI, SG_PIXELFORMAT_RG8SI: {
            return 2;
        }
        case SG_PIXELFORMAT_R32UI, SG_PIXELFORMAT_R32SI, SG_PIXELFORMAT_R32F, SG_PIXELFORMAT_RG16, SG_PIXELFORMAT_RG16SN, SG_PIXELFORMAT_RG16UI, SG_PIXELFORMAT_RG16SI, SG_PIXELFORMAT_RG16F, SG_PIXELFORMAT_RGBA8, SG_PIXELFORMAT_SRGB8A8, SG_PIXELFORMAT_RGBA8SN, SG_PIXELFORMAT_RGBA8UI, SG_PIXELFORMAT_RGBA8SI, SG_PIXELFORMAT_BGRA8, SG_PIXELFORMAT_SBGR8A8, SG_PIXELFORMAT_RGB10A2, SG_PIXELFORMAT_RG11B10F, SG_PIXELFORMAT_RGB9E5: {
            return 4;
        }
        case SG_PIXELFORMAT_RG32UI, SG_PIXELFORMAT_RG32SI, SG_PIXELFORMAT_RG32F, SG_PIXELFORMAT_RGBA16, SG_PIXELFORMAT_RGBA16SN, SG_PIXELFORMAT_RGBA16UI, SG_PIXELFORMAT_RGBA16SI, SG_PIXELFORMAT_RGBA16F: {
            return 8;
        }
        case SG_PIXELFORMAT_RGBA32UI, SG_PIXELFORMAT_RGBA32SI, SG_PIXELFORMAT_RGBA32F: {
            return 16;
        }
        case SG_PIXELFORMAT_DEPTH, SG_PIXELFORMAT_DEPTH_STENCIL: {
            return 4;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

i32 _sg_block_dim(sg_pixel_format fmt) {
    if _sg_is_compressed_pixel_format(fmt) {
        return 4;
    } else {
        return 1;
    }
}

i32 _sg_block_bytesize(sg_pixel_format fmt) {
    switch fmt {
        case SG_PIXELFORMAT_BC1_RGBA, SG_PIXELFORMAT_BC4_R, SG_PIXELFORMAT_BC4_RSN, SG_PIXELFORMAT_ETC2_RGB8, SG_PIXELFORMAT_ETC2_SRGB8, SG_PIXELFORMAT_ETC2_RGB8A1, SG_PIXELFORMAT_EAC_R11, SG_PIXELFORMAT_EAC_R11SN: {
            return 8;
        }
        case SG_PIXELFORMAT_BC2_RGBA, SG_PIXELFORMAT_BC3_RGBA, SG_PIXELFORMAT_BC3_SRGBA, SG_PIXELFORMAT_BC5_RG, SG_PIXELFORMAT_BC5_RGSN, SG_PIXELFORMAT_BC6H_RGBF, SG_PIXELFORMAT_BC6H_RGBUF, SG_PIXELFORMAT_BC7_RGBA, SG_PIXELFORMAT_BC7_SRGBA, SG_PIXELFORMAT_ETC2_RGBA8, SG_PIXELFORMAT_ETC2_SRGB8A8, SG_PIXELFORMAT_EAC_RG11, SG_PIXELFORMAT_EAC_RG11SN, SG_PIXELFORMAT_ASTC_4x4_RGBA, SG_PIXELFORMAT_ASTC_4x4_SRGBA: {
            return 16;
        }
        default: {
            return _sg_pixelformat_bytesize(fmt);
        }
    }
}

i32 _sg_row_pitch(sg_pixel_format fmt, i32 width, i32 row_align) {
    i32 block_dim = _sg_block_dim(fmt);
    i32 num_blocks_in_row = (width + (block_dim - 1)) / block_dim;
    i32 block_num_bytes = _sg_block_bytesize(fmt);
    i32 pitch = num_blocks_in_row * block_num_bytes;
    pitch = pitch < block_num_bytes ? block_num_bytes : pitch;
    pitch = _sg_roundup_pow2(pitch, row_align);
    return pitch;
}

i32 _sg_num_rows(sg_pixel_format fmt, i32 height) {
    i32 block_dim = _sg_block_dim(fmt);
    i32 num_rows = (height + (block_dim - 1)) / block_dim;
    if num_rows < 1 {
        num_rows = 1;
    }
    return num_rows;
}

i32 _sg_surface_pitch(sg_pixel_format fmt, i32 width, i32 height, i32 row_align) {
    i32 num_rows = _sg_num_rows(fmt, height);
    return num_rows * _sg_row_pitch(fmt, width, row_align);
}

u64 _sg_image_copy_size(sg_pixel_format fmt, i32 bytes_per_row, i32 bytes_per_slice, i32 width, i32 height, i32 num_slices) {
    assert(width > 0 && height > 0 && num_slices > 0);
    var row_bytes = cast(u64, _sg_row_pitch(fmt, width, 1));
    var num_rows = cast(u64, _sg_num_rows(fmt, height));
    return cast(u64, num_slices - 1) * cast(u64, bytes_per_slice) + (num_rows - 1) * cast(u64, bytes_per_row) + row_bytes;
}

void _sg_pixelformat_all(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.filter = true;
    pfi.blend = true;
    pfi.render = true;
    pfi.msaa = true;
}

void _sg_pixelformat_s(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
}

void _sg_pixelformat_sf(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.filter = true;
}

void _sg_pixelformat_sr(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.render = true;
}

void _sg_pixelformat_sfr(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.filter = true;
    pfi.render = true;
}

void _sg_pixelformat_srmd(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.render = true;
    pfi.msaa = true;
    pfi.depth = true;
}

void _sg_pixelformat_srm(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.render = true;
    pfi.msaa = true;
}

void _sg_pixelformat_sfrm(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.filter = true;
    pfi.render = true;
    pfi.msaa = true;
}

void _sg_pixelformat_sbrm(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.blend = true;
    pfi.render = true;
    pfi.msaa = true;
}

void _sg_pixelformat_sbr(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.blend = true;
    pfi.render = true;
}

void _sg_pixelformat_sfbr(_sg_pixelformat_info_t* pfi) {
    pfi.sample = true;
    pfi.filter = true;
    pfi.blend = true;
    pfi.render = true;
}

void _sg_pixelformat_compute_all(_sg_pixelformat_info_t* pfi) {
    pfi.read = true;
    pfi.write = true;
}

void _sg_pixelformat_compute_writeonly(_sg_pixelformat_info_t* pfi) {
    pfi.read = false;
    pfi.write = true;
}

sg_pass_action _sg_pass_action_defaults(sg_pass_action* action) {
    assert(cast(i64, action));
    sg_pass_action res = *action;
    for i32 i = 0; i < SG_MAX_COLOR_ATTACHMENTS; i++ {
        if res.colors[i].load_action == _SG_LOADACTION_DEFAULT {
            res.colors[i].load_action = SG_LOADACTION_CLEAR;
            res.colors[i].clear_value.r = 0.5f;
            res.colors[i].clear_value.g = 0.5f;
            res.colors[i].clear_value.b = 0.5f;
            res.colors[i].clear_value.a = 1.0f;
        }
        if res.colors[i].store_action == _SG_STOREACTION_DEFAULT {
            res.colors[i].store_action = SG_STOREACTION_STORE;
        }
    }
    if res.depth.load_action == _SG_LOADACTION_DEFAULT {
        res.depth.load_action = SG_LOADACTION_CLEAR;
        res.depth.clear_value = 1.0f;
    }
    if res.depth.store_action == _SG_STOREACTION_DEFAULT {
        res.depth.store_action = SG_STOREACTION_DONTCARE;
    }
    if res.stencil.load_action == _SG_LOADACTION_DEFAULT {
        res.stencil.load_action = SG_LOADACTION_CLEAR;
        res.stencil.clear_value = 0;
    }
    if res.stencil.store_action == _SG_STOREACTION_DEFAULT {
        res.stencil.store_action = SG_STOREACTION_DONTCARE;
    }
    return res;
}

u32 _sg_gl_buffer_target(sg_buffer_usage* usg) {
    if usg.vertex_buffer || usg.staging_buffer {
        return GL_ARRAY_BUFFER;
    } else if usg.index_buffer || usg.staging_index_buffer {
        return GL_ELEMENT_ARRAY_BUFFER;
    } else if usg.storage_buffer {
        return 0x90D2;
    } else {
        assert(cast(i64, false));
        return 0;
    }
}

u32 _sg_gl_texture_target(sg_image_type t, i32 sample_count) {
    assert(sample_count == 1);
    ignore sample_count;
    switch t {
        case SG_IMAGETYPE_2D: {
            return GL_TEXTURE_2D;
        }
        case SG_IMAGETYPE_CUBE: {
            return GL_TEXTURE_CUBE_MAP;
        }
        case SG_IMAGETYPE_3D: {
            return GL_TEXTURE_3D;
        }
        case SG_IMAGETYPE_ARRAY: {
            return GL_TEXTURE_2D_ARRAY;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_buffer_usage(sg_buffer_usage* usg) {
    if usg.write_transient {
        return GL_STREAM_DRAW;
    } else if usg.copy_dst {
        return GL_DYNAMIC_COPY;
    } else {
        return GL_STATIC_DRAW;
    }
}

u32 _sg_gl_shader_stage(sg_shader_stage stage) {
    switch stage {
        case SG_SHADERSTAGE_VERTEX: {
            return GL_VERTEX_SHADER;
        }
        case SG_SHADERSTAGE_FRAGMENT: {
            return GL_FRAGMENT_SHADER;
        }
        case SG_SHADERSTAGE_COMPUTE: {
            return 0x91B9;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

i32 _sg_gl_vertexformat_size(sg_vertex_format fmt) {
    switch fmt {
        case SG_VERTEXFORMAT_FLOAT: {
            return 1;
        }
        case SG_VERTEXFORMAT_FLOAT2: {
            return 2;
        }
        case SG_VERTEXFORMAT_FLOAT3: {
            return 3;
        }
        case SG_VERTEXFORMAT_FLOAT4: {
            return 4;
        }
        case SG_VERTEXFORMAT_INT: {
            return 1;
        }
        case SG_VERTEXFORMAT_INT2: {
            return 2;
        }
        case SG_VERTEXFORMAT_INT3: {
            return 3;
        }
        case SG_VERTEXFORMAT_INT4: {
            return 4;
        }
        case SG_VERTEXFORMAT_UINT: {
            return 1;
        }
        case SG_VERTEXFORMAT_UINT2: {
            return 2;
        }
        case SG_VERTEXFORMAT_UINT3: {
            return 3;
        }
        case SG_VERTEXFORMAT_UINT4: {
            return 4;
        }
        case SG_VERTEXFORMAT_BYTE4: {
            return 4;
        }
        case SG_VERTEXFORMAT_BYTE4N: {
            return 4;
        }
        case SG_VERTEXFORMAT_UBYTE4: {
            return 4;
        }
        case SG_VERTEXFORMAT_UBYTE4N: {
            return 4;
        }
        case SG_VERTEXFORMAT_SHORT2: {
            return 2;
        }
        case SG_VERTEXFORMAT_SHORT2N: {
            return 2;
        }
        case SG_VERTEXFORMAT_USHORT2: {
            return 2;
        }
        case SG_VERTEXFORMAT_USHORT2N: {
            return 2;
        }
        case SG_VERTEXFORMAT_SHORT4: {
            return 4;
        }
        case SG_VERTEXFORMAT_SHORT4N: {
            return 4;
        }
        case SG_VERTEXFORMAT_USHORT4: {
            return 4;
        }
        case SG_VERTEXFORMAT_USHORT4N: {
            return 4;
        }
        case SG_VERTEXFORMAT_INT10_N2: {
            return 4;
        }
        case SG_VERTEXFORMAT_UINT10_N2: {
            return 4;
        }
        case SG_VERTEXFORMAT_HALF2: {
            return 2;
        }
        case SG_VERTEXFORMAT_HALF4: {
            return 4;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_vertexformat_type(sg_vertex_format fmt) {
    switch fmt {
        case SG_VERTEXFORMAT_FLOAT, SG_VERTEXFORMAT_FLOAT2, SG_VERTEXFORMAT_FLOAT3, SG_VERTEXFORMAT_FLOAT4: {
            return GL_FLOAT;
        }
        case SG_VERTEXFORMAT_INT, SG_VERTEXFORMAT_INT2, SG_VERTEXFORMAT_INT3, SG_VERTEXFORMAT_INT4: {
            return GL_INT;
        }
        case SG_VERTEXFORMAT_UINT, SG_VERTEXFORMAT_UINT2, SG_VERTEXFORMAT_UINT3, SG_VERTEXFORMAT_UINT4: {
            return GL_UNSIGNED_INT;
        }
        case SG_VERTEXFORMAT_BYTE4, SG_VERTEXFORMAT_BYTE4N: {
            return GL_BYTE;
        }
        case SG_VERTEXFORMAT_UBYTE4, SG_VERTEXFORMAT_UBYTE4N: {
            return GL_UNSIGNED_BYTE;
        }
        case SG_VERTEXFORMAT_SHORT2, SG_VERTEXFORMAT_SHORT2N, SG_VERTEXFORMAT_SHORT4, SG_VERTEXFORMAT_SHORT4N: {
            return GL_SHORT;
        }
        case SG_VERTEXFORMAT_USHORT2, SG_VERTEXFORMAT_USHORT2N, SG_VERTEXFORMAT_USHORT4, SG_VERTEXFORMAT_USHORT4N: {
            return GL_UNSIGNED_SHORT;
        }
        case SG_VERTEXFORMAT_INT10_N2: {
            return GL_INT_2_10_10_10_REV;
        }
        case SG_VERTEXFORMAT_UINT10_N2: {
            return 0x8368;
        }
        case SG_VERTEXFORMAT_HALF2, SG_VERTEXFORMAT_HALF4: {
            return 0x140B;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u8 _sg_gl_vertexformat_normalized(sg_vertex_format fmt) {
    switch fmt {
        case SG_VERTEXFORMAT_BYTE4N, SG_VERTEXFORMAT_UBYTE4N, SG_VERTEXFORMAT_SHORT2N, SG_VERTEXFORMAT_USHORT2N, SG_VERTEXFORMAT_SHORT4N, SG_VERTEXFORMAT_USHORT4N, SG_VERTEXFORMAT_INT10_N2, SG_VERTEXFORMAT_UINT10_N2: {
            return cast(u8, GL_TRUE);
        }
        default: {
            return cast(u8, GL_FALSE);
        }
    }
}

u32 _sg_gl_primitive_type(sg_primitive_type t) {
    switch t {
        case SG_PRIMITIVETYPE_POINTS: {
            return GL_POINTS;
        }
        case SG_PRIMITIVETYPE_LINES: {
            return GL_LINES;
        }
        case SG_PRIMITIVETYPE_LINE_STRIP: {
            return GL_LINE_STRIP;
        }
        case SG_PRIMITIVETYPE_TRIANGLES: {
            return GL_TRIANGLES;
        }
        case SG_PRIMITIVETYPE_TRIANGLE_STRIP: {
            return GL_TRIANGLE_STRIP;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_index_type(sg_index_type t) {
    switch t {
        case SG_INDEXTYPE_NONE: {
            return 0;
        }
        case SG_INDEXTYPE_UINT16: {
            return GL_UNSIGNED_SHORT;
        }
        case SG_INDEXTYPE_UINT32: {
            return GL_UNSIGNED_INT;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_compare_func(sg_compare_func cmp) {
    switch cmp {
        case SG_COMPAREFUNC_NEVER: {
            return GL_NEVER;
        }
        case SG_COMPAREFUNC_LESS: {
            return GL_LESS;
        }
        case SG_COMPAREFUNC_EQUAL: {
            return GL_EQUAL;
        }
        case SG_COMPAREFUNC_LESS_EQUAL: {
            return GL_LEQUAL;
        }
        case SG_COMPAREFUNC_GREATER: {
            return GL_GREATER;
        }
        case SG_COMPAREFUNC_NOT_EQUAL: {
            return GL_NOTEQUAL;
        }
        case SG_COMPAREFUNC_GREATER_EQUAL: {
            return GL_GEQUAL;
        }
        case SG_COMPAREFUNC_ALWAYS: {
            return GL_ALWAYS;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_stencil_op(sg_stencil_op op) {
    switch op {
        case SG_STENCILOP_KEEP: {
            return GL_KEEP;
        }
        case SG_STENCILOP_ZERO: {
            return GL_ZERO;
        }
        case SG_STENCILOP_REPLACE: {
            return GL_REPLACE;
        }
        case SG_STENCILOP_INCR_CLAMP: {
            return GL_INCR;
        }
        case SG_STENCILOP_DECR_CLAMP: {
            return GL_DECR;
        }
        case SG_STENCILOP_INVERT: {
            return GL_INVERT;
        }
        case SG_STENCILOP_INCR_WRAP: {
            return GL_INCR_WRAP;
        }
        case SG_STENCILOP_DECR_WRAP: {
            return GL_DECR_WRAP;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_blend_factor(sg_blend_factor f) {
    switch f {
        case SG_BLENDFACTOR_ZERO: {
            return GL_ZERO;
        }
        case SG_BLENDFACTOR_ONE: {
            return GL_ONE;
        }
        case SG_BLENDFACTOR_SRC_COLOR: {
            return GL_SRC_COLOR;
        }
        case SG_BLENDFACTOR_ONE_MINUS_SRC_COLOR: {
            return GL_ONE_MINUS_SRC_COLOR;
        }
        case SG_BLENDFACTOR_SRC_ALPHA: {
            return GL_SRC_ALPHA;
        }
        case SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA: {
            return GL_ONE_MINUS_SRC_ALPHA;
        }
        case SG_BLENDFACTOR_DST_COLOR: {
            return GL_DST_COLOR;
        }
        case SG_BLENDFACTOR_ONE_MINUS_DST_COLOR: {
            return GL_ONE_MINUS_DST_COLOR;
        }
        case SG_BLENDFACTOR_DST_ALPHA: {
            return GL_DST_ALPHA;
        }
        case SG_BLENDFACTOR_ONE_MINUS_DST_ALPHA: {
            return GL_ONE_MINUS_DST_ALPHA;
        }
        case SG_BLENDFACTOR_SRC_ALPHA_SATURATED: {
            return GL_SRC_ALPHA_SATURATE;
        }
        case SG_BLENDFACTOR_BLEND_COLOR: {
            return GL_CONSTANT_COLOR;
        }
        case SG_BLENDFACTOR_ONE_MINUS_BLEND_COLOR: {
            return GL_ONE_MINUS_CONSTANT_COLOR;
        }
        case SG_BLENDFACTOR_BLEND_ALPHA: {
            return GL_CONSTANT_ALPHA;
        }
        case SG_BLENDFACTOR_ONE_MINUS_BLEND_ALPHA: {
            return GL_ONE_MINUS_CONSTANT_ALPHA;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_blend_op(sg_blend_op op) {
    switch op {
        case SG_BLENDOP_ADD: {
            return GL_FUNC_ADD;
        }
        case SG_BLENDOP_SUBTRACT: {
            return GL_FUNC_SUBTRACT;
        }
        case SG_BLENDOP_REVERSE_SUBTRACT: {
            return GL_FUNC_REVERSE_SUBTRACT;
        }
        case SG_BLENDOP_MIN: {
            return GL_MIN;
        }
        case SG_BLENDOP_MAX: {
            return GL_MAX;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_min_filter(sg_filter min_f, sg_filter mipmap_f) {
    if min_f == SG_FILTER_NEAREST {
        switch mipmap_f {
            case SG_FILTER_NEAREST: {
                return GL_NEAREST_MIPMAP_NEAREST;
            }
            case SG_FILTER_LINEAR: {
                return GL_NEAREST_MIPMAP_LINEAR;
            }
            default: {
                assert(cast(i64, false));
                return cast(u32, 0);
            }
        }
    } else if min_f == SG_FILTER_LINEAR {
        switch mipmap_f {
            case SG_FILTER_NEAREST: {
                return GL_LINEAR_MIPMAP_NEAREST;
            }
            case SG_FILTER_LINEAR: {
                return GL_LINEAR_MIPMAP_LINEAR;
            }
            default: {
                assert(cast(i64, false));
                return cast(u32, 0);
            }
        }
    } else {
        assert(cast(i64, false));
        return cast(u32, 0);
    }
}

u32 _sg_gl_mag_filter(sg_filter mag_f) {
    if mag_f == SG_FILTER_NEAREST {
        return GL_NEAREST;
    } else {
        return GL_LINEAR;
    }
}

u32 _sg_gl_wrap(sg_wrap w) {
    switch w {
        case SG_WRAP_CLAMP_TO_EDGE: {
            return GL_CLAMP_TO_EDGE;
        }
        case SG_WRAP_CLAMP_TO_BORDER: {
            return GL_CLAMP_TO_EDGE;
        }
        case SG_WRAP_REPEAT: {
            return GL_REPEAT;
        }
        case SG_WRAP_MIRRORED_REPEAT: {
            return GL_MIRRORED_REPEAT;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_teximage_type(sg_pixel_format fmt) {
    switch fmt {
        case SG_PIXELFORMAT_R8, SG_PIXELFORMAT_R8UI, SG_PIXELFORMAT_RG8, SG_PIXELFORMAT_RG8UI, SG_PIXELFORMAT_RGBA8, SG_PIXELFORMAT_SRGB8A8, SG_PIXELFORMAT_RGBA8UI, SG_PIXELFORMAT_BGRA8: {
            return GL_UNSIGNED_BYTE;
        }
        case SG_PIXELFORMAT_R8SN, SG_PIXELFORMAT_R8SI, SG_PIXELFORMAT_RG8SN, SG_PIXELFORMAT_RG8SI, SG_PIXELFORMAT_RGBA8SN, SG_PIXELFORMAT_RGBA8SI: {
            return GL_BYTE;
        }
        case SG_PIXELFORMAT_R16, SG_PIXELFORMAT_R16UI, SG_PIXELFORMAT_RG16, SG_PIXELFORMAT_RG16UI, SG_PIXELFORMAT_RGBA16, SG_PIXELFORMAT_RGBA16UI: {
            return GL_UNSIGNED_SHORT;
        }
        case SG_PIXELFORMAT_R16SN, SG_PIXELFORMAT_R16SI, SG_PIXELFORMAT_RG16SN, SG_PIXELFORMAT_RG16SI, SG_PIXELFORMAT_RGBA16SN, SG_PIXELFORMAT_RGBA16SI: {
            return GL_SHORT;
        }
        case SG_PIXELFORMAT_R16F, SG_PIXELFORMAT_RG16F, SG_PIXELFORMAT_RGBA16F: {
            return 0x140B;
        }
        case SG_PIXELFORMAT_R32UI, SG_PIXELFORMAT_RG32UI, SG_PIXELFORMAT_RGBA32UI: {
            return GL_UNSIGNED_INT;
        }
        case SG_PIXELFORMAT_R32SI, SG_PIXELFORMAT_RG32SI, SG_PIXELFORMAT_RGBA32SI: {
            return GL_INT;
        }
        case SG_PIXELFORMAT_R32F, SG_PIXELFORMAT_RG32F, SG_PIXELFORMAT_RGBA32F: {
            return GL_FLOAT;
        }
        case SG_PIXELFORMAT_RGB10A2: {
            return 0x8368;
        }
        case SG_PIXELFORMAT_RG11B10F: {
            return GL_UNSIGNED_INT_10F_11F_11F_REV;
        }
        case SG_PIXELFORMAT_RGB9E5: {
            return GL_UNSIGNED_INT_5_9_9_9_REV;
        }
        case SG_PIXELFORMAT_DEPTH: {
            return GL_FLOAT;
        }
        case SG_PIXELFORMAT_DEPTH_STENCIL: {
            return GL_FLOAT_32_UNSIGNED_INT_24_8_REV;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_teximage_format(sg_pixel_format fmt) {
    switch fmt {
        case SG_PIXELFORMAT_R8, SG_PIXELFORMAT_R8SN, SG_PIXELFORMAT_R16, SG_PIXELFORMAT_R16SN, SG_PIXELFORMAT_R16F, SG_PIXELFORMAT_R32F: {
            return GL_RED;
        }
        case SG_PIXELFORMAT_R8UI, SG_PIXELFORMAT_R8SI, SG_PIXELFORMAT_R16UI, SG_PIXELFORMAT_R16SI, SG_PIXELFORMAT_R32UI, SG_PIXELFORMAT_R32SI: {
            return GL_RED_INTEGER;
        }
        case SG_PIXELFORMAT_RG8, SG_PIXELFORMAT_RG8SN, SG_PIXELFORMAT_RG16, SG_PIXELFORMAT_RG16SN, SG_PIXELFORMAT_RG16F, SG_PIXELFORMAT_RG32F: {
            return GL_RG;
        }
        case SG_PIXELFORMAT_RG8UI, SG_PIXELFORMAT_RG8SI, SG_PIXELFORMAT_RG16UI, SG_PIXELFORMAT_RG16SI, SG_PIXELFORMAT_RG32UI, SG_PIXELFORMAT_RG32SI: {
            return GL_RG_INTEGER;
        }
        case SG_PIXELFORMAT_RGBA8, SG_PIXELFORMAT_SRGB8A8, SG_PIXELFORMAT_RGBA8SN, SG_PIXELFORMAT_RGBA16, SG_PIXELFORMAT_RGBA16SN, SG_PIXELFORMAT_RGBA16F, SG_PIXELFORMAT_RGBA32F, SG_PIXELFORMAT_RGB10A2: {
            return GL_RGBA;
        }
        case SG_PIXELFORMAT_RGBA8UI, SG_PIXELFORMAT_RGBA8SI, SG_PIXELFORMAT_RGBA16UI, SG_PIXELFORMAT_RGBA16SI, SG_PIXELFORMAT_RGBA32UI, SG_PIXELFORMAT_RGBA32SI: {
            return GL_RGBA_INTEGER;
        }
        case SG_PIXELFORMAT_RG11B10F, SG_PIXELFORMAT_RGB9E5: {
            return GL_RGB;
        }
        case SG_PIXELFORMAT_DEPTH: {
            return GL_DEPTH_COMPONENT;
        }
        case SG_PIXELFORMAT_DEPTH_STENCIL: {
            return 0x84F9;
        }
        case SG_PIXELFORMAT_BC1_RGBA: {
            return 0x83F1;
        }
        case SG_PIXELFORMAT_BC2_RGBA: {
            return 0x83F2;
        }
        case SG_PIXELFORMAT_BC3_RGBA: {
            return 0x83F3;
        }
        case SG_PIXELFORMAT_BC3_SRGBA: {
            return 0x8C4F;
        }
        case SG_PIXELFORMAT_BC4_R: {
            return 0x8DBB;
        }
        case SG_PIXELFORMAT_BC4_RSN: {
            return 0x8DBC;
        }
        case SG_PIXELFORMAT_BC5_RG: {
            return 0x8DBD;
        }
        case SG_PIXELFORMAT_BC5_RGSN: {
            return 0x8DBE;
        }
        case SG_PIXELFORMAT_BC6H_RGBF: {
            return 0x8E8E;
        }
        case SG_PIXELFORMAT_BC6H_RGBUF: {
            return 0x8E8F;
        }
        case SG_PIXELFORMAT_BC7_RGBA: {
            return 0x8E8C;
        }
        case SG_PIXELFORMAT_BC7_SRGBA: {
            return 0x8E8D;
        }
        case SG_PIXELFORMAT_ETC2_RGB8: {
            return 0x9274;
        }
        case SG_PIXELFORMAT_ETC2_SRGB8: {
            return 0x9275;
        }
        case SG_PIXELFORMAT_ETC2_RGB8A1: {
            return 0x9276;
        }
        case SG_PIXELFORMAT_ETC2_RGBA8: {
            return 0x9278;
        }
        case SG_PIXELFORMAT_ETC2_SRGB8A8: {
            return 0x9279;
        }
        case SG_PIXELFORMAT_EAC_R11: {
            return 0x9270;
        }
        case SG_PIXELFORMAT_EAC_R11SN: {
            return 0x9271;
        }
        case SG_PIXELFORMAT_EAC_RG11: {
            return 0x9272;
        }
        case SG_PIXELFORMAT_EAC_RG11SN: {
            return 0x9273;
        }
        case SG_PIXELFORMAT_ASTC_4x4_RGBA: {
            return 0x93B0;
        }
        case SG_PIXELFORMAT_ASTC_4x4_SRGBA: {
            return 0x93D0;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_teximage_internal_format(sg_pixel_format fmt) {
    switch fmt {
        case SG_PIXELFORMAT_R8: {
            return GL_R8;
        }
        case SG_PIXELFORMAT_R8SN: {
            return GL_R8_SNORM;
        }
        case SG_PIXELFORMAT_R8UI: {
            return GL_R8UI;
        }
        case SG_PIXELFORMAT_R8SI: {
            return GL_R8I;
        }
        case SG_PIXELFORMAT_R16UI: {
            return GL_R16UI;
        }
        case SG_PIXELFORMAT_R16SI: {
            return GL_R16I;
        }
        case SG_PIXELFORMAT_R16F: {
            return GL_R16F;
        }
        case SG_PIXELFORMAT_RG8: {
            return GL_RG8;
        }
        case SG_PIXELFORMAT_RG8SN: {
            return GL_RG8_SNORM;
        }
        case SG_PIXELFORMAT_RG8UI: {
            return GL_RG8UI;
        }
        case SG_PIXELFORMAT_RG8SI: {
            return GL_RG8I;
        }
        case SG_PIXELFORMAT_R32UI: {
            return GL_R32UI;
        }
        case SG_PIXELFORMAT_R32SI: {
            return GL_R32I;
        }
        case SG_PIXELFORMAT_R32F: {
            return GL_R32F;
        }
        case SG_PIXELFORMAT_RG16UI: {
            return GL_RG16UI;
        }
        case SG_PIXELFORMAT_RG16SI: {
            return GL_RG16I;
        }
        case SG_PIXELFORMAT_RG16F: {
            return GL_RG16F;
        }
        case SG_PIXELFORMAT_RGBA8: {
            return GL_RGBA8;
        }
        case SG_PIXELFORMAT_SRGB8A8: {
            return GL_SRGB8_ALPHA8;
        }
        case SG_PIXELFORMAT_RGBA8SN: {
            return GL_RGBA8_SNORM;
        }
        case SG_PIXELFORMAT_RGBA8UI: {
            return GL_RGBA8UI;
        }
        case SG_PIXELFORMAT_RGBA8SI: {
            return GL_RGBA8I;
        }
        case SG_PIXELFORMAT_RGB10A2: {
            return GL_RGB10_A2;
        }
        case SG_PIXELFORMAT_RG11B10F: {
            return GL_R11F_G11F_B10F;
        }
        case SG_PIXELFORMAT_RGB9E5: {
            return GL_RGB9_E5;
        }
        case SG_PIXELFORMAT_RG32UI: {
            return GL_RG32UI;
        }
        case SG_PIXELFORMAT_RG32SI: {
            return GL_RG32I;
        }
        case SG_PIXELFORMAT_RG32F: {
            return GL_RG32F;
        }
        case SG_PIXELFORMAT_RGBA16UI: {
            return GL_RGBA16UI;
        }
        case SG_PIXELFORMAT_RGBA16SI: {
            return GL_RGBA16I;
        }
        case SG_PIXELFORMAT_RGBA16F: {
            return GL_RGBA16F;
        }
        case SG_PIXELFORMAT_RGBA32UI: {
            return GL_RGBA32UI;
        }
        case SG_PIXELFORMAT_RGBA32SI: {
            return GL_RGBA32I;
        }
        case SG_PIXELFORMAT_RGBA32F: {
            return GL_RGBA32F;
        }
        case SG_PIXELFORMAT_DEPTH: {
            return GL_DEPTH_COMPONENT32F;
        }
        case SG_PIXELFORMAT_DEPTH_STENCIL: {
            return GL_DEPTH32F_STENCIL8;
        }
        case SG_PIXELFORMAT_BC1_RGBA: {
            return 0x83F1;
        }
        case SG_PIXELFORMAT_BC2_RGBA: {
            return 0x83F2;
        }
        case SG_PIXELFORMAT_BC3_RGBA: {
            return 0x83F3;
        }
        case SG_PIXELFORMAT_BC3_SRGBA: {
            return 0x8C4F;
        }
        case SG_PIXELFORMAT_BC4_R: {
            return 0x8DBB;
        }
        case SG_PIXELFORMAT_BC4_RSN: {
            return 0x8DBC;
        }
        case SG_PIXELFORMAT_BC5_RG: {
            return 0x8DBD;
        }
        case SG_PIXELFORMAT_BC5_RGSN: {
            return 0x8DBE;
        }
        case SG_PIXELFORMAT_BC6H_RGBF: {
            return 0x8E8E;
        }
        case SG_PIXELFORMAT_BC6H_RGBUF: {
            return 0x8E8F;
        }
        case SG_PIXELFORMAT_BC7_RGBA: {
            return 0x8E8C;
        }
        case SG_PIXELFORMAT_BC7_SRGBA: {
            return 0x8E8D;
        }
        case SG_PIXELFORMAT_ETC2_RGB8: {
            return 0x9274;
        }
        case SG_PIXELFORMAT_ETC2_SRGB8: {
            return 0x9275;
        }
        case SG_PIXELFORMAT_ETC2_RGB8A1: {
            return 0x9276;
        }
        case SG_PIXELFORMAT_ETC2_RGBA8: {
            return 0x9278;
        }
        case SG_PIXELFORMAT_ETC2_SRGB8A8: {
            return 0x9279;
        }
        case SG_PIXELFORMAT_EAC_R11: {
            return 0x9270;
        }
        case SG_PIXELFORMAT_EAC_R11SN: {
            return 0x9271;
        }
        case SG_PIXELFORMAT_EAC_RG11: {
            return 0x9272;
        }
        case SG_PIXELFORMAT_EAC_RG11SN: {
            return 0x9273;
        }
        case SG_PIXELFORMAT_ASTC_4x4_RGBA: {
            return 0x93B0;
        }
        case SG_PIXELFORMAT_ASTC_4x4_SRGBA: {
            return 0x93D0;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

u32 _sg_gl_cubeface_target(i32 face_index) {
    switch face_index {
        case 0: {
            return GL_TEXTURE_CUBE_MAP_POSITIVE_X;
        }
        case 1: {
            return GL_TEXTURE_CUBE_MAP_NEGATIVE_X;
        }
        case 2: {
            return GL_TEXTURE_CUBE_MAP_POSITIVE_Y;
        }
        case 3: {
            return GL_TEXTURE_CUBE_MAP_NEGATIVE_Y;
        }
        case 4: {
            return GL_TEXTURE_CUBE_MAP_POSITIVE_Z;
        }
        case 5: {
            return GL_TEXTURE_CUBE_MAP_NEGATIVE_Z;
        }
        default: {
            assert(cast(i64, false));
            return 0;
        }
    }
}

void _sg_gl_init_pixelformats(bool has_bgra) {
    _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_R8]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_R8SN]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_R8UI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_R8SI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_R16UI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_R16SI]);
    _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_RG8]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_RG8SN]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RG8UI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RG8SI]);
    _sg_pixelformat_sr(&_sg.formats[SG_PIXELFORMAT_R32UI]);
    _sg_pixelformat_sr(&_sg.formats[SG_PIXELFORMAT_R32SI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RG16UI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RG16SI]);
    _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_RGBA8]);
    _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_SRGB8A8]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_RGBA8SN]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RGBA8UI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RGBA8SI]);
    if has_bgra {
        _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_BGRA8]);
        _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_SBGR8A8]);
    }
    _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_RGB10A2]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_RGB9E5]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RG32UI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RG32SI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RGBA16UI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RGBA16SI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RGBA32UI]);
    _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RGBA32SI]);
    _sg_pixelformat_srmd(&_sg.formats[SG_PIXELFORMAT_DEPTH]);
    _sg_pixelformat_srmd(&_sg.formats[SG_PIXELFORMAT_DEPTH_STENCIL]);
}

void _sg_gl_init_pixelformats_half_float(bool has_colorbuffer_half_float) {
    if has_colorbuffer_half_float {
        _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_R16F]);
        _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_RG16F]);
        _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_RGBA16F]);
    } else {
        _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_R16F]);
        _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_RG16F]);
        _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_RGBA16F]);
    }
}

void _sg_gl_init_pixelformats_float(bool has_colorbuffer_float, bool has_texture_float_linear, bool has_float_blend) {
    if has_texture_float_linear {
        if has_colorbuffer_float {
            if has_float_blend {
                _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_R32F]);
                _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_RG32F]);
                _sg_pixelformat_all(&_sg.formats[SG_PIXELFORMAT_RGBA32F]);
            } else {
                _sg_pixelformat_sfrm(&_sg.formats[SG_PIXELFORMAT_R32F]);
                _sg_pixelformat_sfrm(&_sg.formats[SG_PIXELFORMAT_RG32F]);
                _sg_pixelformat_sfrm(&_sg.formats[SG_PIXELFORMAT_RGBA32F]);
            }
            _sg_pixelformat_sfrm(&_sg.formats[SG_PIXELFORMAT_RG11B10F]);
        } else {
            _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_R32F]);
            _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_RG32F]);
            _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_RGBA32F]);
            _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_RG11B10F]);
        }
    } else {
        if has_colorbuffer_float {
            _sg_pixelformat_sbrm(&_sg.formats[SG_PIXELFORMAT_R32F]);
            _sg_pixelformat_sbrm(&_sg.formats[SG_PIXELFORMAT_RG32F]);
            _sg_pixelformat_sbrm(&_sg.formats[SG_PIXELFORMAT_RGBA32F]);
            _sg_pixelformat_srm(&_sg.formats[SG_PIXELFORMAT_RG11B10F]);
        } else {
            _sg_pixelformat_s(&_sg.formats[SG_PIXELFORMAT_R32F]);
            _sg_pixelformat_s(&_sg.formats[SG_PIXELFORMAT_RG32F]);
            _sg_pixelformat_s(&_sg.formats[SG_PIXELFORMAT_RGBA32F]);
            _sg_pixelformat_s(&_sg.formats[SG_PIXELFORMAT_RG11B10F]);
        }
    }
}

void _sg_gl_init_pixelformats_s3tc() {
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC1_RGBA]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC2_RGBA]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC3_RGBA]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC3_SRGBA]);
}

void _sg_gl_init_pixelformats_rgtc() {
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC4_R]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC4_RSN]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC5_RG]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC5_RGSN]);
}

void _sg_gl_init_pixelformats_bptc() {
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC6H_RGBF]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC6H_RGBUF]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC7_RGBA]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_BC7_SRGBA]);
}

void _sg_gl_init_pixelformats_etc2() {
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_ETC2_RGB8]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_ETC2_SRGB8]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_ETC2_RGB8A1]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_ETC2_RGBA8]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_ETC2_SRGB8A8]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_EAC_R11]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_EAC_R11SN]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_EAC_RG11]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_EAC_RG11SN]);
}

void _sg_gl_init_pixelformats_astc() {
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_ASTC_4x4_RGBA]);
    _sg_pixelformat_sf(&_sg.formats[SG_PIXELFORMAT_ASTC_4x4_SRGBA]);
}

void _sg_gl_init_limits() {
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    i32 gl_int;
    glGetIntegerv(GL_MAX_TEXTURE_SIZE, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.max_image_size_2d = gl_int;
    _sg.limits.max_image_size_array = gl_int;
    glGetIntegerv(GL_MAX_CUBE_MAP_TEXTURE_SIZE, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.max_image_size_cube = gl_int;
    glGetIntegerv(GL_MAX_3D_TEXTURE_SIZE, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.max_image_size_3d = gl_int;
    glGetIntegerv(GL_MAX_ARRAY_TEXTURE_LAYERS, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.max_image_array_layers = gl_int;
    glGetIntegerv(GL_MAX_VERTEX_ATTRIBS, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.max_vertex_attrs = gl_int < cast(i32, SG_MAX_VERTEX_ATTRIBUTES) ? gl_int : cast(i32, SG_MAX_VERTEX_ATTRIBUTES);
    glGetIntegerv(GL_MAX_DRAW_BUFFERS, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.max_color_attachments = gl_int < cast(i32, SG_MAX_COLOR_ATTACHMENTS) ? gl_int : cast(i32, SG_MAX_COLOR_ATTACHMENTS);
    glGetIntegerv(GL_MAX_TEXTURE_IMAGE_UNITS, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.max_texture_bindings_per_stage = gl_int < cast(i32, SG_MAX_VIEW_BINDSLOTS) ? gl_int : cast(i32, SG_MAX_VIEW_BINDSLOTS);
    glGetIntegerv(GL_MAX_VERTEX_UNIFORM_COMPONENTS, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.gl_max_vertex_uniform_components = gl_int;
    if _sg.gl.ext_anisotropic {
        glGetIntegerv(0x84FF, &gl_int);
        when !(arch(wasm)) && defined(SOKOL_DEBUG) {
            {
                assert(glGetError() == GL_NO_ERROR);
            }
        }
        _sg.gl.max_anisotropy = gl_int;
    } else {
        _sg.gl.max_anisotropy = 1;
    }
    glGetIntegerv(GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS, &gl_int);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.limits.gl_max_combined_texture_image_units = gl_int;
}

void _sg_gl_init_caps_gles3() {
    _sg.backend = SG_BACKEND_GLES3;
    i32 major_version = 0;
    i32 minor_version = 0;
    glGetIntegerv(GL_MAJOR_VERSION, &major_version);
    glGetIntegerv(GL_MINOR_VERSION, &minor_version);
    i32 version = major_version * 100 + minor_version * 10;
    _sg.features.origin_top_left = false;
    _sg.features.image_clamp_to_border = false;
    _sg.features.mrt_independent_blend_state = false;
    _sg.features.mrt_independent_write_mask = false;
    _sg.features.compute = version >= 310;
    _sg.features.msaa_texture_bindings = false;
    _sg.features.gl_texture_views = version >= 430;
    _sg.features.separate_buffer_types = true;
    _sg.features.draw_base_vertex = version >= 320;
    _sg.features.draw_base_instance = false;
    _sg.features.dual_source_blending = false;
    _sg.features.vertexformat_int10_n2 = true;
    _sg.features.copy_buffer_to_image_relaxed_buffer_type = true;
    _sg.features.copy_buffer_to_image_relaxed_bytes_per_row = true;
    bool has_s3tc = false;
    bool has_rgtc = false;
    bool has_bptc = false;
    bool has_etc2 = false;
    bool has_astc = false;
    bool has_colorbuffer_float = false;
    bool has_colorbuffer_half_float = false;
    bool has_texture_float_linear = false;
    bool has_float_blend = false;
    i32 num_ext = 0;
    glGetIntegerv(GL_NUM_EXTENSIONS, &num_ext);
    for i32 i = 0; i < num_ext; i++ {
        var ext = cast(u8*, glGetStringi(GL_EXTENSIONS, cast(u32, i)));
        if ext != null {
            if strstr(ext, "_texture_compression_s3tc") != null {
                has_s3tc = true;
            } else if strstr(ext, "_compressed_texture_s3tc") != null {
                has_s3tc = true;
            } else if strstr(ext, "_texture_compression_rgtc") != null {
                has_rgtc = true;
            } else if strstr(ext, "_texture_compression_bptc") != null {
                has_bptc = true;
            } else if strstr(ext, "_compressed_texture_etc") != null {
                has_etc2 = true;
            } else if strstr(ext, "_compressed_texture_astc") != null {
                has_astc = true;
            } else if strstr(ext, "_color_buffer_float") != null {
                has_colorbuffer_float = true;
            } else if strstr(ext, "_color_buffer_half_float") != null {
                has_colorbuffer_half_float = true;
            } else if strstr(ext, "_texture_float_linear") != null {
                has_texture_float_linear = true;
            } else if strstr(ext, "_float_blend") != null {
                has_float_blend = true;
            } else if strstr(ext, "_texture_filter_anisotropic") != null {
                _sg.gl.ext_anisotropic = true;
            }
        }
    }
    if !has_colorbuffer_half_float && has_colorbuffer_float {
        has_colorbuffer_half_float = has_colorbuffer_float;
    }
    _sg_gl_init_limits();
    bool has_bgra = false;
    _sg_gl_init_pixelformats(has_bgra);
    _sg_gl_init_pixelformats_float(has_colorbuffer_float, has_texture_float_linear, has_float_blend);
    _sg_gl_init_pixelformats_half_float(has_colorbuffer_half_float);
    if has_s3tc {
        _sg_gl_init_pixelformats_s3tc();
    }
    if has_rgtc {
        _sg_gl_init_pixelformats_rgtc();
    }
    if has_bptc {
        _sg_gl_init_pixelformats_bptc();
    }
    if has_etc2 {
        _sg_gl_init_pixelformats_etc2();
    }
    if has_astc {
        _sg_gl_init_pixelformats_astc();
    }
    if _sg.features.compute {
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA32F]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA16F]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_R32F]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA32UI]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA16UI]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA8UI]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_R32UI]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA32SI]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA16SI]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA8SI]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_R32SI]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA8]);
        _sg_pixelformat_compute_all(&_sg.formats[SG_PIXELFORMAT_RGBA8SN]);
    }
}

void _sg_gl_cache_clear_buffer_bindings(bool force) {
    if force || _sg.gl.cache.vertex_buffer != 0 {
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        _sg.gl.cache.vertex_buffer = 0;
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_bind_buffer++;
            }
        }
    }
    if force || _sg.gl.cache.index_buffer != 0 {
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
        _sg.gl.cache.index_buffer = 0;
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_bind_buffer++;
            }
        }
    }
    if force || _sg.gl.cache.storage_buffer != 0 {
        if _sg.features.compute {
            glBindBuffer(0x90D2, 0);
        }
        _sg.gl.cache.storage_buffer = 0;
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_bind_buffer++;
            }
        }
    }
    for i32 i = 0; i < _SG_MAX_STORAGEBUFFER_BINDINGS_PER_STAGE; i++ {
        if force || _sg.gl.cache.storage_buffers[i] != 0 {
            if _sg.features.compute && i < _sg.limits.max_storage_buffer_bindings_per_stage {
                glBindBufferBase(0x90D2, cast(u32, i), 0);
            }
            _sg.gl.cache.storage_buffers[i] = 0;
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_buffer++;
                }
            }
        }
    }
}

void _sg_gl_cache_bind_buffer(u32 target, u32 buffer) {
    assert(GL_ARRAY_BUFFER == target || GL_ELEMENT_ARRAY_BUFFER == target || 0x90D2 == target);
    if target == GL_ARRAY_BUFFER {
        if _sg.gl.cache.vertex_buffer != buffer {
            _sg.gl.cache.vertex_buffer = buffer;
            glBindBuffer(target, buffer);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_buffer++;
                }
            }
        }
    } else if target == GL_ELEMENT_ARRAY_BUFFER {
        if _sg.gl.cache.index_buffer != buffer {
            _sg.gl.cache.index_buffer = buffer;
            glBindBuffer(target, buffer);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_buffer++;
                }
            }
        }
    } else if target == 0x90D2 {
        if _sg.gl.cache.storage_buffer != buffer {
            _sg.gl.cache.storage_buffer = buffer;
            if _sg.features.compute {
                glBindBuffer(target, buffer);
            }
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_buffer++;
                }
            }
        }
    } else {
        assert(cast(i64, false));
    }
}

void _sg_gl_cache_bind_storage_buffer(u8 glsl_binding_n, u32 buffer, i32 offset, i32 buf_size) {
    assert(cast(i32, glsl_binding_n) < _SG_MAX_STORAGEBUFFER_BINDINGS_PER_STAGE);
    assert(offset < buf_size);
    bool buf_neql = _sg.gl.cache.storage_buffers[glsl_binding_n] != buffer;
    bool off_neql = _sg.gl.cache.storage_buffer_offsets[glsl_binding_n] != offset;
    if buf_neql || off_neql {
        _sg.gl.cache.storage_buffers[glsl_binding_n] = buffer;
        _sg.gl.cache.storage_buffer_offsets[glsl_binding_n] = offset;
        _sg.gl.cache.storage_buffer = buffer;
        if _sg.features.compute {
            assert(cast(i32, glsl_binding_n) < _sg.limits.max_storage_buffer_bindings_per_stage);
            glBindBufferRange(0x90D2, glsl_binding_n, buffer, offset, buf_size - offset);
        }
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_bind_buffer++;
            }
        }
    }
}

void _sg_gl_cache_store_buffer_binding(u32 target) {
    if target == GL_ARRAY_BUFFER {
        _sg.gl.cache.stored_vertex_buffer = _sg.gl.cache.vertex_buffer;
    } else if target == GL_ELEMENT_ARRAY_BUFFER {
        _sg.gl.cache.stored_index_buffer = _sg.gl.cache.index_buffer;
    } else if target == 0x90D2 {
        _sg.gl.cache.stored_storage_buffer = _sg.gl.cache.storage_buffer;
    } else {
        assert(cast(i64, false));
    }
}

void _sg_gl_cache_restore_buffer_binding(u32 target) {
    if target == GL_ARRAY_BUFFER {
        if _sg.gl.cache.stored_vertex_buffer != 0 {
            _sg_gl_cache_bind_buffer(target, _sg.gl.cache.stored_vertex_buffer);
            _sg.gl.cache.stored_vertex_buffer = 0;
        }
    } else if target == GL_ELEMENT_ARRAY_BUFFER {
        if _sg.gl.cache.stored_index_buffer != 0 {
            _sg_gl_cache_bind_buffer(target, _sg.gl.cache.stored_index_buffer);
            _sg.gl.cache.stored_index_buffer = 0;
        }
    } else if target == 0x90D2 {
        if _sg.gl.cache.stored_storage_buffer != 0 {
            _sg_gl_cache_bind_buffer(target, _sg.gl.cache.stored_storage_buffer);
            _sg.gl.cache.stored_storage_buffer = 0;
        }
    } else {
        assert(cast(i64, false));
    }
}

void _sg_gl_cache_invalidate_buffer(u32 buf) {
    if buf == _sg.gl.cache.vertex_buffer {
        _sg.gl.cache.vertex_buffer = 0;
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_bind_buffer++;
            }
        }
    }
    if buf == _sg.gl.cache.index_buffer {
        _sg.gl.cache.index_buffer = 0;
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_bind_buffer++;
            }
        }
    }
    if buf == _sg.gl.cache.storage_buffer {
        _sg.gl.cache.storage_buffer = 0;
        glBindBuffer(0x90D2, 0);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_bind_buffer++;
            }
        }
    }
    for i32 i = 0; i < _SG_MAX_STORAGEBUFFER_BINDINGS_PER_STAGE; i++ {
        if buf == _sg.gl.cache.storage_buffers[i] {
            _sg.gl.cache.storage_buffers[i] = 0;
            _sg.gl.cache.storage_buffer = 0;
            if _sg.features.compute && i < _sg.limits.max_storage_buffer_bindings_per_stage {
                glBindBufferBase(0x90D2, cast(u32, i), 0);
            }
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_buffer++;
                }
            }
        }
    }
    if buf == _sg.gl.cache.stored_vertex_buffer {
        _sg.gl.cache.stored_vertex_buffer = 0;
    }
    if buf == _sg.gl.cache.stored_index_buffer {
        _sg.gl.cache.stored_index_buffer = 0;
    }
    if buf == _sg.gl.cache.stored_storage_buffer {
        _sg.gl.cache.stored_storage_buffer = 0;
    }
    for i32 i = 0; i < SG_MAX_VERTEX_ATTRIBUTES; i++ {
        if buf == _sg.gl.cache.attrs[i].gl_vbuf {
            _sg.gl.cache.attrs[i].gl_vbuf = 0;
        }
    }
}

void _sg_gl_cache_active_texture(u32 texture) {
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    if _sg.gl.cache.cur_active_texture != texture {
        _sg.gl.cache.cur_active_texture = texture;
        glActiveTexture(texture);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_active_texture++;
            }
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_cache_clear_texture_sampler_bindings(bool force) {
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for i32 i = 0; i < SG_MAX_TEXTURE_SAMPLER_PAIRS && i < _sg.limits.gl_max_combined_texture_image_units; i++ {
        if force || _sg.gl.cache.texture_samplers[i].texture != 0 {
            var gl_texture_unit = GL_TEXTURE0 + cast(u32, i);
            glActiveTexture(gl_texture_unit);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_active_texture++;
                }
            }
            glBindTexture(GL_TEXTURE_2D, 0);
            glBindTexture(GL_TEXTURE_CUBE_MAP, 0);
            glBindTexture(GL_TEXTURE_3D, 0);
            glBindTexture(GL_TEXTURE_2D_ARRAY, 0);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_texture += 4;
                }
            }
            glBindSampler(cast(u32, i), 0);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_sampler++;
                }
            }
            _sg.gl.cache.texture_samplers[i].target = 0;
            _sg.gl.cache.texture_samplers[i].texture = 0;
            _sg.gl.cache.texture_samplers[i].sampler = 0;
            _sg.gl.cache.cur_active_texture = gl_texture_unit;
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_cache_bind_texture_sampler(i8 gl_tex_slot, u32 target, u32 texture, u32 sampler) {
    assert(gl_tex_slot >= 0 && gl_tex_slot < SG_MAX_TEXTURE_SAMPLER_PAIRS);
    if gl_tex_slot >= _sg.limits.gl_max_combined_texture_image_units {
        return;
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg_gl_cache_texture_sampler_bind_slot* slot = &_sg.gl.cache.texture_samplers[gl_tex_slot];
    if slot.target != target || slot.texture != texture || slot.sampler != sampler {
        _sg_gl_cache_active_texture(GL_TEXTURE0 + cast(u32, gl_tex_slot));
        if target != slot.target && slot.target != 0 {
            glBindTexture(slot.target, 0);
            when !(arch(wasm)) && defined(SOKOL_DEBUG) {
                {
                    assert(glGetError() == GL_NO_ERROR);
                }
            }
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_texture++;
                }
            }
        }
        if target != 0 {
            glBindTexture(target, texture);
            when !(arch(wasm)) && defined(SOKOL_DEBUG) {
                {
                    assert(glGetError() == GL_NO_ERROR);
                }
            }
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_texture++;
                }
            }
        }
        glBindSampler(cast(u32, gl_tex_slot), sampler);
        when !(arch(wasm)) && defined(SOKOL_DEBUG) {
            {
                assert(glGetError() == GL_NO_ERROR);
            }
        }
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_bind_sampler++;
            }
        }
        slot.target = target;
        slot.texture = texture;
        slot.sampler = sampler;
    }
}

void _sg_gl_cache_store_texture_sampler_binding(i8 gl_tex_slot) {
    assert(gl_tex_slot >= 0 && gl_tex_slot < SG_MAX_TEXTURE_SAMPLER_PAIRS);
    _sg.gl.cache.stored_texture_sampler = _sg.gl.cache.texture_samplers[gl_tex_slot];
}

void _sg_gl_cache_restore_texture_sampler_binding(i8 gl_tex_slot) {
    assert(gl_tex_slot >= 0 && gl_tex_slot < SG_MAX_TEXTURE_SAMPLER_PAIRS);
    _sg_gl_cache_texture_sampler_bind_slot* slot = &_sg.gl.cache.stored_texture_sampler;
    if slot.texture != 0 {
        assert(slot.target != 0);
        _sg_gl_cache_bind_texture_sampler(gl_tex_slot, slot.target, slot.texture, slot.sampler);
        slot.target = 0;
        slot.texture = 0;
        slot.sampler = 0;
    }
}

void _sg_gl_cache_invalidate_texture_sampler(u32 tex, u32 smp) {
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for u64 i = 0; i < cast(u64, SG_MAX_TEXTURE_SAMPLER_PAIRS); i++ {
        _sg_gl_cache_texture_sampler_bind_slot* slot = &_sg.gl.cache.texture_samplers[i];
        if 0 != slot.target && (tex == slot.texture || smp == slot.sampler) {
            _sg_gl_cache_active_texture(GL_TEXTURE0 + cast(u32, i));
            glBindTexture(slot.target, 0);
            when !(arch(wasm)) && defined(SOKOL_DEBUG) {
                {
                    assert(glGetError() == GL_NO_ERROR);
                }
            }
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_texture++;
                }
            }
            glBindSampler(cast(u32, i), 0);
            when !(arch(wasm)) && defined(SOKOL_DEBUG) {
                {
                    assert(glGetError() == GL_NO_ERROR);
                }
            }
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_bind_sampler++;
                }
            }
            slot.target = 0;
            slot.texture = 0;
            slot.sampler = 0;
        }
    }
    if tex == _sg.gl.cache.stored_texture_sampler.texture || smp == _sg.gl.cache.stored_texture_sampler.sampler {
        _sg.gl.cache.stored_texture_sampler.target = 0;
        _sg.gl.cache.stored_texture_sampler.texture = 0;
        _sg.gl.cache.stored_texture_sampler.sampler = 0;
    }
}

void _sg_gl_cache_invalidate_program(u32 prog) {
    if prog == _sg.gl.cache.prog {
        _sg.gl.cache.prog = 0;
        glUseProgram(0);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_use_program++;
            }
        }
    }
}

void _sg_gl_cache_invalidate_pipeline(_sg_pipeline_t* pip) {
    if _sg_sref_slot_eql(&_sg.gl.cache.cur_pip, &pip.slot) {
        _sg.gl.cache.cur_pip = _sg_sref(null);
    }
}

void _sg_gl_reset_state_cache() {
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    glBindVertexArray(_sg.gl.vao);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg_clear(&_sg.gl.cache, cast(u64, sizeof(_sg_gl_cache_t)));
    _sg_gl_cache_clear_buffer_bindings(true);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg_gl_cache_clear_texture_sampler_bindings(true);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for i32 i = 0; i < _sg.limits.max_vertex_attrs; i++ {
        _sg_gl_attr_t* attr = &_sg.gl.cache.attrs[i].gl_attr;
        attr.vb_index = -1;
        attr.divisor = -1;
        glDisableVertexAttribArray(cast(u32, i));
        when !(arch(wasm)) && defined(SOKOL_DEBUG) {
            {
                assert(glGetError() == GL_NO_ERROR);
            }
        }
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_disable_vertex_attrib_array++;
            }
        }
    }
    _sg.gl.cache.cur_primitive_type = GL_TRIANGLES;
    glGetIntegerv(GL_CURRENT_PROGRAM, cast(i32*, &_sg.gl.cache.prog));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg.gl.cache.depth.compare = SG_COMPAREFUNC_ALWAYS;
    _sg.gl.cache.stencil.front.compare = SG_COMPAREFUNC_ALWAYS;
    _sg.gl.cache.stencil.front.fail_op = SG_STENCILOP_KEEP;
    _sg.gl.cache.stencil.front.depth_fail_op = SG_STENCILOP_KEEP;
    _sg.gl.cache.stencil.front.pass_op = SG_STENCILOP_KEEP;
    _sg.gl.cache.stencil.back.compare = SG_COMPAREFUNC_ALWAYS;
    _sg.gl.cache.stencil.back.fail_op = SG_STENCILOP_KEEP;
    _sg.gl.cache.stencil.back.depth_fail_op = SG_STENCILOP_KEEP;
    _sg.gl.cache.stencil.back.pass_op = SG_STENCILOP_KEEP;
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_ALWAYS);
    glDepthMask(GL_FALSE);
    glDisable(GL_STENCIL_TEST);
    glStencilFunc(GL_ALWAYS, 0, 0);
    glStencilOp(GL_KEEP, GL_KEEP, GL_KEEP);
    glStencilMask(0);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.gl.num_render_state += 7;
        }
    }
    _sg.gl.cache.blend.src_factor_rgb = SG_BLENDFACTOR_ONE;
    _sg.gl.cache.blend.dst_factor_rgb = SG_BLENDFACTOR_ZERO;
    _sg.gl.cache.blend.op_rgb = SG_BLENDOP_ADD;
    _sg.gl.cache.blend.src_factor_alpha = SG_BLENDFACTOR_ONE;
    _sg.gl.cache.blend.dst_factor_alpha = SG_BLENDFACTOR_ZERO;
    _sg.gl.cache.blend.op_alpha = SG_BLENDOP_ADD;
    glDisable(GL_BLEND);
    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ZERO);
    glBlendEquationSeparate(GL_FUNC_ADD, GL_FUNC_ADD);
    glBlendColor(0.0f, 0.0f, 0.0f, 0.0f);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.gl.num_render_state += 4;
        }
    }
    for i32 i = 0; i < SG_MAX_COLOR_ATTACHMENTS; i++ {
        _sg.gl.cache.color_write_mask[i] = SG_COLORMASK_RGBA;
    }
    _sg.gl.cache.cull_mode = SG_CULLMODE_NONE;
    _sg.gl.cache.face_winding = SG_FACEWINDING_CW;
    _sg.gl.cache.sample_count = 1;
    glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
    glPolygonOffset(0.0f, 0.0f);
    glDisable(GL_POLYGON_OFFSET_FILL);
    glDisable(GL_CULL_FACE);
    glFrontFace(GL_CW);
    glCullFace(GL_BACK);
    glEnable(GL_SCISSOR_TEST);
    glDisable(GL_SAMPLE_ALPHA_TO_COVERAGE);
    glEnable(GL_DITHER);
    glDisable(GL_POLYGON_OFFSET_FILL);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.gl.num_render_state += 10;
        }
    }
}

void _sg_gl_setup_backend(sg_desc* desc) {
    ignore desc;
    _sg.gl.valid = true;
    when defined(SOKOL_DEBUG) {
        while glGetError() != GL_NO_ERROR {
        }
    }
    _sg_gl_init_caps_gles3();
    glGenVertexArrays(1, &_sg.gl.vao);
    glBindVertexArray(_sg.gl.vao);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    glGenFramebuffers(1, &_sg.gl.fb);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    _sg_gl_reset_state_cache();
}

void _sg_gl_discard_backend() {
    assert(cast(i64, _sg.gl.valid));
    if _sg.gl.fb != 0 {
        glDeleteFramebuffers(1, &_sg.gl.fb);
    }
    if _sg.gl.vao != 0 {
        glDeleteVertexArrays(1, &_sg.gl.vao);
    }
    _sg.gl.valid = false;
}

sg_resource_state _sg_gl_create_buffer(_sg_buffer_t* buf, sg_buffer_desc* desc) {
    assert(buf != null && desc != null);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    buf.gl.injected = 0 != desc.gl_buffer;
    u32 gl_target = _sg_gl_buffer_target(&buf.cmn.usage);
    u32 gl_usage = _sg_gl_buffer_usage(&buf.cmn.usage);
    for i32 slot = 0; slot < buf.cmn.num_slots; slot++ {
        u32 gl_buf = 0;
        if buf.gl.injected {
            assert(slot == 0);
            gl_buf = desc.gl_buffer;
        } else {
            glGenBuffers(1, &gl_buf);
            assert(cast(i64, gl_buf));
            _sg_gl_cache_store_buffer_binding(gl_target);
            _sg_gl_cache_bind_buffer(gl_target, gl_buf);
            glBufferData(gl_target, buf.cmn.size, null, gl_usage);
            if desc.data.ptr != null {
                glBufferSubData(gl_target, 0, buf.cmn.size, desc.data.ptr);
            }
            _sg_gl_cache_restore_buffer_binding(gl_target);
        }
        buf.gl.buf[slot] = gl_buf;
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    return SG_RESOURCESTATE_VALID;
}

void _sg_gl_discard_buffer(_sg_buffer_t* buf) {
    assert(cast(i64, buf));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for i32 slot = 0; slot < buf.cmn.num_slots; slot++ {
        if buf.gl.buf[slot] != 0 {
            _sg_gl_cache_invalidate_buffer(buf.gl.buf[slot]);
            if !buf.gl.injected {
                glDeleteBuffers(1, &buf.gl.buf[slot]);
            }
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_seal_buffer(_sg_buffer_t* buf) {
    assert(cast(i64, buf));
    ignore buf;
}

bool _sg_gl_supported_texture_format(sg_pixel_format fmt) {
    var fmt_index = cast(i32, fmt);
    assert(fmt_index > SG_PIXELFORMAT_NONE && fmt_index < _SG_PIXELFORMAT_NUM);
    return _sg.formats[fmt_index].sample;
}

void _sg_gl_texstorage(_sg_image_t* img) {
    u32 tgt = img.gl.target;
    i32 num_mips = img.cmn.num_mipmaps;
    u32 ifmt = _sg_gl_teximage_internal_format(img.cmn.pixel_format);
    bool msaa = img.cmn.sample_count > 1;
    i32 w = img.cmn.width;
    i32 h = img.cmn.height;
    if SG_IMAGETYPE_2D == img.cmn.type || SG_IMAGETYPE_CUBE == img.cmn.type {
        assert(cast(i64, !msaa));
        ignore msaa;
        glTexStorage2D(tgt, num_mips, ifmt, w, h);
    } else if SG_IMAGETYPE_3D == img.cmn.type || SG_IMAGETYPE_ARRAY == img.cmn.type {
        i32 depth = img.cmn.num_slices;
        assert(cast(i64, !msaa));
        ignore msaa;
        glTexStorage3D(tgt, num_mips, ifmt, w, h, depth);
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_write_miplevel_data(_sg_image_t* img, u8* src_ptr, u64 src_size, u64 src_offset, i32 src_bytes_per_row, i32 src_bytes_per_slice, i32 mip_level, i32 x, i32 y, i32 slice, i32 width, i32 height, i32 num_slices) {
    assert(cast(i64, img));
    assert(src_size > 0);
    assert(src_bytes_per_row > 0);
    assert(src_bytes_per_slice > 0);
    assert(mip_level >= 0 && mip_level < img.cmn.num_mipmaps);
    assert(x >= 0 && x < _sg_miplevel_dim(img.cmn.width, mip_level));
    assert(y >= 0 && y < _sg_miplevel_dim(img.cmn.height, mip_level));
    assert(slice >= 0 && slice < img.cmn.num_slices);
    assert(width > 0 && x + width <= _sg_miplevel_dim(img.cmn.width, mip_level));
    assert(height > 0 && y + height <= _sg_miplevel_dim(img.cmn.height, mip_level));
    assert(num_slices > 0 && slice + num_slices <= img.cmn.num_slices);
    assert(cast(i64, _sg_multiple(src_bytes_per_row, _sg_block_bytesize(img.cmn.pixel_format))));
    assert(cast(i64, _sg_multiple(src_bytes_per_slice, src_bytes_per_row)));
    assert(src_offset + _sg_image_copy_size(img.cmn.pixel_format, src_bytes_per_row, src_bytes_per_slice, width, height, num_slices) <= src_size);
    ignore src_size;
    bool compressed = _sg_is_compressed_pixel_format(img.cmn.pixel_format);
    sg_pixel_format fmt = img.cmn.pixel_format;
    i32 unpack_row_length = src_bytes_per_row / _sg_block_bytesize(fmt);
    i32 unpack_img_height = src_bytes_per_slice / src_bytes_per_row;
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    glPixelStorei(GL_UNPACK_ROW_LENGTH, unpack_row_length);
    glPixelStorei(GL_UNPACK_IMAGE_HEIGHT, unpack_img_height);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    u32 gl_tgt = img.gl.target;
    var gl_compr_size = _sg_surface_pitch(fmt, width, height, 1);
    assert(gl_compr_size > 0);
    i64 gl_src = cast(i64, src_ptr) + cast(i64, src_offset);
    if SG_IMAGETYPE_2D == img.cmn.type {
        var gl_data = cast(void*, gl_src);
        if compressed {
            u32 gl_ifmt = _sg_gl_teximage_internal_format(fmt);
            glCompressedTexSubImage2D(gl_tgt, mip_level, x, y, width, height, gl_ifmt, gl_compr_size, gl_data);
        } else {
            u32 gl_type = _sg_gl_teximage_type(img.cmn.pixel_format);
            u32 gl_fmt = _sg_gl_teximage_format(img.cmn.pixel_format);
            glTexSubImage2D(gl_tgt, mip_level, x, y, width, height, gl_fmt, gl_type, gl_data);
        }
    } else if SG_IMAGETYPE_CUBE == img.cmn.type {
        for i32 i = 0; i < num_slices; i++ {
            var gl_data = cast(void*, gl_src + cast(i64, i) * cast(i64, src_bytes_per_slice));
            i32 face_index = i + slice;
            assert(face_index < 6);
            u32 gl_cubeface_tgt = _sg_gl_cubeface_target(face_index);
            if compressed {
                u32 gl_ifmt = _sg_gl_teximage_internal_format(fmt);
                glCompressedTexSubImage2D(gl_cubeface_tgt, mip_level, x, y, width, height, gl_ifmt, gl_compr_size, gl_data);
            } else {
                u32 gl_type = _sg_gl_teximage_type(img.cmn.pixel_format);
                u32 gl_fmt = _sg_gl_teximage_format(img.cmn.pixel_format);
                glTexSubImage2D(gl_cubeface_tgt, mip_level, x, y, width, height, gl_fmt, gl_type, gl_data);
            }
        }
    } else if SG_IMAGETYPE_3D == img.cmn.type || SG_IMAGETYPE_ARRAY == img.cmn.type {
        var gl_data = cast(void*, gl_src);
        if compressed {
            u32 gl_ifmt = _sg_gl_teximage_internal_format(fmt);
            glCompressedTexSubImage3D(gl_tgt, mip_level, x, y, slice, width, height, num_slices, gl_ifmt, gl_compr_size * num_slices, gl_data);
        } else {
            u32 gl_type = _sg_gl_teximage_type(img.cmn.pixel_format);
            u32 gl_fmt = _sg_gl_teximage_format(img.cmn.pixel_format);
            glTexSubImage3D(gl_tgt, mip_level, x, y, slice, width, height, num_slices, gl_fmt, gl_type, gl_data);
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
    glPixelStorei(GL_UNPACK_IMAGE_HEIGHT, 0);
}

void _sg_gl_texsubimage(_sg_image_t* img, u32 tgt, i32 mip_index, i32 w, i32 h, i32 depth, void* data_ptr, i32 data_size) {
    assert(data_ptr != null && data_size > 0);
    assert(img.cmn.sample_count == 1);
    bool compressed = _sg_is_compressed_pixel_format(img.cmn.pixel_format);
    if SG_IMAGETYPE_2D == img.cmn.type || SG_IMAGETYPE_CUBE == img.cmn.type {
        if compressed {
            u32 ifmt = _sg_gl_teximage_internal_format(img.cmn.pixel_format);
            glCompressedTexSubImage2D(tgt, mip_index, 0, 0, w, h, ifmt, data_size, data_ptr);
        } else {
            u32 type = _sg_gl_teximage_type(img.cmn.pixel_format);
            u32 fmt = _sg_gl_teximage_format(img.cmn.pixel_format);
            glTexSubImage2D(tgt, mip_index, 0, 0, w, h, fmt, type, data_ptr);
        }
    } else if SG_IMAGETYPE_3D == img.cmn.type || SG_IMAGETYPE_ARRAY == img.cmn.type {
        if compressed {
            u32 ifmt = _sg_gl_teximage_internal_format(img.cmn.pixel_format);
            glCompressedTexSubImage3D(tgt, mip_index, 0, 0, 0, w, h, depth, ifmt, data_size, data_ptr);
        } else {
            u32 type = _sg_gl_teximage_type(img.cmn.pixel_format);
            u32 fmt = _sg_gl_teximage_format(img.cmn.pixel_format);
            glTexSubImage3D(tgt, mip_index, 0, 0, 0, w, h, depth, fmt, type, data_ptr);
        }
    }
}

void _sg_gl_teximage(_sg_image_t* img, u32 tgt, i32 mip_index, i32 w, i32 h, i32 depth, void* data_ptr, i32 data_size) {
    if data_ptr == null {
        return;
    }
    _sg_gl_texsubimage(img, tgt, mip_index, w, h, depth, data_ptr, data_size);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

sg_resource_state _sg_gl_create_image(_sg_image_t* img, sg_image_desc* desc) {
    assert(img != null && desc != null);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    img.gl.injected = 0 != desc.gl_texture;
    if _sg_gl_supported_texture_format(img.cmn.pixel_format) == 0 {
        _sg_log(SG_LOGITEM_GL_TEXTURE_FORMAT_NOT_SUPPORTED, 1, null, __line__);
        return SG_RESOURCESTATE_FAILED;
    }
    if img.gl.injected {
        assert(1 == img.cmn.num_slots);
        img.gl.target = _sg_gl_texture_target(img.cmn.type, img.cmn.sample_count);
        assert(cast(i64, desc.gl_texture));
        img.gl.tex[0] = desc.gl_texture;
        if desc.gl_texture_target != 0 {
            img.gl.target = desc.gl_texture_target;
        }
    } else {
        bool msaa = img.cmn.sample_count > 1;
        if msaa && !_sg.features.msaa_texture_bindings {
            if img.cmn.usage.color_attachment || img.cmn.usage.depth_stencil_attachment {
                return SG_RESOURCESTATE_VALID;
            } else {
                return SG_RESOURCESTATE_FAILED;
            }
        }
        img.gl.target = _sg_gl_texture_target(img.cmn.type, img.cmn.sample_count);
        for i32 slot = 0; slot < img.cmn.num_slots; slot++ {
            glGenTextures(1, &img.gl.tex[slot]);
            assert(cast(i64, img.gl.tex[slot]));
            _sg_gl_cache_store_texture_sampler_binding(0);
            _sg_gl_cache_bind_texture_sampler(0, img.gl.target, img.gl.tex[slot], 0);
            _sg_gl_texstorage(img);
            for i32 mip_index = 0; mip_index < img.cmn.num_mipmaps; mip_index++ {
                void* data_ptr = desc.data.mip_levels[mip_index].ptr;
                var data_size = cast(i32, desc.data.mip_levels[mip_index].size);
                i32 mip_width = _sg_miplevel_dim(img.cmn.width, mip_index);
                i32 mip_height = _sg_miplevel_dim(img.cmn.height, mip_index);
                i32 mip_depth = cast(i32, SG_IMAGETYPE_3D) == img.cmn.type ? _sg_miplevel_dim(img.cmn.num_slices, mip_index) : img.cmn.num_slices;
                if SG_IMAGETYPE_CUBE == img.cmn.type {
                    i32 surf_pitch = _sg_surface_pitch(img.cmn.pixel_format, mip_width, mip_height, 1);
                    var surf_ptr = cast(u8*, data_ptr);
                    for i32 i = 0; i < 6; i++ {
                        u32 gl_img_target = _sg_gl_cubeface_target(i);
                        _sg_gl_teximage(img, gl_img_target, mip_index, mip_width, mip_height, mip_depth, surf_ptr, surf_pitch);
                        if data_ptr != null {
                            assert(6 * surf_pitch <= data_size);
                            surf_ptr += surf_pitch;
                        }
                    }
                } else {
                    _sg_gl_teximage(img, img.gl.target, mip_index, mip_width, mip_height, mip_depth, data_ptr, data_size);
                }
            }
            _sg_gl_cache_restore_texture_sampler_binding(0);
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    return SG_RESOURCESTATE_VALID;
}

void _sg_gl_discard_image(_sg_image_t* img) {
    assert(cast(i64, img));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for i32 slot = 0; slot < img.cmn.num_slots; slot++ {
        if img.gl.tex[slot] != 0 {
            _sg_gl_cache_invalidate_texture_sampler(img.gl.tex[slot], 0);
            if !img.gl.injected {
                glDeleteTextures(1, &img.gl.tex[slot]);
            }
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_seal_image(_sg_image_t* img) {
    assert(cast(i64, img));
    ignore img;
}

sg_resource_state _sg_gl_create_sampler(_sg_sampler_t* smp, sg_sampler_desc* desc) {
    assert(smp != null && desc != null);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    smp.gl.injected = 0 != desc.gl_sampler;
    if smp.gl.injected {
        smp.gl.smp = desc.gl_sampler;
    } else {
        glGenSamplers(1, &smp.gl.smp);
        assert(cast(i64, smp.gl.smp));
        u32 gl_min_filter = _sg_gl_min_filter(smp.cmn.min_filter, smp.cmn.mipmap_filter);
        u32 gl_mag_filter = _sg_gl_mag_filter(smp.cmn.mag_filter);
        glSamplerParameteri(smp.gl.smp, GL_TEXTURE_MIN_FILTER, cast(i32, gl_min_filter));
        glSamplerParameteri(smp.gl.smp, GL_TEXTURE_MAG_FILTER, cast(i32, gl_mag_filter));
        f32 min_lod = desc.min_lod < 0.0f ? 0.0f : desc.min_lod > 1000.0f ? 1000.0f : desc.min_lod;
        f32 max_lod = desc.max_lod < 0.0f ? 0.0f : desc.max_lod > 1000.0f ? 1000.0f : desc.max_lod;
        glSamplerParameterf(smp.gl.smp, GL_TEXTURE_MIN_LOD, min_lod);
        glSamplerParameterf(smp.gl.smp, GL_TEXTURE_MAX_LOD, max_lod);
        glSamplerParameteri(smp.gl.smp, GL_TEXTURE_WRAP_S, cast(i32, _sg_gl_wrap(smp.cmn.wrap_u)));
        glSamplerParameteri(smp.gl.smp, GL_TEXTURE_WRAP_T, cast(i32, _sg_gl_wrap(smp.cmn.wrap_v)));
        glSamplerParameteri(smp.gl.smp, GL_TEXTURE_WRAP_R, cast(i32, _sg_gl_wrap(smp.cmn.wrap_w)));
        if smp.cmn.compare != SG_COMPAREFUNC_NEVER {
            glSamplerParameteri(smp.gl.smp, GL_TEXTURE_COMPARE_MODE, GL_COMPARE_REF_TO_TEXTURE);
            glSamplerParameteri(smp.gl.smp, GL_TEXTURE_COMPARE_FUNC, cast(i32, _sg_gl_compare_func(smp.cmn.compare)));
        } else {
            glSamplerParameteri(smp.gl.smp, GL_TEXTURE_COMPARE_MODE, GL_NONE);
        }
        if _sg.gl.ext_anisotropic && smp.cmn.max_anisotropy > 1 {
            var max_aniso = cast(i32, smp.cmn.max_anisotropy);
            if max_aniso > _sg.gl.max_anisotropy {
                max_aniso = _sg.gl.max_anisotropy;
            }
            glSamplerParameteri(smp.gl.smp, 0x84FE, max_aniso);
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    return SG_RESOURCESTATE_VALID;
}

void _sg_gl_discard_sampler(_sg_sampler_t* smp) {
    assert(cast(i64, smp));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg_gl_cache_invalidate_texture_sampler(0, smp.gl.smp);
    if !smp.gl.injected {
        glDeleteSamplers(1, &smp.gl.smp);
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

u32 _sg_gl_compile_shader(sg_shader_stage stage, u8* src) {
    assert(cast(i64, src));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    u32 gl_shd = glCreateShader(_sg_gl_shader_stage(stage));
    glShaderSource(gl_shd, 1, &src, null);
    glCompileShader(gl_shd);
    i32 compile_status = 0;
    glGetShaderiv(gl_shd, GL_COMPILE_STATUS, &compile_status);
    if compile_status == 0 {
        i32 log_len = 0;
        glGetShaderiv(gl_shd, GL_INFO_LOG_LENGTH, &log_len);
        if log_len > 0 {
            var log_buf = cast(u8*, _sg_malloc(cast(u64, log_len)));
            glGetShaderInfoLog(gl_shd, log_len, &log_len, log_buf);
            _sg_log(SG_LOGITEM_GL_SHADER_COMPILATION_FAILED, 1, null, __line__);
            _sg_log(SG_LOGITEM_GL_SHADER_COMPILATION_FAILED, 3, log_buf, __line__);
            _sg_free(log_buf);
        }
        glDeleteShader(gl_shd);
        gl_shd = 0;
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    return gl_shd;
}

bool _sg_gl_ensure_glsl_bindslot_ranges(sg_shader_desc* desc) {
    assert(cast(i64, desc));
    ignore desc;
    return true;
}

sg_resource_state _sg_gl_create_shader(_sg_shader_t* shd, sg_shader_desc* desc) {
    assert(shd != null && desc != null);
    assert(cast(i64, shd.gl.prog == 0));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    if _sg_gl_ensure_glsl_bindslot_ranges(desc) == 0 {
        return SG_RESOURCESTATE_FAILED;
    }
    for i32 i = 0; i < SG_MAX_VERTEX_ATTRIBUTES; i++ {
        _sg_strcpy(&shd.gl.attrs[i].name, desc.attrs[i].glsl_name);
    }
    bool has_vs = desc.vertex_func.source != null;
    bool has_fs = desc.fragment_func.source != null;
    bool has_cs = desc.compute_func.source != null;
    assert(has_vs && has_fs || has_cs);
    u32 gl_prog = glCreateProgram();
    if has_vs && has_fs {
        u32 gl_vs = _sg_gl_compile_shader(SG_SHADERSTAGE_VERTEX, desc.vertex_func.source);
        u32 gl_fs = _sg_gl_compile_shader(SG_SHADERSTAGE_FRAGMENT, desc.fragment_func.source);
        if (gl_vs && gl_fs) == 0 {
            glDeleteProgram(gl_prog);
            if gl_vs != 0 {
                glDeleteShader(gl_vs);
            }
            if gl_fs != 0 {
                glDeleteShader(gl_fs);
            }
            return SG_RESOURCESTATE_FAILED;
        }
        glAttachShader(gl_prog, gl_vs);
        glAttachShader(gl_prog, gl_fs);
        glLinkProgram(gl_prog);
        glDeleteShader(gl_vs);
        glDeleteShader(gl_fs);
        when !(arch(wasm)) && defined(SOKOL_DEBUG) {
            {
                assert(glGetError() == GL_NO_ERROR);
            }
        }
    } else if has_cs {
        u32 gl_cs = _sg_gl_compile_shader(SG_SHADERSTAGE_COMPUTE, desc.compute_func.source);
        if gl_cs == 0 {
            glDeleteProgram(gl_prog);
            return SG_RESOURCESTATE_FAILED;
        }
        glAttachShader(gl_prog, gl_cs);
        glLinkProgram(gl_prog);
        glDeleteShader(gl_cs);
        when !(arch(wasm)) && defined(SOKOL_DEBUG) {
            {
                assert(glGetError() == GL_NO_ERROR);
            }
        }
    } else {
        assert(cast(i64, false));
    }
    i32 link_status;
    glGetProgramiv(gl_prog, GL_LINK_STATUS, &link_status);
    if link_status == 0 {
        i32 log_len = 0;
        glGetProgramiv(gl_prog, GL_INFO_LOG_LENGTH, &log_len);
        if log_len > 0 {
            var log_buf = cast(u8*, _sg_malloc(cast(u64, log_len)));
            glGetProgramInfoLog(gl_prog, log_len, &log_len, log_buf);
            _sg_log(SG_LOGITEM_GL_SHADER_LINKING_FAILED, 1, null, __line__);
            _sg_log(SG_LOGITEM_GL_SHADER_LINKING_FAILED, 3, log_buf, __line__);
            _sg_free(log_buf);
        }
        glDeleteProgram(gl_prog);
        return SG_RESOURCESTATE_FAILED;
    }
    shd.gl.prog = gl_prog;
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for u64 ub_index = 0; ub_index < cast(u64, SG_MAX_UNIFORMBLOCK_BINDSLOTS); ub_index++ {
        sg_shader_uniform_block* ub_desc = &desc.uniform_blocks[ub_index];
        if ub_desc.stage == SG_SHADERSTAGE_NONE {
            continue;
        }
        assert(ub_desc.size > 0);
        _sg_gl_uniform_block_t* ub = &shd.gl.uniform_blocks[ub_index];
        assert(ub.num_uniforms == 0);
        u32 cur_uniform_offset = 0;
        for i32 u_index = 0; u_index < SG_MAX_UNIFORMBLOCK_MEMBERS; u_index++ {
            sg_glsl_shader_uniform* u_desc = &ub_desc.glsl_uniforms[u_index];
            if u_desc.type == SG_UNIFORMTYPE_INVALID {
                break;
            }
            u32 u_align = _sg_uniform_alignment(u_desc.type, cast(i32, u_desc.array_count), ub_desc.layout);
            u32 u_size = _sg_uniform_size(u_desc.type, cast(i32, u_desc.array_count), ub_desc.layout);
            cur_uniform_offset = _sg_align_u32(cur_uniform_offset, u_align);
            _sg_gl_uniform_t* u = &ub.uniforms[u_index];
            u.type = u_desc.type;
            u.count = u_desc.array_count;
            u.offset = cast(u16, cur_uniform_offset);
            assert(cast(i64, u_desc.glsl_name));
            u.gl_loc = glGetUniformLocation(gl_prog, u_desc.glsl_name);
            if u.gl_loc == -1 {
                _sg_log(SG_LOGITEM_GL_UNIFORMBLOCK_NAME_NOT_FOUND_IN_SHADER, 2, null, __line__);
                _sg_log(SG_LOGITEM_GL_UNIFORMBLOCK_NAME_NOT_FOUND_IN_SHADER, 3, u_desc.glsl_name, __line__);
            }
            cur_uniform_offset += u_size;
            ub.num_uniforms++;
        }
        if ub_desc.layout == SG_UNIFORMLAYOUT_STD140 {
            cur_uniform_offset = _sg_align_u32(cur_uniform_offset, 16);
        }
        assert(ub_desc.size == cast(u64, cur_uniform_offset));
        ignore cur_uniform_offset;
    }
    for u64 i = 0; i < cast(u64, SG_MAX_VIEW_BINDSLOTS); i++ {
        sg_shader_view* view = &desc.views[i];
        assert(0 == shd.gl.sbuf_binding[i]);
        assert(0 == shd.gl.simg_binding[i]);
        if view.storage_buffer.stage != SG_SHADERSTAGE_NONE {
            shd.gl.sbuf_binding[i] = view.storage_buffer.glsl_binding_n;
        } else if view.storage_image.stage != SG_SHADERSTAGE_NONE {
            shd.gl.simg_binding[i] = view.storage_image.glsl_binding_n;
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    u32 cur_prog = 0;
    glGetIntegerv(GL_CURRENT_PROGRAM, cast(i32*, &cur_prog));
    glUseProgram(gl_prog);
    i32 gl_tex_slot = 0;
    for u64 tex_smp_index = 0; tex_smp_index < cast(u64, SG_MAX_TEXTURE_SAMPLER_PAIRS); tex_smp_index++ {
        sg_shader_texture_sampler_pair* tex_smp_desc = &desc.texture_sampler_pairs[tex_smp_index];
        if tex_smp_desc.stage == SG_SHADERSTAGE_NONE {
            continue;
        }
        assert(cast(i64, tex_smp_desc.glsl_name));
        i32 gl_loc = glGetUniformLocation(gl_prog, tex_smp_desc.glsl_name);
        if gl_loc != -1 {
            glUniform1i(gl_loc, gl_tex_slot);
            shd.gl.tex_slot[tex_smp_index] = cast(i8, gl_tex_slot++);
        } else {
            shd.gl.tex_slot[tex_smp_index] = -1;
            _sg_log(SG_LOGITEM_GL_IMAGE_SAMPLER_NAME_NOT_FOUND_IN_SHADER, 2, null, __line__);
            _sg_log(SG_LOGITEM_GL_IMAGE_SAMPLER_NAME_NOT_FOUND_IN_SHADER, 3, tex_smp_desc.glsl_name, __line__);
        }
    }
    glUseProgram(cur_prog);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    return SG_RESOURCESTATE_VALID;
}

void _sg_gl_discard_shader(_sg_shader_t* shd) {
    assert(cast(i64, shd));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    if shd.gl.prog != 0 {
        _sg_gl_cache_invalidate_program(shd.gl.prog);
        glDeleteProgram(shd.gl.prog);
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

sg_resource_state _sg_gl_create_pipeline(_sg_pipeline_t* pip, sg_pipeline_desc* desc) {
    assert(pip != null && desc != null);
    assert(_sg.limits.max_vertex_attrs <= SG_MAX_VERTEX_ATTRIBUTES);
    if pip.cmn.is_compute {
        return SG_RESOURCESTATE_VALID;
    }
    pip.gl.primitive_type = desc.primitive_type;
    pip.gl.depth = desc.depth;
    pip.gl.stencil = desc.stencil;
    pip.gl.blend = desc.colors[0].blend;
    for i32 i = 0; i < SG_MAX_COLOR_ATTACHMENTS; i++ {
        pip.gl.color_write_mask[i] = desc.colors[i].write_mask;
    }
    pip.gl.cull_mode = desc.cull_mode;
    pip.gl.face_winding = desc.face_winding;
    pip.gl.sample_count = desc.sample_count;
    pip.gl.alpha_to_coverage_enabled = desc.alpha_to_coverage_enabled;
    for i32 i = 0; i < SG_MAX_VERTEXBUFFER_BINDSLOTS; i++ {
        pip.cmn.vertex_buffer_layout_active[i] = false;
    }
    _sg_shader_t* shd = _sg_shader_ref_ptr(&pip.cmn.shader);
    assert(cast(i64, shd.gl.prog));
    for i32 attr_index = 0; attr_index < SG_MAX_VERTEX_ATTRIBUTES; attr_index++ {
        pip.gl.attrs[attr_index].vb_index = -1;
    }
    for i32 attr_index = 0; attr_index < _sg.limits.max_vertex_attrs; attr_index++ {
        sg_vertex_attr_state* a_state = &desc.layout.attrs[attr_index];
        if a_state.format == SG_VERTEXFORMAT_INVALID {
            break;
        }
        assert(a_state.buffer_index < SG_MAX_VERTEXBUFFER_BINDSLOTS);
        sg_vertex_buffer_layout_state* l_state = &desc.layout.buffers[a_state.buffer_index];
        sg_vertex_step step_func = l_state.step_func;
        i32 step_rate = l_state.step_rate;
        i32 attr_loc = attr_index;
        if _sg_strempty(&shd.gl.attrs[attr_index].name) == 0 {
            attr_loc = glGetAttribLocation(shd.gl.prog, _sg_strptr(&shd.gl.attrs[attr_index].name));
        }
        if attr_loc != -1 {
            assert(attr_loc < _sg.limits.max_vertex_attrs);
            _sg_gl_attr_t* gl_attr = &pip.gl.attrs[attr_loc];
            assert(gl_attr.vb_index == -1);
            gl_attr.vb_index = cast(i8, a_state.buffer_index);
            if step_func == SG_VERTEXSTEP_PER_VERTEX {
                gl_attr.divisor = 0;
            } else {
                gl_attr.divisor = cast(i8, step_rate);
            }
            assert(l_state.stride > 0);
            gl_attr.stride = cast(u8, l_state.stride);
            gl_attr.offset = a_state.offset;
            gl_attr.size = cast(u8, _sg_gl_vertexformat_size(a_state.format));
            gl_attr.type = _sg_gl_vertexformat_type(a_state.format);
            gl_attr.normalized = _sg_gl_vertexformat_normalized(a_state.format);
            gl_attr.base_type = _sg_vertexformat_basetype(a_state.format);
            pip.cmn.vertex_buffer_layout_active[a_state.buffer_index] = true;
        } else {
            _sg_log(SG_LOGITEM_GL_VERTEX_ATTRIBUTE_NOT_FOUND_IN_SHADER, 2, null, __line__);
            _sg_log(SG_LOGITEM_GL_VERTEX_ATTRIBUTE_NOT_FOUND_IN_SHADER, 3, _sg_strptr(&shd.gl.attrs[attr_index].name), __line__);
        }
    }
    return SG_RESOURCESTATE_VALID;
}

void _sg_gl_discard_pipeline(_sg_pipeline_t* pip) {
    assert(cast(i64, pip));
    _sg_gl_cache_invalidate_pipeline(pip);
}

void _sg_gl_fb_attach_texture(_sg_view_t* view, u32 gl_att_type) {
    _sg_image_t* img = _sg_image_ref_ptr(&view.cmn.img.ref);
    u32 gl_tex = img.gl.tex[0];
    assert(cast(i64, gl_tex));
    u32 gl_target = img.gl.target;
    assert(cast(i64, gl_target));
    i32 mip_level = view.cmn.img.mip_level;
    i32 slice = view.cmn.img.slice;
    switch img.cmn.type {
        case SG_IMAGETYPE_2D: {
            glFramebufferTexture2D(GL_FRAMEBUFFER, gl_att_type, gl_target, gl_tex, mip_level);
        }
        case SG_IMAGETYPE_CUBE: {
            glFramebufferTexture2D(GL_FRAMEBUFFER, gl_att_type, _sg_gl_cubeface_target(slice), gl_tex, mip_level);
        }
        default: {
            glFramebufferTextureLayer(GL_FRAMEBUFFER, gl_att_type, gl_tex, mip_level, slice);
        }
    }
}

u32 _sg_gl_depth_stencil_attachment_type(_sg_image_t* ds_img) {
    if _sg_is_depth_stencil_format(ds_img.cmn.pixel_format) != 0 {
        return GL_DEPTH_STENCIL_ATTACHMENT;
    } else {
        return GL_DEPTH_ATTACHMENT;
    }
}

bool _sg_gl_check_framebuffer_status() {
    u32 fb_status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
    if fb_status != GL_FRAMEBUFFER_COMPLETE {
        switch fb_status {
            case 0x8219: {
                _sg_log(SG_LOGITEM_GL_FRAMEBUFFER_STATUS_UNDEFINED, 1, null, __line__);
            }
            case 0x8CD6: {
                _sg_log(SG_LOGITEM_GL_FRAMEBUFFER_STATUS_INCOMPLETE_ATTACHMENT, 1, null, __line__);
            }
            case 0x8CD7: {
                _sg_log(SG_LOGITEM_GL_FRAMEBUFFER_STATUS_INCOMPLETE_MISSING_ATTACHMENT, 1, null, __line__);
            }
            case 0x8CDD: {
                _sg_log(SG_LOGITEM_GL_FRAMEBUFFER_STATUS_UNSUPPORTED, 1, null, __line__);
            }
            case 0x8D56: {
                _sg_log(SG_LOGITEM_GL_FRAMEBUFFER_STATUS_INCOMPLETE_MULTISAMPLE, 1, null, __line__);
            }
            default: {
                _sg_log(SG_LOGITEM_GL_FRAMEBUFFER_STATUS_UNKNOWN, 1, null, __line__);
            }
        }
        return false;
    }
    return true;
}

sg_resource_state _sg_gl_create_view(_sg_view_t* view, sg_view_desc* desc) {
    assert(view != null && desc != null);
    ignore desc;
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    if view.cmn.type == SG_VIEWTYPE_TEXTURE && _sg.features.gl_texture_views {
    } else if view.cmn.type == SG_VIEWTYPE_COLORATTACHMENT || view.cmn.type == SG_VIEWTYPE_DEPTHSTENCILATTACHMENT {
        _sg_image_t* img = _sg_image_ref_ptr(&view.cmn.img.ref);
        bool msaa = img.cmn.sample_count > 1;
        if msaa && !_sg.features.msaa_texture_bindings {
            u32 gl_internal_format = _sg_gl_teximage_internal_format(img.cmn.pixel_format);
            glGenRenderbuffers(1, &view.gl.msaa_render_buffer);
            glBindRenderbuffer(GL_RENDERBUFFER, view.gl.msaa_render_buffer);
            glRenderbufferStorageMultisample(GL_RENDERBUFFER, img.cmn.sample_count, gl_internal_format, img.cmn.width, img.cmn.height);
        }
    } else if view.cmn.type == SG_VIEWTYPE_RESOLVEATTACHMENT {
        u32 gl_orig_fb;
        glGetIntegerv(GL_FRAMEBUFFER_BINDING, cast(i32*, &gl_orig_fb));
        glGenFramebuffers(1, &view.gl.msaa_resolve_frame_buffer);
        glBindFramebuffer(GL_FRAMEBUFFER, view.gl.msaa_resolve_frame_buffer);
        _sg_gl_fb_attach_texture(view, GL_COLOR_ATTACHMENT0);
        if _sg_gl_check_framebuffer_status() == 0 {
            return SG_RESOURCESTATE_FAILED;
        }
        glDrawBuffers(1, &_sg_gl_create_view__gl_draw_buf);
        glBindFramebuffer(GL_FRAMEBUFFER, gl_orig_fb);
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    return SG_RESOURCESTATE_VALID;
}

void _sg_gl_discard_view(_sg_view_t* view) {
    assert(cast(i64, view));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for u64 slot = 0; slot < cast(u64, SG_NUM_INFLIGHT_FRAMES); slot++ {
        if 0 != view.gl.tex_view[slot] {
            _sg_gl_cache_invalidate_texture_sampler(view.gl.tex_view[slot], 0);
            glDeleteTextures(1, &view.gl.tex_view[slot]);
        }
    }
    if view.gl.msaa_render_buffer != 0 {
        glDeleteRenderbuffers(1, &view.gl.msaa_render_buffer);
    }
    if view.gl.msaa_resolve_frame_buffer != 0 {
        glDeleteFramebuffers(1, &view.gl.msaa_resolve_frame_buffer);
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_begin_pass(sg_pass* pass, _sg_attachments_ptrs_t* atts) {
    assert(pass != null && atts != null);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    if pass.compute {
        return;
    }
    sg_swapchain* swapchain = &pass.swapchain;
    sg_pass_action* action = &pass.action;
    bool is_swapchain_pass = atts.empty;
    bool is_offscreen_pass = !atts.empty;
    if is_offscreen_pass {
        glBindFramebuffer(GL_FRAMEBUFFER, _sg.gl.fb);
        for i32 i = 0; i < atts.num_color_views; i++ {
            _sg_view_t* view = atts.color_views[i];
            var gl_att_type = cast(u32, GL_COLOR_ATTACHMENT0 + cast(u32, i));
            if view.gl.msaa_render_buffer != 0 {
                glFramebufferRenderbuffer(GL_FRAMEBUFFER, gl_att_type, GL_RENDERBUFFER, view.gl.msaa_render_buffer);
            } else {
                _sg_gl_fb_attach_texture(view, gl_att_type);
            }
        }
        for i32 i = atts.num_color_views; i < _sg.limits.max_color_attachments; i++ {
            var gl_att_type = cast(u32, GL_COLOR_ATTACHMENT0 + cast(u32, i));
            glFramebufferRenderbuffer(GL_FRAMEBUFFER, gl_att_type, GL_RENDERBUFFER, 0);
            glFramebufferTexture2D(GL_FRAMEBUFFER, gl_att_type, GL_TEXTURE_2D, 0, 0);
        }
        if atts.ds_view != null {
            glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, 0);
            glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, 0, 0);
            glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_STENCIL_ATTACHMENT, GL_RENDERBUFFER, 0);
            glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_STENCIL_ATTACHMENT, GL_TEXTURE_2D, 0, 0);
            _sg_view_t* view = atts.ds_view;
            _sg_image_t* img = _sg_image_ref_ptr(&view.cmn.img.ref);
            u32 gl_att_type = _sg_gl_depth_stencil_attachment_type(img);
            if view.gl.msaa_render_buffer != 0 {
                glFramebufferRenderbuffer(GL_FRAMEBUFFER, gl_att_type, GL_RENDERBUFFER, view.gl.msaa_render_buffer);
            } else {
                _sg_gl_fb_attach_texture(view, gl_att_type);
            }
        } else {
            glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_STENCIL_ATTACHMENT, GL_RENDERBUFFER, 0);
            glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_STENCIL_ATTACHMENT, GL_TEXTURE_2D, 0, 0);
        }
        if _sg_gl_check_framebuffer_status() == 0 {
            _sg.cur_pass.valid = false;
            return;
        }
        u32[8] gl_draw_bufs;
        assert(_sg.limits.max_color_attachments <= SG_MAX_COLOR_ATTACHMENTS);
        for i32 i = 0; i < _sg.limits.max_color_attachments; i++ {
            if i < atts.num_color_views {
                gl_draw_bufs[i] = cast(u32, GL_COLOR_ATTACHMENT0 + cast(u32, i));
            } else {
                gl_draw_bufs[i] = GL_NONE;
            }
        }
        glDrawBuffers(_sg.limits.max_color_attachments, gl_draw_bufs);
    } else {
        glBindFramebuffer(GL_FRAMEBUFFER, swapchain.gl.framebuffer);
    }
    glViewport(0, 0, _sg.cur_pass.dim.width, _sg.cur_pass.dim.height);
    glScissor(0, 0, _sg.cur_pass.dim.width, _sg.cur_pass.dim.height);
    i32 num_color_atts = is_offscreen_pass ? atts.num_color_views : 1;
    bool clear_any_color = false;
    for i32 i = 0; i < num_color_atts; i++ {
        if SG_LOADACTION_CLEAR == action.colors[i].load_action {
            clear_any_color = true;
            break;
        }
    }
    bool clear_depth = action.depth.load_action == SG_LOADACTION_CLEAR;
    bool clear_stencil = action.stencil.load_action == SG_LOADACTION_CLEAR;
    bool need_pip_cache_flush = false;
    if clear_any_color {
        bool need_color_mask_flush = false;
        for i32 i = 0; i < SG_MAX_COLOR_ATTACHMENTS; i++ {
            if SG_COLORMASK_RGBA != _sg.gl.cache.color_write_mask[i] {
                need_pip_cache_flush = true;
                need_color_mask_flush = true;
                _sg.gl.cache.color_write_mask[i] = SG_COLORMASK_RGBA;
            }
        }
        if need_color_mask_flush {
            glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
        }
    }
    if clear_depth {
        if _sg.gl.cache.depth.write_enabled == 0 {
            need_pip_cache_flush = true;
            _sg.gl.cache.depth.write_enabled = true;
            glDepthMask(GL_TRUE);
        }
        if _sg.gl.cache.depth.compare != SG_COMPAREFUNC_ALWAYS {
            need_pip_cache_flush = true;
            _sg.gl.cache.depth.compare = SG_COMPAREFUNC_ALWAYS;
            glDepthFunc(GL_ALWAYS);
        }
    }
    if clear_stencil {
        if _sg.gl.cache.stencil.write_mask != 0xFF {
            need_pip_cache_flush = true;
            _sg.gl.cache.stencil.write_mask = 0xFF;
            glStencilMask(0xFF);
        }
    }
    if need_pip_cache_flush {
        _sg.gl.cache.cur_pip = _sg_sref(null);
    }
    for i32 i = 0; i < num_color_atts; i++ {
        if action.colors[i].load_action == SG_LOADACTION_CLEAR {
            glClearBufferfv(GL_COLOR, i, &action.colors[i].clear_value.r);
        }
    }
    if is_swapchain_pass || atts.ds_view != null {
        if clear_depth && clear_stencil {
            glClearBufferfi(0x84F9, 0, action.depth.clear_value, action.stencil.clear_value);
        } else if clear_depth {
            glClearBufferfv(GL_DEPTH, 0, &action.depth.clear_value);
        } else if clear_stencil {
            var val = cast(i32, action.stencil.clear_value);
            glClearBufferiv(GL_STENCIL, 0, &val);
        }
    }
    for i32 i = 0; i < SG_MAX_COLOR_ATTACHMENTS; i++ {
        _sg.gl.color_store_actions[i] = action.colors[i].store_action;
    }
    _sg.gl.depth_store_action = action.depth.store_action;
    _sg.gl.stencil_store_action = action.stencil.store_action;
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_end_render_pass(_sg_attachments_ptrs_t* atts) {
    assert(cast(i64, atts));
    if !atts.empty {
        bool fb_read_bound = false;
        bool fb_draw_bound = false;
        i32 num_color_atts = atts.num_color_views;
        for i32 i = 0; i < num_color_atts; i++ {
            _sg_view_t* rsv_view = atts.resolve_views[i];
            if rsv_view != null && rsv_view.gl.msaa_resolve_frame_buffer != 0 {
                if fb_read_bound == 0 {
                    glBindFramebuffer(GL_READ_FRAMEBUFFER, _sg.gl.fb);
                    fb_read_bound = true;
                }
                _sg_image_t* rsv_img = _sg_image_ref_ptr(&rsv_view.cmn.img.ref);
                i32 w = rsv_img.cmn.width;
                i32 h = rsv_img.cmn.height;
                glBindFramebuffer(GL_DRAW_FRAMEBUFFER, rsv_view.gl.msaa_resolve_frame_buffer);
                glReadBuffer(cast(u32, GL_COLOR_ATTACHMENT0 + cast(u32, i)));
                glBlitFramebuffer(0, 0, w, h, 0, 0, w, h, GL_COLOR_BUFFER_BIT, GL_NEAREST);
                fb_draw_bound = true;
            }
        }
        ignore fb_draw_bound;
        if fb_draw_bound {
            glBindFramebuffer(GL_FRAMEBUFFER, _sg.gl.fb);
        }
        u32[10] invalidate_atts;
        i32 att_index = 0;
        for i32 i = 0; i < num_color_atts; i++ {
            if _sg.gl.color_store_actions[i] == SG_STOREACTION_DONTCARE {
                invalidate_atts[att_index++] = cast(u32, GL_COLOR_ATTACHMENT0 + cast(u32, i));
            }
        }
        if atts.ds_view == null {
            if _sg.gl.depth_store_action == SG_STOREACTION_DONTCARE {
                invalidate_atts[att_index++] = GL_DEPTH_ATTACHMENT;
            }
            if _sg.gl.stencil_store_action == SG_STOREACTION_DONTCARE {
                invalidate_atts[att_index++] = GL_STENCIL_ATTACHMENT;
            }
        }
        if att_index > 0 {
            glInvalidateFramebuffer(GL_DRAW_FRAMEBUFFER, att_index, invalidate_atts);
        }
    }
}

void _sg_gl_end_pass(_sg_attachments_ptrs_t* atts) {
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    if !_sg.cur_pass.is_compute {
        _sg_gl_end_render_pass(atts);
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_apply_viewport(i32 x, i32 y, i32 w, i32 h, bool origin_top_left) {
    y = origin_top_left != 0 ? _sg.cur_pass.dim.height - (y + h) : y;
    glViewport(x, y, w, h);
}

void _sg_gl_apply_scissor_rect(i32 x, i32 y, i32 w, i32 h, bool origin_top_left) {
    y = origin_top_left != 0 ? _sg.cur_pass.dim.height - (y + h) : y;
    glScissor(x, y, w, h);
}

void _sg_gl_color_mask(i32 cm) {
    u32 red = cast(u32, (cm & cast(i32, SG_COLORMASK_R)) != 0);
    u32 green = cast(u32, (cm & cast(i32, SG_COLORMASK_G)) != 0);
    u32 blue = cast(u32, (cm & cast(i32, SG_COLORMASK_B)) != 0);
    u32 alpha = cast(u32, (cm & cast(i32, SG_COLORMASK_A)) != 0);
    glColorMask(red, green, blue, alpha);
}

void _sg_gl_apply_render_pipeline_state(_sg_pipeline_t* pip) {
    _sg.gl.cache.cur_primitive_type = _sg_gl_primitive_type(pip.gl.primitive_type);
    _sg.gl.cache.cur_index_type = _sg_gl_index_type(pip.cmn.index_type);
    {
        sg_depth_state* state_ds = &pip.gl.depth;
        sg_depth_state* cache_ds = &_sg.gl.cache.depth;
        if state_ds.compare != cache_ds.compare {
            cache_ds.compare = state_ds.compare;
            glDepthFunc(_sg_gl_compare_func(state_ds.compare));
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        }
        if state_ds.write_enabled != cache_ds.write_enabled {
            cache_ds.write_enabled = state_ds.write_enabled;
            glDepthMask(state_ds.write_enabled);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        }
        if !(state_ds.bias - cache_ds.bias > -1.0e-6f && state_ds.bias - cache_ds.bias < 1.0e-6f) || !(state_ds.bias_slope_scale - cache_ds.bias_slope_scale > -1.0e-6f && state_ds.bias_slope_scale - cache_ds.bias_slope_scale < 1.0e-6f) {
            cache_ds.bias = state_ds.bias;
            cache_ds.bias_slope_scale = state_ds.bias_slope_scale;
            glPolygonOffset(state_ds.bias_slope_scale, state_ds.bias);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
            bool po_enabled = true;
            if state_ds.bias - 0.0f > -1.0e-6f && state_ds.bias - 0.0f < 1.0e-6f && (state_ds.bias_slope_scale - 0.0f > -1.0e-6f && state_ds.bias_slope_scale - 0.0f < 1.0e-6f) {
                po_enabled = false;
            }
            if po_enabled != _sg.gl.cache.polygon_offset_enabled {
                _sg.gl.cache.polygon_offset_enabled = po_enabled;
                if po_enabled {
                    glEnable(GL_POLYGON_OFFSET_FILL);
                } else {
                    glDisable(GL_POLYGON_OFFSET_FILL);
                }
                {
                    if _sg.stats_enabled {
                        _sg.stats.cur_frame.gl.num_render_state++;
                    }
                }
            }
        }
    }
    {
        sg_stencil_state* state_ss = &pip.gl.stencil;
        sg_stencil_state* cache_ss = &_sg.gl.cache.stencil;
        if state_ss.enabled != cache_ss.enabled {
            cache_ss.enabled = state_ss.enabled;
            if state_ss.enabled {
                glEnable(GL_STENCIL_TEST);
            } else {
                glDisable(GL_STENCIL_TEST);
            }
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        }
        if state_ss.write_mask != cache_ss.write_mask {
            cache_ss.write_mask = state_ss.write_mask;
            glStencilMask(state_ss.write_mask);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        }
        for i32 i = 0; i < 2; i++ {
            sg_stencil_face_state* state_sfs = i == 0 ? &state_ss.front : &state_ss.back;
            sg_stencil_face_state* cache_sfs = i == 0 ? &cache_ss.front : &cache_ss.back;
            u32 gl_face = i == 0 ? GL_FRONT : GL_BACK;
            if state_sfs.compare != cache_sfs.compare || state_ss.read_mask != cache_ss.read_mask || state_ss.ref != cache_ss.ref {
                cache_sfs.compare = state_sfs.compare;
                glStencilFuncSeparate(gl_face, _sg_gl_compare_func(state_sfs.compare), state_ss.ref, state_ss.read_mask);
                {
                    if _sg.stats_enabled {
                        _sg.stats.cur_frame.gl.num_render_state++;
                    }
                }
            }
            if state_sfs.fail_op != cache_sfs.fail_op || state_sfs.depth_fail_op != cache_sfs.depth_fail_op || state_sfs.pass_op != cache_sfs.pass_op {
                cache_sfs.fail_op = state_sfs.fail_op;
                cache_sfs.depth_fail_op = state_sfs.depth_fail_op;
                cache_sfs.pass_op = state_sfs.pass_op;
                glStencilOpSeparate(gl_face, _sg_gl_stencil_op(state_sfs.fail_op), _sg_gl_stencil_op(state_sfs.depth_fail_op), _sg_gl_stencil_op(state_sfs.pass_op));
                {
                    if _sg.stats_enabled {
                        _sg.stats.cur_frame.gl.num_render_state++;
                    }
                }
            }
        }
        cache_ss.read_mask = state_ss.read_mask;
        cache_ss.ref = state_ss.ref;
    }
    if pip.cmn.color_count > 0 {
        sg_blend_state* state_bs = &pip.gl.blend;
        sg_blend_state* cache_bs = &_sg.gl.cache.blend;
        if state_bs.enabled != cache_bs.enabled {
            cache_bs.enabled = state_bs.enabled;
            if state_bs.enabled {
                glEnable(GL_BLEND);
            } else {
                glDisable(GL_BLEND);
            }
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        }
        if state_bs.src_factor_rgb != cache_bs.src_factor_rgb || state_bs.dst_factor_rgb != cache_bs.dst_factor_rgb || state_bs.src_factor_alpha != cache_bs.src_factor_alpha || state_bs.dst_factor_alpha != cache_bs.dst_factor_alpha {
            cache_bs.src_factor_rgb = state_bs.src_factor_rgb;
            cache_bs.dst_factor_rgb = state_bs.dst_factor_rgb;
            cache_bs.src_factor_alpha = state_bs.src_factor_alpha;
            cache_bs.dst_factor_alpha = state_bs.dst_factor_alpha;
            glBlendFuncSeparate(_sg_gl_blend_factor(state_bs.src_factor_rgb), _sg_gl_blend_factor(state_bs.dst_factor_rgb), _sg_gl_blend_factor(state_bs.src_factor_alpha), _sg_gl_blend_factor(state_bs.dst_factor_alpha));
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        }
        if state_bs.op_rgb != cache_bs.op_rgb || state_bs.op_alpha != cache_bs.op_alpha {
            cache_bs.op_rgb = state_bs.op_rgb;
            cache_bs.op_alpha = state_bs.op_alpha;
            glBlendEquationSeparate(_sg_gl_blend_op(state_bs.op_rgb), _sg_gl_blend_op(state_bs.op_alpha));
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        }
        for u32 i = 0; i < cast(u32, pip.cmn.color_count); i++ {
            if pip.gl.color_write_mask[i] != _sg.gl.cache.color_write_mask[i] {
                i32 cm = pip.gl.color_write_mask[i];
                _sg.gl.cache.color_write_mask[i] = cm;
                if _sg.features.mrt_independent_write_mask != 0 {
                    assert(cast(i64, false));
                } else if 0 == i {
                    _sg_gl_color_mask(cm);
                }
                {
                    if _sg.stats_enabled {
                        _sg.stats.cur_frame.gl.num_render_state++;
                    }
                }
            }
        }
        if !(pip.cmn.blend_color.r - _sg.gl.cache.blend_color.r > -0.0001f && pip.cmn.blend_color.r - _sg.gl.cache.blend_color.r < 0.0001f) || !(pip.cmn.blend_color.g - _sg.gl.cache.blend_color.g > -0.0001f && pip.cmn.blend_color.g - _sg.gl.cache.blend_color.g < 0.0001f) || !(pip.cmn.blend_color.b - _sg.gl.cache.blend_color.b > -0.0001f && pip.cmn.blend_color.b - _sg.gl.cache.blend_color.b < 0.0001f) || !(pip.cmn.blend_color.a - _sg.gl.cache.blend_color.a > -0.0001f && pip.cmn.blend_color.a - _sg.gl.cache.blend_color.a < 0.0001f) {
            sg_color c = pip.cmn.blend_color;
            _sg.gl.cache.blend_color = c;
            glBlendColor(c.r, c.g, c.b, c.a);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        }
    }
    if pip.gl.cull_mode != _sg.gl.cache.cull_mode {
        _sg.gl.cache.cull_mode = pip.gl.cull_mode;
        if SG_CULLMODE_NONE == pip.gl.cull_mode {
            glDisable(GL_CULL_FACE);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state++;
                }
            }
        } else {
            glEnable(GL_CULL_FACE);
            u32 gl_mode = cast(i32, SG_CULLMODE_FRONT) == pip.gl.cull_mode ? GL_FRONT : GL_BACK;
            glCullFace(gl_mode);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_render_state += 2;
                }
            }
        }
    }
    if pip.gl.face_winding != _sg.gl.cache.face_winding {
        _sg.gl.cache.face_winding = pip.gl.face_winding;
        u32 gl_winding = cast(i32, SG_FACEWINDING_CW) == pip.gl.face_winding ? GL_CW : GL_CCW;
        glFrontFace(gl_winding);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_render_state++;
            }
        }
    }
    if pip.gl.alpha_to_coverage_enabled != _sg.gl.cache.alpha_to_coverage_enabled {
        _sg.gl.cache.alpha_to_coverage_enabled = pip.gl.alpha_to_coverage_enabled;
        if pip.gl.alpha_to_coverage_enabled != 0 {
            glEnable(GL_SAMPLE_ALPHA_TO_COVERAGE);
        } else {
            glDisable(GL_SAMPLE_ALPHA_TO_COVERAGE);
        }
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_render_state++;
            }
        }
    }
}

void _sg_gl_apply_pipeline(_sg_pipeline_t* pip) {
    assert(cast(i64, pip));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    if !_sg_sref_slot_eql(&_sg.gl.cache.cur_pip, &pip.slot) {
        _sg.gl.cache.cur_pip = _sg_sref(&pip.slot);
        _sg_shader_t* shd = _sg_shader_ref_ptr(&pip.cmn.shader);
        if shd.gl.prog != _sg.gl.cache.prog {
            _sg.gl.cache.prog = shd.gl.prog;
            glUseProgram(shd.gl.prog);
            {
                if _sg.stats_enabled {
                    _sg.stats.cur_frame.gl.num_use_program++;
                }
            }
        }
        if !pip.cmn.is_compute {
            _sg_gl_apply_render_pipeline_state(pip);
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

bool _sg_gl_apply_bindings(_sg_bindings_ptrs_t* bnd) {
    assert(cast(i64, bnd));
    assert(cast(i64, bnd.pip));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg_shader_t* shd = _sg_shader_ref_ptr(&bnd.pip.cmn.shader);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for u64 tex_smp_index = 0; tex_smp_index < cast(u64, SG_MAX_TEXTURE_SAMPLER_PAIRS); tex_smp_index++ {
        _sg_shader_texture_sampler_t* tex_smp = &shd.cmn.texture_samplers[tex_smp_index];
        if tex_smp.stage == SG_SHADERSTAGE_NONE {
            continue;
        }
        var gl_tex_slot = shd.gl.tex_slot[tex_smp_index];
        if gl_tex_slot != -1 {
            assert(cast(i32, tex_smp.view_slot) < SG_MAX_VIEW_BINDSLOTS);
            assert(cast(i32, tex_smp.sampler_slot) < SG_MAX_SAMPLER_BINDSLOTS);
            _sg_view_t* view = bnd.views[tex_smp.view_slot];
            _sg_sampler_t* smp = bnd.smps[tex_smp.sampler_slot];
            assert(cast(i64, view));
            assert(cast(i64, smp));
            _sg_image_t* img = _sg_image_ref_ptr(&view.cmn.img.ref);
            u32 gl_tgt = img.gl.target;
            u32 gl_smp = smp.gl.smp;
            u32 gl_tex;
            if _sg.features.gl_texture_views {
                gl_tex = view.gl.tex_view[img.cmn.active_slot];
            } else {
                gl_tex = img.gl.tex[img.cmn.active_slot];
            }
            _sg_gl_cache_bind_texture_sampler(gl_tex_slot, gl_tgt, gl_tex, gl_smp);
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    for u64 i = 0; i < cast(u64, SG_MAX_VIEW_BINDSLOTS); i++ {
        if shd.cmn.views[i].stage == SG_SHADERSTAGE_NONE {
            continue;
        }
        _sg_view_t* view = bnd.views[i];
        if view.cmn.type == SG_VIEWTYPE_STORAGEBUFFER {
            _sg_buffer_t* sbuf = _sg_buffer_ref_ptr(&view.cmn.buf.ref);
            u8 gl_binding = shd.gl.sbuf_binding[i];
            u32 gl_sbuf = sbuf.gl.buf[sbuf.cmn.active_slot];
            _sg_gl_cache_bind_storage_buffer(gl_binding, gl_sbuf, view.cmn.buf.offset, sbuf.cmn.size);
        } else if view.cmn.type == SG_VIEWTYPE_STORAGEIMAGE {
        }
    }
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    if !bnd.pip.cmn.is_compute {
        u32 gl_ib = bnd.ib != null ? bnd.ib.gl.buf[bnd.ib.cmn.active_slot] : 0;
        _sg_gl_cache_bind_buffer(GL_ELEMENT_ARRAY_BUFFER, gl_ib);
        _sg.gl.cache.cur_ib_offset = bnd.ib_offset;
        for u32 attr_index = 0; attr_index < cast(u32, _sg.limits.max_vertex_attrs); attr_index++ {
            _sg_gl_attr_t* attr = &bnd.pip.gl.attrs[attr_index];
            _sg_gl_cache_attr_t* cache_attr = &_sg.gl.cache.attrs[attr_index];
            bool cache_attr_dirty = false;
            i32 vb_offset = 0;
            u32 gl_vb = 0;
            if attr.vb_index >= 0 {
                assert(attr.vb_index < SG_MAX_VERTEXBUFFER_BINDSLOTS);
                _sg_buffer_t* vb = bnd.vbs[attr.vb_index];
                assert(cast(i64, vb));
                gl_vb = vb.gl.buf[vb.cmn.active_slot];
                vb_offset = bnd.vb_offsets[attr.vb_index] + attr.offset;
                if gl_vb != cache_attr.gl_vbuf || attr.size != cache_attr.gl_attr.size || attr.type != cache_attr.gl_attr.type || attr.normalized != cache_attr.gl_attr.normalized || attr.base_type != cache_attr.gl_attr.base_type || attr.stride != cache_attr.gl_attr.stride || vb_offset != cache_attr.gl_attr.offset || cache_attr.gl_attr.divisor != attr.divisor {
                    _sg_gl_cache_bind_buffer(GL_ARRAY_BUFFER, gl_vb);
                    if attr.base_type == SG_SHADERATTRBASETYPE_FLOAT {
                        glVertexAttribPointer(attr_index, attr.size, attr.type, attr.normalized, attr.stride, cast(void*, cast(i64, vb_offset)));
                    } else {
                        glVertexAttribIPointer(attr_index, attr.size, attr.type, attr.stride, cast(void*, cast(i64, vb_offset)));
                    }
                    {
                        if _sg.stats_enabled {
                            _sg.stats.cur_frame.gl.num_vertex_attrib_pointer++;
                        }
                    }
                    glVertexAttribDivisor(attr_index, cast(u32, attr.divisor));
                    {
                        if _sg.stats_enabled {
                            _sg.stats.cur_frame.gl.num_vertex_attrib_divisor++;
                        }
                    }
                    cache_attr_dirty = true;
                }
                if cache_attr.gl_attr.vb_index == -1 {
                    glEnableVertexAttribArray(attr_index);
                    {
                        if _sg.stats_enabled {
                            _sg.stats.cur_frame.gl.num_enable_vertex_attrib_array++;
                        }
                    }
                    cache_attr_dirty = true;
                }
            } else {
                if cache_attr.gl_attr.vb_index != -1 {
                    glDisableVertexAttribArray(attr_index);
                    {
                        if _sg.stats_enabled {
                            _sg.stats.cur_frame.gl.num_disable_vertex_attrib_array++;
                        }
                    }
                    cache_attr_dirty = true;
                }
            }
            if cache_attr_dirty {
                cache_attr.gl_attr = *attr;
                cache_attr.gl_attr.offset = vb_offset;
                cache_attr.gl_vbuf = gl_vb;
            }
        }
        when !(arch(wasm)) && defined(SOKOL_DEBUG) {
            {
                assert(glGetError() == GL_NO_ERROR);
            }
        }
    }
    return true;
}

void _sg_gl_apply_uniforms(i32 ub_slot, sg_range* data) {
    assert(ub_slot >= 0 && ub_slot < SG_MAX_UNIFORMBLOCK_BINDSLOTS);
    _sg_pipeline_t* pip = _sg_pipeline_ref_ptr(&_sg.cur_pip);
    _sg_shader_t* shd = _sg_shader_ref_ptr(&pip.cmn.shader);
    assert(SG_SHADERSTAGE_NONE != shd.cmn.uniform_blocks[ub_slot].stage);
    assert(data.size == shd.cmn.uniform_blocks[ub_slot].size);
    _sg_gl_uniform_block_t* gl_ub = &shd.gl.uniform_blocks[ub_slot];
    for i32 u_index = 0; u_index < gl_ub.num_uniforms; u_index++ {
        _sg_gl_uniform_t* u = &gl_ub.uniforms[u_index];
        assert(u.type != SG_UNIFORMTYPE_INVALID);
        if u.gl_loc == -1 {
            continue;
        }
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.gl.num_uniform++;
            }
        }
        var fptr = cast(f32*, cast(u8*, data.ptr) + u.offset);
        var iptr = cast(i32*, cast(u8*, data.ptr) + u.offset);
        switch u.type {
            case SG_UNIFORMTYPE_INVALID: {
            }
            case SG_UNIFORMTYPE_FLOAT: {
                glUniform1fv(u.gl_loc, u.count, fptr);
            }
            case SG_UNIFORMTYPE_FLOAT2: {
                glUniform2fv(u.gl_loc, u.count, fptr);
            }
            case SG_UNIFORMTYPE_FLOAT3: {
                glUniform3fv(u.gl_loc, u.count, fptr);
            }
            case SG_UNIFORMTYPE_FLOAT4: {
                glUniform4fv(u.gl_loc, u.count, fptr);
            }
            case SG_UNIFORMTYPE_INT: {
                glUniform1iv(u.gl_loc, u.count, iptr);
            }
            case SG_UNIFORMTYPE_INT2: {
                glUniform2iv(u.gl_loc, u.count, iptr);
            }
            case SG_UNIFORMTYPE_INT3: {
                glUniform3iv(u.gl_loc, u.count, iptr);
            }
            case SG_UNIFORMTYPE_INT4: {
                glUniform4iv(u.gl_loc, u.count, iptr);
            }
            case SG_UNIFORMTYPE_MAT4: {
                glUniformMatrix4fv(u.gl_loc, u.count, GL_FALSE, fptr);
            }
            default: {
                assert(cast(i64, false));
            }
        }
    }
}

void _sg_gl_draw(i32 base_element, i32 num_elements, i32 num_instances, i32 base_vertex, i32 base_instance) {
    u32 p_type = _sg.gl.cache.cur_primitive_type;
    bool use_instanced_draw = num_instances > 1 || _sg.use_instanced_draw;
    if _sg.use_indexed_draw != 0 {
        u32 i_type = _sg.gl.cache.cur_index_type;
        i32 i_size = i_type == GL_UNSIGNED_SHORT ? 2 : 4;
        i32 ib_offset = _sg.gl.cache.cur_ib_offset;
        var indices = cast(void*, cast(i64, base_element * i_size + ib_offset));
        if use_instanced_draw {
            if base_vertex == 0 && base_instance == 0 {
                glDrawElementsInstanced(p_type, num_elements, i_type, indices, num_instances);
            } else if base_vertex != 0 && base_instance == 0 && _sg.features.draw_base_vertex {
            } else if base_instance != 0 && _sg.features.draw_base_instance {
            }
        } else {
            if base_vertex == 0 {
                glDrawElements(p_type, num_elements, i_type, indices);
            } else if _sg.features.draw_base_vertex {
            }
        }
    } else {
        if use_instanced_draw {
            if base_instance == 0 {
                glDrawArraysInstanced(p_type, base_element, num_elements, num_instances);
            } else if _sg.features.draw_base_instance {
            }
        } else {
            glDrawArrays(p_type, base_element, num_elements);
        }
    }
}

void _sg_gl_dispatch(i32 num_groups_x, i32 num_groups_y, i32 num_groups_z) {
    ignore num_groups_x;
    ignore num_groups_y;
    ignore num_groups_z;
}

void _sg_gl_commit() {
    _sg_gl_cache_clear_buffer_bindings(false);
    _sg_gl_cache_clear_texture_sampler_bindings(false);
}

void _sg_gl_write_buffer_common(_sg_buffer_t* buf, sg_write_buffer_desc* desc) {
    assert(desc.src.data.ptr != null && desc.src.data.size > 0);
    assert(desc.dst.offset + desc.size <= cast(u64, buf.cmn.size));
    assert(desc.src.offset + desc.size <= desc.src.data.size);
    assert(buf.cmn.active_slot < buf.cmn.num_slots);
    u8* src_ptr = cast(u8*, desc.src.data.ptr) + desc.src.offset;
    u32 gl_tgt = _sg_gl_buffer_target(&buf.cmn.usage);
    u32 gl_buf = buf.gl.buf[buf.cmn.active_slot];
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    _sg_gl_cache_store_buffer_binding(gl_tgt);
    _sg_gl_cache_bind_buffer(gl_tgt, gl_buf);
    glBufferSubData(gl_tgt, cast(i64, desc.dst.offset), cast(i64, desc.size), cast(void*, src_ptr));
    _sg_gl_cache_restore_buffer_binding(gl_tgt);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_write_buffer_transient(_sg_buffer_t* buf, sg_write_buffer_desc* desc, bool first_time_in_frame) {
    assert(buf != null && desc != null);
    assert(SG_RESOURCESTATE_VALID == buf.slot.state);
    assert(cast(i64, buf.cmn.usage.write_transient));
    ignore first_time_in_frame;
    _sg_gl_write_buffer_common(buf, desc);
}

void _sg_gl_write_buffer_unsealed(_sg_buffer_t* buf, sg_write_buffer_desc* desc) {
    assert(buf != null && desc != null);
    assert(SG_RESOURCESTATE_UNSEALED == buf.slot.state);
    assert(cast(i64, buf.cmn.usage.write_unsealed));
    assert(cast(i64, buf.gl.buf[buf.cmn.active_slot]));
    _sg_gl_write_buffer_common(buf, desc);
}

void _sg_gl_write_image_common(_sg_image_t* img, sg_write_image_desc* desc) {
    assert(img.cmn.active_slot < img.cmn.num_slots);
    _sg_gl_cache_store_texture_sampler_binding(0);
    _sg_gl_cache_bind_texture_sampler(0, img.gl.target, img.gl.tex[img.cmn.active_slot], 0);
    _sg_gl_write_miplevel_data(img, cast(u8*, desc.src.data.ptr), desc.src.data.size, desc.src.offset, desc.src.bytes_per_row, desc.src.bytes_per_slice, desc.dst.mip_level, desc.dst.x, desc.dst.y, desc.dst.slice, desc.size.width, desc.size.height, desc.size.num_slices);
    _sg_gl_cache_restore_texture_sampler_binding(0);
}

void _sg_gl_write_image_transient(_sg_image_t* img, sg_write_image_desc* desc, bool first_time_in_frame) {
    assert(img != null && desc != null);
    assert(SG_RESOURCESTATE_VALID == img.slot.state);
    assert(cast(i64, img.cmn.usage.write_transient));
    ignore first_time_in_frame;
    _sg_gl_write_image_common(img, desc);
}

void _sg_gl_write_image_unsealed(_sg_image_t* img, sg_write_image_desc* desc) {
    assert(img != null && desc != null);
    assert(SG_RESOURCESTATE_UNSEALED == img.slot.state);
    assert(cast(i64, img.cmn.usage.write_unsealed));
    assert(0 == img.cmn.active_slot);
    _sg_gl_write_image_common(img, desc);
}

void _sg_gl_copy_buffer_to_buffer(_sg_buffer_t* src_buf, _sg_buffer_t* dst_buf, sg_copy_buffer_to_buffer_desc* desc) {
    assert(src_buf != null && dst_buf != null && desc != null);
    assert(cast(i64, src_buf.cmn.usage.copy_src));
    assert(cast(i64, dst_buf.cmn.usage.copy_dst));
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
    u32 gl_src_buf = src_buf.gl.buf[src_buf.cmn.active_slot];
    u32 gl_dst_buf = dst_buf.gl.buf[dst_buf.cmn.active_slot];
    glBindBuffer(GL_COPY_READ_BUFFER, gl_src_buf);
    glBindBuffer(GL_COPY_WRITE_BUFFER, gl_dst_buf);
    var gl_read_offset = cast(i64, desc.src.offset);
    var gl_write_offset = cast(i64, desc.dst.offset);
    var gl_size = cast(i64, desc.size);
    glCopyBufferSubData(GL_COPY_READ_BUFFER, GL_COPY_WRITE_BUFFER, gl_read_offset, gl_write_offset, gl_size);
    glBindBuffer(GL_COPY_READ_BUFFER, 0);
    glBindBuffer(GL_COPY_WRITE_BUFFER, 0);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

void _sg_gl_copy_buffer_to_image(_sg_buffer_t* src_buf, _sg_image_t* dst_img, sg_copy_buffer_to_image_desc* desc) {
    assert(src_buf != null && dst_img != null && desc != null);
    assert(cast(i64, src_buf.cmn.usage.copy_src));
    assert(cast(i64, dst_img.cmn.usage.copy_dst));
    assert(cast(i64, !src_buf.cmn.usage.staging_index_buffer));
    u8* src_ptr = null;
    if src_ptr == null {
        u32 gl_src_buf = src_buf.gl.buf[src_buf.cmn.active_slot];
        glBindBuffer(GL_PIXEL_UNPACK_BUFFER, gl_src_buf);
    }
    u32 gl_dst_img = dst_img.gl.tex[dst_img.cmn.active_slot];
    _sg_gl_cache_store_texture_sampler_binding(0);
    _sg_gl_cache_bind_texture_sampler(0, dst_img.gl.target, gl_dst_img, 0);
    _sg_gl_write_miplevel_data(dst_img, src_ptr, cast(u64, src_buf.cmn.size), desc.src.offset, desc.src.bytes_per_row, desc.src.bytes_per_slice, desc.dst.mip_level, desc.dst.x, desc.dst.y, desc.dst.slice, desc.size.width, desc.size.height, desc.size.num_slices);
    _sg_gl_cache_restore_texture_sampler_binding(0);
    glBindBuffer(GL_PIXEL_UNPACK_BUFFER, 0);
    when !(arch(wasm)) && defined(SOKOL_DEBUG) {
        {
            assert(glGetError() == GL_NO_ERROR);
        }
    }
}

// ██████  ██████  ██████   ██  ██     ██████   █████   ██████ ██   ██ ███████ ███    ██ ██████
// ██   ██      ██ ██   ██ ███ ███     ██   ██ ██   ██ ██      ██  ██  ██      ████   ██ ██   ██
// ██   ██  █████  ██   ██  ██  ██     ██████  ███████ ██      █████   █████   ██ ██  ██ ██   ██
// ██   ██      ██ ██   ██  ██  ██     ██   ██ ██   ██ ██      ██  ██  ██      ██  ██ ██ ██   ██
// ██████  ██████  ██████   ██  ██     ██████  ██   ██  ██████ ██   ██ ███████ ██   ████ ██████
//
// >>d3d11 backend
//  ██████  ███████ ███    ██ ███████ ██████  ██  ██████     ██████   █████   ██████ ██   ██ ███████ ███    ██ ██████
// ██       ██      ████   ██ ██      ██   ██ ██ ██          ██   ██ ██   ██ ██      ██  ██  ██      ████   ██ ██   ██
// ██   ███ █████   ██ ██  ██ █████   ██████  ██ ██          ██████  ███████ ██      █████   █████   ██ ██  ██ ██   ██
// ██    ██ ██      ██  ██ ██ ██      ██   ██ ██ ██          ██   ██ ██   ██ ██      ██  ██  ██      ██  ██ ██ ██   ██
//  ██████  ███████ ██   ████ ███████ ██   ██ ██  ██████     ██████  ██   ██  ██████ ██   ██ ███████ ██   ████ ██████
//
// >>generic backend
void _sg_setup_backend(sg_desc* desc) {
    _sg_gl_setup_backend(desc);
}

void _sg_discard_backend() {
    _sg_gl_discard_backend();
}

void _sg_reset_state_cache() {
    _sg_gl_reset_state_cache();
}

sg_resource_state _sg_create_buffer(_sg_buffer_t* buf, sg_buffer_desc* desc) {
    return _sg_gl_create_buffer(buf, desc);
}

void _sg_discard_buffer(_sg_buffer_t* buf) {
    _sg_gl_discard_buffer(buf);
}

sg_resource_state _sg_create_image(_sg_image_t* img, sg_image_desc* desc) {
    return _sg_gl_create_image(img, desc);
}

void _sg_discard_image(_sg_image_t* img) {
    _sg_gl_discard_image(img);
}

sg_resource_state _sg_create_sampler(_sg_sampler_t* smp, sg_sampler_desc* desc) {
    return _sg_gl_create_sampler(smp, desc);
}

void _sg_discard_sampler(_sg_sampler_t* smp) {
    _sg_gl_discard_sampler(smp);
}

sg_resource_state _sg_create_shader(_sg_shader_t* shd, sg_shader_desc* desc) {
    return _sg_gl_create_shader(shd, desc);
}

void _sg_discard_shader(_sg_shader_t* shd) {
    _sg_gl_discard_shader(shd);
}

sg_resource_state _sg_create_pipeline(_sg_pipeline_t* pip, sg_pipeline_desc* desc) {
    return _sg_gl_create_pipeline(pip, desc);
}

void _sg_discard_pipeline(_sg_pipeline_t* pip) {
    _sg_gl_discard_pipeline(pip);
}

sg_resource_state _sg_create_view(_sg_view_t* view, sg_view_desc* desc) {
    return _sg_gl_create_view(view, desc);
}

void _sg_discard_view(_sg_view_t* view) {
    _sg_gl_discard_view(view);
}

void _sg_begin_pass(sg_pass* pass, _sg_attachments_ptrs_t* atts) {
    _sg_gl_begin_pass(pass, atts);
}

void _sg_end_pass(_sg_attachments_ptrs_t* atts) {
    _sg_gl_end_pass(atts);
}

void _sg_apply_viewport(i32 x, i32 y, i32 w, i32 h, bool origin_top_left) {
    _sg_gl_apply_viewport(x, y, w, h, origin_top_left);
}

void _sg_apply_scissor_rect(i32 x, i32 y, i32 w, i32 h, bool origin_top_left) {
    _sg_gl_apply_scissor_rect(x, y, w, h, origin_top_left);
}

void _sg_apply_pipeline(_sg_pipeline_t* pip) {
    _sg_gl_apply_pipeline(pip);
}

bool _sg_apply_bindings(_sg_bindings_ptrs_t* bnd) {
    return _sg_gl_apply_bindings(bnd);
}

void _sg_apply_uniforms(i32 ub_slot, sg_range* data) {
    _sg_gl_apply_uniforms(ub_slot, data);
}

void _sg_draw(i32 base_element, i32 num_elements, i32 num_instances, i32 base_vertex, i32 base_index) {
    _sg_gl_draw(base_element, num_elements, num_instances, base_vertex, base_index);
}

void _sg_dispatch(i32 num_groups_x, i32 num_groups_y, i32 num_groups_z) {
    _sg_gl_dispatch(num_groups_x, num_groups_y, num_groups_z);
}

void _sg_commit() {
    _sg_gl_commit();
}

void _sg_write_buffer_transient(_sg_buffer_t* buf, sg_write_buffer_desc* desc, bool first_time_in_frame) {
    _sg_gl_write_buffer_transient(buf, desc, first_time_in_frame);
}

void _sg_write_image_transient(_sg_image_t* img, sg_write_image_desc* desc, bool first_time_in_frame) {
    _sg_gl_write_image_transient(img, desc, first_time_in_frame);
}

void _sg_write_buffer_unsealed(_sg_buffer_t* buf, sg_write_buffer_desc* desc) {
    _sg_gl_write_buffer_unsealed(buf, desc);
}

void _sg_write_image_unsealed(_sg_image_t* img, sg_write_image_desc* desc) {
    _sg_gl_write_image_unsealed(img, desc);
}

void _sg_seal_buffer(_sg_buffer_t* buf) {
    _sg_gl_seal_buffer(buf);
}

void _sg_seal_image(_sg_image_t* img) {
    _sg_gl_seal_image(img);
}

void _sg_copy_buffer_to_buffer(_sg_buffer_t* src_buf, _sg_buffer_t* dst_buf, sg_copy_buffer_to_buffer_desc* desc) {
    _sg_gl_copy_buffer_to_buffer(src_buf, dst_buf, desc);
}

void _sg_copy_buffer_to_image(_sg_buffer_t* src_buf, _sg_image_t* dst_img, sg_copy_buffer_to_image_desc* desc) {
    _sg_gl_copy_buffer_to_image(src_buf, dst_img, desc);
}

void _sg_push_debug_group(u8* name) {
    ignore name;
}

void _sg_pop_debug_group() {
}
}
// ██    ██  █████  ██      ██ ██████   █████  ████████ ██  ██████  ███    ██
// ██    ██ ██   ██ ██      ██ ██   ██ ██   ██    ██    ██ ██    ██ ████   ██
// ██    ██ ███████ ██      ██ ██   ██ ███████    ██    ██ ██    ██ ██ ██  ██
//  ██  ██  ██   ██ ██      ██ ██   ██ ██   ██    ██    ██ ██    ██ ██  ██ ██
//   ████   ██   ██ ███████ ██ ██████  ██   ██    ██    ██  ██████  ██   ████
//
// >>validation
when defined(SOKOL_DEBUG) {

private {
void _sg_validate_begin() {
    _sg.validate_error = SG_LOGITEM_OK;
}

bool _sg_validate_end() {
    if _sg.validate_error != SG_LOGITEM_OK {
        _sg_log(SG_LOGITEM_VALIDATION_FAILED, 0, null, __line__);
        return false;
    } else {
        return true;
    }
}
}
}

private {
bool _sg_one(bool b0, bool b1, bool b2) {
    return cast(i32, b0) + cast(i32, b1) + cast(i32, b2) == 1;
}

bool _sg_validate_buffer_desc(sg_buffer_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(cast(i64, desc));
        bool injected = desc.gl_buffer || desc.mtl_buffer || desc.d3d11_buffer || desc.wgpu_buffer;
        _sg_validate_begin();
        if desc._start_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_CANARY, 1, null, __line__);
        }
        if desc._end_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_CANARY, 1, null, __line__);
        }
        if desc.size > 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_NONZERO_SIZE;
            _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_NONZERO_SIZE, 1, null, __line__);
        }
        if desc.usage.staging_buffer || desc.usage.staging_index_buffer {
            if desc.usage.vertex_buffer {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_VERTEXBUFFER;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_VERTEXBUFFER, 1, null, __line__);
            }
            if desc.usage.index_buffer {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INDEXBUFFER;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INDEXBUFFER, 1, null, __line__);
            }
            if desc.usage.storage_buffer {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_STORAGEBUFFER;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_STORAGEBUFFER, 1, null, __line__);
            }
            if injected {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INJECTED;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INJECTED, 1, null, __line__);
            }
            if desc.usage.copy_dst {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_COPYDST;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_COPYDST, 1, null, __line__);
            }
            if !desc.usage.copy_src {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_COPYSRC;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_COPYSRC, 1, null, __line__);
            }
            if null == desc.data.ptr == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INITIALDATA;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STAGING_VS_INITIALDATA, 1, null, __line__);
            }
        }
        if _sg.features.separate_buffer_types && !(desc.usage.staging_buffer || desc.usage.staging_index_buffer) {
            if _sg_one(desc.usage.vertex_buffer, desc.usage.index_buffer, desc.usage.storage_buffer) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_SEPARATE_BUFFER_TYPES;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_SEPARATE_BUFFER_TYPES, 1, null, __line__);
            }
        }
        if desc.usage.write_unsealed {
            if desc.usage.write_transient {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_WRITETRANSIENT;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_WRITETRANSIENT, 1, null, __line__);
            }
            if desc.usage.copy_dst {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_COPYDST;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_COPYDST, 1, null, __line__);
            }
            if !(desc.usage.staging_buffer || desc.usage.staging_index_buffer) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_STAGING;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_STAGING, 1, null, __line__);
            }
            if null == desc.data.ptr == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_INITIALDATA;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_WRITEUNSEALED_VS_INITIALDATA, 1, null, __line__);
            }
        }
        if desc.usage.write_transient {
            if desc.usage.copy_dst {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_COPYDST;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_COPYDST, 1, null, __line__);
            }
            if null == desc.data.ptr == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_INITIALDATA;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_INITIALDATA, 1, null, __line__);
            }
            if injected {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_INJECTED;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_WRITETRANSIENT_VS_INJECTED, 1, null, __line__);
            }
        }
        if desc.usage.copy_dst {
            if null == desc.data.ptr == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_COPYDST_VS_INITIALDATA;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_COPYDST_VS_INITIALDATA, 1, null, __line__);
            }
        }
        if desc.data.ptr != null {
            if desc.size == desc.data.size == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_MATCHING_DATA_SIZE;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_MATCHING_DATA_SIZE, 1, null, __line__);
            }
        } else {
            if desc.data.size == 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_ZERO_DATA_SIZE;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_ZERO_DATA_SIZE, 1, null, __line__);
            }
            if !injected && !desc.usage.storage_buffer {
                bool writable = desc.usage.write_unsealed || desc.usage.write_transient || desc.usage.copy_dst;
                if writable == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_DATA;
                    _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_EXPECT_DATA, 1, null, __line__);
                }
            }
        }
        if desc.usage.storage_buffer {
            if !_sg.features.compute {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STORAGEBUFFER_SUPPORTED;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STORAGEBUFFER_SUPPORTED, 1, null, __line__);
            }
            if _sg_multiple_u64(desc.size, 4) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BUFFERDESC_STORAGEBUFFER_SIZE_MULTIPLE_4;
                _sg_log(SG_LOGITEM_VALIDATE_BUFFERDESC_STORAGEBUFFER_SIZE_MULTIPLE_4, 1, null, __line__);
            }
        }
        return _sg_validate_end();
    }
}

void _sg_validate_image_data(sg_image_data* data, sg_pixel_format fmt, i32 width, i32 height, i32 num_mips, i32 num_slices) {
    when !defined(SOKOL_DEBUG) {
        ignore data;
        ignore fmt;
        ignore width;
        ignore height;
        ignore num_mips;
        ignore num_slices;
    } else {
        for i32 mip_index = 0; mip_index < num_mips; mip_index++ {
            bool has_data = data.mip_levels[mip_index].ptr != null;
            bool has_size = data.mip_levels[mip_index].size > 0;
            if (has_data && has_size) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDATA_NODATA;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDATA_NODATA, 1, null, __line__);
            }
            i32 mip_width = _sg_miplevel_dim(width, mip_index);
            i32 mip_height = _sg_miplevel_dim(height, mip_index);
            i32 bytes_per_slice = _sg_surface_pitch(fmt, mip_width, mip_height, 1);
            i32 expected_size = bytes_per_slice * num_slices;
            if expected_size == cast(i32, data.mip_levels[mip_index].size) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDATA_DATA_SIZE;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDATA_DATA_SIZE, 1, null, __line__);
            }
        }
    }
}

bool _sg_validate_image_desc(sg_image_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(cast(i64, desc));
        sg_image_usage* usg = &desc.usage;
        bool any_attachment = usg.color_attachment || usg.resolve_attachment || usg.depth_stencil_attachment;
        _sg_validate_begin();
        if desc._start_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_CANARY, 1, null, __line__);
        }
        if desc._end_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_CANARY, 1, null, __line__);
        }
        if _sg_one(usg.immutable, usg.write_transient, usg.copy_dst) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_IMMUTABLE_VS_WRITABLE;
            _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_IMMUTABLE_VS_WRITABLE, 1, null, __line__);
        }
        if !(usg.color_attachment && usg.depth_stencil_attachment) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_COLOR_DEPTH_STENCIL;
            _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_COLOR_DEPTH_STENCIL, 1, null, __line__);
        }
        switch desc.type {
            case SG_IMAGETYPE_2D: {
                if desc.num_slices == 1 == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_2D_NUMSLICES;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_2D_NUMSLICES, 1, null, __line__);
                }
            }
            case SG_IMAGETYPE_CUBE: {
                if desc.num_slices == 6 == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_CUBE_NUMSLICES;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_CUBE_NUMSLICES, 1, null, __line__);
                }
            }
            case SG_IMAGETYPE_ARRAY: {
                if (desc.num_slices >= 1 && desc.num_slices <= _sg.limits.max_image_array_layers) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_ARRAY_NUMSLICES;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_ARRAY_NUMSLICES, 1, null, __line__);
                }
            }
            case SG_IMAGETYPE_3D: {
                if (desc.num_slices >= 1 && desc.num_slices <= _sg.limits.max_image_size_3d) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_3D_NUMSLICES;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_IMAGETYPE_3D_NUMSLICES, 1, null, __line__);
                }
            }
            default: {
                assert(cast(i64, false));
            }
        }
        if desc.width > 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_WIDTH;
            _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_WIDTH, 1, null, __line__);
        }
        if desc.height > 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_HEIGHT;
            _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_HEIGHT, 1, null, __line__);
        }
        sg_pixel_format fmt = desc.pixel_format;
        bool injected = 0 != desc.gl_texture || null != desc.mtl_texture || null != desc.d3d11_texture || null != desc.wgpu_texture;
        if _sg_is_depth_or_depth_stencil_format(fmt) != 0 {
            if desc.type != SG_IMAGETYPE_3D == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_DEPTH_3D_IMAGE;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_DEPTH_3D_IMAGE, 1, null, __line__);
            }
        }
        if any_attachment {
            assert(cast(i32, fmt) >= 0 && cast(i32, fmt) < _SG_PIXELFORMAT_NUM);
            if !usg.immutable {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_IMMUTABLE;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_IMMUTABLE, 1, null, __line__);
            }
            if desc.data.mip_levels[0].ptr == null == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_NO_DATA;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_NO_DATA, 1, null, __line__);
            }
            if _sg.formats[fmt].render == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_PIXELFORMAT;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_PIXELFORMAT, 1, null, __line__);
            }
            if usg.resolve_attachment != 0 {
                if desc.sample_count == 1 == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_RESOLVE_EXPECT_NO_MSAA;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_RESOLVE_EXPECT_NO_MSAA, 1, null, __line__);
                }
            }
            if desc.sample_count > 1 {
                if _sg.formats[fmt].msaa == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_NO_MSAA_SUPPORT;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_NO_MSAA_SUPPORT, 1, null, __line__);
                }
                if desc.num_mipmaps == 1 == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_NUM_MIPMAPS;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_NUM_MIPMAPS, 1, null, __line__);
                }
                if desc.type != SG_IMAGETYPE_ARRAY == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_ARRAY_IMAGE;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_ARRAY_IMAGE, 1, null, __line__);
                }
                if desc.type != SG_IMAGETYPE_3D == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_3D_IMAGE;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_3D_IMAGE, 1, null, __line__);
                }
                if desc.type != SG_IMAGETYPE_CUBE == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_CUBE_IMAGE;
                    _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_CUBE_IMAGE, 1, null, __line__);
                }
            }
        }
        if usg.storage_image != 0 {
            if !usg.immutable {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_IMMUTABLE;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_IMMUTABLE, 1, null, __line__);
            }
            if desc.data.mip_levels[0].ptr == null == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_DATA;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_DATA, 1, null, __line__);
            }
            if _sg_is_valid_storage_image_format(fmt) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_PIXELFORMAT;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_PIXELFORMAT, 1, null, __line__);
            }
            if desc.sample_count == 1 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_MSAA;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_MSAA, 1, null, __line__);
            }
        }
        if usg.write_unsealed {
            if !usg.immutable {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_WRITEUNSEALED_VS_IMMUTABLE;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_WRITEUNSEALED_VS_IMMUTABLE, 1, null, __line__);
            }
            if !any_attachment == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_WRITEUNSEALED_VS_ATTACHMENT;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_WRITEUNSEALED_VS_ATTACHMENT, 1, null, __line__);
            }
        }
        if usg.write_transient {
            if !any_attachment == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_WRITETRANSIENT_VS_ATTACHMENT;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_WRITETRANSIENT_VS_ATTACHMENT, 1, null, __line__);
            }
            if injected {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_WRITETRANSIENT_VS_INJECTED;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_WRITETRANSIENT_VS_INJECTED, 1, null, __line__);
            }
        }
        if usg.copy_dst {
            if !any_attachment == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_COPYDST_VS_ATTACHMENT;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_COPYDST_VS_ATTACHMENT, 1, null, __line__);
            }
        }
        if !any_attachment && !usg.storage_image {
            if desc.sample_count == 1 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_MSAA_BUT_NO_ATTACHMENT;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_MSAA_BUT_NO_ATTACHMENT, 1, null, __line__);
            }
            bool valid_nonrt_fmt = !_sg_is_valid_attachment_depth_format(fmt);
            if valid_nonrt_fmt == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_NONRT_PIXELFORMAT;
                _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_NONRT_PIXELFORMAT, 1, null, __line__);
            }
            if !injected && !usg.write_unsealed && usg.immutable {
                _sg_validate_image_data(&desc.data, desc.pixel_format, desc.width, desc.height, desc.num_mipmaps, desc.num_slices);
            } else {
                for i32 mip_index = 0; mip_index < SG_MAX_MIPMAPS; mip_index++ {
                    bool no_data = null == desc.data.mip_levels[mip_index].ptr;
                    bool no_size = 0 == desc.data.mip_levels[mip_index].size;
                    if injected {
                        if (no_data && no_size) == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_INJECTED_NO_DATA;
                            _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_INJECTED_NO_DATA, 1, null, __line__);
                        }
                    }
                    if !usg.immutable || usg.write_unsealed {
                        if (no_data && no_size) == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_IMAGEDESC_WRITABLE_NO_DATA;
                            _sg_log(SG_LOGITEM_VALIDATE_IMAGEDESC_WRITABLE_NO_DATA, 1, null, __line__);
                        }
                    }
                }
            }
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_sampler_desc(sg_sampler_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(cast(i64, desc));
        _sg_validate_begin();
        if desc._start_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_SAMPLERDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_SAMPLERDESC_CANARY, 1, null, __line__);
        }
        if desc._end_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_SAMPLERDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_SAMPLERDESC_CANARY, 1, null, __line__);
        }
        if desc.max_anisotropy > 1 {
            if (desc.min_filter == SG_FILTER_LINEAR && desc.mag_filter == SG_FILTER_LINEAR && desc.mipmap_filter == SG_FILTER_LINEAR) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SAMPLERDESC_ANISTROPIC_REQUIRES_LINEAR_FILTERING;
                _sg_log(SG_LOGITEM_VALIDATE_SAMPLERDESC_ANISTROPIC_REQUIRES_LINEAR_FILTERING, 1, null, __line__);
            }
        }
        return _sg_validate_end();
    }
}

_sg_u128_t _sg_u128() {
    _sg_u128_t res;
    return res;
}

_sg_u128_t _sg_validate_set_slot_bit(_sg_u128_t bits, sg_shader_stage stage, u8 slot) {
    switch stage {
        case SG_SHADERSTAGE_NONE: {
            assert(slot < 128);
            if slot < 64 {
                bits.lo |= 1 << cast(u64, slot);
            } else {
                bits.hi |= 1 << cast(u64, slot - 64);
            }
        }
        case SG_SHADERSTAGE_VERTEX: {
            assert(slot < 64);
            bits.lo |= 1 << cast(u64, slot);
        }
        case SG_SHADERSTAGE_FRAGMENT: {
            assert(slot < 64);
            bits.hi |= 1 << cast(u64, slot);
        }
        case SG_SHADERSTAGE_COMPUTE: {
            assert(slot < 64);
            bits.lo |= 1 << cast(u64, slot);
        }
        default: {
            assert(cast(i64, false));
        }
    }
    return bits;
}

bool _sg_validate_slot_bits(_sg_u128_t bits, sg_shader_stage stage, u8 slot) {
    _sg_u128_t mask = _sg_u128();
    switch stage {
        case SG_SHADERSTAGE_NONE: {
            assert(slot < 128);
            if slot < 64 {
                mask.lo = 1 << cast(u64, slot);
            } else {
                mask.hi = 1 << cast(u64, slot - 64);
            }
        }
        case SG_SHADERSTAGE_VERTEX: {
            assert(slot < 64);
            mask.lo = 1 << cast(u64, slot);
        }
        case SG_SHADERSTAGE_FRAGMENT: {
            assert(slot < 64);
            mask.hi = 1 << cast(u64, slot);
        }
        case SG_SHADERSTAGE_COMPUTE: {
            assert(slot < 64);
            mask.lo = 1 << cast(u64, slot);
        }
        default: {
            assert(cast(i64, false));
        }
    }
    return (bits.lo & mask.lo) == 0 && (bits.hi & mask.hi) == 0;
}

bool _sg_validate_shader_desc(sg_shader_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(cast(i64, desc));
        bool is_compute_shader = desc.compute_func.source != null || desc.compute_func.bytecode.ptr != null;
        _sg_validate_begin();
        if desc._start_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_CANARY, 1, null, __line__);
        }
        if desc._end_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_CANARY, 1, null, __line__);
        }
        if is_compute_shader {
            if null != desc.compute_func.source == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_COMPUTE_SOURCE;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_COMPUTE_SOURCE, 1, null, __line__);
            }
        } else {
            if null != desc.vertex_func.source == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_VERTEX_SOURCE;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_VERTEX_SOURCE, 1, null, __line__);
            }
            if null != desc.fragment_func.source == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_FRAGMENT_SOURCE;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_FRAGMENT_SOURCE, 1, null, __line__);
            }
        }
        if is_compute_shader {
            if (null == desc.vertex_func.source && null == desc.vertex_func.bytecode.ptr) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_INVALID_SHADER_COMBO;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_INVALID_SHADER_COMBO, 1, null, __line__);
            }
            if (null == desc.fragment_func.source && null == desc.fragment_func.bytecode.ptr) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_INVALID_SHADER_COMBO;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_INVALID_SHADER_COMBO, 1, null, __line__);
            }
        } else {
            if (null == desc.compute_func.source && null == desc.compute_func.bytecode.ptr) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_INVALID_SHADER_COMBO;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_INVALID_SHADER_COMBO, 1, null, __line__);
            }
        }
        for u64 i = 0; i < cast(u64, SG_MAX_VERTEX_ATTRIBUTES); i++ {
            if desc.attrs[i].glsl_name != null {
                if strlen(desc.attrs[i].glsl_name) < cast(u64, _SG_STRING_SIZE) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG;
                    _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG, 1, null, __line__);
                }
            }
            if desc.attrs[i].hlsl_sem_name != null {
                if strlen(desc.attrs[i].hlsl_sem_name) < cast(u64, _SG_STRING_SIZE) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG;
                    _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG, 1, null, __line__);
                }
            }
        }
        if null != desc.vertex_func.bytecode.ptr {
            if desc.vertex_func.bytecode.size > 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_NO_BYTECODE_SIZE;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_NO_BYTECODE_SIZE, 1, null, __line__);
            }
        }
        if null != desc.fragment_func.bytecode.ptr {
            if desc.fragment_func.bytecode.size > 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_NO_BYTECODE_SIZE;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_NO_BYTECODE_SIZE, 1, null, __line__);
            }
        }
        if null != desc.compute_func.bytecode.ptr {
            if desc.compute_func.bytecode.size > 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_NO_BYTECODE_SIZE;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_NO_BYTECODE_SIZE, 1, null, __line__);
            }
        }
        _sg_u128_t glsl_sbuf_bnd_bits = _sg_u128();
        _sg_u128_t glsl_simg_bnd_bits = _sg_u128();
        for u64 ub_idx = 0; ub_idx < cast(u64, SG_MAX_UNIFORMBLOCK_BINDSLOTS); ub_idx++ {
            sg_shader_uniform_block* ub_desc = &desc.uniform_blocks[ub_idx];
            if ub_desc.stage == SG_SHADERSTAGE_NONE {
                continue;
            }
            if ub_desc.size > 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_IS_ZERO;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_IS_ZERO, 1, null, __line__);
            }
            bool uniforms_continuous = true;
            u32 uniform_offset = 0;
            i32 num_uniforms = 0;
            for u64 u_index = 0; u_index < cast(u64, SG_MAX_UNIFORMBLOCK_MEMBERS); u_index++ {
                sg_glsl_shader_uniform* u_desc = &ub_desc.glsl_uniforms[u_index];
                if u_desc.type != SG_UNIFORMTYPE_INVALID {
                    if uniforms_continuous == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_CONT_MEMBERS;
                        _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_CONT_MEMBERS, 1, null, __line__);
                    }
                    if u_desc.glsl_name == null {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_UNIFORM_GLSL_NAME;
                        _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_UNIFORM_GLSL_NAME, 1, null, __line__);
                    }
                    var array_count = cast(i32, u_desc.array_count);
                    if array_count > 0 == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_ARRAY_COUNT;
                        _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_ARRAY_COUNT, 1, null, __line__);
                    }
                    u32 u_align = _sg_uniform_alignment(u_desc.type, array_count, ub_desc.layout);
                    u32 u_size = _sg_uniform_size(u_desc.type, array_count, ub_desc.layout);
                    uniform_offset = _sg_align_u32(uniform_offset, u_align);
                    uniform_offset += u_size;
                    num_uniforms++;
                    if ub_desc.layout == SG_UNIFORMLAYOUT_STD140 {
                        if array_count > 1 {
                            if (u_desc.type == SG_UNIFORMTYPE_FLOAT4 || u_desc.type == SG_UNIFORMTYPE_INT4 || u_desc.type == SG_UNIFORMTYPE_MAT4) == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_STD140_ARRAY_TYPE;
                                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_STD140_ARRAY_TYPE, 1, null, __line__);
                            }
                        }
                    }
                } else {
                    uniforms_continuous = false;
                }
            }
            if ub_desc.layout == SG_UNIFORMLAYOUT_STD140 {
                uniform_offset = _sg_align_u32(uniform_offset, 16);
            }
            if cast(u64, uniform_offset) == ub_desc.size == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_MISMATCH;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_MISMATCH, 1, null, __line__);
            }
            if num_uniforms > 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_MEMBERS;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_MEMBERS, 1, null, __line__);
            }
        }
        u32 texview_slot_mask = 0;
        for u64 view_idx = 0; view_idx < cast(u64, SG_MAX_VIEW_BINDSLOTS); view_idx++ {
            sg_shader_view* view_desc = &desc.views[view_idx];
            if view_desc.texture.stage != SG_SHADERSTAGE_NONE {
                sg_shader_texture_view* tex_desc = &view_desc.texture;
                texview_slot_mask |= cast(u32, cast(u32, 1) << view_idx);
                ignore tex_desc;
            } else if view_desc.storage_buffer.stage != SG_SHADERSTAGE_NONE {
                sg_shader_storage_buffer_view* sbuf_desc = &view_desc.storage_buffer;
                if sbuf_desc.stage == SG_SHADERSTAGE_VERTEX {
                    if sbuf_desc.readonly == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_VERTEXSHADER_READWRITE;
                        _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_VERTEXSHADER_READWRITE, 1, null, __line__);
                    }
                }
                if _sg_validate_slot_bits(glsl_sbuf_bnd_bits, SG_SHADERSTAGE_NONE, sbuf_desc.glsl_binding_n) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_GLSL_BINDING_COLLISION;
                    _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_GLSL_BINDING_COLLISION, 1, null, __line__);
                }
                glsl_sbuf_bnd_bits = _sg_validate_set_slot_bit(glsl_sbuf_bnd_bits, SG_SHADERSTAGE_NONE, sbuf_desc.glsl_binding_n);
            } else if view_desc.storage_image.stage != SG_SHADERSTAGE_NONE {
                sg_shader_storage_image_view* simg_desc = &view_desc.storage_image;
                if simg_desc.stage == SG_SHADERSTAGE_COMPUTE == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_EXPECT_COMPUTE_STAGE;
                    _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_EXPECT_COMPUTE_STAGE, 1, null, __line__);
                }
                if _sg_validate_slot_bits(glsl_simg_bnd_bits, SG_SHADERSTAGE_NONE, simg_desc.glsl_binding_n) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_GLSL_BINDING_COLLISION;
                    _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_GLSL_BINDING_COLLISION, 1, null, __line__);
                }
                glsl_simg_bnd_bits = _sg_validate_set_slot_bit(glsl_simg_bnd_bits, SG_SHADERSTAGE_NONE, simg_desc.glsl_binding_n);
            }
        }
        u32 smp_slot_mask = 0;
        for u64 smp_idx = 0; smp_idx < cast(u64, SG_MAX_SAMPLER_BINDSLOTS); smp_idx++ {
            sg_shader_sampler* smp_desc = &desc.samplers[smp_idx];
            if smp_desc.stage == SG_SHADERSTAGE_NONE {
                continue;
            }
            smp_slot_mask |= cast(u32, cast(u32, 1) << smp_idx);
        }
        u32 ref_texview_slot_mask = 0;
        u32 ref_smp_slot_mask = 0;
        for u64 tex_smp_idx = 0; tex_smp_idx < cast(u64, SG_MAX_TEXTURE_SAMPLER_PAIRS); tex_smp_idx++ {
            sg_shader_texture_sampler_pair* tex_smp_desc = &desc.texture_sampler_pairs[tex_smp_idx];
            if tex_smp_desc.stage == SG_SHADERSTAGE_NONE {
                continue;
            }
            if tex_smp_desc.glsl_name != null == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_GLSL_NAME;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_GLSL_NAME, 1, null, __line__);
            }
            bool view_slot_in_range = cast(i32, tex_smp_desc.view_slot) < SG_MAX_VIEW_BINDSLOTS;
            bool smp_slot_in_range = cast(i32, tex_smp_desc.sampler_slot) < SG_MAX_SAMPLER_BINDSLOTS;
            if view_slot_in_range == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_VIEW_SLOT_OUT_OF_RANGE;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_VIEW_SLOT_OUT_OF_RANGE, 1, null, __line__);
            }
            if smp_slot_in_range == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_SLOT_OUT_OF_RANGE;
                _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_SLOT_OUT_OF_RANGE, 1, null, __line__);
            }
            if view_slot_in_range && smp_slot_in_range {
                ref_texview_slot_mask |= cast(u32, cast(u32, 1) << cast(i32, tex_smp_desc.view_slot));
                ref_smp_slot_mask |= cast(u32, cast(u32, 1) << cast(i32, tex_smp_desc.sampler_slot));
                sg_shader_view* view_desc = &desc.views[tex_smp_desc.view_slot];
                sg_shader_sampler* smp_desc = &desc.samplers[tex_smp_desc.sampler_slot];
                if view_desc.texture.stage != SG_SHADERSTAGE_NONE == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_EXPECT_TEXTURE_VIEW;
                    _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_EXPECT_TEXTURE_VIEW, 1, null, __line__);
                }
                if view_desc.texture.stage == tex_smp_desc.stage == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_TEXTURE_STAGE_MISMATCH;
                    _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_TEXTURE_STAGE_MISMATCH, 1, null, __line__);
                }
                if smp_desc.stage == tex_smp_desc.stage == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_STAGE_MISMATCH;
                    _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_STAGE_MISMATCH, 1, null, __line__);
                }
                bool needs_nonfiltering = view_desc.texture.sample_type == SG_IMAGESAMPLETYPE_UINT || view_desc.texture.sample_type == SG_IMAGESAMPLETYPE_SINT || view_desc.texture.sample_type == SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT;
                bool needs_comparison = view_desc.texture.sample_type == SG_IMAGESAMPLETYPE_DEPTH;
                if needs_nonfiltering {
                    if (needs_nonfiltering && smp_desc.sampler_type == SG_SAMPLERTYPE_NONFILTERING) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_NONFILTERING_SAMPLER_REQUIRED;
                        _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_NONFILTERING_SAMPLER_REQUIRED, 1, null, __line__);
                    }
                }
                if needs_comparison {
                    if (needs_comparison && smp_desc.sampler_type == SG_SAMPLERTYPE_COMPARISON) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_COMPARISON_SAMPLER_REQUIRED;
                        _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_COMPARISON_SAMPLER_REQUIRED, 1, null, __line__);
                    }
                }
            }
        }
        if texview_slot_mask == ref_texview_slot_mask == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_TEXVIEW_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS;
            _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_TEXVIEW_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS, 1, null, __line__);
        }
        if smp_slot_mask == ref_smp_slot_mask == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_SHADERDESC_SAMPLER_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS;
            _sg_log(SG_LOGITEM_VALIDATE_SHADERDESC_SAMPLER_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_pipeline_desc(sg_pipeline_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(cast(i64, desc));
        _sg_validate_begin();
        if desc._start_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_CANARY, 1, null, __line__);
        }
        if desc._end_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_CANARY, 1, null, __line__);
        }
        if desc.shader.id != cast(u32, SG_INVALID_ID) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER;
            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER, 1, null, __line__);
        }
        _sg_shader_t* shd = _sg_lookup_shader(desc.shader.id);
        if null != shd == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER;
            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER, 1, null, __line__);
        }
        if shd != null {
            if shd.slot.state == SG_RESOURCESTATE_VALID == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER;
                _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER, 1, null, __line__);
            }
            if desc.compute {
                if !shd.cmn.is_compute {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_COMPUTE_SHADER_EXPECTED;
                    _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_COMPUTE_SHADER_EXPECTED, 1, null, __line__);
                }
            } else {
                if shd.cmn.is_compute {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_NO_COMPUTE_SHADER_EXPECTED;
                    _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_NO_COMPUTE_SHADER_EXPECTED, 1, null, __line__);
                }
                bool attrs_cont = true;
                for u64 attr_index = 0; attr_index < cast(u64, SG_MAX_VERTEX_ATTRIBUTES); attr_index++ {
                    sg_vertex_attr_state* a_state = &desc.layout.attrs[attr_index];
                    if a_state.format == SG_VERTEXFORMAT_INVALID {
                        attrs_cont = false;
                        continue;
                    }
                    if attrs_cont == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_NO_CONT_ATTRS;
                        _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_NO_CONT_ATTRS, 1, null, __line__);
                    }
                    assert(a_state.buffer_index < SG_MAX_VERTEXBUFFER_BINDSLOTS);
                    if shd.cmn.attrs[attr_index].base_type != SG_SHADERATTRBASETYPE_UNDEFINED {
                        if _sg_vertexformat_basetype(a_state.format) != shd.cmn.attrs[attr_index].base_type {
                            if false == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH;
                                _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH, 1, null, __line__);
                            }
                            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH, 3, "attr format:", __line__);
                            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH, 3, _sg_vertexformat_to_string(a_state.format), __line__);
                            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH, 3, "shader attr base type:", __line__);
                            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH, 3, _sg_shaderattrbasetype_to_string(shd.cmn.attrs[attr_index].base_type), __line__);
                        }
                    }
                    if a_state.format == SG_VERTEXFORMAT_INT10_N2 {
                        if _sg.features.vertexformat_int10_n2 == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_VERTEXFORMAT_INT10_N2_NOT_SUPPORTED;
                            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_ATTR_VERTEXFORMAT_INT10_N2_NOT_SUPPORTED, 1, null, __line__);
                        }
                    }
                }
                for i32 i = 0; i < SG_MAX_VIEW_BINDSLOTS; i++ {
                    if shd.cmn.views[i].view_type == SG_VIEWTYPE_STORAGEBUFFER {
                        sg_shader_stage stage = shd.cmn.views[i].stage;
                        if shd.cmn.views[i].sbuf_readonly == 0 {
                            if stage != SG_SHADERSTAGE_VERTEX == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER_READONLY_STORAGEBUFFERS;
                                _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_SHADER_READONLY_STORAGEBUFFERS, 1, null, __line__);
                            }
                        }
                    }
                }
                for i32 buf_index = 0; buf_index < SG_MAX_VERTEXBUFFER_BINDSLOTS; buf_index++ {
                    sg_vertex_buffer_layout_state* l_state = &desc.layout.buffers[buf_index];
                    if l_state.stride == 0 {
                        continue;
                    }
                    if _sg_multiple_u64(cast(u64, l_state.stride), 4) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_LAYOUT_STRIDE4;
                        _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_LAYOUT_STRIDE4, 1, null, __line__);
                    }
                }
            }
        }
        if desc.depth.pixel_format == SG_PIXELFORMAT_NONE {
            if desc.depth.write_enabled == false == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_DEPTH_FORMAT_NONE_BUT_DEPTH_WRITE_ENABLED;
                _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_DEPTH_FORMAT_NONE_BUT_DEPTH_WRITE_ENABLED, 1, null, __line__);
            }
            if (desc.depth.compare == SG_COMPAREFUNC_ALWAYS || desc.depth.compare == SG_COMPAREFUNC_NEVER) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_DEPTH_FORMAT_NONE_COMPARE_FUNC_MISMATCH;
                _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_DEPTH_FORMAT_NONE_COMPARE_FUNC_MISMATCH, 1, null, __line__);
            }
        }
        if (desc.color_count >= 0 && desc.color_count <= SG_MAX_COLOR_ATTACHMENTS) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_COLOR_COUNT;
            _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_COLOR_COUNT, 1, null, __line__);
        }
        for i32 color_index = 0; color_index < desc.color_count; color_index++ {
            if color_index >= SG_MAX_COLOR_ATTACHMENTS {
                break;
            }
            sg_blend_state* bs = &desc.colors[color_index].blend;
            if bs.op_rgb == SG_BLENDOP_MIN || bs.op_rgb == SG_BLENDOP_MAX {
                if (bs.src_factor_rgb == SG_BLENDFACTOR_ONE && bs.dst_factor_rgb == SG_BLENDFACTOR_ONE) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE;
                    _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE, 1, null, __line__);
                }
            }
            if bs.op_alpha == SG_BLENDOP_MIN || bs.op_alpha == SG_BLENDOP_MAX {
                if (bs.src_factor_alpha == SG_BLENDFACTOR_ONE && bs.dst_factor_alpha == SG_BLENDFACTOR_ONE) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE;
                    _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE, 1, null, __line__);
                }
            }
            bool needs_dualsource_blending = _sg_is_dualsource_blendfactor(bs.src_factor_rgb) || _sg_is_dualsource_blendfactor(bs.dst_factor_rgb) || _sg_is_dualsource_blendfactor(bs.src_factor_alpha) || _sg_is_dualsource_blendfactor(bs.dst_factor_alpha);
            if needs_dualsource_blending {
                if !_sg.features.dual_source_blending {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_PIPELINEDESC_DUAL_SOURCE_BLENDING_NOT_SUPPORTED;
                    _sg_log(SG_LOGITEM_VALIDATE_PIPELINEDESC_DUAL_SOURCE_BLENDING_NOT_SUPPORTED, 1, null, __line__);
                }
            }
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_view_desc(sg_view_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(cast(i64, desc));
        _sg_validate_begin();
        if desc._start_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_CANARY, 1, null, __line__);
        }
        if desc._end_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_CANARY, 1, null, __line__);
        }
        sg_view_type view_type = SG_VIEWTYPE_INVALID;
        sg_image_view_desc* img_desc = null;
        sg_texture_view_desc* tex_desc = null;
        sg_buffer_view_desc* buf_desc = null;
        if desc.texture.image.id != cast(u32, SG_INVALID_ID) {
            view_type = SG_VIEWTYPE_TEXTURE;
            tex_desc = &desc.texture;
        }
        if desc.storage_buffer.buffer.id != cast(u32, SG_INVALID_ID) {
            if SG_VIEWTYPE_INVALID == view_type == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE;
                _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE, 1, null, __line__);
            }
            view_type = SG_VIEWTYPE_STORAGEBUFFER;
            buf_desc = &desc.storage_buffer;
        }
        if desc.storage_image.image.id != cast(u32, SG_INVALID_ID) {
            if SG_VIEWTYPE_INVALID == view_type == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE;
                _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE, 1, null, __line__);
            }
            view_type = SG_VIEWTYPE_STORAGEIMAGE;
            img_desc = &desc.storage_image;
        }
        if desc.color_attachment.image.id != cast(u32, SG_INVALID_ID) {
            if SG_VIEWTYPE_INVALID == view_type == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE;
                _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE, 1, null, __line__);
            }
            view_type = SG_VIEWTYPE_COLORATTACHMENT;
            img_desc = &desc.color_attachment;
        }
        if desc.resolve_attachment.image.id != cast(u32, SG_INVALID_ID) {
            if SG_VIEWTYPE_INVALID == view_type == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE;
                _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE, 1, null, __line__);
            }
            view_type = SG_VIEWTYPE_RESOLVEATTACHMENT;
            img_desc = &desc.resolve_attachment;
        }
        if desc.depth_stencil_attachment.image.id != cast(u32, SG_INVALID_ID) {
            if SG_VIEWTYPE_INVALID == view_type == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE;
                _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE, 1, null, __line__);
            }
            view_type = SG_VIEWTYPE_DEPTHSTENCILATTACHMENT;
            img_desc = &desc.depth_stencil_attachment;
        }
        if SG_VIEWTYPE_INVALID != view_type == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_ANY_VIEWTYPE;
            _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_ANY_VIEWTYPE, 1, null, __line__);
        }
        _sg_buffer_t* buf = null;
        _sg_image_t* img = null;
        bool res_valid = false;
        if buf_desc != null {
            assert(img_desc == null && tex_desc == null);
            buf = _sg_lookup_buffer(buf_desc.buffer.id);
            if buf == null {
                _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_ALIVE;
                _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_ALIVE, 1, null, __line__);
            }
            if buf != null {
                if buf.slot.state == SG_RESOURCESTATE_VALID == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_VALID;
                    _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_VALID, 1, null, __line__);
                }
                res_valid = buf.slot.state == SG_RESOURCESTATE_VALID;
            }
        } else if img_desc != null {
            assert(tex_desc == null && buf_desc == null);
            img = _sg_lookup_image(img_desc.image.id);
            if img == null {
                _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_ALIVE;
                _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_ALIVE, 1, null, __line__);
            }
            if img != null {
                if img.slot.state == SG_RESOURCESTATE_VALID == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_VALID;
                    _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_VALID, 1, null, __line__);
                }
                res_valid = img.slot.state == SG_RESOURCESTATE_VALID;
            }
        } else {
            assert(tex_desc && img_desc == null && buf_desc == null);
            img = _sg_lookup_image(tex_desc.image.id);
            if img == null {
                _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_ALIVE;
                _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_RESOURCE_ALIVE, 1, null, __line__);
            }
            if img != null {
                bool img_valid_or_unsealed = _sg_resource_state_valid_unsealed(img.slot.state);
                if img_valid_or_unsealed == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_VALID_UNSEALED;
                    _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_VALID_UNSEALED, 1, null, __line__);
                }
                res_valid = img_valid_or_unsealed;
            }
        }
        if res_valid {
            switch view_type {
                case SG_VIEWTYPE_STORAGEBUFFER: {
                    assert(cast(i64, buf));
                    if !buf.cmn.usage.storage_buffer {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_USAGE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_USAGE, 1, null, __line__);
                    }
                }
                case SG_VIEWTYPE_STORAGEIMAGE: {
                    assert(cast(i64, img));
                    if img.cmn.usage.storage_image == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEIMAGE_USAGE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEIMAGE_USAGE, 1, null, __line__);
                    }
                    if _sg_is_valid_storage_image_format(img.cmn.pixel_format) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEIMAGE_PIXELFORMAT;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEIMAGE_PIXELFORMAT, 1, null, __line__);
                    }
                }
                case SG_VIEWTYPE_TEXTURE: {
                    if _sg.features.msaa_texture_bindings == 0 {
                        if img.cmn.sample_count == 1 == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_EXPECT_NO_MSAA;
                            _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_EXPECT_NO_MSAA, 1, null, __line__);
                        }
                    }
                }
                case SG_VIEWTYPE_COLORATTACHMENT: {
                    assert(cast(i64, img));
                    if img.cmn.usage.color_attachment == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_COLORATTACHMENT_USAGE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_COLORATTACHMENT_USAGE, 1, null, __line__);
                    }
                    if _sg_is_valid_attachment_color_format(img.cmn.pixel_format) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_COLORATTACHMENT_PIXELFORMAT;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_COLORATTACHMENT_PIXELFORMAT, 1, null, __line__);
                    }
                }
                case SG_VIEWTYPE_RESOLVEATTACHMENT: {
                    assert(cast(i64, img));
                    if img.cmn.usage.resolve_attachment == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_RESOLVEATTACHMENT_USAGE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_RESOLVEATTACHMENT_USAGE, 1, null, __line__);
                    }
                    if img.cmn.sample_count == 1 == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_RESOLVEATTACHMENT_SAMPLECOUNT;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_RESOLVEATTACHMENT_SAMPLECOUNT, 1, null, __line__);
                    }
                }
                case SG_VIEWTYPE_DEPTHSTENCILATTACHMENT: {
                    assert(cast(i64, img));
                    if img.cmn.usage.depth_stencil_attachment == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_USAGE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_USAGE, 1, null, __line__);
                    }
                    if _sg_is_valid_attachment_depth_format(img.cmn.pixel_format) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_PIXELFORMAT;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_PIXELFORMAT, 1, null, __line__);
                    }
                }
                default: {
                    assert(cast(i64, false));
                }
            }
            if buf_desc != null {
                assert(cast(i64, buf));
                if buf_desc.offset < buf.cmn.size == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_VS_BUFFER_SIZE;
                    _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_VS_BUFFER_SIZE, 1, null, __line__);
                }
                if _sg_multiple_u64(cast(u64, buf_desc.offset), 256) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_MULTIPLE_256;
                    _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_MULTIPLE_256, 1, null, __line__);
                }
            } else if img_desc != null {
                assert(cast(i64, img));
                if (img_desc.mip_level >= 0 && img_desc.mip_level < img.cmn.num_mipmaps) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_MIPLEVEL;
                    _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_MIPLEVEL, 1, null, __line__);
                }
                if img.cmn.type == SG_IMAGETYPE_2D {
                    if img_desc.slice == 0 == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_2D_SLICE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_2D_SLICE, 1, null, __line__);
                    }
                } else if img.cmn.type == SG_IMAGETYPE_CUBE {
                    if (img_desc.slice >= 0 && img_desc.slice < 6) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_CUBEMAP_SLICE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_CUBEMAP_SLICE, 1, null, __line__);
                    }
                } else if img.cmn.type == SG_IMAGETYPE_ARRAY {
                    if (img_desc.slice >= 0 && img_desc.slice < img.cmn.num_slices) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_ARRAY_SLICE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_ARRAY_SLICE, 1, null, __line__);
                    }
                } else if img.cmn.type == SG_IMAGETYPE_3D {
                    if img_desc.slice == 0 == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_3D_SLICE;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_IMAGE_3D_SLICE, 1, null, __line__);
                    }
                }
            } else if tex_desc != null {
                assert(cast(i64, img));
                i32 max_mip_level = tex_desc.mip_levels.base + tex_desc.mip_levels.count;
                i32 max_slice = tex_desc.slices.base + tex_desc.slices.count;
                if (tex_desc.mip_levels.base >= 0 && max_mip_level <= img.cmn.num_mipmaps) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_MIPLEVELS;
                    _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_MIPLEVELS, 1, null, __line__);
                }
                if img.cmn.type == SG_IMAGETYPE_2D {
                    if (tex_desc.slices.base == 0 && max_slice <= 1) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_2D_SLICES;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_2D_SLICES, 1, null, __line__);
                    }
                } else if img.cmn.type == SG_IMAGETYPE_CUBE {
                    if (tex_desc.slices.base == 0 && max_slice <= 1) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_CUBEMAP_SLICES;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_CUBEMAP_SLICES, 1, null, __line__);
                    }
                } else if img.cmn.type == SG_IMAGETYPE_ARRAY {
                    if (tex_desc.slices.base >= 0 && max_slice <= img.cmn.num_slices) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_ARRAY_SLICES;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_ARRAY_SLICES, 1, null, __line__);
                    }
                } else if img.cmn.type == SG_IMAGETYPE_3D {
                    if (tex_desc.slices.base == 0 && max_slice <= 1) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_3D_SLICES;
                        _sg_log(SG_LOGITEM_VALIDATE_VIEWDESC_TEXTURE_3D_SLICES, 1, null, __line__);
                    }
                }
            }
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_begin_pass(sg_pass* pass) {
    when !defined(SOKOL_DEBUG) {
        ignore pass;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        _sg.validate.pass_index += 1;
        bool is_invalid_swapchain_pass = pass.swapchain.invalid;
        bool is_compute_pass = pass.compute;
        bool is_swapchain_pass = !is_compute_pass && _sg_attachments_empty(&pass.attachments);
        bool is_offscreen_pass = !(is_compute_pass || is_swapchain_pass);
        _sg_validate_begin();
        if pass._start_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_CANARY, 1, null, __line__);
        }
        if pass._end_canary == 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_CANARY;
            _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_CANARY, 1, null, __line__);
        }
        if is_compute_pass {
            if _sg_attachments_empty(&pass.attachments) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COMPUTEPASS_EXPECT_NO_ATTACHMENTS;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COMPUTEPASS_EXPECT_NO_ATTACHMENTS, 1, null, __line__);
            }
        } else if is_invalid_swapchain_pass {
        } else if is_swapchain_pass {
            if pass.swapchain.width > 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH, 1, null, __line__);
            }
            if pass.swapchain.height > 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT, 1, null, __line__);
            }
            if pass.swapchain.sample_count > 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT, 1, null, __line__);
            }
            if pass.swapchain.color_format > SG_PIXELFORMAT_NONE == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT, 1, null, __line__);
            }
        } else {
            bool has_color_atts = false;
            bool has_depth_stencil_atts = false;
            bool atts_cont = true;
            i32 color_width = -1;
            i32 color_height = -1;
            i32 color_sample_count = -1;
            for i32 att_index = 0; att_index < SG_MAX_COLOR_ATTACHMENTS; att_index++ {
                if pass.attachments.colors[att_index].id == cast(u32, SG_INVALID_ID) {
                    atts_cont = false;
                    continue;
                }
                has_color_atts = true;
                if atts_cont == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEWS_CONTINUOUS;
                    _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEWS_CONTINUOUS, 1, null, __line__);
                }
                _sg_view_t* view = _sg_lookup_view(pass.attachments.colors[att_index].id);
                if view != null == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_ALIVE;
                    _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_ALIVE, 1, null, __line__);
                }
                if view != null {
                    if view.slot.state == SG_RESOURCESTATE_VALID == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_VALID;
                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_VALID, 1, null, __line__);
                    }
                    if view.slot.state == SG_RESOURCESTATE_VALID {
                        if view.cmn.type == SG_VIEWTYPE_COLORATTACHMENT == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_TYPE;
                            _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_TYPE, 1, null, __line__);
                        }
                        _sg_image_t* img = _sg_image_ref_ptr_or_null(&view.cmn.img.ref);
                        if img == null {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_ALIVE;
                            _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_ALIVE, 1, null, __line__);
                        }
                        if img != null {
                            if img.slot.state == SG_RESOURCESTATE_VALID == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_VALID;
                                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_VALID, 1, null, __line__);
                            }
                            if img.slot.state == SG_RESOURCESTATE_VALID {
                                if color_width == -1 {
                                    color_width = _sg_image_view_dim(view).width;
                                    color_height = _sg_image_view_dim(view).height;
                                    color_sample_count = img.cmn.sample_count;
                                } else {
                                    if color_width == _sg_image_view_dim(view).width == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SIZES;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SIZES, 1, null, __line__);
                                    }
                                    if color_height == _sg_image_view_dim(view).height == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SIZES;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SIZES, 1, null, __line__);
                                    }
                                    if color_sample_count == img.cmn.sample_count == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNTS_EQUAL;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNTS_EQUAL, 1, null, __line__);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            for i32 att_index = 0; att_index < SG_MAX_COLOR_ATTACHMENTS; att_index++ {
                if pass.attachments.resolves[att_index].id == cast(u32, SG_INVALID_ID) {
                    continue;
                }
                if pass.attachments.colors[att_index].id != cast(u32, SG_INVALID_ID) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_NO_COLORATTACHMENTVIEW;
                    _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_NO_COLORATTACHMENTVIEW, 1, null, __line__);
                }
                _sg_view_t* view = _sg_lookup_view(pass.attachments.resolves[att_index].id);
                if view != null == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_ALIVE;
                    _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_ALIVE, 1, null, __line__);
                }
                if view != null {
                    if view.slot.state == SG_RESOURCESTATE_VALID == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_VALID;
                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_VALID, 1, null, __line__);
                    }
                    if view.slot.state == SG_RESOURCESTATE_VALID {
                        if view.cmn.type == SG_VIEWTYPE_RESOLVEATTACHMENT == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_TYPE;
                            _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_TYPE, 1, null, __line__);
                        }
                        _sg_image_t* img = _sg_image_ref_ptr_or_null(&view.cmn.img.ref);
                        if img == null {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_ALIVE;
                            _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_ALIVE, 1, null, __line__);
                        }
                        if img != null {
                            if img.slot.state == SG_RESOURCESTATE_VALID == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_VALID;
                                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_VALID, 1, null, __line__);
                            }
                            if img.slot.state == SG_RESOURCESTATE_VALID {
                                if color_width != -1 {
                                    if color_sample_count > 1 == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNT;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNT, 1, null, __line__);
                                    }
                                    if color_width == _sg_image_view_dim(view).width == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_SIZES;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_SIZES, 1, null, __line__);
                                    }
                                    if color_height == _sg_image_view_dim(view).height == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_SIZES;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_SIZES, 1, null, __line__);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if pass.attachments.depth_stencil.id != cast(u32, SG_INVALID_ID) {
                has_depth_stencil_atts = true;
                _sg_view_t* view = _sg_lookup_view(pass.attachments.depth_stencil.id);
                if view != null == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_ALIVE;
                    _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_ALIVE, 1, null, __line__);
                }
                if view != null {
                    if view.slot.state == SG_RESOURCESTATE_VALID == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_VALID;
                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_VALID, 1, null, __line__);
                    }
                    if view.slot.state == SG_RESOURCESTATE_VALID {
                        if view.cmn.type == SG_VIEWTYPE_DEPTHSTENCILATTACHMENT == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_TYPE;
                            _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_TYPE, 1, null, __line__);
                        }
                        _sg_image_t* img = _sg_image_ref_ptr_or_null(&view.cmn.img.ref);
                        if img == null {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_ALIVE;
                            _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_ALIVE, 1, null, __line__);
                        }
                        if img != null {
                            if img.slot.state == SG_RESOURCESTATE_VALID == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_VALID;
                                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_VALID, 1, null, __line__);
                            }
                            if img.slot.state == SG_RESOURCESTATE_VALID {
                                if color_width != -1 {
                                    if color_width == _sg_image_view_dim(view).width == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SIZES;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SIZES, 1, null, __line__);
                                    }
                                    if color_height == _sg_image_view_dim(view).height == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SIZES;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SIZES, 1, null, __line__);
                                    }
                                    if color_sample_count == img.cmn.sample_count == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SAMPLECOUNT;
                                        _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SAMPLECOUNT, 1, null, __line__);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (has_color_atts || has_depth_stencil_atts) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_ATTACHMENTS_EXPECTED;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_ATTACHMENTS_EXPECTED, 1, null, __line__);
            }
        }
        if is_compute_pass || is_offscreen_pass || is_invalid_swapchain_pass {
            if pass.swapchain.width == 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH_NOTSET;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH_NOTSET, 1, null, __line__);
            }
            if pass.swapchain.height == 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT_NOTSET;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT_NOTSET, 1, null, __line__);
            }
            if pass.swapchain.sample_count == 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT_NOTSET;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT_NOTSET, 1, null, __line__);
            }
            if pass.swapchain.color_format == _SG_PIXELFORMAT_DEFAULT == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT_NOTSET;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT_NOTSET, 1, null, __line__);
            }
            if pass.swapchain.depth_format == _SG_PIXELFORMAT_DEFAULT == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_DEPTHFORMAT_NOTSET;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_DEPTHFORMAT_NOTSET, 1, null, __line__);
            }
            if pass.swapchain.gl.framebuffer == 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_GL_EXPECT_FRAMEBUFFER_NOTSET;
                _sg_log(SG_LOGITEM_VALIDATE_BEGINPASS_SWAPCHAIN_GL_EXPECT_FRAMEBUFFER_NOTSET, 1, null, __line__);
            }
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_apply_viewport(i32 x, i32 y, i32 width, i32 height, bool origin_top_left) {
    ignore x;
    ignore y;
    ignore width;
    ignore height;
    ignore origin_top_left;
    when !defined(SOKOL_DEBUG) {
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        _sg_validate_begin();
        if (_sg.cur_pass.in_pass && !_sg.cur_pass.is_compute) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_AVP_RENDERPASS_EXPECTED;
            _sg_log(SG_LOGITEM_VALIDATE_AVP_RENDERPASS_EXPECTED, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_apply_scissor_rect(i32 x, i32 y, i32 width, i32 height, bool origin_top_left) {
    ignore x;
    ignore y;
    ignore width;
    ignore height;
    ignore origin_top_left;
    when !defined(SOKOL_DEBUG) {
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        _sg_validate_begin();
        if (_sg.cur_pass.in_pass && !_sg.cur_pass.is_compute) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_ASR_RENDERPASS_EXPECTED;
            _sg_log(SG_LOGITEM_VALIDATE_ASR_RENDERPASS_EXPECTED, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_apply_pipeline(sg_pipeline pip_id) {
    when !defined(SOKOL_DEBUG) {
        ignore pip_id;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        _sg_validate_begin();
        if pip_id.id != cast(u32, SG_INVALID_ID) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_PIPELINE_VALID_ID;
            _sg_log(SG_LOGITEM_VALIDATE_APIP_PIPELINE_VALID_ID, 1, null, __line__);
        }
        _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
        if pip != null == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_PIPELINE_EXISTS;
            _sg_log(SG_LOGITEM_VALIDATE_APIP_PIPELINE_EXISTS, 1, null, __line__);
        }
        if pip == null {
            return _sg_validate_end();
        }
        if pip.slot.state == SG_RESOURCESTATE_VALID == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_PIPELINE_VALID;
            _sg_log(SG_LOGITEM_VALIDATE_APIP_PIPELINE_VALID, 1, null, __line__);
        }
        if _sg.cur_pass.in_pass == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_PASS_EXPECTED;
            _sg_log(SG_LOGITEM_VALIDATE_APIP_PASS_EXPECTED, 1, null, __line__);
        }
        bool shd_alive = _sg_shader_ref_alive(&pip.cmn.shader);
        _sg_shader_t* shd = shd_alive ? _sg_shader_ref_ptr(&pip.cmn.shader) : null;
        if shd_alive == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_PIPELINE_SHADER_ALIVE;
            _sg_log(SG_LOGITEM_VALIDATE_APIP_PIPELINE_SHADER_ALIVE, 1, null, __line__);
        }
        if shd_alive {
            if shd.slot.state == SG_RESOURCESTATE_VALID == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_PIPELINE_SHADER_VALID;
                _sg_log(SG_LOGITEM_VALIDATE_APIP_PIPELINE_SHADER_VALID, 1, null, __line__);
            }
        } else {
            return _sg_validate_end();
        }
        _sg.validate.required_bindings_and_uniforms = pip.cmn.required_bindings_and_uniforms | shd.cmn.required_bindings_and_uniforms;
        _sg.validate.applied_bindings_and_uniforms = 0;
        _sg.validate.write_buffer_transient_missing = false;
        _sg.validate.write_image_transient_missing = false;
        if pip.cmn.is_compute {
            if !_sg.cur_pass.is_compute {
                _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_COMPUTEPASS_EXPECTED;
                _sg_log(SG_LOGITEM_VALIDATE_APIP_COMPUTEPASS_EXPECTED, 1, null, __line__);
            }
        } else {
            if _sg.cur_pass.is_compute {
                _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_RENDERPASS_EXPECTED;
                _sg_log(SG_LOGITEM_VALIDATE_APIP_RENDERPASS_EXPECTED, 1, null, __line__);
            }
            if _sg_attachments_empty(&_sg.cur_pass.atts) != 0 {
                if pip.cmn.color_count == 1 == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_COLOR_COUNT;
                    _sg_log(SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_COLOR_COUNT, 1, null, __line__);
                }
                if pip.cmn.colors[0].pixel_format == _sg.cur_pass.swapchain.color_fmt == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_COLOR_FORMAT;
                    _sg_log(SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_COLOR_FORMAT, 1, null, __line__);
                }
                if pip.cmn.depth.pixel_format == _sg.cur_pass.swapchain.depth_fmt == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_DEPTH_FORMAT;
                    _sg_log(SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_DEPTH_FORMAT, 1, null, __line__);
                }
                if pip.cmn.sample_count == _sg.cur_pass.swapchain.sample_count == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_SAMPLE_COUNT;
                    _sg_log(SG_LOGITEM_VALIDATE_APIP_SWAPCHAIN_SAMPLE_COUNT, 1, null, __line__);
                }
            } else {
                _sg_attachments_ptrs_t atts_ptrs = _sg_attachments_ptrs(&_sg.cur_pass.atts);
                bool alive = _sg_attachments_alive(&atts_ptrs);
                if alive == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_ATTACHMENTS_ALIVE;
                    _sg_log(SG_LOGITEM_VALIDATE_APIP_ATTACHMENTS_ALIVE, 1, null, __line__);
                }
                if alive {
                    if pip.cmn.color_count == atts_ptrs.num_color_views == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_COUNT;
                        _sg_log(SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_COUNT, 1, null, __line__);
                    }
                    for i32 i = 0; i < pip.cmn.color_count; i++ {
                        _sg_view_t* clr_view = atts_ptrs.color_views[i];
                        assert(cast(i64, clr_view));
                        if clr_view.slot.state == SG_RESOURCESTATE_VALID == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_VIEW_VALID;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_VIEW_VALID, 1, null, __line__);
                        }
                        _sg_image_t* clr_img = _sg_image_ref_ptr(&clr_view.cmn.img.ref);
                        assert(cast(i64, clr_img));
                        if clr_img.slot.state == SG_RESOURCESTATE_VALID == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_IMAGE_VALID;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_IMAGE_VALID, 1, null, __line__);
                        }
                        if pip.cmn.colors[i].pixel_format == clr_img.cmn.pixel_format == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_FORMAT;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_COLORATTACHMENTS_FORMAT, 1, null, __line__);
                        }
                        if pip.cmn.sample_count == clr_img.cmn.sample_count == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_ATTACHMENT_SAMPLE_COUNT;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_ATTACHMENT_SAMPLE_COUNT, 1, null, __line__);
                        }
                    }
                    _sg_view_t* ds_view = atts_ptrs.ds_view;
                    if ds_view != null {
                        if ds_view.slot.state == SG_RESOURCESTATE_VALID == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_VIEW_VALID;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_VIEW_VALID, 1, null, __line__);
                        }
                        _sg_image_t* ds_img = _sg_image_ref_ptr(&ds_view.cmn.img.ref);
                        assert(cast(i64, ds_img));
                        if ds_img.slot.state == SG_RESOURCESTATE_VALID == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_IMAGE_VALID;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_IMAGE_VALID, 1, null, __line__);
                        }
                        if pip.cmn.depth.pixel_format == ds_img.cmn.pixel_format == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_FORMAT;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_FORMAT, 1, null, __line__);
                        }
                        if pip.cmn.sample_count == ds_img.cmn.sample_count == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_ATTACHMENT_SAMPLE_COUNT;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_ATTACHMENT_SAMPLE_COUNT, 1, null, __line__);
                        }
                    } else {
                        if pip.cmn.depth.pixel_format == SG_PIXELFORMAT_NONE == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_FORMAT;
                            _sg_log(SG_LOGITEM_VALIDATE_APIP_DEPTHSTENCILATTACHMENT_FORMAT, 1, null, __line__);
                        }
                    }
                }
            }
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_apply_bindings(sg_bindings* bindings) {
    when !defined(SOKOL_DEBUG) {
        ignore bindings;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        _sg_validate_begin();
        _sg.validate.applied_bindings_and_uniforms |= cast(u32, cast(u32, 1) << cast(i32, SG_MAX_UNIFORMBLOCK_BINDSLOTS));
        _sg.validate.write_buffer_transient_missing = false;
        _sg.validate.write_image_transient_missing = false;
        if _sg.cur_pass.in_pass == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_PASS_EXPECTED;
            _sg_log(SG_LOGITEM_VALIDATE_ABND_PASS_EXPECTED, 1, null, __line__);
        }
        bool has_any_bindings = bindings.index_buffer.id != cast(u32, SG_INVALID_ID);
        if has_any_bindings == 0 {
            for u64 i = 0; i < cast(u64, SG_MAX_VERTEXBUFFER_BINDSLOTS); i++ {
                has_any_bindings |= bindings.vertex_buffers[i].id != cast(u32, SG_INVALID_ID);
            }
        }
        if has_any_bindings == 0 {
            for u64 i = 0; i < cast(u64, SG_MAX_VIEW_BINDSLOTS); i++ {
                has_any_bindings |= bindings.views[i].id != cast(u32, SG_INVALID_ID);
            }
        }
        if has_any_bindings == 0 {
            for u64 i = 0; i < cast(u64, SG_MAX_SAMPLER_BINDSLOTS); i++ {
                has_any_bindings |= bindings.samplers[i].id != cast(u32, SG_INVALID_ID);
            }
        }
        if has_any_bindings == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EMPTY_BINDINGS;
            _sg_log(SG_LOGITEM_VALIDATE_ABND_EMPTY_BINDINGS, 1, null, __line__);
        }
        bool pip_null = _sg_pipeline_ref_null(&_sg.cur_pip);
        bool pip_alive = _sg_pipeline_ref_alive(&_sg.cur_pip);
        if !pip_null == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_NO_PIPELINE;
            _sg_log(SG_LOGITEM_VALIDATE_ABND_NO_PIPELINE, 1, null, __line__);
        }
        if pip_alive == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_PIPELINE_ALIVE;
            _sg_log(SG_LOGITEM_VALIDATE_ABND_PIPELINE_ALIVE, 1, null, __line__);
        }
        if pip_alive == 0 {
            return _sg_validate_end();
        }
        _sg_pipeline_t* pip = _sg_pipeline_ref_ptr(&_sg.cur_pip);
        if pip.slot.state == SG_RESOURCESTATE_VALID == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_PIPELINE_VALID;
            _sg_log(SG_LOGITEM_VALIDATE_ABND_PIPELINE_VALID, 1, null, __line__);
        }
        bool shd_alive = _sg_shader_ref_alive(&pip.cmn.shader);
        if shd_alive == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_PIPELINE_SHADER_ALIVE;
            _sg_log(SG_LOGITEM_VALIDATE_ABND_PIPELINE_SHADER_ALIVE, 1, null, __line__);
        }
        if shd_alive == 0 {
            return _sg_validate_end();
        }
        _sg_shader_t* shd = _sg_shader_ref_ptr(&pip.cmn.shader);
        if shd.slot.state == SG_RESOURCESTATE_VALID == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_PIPELINE_SHADER_VALID;
            _sg_log(SG_LOGITEM_VALIDATE_ABND_PIPELINE_SHADER_VALID, 1, null, __line__);
        }
        if _sg.cur_pass.is_compute {
            for u64 i = 0; i < cast(u64, SG_MAX_VERTEXBUFFER_BINDSLOTS); i++ {
                if bindings.vertex_buffers[i].id == cast(u32, SG_INVALID_ID) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_COMPUTE_EXPECTED_NO_VBUFS;
                    _sg_log(SG_LOGITEM_VALIDATE_ABND_COMPUTE_EXPECTED_NO_VBUFS, 1, null, __line__);
                }
            }
        } else {
            for u64 i = 0; i < cast(u64, SG_MAX_VERTEXBUFFER_BINDSLOTS); i++ {
                if pip.cmn.vertex_buffer_layout_active[i] != 0 {
                    if bindings.vertex_buffers[i].id != cast(u32, SG_INVALID_ID) == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECTED_VBUF;
                        _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECTED_VBUF, 1, null, __line__);
                    }
                    if bindings.vertex_buffers[i].id != cast(u32, SG_INVALID_ID) {
                        _sg_buffer_t* buf = _sg_lookup_buffer(bindings.vertex_buffers[i].id);
                        if buf != null == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_VBUF_ALIVE;
                            _sg_log(SG_LOGITEM_VALIDATE_ABND_VBUF_ALIVE, 1, null, __line__);
                        }
                        if buf != null && buf.slot.state == SG_RESOURCESTATE_VALID {
                            buf.cmn.validate.bind_frame_index = _sg.frame_index;
                            buf.cmn.validate.read_render_pass_index = _sg.validate.pass_index;
                            if !buf.cmn.usage.vertex_buffer {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_VBUF_USAGE;
                                _sg_log(SG_LOGITEM_VALIDATE_ABND_VBUF_USAGE, 1, null, __line__);
                            }
                            if buf.cmn.validate.write_render_pass_index != _sg.validate.pass_index == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_VBUF_VS_SBVIEW_READWRITE;
                                _sg_log(SG_LOGITEM_VALIDATE_ABND_VBUF_VS_SBVIEW_READWRITE, 1, null, __line__);
                            }
                            if buf.cmn.usage.write_transient {
                                _sg.validate.write_buffer_transient_missing |= buf.cmn.write_transient_frame_index != _sg.frame_index;
                            }
                        }
                    }
                }
            }
        }
        if _sg.cur_pass.is_compute {
            if bindings.index_buffer.id == cast(u32, SG_INVALID_ID) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_COMPUTE_EXPECTED_NO_IBUF;
                _sg_log(SG_LOGITEM_VALIDATE_ABND_COMPUTE_EXPECTED_NO_IBUF, 1, null, __line__);
            }
        } else {
            if pip.cmn.index_type == SG_INDEXTYPE_NONE {
                if bindings.index_buffer.id == cast(u32, SG_INVALID_ID) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECTED_NO_IBUF;
                    _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECTED_NO_IBUF, 1, null, __line__);
                }
            } else {
                if bindings.index_buffer.id != cast(u32, SG_INVALID_ID) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECTED_IBUF;
                    _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECTED_IBUF, 1, null, __line__);
                }
            }
            if bindings.index_buffer.id != cast(u32, SG_INVALID_ID) {
                _sg_buffer_t* buf = _sg_lookup_buffer(bindings.index_buffer.id);
                if buf != null == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_IBUF_ALIVE;
                    _sg_log(SG_LOGITEM_VALIDATE_ABND_IBUF_ALIVE, 1, null, __line__);
                }
                if buf != null && buf.slot.state == SG_RESOURCESTATE_VALID {
                    buf.cmn.validate.bind_frame_index = _sg.frame_index;
                    buf.cmn.validate.read_render_pass_index = _sg.validate.pass_index;
                    if !buf.cmn.usage.index_buffer {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_IBUF_USAGE;
                        _sg_log(SG_LOGITEM_VALIDATE_ABND_IBUF_USAGE, 1, null, __line__);
                    }
                    if buf.cmn.validate.write_render_pass_index != _sg.validate.pass_index == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_IBUF_VS_SBVIEW_READWRITE;
                        _sg_log(SG_LOGITEM_VALIDATE_ABND_IBUF_VS_SBVIEW_READWRITE, 1, null, __line__);
                    }
                    if buf.cmn.usage.write_transient {
                        _sg.validate.write_buffer_transient_missing |= buf.cmn.write_transient_frame_index != _sg.frame_index;
                    }
                }
            }
        }
        for u64 i = 0; i < cast(u64, SG_MAX_VIEW_BINDSLOTS); i++ {
            if shd.cmn.views[i].view_type != SG_VIEWTYPE_INVALID {
                if bindings.views[i].id != cast(u32, SG_INVALID_ID) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECTED_VIEW_BINDING;
                    _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECTED_VIEW_BINDING, 1, null, __line__);
                }
                if bindings.views[i].id != cast(u32, SG_INVALID_ID) {
                    _sg_view_t* view = _sg_lookup_view(bindings.views[i].id);
                    if view != null == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_VIEW_ALIVE;
                        _sg_log(SG_LOGITEM_VALIDATE_ABND_VIEW_ALIVE, 1, null, __line__);
                    }
                    if view != null {
                        if view.slot.state == SG_RESOURCESTATE_VALID {
                            if shd.cmn.views[i].view_type == SG_VIEWTYPE_TEXTURE {
                                if view.cmn.type == SG_VIEWTYPE_TEXTURE == 0 {
                                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECT_TEXVIEW;
                                    _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECT_TEXVIEW, 1, null, __line__);
                                }
                                if _sg_image_ref_valid(&view.cmn.img.ref) != 0 {
                                    _sg_image_t* img = _sg_image_ref_ptr(&view.cmn.img.ref);
                                    img.cmn.validate.bind_frame_index = _sg.frame_index;
                                    if img.cmn.type == shd.cmn.views[i].image_type == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXVIEW_IMAGETYPE_MISMATCH;
                                        _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXVIEW_IMAGETYPE_MISMATCH, 1, null, __line__);
                                    }
                                    if shd.cmn.views[i].multisampled != 0 {
                                        if img.cmn.sample_count > 1 == 0 {
                                            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_MULTISAMPLED_IMAGE;
                                            _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_MULTISAMPLED_IMAGE, 1, null, __line__);
                                        }
                                    } else {
                                        if img.cmn.sample_count == 1 == 0 {
                                            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_NON_MULTISAMPLED_IMAGE;
                                            _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_NON_MULTISAMPLED_IMAGE, 1, null, __line__);
                                        }
                                    }
                                    _sg_pixelformat_info_t* info = &_sg.formats[img.cmn.pixel_format];
                                    switch shd.cmn.views[i].sample_type {
                                        case SG_IMAGESAMPLETYPE_FLOAT: {
                                            if info.filter == 0 {
                                                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_FILTERABLE_IMAGE;
                                                _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_FILTERABLE_IMAGE, 1, null, __line__);
                                            }
                                        }
                                        case SG_IMAGESAMPLETYPE_DEPTH: {
                                            if info.depth == 0 {
                                                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_DEPTH_IMAGE;
                                                _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXVIEW_EXPECTED_DEPTH_IMAGE, 1, null, __line__);
                                            }
                                        }
                                        default: {
                                        }
                                    }
                                    if img.cmn.usage.write_transient {
                                        _sg.validate.write_image_transient_missing |= img.cmn.write_transient_frame_index != _sg.frame_index;
                                    }
                                }
                            } else if shd.cmn.views[i].view_type == SG_VIEWTYPE_STORAGEBUFFER {
                                if view.cmn.type == SG_VIEWTYPE_STORAGEBUFFER == 0 {
                                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECT_SBVIEW;
                                    _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECT_SBVIEW, 1, null, __line__);
                                }
                                if _sg_buffer_ref_valid(&view.cmn.buf.ref) != 0 {
                                    _sg_buffer_t* buf = _sg_buffer_ref_ptr(&view.cmn.buf.ref);
                                    buf.cmn.validate.bind_frame_index = _sg.frame_index;
                                    if shd.cmn.views[i].sbuf_readonly != 0 {
                                        buf.cmn.validate.read_render_pass_index = _sg.validate.pass_index;
                                        if (_sg.cur_pass.is_compute || buf.cmn.validate.write_render_pass_index != _sg.validate.pass_index) == 0 {
                                            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_SBVIEW_READONLY_VS_READWRITE;
                                            _sg_log(SG_LOGITEM_VALIDATE_ABND_SBVIEW_READONLY_VS_READWRITE, 1, null, __line__);
                                        }
                                    } else {
                                        buf.cmn.validate.write_render_pass_index = _sg.validate.pass_index;
                                        if (_sg.cur_pass.is_compute || buf.cmn.validate.read_render_pass_index != _sg.validate.pass_index) == 0 {
                                            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_SBVIEW_READWRITE_VS_READ;
                                            _sg_log(SG_LOGITEM_VALIDATE_ABND_SBVIEW_READWRITE_VS_READ, 1, null, __line__);
                                        }
                                        if buf.cmn.usage.write_transient {
                                            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_SBVIEW_READWRITE_VS_WRITETRANSIENT;
                                            _sg_log(SG_LOGITEM_VALIDATE_ABND_SBVIEW_READWRITE_VS_WRITETRANSIENT, 1, null, __line__);
                                        }
                                    }
                                    if buf.cmn.usage.write_transient {
                                        _sg.validate.write_buffer_transient_missing |= buf.cmn.write_transient_frame_index != _sg.frame_index;
                                    }
                                }
                            } else if shd.cmn.views[i].view_type == SG_VIEWTYPE_STORAGEIMAGE {
                                if view.cmn.type == SG_VIEWTYPE_STORAGEIMAGE == 0 {
                                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECT_SIMGVIEW;
                                    _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECT_SIMGVIEW, 1, null, __line__);
                                }
                                if !_sg.cur_pass.is_compute {
                                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_COMPUTE_PASS_EXPECTED;
                                    _sg_log(SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_COMPUTE_PASS_EXPECTED, 1, null, __line__);
                                }
                                if _sg_image_ref_valid(&view.cmn.img.ref) != 0 {
                                    _sg_image_t* img = _sg_image_ref_ptr(&view.cmn.img.ref);
                                    img.cmn.validate.bind_frame_index = _sg.frame_index;
                                    if img.cmn.type == shd.cmn.views[i].image_type == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_IMAGETYPE_MISMATCH;
                                        _sg_log(SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_IMAGETYPE_MISMATCH, 1, null, __line__);
                                    }
                                    if img.cmn.pixel_format == shd.cmn.views[i].access_format == 0 {
                                        _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_ACCESSFORMAT;
                                        _sg_log(SG_LOGITEM_VALIDATE_ABND_SIMGVIEW_ACCESSFORMAT, 1, null, __line__);
                                    }
                                    if img.cmn.usage.write_transient {
                                        _sg.validate.write_image_transient_missing |= img.cmn.write_transient_frame_index != _sg.frame_index;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        for u64 i = 0; i < cast(u64, SG_MAX_SAMPLER_BINDSLOTS); i++ {
            if shd.cmn.samplers[i].stage != SG_SHADERSTAGE_NONE {
                if bindings.samplers[i].id != cast(u32, SG_INVALID_ID) == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECTED_SAMPLER_BINDING;
                    _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECTED_SAMPLER_BINDING, 1, null, __line__);
                }
                if bindings.samplers[i].id != cast(u32, SG_INVALID_ID) {
                    _sg_sampler_t* smp = _sg_lookup_sampler(bindings.samplers[i].id);
                    if smp != null == 0 {
                        _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_SAMPLER_ALIVE;
                        _sg_log(SG_LOGITEM_VALIDATE_ABND_SAMPLER_ALIVE, 1, null, __line__);
                    }
                    if smp != null {
                        if smp.slot.state == SG_RESOURCESTATE_VALID == 0 {
                            _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_SAMPLER_VALID;
                            _sg_log(SG_LOGITEM_VALIDATE_ABND_SAMPLER_VALID, 1, null, __line__);
                        }
                        if shd.cmn.samplers[i].sampler_type == SG_SAMPLERTYPE_COMPARISON {
                            if smp.cmn.compare != SG_COMPAREFUNC_NEVER == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_UNEXPECTED_SAMPLER_COMPARE_NEVER;
                                _sg_log(SG_LOGITEM_VALIDATE_ABND_UNEXPECTED_SAMPLER_COMPARE_NEVER, 1, null, __line__);
                            }
                        } else {
                            if smp.cmn.compare == SG_COMPAREFUNC_NEVER == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECTED_SAMPLER_COMPARE_NEVER;
                                _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECTED_SAMPLER_COMPARE_NEVER, 1, null, __line__);
                            }
                        }
                        if shd.cmn.samplers[i].sampler_type == SG_SAMPLERTYPE_NONFILTERING {
                            bool nonfiltering = smp.cmn.min_filter != SG_FILTER_LINEAR && smp.cmn.mag_filter != SG_FILTER_LINEAR && smp.cmn.mipmap_filter != SG_FILTER_LINEAR;
                            if nonfiltering == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_EXPECTED_NONFILTERING_SAMPLER;
                                _sg_log(SG_LOGITEM_VALIDATE_ABND_EXPECTED_NONFILTERING_SAMPLER, 1, null, __line__);
                            }
                        }
                    }
                }
            }
        }
        for u64 tex_view_idx = 0; tex_view_idx < cast(u64, SG_MAX_VIEW_BINDSLOTS); tex_view_idx++ {
            if shd.cmn.views[tex_view_idx].view_type == SG_VIEWTYPE_TEXTURE {
                if bindings.views[tex_view_idx].id == cast(u32, SG_INVALID_ID) {
                    continue;
                }
                _sg_view_t* tex_view = _sg_lookup_view(bindings.views[tex_view_idx].id);
                if tex_view != null {
                    u32 img_id = tex_view.cmn.img.ref.sref.id;
                    if _sg_attachments_empty(&_sg.cur_pass.atts) == 0 {
                        _sg_view_t* ds_view = _sg_lookup_view(_sg.cur_pass.atts.depth_stencil.id);
                        if ds_view != null {
                            if img_id != ds_view.cmn.img.ref.sref.id == 0 {
                                _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_DEPTHSTENCIL_ATTACHMENT;
                                _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_DEPTHSTENCIL_ATTACHMENT, 1, null, __line__);
                            }
                        }
                        for u64 att_idx = 0; att_idx < cast(u64, SG_MAX_COLOR_ATTACHMENTS); att_idx++ {
                            _sg_view_t* color_view = _sg_lookup_view(_sg.cur_pass.atts.colors[att_idx].id);
                            if color_view != null {
                                if img_id != color_view.cmn.img.ref.sref.id == 0 {
                                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_COLOR_ATTACHMENT;
                                    _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_COLOR_ATTACHMENT, 1, null, __line__);
                                }
                            }
                            _sg_view_t* resolve_view = _sg_lookup_view(_sg.cur_pass.atts.resolves[att_idx].id);
                            if resolve_view != null {
                                if img_id != resolve_view.cmn.img.ref.sref.id == 0 {
                                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_RESOLVE_ATTACHMENT;
                                    _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXTURE_BINDING_VS_RESOLVE_ATTACHMENT, 1, null, __line__);
                                }
                            }
                        }
                    }
                    for u64 simg_view_idx = 0; simg_view_idx < cast(u64, SG_MAX_VIEW_BINDSLOTS); simg_view_idx++ {
                        if shd.cmn.views[simg_view_idx].view_type == SG_VIEWTYPE_STORAGEIMAGE {
                            if bindings.views[simg_view_idx].id == cast(u32, SG_INVALID_ID) {
                                continue;
                            }
                            _sg_view_t* simg_view = _sg_lookup_view(bindings.views[simg_view_idx].id);
                            if simg_view != null {
                                if img_id != simg_view.cmn.img.ref.sref.id == 0 {
                                    _sg.validate_error = SG_LOGITEM_VALIDATE_ABND_TEXTURE_VS_STORAGEIMAGE_BINDING;
                                    _sg_log(SG_LOGITEM_VALIDATE_ABND_TEXTURE_VS_STORAGEIMAGE_BINDING, 1, null, __line__);
                                }
                            }
                        }
                    }
                }
            }
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_apply_uniforms(i32 ub_slot, sg_range* data) {
    when !defined(SOKOL_DEBUG) {
        ignore ub_slot;
        ignore data;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(ub_slot >= 0 && ub_slot < SG_MAX_UNIFORMBLOCK_BINDSLOTS);
        _sg_validate_begin();
        _sg.validate.applied_bindings_and_uniforms |= cast(u32, cast(u32, 1) << ub_slot);
        if _sg.cur_pass.in_pass == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_AU_PASS_EXPECTED;
            _sg_log(SG_LOGITEM_VALIDATE_AU_PASS_EXPECTED, 1, null, __line__);
        }
        _sg_pipeline_ref_t* pip_ref = &_sg.cur_pip;
        bool pip_null = _sg_pipeline_ref_null(pip_ref);
        bool pip_alive = _sg_pipeline_ref_alive(pip_ref);
        if !pip_null == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_AU_NO_PIPELINE;
            _sg_log(SG_LOGITEM_VALIDATE_AU_NO_PIPELINE, 1, null, __line__);
        }
        if pip_alive == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_AU_PIPELINE_ALIVE;
            _sg_log(SG_LOGITEM_VALIDATE_AU_PIPELINE_ALIVE, 1, null, __line__);
        }
        if pip_alive {
            _sg_pipeline_t* pip = _sg_pipeline_ref_ptr(pip_ref);
            if pip.slot.state == SG_RESOURCESTATE_VALID == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_AU_PIPELINE_VALID;
                _sg_log(SG_LOGITEM_VALIDATE_AU_PIPELINE_VALID, 1, null, __line__);
            }
            _sg_shader_ref_t* shd_ref = &pip.cmn.shader;
            bool shd_alive = _sg_shader_ref_alive(shd_ref);
            if shd_alive == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_AU_PIPELINE_SHADER_ALIVE;
                _sg_log(SG_LOGITEM_VALIDATE_AU_PIPELINE_SHADER_ALIVE, 1, null, __line__);
            }
            if shd_alive {
                _sg_shader_t* shd = _sg_shader_ref_ptr(shd_ref);
                if shd.slot.state == SG_RESOURCESTATE_VALID == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_AU_PIPELINE_SHADER_VALID;
                    _sg_log(SG_LOGITEM_VALIDATE_AU_PIPELINE_SHADER_VALID, 1, null, __line__);
                }
                if shd.cmn.uniform_blocks[ub_slot].stage != SG_SHADERSTAGE_NONE == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_AU_NO_UNIFORMBLOCK_AT_SLOT;
                    _sg_log(SG_LOGITEM_VALIDATE_AU_NO_UNIFORMBLOCK_AT_SLOT, 1, null, __line__);
                }
                if data.size == shd.cmn.uniform_blocks[ub_slot].size == 0 {
                    _sg.validate_error = SG_LOGITEM_VALIDATE_AU_SIZE;
                    _sg_log(SG_LOGITEM_VALIDATE_AU_SIZE, 1, null, __line__);
                }
            }
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_draw(i32 base_element, i32 num_elements, i32 num_instances) {
    when !defined(SOKOL_DEBUG) {
        ignore base_element;
        ignore num_elements;
        ignore num_instances;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        _sg_validate_begin();
        if (_sg.cur_pass.in_pass && !_sg.cur_pass.is_compute) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_RENDERPASS_EXPECTED;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_RENDERPASS_EXPECTED, 1, null, __line__);
        }
        if base_element >= 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_BASEELEMENT_GE_ZERO;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_BASEELEMENT_GE_ZERO, 1, null, __line__);
        }
        if num_elements >= 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_NUMELEMENTS_GE_ZERO;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_NUMELEMENTS_GE_ZERO, 1, null, __line__);
        }
        if num_instances >= 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_NUMINSTANCES_GE_ZERO;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_NUMINSTANCES_GE_ZERO, 1, null, __line__);
        }
        if _sg.validate.required_bindings_and_uniforms == _sg.validate.applied_bindings_and_uniforms == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING, 1, null, __line__);
        }
        if !_sg.validate.write_buffer_transient_missing == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_WRITE_BUFFER_TRANSIENT_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_WRITE_BUFFER_TRANSIENT_MISSING, 1, null, __line__);
        }
        if !_sg.validate.write_image_transient_missing == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_WRITE_IMAGE_TRANSIENT_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_WRITE_IMAGE_TRANSIENT_MISSING, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_draw_ex(i32 base_element, i32 num_elements, i32 num_instances, i32 base_vertex, i32 base_instance) {
    when !defined(SOKOL_DEBUG) {
        ignore base_element;
        ignore num_elements;
        ignore num_instances;
        ignore base_vertex;
        ignore base_instance;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        _sg_validate_begin();
        if (_sg.cur_pass.in_pass && !_sg.cur_pass.is_compute) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_RENDERPASS_EXPECTED;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_RENDERPASS_EXPECTED, 1, null, __line__);
        }
        if base_element >= 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_BASEELEMENT_GE_ZERO;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_BASEELEMENT_GE_ZERO, 1, null, __line__);
        }
        if num_elements >= 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_NUMELEMENTS_GE_ZERO;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_NUMELEMENTS_GE_ZERO, 1, null, __line__);
        }
        if num_instances >= 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_NUMINSTANCES_GE_ZERO;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_NUMINSTANCES_GE_ZERO, 1, null, __line__);
        }
        if base_instance >= 0 == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_GE_ZERO;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_GE_ZERO, 1, null, __line__);
        }
        if base_vertex != 0 {
            if !_sg.features.draw_base_vertex {
                _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_BASEVERTEX_NOT_SUPPORTED;
                _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_BASEVERTEX_NOT_SUPPORTED, 1, null, __line__);
            }
        }
        if base_instance > 0 {
            if !_sg.features.draw_base_instance {
                _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_NOT_SUPPORTED;
                _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_NOT_SUPPORTED, 1, null, __line__);
            }
        }
        if _sg.use_indexed_draw == 0 {
            if base_vertex == 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_BASEVERTEX_VS_INDEXED;
                _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_BASEVERTEX_VS_INDEXED, 1, null, __line__);
            }
        }
        bool use_instanced_draw = num_instances > 1 || _sg.use_instanced_draw;
        if use_instanced_draw == 0 {
            if base_instance == 0 == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_VS_INSTANCED;
                _sg_log(SG_LOGITEM_VALIDATE_DRAW_EX_BASEINSTANCE_VS_INSTANCED, 1, null, __line__);
            }
        }
        if _sg.validate.required_bindings_and_uniforms == _sg.validate.applied_bindings_and_uniforms == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING, 1, null, __line__);
        }
        if !_sg.validate.write_buffer_transient_missing == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_WRITE_BUFFER_TRANSIENT_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_WRITE_BUFFER_TRANSIENT_MISSING, 1, null, __line__);
        }
        if !_sg.validate.write_image_transient_missing == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_WRITE_IMAGE_TRANSIENT_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_WRITE_IMAGE_TRANSIENT_MISSING, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_dispatch(i32 num_groups_x, i32 num_groups_y, i32 num_groups_z) {
    when !defined(SOKOL_DEBUG) {
        ignore num_groups_x;
        ignore num_groups_y;
        ignore num_groups_z;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        _sg_validate_begin();
        if (_sg.cur_pass.in_pass && _sg.cur_pass.is_compute) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DISPATCH_COMPUTEPASS_EXPECTED;
            _sg_log(SG_LOGITEM_VALIDATE_DISPATCH_COMPUTEPASS_EXPECTED, 1, null, __line__);
        }
        if (num_groups_x >= 0 && num_groups_x < 1 << 16) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSX;
            _sg_log(SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSX, 1, null, __line__);
        }
        if (num_groups_y >= 0 && num_groups_y < 1 << 16) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSY;
            _sg_log(SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSY, 1, null, __line__);
        }
        if (num_groups_z >= 0 && num_groups_z < 1 << 16) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSZ;
            _sg_log(SG_LOGITEM_VALIDATE_DISPATCH_NUMGROUPSZ, 1, null, __line__);
        }
        if _sg.validate.required_bindings_and_uniforms == _sg.validate.applied_bindings_and_uniforms == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING, 1, null, __line__);
        }
        if !_sg.validate.write_buffer_transient_missing == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DISPATCH_WRITE_BUFFER_TRANSIENT_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DISPATCH_WRITE_BUFFER_TRANSIENT_MISSING, 1, null, __line__);
        }
        if !_sg.validate.write_image_transient_missing == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_DISPATCH_WRITE_IMAGE_TRANSIENT_MISSING;
            _sg_log(SG_LOGITEM_VALIDATE_DISPATCH_WRITE_IMAGE_TRANSIENT_MISSING, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}
}
when defined(SOKOL_DEBUG) {

private {
void _sg_validate_write_buffer_common(_sg_buffer_t* buf, sg_write_buffer_desc* desc) {
    if desc.src.data.ptr == null {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFER_SRC_DATA_POINTER;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFER_SRC_DATA_POINTER, 1, null, __line__);
    }
    if desc.src.data.size > 0 == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFER_SRC_DATA_SIZE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFER_SRC_DATA_SIZE, 1, null, __line__);
    }
    if (desc.size > 0 && desc.size <= desc.src.data.size) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFER_SIZE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFER_SIZE, 1, null, __line__);
    }
    if desc.dst.offset + desc.size <= cast(u64, buf.cmn.size) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFER_WRITE_OVERFLOW;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFER_WRITE_OVERFLOW, 1, null, __line__);
    }
    if desc.src.offset + desc.size <= desc.src.data.size == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFER_READ_OVERFLOW;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFER_READ_OVERFLOW, 1, null, __line__);
    }
}
}
}

private {
bool _sg_validate_write_buffer_transient(_sg_buffer_t* buf, sg_write_buffer_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore buf;
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(buf != null && desc != null);
        assert(buf.slot.state == SG_RESOURCESTATE_VALID);
        _sg_validate_begin();
        if !buf.cmn.usage.write_transient {
            _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_USAGE;
            _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_USAGE, 1, null, __line__);
        }
        if buf.cmn.validate.bind_frame_index != _sg.frame_index == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_WRITE_BEFORE_BIND;
            _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_WRITE_BEFORE_BIND, 1, null, __line__);
        }
        if buf.cmn.validate.copy_src_frame_index != _sg.frame_index == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_WRITE_BEFORE_COPY;
            _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_WRITE_BEFORE_COPY, 1, null, __line__);
        }
        if _sg_multiple_u64(desc.dst.offset, 4) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_DST_OFFSET_ALIGNMENT;
            _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFERTRANSIENT_DST_OFFSET_ALIGNMENT, 1, null, __line__);
        }
        _sg_validate_write_buffer_common(buf, desc);
        return _sg_validate_end();
    }
}

bool _sg_validate_write_buffer_unsealed(_sg_buffer_t* buf, sg_write_buffer_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore buf;
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(buf != null && desc != null);
        assert(buf.slot.state == SG_RESOURCESTATE_UNSEALED);
        _sg_validate_begin();
        if !buf.cmn.usage.write_unsealed {
            _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEBUFFERUNSEALED_USAGE;
            _sg_log(SG_LOGITEM_VALIDATE_WRITEBUFFERUNSEALED_USAGE, 1, null, __line__);
        }
        _sg_validate_write_buffer_common(buf, desc);
        return _sg_validate_end();
    }
}
}
when defined(SOKOL_DEBUG) {

private {
void _sg_validate_write_image_common(_sg_image_t* img, sg_write_image_desc* desc) {
    u64 write_size = cast(u64, desc.src.bytes_per_slice) * cast(u64, desc.size.num_slices);
    i32 mip_width = _sg_miplevel_dim(img.cmn.width, desc.dst.mip_level);
    i32 mip_height = _sg_miplevel_dim(img.cmn.height, desc.dst.mip_level);
    i32 mip_depth_or_slices = cast(i32, SG_IMAGETYPE_3D) == img.cmn.type ? _sg_miplevel_dim(img.cmn.num_slices, desc.dst.mip_level) : img.cmn.num_slices;
    sg_pixel_format fmt = img.cmn.pixel_format;
    i32 bsize = _sg_block_bytesize(fmt);
    i32 block_dim = _sg_block_dim(fmt);
    i32 row_bytes = _sg_row_pitch(fmt, desc.size.width, 1);
    i32 num_rows = _sg_num_rows(fmt, desc.size.height);
    i32 bpr = desc.src.bytes_per_row;
    i32 bps = desc.src.bytes_per_slice;
    if desc.src.data.ptr == null {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_SRC_DATA_POINTER;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_SRC_DATA_POINTER, 1, null, __line__);
    }
    if desc.src.data.size > 0 == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_SRC_DATA_SIZE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_SRC_DATA_SIZE, 1, null, __line__);
    }
    if (bpr > 0 && _sg_multiple(bpr, bsize)) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERROW;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERROW, 1, null, __line__);
    }
    if (bps > 0 && bpr > 0 && _sg_multiple(bps, bpr)) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERSLICE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERSLICE, 1, null, __line__);
    }
    if (bpr <= 0 || bpr >= row_bytes) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERROW_TOO_SMALL;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERROW_TOO_SMALL, 1, null, __line__);
    }
    if (bps <= 0 || bps >= num_rows * bpr) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERSLICE_TOO_SMALL;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_BYTESPERSLICE_TOO_SMALL, 1, null, __line__);
    }
    if (desc.dst.mip_level >= 0 && desc.dst.mip_level < img.cmn.num_mipmaps) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_MIPLEVEL;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_MIPLEVEL, 1, null, __line__);
    }
    if (desc.size.width > 0 && desc.size.width <= mip_width) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_WIDTH;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_WIDTH, 1, null, __line__);
    }
    if (desc.size.height > 0 && desc.size.height <= mip_height) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_HEIGHT;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_HEIGHT, 1, null, __line__);
    }
    if (desc.size.num_slices > 0 && desc.size.num_slices <= mip_depth_or_slices) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_NUMSLICES;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_NUMSLICES, 1, null, __line__);
    }
    if desc.src.offset + write_size <= desc.src.data.size == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_READ_OVERFLOW;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_READ_OVERFLOW, 1, null, __line__);
    }
    if (desc.dst.x >= 0 && desc.dst.x < mip_width) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_X_RANGE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_X_RANGE, 1, null, __line__);
    }
    if (desc.dst.y >= 0 && desc.dst.y < mip_height) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_Y_RANGE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_Y_RANGE, 1, null, __line__);
    }
    if (desc.dst.slice >= 0 && desc.dst.slice < mip_depth_or_slices) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_SLICE_RANGE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_SLICE_RANGE, 1, null, __line__);
    }
    if desc.dst.x + desc.size.width <= mip_width == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_WIDTH_OVERFLOW;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_WIDTH_OVERFLOW, 1, null, __line__);
    }
    if desc.dst.y + desc.size.height <= mip_height == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_HEIGHT_OVERFLOW;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_HEIGHT_OVERFLOW, 1, null, __line__);
    }
    if desc.dst.slice + desc.size.num_slices <= mip_depth_or_slices == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_NUMSLICES_OVERFLOW;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_WRITE_NUMSLICES_OVERFLOW, 1, null, __line__);
    }
    if (desc.dst.x < 0 || _sg_multiple(desc.dst.x, block_dim)) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_X_ALIGNMENT;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_X_ALIGNMENT, 1, null, __line__);
    }
    if (desc.dst.y < 0 || _sg_multiple(desc.dst.y, block_dim)) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_Y_ALIGNMENT;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_DST_Y_ALIGNMENT, 1, null, __line__);
    }
    if (desc.size.width <= 0 || _sg_multiple(desc.size.width, block_dim) || desc.dst.x + desc.size.width == mip_width) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_WIDTH_MULTIPLE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_WIDTH_MULTIPLE, 1, null, __line__);
    }
    if (desc.size.height <= 0 || _sg_multiple(desc.size.height, block_dim) || desc.dst.y + desc.size.height == mip_height) == 0 {
        _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGE_HEIGHT_MULTIPLE;
        _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGE_HEIGHT_MULTIPLE, 1, null, __line__);
    }
}
}
}

private {
bool _sg_validate_write_image_transient(_sg_image_t* img, sg_write_image_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore img;
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(img != null && desc != null);
        assert(img.slot.state == SG_RESOURCESTATE_VALID);
        _sg_validate_begin();
        if (!img.cmn.usage.immutable && img.cmn.usage.write_transient) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGETRANSIENT_USAGE;
            _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGETRANSIENT_USAGE, 1, null, __line__);
        }
        if img.cmn.validate.bind_frame_index != _sg.frame_index == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGETRANSIENT_WRITE_BEFORE_BIND;
            _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGETRANSIENT_WRITE_BEFORE_BIND, 1, null, __line__);
        }
        _sg_validate_write_image_common(img, desc);
        return _sg_validate_end();
    }
}

bool _sg_validate_write_image_unsealed(_sg_image_t* img, sg_write_image_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore img;
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(img != null && desc != null);
        assert(img.slot.state == SG_RESOURCESTATE_UNSEALED);
        _sg_validate_begin();
        if (img.cmn.usage.immutable && img.cmn.usage.write_unsealed) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_WRITEIMAGEUNSEALED_USAGE;
            _sg_log(SG_LOGITEM_VALIDATE_WRITEIMAGEUNSEALED_USAGE, 1, null, __line__);
        }
        _sg_validate_write_image_common(img, desc);
        return _sg_validate_end();
    }
}

bool _sg_validate_seal_buffer(_sg_buffer_t* buf) {
    when !defined(SOKOL_DEBUG) {
        ignore buf;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(cast(i64, buf));
        _sg_validate_begin();
        if buf.slot.state == SG_RESOURCESTATE_UNSEALED == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_SEALBUFFER_RESOURCESTATE;
            _sg_log(SG_LOGITEM_VALIDATE_SEALBUFFER_RESOURCESTATE, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_seal_image(_sg_image_t* img) {
    when !defined(SOKOL_DEBUG) {
        ignore img;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(cast(i64, img));
        _sg_validate_begin();
        if img.slot.state == SG_RESOURCESTATE_UNSEALED == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_SEALIMAGE_RESOURCESTATE;
            _sg_log(SG_LOGITEM_VALIDATE_SEALIMAGE_RESOURCESTATE, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_copy_buffer_to_buffer(_sg_buffer_t* src_buf, _sg_buffer_t* dst_buf, sg_copy_buffer_to_buffer_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore src_buf;
        ignore dst_buf;
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(src_buf != null && dst_buf != null && desc != null);
        assert(src_buf.slot.state == SG_RESOURCESTATE_VALID);
        assert(dst_buf.slot.state == SG_RESOURCESTATE_VALID);
        src_buf.cmn.validate.copy_src_frame_index = _sg.frame_index;
        _sg_validate_begin();
        if _sg.cur_pass.in_pass {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_INSIDE_PASS;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_INSIDE_PASS, 1, null, __line__);
        }
        if desc.src.buffer.id == desc.dst.buffer.id {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_VS_DST_BUFFER;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_VS_DST_BUFFER, 1, null, __line__);
        }
        if !src_buf.cmn.usage.copy_src {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_COPY_SRC;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_COPY_SRC, 1, null, __line__);
        }
        if !dst_buf.cmn.usage.copy_dst {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_COPY_DST;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_COPY_DST, 1, null, __line__);
        }
        if desc.size == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_ZERO_SIZE;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_ZERO_SIZE, 1, null, __line__);
        }
        if _sg_multiple_u64(desc.src.offset, 4) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_OFFSET_ALIGNMENT;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_OFFSET_ALIGNMENT, 1, null, __line__);
        }
        if _sg_multiple_u64(desc.dst.offset, 4) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_DST_OFFSET_ALIGNMENT;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_DST_OFFSET_ALIGNMENT, 1, null, __line__);
        }
        if desc.src.offset + desc.size <= cast(u64, src_buf.cmn.size) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_OVERFLOW;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_SRC_OVERFLOW, 1, null, __line__);
        }
        if desc.dst.offset + desc.size <= cast(u64, dst_buf.cmn.size) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_DST_OVERFLOW;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_DST_OVERFLOW, 1, null, __line__);
        }
        if _sg.features.separate_buffer_types != 0 {
            bool src_is_index = src_buf.cmn.usage.index_buffer || src_buf.cmn.usage.staging_index_buffer;
            bool dst_is_index = dst_buf.cmn.usage.index_buffer;
            if src_is_index == dst_is_index == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_WEBGL2_INDEX_BUFFER;
                _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOBUFFER_WEBGL2_INDEX_BUFFER, 1, null, __line__);
            }
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_copy_buffer_to_image(_sg_buffer_t* src_buf, _sg_image_t* dst_img, sg_copy_buffer_to_image_desc* desc) {
    when !defined(SOKOL_DEBUG) {
        ignore src_buf;
        ignore dst_img;
        ignore desc;
        return true;
    } else {
        if _sg.desc.disable_validation != 0 {
            return true;
        }
        assert(src_buf != null && dst_img != null && desc != null);
        assert(src_buf.slot.state == SG_RESOURCESTATE_VALID);
        assert(dst_img.slot.state == SG_RESOURCESTATE_VALID);
        src_buf.cmn.validate.copy_src_frame_index = _sg.frame_index;
        _sg_validate_begin();
        i32 mip_width = _sg_miplevel_dim(dst_img.cmn.width, desc.dst.mip_level);
        i32 mip_height = _sg_miplevel_dim(dst_img.cmn.height, desc.dst.mip_level);
        i32 mip_depth_or_slices = cast(i32, SG_IMAGETYPE_3D) == dst_img.cmn.type ? _sg_miplevel_dim(dst_img.cmn.num_slices, desc.dst.mip_level) : dst_img.cmn.num_slices;
        sg_pixel_format fmt = dst_img.cmn.pixel_format;
        i32 block_dim = _sg_block_dim(fmt);
        i32 block_size = _sg_block_bytesize(fmt);
        i32 row_bytes = _sg_row_pitch(fmt, desc.size.width, 1);
        i32 num_rows = _sg_num_rows(fmt, desc.size.height);
        i32 bpr = desc.src.bytes_per_row;
        i32 bps = desc.src.bytes_per_slice;
        bool is_staging_buffer = src_buf.cmn.usage.staging_buffer;
        if (bpr <= 0 || bpr >= row_bytes) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_TOO_SMALL;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_TOO_SMALL, 1, null, __line__);
        }
        if (bps <= 0 || bps >= num_rows * bpr) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERSLICE_TOO_SMALL;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERSLICE_TOO_SMALL, 1, null, __line__);
        }
        if !src_buf.cmn.usage.staging_index_buffer == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_STAGING_INDEX_BUFFER;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_STAGING_INDEX_BUFFER, 1, null, __line__);
        }
        if _sg.features.copy_buffer_to_image_relaxed_buffer_type == 0 {
            if is_staging_buffer == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_STAGING_BUFFER;
                _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_STAGING_BUFFER, 1, null, __line__);
            }
        }
        if _sg.features.separate_buffer_types != 0 {
            if src_buf.cmn.usage.index_buffer {
                _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_WEBGL2_INDEX_BUFFER;
                _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_WEBGL2_INDEX_BUFFER, 1, null, __line__);
            }
        }
        if !_sg.features.copy_buffer_to_image_relaxed_bytes_per_row && !is_staging_buffer {
            if (bpr > 0 && _sg_multiple(bpr, 256)) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_MULTIPLE_256;
                _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_MULTIPLE_256, 1, null, __line__);
            }
        }
        if (bpr > 0 && _sg_multiple(bpr, block_size)) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_MULTIPLE_BLOCKSIZE;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERROW_MULTIPLE_BLOCKSIZE, 1, null, __line__);
        }
        if !_sg.cur_pass.in_pass == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_INSIDE_PASS;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_INSIDE_PASS, 1, null, __line__);
        }
        if !src_buf.cmn.usage.copy_src {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_COPY_SRC;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_COPY_SRC, 1, null, __line__);
        }
        if !dst_img.cmn.usage.copy_dst {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_COPY_DST;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_COPY_DST, 1, null, __line__);
        }
        if _sg_multiple_u64(desc.src.offset, cast(u64, block_size)) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_OFFSET_ALIGNMENT;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_OFFSET_ALIGNMENT, 1, null, __line__);
        }
        if (bps > 0 && bpr > 0 && _sg_multiple(bps, bpr)) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERSLICE;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_BYTESPERSLICE, 1, null, __line__);
        }
        if (desc.dst.mip_level >= 0 && desc.dst.mip_level < dst_img.cmn.num_mipmaps) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_MIPLEVEL;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_MIPLEVEL, 1, null, __line__);
        }
        if (desc.size.width > 0 && desc.size.width <= mip_width) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH, 1, null, __line__);
        }
        if (desc.size.height > 0 && desc.size.height <= mip_height) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT, 1, null, __line__);
        }
        if (desc.size.width <= 0 || _sg_multiple(desc.size.width, block_dim) || desc.dst.x + desc.size.width == mip_width) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH_MULTIPLE;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH_MULTIPLE, 1, null, __line__);
        }
        if (desc.size.height <= 0 || _sg_multiple(desc.size.height, block_dim) || desc.dst.y + desc.size.height == mip_height) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT_MULTIPLE;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT_MULTIPLE, 1, null, __line__);
        }
        if desc.size.width > 0 && desc.size.height > 0 && desc.size.num_slices > 0 {
            u64 required_size = desc.src.offset + _sg_image_copy_size(fmt, bpr, bps, desc.size.width, desc.size.height, desc.size.num_slices);
            if required_size <= cast(u64, src_buf.cmn.size) == 0 {
                _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_OVERFLOW;
                _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_SRC_OVERFLOW, 1, null, __line__);
            }
        }
        if (desc.size.num_slices > 0 && desc.size.num_slices <= mip_depth_or_slices) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_NUMSLICES;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_NUMSLICES, 1, null, __line__);
        }
        if (desc.dst.x >= 0 && desc.dst.x < mip_width) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_X_RANGE;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_X_RANGE, 1, null, __line__);
        }
        if (desc.dst.y >= 0 && desc.dst.y < mip_height) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_Y_RANGE;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_Y_RANGE, 1, null, __line__);
        }
        if (desc.dst.x < 0 || _sg_multiple(desc.dst.x, block_dim)) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_X_ALIGNMENT;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_X_ALIGNMENT, 1, null, __line__);
        }
        if (desc.dst.y < 0 || _sg_multiple(desc.dst.y, block_dim)) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_Y_ALIGNMENT;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_Y_ALIGNMENT, 1, null, __line__);
        }
        if (desc.dst.slice >= 0 && desc.dst.slice < mip_depth_or_slices) == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_SLICE_RANGE;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_SLICE_RANGE, 1, null, __line__);
        }
        if desc.dst.x + desc.size.width <= mip_width == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH_OVERFLOW;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_WIDTH_OVERFLOW, 1, null, __line__);
        }
        if desc.dst.y + desc.size.height <= mip_height == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT_OVERFLOW;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_HEIGHT_OVERFLOW, 1, null, __line__);
        }
        if desc.dst.slice + desc.size.num_slices <= mip_depth_or_slices == 0 {
            _sg.validate_error = SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_NUMSLICES_OVERFLOW;
            _sg_log(SG_LOGITEM_VALIDATE_COPYBUFFERTOIMAGE_DST_NUMSLICES_OVERFLOW, 1, null, __line__);
        }
        return _sg_validate_end();
    }
}

bool _sg_validate_shader_binding_limits(sg_shader_desc* desc) {
    assert(cast(i64, desc));
    i32 vs_num_tex = 0;
    i32 fs_num_tex = 0;
    i32 cs_num_tex = 0;
    i32 vs_num_sbuf = 0;
    i32 fs_num_sbuf = 0;
    i32 cs_num_sbuf = 0;
    i32 vs_num_simg = 0;
    i32 fs_num_simg = 0;
    i32 cs_num_simg = 0;
    i32 vs_num_texsmp = 0;
    i32 fs_num_texsmp = 0;
    i32 cs_num_texsmp = 0;
    for u64 i = 0; i < cast(u64, SG_MAX_VIEW_BINDSLOTS); i++ {
        switch desc.views[i].texture.stage {
            case SG_SHADERSTAGE_VERTEX: {
                vs_num_tex++;
            }
            case SG_SHADERSTAGE_FRAGMENT: {
                fs_num_tex++;
            }
            case SG_SHADERSTAGE_COMPUTE: {
                cs_num_tex++;
            }
            default: {
            }
        }
        switch desc.views[i].storage_buffer.stage {
            case SG_SHADERSTAGE_VERTEX: {
                vs_num_sbuf++;
            }
            case SG_SHADERSTAGE_FRAGMENT: {
                fs_num_sbuf++;
            }
            case SG_SHADERSTAGE_COMPUTE: {
                cs_num_sbuf++;
            }
            default: {
            }
        }
        switch desc.views[i].storage_image.stage {
            case SG_SHADERSTAGE_VERTEX: {
                vs_num_simg++;
            }
            case SG_SHADERSTAGE_FRAGMENT: {
                fs_num_simg++;
            }
            case SG_SHADERSTAGE_COMPUTE: {
                cs_num_simg++;
            }
            default: {
            }
        }
    }
    for u64 i = 0; i < cast(u64, SG_MAX_TEXTURE_SAMPLER_PAIRS); i++ {
        switch desc.texture_sampler_pairs[i].stage {
            case SG_SHADERSTAGE_VERTEX: {
                vs_num_texsmp++;
            }
            case SG_SHADERSTAGE_FRAGMENT: {
                fs_num_texsmp++;
            }
            case SG_SHADERSTAGE_COMPUTE: {
                cs_num_texsmp++;
            }
            default: {
            }
        }
    }
    i32 max_tex = _sg.limits.max_texture_bindings_per_stage;
    i32 max_sbuf = _sg.limits.max_storage_buffer_bindings_per_stage;
    i32 max_simg = _sg.limits.max_storage_image_bindings_per_stage;
    bool retval = true;
    if vs_num_tex > max_tex {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_VERTEXSTAGE_TEXTURES, 1, null, __line__);
        retval = false;
    }
    if fs_num_tex > max_tex {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_FRAGMENTSTAGE_TEXTURES, 1, null, __line__);
        retval = false;
    }
    if cs_num_tex > max_tex {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_COMPUTESTAGE_TEXTURES, 1, null, __line__);
        retval = false;
    }
    if vs_num_sbuf > max_sbuf {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_VERTEXSTAGE_STORAGEBUFFERS, 1, null, __line__);
        retval = false;
    }
    if fs_num_sbuf > max_sbuf {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_FRAGMENTSTAGE_STORAGEBUFFERS, 1, null, __line__);
        retval = false;
    }
    if cs_num_sbuf > max_sbuf {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_COMPUTESTAGE_STORAGEBUFFERS, 1, null, __line__);
        retval = false;
    }
    if vs_num_simg > max_simg {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_VERTEXSTAGE_STORAGEIMAGES, 1, null, __line__);
        retval = false;
    }
    if fs_num_simg > max_simg {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_FRAGMENTSTAGE_STORAGEIMAGES, 1, null, __line__);
        retval = false;
    }
    if cs_num_simg > max_simg {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_COMPUTESTAGE_STORAGEIMAGES, 1, null, __line__);
        retval = false;
    }
    if vs_num_texsmp > max_tex {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_VERTEXSTAGE_TEXTURESAMPLERPAIRS, 1, null, __line__);
        retval = false;
    }
    if fs_num_texsmp > max_tex {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_FRAGMENTSTAGE_TEXTURESAMPLERPAIRS, 1, null, __line__);
        retval = false;
    }
    if cs_num_texsmp > max_tex {
        _sg_log(SG_LOGITEM_SHADERDESC_TOO_MANY_COMPUTESTAGE_TEXTURESAMPLERPAIRS, 1, null, __line__);
        retval = false;
    }
    return retval;
}

bool _sg_validate_pass_attachment_limits(sg_pass* pass) {
    assert(cast(i64, pass));
    i32 num_color_atts = 0;
    i32 num_resolve_atts = 0;
    for i32 att_index = 0; att_index < SG_MAX_COLOR_ATTACHMENTS; att_index++ {
        if pass.attachments.colors[att_index].id != cast(u32, SG_INVALID_ID) {
            num_color_atts += 1;
        }
        if pass.attachments.resolves[att_index].id != cast(u32, SG_INVALID_ID) {
            num_resolve_atts += 1;
        }
    }
    bool retval = true;
    i32 max_color_atts = _sg.limits.max_color_attachments;
    if num_color_atts > max_color_atts {
        _sg_log(SG_LOGITEM_BEGINPASS_TOO_MANY_COLOR_ATTACHMENTS, 1, null, __line__);
        retval = false;
    }
    if num_resolve_atts > max_color_atts {
        _sg_log(SG_LOGITEM_BEGINPASS_TOO_MANY_RESOLVE_ATTACHMENTS, 1, null, __line__);
        retval = false;
    }
    return retval;
}

sg_buffer_usage _sg_buffer_usage_defaults(sg_buffer_usage* usg) {
    sg_buffer_usage def = *usg;
    if (def.vertex_buffer || def.index_buffer || def.storage_buffer || def.staging_buffer || def.staging_index_buffer) == 0 {
        def.vertex_buffer = true;
    }
    return def;
}

sg_buffer_desc _sg_buffer_desc_defaults(sg_buffer_desc* desc) {
    sg_buffer_desc def = *desc;
    def.usage = _sg_buffer_usage_defaults(&def.usage);
    if def.size == 0 {
        def.size = def.data.size;
    }
    return def;
}

sg_image_usage _sg_image_usage_defaults(sg_image_usage* usg) {
    sg_image_usage def = *usg;
    if (def.immutable || def.write_transient || def.copy_dst) == 0 {
        def.immutable = true;
    }
    return def;
}

sg_image_desc _sg_image_desc_defaults(sg_image_desc* desc) {
    sg_image_desc def = *desc;
    def.type = def.type == 0 ? cast(i32, SG_IMAGETYPE_2D) : def.type;
    def.usage = _sg_image_usage_defaults(&def.usage);
    def.num_slices = def.num_slices == 0 ? def.type == cast(i32, SG_IMAGETYPE_CUBE) ? 6 : 1 : def.num_slices;
    def.num_mipmaps = def.num_mipmaps == 0 ? 1 : def.num_mipmaps;
    if def.usage.color_attachment || def.usage.resolve_attachment {
        def.pixel_format = def.pixel_format == 0 ? _sg.desc.environment.defaults.color_format : def.pixel_format;
        def.sample_count = def.sample_count == 0 ? _sg.desc.environment.defaults.sample_count : def.sample_count;
    } else if def.usage.depth_stencil_attachment != 0 {
        def.pixel_format = def.pixel_format == 0 ? _sg.desc.environment.defaults.depth_format : def.pixel_format;
        def.sample_count = def.sample_count == 0 ? _sg.desc.environment.defaults.sample_count : def.sample_count;
    } else {
        def.pixel_format = def.pixel_format == 0 ? cast(i32, SG_PIXELFORMAT_RGBA8) : def.pixel_format;
        def.sample_count = def.sample_count == 0 ? 1 : def.sample_count;
    }
    return def;
}

sg_sampler_desc _sg_sampler_desc_defaults(sg_sampler_desc* desc) {
    sg_sampler_desc def = *desc;
    def.min_filter = def.min_filter == 0 ? cast(i32, SG_FILTER_NEAREST) : def.min_filter;
    def.mag_filter = def.mag_filter == 0 ? cast(i32, SG_FILTER_NEAREST) : def.mag_filter;
    def.mipmap_filter = def.mipmap_filter == 0 ? cast(i32, SG_FILTER_NEAREST) : def.mipmap_filter;
    def.wrap_u = def.wrap_u == 0 ? cast(i32, SG_WRAP_REPEAT) : def.wrap_u;
    def.wrap_v = def.wrap_v == 0 ? cast(i32, SG_WRAP_REPEAT) : def.wrap_v;
    def.wrap_w = def.wrap_w == 0 ? cast(i32, SG_WRAP_REPEAT) : def.wrap_w;
    def.max_lod = def.max_lod == 0.0f ? FLT_MAX : def.max_lod;
    def.border_color = def.border_color == 0 ? cast(i32, SG_BORDERCOLOR_OPAQUE_BLACK) : def.border_color;
    def.compare = def.compare == 0 ? cast(i32, SG_COMPAREFUNC_NEVER) : def.compare;
    def.max_anisotropy = cast(u32, def.max_anisotropy == 0 ? 1 : def.max_anisotropy);
    return def;
}

sg_shader_desc _sg_shader_desc_defaults(sg_shader_desc* desc) {
    sg_shader_desc def = *desc;
    def.vertex_func.entry = def.vertex_func.entry == null ? "main" : def.vertex_func.entry;
    def.fragment_func.entry = def.fragment_func.entry == null ? "main" : def.fragment_func.entry;
    def.compute_func.entry = def.compute_func.entry == null ? "main" : def.compute_func.entry;
    def.mtl_threads_per_threadgroup.y = desc.mtl_threads_per_threadgroup.y == 0 ? 1 : desc.mtl_threads_per_threadgroup.y;
    def.mtl_threads_per_threadgroup.z = desc.mtl_threads_per_threadgroup.z == 0 ? 1 : desc.mtl_threads_per_threadgroup.z;
    for u64 ub_index = 0; ub_index < cast(u64, SG_MAX_UNIFORMBLOCK_BINDSLOTS); ub_index++ {
        sg_shader_uniform_block* ub_desc = &def.uniform_blocks[ub_index];
        if ub_desc.stage != SG_SHADERSTAGE_NONE {
            ub_desc.layout = ub_desc.layout == 0 ? cast(i32, SG_UNIFORMLAYOUT_NATIVE) : ub_desc.layout;
            for u64 u_index = 0; u_index < cast(u64, SG_MAX_UNIFORMBLOCK_MEMBERS); u_index++ {
                sg_glsl_shader_uniform* u_desc = &ub_desc.glsl_uniforms[u_index];
                if u_desc.type == SG_UNIFORMTYPE_INVALID {
                    break;
                }
                u_desc.array_count = cast(u16, u_desc.array_count == 0 ? 1 : u_desc.array_count);
            }
        }
    }
    for u64 view_index = 0; view_index < cast(u64, SG_MAX_VIEW_BINDSLOTS); view_index++ {
        sg_shader_view* view_desc = &def.views[view_index];
        if view_desc.texture.stage != SG_SHADERSTAGE_NONE {
            view_desc.texture.image_type = view_desc.texture.image_type == 0 ? cast(i32, SG_IMAGETYPE_2D) : view_desc.texture.image_type;
            view_desc.texture.sample_type = view_desc.texture.sample_type == 0 ? cast(i32, SG_IMAGESAMPLETYPE_FLOAT) : view_desc.texture.sample_type;
        } else if view_desc.storage_image.stage != SG_SHADERSTAGE_NONE {
            view_desc.storage_image.image_type = view_desc.storage_image.image_type == 0 ? cast(i32, SG_IMAGETYPE_2D) : view_desc.storage_image.image_type;
        }
    }
    for u64 smp_index = 0; smp_index < cast(u64, SG_MAX_SAMPLER_BINDSLOTS); smp_index++ {
        sg_shader_sampler* smp_desc = &def.samplers[smp_index];
        if smp_desc.stage != SG_SHADERSTAGE_NONE {
            smp_desc.sampler_type = smp_desc.sampler_type == 0 ? cast(i32, SG_SAMPLERTYPE_FILTERING) : smp_desc.sampler_type;
        }
    }
    return def;
}

sg_pipeline_desc _sg_pipeline_desc_defaults(sg_pipeline_desc* desc) {
    sg_pipeline_desc def = *desc;
    def.primitive_type = def.primitive_type == 0 ? cast(i32, SG_PRIMITIVETYPE_TRIANGLES) : def.primitive_type;
    def.index_type = def.index_type == 0 ? cast(i32, SG_INDEXTYPE_NONE) : def.index_type;
    def.cull_mode = def.cull_mode == 0 ? cast(i32, SG_CULLMODE_NONE) : def.cull_mode;
    def.face_winding = def.face_winding == 0 ? cast(i32, SG_FACEWINDING_CW) : def.face_winding;
    def.sample_count = def.sample_count == 0 ? _sg.desc.environment.defaults.sample_count : def.sample_count;
    def.stencil.front.compare = def.stencil.front.compare == 0 ? cast(i32, SG_COMPAREFUNC_ALWAYS) : def.stencil.front.compare;
    def.stencil.front.fail_op = def.stencil.front.fail_op == 0 ? cast(i32, SG_STENCILOP_KEEP) : def.stencil.front.fail_op;
    def.stencil.front.depth_fail_op = def.stencil.front.depth_fail_op == 0 ? cast(i32, SG_STENCILOP_KEEP) : def.stencil.front.depth_fail_op;
    def.stencil.front.pass_op = def.stencil.front.pass_op == 0 ? cast(i32, SG_STENCILOP_KEEP) : def.stencil.front.pass_op;
    def.stencil.back.compare = def.stencil.back.compare == 0 ? cast(i32, SG_COMPAREFUNC_ALWAYS) : def.stencil.back.compare;
    def.stencil.back.fail_op = def.stencil.back.fail_op == 0 ? cast(i32, SG_STENCILOP_KEEP) : def.stencil.back.fail_op;
    def.stencil.back.depth_fail_op = def.stencil.back.depth_fail_op == 0 ? cast(i32, SG_STENCILOP_KEEP) : def.stencil.back.depth_fail_op;
    def.stencil.back.pass_op = def.stencil.back.pass_op == 0 ? cast(i32, SG_STENCILOP_KEEP) : def.stencil.back.pass_op;
    def.depth.compare = def.depth.compare == 0 ? cast(i32, SG_COMPAREFUNC_ALWAYS) : def.depth.compare;
    def.depth.pixel_format = def.depth.pixel_format == 0 ? _sg.desc.environment.defaults.depth_format : def.depth.pixel_format;
    if def.colors[0].pixel_format == SG_PIXELFORMAT_NONE {
        def.color_count = 0;
    } else {
        def.color_count = def.color_count == 0 ? 1 : def.color_count;
    }
    if def.color_count > SG_MAX_COLOR_ATTACHMENTS {
        def.color_count = SG_MAX_COLOR_ATTACHMENTS;
    }
    for i32 i = 0; i < def.color_count; i++ {
        sg_color_target_state* cs = &def.colors[i];
        cs.pixel_format = cs.pixel_format == 0 ? _sg.desc.environment.defaults.color_format : cs.pixel_format;
        cs.write_mask = cs.write_mask == 0 ? cast(i32, SG_COLORMASK_RGBA) : cs.write_mask;
        sg_blend_state* bs = &def.colors[i].blend;
        bs.op_rgb = bs.op_rgb == 0 ? cast(i32, SG_BLENDOP_ADD) : bs.op_rgb;
        bs.src_factor_rgb = bs.src_factor_rgb == 0 ? cast(i32, SG_BLENDFACTOR_ONE) : bs.src_factor_rgb;
        if bs.op_rgb == SG_BLENDOP_MIN || bs.op_rgb == SG_BLENDOP_MAX {
            bs.dst_factor_rgb = bs.dst_factor_rgb == 0 ? cast(i32, SG_BLENDFACTOR_ONE) : bs.dst_factor_rgb;
        } else {
            bs.dst_factor_rgb = bs.dst_factor_rgb == 0 ? cast(i32, SG_BLENDFACTOR_ZERO) : bs.dst_factor_rgb;
        }
        bs.op_alpha = bs.op_alpha == 0 ? cast(i32, SG_BLENDOP_ADD) : bs.op_alpha;
        bs.src_factor_alpha = bs.src_factor_alpha == 0 ? cast(i32, SG_BLENDFACTOR_ONE) : bs.src_factor_alpha;
        if bs.op_alpha == SG_BLENDOP_MIN || bs.op_alpha == SG_BLENDOP_MAX {
            bs.dst_factor_alpha = bs.dst_factor_alpha == 0 ? cast(i32, SG_BLENDFACTOR_ONE) : bs.dst_factor_alpha;
        } else {
            bs.dst_factor_alpha = bs.dst_factor_alpha == 0 ? cast(i32, SG_BLENDFACTOR_ZERO) : bs.dst_factor_alpha;
        }
    }
    for i32 attr_index = 0; attr_index < SG_MAX_VERTEX_ATTRIBUTES; attr_index++ {
        sg_vertex_attr_state* a_state = &def.layout.attrs[attr_index];
        if a_state.format == SG_VERTEXFORMAT_INVALID {
            break;
        }
        assert(a_state.buffer_index >= 0 && a_state.buffer_index < SG_MAX_VERTEXBUFFER_BINDSLOTS);
        sg_vertex_buffer_layout_state* l_state = &def.layout.buffers[a_state.buffer_index];
        l_state.step_func = l_state.step_func == 0 ? cast(i32, SG_VERTEXSTEP_PER_VERTEX) : l_state.step_func;
        l_state.step_rate = l_state.step_rate == 0 ? 1 : l_state.step_rate;
    }
    i32[8] auto_offset;
    bool[8] use_auto_offset;
    for i32 buf_index = 0; buf_index < SG_MAX_VERTEXBUFFER_BINDSLOTS; buf_index++ {
        use_auto_offset[buf_index] = true;
    }
    for i32 attr_index = 0; attr_index < SG_MAX_VERTEX_ATTRIBUTES; attr_index++ {
        sg_vertex_attr_state* a_state = &def.layout.attrs[attr_index];
        if a_state.format == SG_VERTEXFORMAT_INVALID {
            break;
        }
        if a_state.offset != 0 {
            assert(a_state.buffer_index >= 0 && a_state.buffer_index < SG_MAX_VERTEXBUFFER_BINDSLOTS);
            use_auto_offset[a_state.buffer_index] = false;
        }
    }
    for i32 attr_index = 0; attr_index < SG_MAX_VERTEX_ATTRIBUTES; attr_index++ {
        sg_vertex_attr_state* a_state = &def.layout.attrs[attr_index];
        if a_state.format == SG_VERTEXFORMAT_INVALID {
            break;
        }
        assert(a_state.buffer_index >= 0 && a_state.buffer_index < SG_MAX_VERTEXBUFFER_BINDSLOTS);
        if use_auto_offset[a_state.buffer_index] != 0 {
            a_state.offset = auto_offset[a_state.buffer_index];
        }
        auto_offset[a_state.buffer_index] += _sg_vertexformat_bytesize(a_state.format);
    }
    for i32 buf_index = 0; buf_index < SG_MAX_VERTEXBUFFER_BINDSLOTS; buf_index++ {
        sg_vertex_buffer_layout_state* l_state = &def.layout.buffers[buf_index];
        if l_state.stride == 0 {
            l_state.stride = auto_offset[buf_index];
        }
    }
    return def;
}

sg_view_desc _sg_view_desc_defaults(sg_view_desc* desc) {
    sg_view_desc def = *desc;
    return def;
}

sg_buffer _sg_alloc_buffer() {
    sg_buffer res;
    i32 slot_index = _sg_pool_alloc_index(&_sg.pools.buffer_pool);
    if 0 != slot_index {
        res.id = _sg_slot_alloc(&_sg.pools.buffer_pool, &_sg.pools.buffers[slot_index].slot, slot_index);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.buffers.allocated++;
                _sg.stats.total.buffers.allocated++;
            }
        }
    } else {
        res.id = cast(u32, SG_INVALID_ID);
        _sg_log(SG_LOGITEM_BUFFER_POOL_EXHAUSTED, 1, null, __line__);
    }
    return res;
}

sg_image _sg_alloc_image() {
    sg_image res;
    i32 slot_index = _sg_pool_alloc_index(&_sg.pools.image_pool);
    if 0 != slot_index {
        res.id = _sg_slot_alloc(&_sg.pools.image_pool, &_sg.pools.images[slot_index].slot, slot_index);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.images.allocated++;
                _sg.stats.total.images.allocated++;
            }
        }
    } else {
        res.id = cast(u32, SG_INVALID_ID);
        _sg_log(SG_LOGITEM_IMAGE_POOL_EXHAUSTED, 1, null, __line__);
    }
    return res;
}

sg_sampler _sg_alloc_sampler() {
    sg_sampler res;
    i32 slot_index = _sg_pool_alloc_index(&_sg.pools.sampler_pool);
    if 0 != slot_index {
        res.id = _sg_slot_alloc(&_sg.pools.sampler_pool, &_sg.pools.samplers[slot_index].slot, slot_index);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.samplers.allocated++;
                _sg.stats.total.samplers.allocated++;
            }
        }
    } else {
        res.id = cast(u32, SG_INVALID_ID);
        _sg_log(SG_LOGITEM_SAMPLER_POOL_EXHAUSTED, 1, null, __line__);
    }
    return res;
}

sg_shader _sg_alloc_shader() {
    sg_shader res;
    i32 slot_index = _sg_pool_alloc_index(&_sg.pools.shader_pool);
    if 0 != slot_index {
        res.id = _sg_slot_alloc(&_sg.pools.shader_pool, &_sg.pools.shaders[slot_index].slot, slot_index);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.shaders.allocated++;
                _sg.stats.total.shaders.allocated++;
            }
        }
    } else {
        res.id = cast(u32, SG_INVALID_ID);
        _sg_log(SG_LOGITEM_SHADER_POOL_EXHAUSTED, 1, null, __line__);
    }
    return res;
}

sg_pipeline _sg_alloc_pipeline() {
    sg_pipeline res;
    i32 slot_index = _sg_pool_alloc_index(&_sg.pools.pipeline_pool);
    if 0 != slot_index {
        res.id = _sg_slot_alloc(&_sg.pools.pipeline_pool, &_sg.pools.pipelines[slot_index].slot, slot_index);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.pipelines.allocated++;
                _sg.stats.total.pipelines.allocated++;
            }
        }
    } else {
        res.id = cast(u32, SG_INVALID_ID);
        _sg_log(SG_LOGITEM_PIPELINE_POOL_EXHAUSTED, 1, null, __line__);
    }
    return res;
}

sg_view _sg_alloc_view() {
    sg_view res;
    i32 slot_index = _sg_pool_alloc_index(&_sg.pools.view_pool);
    if 0 != slot_index {
        res.id = _sg_slot_alloc(&_sg.pools.view_pool, &_sg.pools.views[slot_index].slot, slot_index);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.views.allocated++;
                _sg.stats.total.views.allocated++;
            }
        }
    } else {
        res.id = cast(u32, SG_INVALID_ID);
        _sg_log(SG_LOGITEM_VIEW_POOL_EXHAUSTED, 1, null, __line__);
    }
    return res;
}

void _sg_dealloc_buffer(_sg_buffer_t* buf) {
    assert(buf != null && buf.slot.state == SG_RESOURCESTATE_ALLOC && buf.slot.id != cast(u32, SG_INVALID_ID));
    _sg_pool_free_index(&_sg.pools.buffer_pool, _sg_slot_index(buf.slot.id));
    _sg_slot_reset(&buf.slot);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.buffers.deallocated++;
            _sg.stats.total.buffers.deallocated++;
        }
    }
}

void _sg_dealloc_image(_sg_image_t* img) {
    assert(img != null && img.slot.state == SG_RESOURCESTATE_ALLOC && img.slot.id != cast(u32, SG_INVALID_ID));
    _sg_pool_free_index(&_sg.pools.image_pool, _sg_slot_index(img.slot.id));
    _sg_slot_reset(&img.slot);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.images.deallocated++;
            _sg.stats.total.images.deallocated++;
        }
    }
}

void _sg_dealloc_sampler(_sg_sampler_t* smp) {
    assert(smp != null && smp.slot.state == SG_RESOURCESTATE_ALLOC && smp.slot.id != cast(u32, SG_INVALID_ID));
    _sg_pool_free_index(&_sg.pools.sampler_pool, _sg_slot_index(smp.slot.id));
    _sg_slot_reset(&smp.slot);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.samplers.deallocated++;
            _sg.stats.total.samplers.deallocated++;
        }
    }
}

void _sg_dealloc_shader(_sg_shader_t* shd) {
    assert(shd != null && shd.slot.state == SG_RESOURCESTATE_ALLOC && shd.slot.id != cast(u32, SG_INVALID_ID));
    _sg_pool_free_index(&_sg.pools.shader_pool, _sg_slot_index(shd.slot.id));
    _sg_slot_reset(&shd.slot);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.shaders.deallocated++;
            _sg.stats.total.shaders.deallocated++;
        }
    }
}

void _sg_dealloc_pipeline(_sg_pipeline_t* pip) {
    assert(pip != null && pip.slot.state == SG_RESOURCESTATE_ALLOC && pip.slot.id != cast(u32, SG_INVALID_ID));
    _sg_pool_free_index(&_sg.pools.pipeline_pool, _sg_slot_index(pip.slot.id));
    _sg_slot_reset(&pip.slot);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.pipelines.deallocated++;
            _sg.stats.total.pipelines.deallocated++;
        }
    }
}

void _sg_dealloc_view(_sg_view_t* view) {
    assert(view != null && view.slot.state == SG_RESOURCESTATE_ALLOC && view.slot.id != cast(u32, SG_INVALID_ID));
    _sg_pool_free_index(&_sg.pools.view_pool, _sg_slot_index(view.slot.id));
    _sg_slot_reset(&view.slot);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.views.deallocated++;
            _sg.stats.total.views.deallocated++;
        }
    }
}

void _sg_init_buffer(_sg_buffer_t* buf, sg_buffer_desc* desc) {
    assert(buf != null && buf.slot.state == SG_RESOURCESTATE_ALLOC);
    assert(cast(i64, desc));
    if _sg_validate_buffer_desc(desc) != 0 {
        _sg_buffer_common_init(&buf.cmn, desc);
        sg_resource_state res_state = _sg_create_buffer(buf, desc);
        if desc.usage.write_unsealed && res_state == SG_RESOURCESTATE_VALID {
            res_state = SG_RESOURCESTATE_UNSEALED;
        }
        buf.slot.state = res_state;
    } else {
        buf.slot.state = SG_RESOURCESTATE_FAILED;
    }
    assert(cast(i64, _sg_resource_state_valid_failed_unsealed(buf.slot.state)));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.buffers.inited++;
            _sg.stats.total.buffers.inited++;
        }
    }
}

void _sg_init_image(_sg_image_t* img, sg_image_desc* desc) {
    assert(img != null && img.slot.state == SG_RESOURCESTATE_ALLOC);
    assert(cast(i64, desc));
    if _sg_validate_image_desc(desc) != 0 {
        _sg_image_common_init(&img.cmn, desc);
        sg_resource_state res_state = _sg_create_image(img, desc);
        if desc.usage.write_unsealed && res_state == SG_RESOURCESTATE_VALID {
            res_state = SG_RESOURCESTATE_UNSEALED;
        }
        img.slot.state = res_state;
    } else {
        img.slot.state = SG_RESOURCESTATE_FAILED;
    }
    assert(cast(i64, _sg_resource_state_valid_failed_unsealed(img.slot.state)));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.images.inited++;
            _sg.stats.total.images.inited++;
        }
    }
}

void _sg_init_sampler(_sg_sampler_t* smp, sg_sampler_desc* desc) {
    assert(smp != null && smp.slot.state == SG_RESOURCESTATE_ALLOC);
    assert(cast(i64, desc));
    if _sg_validate_sampler_desc(desc) != 0 {
        _sg_sampler_common_init(&smp.cmn, desc);
        smp.slot.state = _sg_create_sampler(smp, desc);
    } else {
        smp.slot.state = SG_RESOURCESTATE_FAILED;
    }
    assert(cast(i64, _sg_resource_state_valid_failed(smp.slot.state)));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.samplers.inited++;
            _sg.stats.total.samplers.inited++;
        }
    }
}

void _sg_init_shader(_sg_shader_t* shd, sg_shader_desc* desc) {
    assert(shd != null && shd.slot.state == SG_RESOURCESTATE_ALLOC);
    assert(cast(i64, desc));
    if _sg_validate_shader_desc(desc) == 0 {
        shd.slot.state = SG_RESOURCESTATE_FAILED;
        return;
    }
    if _sg_validate_shader_binding_limits(desc) == 0 {
        shd.slot.state = SG_RESOURCESTATE_FAILED;
        return;
    }
    _sg_shader_common_init(&shd.cmn, desc);
    shd.slot.state = _sg_create_shader(shd, desc);
    assert(cast(i64, _sg_resource_state_valid_failed(shd.slot.state)));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.shaders.inited++;
            _sg.stats.total.shaders.inited++;
        }
    }
}

void _sg_init_pipeline(_sg_pipeline_t* pip, sg_pipeline_desc* desc) {
    assert(pip != null && pip.slot.state == SG_RESOURCESTATE_ALLOC);
    assert(cast(i64, desc));
    if _sg_validate_pipeline_desc(desc) != 0 {
        _sg_shader_t* shd = _sg_lookup_shader(desc.shader.id);
        if shd != null && shd.slot.state == SG_RESOURCESTATE_VALID {
            _sg_pipeline_common_init(&pip.cmn, desc, shd);
            pip.slot.state = _sg_create_pipeline(pip, desc);
        } else {
            pip.slot.state = SG_RESOURCESTATE_FAILED;
        }
    } else {
        pip.slot.state = SG_RESOURCESTATE_FAILED;
    }
    assert(cast(i64, _sg_resource_state_valid_failed(pip.slot.state)));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.pipelines.inited++;
            _sg.stats.total.pipelines.inited++;
        }
    }
}

void _sg_init_view(_sg_view_t* view, sg_view_desc* desc) {
    assert(view != null && view.slot.state == SG_RESOURCESTATE_ALLOC);
    assert(cast(i64, desc));
    if _sg_validate_view_desc(desc) != 0 {
        u32 buf_id = desc.storage_buffer.buffer.id;
        u32 img_id = desc.texture.image.id;
        img_id = img_id != 0 ? img_id : desc.storage_image.image.id;
        img_id = img_id != 0 ? img_id : desc.color_attachment.image.id;
        img_id = img_id != 0 ? img_id : desc.resolve_attachment.image.id;
        img_id = img_id != 0 ? img_id : desc.depth_stencil_attachment.image.id;
        _sg_buffer_t* buf = buf_id != 0 ? _sg_lookup_buffer(buf_id) : null;
        _sg_image_t* img = img_id != 0 ? _sg_lookup_image(img_id) : null;
        sg_resource_state res_state = SG_RESOURCESTATE_INVALID;
        if buf != null {
            assert(cast(i64, img == null));
            res_state = buf.slot.state;
        } else if img != null {
            assert(cast(i64, buf == null));
            res_state = img.slot.state;
        }
        if _sg_resource_state_valid_unsealed(res_state) != 0 {
            _sg_view_common_init(&view.cmn, desc, buf, img);
            view.slot.state = _sg_create_view(view, desc);
        } else {
            view.slot.state = SG_RESOURCESTATE_FAILED;
        }
    } else {
        view.slot.state = SG_RESOURCESTATE_FAILED;
    }
    assert(cast(i64, _sg_resource_state_valid_failed(view.slot.state)));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.views.inited++;
            _sg.stats.total.views.inited++;
        }
    }
}

void _sg_uninit_buffer(_sg_buffer_t* buf) {
    assert(buf != null && _sg_resource_state_valid_failed_unsealed(buf.slot.state));
    _sg_discard_buffer(buf);
    _sg_reset_buffer_to_alloc_state(buf);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.buffers.uninited++;
            _sg.stats.total.buffers.uninited++;
        }
    }
}

void _sg_uninit_image(_sg_image_t* img) {
    assert(img != null && _sg_resource_state_valid_failed_unsealed(img.slot.state));
    _sg_discard_image(img);
    _sg_reset_image_to_alloc_state(img);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.images.uninited++;
            _sg.stats.total.images.uninited++;
        }
    }
}

void _sg_uninit_sampler(_sg_sampler_t* smp) {
    assert(smp != null && _sg_resource_state_valid_failed(smp.slot.state));
    _sg_discard_sampler(smp);
    _sg_reset_sampler_to_alloc_state(smp);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.samplers.uninited++;
            _sg.stats.total.samplers.uninited++;
        }
    }
}

void _sg_uninit_shader(_sg_shader_t* shd) {
    assert(shd != null && _sg_resource_state_valid_failed(shd.slot.state));
    _sg_discard_shader(shd);
    _sg_reset_shader_to_alloc_state(shd);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.shaders.uninited++;
            _sg.stats.total.shaders.uninited++;
        }
    }
}

void _sg_uninit_pipeline(_sg_pipeline_t* pip) {
    assert(pip != null && _sg_resource_state_valid_failed(pip.slot.state));
    _sg_discard_pipeline(pip);
    _sg_reset_pipeline_to_alloc_state(pip);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.pipelines.uninited++;
            _sg.stats.total.pipelines.uninited++;
        }
    }
}

void _sg_uninit_view(_sg_view_t* view) {
    assert(view != null && _sg_resource_state_valid_failed(view.slot.state));
    _sg_discard_view(view);
    _sg_reset_view_to_alloc_state(view);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.views.uninited++;
            _sg.stats.total.views.uninited++;
        }
    }
}

void _sg_setup_commit_listeners(sg_desc* desc) {
    assert(desc.max_commit_listeners > 0);
    assert(null == _sg.commit_listeners.items);
    assert(0 == _sg.commit_listeners.num);
    assert(0 == _sg.commit_listeners.upper);
    _sg.commit_listeners.num = desc.max_commit_listeners;
    u64 size = cast(u64, _sg.commit_listeners.num) * cast(u64, sizeof(sg_commit_listener));
    _sg.commit_listeners.items = cast(sg_commit_listener*, _sg_malloc_clear(size));
}

void _sg_discard_commit_listeners() {
    assert(null != _sg.commit_listeners.items);
    _sg_free(_sg.commit_listeners.items);
    _sg.commit_listeners.items = null;
}

void _sg_notify_commit_listeners() {
    assert(cast(i64, _sg.commit_listeners.items));
    for i32 i = 0; i < _sg.commit_listeners.upper; i++ {
        sg_commit_listener* listener = &_sg.commit_listeners.items[i];
        if listener.func != null {
            listener.func(listener.user_data);
        }
    }
}

bool _sg_add_commit_listener(sg_commit_listener* new_listener) {
    assert(new_listener != null && new_listener.func != null);
    assert(cast(i64, _sg.commit_listeners.items));
    for i32 i = 0; i < _sg.commit_listeners.upper; i++ {
        sg_commit_listener* slot = &_sg.commit_listeners.items[i];
        if slot.func == new_listener.func && slot.user_data == new_listener.user_data {
            _sg_log(SG_LOGITEM_IDENTICAL_COMMIT_LISTENER, 1, null, __line__);
            return false;
        }
    }
    sg_commit_listener* slot = null;
    for i32 i = 0; i < _sg.commit_listeners.upper; i++ {
        if _sg.commit_listeners.items[i].func == null {
            slot = &_sg.commit_listeners.items[i];
            break;
        }
    }
    if slot == null {
        if _sg.commit_listeners.upper < _sg.commit_listeners.num {
            slot = &_sg.commit_listeners.items[_sg.commit_listeners.upper++];
        }
    }
    if slot == null {
        _sg_log(SG_LOGITEM_COMMIT_LISTENER_ARRAY_FULL, 1, null, __line__);
        return false;
    }
    *slot = *new_listener;
    return true;
}

bool _sg_remove_commit_listener(sg_commit_listener* listener) {
    assert(listener != null && listener.func != null);
    assert(cast(i64, _sg.commit_listeners.items));
    for i32 i = 0; i < _sg.commit_listeners.upper; i++ {
        sg_commit_listener* slot = &_sg.commit_listeners.items[i];
        if slot.func == listener.func && slot.user_data == listener.user_data {
            slot.func = null;
            slot.user_data = null;
            return true;
        }
    }
    return false;
}

sg_desc _sg_desc_defaults(sg_desc* desc) {
    sg_desc res = *desc;
    res.environment.defaults.color_format = res.environment.defaults.color_format == 0 ? cast(i32, SG_PIXELFORMAT_RGBA8) : res.environment.defaults.color_format;
    res.environment.defaults.depth_format = res.environment.defaults.depth_format == 0 ? cast(i32, SG_PIXELFORMAT_DEPTH_STENCIL) : res.environment.defaults.depth_format;
    res.environment.defaults.sample_count = res.environment.defaults.sample_count == 0 ? 1 : res.environment.defaults.sample_count;
    res.buffer_pool_size = res.buffer_pool_size == 0 ? cast(i32, _SG_DEFAULT_BUFFER_POOL_SIZE) : res.buffer_pool_size;
    res.image_pool_size = res.image_pool_size == 0 ? cast(i32, _SG_DEFAULT_IMAGE_POOL_SIZE) : res.image_pool_size;
    res.sampler_pool_size = res.sampler_pool_size == 0 ? cast(i32, _SG_DEFAULT_SAMPLER_POOL_SIZE) : res.sampler_pool_size;
    res.shader_pool_size = res.shader_pool_size == 0 ? cast(i32, _SG_DEFAULT_SHADER_POOL_SIZE) : res.shader_pool_size;
    res.pipeline_pool_size = res.pipeline_pool_size == 0 ? cast(i32, _SG_DEFAULT_PIPELINE_POOL_SIZE) : res.pipeline_pool_size;
    res.view_pool_size = res.view_pool_size == 0 ? cast(i32, _SG_DEFAULT_VIEW_POOL_SIZE) : res.view_pool_size;
    res.uniform_buffer_size = res.uniform_buffer_size == 0 ? cast(i32, _SG_DEFAULT_UB_SIZE) : res.uniform_buffer_size;
    res.max_commit_listeners = res.max_commit_listeners == 0 ? cast(i32, _SG_DEFAULT_MAX_COMMIT_LISTENERS) : res.max_commit_listeners;
    res.wgpu.bindgroups_cache_size = res.wgpu.bindgroups_cache_size == 0 ? cast(i32, _SG_DEFAULT_WGPU_BINDGROUP_CACHE_SIZE) : res.wgpu.bindgroups_cache_size;
    res.vulkan.copy_staging_buffer_size = res.vulkan.copy_staging_buffer_size == 0 ? cast(i32, _SG_DEFAULT_VK_COPY_STAGING_SIZE) : res.vulkan.copy_staging_buffer_size;
    res.vulkan.transient_staging_buffer_size = res.vulkan.transient_staging_buffer_size == 0 ? cast(i32, _SG_DEFAULT_VK_TRANSIENT_STAGING_SIZE) : res.vulkan.transient_staging_buffer_size;
    res.vulkan.descriptor_buffer_size = res.vulkan.descriptor_buffer_size == 0 ? cast(i32, _SG_DEFAULT_VK_DESCRIPTOR_BUFFER_SIZE) : res.vulkan.descriptor_buffer_size;
    return res;
}

sg_pass _sg_pass_defaults(sg_pass* pass) {
    sg_pass res = *pass;
    if !res.compute {
        if !pass.swapchain.invalid && _sg_attachments_empty(&pass.attachments) {
            res.swapchain.sample_count = res.swapchain.sample_count == 0 ? _sg.desc.environment.defaults.sample_count : res.swapchain.sample_count;
            res.swapchain.color_format = res.swapchain.color_format == 0 ? _sg.desc.environment.defaults.color_format : res.swapchain.color_format;
            res.swapchain.depth_format = res.swapchain.depth_format == 0 ? _sg.desc.environment.defaults.depth_format : res.swapchain.depth_format;
        }
        res.action = _sg_pass_action_defaults(&res.action);
    }
    return res;
}

sg_write_buffer_desc _sg_write_buffer_desc_defaults(sg_write_buffer_desc* desc) {
    sg_write_buffer_desc res = *desc;
    if desc.src.offset < desc.src.data.size {
        res.size = res.size == 0 ? desc.src.data.size - desc.src.offset : res.size;
    }
    return res;
}

sg_write_image_desc _sg_write_image_desc_defaults(_sg_image_t* img, sg_write_image_desc* desc) {
    sg_write_image_desc res = *desc;
    sg_pixel_format fmt = img.cmn.pixel_format;
    i32 mip_width = _sg_miplevel_dim(img.cmn.width, desc.dst.mip_level);
    i32 mip_height = _sg_miplevel_dim(img.cmn.height, desc.dst.mip_level);
    i32 mip_depth_or_slices = cast(i32, SG_IMAGETYPE_3D) == img.cmn.type ? _sg_miplevel_dim(img.cmn.num_slices, desc.dst.mip_level) : img.cmn.num_slices;
    res.src.bytes_per_row = res.src.bytes_per_row == 0 ? _sg_row_pitch(fmt, mip_width, 1) : res.src.bytes_per_row;
    res.src.bytes_per_slice = res.src.bytes_per_slice == 0 ? _sg_surface_pitch(fmt, mip_width, mip_height, 1) : res.src.bytes_per_slice;
    res.size.width = res.size.width == 0 ? mip_width - desc.dst.x : res.size.width;
    res.size.height = res.size.height == 0 ? mip_height - desc.dst.y : res.size.height;
    res.size.num_slices = res.size.num_slices == 0 ? mip_depth_or_slices - desc.dst.slice : res.size.num_slices;
    return res;
}

sg_copy_buffer_to_image_desc _sg_copy_buffer_to_image_desc_defaults(_sg_image_t* dst_img, sg_copy_buffer_to_image_desc* desc) {
    sg_copy_buffer_to_image_desc res = *desc;
    sg_pixel_format fmt = dst_img.cmn.pixel_format;
    i32 mip_width = _sg_miplevel_dim(dst_img.cmn.width, desc.dst.mip_level);
    i32 mip_height = _sg_miplevel_dim(dst_img.cmn.height, desc.dst.mip_level);
    i32 mip_depth_or_slices = cast(i32, SG_IMAGETYPE_3D) == dst_img.cmn.type ? _sg_miplevel_dim(dst_img.cmn.num_slices, desc.dst.mip_level) : dst_img.cmn.num_slices;
    res.src.bytes_per_row = res.src.bytes_per_row == 0 ? _sg_row_pitch(fmt, mip_width, 1) : res.src.bytes_per_row;
    res.src.bytes_per_slice = res.src.bytes_per_slice == 0 ? _sg_surface_pitch(fmt, mip_width, mip_height, 1) : res.src.bytes_per_slice;
    res.size.width = res.size.width == 0 ? mip_width - desc.dst.x : res.size.width;
    res.size.height = res.size.height == 0 ? mip_height - desc.dst.y : res.size.height;
    res.size.num_slices = res.size.num_slices == 0 ? mip_depth_or_slices - desc.dst.slice : res.size.num_slices;
    return res;
}

void _sg_discard_all_resources() {
    for i32 i = 1; i < _sg.pools.buffer_pool.size; i++ {
        sg_resource_state state = _sg.pools.buffers[i].slot.state;
        if _sg_resource_state_valid_failed_unsealed(state) != 0 {
            _sg_discard_buffer(&_sg.pools.buffers[i]);
        }
    }
    for i32 i = 1; i < _sg.pools.image_pool.size; i++ {
        sg_resource_state state = _sg.pools.images[i].slot.state;
        if _sg_resource_state_valid_failed_unsealed(state) != 0 {
            _sg_discard_image(&_sg.pools.images[i]);
        }
    }
    for i32 i = 1; i < _sg.pools.sampler_pool.size; i++ {
        sg_resource_state state = _sg.pools.samplers[i].slot.state;
        if _sg_resource_state_valid_failed(state) != 0 {
            _sg_discard_sampler(&_sg.pools.samplers[i]);
        }
    }
    for i32 i = 1; i < _sg.pools.shader_pool.size; i++ {
        sg_resource_state state = _sg.pools.shaders[i].slot.state;
        if _sg_resource_state_valid_failed(state) != 0 {
            _sg_discard_shader(&_sg.pools.shaders[i]);
        }
    }
    for i32 i = 1; i < _sg.pools.pipeline_pool.size; i++ {
        sg_resource_state state = _sg.pools.pipelines[i].slot.state;
        if _sg_resource_state_valid_failed(state) != 0 {
            _sg_discard_pipeline(&_sg.pools.pipelines[i]);
        }
    }
    for i32 i = 1; i < _sg.pools.view_pool.size; i++ {
        sg_resource_state state = _sg.pools.views[i].slot.state;
        if _sg_resource_state_valid_failed(state) != 0 {
            _sg_discard_view(&_sg.pools.views[i]);
        }
    }
}

void _sg_override_portable_limits() {
    if _sg.desc.enforce_portable_limits != 0 {
        _sg.limits.max_color_attachments = SG_MAX_PORTABLE_COLOR_ATTACHMENTS;
        _sg.limits.max_texture_bindings_per_stage = SG_MAX_PORTABLE_TEXTURE_BINDINGS_PER_STAGE;
        if _sg.features.compute {
            _sg.limits.max_storage_buffer_bindings_per_stage = SG_MAX_PORTABLE_STORAGEBUFFER_BINDINGS_PER_STAGE;
            _sg.limits.max_storage_image_bindings_per_stage = SG_MAX_PORTABLE_STORAGEIMAGE_BINDINGS_PER_STAGE;
        }
    }
}
}

// ██████  ██    ██ ██████  ██      ██  ██████
// ██   ██ ██    ██ ██   ██ ██      ██ ██
// ██████  ██    ██ ██████  ██      ██ ██
// ██      ██    ██ ██   ██ ██      ██ ██
// ██       ██████  ██████  ███████ ██  ██████
//
// >>public
void sg_setup(sg_desc* desc) {
    assert(cast(i64, !_sg.valid));
    assert(cast(i64, desc));
    assert(desc._start_canary == 0 && desc._end_canary == 0);
    assert(desc.allocator.alloc_fn != null && desc.allocator.free_fn != null || desc.allocator.alloc_fn == null && desc.allocator.free_fn == null);
    {
        _sg_clear(&_sg, cast(u64, sizeof(_sg)));
    }
    _sg.desc = _sg_desc_defaults(desc);
    _sg_setup_pools(&_sg.pools, &_sg.desc);
    _sg_setup_commit_listeners(&_sg.desc);
    _sg.frame_index = 1;
    _sg.stats_enabled = true;
    _sg_setup_backend(&_sg.desc);
    _sg_override_portable_limits();
    _sg.valid = true;
}

void sg_shutdown() {
    assert(cast(i64, _sg.valid));
    _sg_discard_all_resources();
    _sg_discard_backend();
    _sg_discard_commit_listeners();
    _sg_discard_pools(&_sg.pools);
    {
        _sg_clear(&_sg, cast(u64, sizeof(_sg)));
    }
}

bool sg_isvalid() {
    return _sg.valid;
}

sg_desc sg_query_desc() {
    assert(cast(i64, _sg.valid));
    return _sg.desc;
}

sg_backend sg_query_backend() {
    assert(cast(i64, _sg.valid));
    return _sg.backend;
}

sg_features sg_query_features() {
    assert(cast(i64, _sg.valid));
    return _sg.features;
}

sg_limits sg_query_limits() {
    assert(cast(i64, _sg.valid));
    return _sg.limits;
}

sg_pixelformat_info sg_query_pixelformat(sg_pixel_format fmt) {
    assert(cast(i64, _sg.valid));
    var fmt_index = cast(i32, fmt);
    assert(fmt_index > SG_PIXELFORMAT_NONE && fmt_index < _SG_PIXELFORMAT_NUM);
    _sg_pixelformat_info_t* src = &_sg.formats[fmt_index];
    sg_pixelformat_info res;
    res.sample = src.sample;
    res.filter = src.filter;
    res.render = src.render;
    res.blend = src.blend;
    res.msaa = src.msaa;
    res.depth = src.depth;
    res.compressed = _sg_is_compressed_pixel_format(fmt);
    res.read = src.read;
    res.write = src.write;
    if res.compressed == 0 {
        res.bytes_per_pixel = _sg_pixelformat_bytesize(fmt);
    }
    return res;
}

i32 sg_query_row_pitch(sg_pixel_format fmt, i32 width, i32 row_align_bytes) {
    assert(cast(i64, _sg.valid));
    assert(width > 0);
    assert(row_align_bytes > 0 && (row_align_bytes & row_align_bytes - 1) == 0);
    assert(cast(i32, fmt) > SG_PIXELFORMAT_NONE && cast(i32, fmt) < _SG_PIXELFORMAT_NUM);
    return _sg_row_pitch(fmt, width, row_align_bytes);
}

i32 sg_query_surface_pitch(sg_pixel_format fmt, i32 width, i32 height, i32 row_align_bytes) {
    assert(cast(i64, _sg.valid));
    assert(width > 0 && height > 0);
    assert(row_align_bytes > 0 && (row_align_bytes & row_align_bytes - 1) == 0);
    assert(cast(i32, fmt) > SG_PIXELFORMAT_NONE && cast(i32, fmt) < _SG_PIXELFORMAT_NUM);
    return _sg_surface_pitch(fmt, width, height, row_align_bytes);
}

sg_pass_state sg_query_pass_state() {
    assert(cast(i64, _sg.valid));
    if _sg.cur_pass.in_pass == 0 {
        return SG_PASSSTATE_NONE;
    } else if _sg.cur_pass.is_compute {
        return SG_PASSSTATE_COMPUTE;
    } else {
        return SG_PASSSTATE_RENDER;
    }
}

sg_stats sg_query_stats() {
    assert(cast(i64, _sg.valid));
    _sg_update_alive_free_resource_stats(&_sg.stats.total.buffers, &_sg.pools.buffer_pool);
    _sg_update_alive_free_resource_stats(&_sg.stats.total.images, &_sg.pools.image_pool);
    _sg_update_alive_free_resource_stats(&_sg.stats.total.views, &_sg.pools.view_pool);
    _sg_update_alive_free_resource_stats(&_sg.stats.total.samplers, &_sg.pools.sampler_pool);
    _sg_update_alive_free_resource_stats(&_sg.stats.total.shaders, &_sg.pools.shader_pool);
    _sg_update_alive_free_resource_stats(&_sg.stats.total.pipelines, &_sg.pools.pipeline_pool);
    return _sg.stats;
}

sg_trace_hooks sg_install_trace_hooks(sg_trace_hooks* trace_hooks) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, trace_hooks));
    ignore trace_hooks;
    sg_trace_hooks old_hooks = _sg.hooks;
    _sg.hooks = *trace_hooks;
    when !defined(SOKOL_TRACE_HOOKS) {
        _sg_log(SG_LOGITEM_TRACE_HOOKS_NOT_ENABLED, 2, null, 0);
    }
    return old_hooks;
}

sg_buffer sg_alloc_buffer() {
    assert(cast(i64, _sg.valid));
    sg_buffer res = _sg_alloc_buffer();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.alloc_buffer != null {
            _sg.hooks.alloc_buffer(res, _sg.hooks.user_data);
        }
    }
    return res;
}

sg_image sg_alloc_image() {
    assert(cast(i64, _sg.valid));
    sg_image res = _sg_alloc_image();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.alloc_image != null {
            _sg.hooks.alloc_image(res, _sg.hooks.user_data);
        }
    }
    return res;
}

sg_sampler sg_alloc_sampler() {
    assert(cast(i64, _sg.valid));
    sg_sampler res = _sg_alloc_sampler();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.alloc_sampler != null {
            _sg.hooks.alloc_sampler(res, _sg.hooks.user_data);
        }
    }
    return res;
}

sg_shader sg_alloc_shader() {
    assert(cast(i64, _sg.valid));
    sg_shader res = _sg_alloc_shader();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.alloc_shader != null {
            _sg.hooks.alloc_shader(res, _sg.hooks.user_data);
        }
    }
    return res;
}

sg_pipeline sg_alloc_pipeline() {
    assert(cast(i64, _sg.valid));
    sg_pipeline res = _sg_alloc_pipeline();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.alloc_pipeline != null {
            _sg.hooks.alloc_pipeline(res, _sg.hooks.user_data);
        }
    }
    return res;
}

sg_view sg_alloc_view() {
    assert(cast(i64, _sg.valid));
    sg_view res = _sg_alloc_view();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.alloc_view != null {
            _sg.hooks.alloc_view(res, _sg.hooks.user_data);
        }
    }
    return res;
}

void sg_dealloc_buffer(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        if buf.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_buffer(buf);
        } else {
            _sg_log(SG_LOGITEM_DEALLOC_BUFFER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.dealloc_buffer != null {
            _sg.hooks.dealloc_buffer(buf_id, _sg.hooks.user_data);
        }
    }
}

void sg_dealloc_image(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        if img.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_image(img);
        } else {
            _sg_log(SG_LOGITEM_DEALLOC_IMAGE_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.dealloc_image != null {
            _sg.hooks.dealloc_image(img_id, _sg.hooks.user_data);
        }
    }
}

void sg_dealloc_sampler(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    if smp != null {
        if smp.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_sampler(smp);
        } else {
            _sg_log(SG_LOGITEM_DEALLOC_SAMPLER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.dealloc_sampler != null {
            _sg.hooks.dealloc_sampler(smp_id, _sg.hooks.user_data);
        }
    }
}

void sg_dealloc_shader(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    if shd != null {
        if shd.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_shader(shd);
        } else {
            _sg_log(SG_LOGITEM_DEALLOC_SHADER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.dealloc_shader != null {
            _sg.hooks.dealloc_shader(shd_id, _sg.hooks.user_data);
        }
    }
}

void sg_dealloc_pipeline(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    if pip != null {
        if pip.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_pipeline(pip);
        } else {
            _sg_log(SG_LOGITEM_DEALLOC_PIPELINE_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.dealloc_pipeline != null {
            _sg.hooks.dealloc_pipeline(pip_id, _sg.hooks.user_data);
        }
    }
}

void sg_dealloc_view(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        if view.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_view(view);
        } else {
            _sg_log(SG_LOGITEM_DEALLOC_VIEW_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.dealloc_view != null {
            _sg.hooks.dealloc_view(view_id, _sg.hooks.user_data);
        }
    }
}

void sg_init_buffer(sg_buffer buf_id, sg_buffer_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_buffer_desc desc_def = _sg_buffer_desc_defaults(desc);
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        if buf.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_init_buffer(buf, &desc_def);
            assert(cast(i64, _sg_resource_state_valid_failed_unsealed(buf.slot.state)));
        } else {
            _sg_log(SG_LOGITEM_INIT_BUFFER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.init_buffer != null {
            _sg.hooks.init_buffer(buf_id, &desc_def, _sg.hooks.user_data);
        }
    }
}

void sg_init_image(sg_image img_id, sg_image_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_image_desc desc_def = _sg_image_desc_defaults(desc);
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        if img.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_init_image(img, &desc_def);
            assert(cast(i64, _sg_resource_state_valid_failed_unsealed(img.slot.state)));
        } else {
            _sg_log(SG_LOGITEM_INIT_IMAGE_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.init_image != null {
            _sg.hooks.init_image(img_id, &desc_def, _sg.hooks.user_data);
        }
    }
}

void sg_init_sampler(sg_sampler smp_id, sg_sampler_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_sampler_desc desc_def = _sg_sampler_desc_defaults(desc);
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    if smp != null {
        if smp.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_init_sampler(smp, &desc_def);
            assert(cast(i64, _sg_resource_state_valid_failed(smp.slot.state)));
        } else {
            _sg_log(SG_LOGITEM_INIT_SAMPLER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.init_sampler != null {
            _sg.hooks.init_sampler(smp_id, &desc_def, _sg.hooks.user_data);
        }
    }
}

void sg_init_shader(sg_shader shd_id, sg_shader_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_shader_desc desc_def = _sg_shader_desc_defaults(desc);
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    if shd != null {
        if shd.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_init_shader(shd, &desc_def);
            assert(cast(i64, _sg_resource_state_valid_failed(shd.slot.state)));
        } else {
            _sg_log(SG_LOGITEM_INIT_SHADER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.init_shader != null {
            _sg.hooks.init_shader(shd_id, &desc_def, _sg.hooks.user_data);
        }
    }
}

void sg_init_pipeline(sg_pipeline pip_id, sg_pipeline_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_pipeline_desc desc_def = _sg_pipeline_desc_defaults(desc);
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    if pip != null {
        if pip.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_init_pipeline(pip, &desc_def);
            assert(cast(i64, _sg_resource_state_valid_failed(pip.slot.state)));
        } else {
            _sg_log(SG_LOGITEM_INIT_PIPELINE_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.init_pipeline != null {
            _sg.hooks.init_pipeline(pip_id, &desc_def, _sg.hooks.user_data);
        }
    }
}

void sg_init_view(sg_view view_id, sg_view_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_view_desc desc_def = _sg_view_desc_defaults(desc);
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        if view.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_init_view(view, &desc_def);
            assert(cast(i64, _sg_resource_state_valid_failed(view.slot.state)));
        } else {
            _sg_log(SG_LOGITEM_INIT_VIEW_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.init_view != null {
            _sg.hooks.init_view(view_id, &desc_def, _sg.hooks.user_data);
        }
    }
}

void sg_uninit_buffer(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        if _sg_resource_state_valid_failed_unsealed(buf.slot.state) != 0 {
            _sg_uninit_buffer(buf);
            assert(buf.slot.state == SG_RESOURCESTATE_ALLOC);
        } else if buf.slot.state != SG_RESOURCESTATE_ALLOC {
            _sg_log(SG_LOGITEM_UNINIT_BUFFER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.uninit_buffer != null {
            _sg.hooks.uninit_buffer(buf_id, _sg.hooks.user_data);
        }
    }
}

void sg_uninit_image(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        if _sg_resource_state_valid_failed_unsealed(img.slot.state) != 0 {
            _sg_uninit_image(img);
            assert(img.slot.state == SG_RESOURCESTATE_ALLOC);
        } else if img.slot.state != SG_RESOURCESTATE_ALLOC {
            _sg_log(SG_LOGITEM_UNINIT_IMAGE_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.uninit_image != null {
            _sg.hooks.uninit_image(img_id, _sg.hooks.user_data);
        }
    }
}

void sg_uninit_sampler(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    if smp != null {
        if _sg_resource_state_valid_failed(smp.slot.state) != 0 {
            _sg_uninit_sampler(smp);
            assert(smp.slot.state == SG_RESOURCESTATE_ALLOC);
        } else if smp.slot.state != SG_RESOURCESTATE_ALLOC {
            _sg_log(SG_LOGITEM_UNINIT_SAMPLER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.uninit_sampler != null {
            _sg.hooks.uninit_sampler(smp_id, _sg.hooks.user_data);
        }
    }
}

void sg_uninit_shader(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    if shd != null {
        if _sg_resource_state_valid_failed(shd.slot.state) != 0 {
            _sg_uninit_shader(shd);
            assert(shd.slot.state == SG_RESOURCESTATE_ALLOC);
        } else if shd.slot.state != SG_RESOURCESTATE_ALLOC {
            _sg_log(SG_LOGITEM_UNINIT_SHADER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.uninit_shader != null {
            _sg.hooks.uninit_shader(shd_id, _sg.hooks.user_data);
        }
    }
}

void sg_uninit_pipeline(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    if pip != null {
        if _sg_resource_state_valid_failed(pip.slot.state) != 0 {
            _sg_uninit_pipeline(pip);
            assert(pip.slot.state == SG_RESOURCESTATE_ALLOC);
        } else if pip.slot.state != SG_RESOURCESTATE_ALLOC {
            _sg_log(SG_LOGITEM_UNINIT_PIPELINE_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.uninit_pipeline != null {
            _sg.hooks.uninit_pipeline(pip_id, _sg.hooks.user_data);
        }
    }
}

void sg_uninit_view(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        if _sg_resource_state_valid_failed(view.slot.state) != 0 {
            _sg_uninit_view(view);
            assert(view.slot.state == SG_RESOURCESTATE_ALLOC);
        } else if view.slot.state != SG_RESOURCESTATE_ALLOC {
            _sg_log(SG_LOGITEM_UNINIT_VIEW_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.uninit_view != null {
            _sg.hooks.uninit_view(view_id, _sg.hooks.user_data);
        }
    }
}

void sg_fail_buffer(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        if buf.slot.state == SG_RESOURCESTATE_ALLOC {
            buf.slot.state = SG_RESOURCESTATE_FAILED;
        } else {
            _sg_log(SG_LOGITEM_FAIL_BUFFER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.fail_buffer != null {
            _sg.hooks.fail_buffer(buf_id, _sg.hooks.user_data);
        }
    }
}

void sg_fail_image(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        if img.slot.state == SG_RESOURCESTATE_ALLOC {
            img.slot.state = SG_RESOURCESTATE_FAILED;
        } else {
            _sg_log(SG_LOGITEM_FAIL_IMAGE_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.fail_image != null {
            _sg.hooks.fail_image(img_id, _sg.hooks.user_data);
        }
    }
}

void sg_fail_sampler(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    if smp != null {
        if smp.slot.state == SG_RESOURCESTATE_ALLOC {
            smp.slot.state = SG_RESOURCESTATE_FAILED;
        } else {
            _sg_log(SG_LOGITEM_FAIL_SAMPLER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.fail_sampler != null {
            _sg.hooks.fail_sampler(smp_id, _sg.hooks.user_data);
        }
    }
}

void sg_fail_shader(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    if shd != null {
        if shd.slot.state == SG_RESOURCESTATE_ALLOC {
            shd.slot.state = SG_RESOURCESTATE_FAILED;
        } else {
            _sg_log(SG_LOGITEM_FAIL_SHADER_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.fail_shader != null {
            _sg.hooks.fail_shader(shd_id, _sg.hooks.user_data);
        }
    }
}

void sg_fail_pipeline(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    if pip != null {
        if pip.slot.state == SG_RESOURCESTATE_ALLOC {
            pip.slot.state = SG_RESOURCESTATE_FAILED;
        } else {
            _sg_log(SG_LOGITEM_FAIL_PIPELINE_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.fail_pipeline != null {
            _sg.hooks.fail_pipeline(pip_id, _sg.hooks.user_data);
        }
    }
}

void sg_fail_view(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        if view.slot.state == SG_RESOURCESTATE_ALLOC {
            view.slot.state = SG_RESOURCESTATE_FAILED;
        } else {
            _sg_log(SG_LOGITEM_FAIL_VIEW_INVALID_STATE, 1, null, __line__);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.fail_view != null {
            _sg.hooks.fail_view(view_id, _sg.hooks.user_data);
        }
    }
}

sg_resource_state sg_query_buffer_state(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    sg_resource_state res = buf != null ? buf.slot.state : cast(i32, SG_RESOURCESTATE_INVALID);
    return res;
}

sg_resource_state sg_query_image_state(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    sg_resource_state res = img != null ? img.slot.state : cast(i32, SG_RESOURCESTATE_INVALID);
    return res;
}

sg_resource_state sg_query_sampler_state(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    sg_resource_state res = smp != null ? smp.slot.state : cast(i32, SG_RESOURCESTATE_INVALID);
    return res;
}

sg_resource_state sg_query_shader_state(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    sg_resource_state res = shd != null ? shd.slot.state : cast(i32, SG_RESOURCESTATE_INVALID);
    return res;
}

sg_resource_state sg_query_pipeline_state(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    sg_resource_state res = pip != null ? pip.slot.state : cast(i32, SG_RESOURCESTATE_INVALID);
    return res;
}

sg_resource_state sg_query_view_state(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    sg_resource_state res = view != null ? view.slot.state : cast(i32, SG_RESOURCESTATE_INVALID);
    return res;
}

sg_buffer sg_make_buffer(sg_buffer_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_buffer_desc desc_def = _sg_buffer_desc_defaults(desc);
    sg_buffer buf_id = _sg_alloc_buffer();
    if buf_id.id != cast(u32, SG_INVALID_ID) {
        _sg_buffer_t* buf = _sg_buffer_at(buf_id.id);
        assert(buf != null && buf.slot.state == SG_RESOURCESTATE_ALLOC);
        _sg_init_buffer(buf, &desc_def);
        assert(cast(i64, _sg_resource_state_valid_failed_unsealed(buf.slot.state)));
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.make_buffer != null {
            _sg.hooks.make_buffer(&desc_def, buf_id, _sg.hooks.user_data);
        }
    }
    return buf_id;
}

sg_image sg_make_image(sg_image_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_image_desc desc_def = _sg_image_desc_defaults(desc);
    sg_image img_id = _sg_alloc_image();
    if img_id.id != cast(u32, SG_INVALID_ID) {
        _sg_image_t* img = _sg_image_at(img_id.id);
        assert(img != null && img.slot.state == SG_RESOURCESTATE_ALLOC);
        _sg_init_image(img, &desc_def);
        assert(cast(i64, _sg_resource_state_valid_failed_unsealed(img.slot.state)));
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.make_image != null {
            _sg.hooks.make_image(&desc_def, img_id, _sg.hooks.user_data);
        }
    }
    return img_id;
}

sg_sampler sg_make_sampler(sg_sampler_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_sampler_desc desc_def = _sg_sampler_desc_defaults(desc);
    sg_sampler smp_id = _sg_alloc_sampler();
    if smp_id.id != cast(u32, SG_INVALID_ID) {
        _sg_sampler_t* smp = _sg_sampler_at(smp_id.id);
        assert(smp != null && smp.slot.state == SG_RESOURCESTATE_ALLOC);
        _sg_init_sampler(smp, &desc_def);
        assert(cast(i64, _sg_resource_state_valid_failed(smp.slot.state)));
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.make_sampler != null {
            _sg.hooks.make_sampler(&desc_def, smp_id, _sg.hooks.user_data);
        }
    }
    return smp_id;
}

sg_shader sg_make_shader(sg_shader_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_shader_desc desc_def = _sg_shader_desc_defaults(desc);
    sg_shader shd_id = _sg_alloc_shader();
    if shd_id.id != cast(u32, SG_INVALID_ID) {
        _sg_shader_t* shd = _sg_shader_at(shd_id.id);
        assert(shd != null && shd.slot.state == SG_RESOURCESTATE_ALLOC);
        _sg_init_shader(shd, &desc_def);
        assert(cast(i64, _sg_resource_state_valid_failed(shd.slot.state)));
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.make_shader != null {
            _sg.hooks.make_shader(&desc_def, shd_id, _sg.hooks.user_data);
        }
    }
    return shd_id;
}

sg_pipeline sg_make_pipeline(sg_pipeline_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_pipeline_desc desc_def = _sg_pipeline_desc_defaults(desc);
    sg_pipeline pip_id = _sg_alloc_pipeline();
    if pip_id.id != cast(u32, SG_INVALID_ID) {
        _sg_pipeline_t* pip = _sg_pipeline_at(pip_id.id);
        assert(pip != null && pip.slot.state == SG_RESOURCESTATE_ALLOC);
        _sg_init_pipeline(pip, &desc_def);
        assert(cast(i64, _sg_resource_state_valid_failed(pip.slot.state)));
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.make_pipeline != null {
            _sg.hooks.make_pipeline(&desc_def, pip_id, _sg.hooks.user_data);
        }
    }
    return pip_id;
}

sg_view sg_make_view(sg_view_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    sg_view_desc desc_def = _sg_view_desc_defaults(desc);
    sg_view view_id = _sg_alloc_view();
    if view_id.id != cast(u32, SG_INVALID_ID) {
        _sg_view_t* view = _sg_view_at(view_id.id);
        assert(view != null && view.slot.state == SG_RESOURCESTATE_ALLOC);
        _sg_init_view(view, &desc_def);
        assert(cast(i64, _sg_resource_state_valid_failed(view.slot.state)));
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.make_view != null {
            _sg.hooks.make_view(&desc_def, view_id, _sg.hooks.user_data);
        }
    }
    return view_id;
}

void sg_destroy_buffer(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.destroy_buffer != null {
            _sg.hooks.destroy_buffer(buf_id, _sg.hooks.user_data);
        }
    }
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        if _sg_resource_state_valid_failed_unsealed(buf.slot.state) != 0 {
            _sg_uninit_buffer(buf);
            assert(buf.slot.state == SG_RESOURCESTATE_ALLOC);
        }
        if buf.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_buffer(buf);
            assert(buf.slot.state == SG_RESOURCESTATE_INITIAL);
        }
    }
}

void sg_destroy_image(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.destroy_image != null {
            _sg.hooks.destroy_image(img_id, _sg.hooks.user_data);
        }
    }
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        if _sg_resource_state_valid_failed_unsealed(img.slot.state) != 0 {
            _sg_uninit_image(img);
            assert(img.slot.state == SG_RESOURCESTATE_ALLOC);
        }
        if img.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_image(img);
            assert(img.slot.state == SG_RESOURCESTATE_INITIAL);
        }
    }
}

void sg_destroy_sampler(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.destroy_sampler != null {
            _sg.hooks.destroy_sampler(smp_id, _sg.hooks.user_data);
        }
    }
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    if smp != null {
        if _sg_resource_state_valid_failed(smp.slot.state) != 0 {
            _sg_uninit_sampler(smp);
            assert(smp.slot.state == SG_RESOURCESTATE_ALLOC);
        }
        if smp.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_sampler(smp);
            assert(smp.slot.state == SG_RESOURCESTATE_INITIAL);
        }
    }
}

void sg_destroy_shader(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.destroy_shader != null {
            _sg.hooks.destroy_shader(shd_id, _sg.hooks.user_data);
        }
    }
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    if shd != null {
        if _sg_resource_state_valid_failed(shd.slot.state) != 0 {
            _sg_uninit_shader(shd);
            assert(shd.slot.state == SG_RESOURCESTATE_ALLOC);
        }
        if shd.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_shader(shd);
            assert(shd.slot.state == SG_RESOURCESTATE_INITIAL);
        }
    }
}

void sg_destroy_pipeline(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.destroy_pipeline != null {
            _sg.hooks.destroy_pipeline(pip_id, _sg.hooks.user_data);
        }
    }
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    if pip != null {
        if _sg_resource_state_valid_failed(pip.slot.state) != 0 {
            _sg_uninit_pipeline(pip);
            assert(pip.slot.state == SG_RESOURCESTATE_ALLOC);
        }
        if pip.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_pipeline(pip);
            assert(pip.slot.state == SG_RESOURCESTATE_INITIAL);
        }
    }
}

void sg_destroy_view(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.destroy_view != null {
            _sg.hooks.destroy_view(view_id, _sg.hooks.user_data);
        }
    }
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        if _sg_resource_state_valid_failed(view.slot.state) != 0 {
            _sg_uninit_view(view);
            assert(view.slot.state == SG_RESOURCESTATE_ALLOC);
        }
        if view.slot.state == SG_RESOURCESTATE_ALLOC {
            _sg_dealloc_view(view);
            assert(view.slot.state == SG_RESOURCESTATE_INITIAL);
        }
    }
}

void sg_begin_pass(sg_pass* pass) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, !_sg.cur_pass.valid));
    assert(cast(i64, !_sg.cur_pass.in_pass));
    assert(cast(i64, _sg_attachments_empty(&_sg.cur_pass.atts)));
    assert(cast(i64, pass));
    assert(pass._start_canary == 0 && pass._end_canary == 0);
    _sg.cur_pass.in_pass = true;
    sg_pass pass_def = _sg_pass_defaults(pass);
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.begin_pass != null {
            _sg.hooks.begin_pass(&pass_def, _sg.hooks.user_data);
        }
    }
    if _sg_validate_pass_attachment_limits(&pass_def) == 0 {
        return;
    }
    if _sg_validate_begin_pass(&pass_def) == 0 {
        return;
    }
    _sg_attachments_ptrs_t atts_ptrs = _sg_attachments_ptrs(&pass_def.attachments);
    if atts_ptrs.empty == 0 {
        if !_sg_attachments_alive(&atts_ptrs) {
            _sg_log(SG_LOGITEM_BEGINPASS_ATTACHMENTS_ALIVE, 1, null, __line__);
            return;
        }
        _sg.cur_pass.atts = pass.attachments;
        _sg.cur_pass.dim = _sg_attachments_dim(&atts_ptrs);
    } else if !pass_def.compute {
        _sg.cur_pass.swapchain.invalid = pass_def.swapchain.invalid;
        _sg.cur_pass.swapchain.color_fmt = pass_def.swapchain.color_format;
        _sg.cur_pass.swapchain.depth_fmt = pass_def.swapchain.depth_format;
        _sg.cur_pass.swapchain.sample_count = pass_def.swapchain.sample_count;
        _sg.cur_pass.dim.width = pass_def.swapchain.width;
        _sg.cur_pass.dim.height = pass_def.swapchain.height;
    }
    _sg.cur_pass.action = pass_def.action;
    _sg.cur_pass.valid = true;
    _sg.cur_pass.is_compute = pass_def.compute;
    if _sg.cur_pass.swapchain.invalid != 0 {
        _sg.cur_pass.valid = false;
        return;
    }
    _sg_begin_pass(&pass_def, &atts_ptrs);
}

void sg_apply_viewport(i32 x, i32 y, i32 width, i32 height, bool origin_top_left) {
    assert(cast(i64, _sg.valid));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_apply_viewport++;
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.apply_viewport != null {
            _sg.hooks.apply_viewport(x, y, width, height, origin_top_left, _sg.hooks.user_data);
        }
    }
    if !_sg.cur_pass.valid {
        return;
    }
    when defined(SOKOL_DEBUG) {
        if _sg_validate_apply_viewport(x, y, width, height, origin_top_left) == 0 {
            return;
        }
    }
    _sg_apply_viewport(x, y, width, height, origin_top_left);
}

void sg_apply_viewportf(f32 x, f32 y, f32 width, f32 height, bool origin_top_left) {
    sg_apply_viewport(cast(i32, x), cast(i32, y), cast(i32, width), cast(i32, height), origin_top_left);
}

void sg_apply_scissor_rect(i32 x, i32 y, i32 width, i32 height, bool origin_top_left) {
    assert(cast(i64, _sg.valid));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_apply_scissor_rect++;
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.apply_scissor_rect != null {
            _sg.hooks.apply_scissor_rect(x, y, width, height, origin_top_left, _sg.hooks.user_data);
        }
    }
    if !_sg.cur_pass.valid {
        return;
    }
    when defined(SOKOL_DEBUG) {
        if _sg_validate_apply_scissor_rect(x, y, width, height, origin_top_left) == 0 {
            return;
        }
    }
    _sg_apply_scissor_rect(x, y, width, height, origin_top_left);
}

void sg_apply_scissor_rectf(f32 x, f32 y, f32 width, f32 height, bool origin_top_left) {
    sg_apply_scissor_rect(cast(i32, x), cast(i32, y), cast(i32, width), cast(i32, height), origin_top_left);
}

void sg_apply_pipeline(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_apply_pipeline++;
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.apply_pipeline != null {
            _sg.hooks.apply_pipeline(pip_id, _sg.hooks.user_data);
        }
    }
    if !_sg.cur_pass.valid {
        return;
    }
    if _sg_validate_apply_pipeline(pip_id) == 0 {
        _sg.next_draw_valid = false;
        return;
    }
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    assert(cast(i64, pip));
    _sg.cur_pip = _sg_pipeline_ref(pip);
    _sg.next_draw_valid = SG_RESOURCESTATE_VALID == pip.slot.state;
    if _sg.next_draw_valid == 0 {
        return;
    }
    _sg.use_indexed_draw = pip.cmn.index_type != SG_INDEXTYPE_NONE;
    _sg.use_instanced_draw = pip.cmn.use_instanced_draw;
    _sg_apply_pipeline(pip);
}

void sg_apply_bindings(sg_bindings* bindings) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, bindings));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_apply_bindings++;
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.apply_bindings != null {
            _sg.hooks.apply_bindings(bindings, _sg.hooks.user_data);
        }
    }
    if !_sg.cur_pass.valid {
        return;
    }
    if _sg_validate_apply_bindings(bindings) == 0 {
        _sg.next_draw_valid = false;
    }
    assert(bindings._start_canary == 0 && bindings._end_canary == 0);
    if _sg_pipeline_ref_alive(&_sg.cur_pip) == 0 {
        _sg.next_draw_valid = false;
    }
    if _sg.next_draw_valid == 0 {
        return;
    }
    _sg_bindings_ptrs_t bnd;
    bnd.pip = _sg_pipeline_ref_ptr(&_sg.cur_pip);
    _sg_shader_t* shd = _sg_shader_ref_ptr(&bnd.pip.cmn.shader);
    if !_sg.cur_pass.is_compute {
        for u64 i = 0; i < cast(u64, SG_MAX_VERTEXBUFFER_BINDSLOTS); i++ {
            if bnd.pip.cmn.vertex_buffer_layout_active[i] != 0 {
                assert(bindings.vertex_buffers[i].id != cast(u32, SG_INVALID_ID));
                _sg_buffer_t* buf = _sg_lookup_buffer(bindings.vertex_buffers[i].id);
                if buf != null && SG_RESOURCESTATE_VALID == buf.slot.state {
                    bnd.vbs[i] = buf;
                    bnd.vb_offsets[i] = bindings.vertex_buffer_offsets[i];
                } else {
                    _sg.next_draw_valid = false;
                }
            }
        }
        if bindings.index_buffer.id != 0 {
            _sg_buffer_t* buf = _sg_lookup_buffer(bindings.index_buffer.id);
            if buf != null && SG_RESOURCESTATE_VALID == buf.slot.state {
                bnd.ib = buf;
                bnd.ib_offset = bindings.index_buffer_offset;
            } else {
                _sg.next_draw_valid = false;
            }
        }
    }
    for i32 i = 0; i < SG_MAX_VIEW_BINDSLOTS; i++ {
        if shd.cmn.views[i].view_type != SG_VIEWTYPE_INVALID {
            assert(bindings.views[i].id != cast(u32, SG_INVALID_ID));
            _sg_view_t* view = _sg_lookup_view(bindings.views[i].id);
            bnd.views[i] = view;
            if view != null {
                if view.cmn.type == SG_VIEWTYPE_STORAGEBUFFER {
                    if _sg_buffer_ref_valid(&view.cmn.buf.ref) == 0 {
                        _sg.next_draw_valid = false;
                    }
                } else {
                    if _sg_image_ref_valid(&view.cmn.img.ref) == 0 {
                        _sg.next_draw_valid = false;
                    }
                }
            } else {
                _sg.next_draw_valid = false;
            }
        }
    }
    for u64 i = 0; i < cast(u64, SG_MAX_SAMPLER_BINDSLOTS); i++ {
        if shd.cmn.samplers[i].stage != SG_SHADERSTAGE_NONE {
            assert(bindings.samplers[i].id != cast(u32, SG_INVALID_ID));
            bnd.smps[i] = _sg_lookup_sampler(bindings.samplers[i].id);
            assert(cast(i64, bnd.smps[i]));
        }
    }
    if _sg.next_draw_valid != 0 {
        _sg.next_draw_valid &= _sg_apply_bindings(&bnd);
    }
}

void sg_apply_uniforms(i32 ub_slot, sg_range* data) {
    assert(cast(i64, _sg.valid));
    assert(ub_slot >= 0 && ub_slot < SG_MAX_UNIFORMBLOCK_BINDSLOTS);
    assert(data != null && data.ptr != null && data.size > 0);
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_apply_uniforms++;
        }
    }
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.size_apply_uniforms += cast(u32, data.size);
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.apply_uniforms != null {
            _sg.hooks.apply_uniforms(ub_slot, data, _sg.hooks.user_data);
        }
    }
    if !_sg.cur_pass.valid {
        return;
    }
    if _sg_validate_apply_uniforms(ub_slot, data) == 0 {
        _sg.next_draw_valid = false;
        return;
    }
    if _sg.next_draw_valid == 0 {
        return;
    }
    _sg_apply_uniforms(ub_slot, data);
}

private {
bool _sg_check_skip_draw(i32 num_elements, i32 num_instances) {
    if !_sg.cur_pass.valid {
        return true;
    }
    if _sg.next_draw_valid == 0 {
        return true;
    }
    if 0 == num_elements || 0 == num_instances {
        return true;
    }
    return false;
}
}

void sg_draw(i32 base_element, i32 num_elements, i32 num_instances) {
    assert(cast(i64, _sg.valid));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_draw++;
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.draw != null {
            _sg.hooks.draw(base_element, num_elements, num_instances, _sg.hooks.user_data);
        }
    }
    if _sg_check_skip_draw(num_elements, num_instances) != 0 {
        return;
    }
    when defined(SOKOL_DEBUG) {
        if _sg_validate_draw(base_element, num_elements, num_instances) == 0 {
            return;
        }
    }
    _sg_draw(base_element, num_elements, num_instances, 0, 0);
}

void sg_draw_ex(i32 base_element, i32 num_elements, i32 num_instances, i32 base_vertex, i32 base_instance) {
    assert(cast(i64, _sg.valid));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_draw_ex++;
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.draw_ex != null {
            _sg.hooks.draw_ex(base_element, num_elements, num_instances, base_vertex, base_instance, _sg.hooks.user_data);
        }
    }
    if _sg_check_skip_draw(num_elements, num_instances) != 0 {
        return;
    }
    when defined(SOKOL_DEBUG) {
        if _sg_validate_draw_ex(base_element, num_elements, num_instances, base_vertex, base_instance) == 0 {
            return;
        }
    }
    _sg_draw(base_element, num_elements, num_instances, base_vertex, base_instance);
}

void sg_dispatch(i32 num_groups_x, i32 num_groups_y, i32 num_groups_z) {
    assert(cast(i64, _sg.valid));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_dispatch++;
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.dispatch != null {
            _sg.hooks.dispatch(num_groups_x, num_groups_y, num_groups_z, _sg.hooks.user_data);
        }
    }
    if !_sg.cur_pass.valid {
        return;
    }
    if _sg.next_draw_valid == 0 {
        return;
    }
    if 0 == num_groups_x || 0 == num_groups_y || 0 == num_groups_z {
        return;
    }
    when defined(SOKOL_DEBUG) {
        if _sg_validate_dispatch(num_groups_x, num_groups_y, num_groups_z) == 0 {
            return;
        }
    }
    _sg_dispatch(num_groups_x, num_groups_y, num_groups_z);
}

void sg_end_pass() {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, _sg.cur_pass.in_pass));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_passes++;
        }
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.end_pass != null {
            _sg.hooks.end_pass(_sg.hooks.user_data);
        }
    }
    if _sg.cur_pass.swapchain.invalid == 0 {
        _sg_attachments_ptrs_t atts_ptrs = _sg_attachments_ptrs(&_sg.cur_pass.atts);
        _sg_end_pass(&atts_ptrs);
    }
    _sg.cur_pip = _sg_pipeline_ref(null);
    _sg_clear(&_sg.cur_pass, cast(u64, sizeof(_sg_cur_pass_t)));
}

void sg_commit() {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, !_sg.cur_pass.valid));
    assert(cast(i64, !_sg.cur_pass.in_pass));
    _sg_commit();
    _sg_update_stats();
    _sg_notify_commit_listeners();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.commit != null {
            _sg.hooks.commit(_sg.hooks.user_data);
        }
    }
    _sg.frame_index++;
}

void sg_reset_state_cache() {
    assert(cast(i64, _sg.valid));
    _sg_reset_state_cache();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.reset_state_cache != null {
            _sg.hooks.reset_state_cache(_sg.hooks.user_data);
        }
    }
}

void sg_write_buffer_transient(sg_write_buffer_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_write_buffer_transient++;
        }
    }
    _sg_buffer_t* buf = _sg_lookup_buffer(desc.dst.buffer.id);
    if buf == null {
        _sg_log(SG_LOGITEM_WRITE_BUFFER_TRANSIENT_BUFFER_ALIVE, 1, null, __line__);
        return;
    }
    if buf.slot.state != SG_RESOURCESTATE_VALID {
        _sg_log(SG_LOGITEM_WRITE_BUFFER_TRANSIENT_BUFFER_VALID, 1, null, __line__);
        return;
    }
    sg_write_buffer_desc desc_def = _sg_write_buffer_desc_defaults(desc);
    if _sg_validate_write_buffer_transient(buf, &desc_def) != 0 {
        bool first_time_in_frame = false;
        if buf.cmn.write_transient_frame_index != _sg.frame_index {
            first_time_in_frame = true;
            buf.cmn.write_transient_frame_index = _sg.frame_index;
            if ++buf.cmn.active_slot >= buf.cmn.num_slots {
                buf.cmn.active_slot = 0;
            }
        }
        _sg_write_buffer_transient(buf, &desc_def, first_time_in_frame);
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.write_buffer_transient != null {
            _sg.hooks.write_buffer_transient(desc, _sg.hooks.user_data);
        }
    }
}

void sg_write_image_transient(sg_write_image_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_write_image_transient++;
        }
    }
    _sg_image_t* img = _sg_lookup_image(desc.dst.image.id);
    if img == null {
        _sg_log(SG_LOGITEM_WRITE_IMAGE_TRANSIENT_IMAGE_ALIVE, 1, null, __line__);
        return;
    }
    if img.slot.state != SG_RESOURCESTATE_VALID {
        _sg_log(SG_LOGITEM_WRITE_IMAGE_TRANSIENT_IMAGE_VALID, 1, null, __line__);
        return;
    }
    sg_write_image_desc desc_def = _sg_write_image_desc_defaults(img, desc);
    if _sg_validate_write_image_transient(img, &desc_def) != 0 {
        bool first_time_in_frame = false;
        if img.cmn.write_transient_frame_index != _sg.frame_index {
            first_time_in_frame = true;
            img.cmn.write_transient_frame_index = _sg.frame_index;
            if ++img.cmn.active_slot >= img.cmn.num_slots {
                img.cmn.active_slot = 0;
            }
        }
        _sg_write_image_transient(img, &desc_def, first_time_in_frame);
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.write_image_transient != null {
            _sg.hooks.write_image_transient(desc, _sg.hooks.user_data);
        }
    }
}

void sg_write_buffer_unsealed(sg_write_buffer_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_write_buffer_unsealed++;
        }
    }
    _sg_buffer_t* buf = _sg_lookup_buffer(desc.dst.buffer.id);
    if buf == null {
        _sg_log(SG_LOGITEM_WRITE_BUFFER_UNSEALED_BUFFER_ALIVE, 1, null, __line__);
        return;
    }
    if buf.slot.state != SG_RESOURCESTATE_UNSEALED {
        _sg_log(SG_LOGITEM_WRITE_BUFFER_UNSEALED_BUFFER_UNSEALED, 1, null, __line__);
        return;
    }
    sg_write_buffer_desc desc_def = _sg_write_buffer_desc_defaults(desc);
    if _sg_validate_write_buffer_unsealed(buf, &desc_def) != 0 {
        _sg_write_buffer_unsealed(buf, &desc_def);
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.write_buffer_unsealed != null {
            _sg.hooks.write_buffer_unsealed(desc, _sg.hooks.user_data);
        }
    }
}

void sg_write_image_unsealed(sg_write_image_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_write_image_unsealed++;
        }
    }
    _sg_image_t* img = _sg_lookup_image(desc.dst.image.id);
    if img == null {
        _sg_log(SG_LOGITEM_WRITE_IMAGE_UNSEALED_IMAGE_ALIVE, 1, null, __line__);
        return;
    }
    if img.slot.state != SG_RESOURCESTATE_UNSEALED {
        _sg_log(SG_LOGITEM_WRITE_IMAGE_UNSEALED_IMAGE_UNSEALED, 1, null, __line__);
        return;
    }
    sg_write_image_desc desc_def = _sg_write_image_desc_defaults(img, desc);
    if _sg_validate_write_image_unsealed(img, &desc_def) != 0 {
        _sg_write_image_unsealed(img, &desc_def);
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.write_image_unsealed != null {
            _sg.hooks.write_image_unsealed(desc, _sg.hooks.user_data);
        }
    }
}

void sg_seal_buffer(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_seal_buffer++;
        }
    }
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf == null {
        _sg_log(SG_LOGITEM_SEAL_BUFFER_ALIVE, 1, null, __line__);
        return;
    }
    if _sg_validate_seal_buffer(buf) != 0 {
        _sg_seal_buffer(buf);
        buf.slot.state = SG_RESOURCESTATE_VALID;
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.seal_buffer != null {
            _sg.hooks.seal_buffer(buf_id, _sg.hooks.user_data);
        }
    }
}

void sg_seal_image(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_seal_image++;
        }
    }
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img == null {
        _sg_log(SG_LOGITEM_SEAL_IMAGE_ALIVE, 1, null, __line__);
        return;
    }
    if _sg_validate_seal_image(img) != 0 {
        _sg_seal_image(img);
        img.slot.state = SG_RESOURCESTATE_VALID;
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.seal_image != null {
            _sg.hooks.seal_image(img_id, _sg.hooks.user_data);
        }
    }
}

void sg_copy_buffer_to_buffer(sg_copy_buffer_to_buffer_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_copy_buffer_to_buffer++;
        }
    }
    _sg_buffer_t* src_buf = _sg_lookup_buffer(desc.src.buffer.id);
    _sg_buffer_t* dst_buf = _sg_lookup_buffer(desc.dst.buffer.id);
    if src_buf == null {
        _sg_log(SG_LOGITEM_COPY_BUFFER_TO_BUFFER_SRC_ALIVE, 1, null, __line__);
        return;
    }
    if dst_buf == null {
        _sg_log(SG_LOGITEM_COPY_BUFFER_TO_BUFFER_DST_ALIVE, 1, null, __line__);
        return;
    }
    if src_buf.slot.state != SG_RESOURCESTATE_VALID {
        _sg_log(SG_LOGITEM_COPY_BUFFER_TO_BUFFER_SRC_VALID, 1, null, __line__);
        return;
    }
    if dst_buf.slot.state != SG_RESOURCESTATE_VALID {
        _sg_log(SG_LOGITEM_COPY_BUFFER_TO_BUFFER_DST_VALID, 1, null, __line__);
        return;
    }
    if _sg_validate_copy_buffer_to_buffer(src_buf, dst_buf, desc) != 0 {
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.size_copy_buffer_to_buffer += cast(u32, desc.size);
            }
        }
        _sg_copy_buffer_to_buffer(src_buf, dst_buf, desc);
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.copy_buffer_to_buffer != null {
            _sg.hooks.copy_buffer_to_buffer(desc, _sg.hooks.user_data);
        }
    }
}

void sg_copy_buffer_to_image(sg_copy_buffer_to_image_desc* desc) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, desc));
    {
        if _sg.stats_enabled {
            _sg.stats.cur_frame.num_copy_buffer_to_image++;
        }
    }
    _sg_buffer_t* src_buf = _sg_lookup_buffer(desc.src.buffer.id);
    _sg_image_t* dst_img = _sg_lookup_image(desc.dst.image.id);
    if src_buf == null {
        _sg_log(SG_LOGITEM_COPY_BUFFER_TO_IMAGE_SRC_ALIVE, 1, null, __line__);
        return;
    }
    if dst_img == null {
        _sg_log(SG_LOGITEM_COPY_BUFFER_TO_IMAGE_DST_ALIVE, 1, null, __line__);
        return;
    }
    if src_buf.slot.state != SG_RESOURCESTATE_VALID {
        _sg_log(SG_LOGITEM_COPY_BUFFER_TO_IMAGE_SRC_VALID, 1, null, __line__);
        return;
    }
    if dst_img.slot.state != SG_RESOURCESTATE_VALID {
        _sg_log(SG_LOGITEM_COPY_BUFFER_TO_IMAGE_DST_VALID, 1, null, __line__);
        return;
    }
    sg_copy_buffer_to_image_desc desc_def = _sg_copy_buffer_to_image_desc_defaults(dst_img, desc);
    if _sg_validate_copy_buffer_to_image(src_buf, dst_img, &desc_def) != 0 {
        u64 stats_copy_size = _sg_image_copy_size(dst_img.cmn.pixel_format, desc_def.src.bytes_per_row, desc_def.src.bytes_per_slice, desc_def.size.width, desc_def.size.height, desc_def.size.num_slices);
        {
            if _sg.stats_enabled {
                _sg.stats.cur_frame.size_copy_buffer_to_image += cast(u32, stats_copy_size);
            }
        }
        _sg_copy_buffer_to_image(src_buf, dst_img, &desc_def);
    }
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.copy_buffer_to_image != null {
            _sg.hooks.copy_buffer_to_image(desc, _sg.hooks.user_data);
        }
    }
}

void sg_push_debug_group(u8* name) {
    assert(cast(i64, _sg.valid));
    assert(cast(i64, name));
    _sg_push_debug_group(name);
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.push_debug_group != null {
            _sg.hooks.push_debug_group(name, _sg.hooks.user_data);
        }
    }
}

void sg_pop_debug_group() {
    assert(cast(i64, _sg.valid));
    _sg_pop_debug_group();
    when defined(SOKOL_TRACE_HOOKS) {
        if _sg.hooks.pop_debug_group != null {
            _sg.hooks.pop_debug_group(_sg.hooks.user_data);
        }
    }
}

bool sg_add_commit_listener(sg_commit_listener listener) {
    assert(cast(i64, _sg.valid));
    return _sg_add_commit_listener(&listener);
}

bool sg_remove_commit_listener(sg_commit_listener listener) {
    assert(cast(i64, _sg.valid));
    return _sg_remove_commit_listener(&listener);
}

void sg_enable_stats() {
    assert(cast(i64, _sg.valid));
    _sg.stats_enabled = true;
}

void sg_disable_stats() {
    assert(cast(i64, _sg.valid));
    _sg.stats_enabled = false;
}

bool sg_stats_enabled() {
    return _sg.stats_enabled;
}

sg_buffer_info sg_query_buffer_info(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    sg_buffer_info info;
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        info.slot.state = buf.slot.state;
        info.slot.res_id = buf.slot.id;
        info.slot.uninit_count = buf.slot.uninit_count;
        info.num_slots = buf.cmn.num_slots;
        info.active_slot = buf.cmn.active_slot;
    }
    return info;
}

sg_image_info sg_query_image_info(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    sg_image_info info;
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        info.slot.state = img.slot.state;
        info.slot.res_id = img.slot.id;
        info.slot.uninit_count = img.slot.uninit_count;
        info.num_slots = img.cmn.num_slots;
        info.active_slot = img.cmn.active_slot;
    }
    return info;
}

sg_sampler_info sg_query_sampler_info(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    sg_sampler_info info;
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    if smp != null {
        info.slot.state = smp.slot.state;
        info.slot.res_id = smp.slot.id;
        info.slot.uninit_count = smp.slot.uninit_count;
    }
    return info;
}

sg_shader_info sg_query_shader_info(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    sg_shader_info info;
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    if shd != null {
        info.slot.state = shd.slot.state;
        info.slot.res_id = shd.slot.id;
        info.slot.uninit_count = shd.slot.uninit_count;
    }
    return info;
}

sg_pipeline_info sg_query_pipeline_info(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    sg_pipeline_info info;
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    if pip != null {
        info.slot.state = pip.slot.state;
        info.slot.res_id = pip.slot.id;
        info.slot.uninit_count = pip.slot.uninit_count;
    }
    return info;
}

sg_view_info sg_query_view_info(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    sg_view_info info;
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        info.slot.state = view.slot.state;
        info.slot.res_id = view.slot.id;
        info.slot.uninit_count = view.slot.uninit_count;
    }
    return info;
}

sg_buffer_desc sg_query_buffer_desc(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    sg_buffer_desc desc;
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        desc.size = cast(u64, buf.cmn.size);
        desc.usage = buf.cmn.usage;
    }
    return desc;
}

u64 sg_query_buffer_size(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        return cast(u64, buf.cmn.size);
    }
    return 0;
}

sg_buffer_usage sg_query_buffer_usage(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    sg_buffer_usage usg;
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        usg = buf.cmn.usage;
    }
    return usg;
}

sg_image_desc sg_query_image_desc(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    sg_image_desc desc;
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        desc.type = img.cmn.type;
        desc.width = img.cmn.width;
        desc.height = img.cmn.height;
        desc.num_slices = img.cmn.num_slices;
        desc.num_mipmaps = img.cmn.num_mipmaps;
        desc.usage = img.cmn.usage;
        desc.pixel_format = img.cmn.pixel_format;
        desc.sample_count = img.cmn.sample_count;
    }
    return desc;
}

sg_image_type sg_query_image_type(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        return img.cmn.type;
    }
    return _SG_IMAGETYPE_DEFAULT;
}

i32 sg_query_image_width(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        return img.cmn.width;
    }
    return 0;
}

i32 sg_query_image_height(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        return img.cmn.height;
    }
    return 0;
}

i32 sg_query_image_num_slices(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        return img.cmn.num_slices;
    }
    return 0;
}

i32 sg_query_image_num_mipmaps(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        return img.cmn.num_mipmaps;
    }
    return 0;
}

sg_pixel_format sg_query_image_pixelformat(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        return img.cmn.pixel_format;
    }
    return _SG_PIXELFORMAT_DEFAULT;
}

sg_image_usage sg_query_image_usage(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    sg_image_usage usg;
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        usg = img.cmn.usage;
    }
    return usg;
}

i32 sg_query_image_sample_count(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        return img.cmn.sample_count;
    }
    return 0;
}

sg_view_type sg_query_view_type(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        return view.cmn.type;
    } else {
        return SG_VIEWTYPE_INVALID;
    }
}

// NOTE: may return SG_INVALID_ID if view invalid or view not an image view
sg_image sg_query_view_image(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    sg_image img;
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        img.id = view.cmn.img.ref.sref.id;
    }
    return img;
}

// NOTE: may return SG_INVALID_ID if view invalid or view not a buffer view
sg_buffer sg_query_view_buffer(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    sg_buffer buf;
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        buf.id = view.cmn.buf.ref.sref.id;
    }
    return buf;
}

sg_sampler_desc sg_query_sampler_desc(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    sg_sampler_desc desc;
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    if smp != null {
        desc.min_filter = smp.cmn.min_filter;
        desc.mag_filter = smp.cmn.mag_filter;
        desc.mipmap_filter = smp.cmn.mipmap_filter;
        desc.wrap_u = smp.cmn.wrap_u;
        desc.wrap_v = smp.cmn.wrap_v;
        desc.wrap_w = smp.cmn.wrap_w;
        desc.min_lod = smp.cmn.min_lod;
        desc.max_lod = smp.cmn.max_lod;
        desc.border_color = smp.cmn.border_color;
        desc.compare = smp.cmn.compare;
        desc.max_anisotropy = smp.cmn.max_anisotropy;
    }
    return desc;
}

sg_shader_desc sg_query_shader_desc(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    sg_shader_desc desc;
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    if shd != null {
        for u64 ub_idx = 0; ub_idx < cast(u64, SG_MAX_UNIFORMBLOCK_BINDSLOTS); ub_idx++ {
            sg_shader_uniform_block* ub_desc = &desc.uniform_blocks[ub_idx];
            _sg_shader_uniform_block_t* ub = &shd.cmn.uniform_blocks[ub_idx];
            ub_desc.stage = ub.stage;
            ub_desc.size = ub.size;
        }
        for u64 view_idx = 0; view_idx < cast(u64, SG_MAX_VIEW_BINDSLOTS); view_idx++ {
            _sg_shader_view_t* view = &shd.cmn.views[view_idx];
            if view.view_type == SG_VIEWTYPE_TEXTURE {
                sg_shader_texture_view* tex_desc = &desc.views[view_idx].texture;
                tex_desc.stage = view.stage;
                tex_desc.image_type = view.image_type;
                tex_desc.sample_type = view.sample_type;
                tex_desc.multisampled = view.multisampled;
            } else if shd.cmn.views[view_idx].view_type == SG_VIEWTYPE_STORAGEBUFFER {
                sg_shader_storage_buffer_view* sbuf_desc = &desc.views[view_idx].storage_buffer;
                sbuf_desc.stage = view.stage;
                sbuf_desc.readonly = view.sbuf_readonly;
            } else if shd.cmn.views[view_idx].view_type == SG_VIEWTYPE_STORAGEIMAGE {
                sg_shader_storage_image_view* simg_desc = &desc.views[view_idx].storage_image;
                simg_desc.stage = view.stage;
                simg_desc.access_format = view.access_format;
                simg_desc.image_type = view.image_type;
                simg_desc.writeonly = view.simg_writeonly;
            }
        }
        for u64 smp_idx = 0; smp_idx < cast(u64, SG_MAX_SAMPLER_BINDSLOTS); smp_idx++ {
            sg_shader_sampler* smp_desc = &desc.samplers[smp_idx];
            _sg_shader_sampler_t* smp = &shd.cmn.samplers[smp_idx];
            smp_desc.stage = smp.stage;
            smp_desc.sampler_type = smp.sampler_type;
        }
        for u64 tex_smp_idx = 0; tex_smp_idx < cast(u64, SG_MAX_TEXTURE_SAMPLER_PAIRS); tex_smp_idx++ {
            sg_shader_texture_sampler_pair* tex_smp_desc = &desc.texture_sampler_pairs[tex_smp_idx];
            _sg_shader_texture_sampler_t* tex_smp = &shd.cmn.texture_samplers[tex_smp_idx];
            tex_smp_desc.stage = tex_smp.stage;
            tex_smp_desc.view_slot = tex_smp.view_slot;
            tex_smp_desc.sampler_slot = tex_smp.sampler_slot;
        }
    }
    return desc;
}

sg_pipeline_desc sg_query_pipeline_desc(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    sg_pipeline_desc desc;
    _sg_pipeline_t* pip = _sg_lookup_pipeline(pip_id.id);
    if pip != null {
        desc.compute = pip.cmn.is_compute;
        desc.shader.id = pip.cmn.shader.sref.id;
        desc.layout = pip.cmn.layout;
        desc.depth = pip.cmn.depth;
        desc.stencil = pip.cmn.stencil;
        desc.color_count = pip.cmn.color_count;
        for i32 i = 0; i < pip.cmn.color_count; i++ {
            desc.colors[i] = pip.cmn.colors[i];
        }
        desc.primitive_type = pip.cmn.primitive_type;
        desc.index_type = pip.cmn.index_type;
        desc.cull_mode = pip.cmn.cull_mode;
        desc.face_winding = pip.cmn.face_winding;
        desc.sample_count = pip.cmn.sample_count;
        desc.blend_color = pip.cmn.blend_color;
        desc.alpha_to_coverage_enabled = pip.cmn.alpha_to_coverage_enabled;
    }
    return desc;
}

sg_view_desc sg_query_view_desc(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    sg_view_desc desc;
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        switch view.cmn.type {
            case SG_VIEWTYPE_STORAGEBUFFER: {
                desc.storage_buffer.buffer.id = view.cmn.buf.ref.sref.id;
                desc.storage_buffer.offset = view.cmn.buf.offset;
            }
            case SG_VIEWTYPE_STORAGEIMAGE: {
                desc.storage_image.image.id = view.cmn.img.ref.sref.id;
                desc.storage_image.mip_level = view.cmn.img.mip_level;
                desc.storage_image.slice = view.cmn.img.slice;
            }
            case SG_VIEWTYPE_TEXTURE: {
                desc.texture.image.id = view.cmn.img.ref.sref.id;
                desc.texture.mip_levels.base = view.cmn.img.mip_level;
                desc.texture.mip_levels.count = view.cmn.img.mip_level_count;
                desc.texture.slices.base = view.cmn.img.slice;
                desc.texture.slices.count = view.cmn.img.slice_count;
            }
            case SG_VIEWTYPE_COLORATTACHMENT: {
                desc.color_attachment.image.id = view.cmn.img.ref.sref.id;
                desc.color_attachment.mip_level = view.cmn.img.mip_level;
                desc.color_attachment.slice = view.cmn.img.slice;
            }
            case SG_VIEWTYPE_RESOLVEATTACHMENT: {
                desc.resolve_attachment.image.id = view.cmn.img.ref.sref.id;
                desc.resolve_attachment.mip_level = view.cmn.img.mip_level;
                desc.resolve_attachment.slice = view.cmn.img.slice;
            }
            case SG_VIEWTYPE_DEPTHSTENCILATTACHMENT: {
                desc.depth_stencil_attachment.image.id = view.cmn.img.ref.sref.id;
                desc.depth_stencil_attachment.mip_level = view.cmn.img.mip_level;
                desc.depth_stencil_attachment.slice = view.cmn.img.slice;
            }
            default: {
                assert(cast(i64, false));
            }
        }
    }
    return desc;
}

sg_buffer_desc sg_query_buffer_defaults(sg_buffer_desc* desc) {
    assert(_sg.valid && desc != null);
    return _sg_buffer_desc_defaults(desc);
}

sg_image_desc sg_query_image_defaults(sg_image_desc* desc) {
    assert(_sg.valid && desc != null);
    return _sg_image_desc_defaults(desc);
}

sg_sampler_desc sg_query_sampler_defaults(sg_sampler_desc* desc) {
    assert(_sg.valid && desc != null);
    return _sg_sampler_desc_defaults(desc);
}

sg_shader_desc sg_query_shader_defaults(sg_shader_desc* desc) {
    assert(_sg.valid && desc != null);
    return _sg_shader_desc_defaults(desc);
}

sg_pipeline_desc sg_query_pipeline_defaults(sg_pipeline_desc* desc) {
    assert(_sg.valid && desc != null);
    return _sg_pipeline_desc_defaults(desc);
}

sg_view_desc sg_query_view_defaults(sg_view_desc* desc) {
    assert(_sg.valid && desc != null);
    return _sg_view_desc_defaults(desc);
}

void* sg_d3d11_device() {
    return null;
}

void* sg_d3d11_device_context() {
    return null;
}

sg_d3d11_buffer_info sg_d3d11_query_buffer_info(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    sg_d3d11_buffer_info res;
    ignore buf_id;
    return res;
}

sg_d3d11_image_info sg_d3d11_query_image_info(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    sg_d3d11_image_info res;
    ignore img_id;
    return res;
}

sg_d3d11_sampler_info sg_d3d11_query_sampler_info(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    sg_d3d11_sampler_info res;
    ignore smp_id;
    return res;
}

sg_d3d11_shader_info sg_d3d11_query_shader_info(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    sg_d3d11_shader_info res;
    ignore shd_id;
    return res;
}

sg_d3d11_pipeline_info sg_d3d11_query_pipeline_info(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    sg_d3d11_pipeline_info res;
    ignore pip_id;
    return res;
}

sg_d3d11_view_info sg_d3d11_query_view_info(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    sg_d3d11_view_info res;
    ignore view_id;
    return res;
}

void* sg_mtl_device() {
    return null;
}

void* sg_mtl_render_command_encoder() {
    return null;
}

void* sg_mtl_compute_command_encoder() {
    return null;
}

void* sg_mtl_command_queue() {
    return null;
}

sg_mtl_buffer_info sg_mtl_query_buffer_info(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    sg_mtl_buffer_info res;
    ignore buf_id;
    return res;
}

sg_mtl_image_info sg_mtl_query_image_info(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    sg_mtl_image_info res;
    ignore img_id;
    return res;
}

sg_mtl_sampler_info sg_mtl_query_sampler_info(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    sg_mtl_sampler_info res;
    ignore smp_id;
    return res;
}

sg_mtl_shader_info sg_mtl_query_shader_info(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    sg_mtl_shader_info res;
    ignore shd_id;
    return res;
}

sg_mtl_pipeline_info sg_mtl_query_pipeline_info(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    sg_mtl_pipeline_info res;
    ignore pip_id;
    return res;
}

void* sg_wgpu_device() {
    return null;
}

void* sg_wgpu_queue() {
    return null;
}

void* sg_wgpu_command_encoder() {
    return null;
}

void* sg_wgpu_render_pass_encoder() {
    return null;
}

void* sg_wgpu_compute_pass_encoder() {
    return null;
}

sg_wgpu_buffer_info sg_wgpu_query_buffer_info(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    sg_wgpu_buffer_info res;
    ignore buf_id;
    return res;
}

sg_wgpu_image_info sg_wgpu_query_image_info(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    sg_wgpu_image_info res;
    ignore img_id;
    return res;
}

sg_wgpu_sampler_info sg_wgpu_query_sampler_info(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    sg_wgpu_sampler_info res;
    ignore smp_id;
    return res;
}

sg_wgpu_shader_info sg_wgpu_query_shader_info(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    sg_wgpu_shader_info res;
    ignore shd_id;
    return res;
}

sg_wgpu_pipeline_info sg_wgpu_query_pipeline_info(sg_pipeline pip_id) {
    assert(cast(i64, _sg.valid));
    sg_wgpu_pipeline_info res;
    ignore pip_id;
    return res;
}

sg_wgpu_view_info sg_wgpu_query_view_info(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    sg_wgpu_view_info res;
    ignore view_id;
    return res;
}

sg_gl_buffer_info sg_gl_query_buffer_info(sg_buffer buf_id) {
    assert(cast(i64, _sg.valid));
    sg_gl_buffer_info res;
    _sg_buffer_t* buf = _sg_lookup_buffer(buf_id.id);
    if buf != null {
        for i32 i = 0; i < SG_NUM_INFLIGHT_FRAMES; i++ {
            res.buf[i] = buf.gl.buf[i];
        }
        res.active_slot = buf.cmn.active_slot;
    }
    return res;
}

sg_gl_image_info sg_gl_query_image_info(sg_image img_id) {
    assert(cast(i64, _sg.valid));
    sg_gl_image_info res;
    _sg_image_t* img = _sg_lookup_image(img_id.id);
    if img != null {
        for i32 i = 0; i < SG_NUM_INFLIGHT_FRAMES; i++ {
            res.tex[i] = img.gl.tex[i];
        }
        res.tex_target = img.gl.target;
        res.active_slot = img.cmn.active_slot;
    }
    return res;
}

sg_gl_sampler_info sg_gl_query_sampler_info(sg_sampler smp_id) {
    assert(cast(i64, _sg.valid));
    sg_gl_sampler_info res;
    _sg_sampler_t* smp = _sg_lookup_sampler(smp_id.id);
    if smp != null {
        res.smp = smp.gl.smp;
    }
    return res;
}

sg_gl_shader_info sg_gl_query_shader_info(sg_shader shd_id) {
    assert(cast(i64, _sg.valid));
    sg_gl_shader_info res;
    _sg_shader_t* shd = _sg_lookup_shader(shd_id.id);
    if shd != null {
        res.prog = shd.gl.prog;
    }
    return res;
}

sg_gl_view_info sg_gl_query_view_info(sg_view view_id) {
    assert(cast(i64, _sg.valid));
    sg_gl_view_info res;
    _sg_view_t* view = _sg_lookup_view(view_id.id);
    if view != null {
        for u64 i = 0; i < cast(u64, SG_NUM_INFLIGHT_FRAMES); i++ {
            res.tex_view[i] = view.gl.tex_view[i];
        }
        res.msaa_render_buffer = view.gl.msaa_render_buffer;
        res.msaa_resolve_frame_buffer = view.gl.msaa_resolve_frame_buffer;
    }
    return res;
}
/*
    sokol_glue.h -- glue helper functions for sokol headers

    Project URL: https://github.com/floooh/sokol

    Do this:
        #define SOKOL_IMPL or
        #define SOKOL_GLUE_IMPL
    before you include this file in *one* C or C++ file to create the
    implementation.

    ...optionally provide the following macros to override defaults:

    SOKOL_ASSERT(c)     - your own assert macro (default: assert(c))
    SOKOL_GLUE_API_DECL - public function declaration prefix (default: extern)
    SOKOL_API_DECL      - same as SOKOL_GLUE_API_DECL
    SOKOL_API_IMPL      - public function implementation prefix (default: -)

    If sokol_glue.h is compiled as a DLL, define the following before
    including the declaration or implementation:

    SOKOL_DLL

    On Windows, SOKOL_DLL will define SOKOL_GLUE_API_DECL as __declspec(dllexport)
    or __declspec(dllimport) as needed.

    OVERVIEW
    ========
    sokol_glue.h provides glue helper functions between sokol_gfx.h and sokol_app.h,
    so that sokol_gfx.h doesn't need to depend on sokol_app.h but can be
    used with different window system glue libraries.

    PROVIDED FUNCTIONS
    ==================

    sg_environment sglue_environment(void)

        Returns an sg_environment struct initialized by calling sokol_app.h
        functions. Use this in the sg_setup() call like this:

        sg_setup(&(sg_desc){
            .environment = sglue_environment(),
            ...
        });

    sg_swapchain sglue_swapchain(void)

        Returns an sg_swapchain struct initialized by calling sokol_app.h
        functions. Use this in sg_begin_pass() for a 'swapchain pass' like
        this:

        sg_begin_pass(&(sg_pass){ .swapchain = sglue_swapchain(), ... });

    LICENSE
    =======
    zlib/libpng license

    Copyright (c) 2018 Andre Weissflog

    This software is provided 'as-is', without any express or implied warranty.
    In no event will the authors be held liable for any damages arising from the
    use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:

        1. The origin of this software must not be misrepresented; you must not
        claim that you wrote the original software. If you use this software in a
        product, an acknowledgment in the product documentation would be
        appreciated but is not required.

        2. Altered source versions must be plainly marked as such, and must not
        be misrepresented as being the original software.

        3. This notice may not be removed or altered from any source
        distribution.
*/

private {
sg_pixel_format _sglue_to_sgpixelformat(sapp_pixel_format fmt) {
    switch fmt {
        case SAPP_PIXELFORMAT_NONE: {
            return SG_PIXELFORMAT_NONE;
        }
        case SAPP_PIXELFORMAT_RGBA8: {
            return SG_PIXELFORMAT_RGBA8;
        }
        case SAPP_PIXELFORMAT_SRGB8A8: {
            return SG_PIXELFORMAT_SRGB8A8;
        }
        case SAPP_PIXELFORMAT_BGRA8: {
            return SG_PIXELFORMAT_BGRA8;
        }
        case SAPP_PIXELFORMAT_SBGR8A8: {
            return SG_PIXELFORMAT_SBGR8A8;
        }
        case SAPP_PIXELFORMAT_RGBA16F: {
            return SG_PIXELFORMAT_RGBA16F;
        }
        case SAPP_PIXELFORMAT_DEPTH_STENCIL: {
            return SG_PIXELFORMAT_DEPTH_STENCIL;
        }
        case SAPP_PIXELFORMAT_DEPTH: {
            return SG_PIXELFORMAT_DEPTH;
        }
        default: {
            assert(cast(i64, false));
            return SG_PIXELFORMAT_NONE;
        }
    }
}
}

sg_environment sglue_environment() {
    sg_environment res;
    sapp_environment env = sapp_get_environment();
    res.defaults.color_format = _sglue_to_sgpixelformat(env.defaults.color_format);
    res.defaults.depth_format = _sglue_to_sgpixelformat(env.defaults.depth_format);
    res.defaults.sample_count = env.defaults.sample_count;
    res.metal.device = env.metal.device;
    res.d3d11.device = env.d3d11.device;
    res.d3d11.device_context = env.d3d11.device_context;
    res.wgpu.device = env.wgpu.device;
    res.vulkan.instance = env.vulkan.instance;
    res.vulkan.physical_device = env.vulkan.physical_device;
    res.vulkan.device = env.vulkan.device;
    res.vulkan.queue = env.vulkan.queue;
    res.vulkan.queue_family_index = env.vulkan.queue_family_index;
    return res;
}

sg_swapchain sglue_swapchain() {
    sg_swapchain res;
    sapp_swapchain sc = sapp_acquire_swapchain();
    res.invalid = sc.invalid;
    if res.invalid != 0 {
        return res;
    }
    res.width = sc.width;
    res.height = sc.height;
    res.sample_count = sc.sample_count;
    res.color_format = _sglue_to_sgpixelformat(sc.color_format);
    res.depth_format = _sglue_to_sgpixelformat(sc.depth_format);
    res.metal.current_drawable = sc.metal.current_drawable;
    res.metal.depth_stencil_texture = sc.metal.depth_stencil_texture;
    res.metal.msaa_color_texture = sc.metal.msaa_color_texture;
    res.d3d11.render_view = sc.d3d11.render_view;
    res.d3d11.resolve_view = sc.d3d11.resolve_view;
    res.d3d11.depth_stencil_view = sc.d3d11.depth_stencil_view;
    res.wgpu.render_view = sc.wgpu.render_view;
    res.wgpu.resolve_view = sc.wgpu.resolve_view;
    res.wgpu.depth_stencil_view = sc.wgpu.depth_stencil_view;
    res.vulkan.render_image = sc.vulkan.render_image;
    res.vulkan.render_view = sc.vulkan.render_view;
    res.vulkan.resolve_image = sc.vulkan.resolve_image;
    res.vulkan.resolve_view = sc.vulkan.resolve_view;
    res.vulkan.depth_stencil_image = sc.vulkan.depth_stencil_image;
    res.vulkan.depth_stencil_view = sc.vulkan.depth_stencil_view;
    res.vulkan.render_finished_semaphore = sc.vulkan.render_finished_semaphore;
    res.vulkan.present_complete_semaphore = sc.vulkan.present_complete_semaphore;
    res.gl.framebuffer = sc.gl.framebuffer;
    return res;
}
private { u32 _sg_gl_create_view__gl_draw_buf = 0x8CE0; }

// sokol_app backend for WebGL2 on the web.

// Staged next to the emitted .wasm and served by `minc run --target wasm`.
// --- Host helpers (provided by verminc's browser host) ---
extern "sapp" i32  sapp_host_width();
extern "sapp" i32  sapp_host_height();
extern "sapp" i32  sapp_host_dpi();   // devicePixelRatio * 1000
extern "sapp" void sapp_host_request_quit();
extern "sapp" i32  sapp_host_quit_pending();
extern "sapp" void sapp_host_log(u8* msg, i32 len);

// Entry point sapp_run dispatches into. The host owns the canvas size
// and creates the WebGL context; JS drives the frame loop through the
// exports below.
void _sapp_emsc_run(sapp_desc* desc) {
    _sapp_init_state(desc);
    _sapp.fullscreen = false;   // cannot start fullscreen on the web
    // The host reports the canvas drawing-buffer size in native pixels:
    // that is the framebuffer. window_* is the logical CSS size
    // (framebuffer / dpr), and sapp_dpi_scale() reports dpr.
    f64 dpr = cast(f64, sapp_host_dpi()) / 1000.0;
    if dpr <= 0.0 { dpr = 1.0; }
    f64 w = cast(f64, sapp_host_width());
    f64 h = cast(f64, sapp_host_height());
    _sapp.dpi_scale = cast(f32, dpr);
    _sapp.framebuffer_width = cast(i32, w);
    _sapp.framebuffer_height = cast(i32, h);
    _sapp.window_width = cast(i32, w / dpr);
    _sapp.window_height = cast(i32, h / dpr);
    _sapp.valid = true;
    // init_cb is not called here; _sapp_frame() runs it on the first frame.
    return;
}

// --- No-ops: fullscreen, cursors, clipboard, file drops ---
// Unavailable in the browser until wired through the JS host.
void _sapp_emsc_toggle_fullscreen() { return; }
void _sapp_emsc_update_cursor(sapp_mouse_cursor cursor, bool shown) { return; }
extern "sapp" void sapp_js_lock_mouse(i32 lock);
void _sapp_emsc_lock_mouse(bool lock) {
    // Pointer Lock; the locked state arrives via the pointerlockchange
    // event (_sapp_wasm_event_mouse_locked).
    if lock { sapp_js_lock_mouse(1); }
    else    { sapp_js_lock_mouse(0); }
    return;
}
export void _sapp_wasm_event_mouse_locked(i32 locked) {
    _sapp.mouse.locked = locked != 0;
}
bool _sapp_emsc_make_custom_mouse_cursor(sapp_mouse_cursor cursor, sapp_image_desc* desc) { return false; }
void _sapp_emsc_destroy_custom_mouse_cursor(sapp_mouse_cursor cursor) { return; }
void _sapp_emsc_set_clipboard_string(u8* str_var) { return; }
extern "sapp" void sapp_js_set_favicon(i32 w, i32 h, u8* pixels);
void _sapp_emsc_set_icon(sapp_icon_desc* desc, i32 num_images) {
    // Best 16x16 candidate becomes the page favicon.
    i32 idx = _sapp_image_bestmatch(desc.images, num_images, 16, 16);
    sapp_image_desc* img = &desc.images[0] + idx;
    sapp_js_set_favicon(img.width, img.height, cast(u8*, img.pixels.ptr));
    return;
}
u32 sapp_js_dropped_file_size(i32 index) { return 0; }
void sapp_js_fetch_dropped_file(i32 index, fn(sapp_html5_fetch_response*): void callback, void* ptr, i64 size, void* user_data) { return; }
void _sapp_emsc_invoke_fetch_cb(i32 index, bool success, i32 error_code, fn(sapp_html5_fetch_response*): void callback, i32 status, void* ptr, i64 size, void* user_data) { return; }

// --- Frame loop and DOM events, driven from JS ---
// The host calls _sapp_wasm_frame once per animation frame, passing the
// requestAnimationFrame timestamp in milliseconds. That timestamp is the
// clock source: the web has no monotonic-clock backend.
export void _sapp_wasm_frame(f64 time_ms) {
    if !_sapp.valid { return; }
    _sapp_timing_update(&_sapp.timing, time_ms / 1000.0);
    _sapp_frame();
    if _sapp.quit_requested != 0 {
        _sapp_init_event(SAPP_EVENTTYPE_QUIT_REQUESTED);
        _sapp_call_event(&_sapp.event);
        if _sapp.quit_requested != 0 { _sapp.quit_ordered = true; }
    }
    if _sapp.quit_ordered != 0 {
        _sapp_call_cleanup();
        _sapp.valid = false;
        sapp_host_request_quit();
    }
}

export void _sapp_wasm_event_mouse_move(f32 x, f32 y, f32 mx, f32 my, u32 modifiers) {
    if !_sapp_events_enabled() { return; }
    if _sapp.mouse.locked {
        // Cursor frozen under Pointer Lock; deltas come from movementX/Y.
        _sapp.mouse.dx = mx;
        _sapp.mouse.dy = my;
    } else {
        _sapp.mouse.dx = x - _sapp.mouse.x;
        _sapp.mouse.dy = y - _sapp.mouse.y;
        _sapp.mouse.x = x;
        _sapp.mouse.y = y;
    }
    _sapp.mouse.pos_valid = true;
    _sapp_init_event(SAPP_EVENTTYPE_MOUSE_MOVE);
    _sapp.event.modifiers = modifiers;
    _sapp_call_event(&_sapp.event);
}

export void _sapp_wasm_event_mouse_button(i32 down, i32 button, f32 x, f32 y, u32 modifiers) {
    if !_sapp_events_enabled() { return; }
    _sapp.mouse.x = x;
    _sapp.mouse.y = y;
    _sapp.mouse.pos_valid = true;
    if down != 0 { _sapp_init_event(SAPP_EVENTTYPE_MOUSE_DOWN); }
    else         { _sapp_init_event(SAPP_EVENTTYPE_MOUSE_UP); }
    _sapp.event.mouse_button = cast(sapp_mousebutton, button);
    _sapp.event.modifiers = modifiers;
    _sapp_call_event(&_sapp.event);
}

export void _sapp_wasm_event_mouse_scroll(f32 sx, f32 sy, u32 modifiers) {
    if !_sapp_events_enabled() { return; }
    _sapp_init_event(SAPP_EVENTTYPE_MOUSE_SCROLL);
    _sapp.event.scroll_x = sx;
    _sapp.event.scroll_y = sy;
    _sapp.event.modifiers = modifiers;
    _sapp_call_event(&_sapp.event);
}

export void _sapp_wasm_event_mouse_enter_leave(i32 enter, u32 modifiers) {
    if !_sapp_events_enabled() { return; }
    if enter != 0 { _sapp_init_event(SAPP_EVENTTYPE_MOUSE_ENTER); }
    else          { _sapp_init_event(SAPP_EVENTTYPE_MOUSE_LEAVE); }
    _sapp.event.modifiers = modifiers;
    _sapp_call_event(&_sapp.event);
}

export void _sapp_wasm_event_key(i32 down, i32 keycode, u32 modifiers, i32 repeat) {
    if !_sapp_events_enabled() { return; }
    if down != 0 { _sapp_init_event(SAPP_EVENTTYPE_KEY_DOWN); }
    else         { _sapp_init_event(SAPP_EVENTTYPE_KEY_UP); }
    _sapp.event.key_code = cast(sapp_keycode, keycode);
    _sapp.event.modifiers = modifiers;
    _sapp.event.key_repeat = repeat != 0;
    _sapp_call_event(&_sapp.event);
}

export void _sapp_wasm_event_char(u32 char_code, u32 modifiers, i32 repeat) {
    if !_sapp_events_enabled() { return; }
    _sapp_init_event(SAPP_EVENTTYPE_CHAR);
    _sapp.event.char_code = char_code;
    _sapp.event.modifiers = modifiers;
    _sapp.event.key_repeat = repeat != 0;
    _sapp_call_event(&_sapp.event);
}

export void _sapp_wasm_event_resized(i32 w, i32 h) {
    // w,h are native pixels. The size is updated even before events are
    // enabled; only the RESIZED event itself is gated.
    f64 dpr = cast(f64, sapp_host_dpi()) / 1000.0;
    if dpr <= 0.0 { dpr = 1.0; }
    _sapp.dpi_scale = cast(f32, dpr);
    _sapp.framebuffer_width = w;
    _sapp.framebuffer_height = h;
    _sapp.window_width = cast(i32, cast(f64, w) / dpr);
    _sapp.window_height = cast(i32, cast(f64, h) / dpr);
    if !_sapp_events_enabled() { return; }
    _sapp_init_event(SAPP_EVENTTYPE_RESIZED);
    _sapp_call_event(&_sapp.event);
}


}


// sokol_shader.mc - @shader -> sg_shader bridge
//
// _SOKOL_GLSL_DESC marks targets whose sokol_gfx backend is
// GL-flavored and needs the glsl_* descriptor fields (uniform member
// descriptors, combined-sampler names, storage bindings): linux /
// android / wasm always, and Windows or macOS when the GLCORE backend
// is selected (-D SOKOL_GLCORE, paired with @gpu "opengl" so the
// shader text is GLSL too).
// The default logger for every sokol header: writes one line to stderr
// and aborts on a panic. Build with -D SOKOL_DEBUG to add sokol's
// validation layer, which reports through here.
//
// macOS/iOS use sokol_log.h's own implementation.
private {
    u8* _slog_level_str(u32 level) {
        if level == 0 { return "panic"; }
        if level == 1 { return "error"; }
        if level == 2 { return "warning"; }
        return "info";
    }

    // Append a NUL-terminated string, truncating at cap.
    i32 _slog_put(u8* dst, i32 pos, i32 cap, u8* s) {
        if s == null { return pos; }
        i32 i = 0;
        while *(s + i) != 0 && pos < cap - 1 {
            *(dst + pos) = *(s + i);
            pos = pos + 1;
            i = i + 1;
        }
        return pos;
    }

    i32 _slog_put_u32(u8* dst, i32 pos, i32 cap, u32 v) {
        u8[12] tmp;
        i32 n = 0;
        if v == 0 { tmp[0] = cast(u8, 48); n = 1; }
        while v > 0 {
            tmp[n] = cast(u8, 48 + cast(i32, v % cast(u32, 10)));
            n = n + 1;
            v = v / cast(u32, 10);
        }
        while n > 0 && pos < cap - 1 {
            n = n - 1;
            *(dst + pos) = tmp[n];
            pos = pos + 1;
        }
        return pos;
    }
}

when os(windows) || os(linux) || os(wasm) || os(android) {
    void slog_func(u8* tag, u32 log_level, u32 log_item, u8* message, u32 line_nr, u8* filename, void* user_data) {
        ignore user_data;
        u8[512] line;
        u8* buf = line;
        i32 cap = 512;
        i32 n = 0;
        if tag != null {
            n = _slog_put(buf, n, cap, "[");
            n = _slog_put(buf, n, cap, tag);
            n = _slog_put(buf, n, cap, "]");
        }
        n = _slog_put(buf, n, cap, "[");
        n = _slog_put(buf, n, cap, _slog_level_str(log_level));
        n = _slog_put(buf, n, cap, "][id:");
        n = _slog_put_u32(buf, n, cap, log_item);
        n = _slog_put(buf, n, cap, "] ");
        if filename != null {
            n = _slog_put(buf, n, cap, filename);
            n = _slog_put(buf, n, cap, ":");
            n = _slog_put_u32(buf, n, cap, line_nr);
            n = _slog_put(buf, n, cap, ": ");
        }
        // The message text is only compiled in under SOKOL_DEBUG; the
        // item id above identifies it either way.
        n = _slog_put(buf, n, cap, message);
        n = _slog_put(buf, n, cap, "\n");
        ignore write(stderr(), buf, n);
        if log_level == 0 { __sokol_abort(); }
        return;
    }
}

// sg_logger wrapping sokol's default logger
sg_logger sglue_logger() {
    sg_logger log;
    log.func = slog_func;
    return log;
}

// The copyable source has additional generated-ShaderMeta helpers. This local WebGL build
// uses explicit sg_shader_desc GLSL sources, so those compiler-specific helpers are omitted.

// sokol entry - main() functions.
//
// Define SOKOL_NO_ENTRY (`@define "SOKOL_NO_ENTRY"` before the import, or
// -DSOKOL_NO_ENTRY) to keep these out and supply your own main(). 
when !defined(SOKOL_NO_ENTRY) {
    when os(wasm) {
        // sapp_run stores the desc + runs init; the JS host drives the frame
        // loop via the seam's exported _sapp_wasm_frame.
        i32 main() {
            sapp_desc desc = sokol_main();
            sapp_run(&desc);
            return 0;
        }
    }
    when os(linux) {
        i32 main() {
            sapp_desc desc = sokol_main();
            sapp_run(&desc);
            return 0;
        }
    }
    when os(windows) {
        i32 main() {
            SetConsoleOutputCP(CP_UTF8);   // UTF-8 console (window title / prints)
            sapp_desc desc = sokol_main();
            sapp_run(&desc);
            return 0;
        }
    }
    when os(macos) {
        // Bring up the ObjC bridge + Cocoa/Metal frameworks before sapp_run.
        i32 main() {
            if sokol_macos_boot() != 0 { return 1; }
            sapp_desc desc = sokol_main();
            sapp_run(&desc);
            return 0;
        }
    }
    when os(ios) {
        // Register the ObjC scene-delegate / view classes before sapp_run; the
        // iOS body's _sapp_ios_run hands off to UIApplicationMain.
        i32 main() {
            if sokol_ios_boot() != 0 { return 1; }
            sapp_desc desc = sokol_main();
            sapp_run(&desc);
            return 0;
        }
    }
}
