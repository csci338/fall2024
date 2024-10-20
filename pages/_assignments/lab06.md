---
layout: assignment-two-column
title: "Testing & Static Analysis"
type: lab
draft: 1
points: 6
abbreviation: Lab 6
num: 6
start_date: 2024-10-29
due_date: 2024-11-03

---

## 1. Reading & Reference Materials

* <a href="https://circleci.com/blog/unit-testing-vs-integration-testing" target="_blank">High-level overview of unit v. integration testing.
* <a href="https://abseil.io/resources/swe-book/html/ch11.html" target="_blank">Chapter 11. Testing Overview</a>
* <a href="https://programmingwithmosh.com/wp-content/uploads/2019/02/Python-Cheat-Sheet.pdf" target="_blank">Python Reference</a>
* <a href="https://quickref.me/javascript.html" target="_blank">JavaScript Reference</a>

## 2. Introduction & Background
For the final class project, we will be collaboratively building a full-stack web application using Python and JavaScript. To successfully pull this off, you will need some familiarity with these languages, as well as knowledge of how to write good tests. Give this, this lab has been designed to help you practice these skills.

In this lab you will be doing a few things:
1. Syncing the latest changes from  <a href="https://github.com/csci338/class-exercises-fall2024" target="_blank">class-exercises-fall2024</a>.
1. Doing some JavaScript tasks ([described below](#4-javascript-tasks)), including:
    * Implementing a "rock paper scissors" function
    * Writing "vanilla" unit tests for your function
    * Re-writing your tests using the `mocha` module (a testing framework)
    * Running the JavaScript static analysis and code formatting tools to ensure clean, consistent code 
1. Doing some Python tasks -- doing the same stuff you did in JavaScript, but in Python ([described below](#5-python-tasks)), including:
    * Implementing the same "rock paper scissors" function
    * Writing "vanilla" unit tests
    * Re-writing your tests using the `unittest` module
    * Running the Python static analysis and code formatting tools to ensure clean, consistent code 
1. Creating a pull request when you're done ([described below](#6-what-to-submit))

## 3. Set Up
Before you begin, get the latest code from class-exercises-fall2024

**On GitHub:**
* Sync the latest changes from the class version of `class-exercises-fall2024` to your copy of the repo.

**On your local computer:**
* Make sure that all of your changes from the last lab are staged and committed.
* Checkout your main branch: `git checkout main`
* Pull down the latest changes: `git pull`
    * If you did it correctly, you will notice that a new `lab06` folder has been created.
* Create a new branch called lab06: `git checkout -b lab06`
* Verify that you're on your new branch: `git branch`

You will be editing **your copy of the `lab06` files** (inside the `your-username` folder). Don't edit or delete the original `lab06` files.

## 4. JavaScript Tasks
Begin by completing the JavaScript tasks, which are located in the `javascript_rps` folder (`rps` stands for "rock paper scissors"), as described below:

### 4.1. Implement the "Rock Paper Scissors" function
Open `your-task.js` and take a look at the `rps` function, which should look like this:

```js
export function rps(hand1, hand2) {
    // finish this code:
    if (hand1 === "rock" && hand2 === "paper") {
        return "Paper wins!";
    } else {
        return "invalid";
    }
}
```

Your job is to implement the following "rock paper scissors" logic and return the corresponding message (exactly as it is shown below):
* If one hand is **rock** and the other is **paper**, return the string **"Paper wins!"**
* If one hand is **paper** and the other is **scissors**, return the string **"Scissors wins!"**
* If one hand is **scissors** and the other is **rock**, return the string **"Rock wins!"**
* If both hands are the same (and have valid arguments), return **"Tie!"**
* If anything other than rock, paper, or scissors are passed in, return **"Invalid"**

### 4.2. Writing tests without a framework
As you are writing your `rps` function, write corresponding tests to verify your implementation for different possible arguments that a user might pass in. 

You will first write some tests *without* a framework. To help you, I have written two helper functions in `helpers.js`. The high-level point here is that **anyone can write and run tests -- simply and easily -- without using a fancy testing library**. Please open the `run-tests-vanilla.js` file to inspect how these two helper functions are used. Pause and try and understand what this code does.

When you've thought about it, please run the test suite by navigating into the `javascript_rps` file and running the following command:

```shell
npm test
```

Your should see the following output:

```shell
> node run-tests-vanilla.js

----------------------------------------------------
✅ Success: it returns "Hello world!"
✅ Success: paper beats rock
❌ Failure: paper beats rock (flipped)
----------------------------------------------------

😬 Only  2 out of 3 tests passed.
```

To understand what the `npm test` command did, open the `package.json` file and see if you can see what the `npm test` command does.

Please write all the tests to ensure that the relevant possible inputs yield the expected output. As you make new test functions, don't forget to add the name of the function definition to the list of tests that are passed into the `runAllTests` function (at the bottom of the file).


### 4.3. Writing tests with a framework (Mocha)
Now that you have implemented the `rps` function and written the corresponding tests using "vanilla" JavaScript, you are going to rewrite your tests to use **Mocha** -- a JavaScript testing framework. 

#### Install Mocha
Mocha offers a set of functions and objects that organize your tests and make them easier to define and write. It also requires that all tests be placed in a folder called `tests`. Install Mocha via the npm package manager by typing the following command on the CLI:

```bash
npm install
```

This command reads the `package.json` file and installs all of the specified dependencies in a folder called `node_modules`. Open up the `node_modules` folder and look at all of the dependencies that were just created! Is `leftpad` in there :)?


#### Run the mocha tests
To run the tests, you must do two things. First, modify `package.json` by setting the test value to "mocha" (instead of "node run-tests-vanilla.js"):

```json
"scripts": {
    "test": "mocha"
}
```

Second, issue the following command on the CLI:
    
```
npm test
```

If you did it correctly you should see output that looks like the following:

```bash
> mocha



  Hello World Tests
    ✔ returns "Hello world!"

  Rock Paper Scissors Tests
    1) knows that paper beats rock


  1 passing (3ms)
  1 failing

  1) Rock Paper Scissors Tests
       knows that paper beats rock:

      AssertionError [ERR_ASSERTION]: 'invalid' == 'Paper wins!'
      + expected - actual

      -invalid
      +Paper wins!
      
      at Context.<anonymous> (file:///Users/svanwart/unca/csci338/fall2024/course-website/course-files/labs/lab06/javascript_rps/test/run-tests-mocha.js:60:16)
      at process.processImmediate (node:internal/timers:478:21)
```


#### Rewrite your tests using the Mocha conventions
Once you have successfully run the tests, open the `tests/run-tests-mocha.js` file and see if you can understand what's going on. Pause and think. What is the same and what is different?

After inspecting the code, please add new mocha tests to exhaustively test the `rps` function using the Mocha helper functions. Note that instead of your functions returning **true** or **false**, you need to use Node's built-in `assert` module.


### 4.4. Running the static analysis / code formatting tools
TBD:
1. Install X, Y, and Z
2. Modify the `package.json` as follows:
   ```
   TBD
   ```
3. Run X command. What happened?
4. Run Y command. What happened?

Weee.

## 5. Python Tasks
When you've completed your JavaScript tasks, you're going to do the same thing all over again, using Python. The Python version of these files is located in the `python_rps` folder. Please navigate to it using your CLI.

### 5.1. Implement the "Rock Paper Scissors" function
Open `your-task.py` and take a look at the rps function, which should look like this:

```python
def rps(hand1, hand2):
    # finish this code:
    if hand1 == "rock" and hand2 == "paper":
        return "Paper wins!"
    else:
        return "Invalid"
```

Your job is to implement the function using the same logic as described above.


### 5.2. Writing tests without a framework
As you are writing your rps function, write corresponding tests to verify your implementation for different possible arguments that a user might pass in.

Like before, you will first write your tests without a framework. To help you, I have written two helper functions in `helpers.py`. Please open the `run_tests_vanilla.py` file to inspect how these two helper functions are used. Pause and try and understand what this code does.

When you’ve thought about it, please run the test suite by navigating into the `python_rps` folder and running the following command:

```bash
python3 run_tests_vanilla.py
```

You should see the following output:

```bash
python3 run_tests_vanilla.py
--------------------------------------------------
✅ Success: It returns "Hello world!"
✅ Success: Paper beats rock
❌ Failure: Paper beats rock (flipped)
--------------------------------------------------

😬 Only  2 out of 3 tests passed.
```

Please write additional tests to ensure that all possible inputs yield the expected output. As you make new test functions, don’t forget to add the name of the function definition to the list of tests that are passed into the `run_all_tests` function (at the bottom of the file).

### 5.3. Writing rests with a framework (unittest)
Now that you have implemented the rps function and written the corresponding tests using “vanilla” Python, you are going to rewrite your tests to use **unittest** – a built-in Python module is part of the Python language. Like Mocha, **unittest** offers programmers a set of convenience functions and classes for organizing and writing tests.

Learn more here: <a href="https://docs.python.org/3/library/unittest.html" target="_blank">https://docs.python.org/3/library/unittest.html</a>


Please open `run_tests_framework.py`. In this file, a "starter" test class has been defined for you. It includes two starter tests that you can use a model for writing your tests. 

#### Run the unittest tests
To run the `unittest` version of your tests, issue the following command on the CLI (from within the python_rps directory):

```bash
python3 run_tests_framework.py --verbose
```

If you did it correctly you should see output that looks like the following:

```bash
test_hello_world (__main__.TestStringMethods.test_hello_world) ... ok
test_paper_beats_rock (__main__.TestStringMethods.test_paper_beats_rock) ... FAIL

======================================================================
FAIL: test_paper_beats_rock (__main__.TestStringMethods.test_paper_beats_rock)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/svanwart/unca/csci338/fall2024/course-website/course-files/labs/lab06/python_rps/run_tests_framework.py", line 51, in test_paper_beats_rock
    self.assertEqual(rps('paper', 'rock'), 'Paper wins!')
AssertionError: 'Invalid' != 'Paper wins!'
- Invalid
+ Paper wins!


----------------------------------------------------------------------
Ran 2 tests in 0.000s

FAILED (failures=1)
```

#### Rewrite your tests using the unittest conventions
Once you have successfully run the tests, open the `run_tests_framework.py` file and see if you can understand what’s going on. Pause and think. What is the same and what is different?

After inspecting the code, please add new `unittest` tests to exhaustively test the rps function using the helper functions. Note that instead of having your functions return **True** or **False**, you will now need to use the unittest.TestCase methods. Examples:

* `self.assertTrue`
* `self.assertEqual`

A list of possible methods is described here: <a href="https://docs.python.org/3/library/unittest.html" target="_blank">https://docs.python.org/3/library/unittest.html</a>


### 5.4. Running the static analysis / code formatting tools
Performing 

## 6. What to Submit
When you're done, push your `lab06` branch to GitHub and make a pull request. Please ensure that the destination (left-hand side) is pointing to the `main` branch of **your repo** and the source (right-hand side) is pointing to the `lab06` branch of **your repo**

You will have one week to complete this assignment.