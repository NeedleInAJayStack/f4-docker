This is a dockerized version of the F4 application. At this point, it is primarily used for running F4 on a Mac.

## Setup

1. XQuartz:
   1. Install XQuartz: `brew install --cask xquartz`
   2. Add localhost to xhost: `xhost +localhost`
   3. Restart your machine (YOU MUST DO THIS!)
   4. Open XQuartz and go to Settings/Security. Disable "Authenticate connections" and enable "Allow connections from network clients"
   5. Quit XQuartz and re-open
2. Docker:
   1. Clone this repo
   2. Create a `.env` file with the following variables: `WORKSPACE`, `INTERPRETERS`
   3. Build and start the image: `docker-compose up`