---
title: UNCA Course Lookup
layout: assignment-two-column
type: project
draft: 1
points: 20
abbreviation: Project 1
num: 1
due_date: 2024-11-14
---

## Introduction
For your first project, you are going to create a command line tool to replicate aspects of the <a href="https://www.unca.edu/schedules/" target="_blank">UNCA Course Search</a> app. You and your team will implement the following features:
* A way to download the UNCA data file from the Internet (JSON)
* A way to display the search options. 
* A way to allow the user to specify which search options / filters they want
* A way to store the user's preferences (for any of the options)
* A way to filter the courses according to the user's preferences
* A way to view, add and remove courses from a user's schedule
* A way to download their schedule as a CSV file


## 1. Set Up Instructions
Before you begin working on this project, please read the guidelines **VERY CAREFULLY**.

### 1.1. Team Assignments
Your teams are listed below. Travis, Jacob, and Ruby will be the team leads (for the first project). If you are the team lead, you will fork the repository () and add each of your teammates as collaborators. Please also add Sarah as a collaborator (svanwart). Make sure that your repository is set to **private**. Each member of your team will pick a task from the GitHub Issue Tracker.

#### Team 1
1. **Ruby (runuss720) - Lead**
1. Isreal (isrealmcd)
1. Jasmine (jnarehoo)
1. Josie (jandersoj)
1. Kate (kgary432)		 
1. Zejun (Hayden514)

#### Team 2	 
1. **Jacob (jforres1) - Lead**
1. Anthony B. (anthonyablazer)
1. Sergio (sbaguena10)	 
1. Brendan (ringojuic) 
1. Brian (bmungal)	
1. Anthony I. (Aindelic) 

#### Team 3
1. **Travis (tgroom90) - Lead**
1. Zachary (zRaNk1995)
1. Eli (eutterba)	
1. Tai (tairobinett) 
1. Andrew (awillis4)
1. Christian (Csluder2)

### 1.2 Set up your repository
Once your team lead has added you to their repo, you will set up the code locally as follows:
1. Open the terminal.
1. Clone your team lead's version of the repository -- and please do not clone it inside of another directory that is already under version control: 
```
git clone git@github.com:<your-team-lead-github-username>/project01.git
```
1. Navigate into the `project01` directory you just cloned. Then, create a new branch (name it whatever you want):
```
cd project01
git checkout -b yourname-feature
```

### 1.3. Building Your Docker Container
1. Make sure that Docker is running
1. Then, from within the `project01` directory, issue the following Docker command:
   ```bash
   docker compose up
   ```
   This command will build your image and your container. Once the container has built, you should see some output like this:
   ```bash
   Running 2/1
     ✔ Network project01_default Created                                                                                                                                      
     ✔ Container project01-app-1  Created                                                                                                                                       
     Attaching to project01-app-1
    project01-app-1  | root@d863cf880897:/project01# 
   ```
   Keep this terminal open and then open a new shell (for the remaining commands). In other words, you will have two terminals open: one that's running your Docker container, and one for issuing other system commands (listed below).

1. In your new terminal shell (with the other shell running), find your container pid by listing all of your containers as follows:
   ```bash
   docker ps -a
   ```
1. Open the terminal shell on the Docker container you just made:
   ```bash
   docker exec -it <pid> bash # note that this command will put you onto Docker's bash
   ```
1. Install the poetry dependencies from within your Docker container:
   ```bash
   poetry install
   ```
1. Run the tests:
   ```bash
   poetry run pytest -v
   ```
1. Run the app:
   ```bash
   poetry run python course_lookup/driver.py
   ```
1. Now you're ready to start coding in VS Code.


### 1.4. Returning to Docker later
Once you've built your container, it should be available to you in the future, even if you close out of Docker or stop the container. To get back to your container:

1. Make sure Docker is running
2. Find the pid of the container you want to run: 
   ```bash
   docker ps -a
   ```
3. Start the stopped container with the pid you just found:
   ```bash
   docker start <pid>
   ```
4. Use container as per usual (and make sure you're in the `project01` directory when you run the poetry commands).

You could also go to the Docker Dashboard and start your container from the Dashboard.

### 1.5. Some useful commands

| Command | Description |
|--|--|
| `docker ps -a` | List all of the containers (including stopped containers) |
| `docker stop <pid>` | List all of the containers (including stopped containers) |
| `docker start <pid>` | List all of the containers (including stopped containers) |
| `docker exec -it <pid> bash` | Runs terminal on the container |
| `docker exec -it <pid> poetry run python course_lookup/driver.py` | Runs the `driver.py` using poetry. |
| `docker exec -it <pid> poetry run pytest -v ` | Runs tests |
| `docker exec -it <pid> bash scripts/check.sh` | Runs check script |
| `docker exec -it <pid> bash scripts/fix.sh` | Runs fix script |

## 2. Your Job
1. Navigate to the Issue Tracker and sign up for a task.

## 3. How to submit your work for a code review
1. You will **never edit the `main` branch directly**. Consider `main` to be the "source of truth" for the app. 
2. Before editing any code on your computer, create a branch. All of your work will be committed to that branch.
3. When you're ready to have your code reviewed by Sarah, push your branch to GitHub and make a pull request.


### 3.1. Formatting Tips
We are using `black` to format our code, `isort` to sort our import statements, and `flake8` to validate your Python code. 
* [https://black.readthedocs.io/en/stable/usage_and_configuration/index.html](https://black.readthedocs.io/en/stable/usage_and_configuration/index.html)
* [https://pypi.org/project/isort/](https://pypi.org/project/isort/)
* [https://flake8.pycqa.org/en/latest/](https://flake8.pycqa.org/en/latest/)

The following commands will be run on every push to make sure that the code styling rules have been followed:

```bash
poetry run black . --check        # runs the Python formatter
poetry run isort . --check-only   # run the Python import sorter
poetry run flake8                 # flake8 just checks things -- you have to fix them manually
```

You can also use the `bash/check.sh` script (for convenience):

```bash
bash scripts/check.sh
```

To actually APPLY the formatting (which will make changes to your files), make sure you run these two commands before pushing your branch to GitHub:

```bash
poetry run black .      # runs the Python formatter
poetry run isort .      # run the Python import sorter
```
You can also use the bash/fix.sh script (for convenience):

```bash
bash scripts/fix.sh
```

If you want flake8 to ignore a particular line, add a `# noqa` comment at the end of the line

### 3.2. Testing Tips
Run the tests using the pytest library (installed via poetry). Some sample commands:

```bash
poetry run pytest -v                        # runs all the tests
poetry run pytest tests/test_courses.py -v  # runs all the tests in a single file
poetry run pytest test_courses.py::TestCourses::test_one -v  # runs a single test (e.g., test_one)
```

### 3.3. GitHub Workflows
The `.github/workflows/pr.yml` is a configuration file that GitHub reads in order to run a series of checks everytime you push your branch to GitHub. Before you make a pull request, make sure that you run the `bash scripts/run_pr_checks.sh` script. If everything passes locally, it should also pass on GitHub.

## 4. Grading and assessment

### Submission Workflow
* Each member of the team should submit at least 2 PRs before the deadline. 
* Each PR should have some subset of your task complete, including tests. 
* In order for your branch to be reviewed:
    * All of the validation checks on GitHub need to pass
    * Your branch should not have any merge conflicts with `main`
    * Sarah will review all pull requests from the previous day by 10AM the following morning
* Once I approve your pull request, **you will be responsible for merging your branch into `main` via GitHub**.

### Rubric

| 20% | Teamwork and communication | Did you show up to class? Did you talk to your teammates? Did you respond to them in a timely manner? If someone else was working on a feature that you depended on, did you coordinate / communicate with them? | 
| 50% | Individual code contribution | Did you submit at least 2 pull requests (that were approved)? Did you complete your tasks? Does your code work as expected? Do all of your functions / methods have tests? Did the code quality checks pass? |
| 30% | Quality of the final group product | Does your app work? Is it complete? Can users browse for courses, filter according to their preferences, and add them to a schedule? Were everyone's contributions merged by the deadline? |
