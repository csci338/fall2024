---
layout: assignment-two-column
title: "Intro to Docker"
type: lab
draft: 1
points: 6
abbreviation: Lab 3
show_schedule: 1
num: 3
start_date: 2023-09-07
due_date: 2024-09-10

---

## 1. Background
* <a href="https://learn.microsoft.com/en-us/training/modules/intro-to-docker-containers/" target="_blank">What is Docker?</a>

## 2. Install Docker
### Mac
You can either install the binary from the Docker website or use `brew` (brew instructions below):

```shell
brew install --cask docker  # use "cask" b/c it's a system-level package
# verify version:
docker --version
```

Next, run the Docker service by looking for `Docker.app` using Spotlight (magnifying glass). Once it starts, go back to the Terminal and issue:

```shell
# install hello world container:
docker run hello-world
```

You should see that it outputs a message similar to the one shown below to the command line:

{:#f1}
#### Figure 1
Docker output after running `docker run hello-world`:

```shell
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
70f5ac315c5a: Pull complete 
Digest: sha256:dcba6daec718f547568c562956fa47e1b03673dd010fe6ee58ca806767031d1c
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

### Windows
Follow the instructions on Microsoft's website: <a href="https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers#install-docker-desktop" target="_blank">https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers#install-docker-desktop</a>. 

Then, activate WSL and type the following into your WSL shell:

```shell
docker run hello-world
```

You should see output similar to the output above ([Figure 1](#f1))

## 3. FAQs
### What is a container?
A container is an isolated process (process that can't interact w/any other parts of your OS) that runs on a host machine (i.e., your laptop).
* It can run on any machine (and be easily ported to the cloud)
* It's isolated from any other containers and processes
* Created from "images" (OS configurations), and can be stopped, started, or deleted
* Source: <a href="https://docs.docker.com/get-started/" target="_blank">https://docs.docker.com/get-started/</a>

### What is an image?
"A running container uses an isolated filesystem. This isolated filesystem is provided by an image, and the image must contain everything needed to run an application - all dependencies, configurations, scripts, binaries, etc. The image also contains other configurations for the container, such as environment variables, a default command to run, and other metadata."

* Source: <a href="https://docs.docker.com/get-started/" target="_blank">https://docs.docker.com/get-started/</a>

### What is a Dockerfile?
"A `Dockerfile` is simply a text-based file with no file extension that contains a script of instructions. Docker uses this script to build a container image." Example of a `Dockerfile`:

```shell
# syntax=docker/dockerfile:1

# the base image (you're augmenting this image)
FROM node:18-alpine             
WORKDIR /app
COPY . .

# yarn is yet another package manager for installing dependencies
RUN yarn install --production  

# runs this command on startup
CMD ["node", "src/index.js"]    
EXPOSE 3000
```

**Important**: In the example above, it is assumed that a Node project already exists with `src/index.js` file and a `package.json` file with a set of Node dependencies. See the tutorial (link below) for more instructions on that.

* Source: <a href="https://docs.docker.com/get-started/02_our_app/" target="_blank">https://docs.docker.com/get-started/02_our_app/</a>

### How do I create a Dockerfile?
Check out the <a href="https://docs.docker.com/engine/reference/builder/" target="_blank">Dockerfile reference</a>. Note that some of these configuration settings are a little complicated, but over time, after going through various tutorials, you will get more exposure to what the different commands do.

### How do you build an image?
You can build an image using a `Dockerfile`. In the context of the Dockerfile shown above, issuing this command will build the image:

```shell
docker build -t getting-started .
```

* The `-t` flag tags the image: "Assign the tag "getting-started" to the image I'm building."
* The `.` at the end of the docker build command tells Docker that it should look for the `Dockerfile` in the current directory.
* Source: <a href="https://docs.docker.com/get-started/02_our_app/" target="_blank">https://docs.docker.com/get-started/02_our_app/</a>

### How do you start an App Container?
Once you've built an image, you can run it using the `docker run` command (where you specify the name of your image). There are many optional flags you can use with the `run` command (e.g. `-d`, `-p`, but the only required argument is the name of the image you want to run:

```shell
docker run -dp 127.0.0.1:3000:3000 getting-started
```

* `-d` flag means **detatch** -- "run in the background and don't tie up my command line".
* `-p` flag means **publish**, which creates a port mapping between the host and the container. If the process is running on port 3000 on the host container, forward that to port 3000 on the host computer (i.e., your laptop) so that the process is accessible to the host computer's services (browser, command line, etc.).
* After a few seconds, open your web browser to <a href="" target="_blank">http://localhost:3000</a>. You should see your app.

### Docker Cheatsheet
This just lists the commands we'll be using in today's tutorial:

#### Images

| **docker images** | Lists available images |
| **docker rmi `<your-image-id>`** | Removes an image |
| **<a href="https://hub.docker.com/search?q=&type=image&image_filter=official" target="_blank">Docker Hub Image registry</a>** | Shows you all the available pre-defined images |

#### Containers

| **docker build .** | Builds a container from a Dockerfile in the current directory (`.`) | 
| **docker build -t `<name-of-container>` .** | Builds a container from a Dockerfile in the current directory (`.`) and tags it with the name `my-container` | 
| **docker run `<name-of-container>`** | Creates and runs a new container from an image (including images in the <a href="https://hub.docker.com/search?q=&type=image&image_filter=official" target="_blank">Docker Hub Image registry</a>) |
| **docker ps** | Lists Docker processes that are currently running |
| **docker stop `<pid>`** | Stops Docker container from running (by process id) | 
| **docker start `<pid>`** | Starts Docker container from running (by process id) | 
| **docker rm `<pid>`** | Deletes Docker container from running (by process id) | 



## 4. Your Tasks

### 4.1. Complete Steps 1-3 of the "Get Started" Tutorial
For today's lab, you will complete Parts 1-3 of the Getting Started tutorial: <a href="https://docs.docker.com/get-started/" target="_blank">https://docs.docker.com/get-started/</a>. 

#### Before you begin, a few notes:

* Make sure that your Docker App is running.
* All of your work will be done within the **class-exercises-fall2024** repo inside your directory.
* Pull down the latest from `main` before you begin the lab:
    * `git checkout main`
    * `git pull`
* Create a new branch called `lab03-your-username`. 
    * Example: `git checkout -b lab03-vanwars`
* When it's time to issue the `git clone https://github.com/docker/getting-started-app.git` command, issue it inside of *your directory*. For instance:
    * `cd class-exercises-fall2024/vanwars`
    * `git clone https://github.com/docker/getting-started-app.git`
* After you've cloned, delete the **`class-exercises-fall2024/<your-username>/getting-started-app/.git`** folder (so that you don't have a repo inside a repo):
    * `cd getting-started-app`
    * `rm -rf .git`
* Other tips:
    * Take your time, go slow, and make sure you understand what each of the commands and flags does
    * If you encounter an error, use the Docker GUI to help you diagnose the problem

### 4.2. Create a .dockerignore file
A `.dockerignore` file is a configuration file that describes files and directories that you want to exclude when building a Docker image. Used for excluding large files / directories that could be installed via package manager and/or sensitive information.

After completing steps 1-3, create a `.dockerignore` file and add the following files:

```shell
.DS_Store
node_modules
```

### 4.3. Submit
To submit this lab:
1. Stage, commit, and push your **lab03-your-username** branch to GitHub. The branch should include all of the files from your `getting-started-app`, as well as the `.dockerignore` file you just created.
2. Create a PR.
4. On the course moodle, submit a screenshot of your running TODO app on port 5000.
3. Once your PR has been approved, you can rebase / merge your changes into the main branch.

