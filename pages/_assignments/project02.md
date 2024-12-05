---
title: "Full Stack Application"
layout: assignment-two-column
type: project
draft: 0
points: 20
abbreviation: Project 2
num: 2
h_max: 5
start_date: 2024-12-03
due_date: 2024-12-12
---

<style>
    .info .highlight, .info .highlight pre, .info .highlight table {
        background: transparent !important;
        color: #242424 !important;
    }

    .info li {
        margin-bottom: 20px;
    }

    .info ol{
        margin-top: 20px;
    }

    .info code.highlighter-rouge {
        font-weight: bold;
        background: transparent;
    }
</style>

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

{:.info}
> #### Task #1: SQL
>  Complete the following SQL exercises and paste your answers into your Google Doc (linked to above).
> 
> 1. Select all rows and columns from the `users` table
> 1. Select the `crn` and `title` of the courses in the `courses` table that are in the `CSCI` department.
> 1. Write a query to output a ***distinct*** list of all of the department codes in the `courses` table ordered alphabetically.
> 
    ```
    department 
    ------------
    ACCT
    AFST
    AM
    AMS
    ANTH
    ...
    ```
> 
> 1. Write a query that lists the course `crn` and `title` (from the courses table) and the `username` (from the schedule table). You will need to query 4 tables: schedule_courses, schedules users, and courses tables. For instance:
>
>    ```
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
    ...
    ```

### 2. Querying with SQLAlchemy & Python (Docker Server container)
In practice, data APIs rarely issue SQL commands directly. Rather, they use some kind of "object relational mapping" library, or ORM. Project 2 uses a library called SQL Alchemy (which you learned about in Lab 9). Let's get some additional practice using SQLAlchemy by hopping onto our web server container and issuing some SQL Alchemy commands:


1. Connect to your docker container:

    ```bash
    docker exec -it project02-fall2024-server-1 bash
    ```

1. Activate the poetry shell so that you can work with the ORM models and database using the existing python code that has already been set up for you:

    ```bash
    poetry shell
    ```

1. Open your `project02-fall2024` directory in VS Code and navigate to `backend/sample_orm_queries.py`. Then, run `sample_orm_queries.py` on your poetry shell (from the Docker container) to make sure that everything is working:

    ```
    python sample_orm_queries.py
    ```

    If it worked, you should see some courses outputting to the screen.

1. Now that you've run `sample_orm_queries.py`, let's take a look at some of the code, starting with the `show_courses` function (shown below):

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

    The "job" of this function is to query the `courses` table and to convert each record into a `Course` object (which is much easier to work with in Python). Please look at this function carefully and make sure you understand it.

1. Now let's look at how the `Course` model is defined in `backend/models.py` (around line 40). I've pasted it below for your convenience:

    ```py
    class Course(Base):
        __tablename__ = "courses"
        crn = Column(Integer, primary_key=True)
        code = Column(String, nullable=False)
        department = Column(String, nullable=False)
        title = Column(String, nullable=False)
        hours = Column(Integer, nullable=True)
        days = Column(String, nullable=True)
        start_time = Column(DateTime(timezone=True), nullable=True)
        end_time = Column(DateTime(timezone=True), nullable=True)
        enrollment_current = Column(Integer, nullable=False)
        enrollment_max = Column(Integer, nullable=False)
        waitlist_max = Column(Integer, nullable=False)
        waitlist_available = Column(Integer, nullable=False)
        term_part = Column(String, nullable=False)
        start_date = Column(DateTime(timezone=True), nullable=True)
        end_date = Column(DateTime(timezone=True), nullable=True)
        instructional_method = Column(String, nullable=False)
        async_class = Column(Boolean, nullable=False)
        diversity_intensive = Column(Boolean, default=False)
        diversity_intensive_r = Column(Boolean, default=False)
        distance_learning = Column(Boolean, default=False)
        first_year_seminar = Column(Boolean, default=False)
        graduate = Column(Boolean, default=False)
        honors = Column(Boolean, default=False)
        arts = Column(Boolean, default=False)
        service_learning = Column(Boolean, default=False)
        open = Column(Boolean, default=False)

        # Relationships
        instructors = relationship(
            "Instructor", secondary="course_instructors", back_populates="courses"
        )
        schedules = relationship(
            "Schedule", secondary="schedule_courses", back_populates="courses"
        )

        location_id = Column(Integer, ForeignKey("locations.id"), nullable=True)
        location = relationship("Location", back_populates="courses")
    ```

    The first ~25 data fields are just direct mappings to table columns in the `courses` table. However, the "relationship" data fields (`instructors`, `schedules`, `location`) are based on joins to other tables. Under the hood, SQLAlchemy can help you to manage these joins. This is helpful because it allows you to do things like this...

    ```py
    print(course.location.full_location)

    for instructor in course.instructors:
        print(instructor.full_name)

    ```

    ...without having to manually write the code to organize the data from your table joins.

1. Now that you've looked at your `Course` model, you're ready to understand how joins work in SQLAlchemy. To get your joins to populate the relations, there's a few things you have to do when querying. Please take a look at this code sample (also in  the `sample_orm_queries` file):

    ```py
    import Course from models
    from sqlalchemy.orm import selectinload

    async def show_courses_with_table_joins(db: AsyncSessionLocal):
        # query also joins with the instructors and location table
        query = (
            select(Course)
            .options(
                selectinload(Course.instructors),
                selectinload(Course.location)
            )
            .order_by(Course.department)
        )

        # execute the query:
        result = await db.execute(query)

        # convert the query results to a list:
        courses = result.scalars().all()

        # print select information for each course:
        for course in courses:

            # print stuff from courses tables
            print(f"{course.crn} ({course.department}) - {course.title}")

            # because we joined on the instructors table, we  have access to its data:
            instructor_names = [inst.full_name for inst in course.instructors]
            print("Intructor(s):", ", ".join(instructor_names))

            # because we joined on the locations table, we can output the location:
            if course.location:
                print("Location:", course.location.full_location)
            print("-" * 70)
    ```

    Note that the query has a new "options" clause that invokes SQLAlchemy's `selectinload` function to query for related data. Once the joined data is loaded into its corresponding `Course` object and relations (instructors, location). You can now manipulate the data as you would any other python object.

1. The last thing that is important in these examples is the **await/async** concept, which we also saw in JavaScript. In this code example, all database queries are issued asynchronously. Because database queries are "expensive" (they take a lot of time), we don't want our system blocking until the query completes. By using async / await, other parts of the system can continue to work while python is waiting for information to come back from the database server:
    * The `async` keyword, which is put before a the function definition, indicates that the function is utilizing some asynchronous functionality.
    * The `await` keyword is ensures that the next line of code within the function does not execute until the asynchronous function call has returned.

{:.info}
> #### Task #2: SQL Alchemy
> Now that you've taken a look at some SQLAlchemy capabilities in more depth, please complete the following tasks:
> 1. Please explain, in your own words, how the `print_schedules` function works (located inside of the `sample_orm_queries.py` file) in <a href="https://docs.google.com/document/d/1nySPayDV4pUvUcwM9eT465TjSKPSiV9r1KBqmWkEHRs/edit?usp=sharing" target="_blank">this Google Doc</a>.
> 1. Then, in `sample_orm_queries.py`, create the following 3 asynchronous functions:
>     1. `print_usernames` -- prints all of the usernames in the system (query the `User` model).
>     1. `print_unique_departments`  -- prints a distinct list of departments (query the `Course` model). 
>     1. `print_open_cs_courses` -- prints the `crn` and `title` of courses in the CSCI department that are currently open (not full). 

### 3. Building Fast API Endpoints (Docker Server container)
FastAPI is

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