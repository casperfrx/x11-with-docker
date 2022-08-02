# Running GUI applications in Docker containers

Repository with example Dockerfiles and info to run GUI applications in Docker containers.

## Requirements

- [Docker](https://www.docker.com/)
- [Running an X11 server](https://x.org/wiki/)
  - (Free) Windows options:
      - [Xming X Server](https://sourceforge.net/projects/vcxsrv/)
      - [VcXserv X Server (fork of Xming)](https://sourceforge.net/projects/vcxsrv/)
      - To connect remotely, the above require a separate SSH client like
        - [The Windows SSH client](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui#install-openssh-for-windows)
        - [PuTTY](https://www.putty.org/)
      - However, my favorite option is an SSH client with a built-in X server:
        - [MobaXterm](https://mobaxterm.mobatek.net/)
  - MacOS:
    - [XQuartz Project](https://www.xquartz.org/) (No personal experience with it)
  - Linux:
    - Most linux desktop distributions come with an X Server due to their desktop capabilities.

## Usage
First build any of the example Docker images using the Dockerfiles in the root director.

Our goal here is not to implement all the [best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/), 
and are kept simple for its example purposes.

```bash
# Building an Xeyes Docker image
docker build -t xeyes -f xeyes.Dockerfile .
```

Then run the Docker container, making sure to add the required parameters.
```bash
# Build infrastructure
docker run -d --rm \
  -e DISPLAY=$DISPLAY \
  --network host \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  xeyes
```
