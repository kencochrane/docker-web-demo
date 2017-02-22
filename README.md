# Demo
This is just a simple docker image that is used in a few demos.

It will start a web server on port 80, and when you connect to `/` it will show the container hostname.

This is good for showing that load balancers are working since it should show different container hostnames every time the page is reloaded. Assuming there is more than one container, and they are behind a load balancer.

## Building

Running the build script will generate a manager binary in the /bin directory.
$ ./build.sh

The `build.sh` script will call the `Dockerfile.build` to build the image, and then use that image to build the web binary. It will then copy the binary out of the container and into `/bin`

## usage
This will run on port 80
$ ./entry.sh

## Dependencies
- None at the moment

## How this is used
The docker file (`Dockerfile.build`) will pull in the `bin/web` binary run the binary on port 80.
