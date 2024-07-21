#pragma once

#ifdef PHOENIX_PLATFORM_WINDOWS

// Function that is defined somewhere else that returns application (Sandbox.cpp)
extern Phoenix::Application* Phoenix::CreateApplication();


int main(int argc, char** argv) {
	auto app = Phoenix::CreateApplication();
	app->Run();
	delete app;

}

#endif