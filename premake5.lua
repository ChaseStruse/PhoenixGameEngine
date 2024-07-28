workspace ""
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "PhoenixGameEngine"
	location "PhoenixGameEngine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"PHOENIX_PLATFORM_WINDOWS",
			"PHOENIX_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "PHOENIX_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "PHOENIX_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "PHOENIX_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"PhoenixGameEngine/vendor/spdlog/include",
		"PhoenixGameEngine/src"
	}

	links
	{
		"PhoenixGameEngine"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"PHOENIX_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "PHOENIX_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "PHOENIX_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "PHOENIX_DIST"
		optimize "On"