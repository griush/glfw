output_dir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "off"
	warnings "off"

    targetdir ("bin/" .. output_dir .. "/%{prj.name}")
    objdir ("bin-int/" .. output_dir .. "/%{prj.name}")

    files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/internal.h",
        "src/platform.h",
        "src/mappings.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/platform.c",
        "src/vulkan.c",
        "src/window.c",
        "src/egl_context.c",
        "src/osmesa_context.c",
        "src/null_platform.h",
        "src/null_joystick.h",
        "src/null_init.c",

        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c",
    }

    filter "system:linux"
        pic "on"

        systemversion "latest"
        staticruntime "off"

        files {
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/posix_module.c",
            "src/posix_poll.c",
            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/linux_joystick.c"
        }

        defines { 
            "_GLFW_X11",
            "_CRT_SECURE_NO_WARNINGS",
        }

    filter "system:windows"
        systemversion "latest"
        staticruntime "off"

        files {
            "src/win32_init.c",
            "src/win32_module.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.h",
            "src/win32_time.c",
            "src/win32_thread.h",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
        }

        defines { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS",
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Development"
        runtime "Release"
        symbols "on"
        optimize "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        symbols "off"
