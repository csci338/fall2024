---
layout: assignment-two-column
title: "Intro to Docker"
type: lab
draft: 1
points: 6
abbreviation: Lab 4
show_schedule: 1
num: 4
start_date: 2024-09-12
due_date: 2024-09-15

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



# Semmy's Lab
# Lab 4 -- Docker and Poetry

The goals with this lab are as follows:

1. Let's experiment with Docker!
2. Practice with adding and leveraging dependencies.
3. We'll gain some more experience with Python.

## Getting Started

You will do this lab entirely on your own machine (no logging into Arden).

Your `software-engineering` fork and repository is probably a mess at
this point, so let's start fresh. You can either delete your existing
clone of the repository, or simply rename it to something else. If
you'd like to be on the safer side, you can just rename it using the
`mv` (move) command:

```
$ mv software-engineering software-engineering-OLD
```

To delete it, first make sure you're in the right directory that
contains `software-engineering` and then you can delete it with `rm`
(remove):

```
$ rm -rf software-engineering
```

The `-rf` means "recursively force." It's generally a bad idea to do
that unless you're 100% sure you are okay with deleting everything in
the specified directory.

Now let's reclone the repository. If your fork is in good shape and
can be synced, then do so now and clone it. If your fork is not in
good shape, you can either delete it and refork it, or you can just
clone the main repository. Either way, Make sure you use the `git`
protocol, not `https`.

Once you have a fresh new copy of the repository, go into the
`labs/lab4` directory and create a new branch. Don't forget this step!
:P

Now you're ready to complete the rest of this lab. As usual, you'll
write your answers (including the answers to "What do you see?") in an
`answers.md` file.


## Docker Experimentation

First, let's run the Docker `getting-started` tutorial from the
command line.

```
$ docker run -dp 3000:80 docker/getting-started
2fa6e0549bc94bfa20132d5ccf5beb2e1ed19a3b712055b21990ae358ac8677d
```

Your container is running, and we can prove that by going to
[http://localhost:3000](http://localhost:3000), where you should see
the tutorial running. You can also list all running containers.

```
$ docker container ls
CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS         PORTS                               NAMES
f2a163e91eb0   docker/getting-started   "/docker-entrypoint.…"   4 seconds ago   Up 3 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   frosty_elion
```

Your entries might looks slightly different than mine. Let's try to run it again.

```
$ docker run -d -p 3000:80 docker/getting-started
```

What do you see? You should see an error that mentions the port (3000)
is already allocated. So let's try something slightly different.

```
$ docker run -d -p 3001:80 docker/getting-started
```

Note that we changed the `-p` argument from `3000:80` to
`3001:80`. The `-p` specifies port-forwarding from the host computer
to the container. In this case, we're saying "proxy all network
traffic on port 3001 of the host computer to port 80 on this
container."

You can confirm it's working by going to
[http://localhost:3001](http://localhost:3001).

Now try to run a third copy of the container running on port
8000. Confirm it works.

Let's take a look at your running containers. What do you see?

Note every container has a `CONTAINER ID` and a `NAME`. Those values
are interchangeable, but the `NAME` makes it easy to reference the
container in subsequent commands. Let's kill the container running on
port 3000.

```
$ docker container kill [CONTAINER ID]
```

Next, kill the container running on port 8000, but this time use the
name. Now list your running containers again. What do you see?

You can see all of your containers, including those that aren't
running by adding the `-a` flag to the `docker container ls`
command. You will probably see several there. You can clean them up by
running

```
$ docker system prune
```

How much space was reclaimed? Docker images and containers take up
quite a bit of space, so you'll probably want to run this from time to
time. Let's go ahead and kill the last running container (on port 80).

## Python in Docker

Docker containers typically have a start command and run until they
are finished. Try it.

```
$ docker run python:latest
```

Nothing. Let's try running an explicit command.

```
$ docker run python:latest python --version
Python 3.11.2
```

In this case, we added a command to the end of our run script. We can
also run our containers _interactively_. We just need to add the `-it`
flag. (Technically that's two flags, one for _interactive_ and one for
_tty_). This time we'll run Python 2.7.

```
$ docker run -it python:2.7
Python 2.7.18 (default, Apr 20 2020, 19:27:10)
[GCC 8.3.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> print "hello world"
hello world
>>> exit()
```

Now try running the same commands in `python:latest`. What do you see?
(Hint: you should get an error because Python 3+ requires parens in
`print` statements).

Now let's try creating a program and running it in the container. Open
your text editor and let's create the classic Hello World program in
Python. Save it in a file called "hello.py".

```
def main():
    print("hello world")

if __name__ == "__main__":
    main()
```

First, let's run the program directly on your machine. First, what
version of python is installed on your machine? (Hint: see the command
above)

```
$ python hello.py
hello world!
```

Now let's try to run it in docker in the natural way.

```
$ docker run python:latest python hello.py
```

What do you see? The container can't seem to find the file, but it's
right there in the directory! What gives?

The container runs on your system, but is isolated from it. That means
it can't access the file system unless you specifically grant it
access. In order to do so, we need to mount our local directory
somewhere on the container. The easiest way to do that is with the
`-v` (volume) flag.

It's similar to the `-p` flag we described above which forwards ports
from your host machine to the container. The `-v` flag mounts a
directory on your host's filesystem to a directory on your
container. Let's try it.

```
$ docker run -v .:/app python:latest python /app/hello.py
```

Take a moment to look at that command before you run it. Note that
we're mapping the current directory (`.`) to the directory (`/app`) on
the container. When we run the python command, we need to be explicit
about the location of the file /on the container/.

## Poetry

Instead of running single commands, let's actually login to our
container and experiment interactively.

```
$ docker run -v .:/app -it python:latest bash
```

What command are we running in the container?

Now we're logged into the container and can look around the
filesystem. Notice what happens when you list the contents of the
directory.

```
root@0c759ff2bc79:/# ls
app  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```

Our `/app` directory is there. Go into that directory and take a
look. You should be able to see your the files on the host machine!

We're going to use Poetry to set up a new Python project. First, let's
install Poetry on your container.

```
$ pip install poetry
```

You may see some warnings about running `pip` as root. Don't worry,
we'll get back to that.

Now we'll initialize a Poetry project in our repository.

```
$ poetry init
```

Follow the prompts (don't define dependencies at this time), then list
the contents of the directory. What do you see?

Poetry tracks dependencies and other project-related settings in a
`pyproject.toml` file. What's the equivalent file for JavaScript?

Use the `cat` command to print the contents of your `pyproject.toml`
file.

Let's add a dependency. We'll add the `requests` python module which
will allow us to make http requests.

```
$ poetry add requests
```

Use the `cat` command to print the contents of your `pyproject.toml` file. How did it change?

Let's refactor our python script. Modify it so it looks like this.

```
import requests


def main():
    print("hello world")
    result = requests.get("https://www.example.com")
    print(result.text)


if __name__ == "__main__":
    main()
```

Run this script on your container. What do you see?

That's right, there's an error. Because Poetry creates a virtual
environment, the `requests` module is not directly available. Instead
you have to run the script via Poetry to run it in the appropriate
virtual environment.

```
# poetry run python hello.py
```

In the Project 1 backend, we used a curl script to make http requests
when testing our server. You could rewrite that using Python now if
you'd like! Instead of `result.text` you could use `result.json()`
instead! Don't do that now, though.

Instead, let's change the code to print the contents of
`https://new.cs.unca.edu` instead. What do you see?

Now we'll use another dependency called
[BeautifulSoup4](https://pypi.org/project/beautifulsoup4/) to parse
the resulting html and pull out all the links.

First, add beautifulsoup4 as a dependency to your Poetry
project. Next, read [the
documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/). It
has some sample code that shows how to print out all the links.

You'll want to add the links as strings to a list, filtering the list
so only the strings that start with `https` remain. After that, you'll
want to fetch the content of all those pages and collect all the links
from those pages. A new Python function will probably be helpful here,
but you can do it without that.

What's the total number of links you've found at the second level?

## Cleaning Up

Let's exit our container. Now list the contents of your directory. You
should see that `pyproject.toml` file and `poetry.lock` file that you
created inside the container. Open it and try to edit it. What
happened!?!

Well your file is read-only because it's owned by root. You can
confirm this by listing the contents of the directory with the `-a`
flag.

```
$ ls -alh
total 40K
drwxr-xr-x. 1 semmy semmy   84 Feb 16 16:14 .
drwxr-xr-x. 1 semmy semmy   32 Feb 16 05:53 ..
-rw-r--r--. 1 semmy semmy  413 Feb 16 16:04 hello.py
-rw-r--r--. 1 root  root   19K Feb 16 15:51 poetry.lock
-rw-r--r--. 1 root  root   305 Feb 16 15:51 pyproject.toml
-rw-r--r--. 1 semmy semmy 9.3K Feb 16 16:14 readme.md
```

This is because your container runs as userid 0, which is root, by
default. So when it creates files on your host fileystem, the file is
owned by that user. Remember the `.env` file we created in the earlier
labs? It's designed to fix this problem. We'll talk about it in more
detail soon.

In the meantime, you can fix this by running the `chown`
command. You'll need to run it with `sudo` since the files are owned
by root. You'll need to replace my name with your username.

```
$ sudo chown semmy:semmy poetry.lock
$ sudo chown semmy:semmy pyproject.toml
```

## Submitting

Push your branch and create a pull request against the main
repository. Add me as a reviewer.