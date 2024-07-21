#include <Phoenix.h>

class Sandbox : public Phoenix::Application {

public:
	Sandbox() {

	}

	~Sandbox() {

	}
};

void main() {

	Sandbox* sandbox = new Sandbox();
	sandbox->Run();
	delete sandbox;

}