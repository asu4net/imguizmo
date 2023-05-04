project "imguizmo"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.location}/**.h",
        "%{prj.location}/**.cpp"
    }

    removefiles
    {
        "%{prj.location}/example/**.h",
        "%{prj.location}/example/**.cpp",
        "%{prj.location}/vcpkg-example/**.h",
        "%{prj.location}/vcpkg-example/**.cpp"
    }

    includedirs
    {
        "%{IncludeDirs.imgui}"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines "NIT_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:EditorRelease"
        defines "NIT_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:GameRelease"
          defines "NIT_RELEASE"
          runtime "Release"
          optimize "on"
