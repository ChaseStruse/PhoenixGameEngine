#pragma once

#ifdef PHOENIX_PLATFORM_WINDOWS

// Function that is defined somewhere else that returns application (Sandbox.cpp)
extern Phoenix::Application* Phoenix::CreateApplication();


int main(int argc, char** argv) {
	Phoenix::Log::Init();
	Phoenix::Log::GetCoreLogger()->warn("Initialized Log");
	Phoenix::Log::GetClientLogger()->warn("Initialized CLient Log");

	auto app = Phoenix::CreateApplication();
	app->Run();
	delete app;

}

#endif