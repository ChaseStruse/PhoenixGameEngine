#pragma once

#ifdef PHOENIX_PLATFORM_WINDOWS

// Function that is defined somewhere else that returns application (Sandbox.cpp)
extern Phoenix::Application* Phoenix::CreateApplication();


int main(int argc, char** argv) {
	Phoenix::Log::Init();
	PHOENIX_CORE_INFO("Initialized Log");
	PHOENIX_CORE_WARN("Initialized {0}", "Client Log");

	auto app = Phoenix::CreateApplication();
	app->Run();
	delete app;

}

#endif