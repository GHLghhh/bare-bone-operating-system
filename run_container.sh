# The script is modified from https://github.com/NVIDIA/object-detection-tensorrt-example
# to share display with docker container
echo "Setting envivonment variables for display from docker container" 
xhost +local:docker
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

# Start the docker container
echo "Starting docker container" 
docker run -it -v `pwd`/src:/workspace/src -e DISPLAY=$DISPLAY -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH ${1:-ghlghhh/os-env:base}