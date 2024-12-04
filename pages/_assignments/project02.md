---
title: "Full Stack Application"
layout: assignment-two-column
type: project
draft: 1
points: 20
abbreviation: Project 2
num: 2
h_max: 5
start_date: 2024-12-03
due_date: 2024-12-12
---

## Introduction
Some text around how this assignment is the synthesis of everything they've explored in this class...

### Your Job
For project 2 / the final exam (I've combined the two), you will complete a series of coding tasks, and answer some questions in a copy of <a href="https://docs.google.com/document/d/1nySPayDV4pUvUcwM9eT465TjSKPSiV9r1KBqmWkEHRs/edit?usp=sharing" target="_blank">this Google Doc</a>. Before you submit, please doublecheck the checklist at the bottom of this page to ensure that you have completed all of the required tasks.

## Installation & Set-Up
1. Make a a copy of <a href="https://docs.google.com/document/d/1nySPayDV4pUvUcwM9eT465TjSKPSiV9r1KBqmWkEHRs/edit?usp=sharing" target="_blank">this Google Doc</a> and write you name on it.
1. Fork this repo: XXXXXXXX
1. Clone **your version** of the repo using the SSH URL configuration. When cloning, make sure you're not in a directory that is already under version control.
1. Navigate into the `project02-fall2024` directory that you just cloned.
1. After making sure that Docker is running, issue the following command from your command line: 
    
    ```
    docker compose up
    ```

1. Verify that your backend container is running by navigating to <a href="http://localhost:8000/docs" target="_blank">http://localhost:8000/docs</a>. If you see an API Endpoint tester, you built your backend successfully.

1. You will run the frontend of your app on **your host system** (not on Docker). You will configure your front-end as follows:

    1. Open your entire `project02-fall2024` in VS Code
    1. Navigate to your `ui` directory on the terminal
    1. Install the Node dependencies as follows:

        ```
        npm install
        ```

    1. Run your node server as follows:

        ```
        npm run dev
        ```

    1. Verify that your React service is running by navigating to <a href="http://localhost:5173" target="_blank">http://localhost:5173</a>. If you see a "Schedule Planner" interface, you have configured your frontend successfully.


## Understanding the Architecture of the system
You have created a system architecture that utilizes functionality from three different servers:
1. A database server (in Docker), which is accessible on your local computer via port **5433**
1. A web server for serving dynamic queries (in Docker), which is accessible on your local computer via port **8000**.
1. A web server for serving static HTML / CSS / JavaScript files (generated using React), which is accessible on your local computer via port **5173**.

Because the Python web server and the React server are using the HTTP protocol, you can access both of these services through your web browser (which understands how to interpret HTTP messages). On the other hand, your database server needs to be accessed using a client that understands PostgreSQL messages (e.g., `psql` command line tool, DBeaver, PG Admin 4).

### 1. Querying the database using SQL (Docker DB container)
You can interact with your database on the command line by typing:

```bash
docker exec -it project02-fall2024-db-1 bash
```

Then, once you're on the command line, connect to the database server, connect to the database you want to query, and issue some SQL queries:

```
psql -U postgres        # connects to the database
\l                      # lists the databases
\c schedulerdb          # connects to the schedulerdb database
\dt                     # lists all of the tables in the schedulerdb
```


#### Task #1: SQL
Please make a copy of <a href="https://docs.google.com/document/d/1nySPayDV4pUvUcwM9eT465TjSKPSiV9r1KBqmWkEHRs/edit?usp=sharing" target="_blank">this Google Doc</a>. Then, complete the following SQL exercises and paste your answers into the Google Doc:

1. Select all rows and columns from the `users` table
1. Select the `crn` and `title` of the courses in the `courses` table that are in the `CSCI` department.
1. Write a query to output a ***distinct*** list of all of the department codes in the `courses` table ordered alphabetically.

    ```
    department 
    ------------
    ACCT
    AFST
    AM
    AMS
    ANTH
    ART
    ARTH
    ARTS
    ASIA
    ASTR
    ATMS
    BIOL
    BUS
    CHEM
    CHER
    CSCI
    ```

1. Write a query that lists the course `crn` and `title` (from the courses table) and the `username` (from the schedule table). You will need to query 4 tables: schedule_courses, schedules users, and courses tables. For instance:

    ```
                           title                       |  crn  | username 
    ---------------------------------------------------+-------+----------
    Academic Writing and Critical Inquiry              | 11127 | ablazer1
    Applied Music I: TBA                               | 10194 | ablazer1
    Critical Persp Contemporaneity                     | 10893 | ablazer1
    Special Topics: Advanced Topics in Ceramics: Wheel | 11017 | ablazer1
    Undergrad Research in IST                          | 11040 | ablazer1
    Advanced Creative Writing Workshop: Hybrid forms - | 10648 | aindelic
    Inquiry-Based Science, Physical Activity, and Heal | 10546 | aindelic
    Spanish for Advanced Beginners                     | 11075 | aindelic
    ST: Medieval Hollywood                             | 11115 | aindelic
    ST: Sexual Health & Sexuality                      | 11193 | aindelic
    Climate Change / Human Health                      | 10944 | awillis4
    Cooperative Education                              | 10396 | awillis4
    GSWP: Ideas That Sell: A Fiction Workshop          | 10838 | awillis4
    Philosophy of Science                              | 11134 | awillis4
    Senior Research Seminar I                          | 10513 | awillis4
    Adolescent Literature, 6-12                        | 10259 | bcasey1
    DI: SL: Multiple Literacies in Content Area Classr | 10547 | bcasey1
    HONORS: Mod World: Mid 17-20th Century             | 10588 | bcasey1
    Light and Visual Phenomena                         | 10623 | bcasey1
    Special Topics: Photo for Non-Majors               | 11004 | bcasey1
    Applied Music II: Piano                            | 10204 | bmungal
    ...
    ```

### 2. Querying with SQLAlchemy & Python (Docker Server container)
In practice, data APIs rarely issue SQL commands directly. Rather, they use some kind of "object relational mapping" library, or ORM. This system uses a library called SQL Alchemy (which you learned about in Lab 9). Let's get some additional practice using SQLAlchemy by hopping onto our web server container and issuing some SQL Alchemy commands:


1. Connect to your docker container:

    ```bash
    docker exec -it project02-fall2024-server-1 bash
    ```

1. Activate the poetry shell so that you can work with the ORM models and database using the existing python code that has already been set up for you:

    ```bash
    poetry shell
    ```

1. Examine the `show_courses` function (shown below), which queries for all of the `Course` objects in the `courses` table:

    ```py
    import Course from models

    async def show_courses(db: AsyncSessionLocal):
        # create query:
        query = select(Course).order_by(Course.department)

        # execute the query:
        result = await db.execute(query)

        # convert the query results to a list:
        courses = result.scalars().all()

        # iterate through the list of Course objects and manipulate
        # as you would any other Python list of objects...
        for course in courses:
            print(f"{course.crn} ({course.department}) - {course.title}")
    ```

    Try running this code in the docker container (with the poetry shell activated) as follows:

    ```
    python sample_orm_queries.py
    ```

    Notice the output, and make sure you understand what happened and why. Note that the `show_courses()` funciton was invoked  towards the bottom of the file in `main()`





#### Task #2: SQL Alchemy

### 3. Building Fast API Endpoints (Docker Server container)
TBD

#### Task #3: Build / modify some endpoints

1. Create a GET endpoint that returns a single user from the database by querying the `User` model.

    ```
    /api/users/svanwart
    ```

1. Create a GET endpoint that returns a distinct list of all of the department codes by querying the `Course` model.

    ```
    /api/departments
    ```

1. Create a POST endpoint that allows you to add a new course to a user's schedule by adding a new record to the `ScheduleCourse` model.

    ```
    /api/schedules/{schedule_id}/courses
    ```


1. Create a DELETE endpoint that allows you to remove a course from a user's schedule by deleting the requested `ScheduleCourse` record.

    ```
    /api/schedules/{schedule_id}/courses/{course_crn}
    ```

### 4. Building your React client (Node.js + static files)



#### React Exercises

1. Instead of relying on a hard-coded user, query the server to display the user object associated with your user name e.g., 