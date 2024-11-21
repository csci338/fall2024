---
layout: assignment-two-column
title: Database Lab
type: lab
abbreviation: Lab 9
draft: 0
points: 6
num: 9
start_date: 2024-11-21
due_date: 2024-11-26
---

<style>

    blockquote.info {
        padding: 20px;
    }
    blockquote.info h3, blockquote.info li {
        margin-bottom: 20px;
    }
    td ul {
        margin-top: 10px !important;
    }
    table th:first-child, 
    table td:first-child {
        width: auto;
        max-width: 200px;
        /* min-width:200px; */
    }

    table th:last-child, 
    table td:last-child {
        width: auto;
        min-width:130px !important;
    }

    table th:nth-child(3), 
    table td:nth-child(3) {
        width: auto;
        min-width:200px !important;
    }

    table code {
        font-weight: 600;
        font-size: 1.1em;
    }

</style>

## 1. Introduction

The goals of this lab are as follows:

1. Set up a docker container with a postgres tutorial
1. Get some basic experience with SQL
1. Get experience interacting with a Postgres database from Python
1. Get experience querying the database via an ORM

## 2. Setup

### Version Control Stuff
Before you begin, get the latest code from <a href="https://github.com/csci338/class-exercises-fall2024" target="_blank">class-exercises-fall2024</a>. 

**On GitHub:**
* Sync the latest changes from the class version of `class-exercises-fall2024` to your copy of the repo on GitHub.

**On your local computer:**
* Make sure that all of your changes from the last lab are staged and committed.
* Checkout your main branch: `git checkout main`
* Pull down the latest changes: `git pull`
    * If you did it correctly, you will notice that a new `lab09` folder has been created.
* Create a new branch called **lab09**: `git checkout -b lab09`
* Verify that you're on your new branch: `git branch`


### Build and run your Docker file
Navigate to your `lab09` directory and type:

```bash
$ docker compose up
```

As you may recall, this command builds your Docker container *and* runs it. Keep your terminal running and do the remaining tasks on anther terminal.


## 3. SQL Exercises

### Run the Postgres SQL Client

In the new terminal window we'll run `psql` (the postgres SQL
client) on the your running `postgres_tutorial` container.

```
$ docker exec -it postgres_tutorial psql -U postgres
postgres=#
```

Now let's confirm things are working. Try typing in the `\list`
command and confirm you see the `dvdrental` database.

```
postgres=# \list
```

If that works, let's change to the `dvdrental` database and run a
simple sql query to list all customer's first names.

```
postgres=# \c dvdrental
dvdrental=# select first_name from customer;
```

### Tutorial

Now that you're all set up, please answer the 10 SQL questions (listed below) in the "SQL" section of your `lab09/answers.md` file. Here are some references from the PostgreSQL tutorial to help you:

- [Select](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-select/)
- [Where](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-where/)
- [Limit](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-limit/)
- [Joins](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-joins/)
- [Table Aliases](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-alias/)
- [Inner Join](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-inner-join/)
- [Insert](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-insert/)
- [Insert Multiple Rows](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-insert-multiple-rows/)

{:.info}
> ### SQL Questions
> 1. **SELECT - Retrieving Data.** Write a query to list the titles and release years of all movies in the film table.
> 2. **WHERE - Filtering Data.** Write a query to find all customers whose last name starts with the letter 'S'.
> 3. **ORDER BY - Sorting Results.** List all films titles and their durations, sorted by their rental duration in descending order. If two films have the same rental duration, sort them alphabetically by title.
> 4. **JOIN - Combining Tables.** Write a query to list all films along with their categories. Show the film title and category name.
> 5. **AGGREGATE FUNCTIONS - Summarizing Data.** Write a query to find the average rental duration for movies in each category.
> 6. **COUNT - Counting Rows.** Write a query to count how many films are in the Action category.
> 7. **INSERT - Adding Data.** Insert a new customer into the customer table. The new customer should have a first name, last name, email, and be linked to an existing store.
> 8. **UPDATE - Modifying Data.** Update the rental rate of all films in the Comedy category, increasing it by 10%.
> 9. **DELETE - Removing Data.** Write a query to delete all films that have never been rented. Make sure to use a subquery to identify the films that haven't been rented.
> 10. **CREATE TABLE & ALTER TABLE - Managing Database Structure.** Create a new table called movie_reviews with columns for review_id, film_id, reviewer_name, rating, and comments. Then, add a foreign key constraint linking film_id to the film table.


## 4. SQL Alchemy / Python Exercises
Now, you're going to try connecting to your postgres database using python on your local computer.

Open a terminal window, navigate to your `lab09` directory, and install the dependencies in the `pyproject.toml` file:

```bash 
$ poetry install
```

You should now be able to run the `orm.py` file as usual from your local terminal:

```
$ poetry run python orm.py
```

Take a look at the file and try to understand what it does. Then, answer the 4 SQLAlchemy questions in the `answers.py` file in your `lab09` folder.

{:.info}
> ### SQL Alchemy Questions
> 1. **Understanding SQLAlchemy Automap**: How do you think the `AutoModels` class works to dynamically generate SQLAlchemy ORM models from the database schema?
> 2. **Async Database Operations**: Explain the use of asynchronous database sessions in this script. Why does the script use AsyncSession instead of a regular Session, and how does this improve the efficiency of database operations?
> 3. **SQLAlchemy Query Construction**: In the `model_examples` function, there is a query that selects all customers whose last names start with the letter "P". See if you can write another questy that selects customers whose first name ends with the letters "n" or "a" using SQLAlchemy syntax.
> 4. **Raw SQL v. Models**: In the `raw_sql_examples` function, there are two ways to execute SQL queries: directly via the engine using conn.execute() and using an ORM session with session.execute(). Discuss the pros and cons of executing raw SQL directly compared to using SQLAlchemy’s ORM methods.
>   * Hint: Consider the trade-offs in terms of readability, safety (e.g., SQL injection risks), and flexibility when using raw SQL versus ORM abstractions.

## What to Submit
When you're done answering the questions in the `answers.md` file, please push your `lab09` branch to GitHub and make a pull request. Please ensure that the destination (left-hand side) is pointing to the `main` branch of **your repo** and the source (right-hand side) is pointing to the `lab09` branch of **your repo**. Then, please paste a link to your PR in the Moodle.
