---
layout: module
title: Databases and Object Relational Mappings
type: module
draft: 1
num: 9
due_date: 2024-11-05
---
 
## Readings & References
### PostgreSQL Reference
* <a href="https://www.postgresql.org/about/" target="_blank">About PostgreSQL</a>
* <a href="https://www.postgresqltutorial.com/psql-commands/" target="_blank">psql commands</a> (command line)
* <a href="https://www.postgresql.org/docs/current/tutorial-select.html" target="_blank">Querying a Table</a>
* <a href="https://www.postgresql.org/docs/current/tutorial-join.html" target="_blank">Joins Between Tables</a>
* <a href="https://www.postgresql.org/docs/current/tutorial-agg.html" target="_blank">Aggregate Functions</a>
* <a href="https://www.postgresql.org/docs/current/tutorial-populate.html" target="_blank">Inserts</a>
* <a href="https://www.postgresql.org/docs/current/tutorial-update.html" target="_blank">Updates</a>
* <a href="https://www.postgresql.org/docs/current/tutorial-delete.html" target="_blank">Deletions</a>
{:.compact}

### SQLAlchemy Reference

* [Documentation](https://docs.sqlalchemy.org/en/20/orm/queryguide/index.html)


### PostgreSQL Administrative Commands
To enter the postgreSQL shell, type: `psql -U postgres` (connecting as the postgres superuser). Once you're in the psql shell, try using the following commands:

{:.admin}
| Command | Explanation | Example |
|--|--|--|
| `\q` | Exits the psql shell | |
| `\l` | Lists all the available databases | |
| `\c <dbname> <username>` | Connect to specific database | `\c photo_app_tutorial postgres` |
| `\dt` | Lists all of the tables in the database you're connected to |
| `\d <table_name>` | Describes the structure (i.e., "schema") of a table | `\d posts` |
| `\du` | List all users and their roles | |
| space bar | If you query data in a table that has multiple pages, the space bar will show you the next set of records.  | |
| q | If you query data in a table that has multiple pages, and you want to go back to the psql prompt. | |


## Slides
* Lecture 9: <a href="https://docs.google.com/presentation/d/1PTFnOHjnZShjloXJGN2kvmFvy4f4AKCEzM27FG86tzE/edit?usp=sharing" target="_blank">Intro to Relational Databases & ORMs</a>

## Activities
* Today's Repo: <a href="https://github.com/csci338/orm-demo" target="_blank">https://github.com/csci338/orm-demo</a>
