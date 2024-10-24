---
title: UNCA Course Lookup
layout: assignment-two-column
type: project
draft: 0
points: 20
abbreviation: Project 1
num: 1
h_max: 5
start_date: 2024-10-31
due_date: 2024-11-14
---

<style>
h4 {
    margin: 5px 0;
}
</style>

{% include toggle-button.html %}

## Introduction
For your first project, you are going to create a command line tool to replicate aspects of the <a href="https://www.unca.edu/schedules/" target="_blank">UNCA Course Search</a> app. It should work like the video shown here (TODO).


<!-- ## Introduction
For your first project, you are going to create a command line tool to replicate aspects of the <a href="https://www.unca.edu/schedules/" target="_blank">UNCA Course Search</a> app. It should work like the video shown here (TODO). -->

{% expandable expanded="true" level=3 title="Learning Goals"%}
This project will help you practice the concepts we have been covering so far, including:

1. Breaking requirements up into logical units that can be worked on in parallel (i.e., minimizing the dependencies between components).
1. Thinking about which "jobs" each component will have.
1. Working with a common development environment usind Docker (e.g., operating system, python versions, coding conventions, testing suite) so that the app runs identically on any machine.
1. Working with static analysis tools.
1. Devising a workflow for integrating work.
1. Coordinating and communicating across tasks to make sure everything can be successfully integrated.
{% endexpandable %}

{% expandable expanded="true" level=3 title="Product Requirements"%}
You and your team will create an app that implements the following features:

1. A way to download the UNCA data file from the Internet (JSON)
1. A way to display the search options. 
1. A way to allow the user to specify the search options
1. A way to store the user's preferences (for any of the options)
1. A way to filter the courses according to the user's preferences
1. A way to display the courses that match a user's preferences
1. A way to add, remove, and view courses from a user's schedule
1. A way to download the schedule as a CSV file
{% endexpandable %}

{% expandable expanded="true" level=3 title="System Architecture (Done as a Class)"%}
During class on Tuesday (9/24), we discussed how to organize our system, and we collectively created the following diagram:

[diagram]
{% endexpandable %}

## Team Assignments
Your teams are listed below. Each member of your team has been assigned a task from the GitHub Issue Tracker. Some of you will be working on the same Python class, so  so make sure you only work on the tasks to which you were assigned:

{% expandable expanded="true" level=3 title="Team 1" %}
Please see your team's <a href="#" target="_blank">repo</a> and <a href="#" target="_blank">issue tracker</a> for more information. Members of Team 2 are:

1. Anthony B. (anthonyablazer)
1. Brian (bmungal) 
1. Jacob (jforres1)
1. Jasmine (jnarehoo)
1. Josie (jandersoj)
1. Kate (kgary432)	
1. Ruby (runuss720)	
1. Sergio (sbaguena10)	 
1. Zejun (Hayden514)	
{% endexpandable %}

{% expandable expanded="true" level=3 title="Team 2" %}
Please see your team's <a href="#" target="_blank">repo</a> and <a href="#" target="_blank">issue tracker</a> for more information. Members of Team 2 are:

1. Andrew (awillis4)
1. Anthony I. (Aindelic) 
1. Brendan (ringojuic) 
1. Christian (Csluder2)
1. Eli (eutterba)	
1. Isreal (isrealmcd)
1. Tai (tairobinett) 
1. Travis (tgroom90)
1. Zachary (zRaNk1995)
{% endexpandable %}

## Tasks
Each task is listed below. Each student on your team has been assigned a task.

{% expandable level=3 title="1. Course"%}
The job of the Course class (`course.py`) is to parse the incoming dictionary into a more useable form. If you have been assigned this issue, please note that the rest of the app is highly dependent on this class, so the earlier you complete this task, the easier it will be for your teammates.

#### Sample dictionary item to be parsed

```python
{
    "CRN": 60002,
    "Code": "ACCT 215.001",
    "Department": "ACCT",
    "Title": "Principles of Accounting I",
    "Instructors": [{"Username": "chughes", "Name": "Hughes, Carolyn"}],
    "Hours": 4,
    "Days": "MW",
    "StartTime": "2019-05-07T21:30:00Z",
    "EndTime": "2019-05-07T23:10:00Z",
    "Location": {"FullLocation": "DEL 110", "Building": "DEL", "Room": "110"},
    "EnrollmentCurrent": 26,
    "EnrollmentMax": 28,
    "WaitlistMax": 0,
    "WaitlistAvailable": 0,
    "TermPart": "1",
    "StartDate": "2024-08-19T04:00:00Z",
    "EndDate": "2024-12-11T05:00:00Z",
    "Classification": {
        "DiversityIntensive": False,
        "DiversityIntensiveR": False,
        "DistanceLearning": False,
        "FirstYearSeminar": False,
        "Graduate": False,
        "Honors": False,
        "Arts": False,
        "ServiceLearning": False,
        "Open": True,
    },
    "AdditionalMeetings": [],
    "InstructionalMethod": "In-Person",
    "Async": False,
}
```

#### Properties
It should allow setting and getting of the following properties:
* `crn` (str)
* `code` (str)
* `department` (str)
* `title` (str)
* `instructors` (list[str]) - array of strings
* `hours` (int)
* `days` (list[str]) - array of strings
* `start_time` (datetime)
* `end_time` datetime)
* `location` (str)
* `enrollment_current` (int)
* `enrollment_max` (int)
* `term` (int)
* `is_di` (bool)
* `is_dir` (bool)
* `modality` (str): In-Person or Online

**Empty values:** If no data are available for a particular property, represent "no data" as follows:
```py
* str = ""  # empty string
* int = -1
```

#### Methods
Your class should also have the following methods:
* A `constructor` method, which takes a dictionary as an argument and sets the properties right away. A stub has been implemented for you.
* A `__repr__` method (similar to Java's toString() method, which returns a simple string representation of the course.
* An `is_full` method that returns true or false, depending on whether the course is full or not.
* An `is_morning` method that returns true or false, depending on whether the course starts before 12PM and false otherwise
* An `is_afternoon` method that returns true if the course starts between 12PM-5PM and false otherwise.
* An `is_evening` method that returns true if the course starts on or after 5PM and false otherwise.

{% endexpandable %}


{% expandable level=3 title="2. Courses"%}
The job of the Courses class (`courses.py`) is to make it convenient to print, filter, and download a list of Course objects.

#### Properties
It should allow setting and getting of the following properties:
* `courses`: Courses (set by the constructor)

#### Methods
Your class should also have the following methods:

* A `constructor` method, which takes a list of Course objects (list[Course]) as an argument and sets the `courses` property right away. A stub has been implemented for you in the starter code.
* A `to_list` method (no parameters) which returns the `courses` property
* A `size()` method  (no parameters) which returns the length of the `courses` list
* An `output_courses` method (no parameters) that prints a nice, formatted list of courses (or a message if there are no courses in the list).
* A `get_matching_courses` method which takes a UserPreferences object as an argument and return a new Courses object that includes only the courses that match the user's preferences.
  * This method will create a new instance of a CourseFilter, which it will use to figure out the courses that match the user's preferences. 
  * Some pseudocode is shown below, using Python's built-in `filter` method:
  
    ```python
    # Python's `filter` function returns a new list with only results matching the filter function.
    # Use multiple filter invocations to apply multiple filters:
    course_matches = filter(some_filter_function, self.courses)
    course_matches = filter(another_filter_function, course_matches)
    ```
{% endexpandable %}


{% expandable level=3 title="3. UserPreferences"%}
The job of the UserPreferences class (`user_preferences.py`) is store the user's search preference information, and to provide methods for modifying the user's preferences as they browse courses of interest. If you have been assigned this issue, please note that the rest of the app is highly dependent on this class, so the earlier you complete this task, the easier it will be for your teammates.


#### Properties
It should allow setting and getting of the following properties. 
* `days`: list[str] = []
* `department`: str = "CSCI" (default to CSCI) 
* `di_only`: bool = False 
* `dir_only`: bool = False
* `hours`: int = -1
* `instructor`: str = ""
* `open_closed_status`: str -- either "open", "closed", or "" (no preference)
* `search_term`: str = ""
* `time_of_day`: str = "" (either 'morning', 'afternoon', or 'evening')


**Empty values:** If the filter is unset (i.e., the user didn't specify a value one way or the other),  represent "unset" preferences as follows:

```
str = ""  # empty string
int = -1
list = []
bool = False
```

#### Methods
Your class should also have the following methods:

* A `constructor` method that initializes all of the default property values right away. A stub has been implemented for you:
  ```py
  # TODO
  ```
* An `update_search_term` method that prompts the user to enter a search term or clear their current `search_term` property.
* An `update_department` method that prompts the user to enter a department or clear their current `department` property.
* An `update_instructor` method that prompts the user to enter an instructor or clear their current `instructor` property.
* An `update_di` method that asks the user whether they want to only see DI courses. This will set the `di_only` property.
* An `update_dir` method that asks the user whether they want to only see DI-Race courses. This will set the `dir_only` property.
* An `update_open_closed_status` method that asks the user whether they want to only open or only closed courses. This will set the `open_closed_status` property.
* An `update_dir` method that asks the user whether they want to only see DI-Race courses. This will set the `dir_only` property.
* An `update_hours` method that asks the user whether they only want to see courses with 1, 2, 3, or 4 credit hours. This will set the `hours` property.
* An `update_time_of_day` method that asks the user whether they want to specify morning, afternoon or evening classes. This will set the `time_of_day` property.

##### A note on the methods
* All of the update methods must validate the user's input and re-prompt them if they enter an incorrect value (and explain why the value is incorrect).
* All of the input methods should also be able to clear out the properties (unset them to empty).
* Feel free to use as many private helper methods as you want. In python, private methods are named with a leading underscore.
{% endexpandable %}


{% expandable level=3 title="4. Course Filter"%}
The job of the CourseFilter class (`course_filter.py`) is to determine whether a course matches a given set of criteria. 

#### Properties
It should allow setting and getting of the following properties:
* `user_prefs`: UserPreferences

#### Methods
* A `constructor` method, which takes a UserPreferences object as an argument and sets the `user_prefs` property right away. A stub has been implemented for you.
* `is_search_term_match`: accepts a Course object as an argument. Returns true if the course's title matches the user's preference (from the UserPreferences) property or if the search_term preference is not set. Returns false otherwise.
* `is_instructor_match`: accepts a Course object as an argument. Returns true if the course's instructor partially matches the user's preference or if the instructor preference is not set. Returns false otherwise.
* `is_di_match`: accepts a Course object as an argument. Returns true if the course is a DI course preference or if the di_only preference is not set. Returns false otherwise.
* `is_dir_match`: accepts a Course object as an argument. Returns true if the course is a DI-Race course preference or if the dir_only preference is not set. Returns false otherwise.
* `is_departmental_match`: accepts a Course object as an argument. Returns true if the course's department matches the user's preference or if the department preference is not set. Returns false otherwise.
* `is_hours_match`: accepts a Course object as an argument. Returns true if the course's credit hours matches the user's preference or if no preference is set. Returns false otherwise.
* `is_status_match`: accepts a Course object as an argument. Returns true if the course's `open_closed_status` matches the course's current state or if no preference is set. Returns false otherwise.
* `is_time_of_day_match`: accepts a Course object as an argument. Returns true if the course's `time_of_day` matches the course's time of day status or if no preference is set. Returns false otherwise.

Make sure that all filters are case-insensitive and that they return true if no preference is set.
{% endexpandable %}


{% expandable level=3 title="5. User Interface (UI)"%}
The job of the User Interface class (`user_interface.py`) is to allow people to make choices about what they want to do in the app and receive the appropriate response.
{% endexpandable %}

{% expandable level=3 title="6. Schedule"%}
The job of the Schedule class (`schedule.py`) is to allow the user to build a schedule. This involves giving the user the ability to:
* add a course to the schedule
* remove a course from the schedule
* print the schedule
* save schedule as a CSV file (text file)
{% endexpandable %}

{% expandable  level=3 title="7. Schedule Emailer" %}
* Register with Twilio and get an API key
* Install the python library
{% endexpandable %}




## Set Up

{% expandable expanded="true" level=3 title="1. Set up your repository" %}
Once your team lead has added you to their repo, you will set up the code locally as follows:
1. Open the terminal.
1. Clone your team lead's version of the repository -- and please do not clone it inside of another directory that is already under version control: 
```
git clone git@github.com:<your-team-lead-github-username>/project01.git
```
1. Navigate into the `project01` directory you just cloned. Create a new branch (name it whatever you want):
```
cd project01
git checkout -b yourname-feature
```
{% endexpandable %}

{% expandable expanded="true" level=3 title="2. Building Your Docker Container" %}
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


#### 1. Returning to Docker later
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

#### 2 Some useful commands

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
{% endexpandable %}


## Logistics
Before you begin working on this project, please read the guidelines **VERY CAREFULLY**.

{% expandable expanded="true" level=3 title="1. Working with Feature Branches" %}
1. You will **never edit the `main` branch directly**. Consider `main` to be the "source of truth" for the app. 
2. All of your work will be committed to your feature branch (which you will create from the `main` branch).
3. _Please_ pull down the latest changes from `main` periodically and rebase your local branch with `main`. To do this:
    * Commit your feature branch work,
    * Check out main,
    * Pull down the latest changes,
    * Check out your feature branch again, and
    * Rebase your feature branch with main
    {:.compact}

{% endexpandable %}


{% expandable expanded="true" level=3 title="2. Testing Tips" %}
Run the tests using the pytest library (installed via poetry). Some sample commands:

```bash
poetry run pytest -v                        # runs all the tests
poetry run pytest tests/test_courses.py -v  # runs all the tests in a single file
poetry run pytest test_courses.py::TestCourses::test_one -v  # runs a single test (e.g., test_one)
```
{% endexpandable %}


{% expandable expanded="true" level=3 title="3. Formatting Tips" %}
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
{% endexpandable %}

{% expandable expanded="true" level=3 title="4. GitHub Workflows & Continuous Integration Notes" %}
The `.github/workflows/pr.yml` is a configuration file that GitHub reads in order to run a series of checks everytime you push your branch to GitHub. Before you make a pull request, make sure that you run the `bash scripts/run_pr_checks.sh` script. If everything passes locally, it should also pass on GitHub.
{% endexpandable %}

## Grading and Assessment

{% expandable expanded="true" level=3 title="1. How to submit work for review" %}
Please read this section very carefully.

#### Submissions
You will submit your work by making a pull request (PR) and tagging `svanwart` as a reviewer. Before making your PR, make sure that you have:
* Implemented all of properties and methods needed to support the functionality listed above. You are also welcome to implement private helper methods. In python, private / helper methods are prefixed with an underscore.
* Written tests for all public methods.
* Ensured all of the formatter and linter checks pass before making a pull request.
* In the text of your PR:
    * Reference this issue by using the hash tag followed by the issue number.
    * Describe what has been done in the PR as simply and clearly as possible.
    * You may make multiple PRs to implement subsets of functionality. Remember: it's better to create smaller, incremental PRs than one big PR (no long-running branches).
* In order for your branch to be reviewed:
    * All of the validation checks on GitHub need to pass
    * Your branch should not have any merge conflicts with `main`
    * I (Sarah) will review all pull requests from the previous day by 10AM the following morning

#### Revisions
I may ask you for revisions on your code -- this is normal, and won't have an impact on your grade or anything like that. 
* Once I approve your pull request, **you will be responsible for merging your branch into `main` via GitHub**.
{% endexpandable %}

{% expandable expanded="true" level=3 title="2. Rubric"  %}
| 20% | Teamwork and communication | Did you show up to class? Did you talk to your teammates? Did you respond to them in a timely manner? If someone else was working on a feature that you depended on, did you coordinate / communicate with them? | 
| 50% | Individual code contribution | Did you submit at least 2 pull requests (that were approved)? Did you complete your tasks? Does your code work as expected? Do all of your functions / methods have tests? Did the code quality checks pass? |
| 30% | Quality of the final group product | Does your app work? Is it complete? Can users browse for courses, filter according to their preferences, and add them to a schedule? Were everyone's contributions merged by the deadline? |
{% endexpandable %}