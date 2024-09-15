---
layout: assignment-two-column
title: "Understanding Package Managers"
type: lab
draft: 1
points: 6
abbreviation: Lab 5
num: 5
start_date: 2024-09-19
due_date: 2024-09-22

---

## Objective
The objective of this lab is to help you understand the concept of package management and to  gain hands-on experience with various package managers, including:

1. Your OS package manager:
    * Mac: `brew` (Homebrew)
    * WSL / Linux: `apt-get` (APT)
2. `poetry` (Python) - Everyone
3. `npm` (Node.js) - Everyone

By the end of the lab, you should understand how to install, update, remove, and manage dependencies using these package managers. Learn more about each of these package managers on each project's website:
- [Homebrew Documentation](https://brew.sh)
- [APT Documentation](https://manpages.debian.org/bullseye/apt/apt.8.en.html)
- [Poetry Documentation](https://python-poetry.org/docs/)
- [npm Documentation](https://docs.npmjs.com/)

> ## Before you begin
> Before you begin, get the latest code from class-exercises-fall2024
>
> **On GitHub:**
>
> * Sync the latest changes from the class version of `class-exercises-fall2024` to your copy of the repo.
> **On your local computer:**
> * Make sure that all of your changes from the last lab are staged and committed.
> * Checkout your main branch: `git checkout main`
> * Pull down the latest changes: `git pull`
>     * If you did it correctly, you will notice that a new `lab05` folder has been created.
> * Create a new branch called lab05: `git checkout -b lab05`
> * Verify that you’re on your new branch: `git branch`
> * After going through the lab, answer the questions in the `lab05/answers.md` file.


{:#p1a}
## Part 1(a): Homebrew (brew)
> If you are a Windows user, skip this section and jump to [Part 1(b)](#p1b).

**Homebrew** is a package manager for macOS that simplifies the installation of software.

### Exercise 1(a).1: Installing a Package
1. Open a terminal and check if you already have `brew` installed by typing: `brew`
2. If Homebrew is not already installed, install it by following the official installation instructions (see <a href="https://brew.sh/" target="_blank">https://brew.sh/</a> for more info):<br><br>
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
3. Once Homebrew is installed, use it to install `wget`:<br><br>
   ```bash
   brew install wget
   ```
4. Verify the installation by running:<br><br>
   ```bash
   wget --version
   ```
5. Now that wget is installed, try coping a file from the Internet to your current working directory as follows: <br><br>
    ```bash
    wget https://www.google.com
    ```

If it worked, an `index.html` file should have been copied to your local directory. Use the `cat` command to view it. Then remove it using the `rm` command.

### Exercise 1(a).2: Updating and Removing Packages
1. Update all installed packages using:<br><br>
   ```bash
   brew update
   ```
2. Uninstall `wget`:<br><br>
   ```bash
   brew uninstall wget
   ```
3. Test that it worked by running the same `wget` command again. It should throw an error: <br><br>
    ```bash
    wget https://www.google.com
    ```
4. Now reinstall `wget`:<br><br>
    ```bash
   brew install wget
   ```
5. Test that it worked by running the same `wget` command again. The Google `index.html` should again be in your working directory (go ahead and delete it once you've verified it's in there).


{:#p1b}
## Part 1(b): APT (apt-get)
> If you are a Mac user skip this section (but make sure you completed [Part 1(a)](#p1a)).

**APT** is a package management system used by Debian-based Linux distributions (e.g., Ubuntu).

### Exercise 1(b).1: Installing a Package
1. Open a terminal in a Debian-based Linux environment.
2. Update the local package index:<br><br>
   ```bash
   sudo apt-get update
   ```
3. Install the `curl` package:<br><br>
   ```bash
   sudo apt-get install curl
   ```
4. Verify the installation:<br><br>
   ```bash
   curl --version
   ```

5. Use curl to save the Google Homepage in your current directory:<br><br>
   ```bash
   curl https://www.google.com > google.html
   ```

If it worked, an `google.html` file should have been created to your local directory. Use the `cat` command to view it. Then remove it using the `rm` command.

### Exercise 1(b).2: Updating and Removing Packages
1. Upgrade all installed packages:
   ```bash
   sudo apt-get upgrade
   ```
2. Remove the `curl` package:
   ```bash
   sudo apt-get remove curl
   ```
3. Test that it worked by running the same `curl` command again. It should throw an error: <br><br>
    ```bash
    curl https://www.google.com > google.html
    ```
4. Now reinstall `wget`:<br><br>
    ```bash
  sudo apt-get install curl
   ```
5. Test that it worked by running the same `curl` command again. `google.html` should again be in your working directory (go ahead and delete it once you've verified it's in there).


{:#p2}
## Part 2 (Everyone): Poetry (Python)
**Poetry** is a dependency manager for Python projects that handles dependencies and packaging.

### Exercise 3: Creating a Python Project with Poetry
1. Verify that you're on a local branch called `lab05` (`git branch`). If you're not, jump to the top and re-read the "Before You Begin" section.
1. Check if poetry is already installed by typing `poetry` at your Terminal / WSL command prompt.
3. If it's not, install Poetry:<br><br>
   ```bash
   curl -sSL https://install.python-poetry.org | python3 -
   ```
4. Verify the installation:<br><br>
   ```bash
   poetry --version
   ```
5. Navigate to your `class-exercises-fall2024/lab05` directory.
6. From within the `lab05` directory, create a new Python project using Poetry:<br><br>
   ```bash
   poetry new poetry-demo
   cd poetry-demo
   ```

   Your file structure should look like the one below:
   ```bash
    class-exercises-fall2024
    ├── .git
    ├── .gitignore
    ├── README.md
    ├── lab03
    │   └── answers.md
    ├── lab04
    │   └── answers.md
    └── lab05
        ├── answers.md
        └── poetry-demo
   ```

### Exercise 4: Adding Dependencies
1. Add a dependency, e.g., `requests`, to the project:<br><br>
   ```bash
   poetry add requests
   ```
2. Check that the `requests` package was added to `pyproject.toml` and installed:<br><br>
   ```bash
   poetry show
   ```

### Exercise 5: Running the Project in a Virtual Environment
1. Create a new file in your `poetry-demo` folder called `lab05-experiments.py`. Paste the following starter code inside of it:
   ```py
    import requests

    def main():
        print("hello world")
        # user_agent makes it seem like the request is coming from a web browser (versus a bot)
        user_agent = {'User-agent': 'Mozilla/5.0'}
        response = requests.get("https://new.cs.unca.edu/", headers=user_agent)
        print(response.content)

    if __name__ == "__main__":
        main()
    ```
3. Run this file on the command line using the python virtual environment you just made:<br><br>
    ```bash
    poetry run python lab05-experiments.py
    ```
    It should have outputted the web page from the URL given to the screen.
4. Now run the same python file again (outside of your virtual environment):<br><br>
    ```bash
    python lab05-experiments.py
    ```
    You should see an error.

### Exercise 6:
Now we are going to make the beginnings of a simple web crawler that extracts all of the links from the <a href="https://new.cs.unca.edu/" target="_blank">https://new.cs.unca.edu/</a> page, using another package called beautiful soup. To do this, you will:

1. Install the `bs4` package using poetry
2. Modify the `main` function inside of `lab05-experiments.py` to only output the URLs of any links on the CS homepage.

If you wrote your code correctly, this should be the output (there should be around 85 links total):

```bash
https://unca.edu
https://new.unca.edu/admission/apply/
/
https://new.cs.unca.edu/our-mission/
https://new.cs.unca.edu/our-programs/
https://new.cs.unca.edu/computer-systems-major/
...
```

Hints:
* Beautiful soup is a set of utilities that makes it easy to extract items from web pages. 
* Ask Google or Chat GPT something like: "How to I extract URLs from web pages using the requests and bs4 modules in python?"


### Exercise 6: Removing Dependencies
1. Remove the `requests` and `bs4` packages from the project:<br><br>
   ```bash
   poetry remove requests
   poetry remove bs4
   ```
2. Try running your python script again:<br><br>
    ```bash
    poetry run python lab05-experiments.py
    ```
    What happened?
3. Add `requests` and `bs4` back:<br><br>
   ```bash
   poetry add requests
   poetry add bs4
   ```
4. Try running your python script again:<br><br>
    ```bash
    poetry run python lab05-experiments.py
    ```
    What happened?

{:#p3}
## Part 3 (Everyone): npm (Node.js)
**npm** is the default package manager for Node.js. It helps manage project dependencies.

### Exercise 7: Initializing a Node.js Project
1. Open a terminal and initialize a new Node.js project:
   ```bash
   mkdir node-demo
   cd node-demo
   npm init -y
   ```

### Exercise 8: Installing a Dependency
1. Install the `lodash` package:
   ```bash
   npm install lodash
   ```
2. Verify that the package was installed by checking the `node_modules` folder and `package.json` file.

### Exercise 9: Using the Installed Package
1. Create a file `index.js` with the following content:
   ```javascript
   const _ = require('lodash');
   console.log(_.chunk(['a', 'b', 'c', 'd'], 2));
   ```
2. Run the script:
   ```bash
   node index.js
   ```

### Exercise 10: Removing a Dependency
1. Uninstall the `lodash` package:
   ```bash
   npm uninstall lodash
   ```

{:#p4}
## Part 4: Answer the Discussion Questions
Discussion Questions

---

### Submission
Submit your reflection and screenshots of your terminal for each package manager task to the course’s submission portal.

---



