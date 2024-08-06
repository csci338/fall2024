---
layout: assignment-two-column
title: AsyncIO, FastAPI, and Python
type: lab
draft: 0
points: 6
abbreviation: Lab 5
show_schedule: 1
num: 5
start_date: 2023-09-28
due_date: 2024-10-10
---

> ## Lab 5 Hints
> Resources from Tuesday's class (10/03/2023) to help you get started on Lab 5:
> * [Slides](https://docs.google.com/presentation/d/1VEV7xnxnW_oA-XVCumJL5L7ooYo4DDzqwtWIm3DeMZs/edit?usp=sharing)
> * [Hints directory](https://github.com/csci338/class-exercises-fall2024/tree/main/lab05/src/hints) in the `main` branch.
> * <a href="https://drive.google.com/drive/folders/10fr-iDlzEn2Oh06HdUCvhU73sg2sg32C">Video Walkthrough</a>

## 1. Reading & Reference Materials
* <a href="https://realpython.com/async-io-python/" target="_blank">AsyncIO</a>
* <a href="https://www.pythoncheatsheet.org/cheatsheet/basics" target="_blank">Python Reference</a>
* <a href="https://fastapi.tiangolo.com/" target="_blank">FastAPI</a>

## 2. Setup

### 1. Get the latest files & make a new branch
From within your `class-exercises-fall2024` repo on your local computer:
* Make sure you're at a stopping point and commit all of your current changes.
* Checkout the `main` branch.
* Pull down the lastest updates from the `class-exercises-fall2024`
* You will notice a new folder called `lab05`.
* From the `main` branch, create a new branch called `lab05-your-username` 
    * `git checkout -b lab05-your-username`
* Copy the `lab05` directory into `your-username` folder. When When you’re done, you shoud have a folder structure that looks something like this (within your-username folder):

```
class-exercises-fall2024
...
├── lab04           # original copy
├── lab05           # original copy
...
└── your-username
    ├── README.md
    ├── getting-started-app
    ├── lab04       # your copy -- you may not have this one yet if your changes have not yet been reviewed
    └── lab05       # your copy -- you will edit the files in this folder
```

### 2. Create the Docker image and container
**Credit:** Taken from Hayden's Docker file `README.md`

Make sure docker is installed and the daemon is running.

```bash
docker --version
```

Build the container image. You only need to do this once:

```bash
docker build -t csci338-lab05:latest .
```

#### Run the FastAPI app (Lab 5) using Docker
Run the container using `docker run` followed by any options and the image
name.

The `-d` option runs the container in "Detached" mode, which frees up your terminal.

The `-p 8000:8000` option maps port 8000 on your host machine to the
container's port 8000. Without this option you will not be able to see the app
from the browser on your host machine.

The `-v ./src:/app` option tells docker to map the `./src` directory on your
host machine to the `/app` directory inside the container. This allows you to
edit the code on your machine and see the updates in the container without
restarting the container.

```bash
docker run -d -p 8000:8000 -v ./src:/app csci338-lab05
```

Visit `http://localhost:8000` and behold! The app running in a container!


### 3. Activate the Docker Shell
To run and test individual python files using your Docker container, you need to activate the docker shell, and then run your python files from within the Docker environment. To do this:

List the containers:

```bash
docker container ls -a     
```

Open the Docker shell for your container of interest:

```bash
docker exec -it <container-id> bash
```

Activate the poetry shell (virtual environment) and run the tests:

```bash
poetry shell # activates the python virtual environment
pwd # check that you're in the app directory
```


#### Other Useful Docker Commands (just FYI)

##### Stopping and starting the container
You do not need to run a new container each time you want to work on the code. Instead, you can restart a stopped container using `docker start` followed by the container name or container id. Some helpful commands:

List all of the containers and their ids:

```bash
docker container ls -a
```

Stop the container using `docker stop` followed by the container name or id.

```bash
docker stop <container-id>
```

Start the container using `docker start` followed by the container name or id.

```bash
docker start <container-id>
```

##### Remove old images
When a new version of the Dockerfile is available you will need to build the
image again using `docker build` and run a new container using `docker run`.

After a while you may end up with old versions of the image on your system.
These can take up quite a bit of disk space, so it is good to check every so
often and remove old images from your system.

To show the images on your local machine use `docker image ls`.

```bash
docker image ls
```

Remove any unneeded images using `docker image rm` followed by a list of one or
more image ids or image names.

```bash
docker image rm <image-id>
```

##### Remove old containers
You may want to remove old containers after building and running a new image.
List the containers on your system using `docker container ls`. This will only
show running containers, add the `-a' flag to see stopped containers as well.

```bash
docker container ls -a
```

You can remove any containers you need by using `docker container rm` followed
by container name or id.

```bash
docker container rm <container-id>
```


## 3. AsyncIO Walkthrough

{:.blockquote-no-margin}
> ### Note
> This tutorial was generated with the help of ChatGPT!

The `asyncio` module in Python is a powerful library that provides a framework for writing asynchronous, concurrent code using the `async` and `await` syntax. Asynchronous programming allows you to write programs that can perform multiple tasks concurrently without blocking the main execution thread, making it particularly useful for I/O-bound and network-bound operations.

In this tutorial, we will cover the following topics:

1. [What is asyncio?](#step1)
1. [Basic Concepts](#step2)
1. [Getting Started with asyncio](#step3)
1. [Defining a coroutine with async](#step4)
1. [Running multiple coroutines at once](#step5)
1. [Working with asyncio Event Loops](#step6)
1. [Using asyncio with I/O Operations](#step7)
1. [Error Handling](#step8)
1. [Timeouts and Cancellation](#step9)
1. [Real-World Example: Fetching Multiple URLs](#step10)
1. [Conclusion and Further Resources](#step11)

{:#step1}
### 1. What is asyncio?
asyncio is a Python library that provides a framework for asynchronous programming. It is designed to handle concurrent I/O operations efficiently and is particularly useful for network programming, web scraping, and other tasks where you might otherwise be waiting for data to arrive.

{:#step2}
### 2. Basic Concepts
Before diving into asyncio, it's essential to understand some basic concepts:

* **Coroutines**: Coroutines are special functions defined with the async keyword. They can be paused and resumed, allowing non-blocking execution of tasks.
* **Event Loop**: An event loop is the core component of asyncio. It manages and schedules the execution of coroutines.
* **Tasks**: Tasks represent units of work in asyncio. You can create and manage multiple tasks within an event loop.

{:#step3}
### 3. Getting Started with asyncio
To use `asyncio`, you need Python 3.5 or later. Most modern Python installations come with asyncio built-in, so you don't need to install it separately.

{:#step4}
### 4. Defining a coroutine with async
To create a coroutine, use the `async` keyword:

```python
import asyncio

async def my_coroutine():
    print("Hello, asyncio!")

# To run a coroutine, you need an event loop.
loop = asyncio.get_event_loop()
loop.run_until_complete(my_coroutine())
loop.close()
```

{:.blockquote-no-margin}
> #### Your Turn
> **See demo file:** `lab05/asyncio-exercises/demo1_coroutine.py`


#### To test your python files from Docker, you need to activate the docker shell. To do this:

List the containers:

```bash
docker container ls -a     
```

Open the Docker shell:

```bash
docker exec -it <container-id> /bin/bash
```

Activate the poetry shell (virtual environment) and run the tests:

```bash
poetry shell # activates virtual environment
pwd # check that you're in the app directory
cd asyncio-exercises
python demo1_coroutine.py
```

{:#step5}
### 5. Running multiple asynchronous coroutines at once
You can create and run tasks concurrently:

```python
import asyncio


async def coroutine1():
    await asyncio.sleep(3)
    print("Coroutine 1 completed")
    return 6  # fake data to be returned


async def coroutine2():
    await asyncio.sleep(1.5)
    print("Coroutine 2 completed")
    return 9  # fake data to be returned


async def main():
    result1, result2 = await asyncio.gather(
        coroutine1(), coroutine2()
    )

    # Note that the statements below only execute once both
    # coroutines have executed. This is because of the "await"
    # keyword.
    print(result1)
    print(result2)

loop = asyncio.get_event_loop()
loop.run_until_complete(main())
loop.close()
```

* `asyncio.gather` -- a function in the asyncio library -- allows you to concurrently execute multiple coroutines and collect their results. It's a way to run multiple asynchronous tasks concurrently and wait for all of them to complete.
* `asyncio` also has an event loop that manages coroutine execution.
* `await` -- used if you don't want the next statement in your current execution block to start until your asynchronous task completes.

{:.blockquote-no-margin}
> #### Your Turn
> **See demo file:** `lab05/asyncio-exercises/demo2_two_coroutines.py`


{:#step6}
### 6. Working with asyncio Event Loops
The event loop serves as the core of `asyncio`, managing the execution of asynchronous tasks (also known as coroutines) and coordinating their execution without blocking the main program's execution. 

In the example below, the `sleep` statement doesn't block other coroutines from completing.

```python
import asyncio

async def my_coroutine():
    await asyncio.sleep(1)
    print("Coroutine executed")

loop = asyncio.get_event_loop()
loop.run_until_complete(my_coroutine())
loop.close()
```

`asyncio` encourages an event-driven programming style where you define event handlers (coroutines) that react to specific events, such as incoming network data or user input -- which we will see in more detail when we work with FastAPI.

{:#step7}
### 7. Using asyncio with I/O Operations
`asyncio` excels at I/O-bound operations. Here's an example of reading files asynchronously:

```python
import asyncio
import aiofiles

async def read_file(filename):
    async with aiofiles.open(filename, 'r') as file:
        content = await file.read()
        print(f"Read {len(content)} characters from {filename}")
        print(content)

loop = asyncio.get_event_loop()
loop.run_until_complete(read_file('example.txt'))
loop.close()
```

Certain kinds of tasks -- like File I/O, database calls, and queries over the network -- are slow. Given this, if you execute these kinds of commands serially, where they block other processes, this can be inefficient. Hence, running I/O processes as coroutines conserves resources.

Sidebar:
* You can also do this with threads, but then you have to manage the shared memory (which can be complicated, and is overkill for webdev).

{:.blockquote-no-margin}
> #### Your Turn
> **See demo file:** `lab05/asyncio-exercises/demo3_file_io.py`


{:#step8}
### 8. Error Handling
Use try and except to handle errors within coroutines:

```python
import asyncio

async def my_coroutine():
    try:
        # Your code here
    except Exception as e:
        print(f"An error occurred: {e}")

loop = asyncio.get_event_loop()
loop.run_until_complete(my_coroutine())
loop.close()
```

{:#step9}
### 9. Timeouts and Cancellation
asyncio allows you to set timeouts and cancel tasks:

```python
import asyncio

async def timeout_task():
    try:
        await asyncio.wait_for(long_running_task(), timeout=1)
    except asyncio.TimeoutError:
        print("Task timed out")

loop = asyncio.get_event_loop()
loop.run_until_complete(timeout_task())
loop.close()
```

Sometimes, services are just down (not running, network glitches, etc.). In this case, think about how you would handle errors like this gracefully using timeouts (so as not to use up resources needlessly).

{:#step10}
### 10. Real-World Example: Fetching Multiple URLs
Here's a simple example of fetching multiple URLs concurrently using `aiohttp`. This is a good use of `asyncio` because retrieving resources over the network can be slow and unpredictable, making blocking inefficient.

```python
import asyncio
import aiohttp

async def fetch_url(url, message):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            data = await response.text()
            print("Message:", message)
            return data

async def main():
    urls = ["https://openai.com", "https://example.com"]
    tasks = [fetch_url(url, url) for url in urls]

    # delegate execution management to the event loop via the gather method:
    results = await asyncio.gather(*tasks)

    # once all of the coroutines have completed, output the results
    for url, result in zip(urls, results):
        print(f"Fetched {len(result)} bytes from {url}")

loop = asyncio.get_event_loop()
loop.run_until_complete(main())
loop.close()
```

{:.blockquote-no-margin}
> #### Your Turn
> **See demo files:** 
> * `lab05/asyncio-exercises/demo4_remote_data.py`
> * `lab05/asyncio-exercises/demo5_remote_data_timed.py` (times the sequential v. parallel to see which one is faster)

For those of you who are new to Python:

```python
# this...
tasks = [fetch_url(url, url) for url in urls]

# is a shortcut for this...
tasks = []
for url in urls:
    tasks.append(fetch_url(url, url))
```


{:#step11}
### 11. Conclusion and Further Resources
This tutorial provides a basic introduction to the asyncio module in Python. Asynchronous programming can significantly improve the performance of I/O-bound tasks and concurrent operations. To dive deeper into asyncio, explore the official documentation and try building more complex applications.

Official asyncio documentation: <a href="https://docs.python.org/3/library/asyncio.html" target="_blank"></a>

Remember that asynchronous programming can be complex, so practice and experimentation are essential for mastering it.

## 4. Fast API Walkthrough
This Fast API walkthrough will use the same poetry environment as the **app** application (HW1), but we've downgraded the python dependency to >= 3.8 to better accommodate WSL users. 

* `asyncio` was introduced to Python in version 3.5.
* `uvicorn` was introduced in Python 3.8 (it's a method to manage asyncronous loops via our web server)

To run the Fast API server, make sure that you are in **your version** of the `lab05/src` folder on the CLI. Then run your Docker container using the commands described above in the Docker section.

This should start your webserver on this address: <a href="http://127.0.0.1:8000" target="_blank">http://127.0.0.1:8000</a>. Go check it out.

### Walkthrough of Existing Endpoints
Please open `server.py` in the `src` directory and take a look at it. In this file, there are 6 "endpoints" defined that can be accessed through <a href="http://127.0.0.1:8000" target="_blank">http://127.0.0.1:8000</a>

| Route | Address |
|--|--|
| / | <a href="http://127.0.0.1:8000" target="_blank">http://127.0.0.1:8000</a> |
| /items/{item_id} | <a href="http://127.0.0.1:8000/items/123?search_term=chocolate" target="_blank">http://127.0.0.1:8000/items/123?search_term=chocolate</a> |
| /data/yelp | <a href="http://127.0.0.1:8000/data/yelp" target="_blank">http://127.0.0.1:8000/data/yelp</a> |
| /data/spotify | <a href="http://127.0.0.1:8000/data/spotify" target="_blank">http://127.0.0.1:8000/data/spotify</a> |
| /ui/yelp | <a href="http://127.0.0.1:8000/ui/yelp" target="_blank">http://127.0.0.1:8000/ui/yelp</a> |
| /ui/spotify | <a href="http://127.0.0.1:8000/ui/spotify" target="_blank">http://127.0.0.1:8000/ui/spotify</a> |


Note that the last 4 endpoints fetch data over the network (remote calls), which present some unique challenges for testing -- something we will discuss in more detail when we get to integration testing.

#### Run the starter tests

To run the tests, you will need to navigate to the Docker shell and run `pytest` (our Python testing framework). To to this:

Find your container id:

```bash
docker container ls -a     
```

Open the Docker shell:

```bash
docker exec -it <container-id> /bin/bash
```

Activate the poetry shell (virtual environment) and run the tests: 

```bash
poetry shell # activates virtual environment
pwd # check that you're in the app directory
pytest --disable-warnings
```

### Your Task
For your Lab 5 submission, you will be creating a few additional endpoints for managing a list of tasks. 
Begin by doing the following:
1. rename the current `server.py` file to `server_old.py`
1. rename the current `test_server.py` file to `test_server_old.py`
1. create a brand new `server.py` file
1. create a brand new `test_server.py` file

The requirements are as follows:

#### 1. Implement Endpoints

Start by adding the relevant code and import statements into your new `server.py` file:

```python
from fastapi import FastAPI
from fastapi.responses import HTMLResponse

import aiohttp
import json

app = FastAPI()


@app.get("/", response_class=HTMLResponse)
async def root():
    return 'Hello world!'
```

Then, create a FastAPI application with the following endpoints:

* `GET /tasks`: Retrieve a list of all tasks.
* `GET /tasks/{task_id}`: Retrieve details of a specific task by its `task_id`.
* `POST /tasks`: Create a new task with a JSON request body containing a `title` and description.
* `PUT /tasks/{task_id}`: Update an existing task's title and description using a JSON request body.
* `DELETE /tasks/{task_id}`: Delete a task by its `task_id`.

#### 2. Data Storage
Implement data storage using an in-memory data structure (e.g., a Python list or dictionary) to store tasks. You don't need to use a database for this assignment.

#### 3. Validation
Implement validation for request payloads:

* Ensure that the title and description fields are present and non-empty when creating or updating a task.
* Return appropriate error responses with clear error messages for invalid requests.
* Provide interactive API documentation using FastAPI's built-in Swagger UI or ReDoc. The documentation should include details of all endpoints, request/response formats, and example requests and responses.

#### 4. Testing
* Write unit tests to ensure the functionality and correctness of your API endpoints.


#### 5. Bonus (Optional)
* Add features like task priority, due dates, and status (e.g., "completed" or "in progress") to the task model.
* Implement query parameters to filter tasks based on their status, priority, or other attributes.


## 5. What to Turn In
Please create a pull request with all of your `lab05` files.