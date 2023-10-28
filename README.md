This is a containerized version of the [F4 application](https://github.com/xored/f4). At this point, it has only been tested for running F4 on MacOS.

It works by running a Linux container with F4 installed and performing an X11 forward so that the graphical application can be displayed in the user's window system, regardless of the operating system they are running.

## Setup

1. XQuartz:
   1. Install XQuartz: `brew install --cask xquartz`
   2. Add localhost to xhost: `xhost +localhost`
   3. Restart your machine (YOU MUST DO THIS!)
   4. Open XQuartz and go to Settings/Security. Disable "Authenticate connections" and enable "Allow connections from network clients"
   5. Quit XQuartz and re-open
2. Docker:
   1. Clone this repo
   2. Create a `.env` file in the resulting directory with the following variables set:
     - `WORKSPACE`: A directory on the local filesystem that should be used at the F4 workspace. This is injected into the docker image filesystem
     - `INTERPRETERS`: A directory on the local filesystem that contains alternate Fantom interpreters that F4 can use (by selecting in Preferences). This is especially useful for SkySpark development.
   3. Build and start the image: `docker-compose up`
