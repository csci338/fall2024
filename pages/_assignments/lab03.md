---
layout: assignment-two-column
title: "Version Control and Branch Management with git and GitHub"
type: lab
draft: 1
points: 6
abbreviation: Lab 3
num: 3
start_date: 2024-09-05
due_date: 2024-09-08
---

## Lab Readings

| <span class="pj">required</span> | <a href="https://www.youtube.com/watch?v=_wQdY_5Tb5Q" target="_blank">Collaborating using Git and GitHub</a>: Branches, Pull Requests, Merging vs Rebasing (Video walkthrough) |
| <span class="badge">recommended</span> | <a href="https://www.youtube.com/watch?v=_UZEXUrj-Ds" target="_blank">What is git rebase?</a> |
| <span class="badge">recommended</span> | <a href="https://www.atlassian.com/git/tutorials/comparing-workflows" target="_blank">Article explaining how to rebase + handle merge conflicts</a> |

The goals with this lab are as follows:

1. Let's get more familiar with git!
2. Practice adding and committing.
3. More practice with the linux command line.

## Basics

1. Sync your fork of the `class-exercises-fall2024` repository in Github.
1. On your laptop, navigate to your version of `class-exercises-fall2024`, located inside of your `csci338` folder.
1. Check with branch you're on using the `git branch` command.
1. Check if you have any changes you haven't yet staged and committed using the `git status` command. If you have lingering changes, stage and commit them. 
1. Checkout the main branch: `git checkout main`
1. Pull the latest changes from your remote main branch into your local main branch: `git pull origin main`
1. Creatr a new branch to do our work for lab 3: `git checkout -b my_lab3_work`

Now create a new file inside the `lab3` directory called
`answers.md`. Use this markdown file to answer questions as you're
going through the lab.

**Note:** Whenever the lab says "What do you see?" that means to copy
  the command and the output to your `answers.md` file. You should do
  this in Markdown's preformatted mode which is simply 3 backticks
  before and after the block. You can see examples throughout this
  file (open it as plain text in your text editor).

### Getting Help

Git has fairly good documentation that's easily available (and often
faster than using Chat GPT). Read through
[this](https://git-scm.com/book/en/v2/Getting-Started-Getting-Help) to
see how to access it.

### Create a New Git Repository

We're going to create a new repository for code exercises. Start by
creating a directory called `exercises` using the `mkdir` command.

```
$ mkdir exercises
```

Now confirm it's created using the `ls` command, and -- assuming it is
-- change your working directory to the new directory.

Let's start by creating a new markdown file called `readme.md`. Add a
header to the top.

Great! First let's try to commit this.

```
$ git add readme.md
```

Oh no! Something went wrong. What error do you see?

The problem is we haven't created a repository yet. Before we fix
this, let's take a look at what we have in the directory using the
`ls` command, along with the flags to show all hidden files. If you
don't remember those flags, go back and check out lab 2.

You should see a single file, the `readme.md` file you made. Now let's
initialize the our new git repository.

```
$ git init
```

Git will initialize a repository for you and give you a hint. Read the
hint. Let's use `main` for our default branch name and set it as such
in our git config as described in the hint. You can confirm the change
was made by catting your `~/.gitconfig` file. Copy the result of the
`cat` command to your `answers.md` file.

Let's also rename the current default branch to `main` as described in
the hint.

Now let's list the contents of the directory again. Do you see
anything new? Is it a directory or a file? How can you tell?

List the contents of the new directory. What do you see? This is Git's
internal implementation. You generally won't have to look in here, but
whenever you're working in a Git repository, this special directory
will exist.

### Our First Commit!

Git is _stateful_ and _modal_, which means that it sometimes behaves
differently depending on what state or mode it's in. It's a good idea
to get in the habit of checking Git's state prior to making any
changes. Let's do that now with the `status` subcommand.

```
$ git status
```

What do you see? Copy the output to your `answers.md` file.

The key things you're looking for is the `branch` you're on (in this
case, `main`) and a list of untracked files (in this case, just
`readme.md`).

Let's add `readme.md` to Git's staging area using the `add`
subcommand.

```
$ git add readme.md
```

Hmmmm, there was no output from that command. What to do? Is there a
way you can check the state of git to confirm that your file was added
(hint: see above)?

Note that `readme.md` is under the `Changes to be committed` header
now. That means this file will be included on our next commit. Let's
do that now.

```
$ git commit -m "add readme.md to the repository"
```

What do you see? After you commit this, let's check the state of the
repository. What do you see?

Now that our repository has history, let's explore that history. To do
that, we use the `log` subcommand.

```
$ git log
```

What do you see? The [`log`
subcommand](https://git-scm.com/docs/git-log) has a lot of great
features that we'll want to use going forward, but for now let's just
bask in the glory of the fact we've created a brand new git repository
and made our first commit to it!

Now let's modify our file.  Open `readme.md` and add the following
description of the first problem we are going to solve, and then save
the file.

```
1. Write a function that takes in a list of integers as an argument
and returns true if it contains two integers that are the same, false
otherwise.
```

Now that we have a change, let's check Git's state. What's different
about this message than when we first added the `readme.md` file?

You can see what has changed between the previous commit and now with
the `diff` subcommand.

```
$ git diff
```

What do you see? Let's add this change to Git's staging area and
commit it with a commit message "add first problem".

### Reflection and Review

We've learned 5 git subcommands now. In your `answers.md` file,
describe each of them in your own words.

### Practice

**DO NOT USE CHAT GPT FOR THIS SECTION**

You may use Google, but you may not cut and paste any code.

Let's write some code. Create a new directory called `java` and let's
answer that first coding question in a file called `OneLoop.java`. Use
nested loops for this one, and your `main` function should create a
few examples to confirm that it's working correctly.

You can compile and run your code using:

```
$ javac OneLoop.java
$ java OneLoop
```

Once you have that working, let's add it and commit it to the
repository.

## Github

Github is not Git. Github is essentially a code management platform
that creates an ecosystem of software-related tools around Git. It's a
solid choice for code management if you're using Git, but it does have
limitations.

In this section, we'll push our repository to Github.

### Create a New Repository

On Github, click the "New" button that's next to your list of
repos. Let's call it "lab3" or something similar. You may make it
Private, but if you do you'll need to add me as a collaborator lately.

You can leave everything else unchecked (i.e. Add README, Add
.gitignore, Choose license) for now.

Once you click the green "Create repository" button, you'll see some
instructions. We're going to follow the ones labeled "push an existing
repository from the command line."

Note that the second command is redundant since we already call our
default branch `main`. But let's go ahead and do it anyway.

Once you push, reload the Github page in your browser, and you should
see your readme file in all its glory!

### Git is Distributed

What we've done is we've created a _copy_ of our repository on
Github's servers. In Git, a copy of the repo living somewhere else is
called a `remote`. Note that this doesn't mean that Github is the
"source of truth" for our code, it just means that Github is a
copy. By convention, we can think of the Github version of our code as
the source of truth, and the clones that live everywhere else as
secondary, but we don't have to.

We can even create other remotes, other than "origin" if we want. The
`remote` subcommand will list all of our remotes (using the `-v` flag
will show us 'verbose' details).

```
$ git remote -v
```

Once we make a _local_ change to our repository, we have to _push_ the
changes to our remote to see them reflected.

### More Practice

**DO NOT USE CHAT GPT FOR THIS SECTION**

You may use Google, but you may not cut and paste any code.

Let's add a directory called `python` and repeat this exercise in
Python. Generally, Python doesn't use CamelCase for filenames, so name
your file `one_loop.py`. Here's a basic python skeleton program you
can run.

```
def one_loop(l: list) -> bool:
    print(l)

if __name__ == "__main__":
    one_loop([1,2,3,4]);
```

You can run it like this:

```
$ python one_loop.py
```

Go ahead and modify the `one_loop` function so it works as we
described. Once you have it working, add it and commit it to the
repository. Take a look at your Git history. What do you see? Take a
look at your repo on Github and click on the "commits" link. Do you
see the commit you just made?

Let's take a look at the state of our local repository first. What do
you see? Do you see any messages that suggest that there's a
difference between your local repository and the remote repository?

Now let's push these changes to our remote.

```
$ git push origin main
```

Reload the `commits` page in Github and you should see your
changes. Check the state of your local repository and notice that the
message describing the difference is now gone!

## Branching

So far we've been committing directly to the `main` branch and pushing
that branch to the remote. This is fine for personal projects, or
experimental codebases. It's not fine for production projects that
have users.

Generally speaking, on collaborative projects we'll consider our
`main` branch on our `origin` remote sacred. Indeed, it's probably
good practice to keep the `main` branch of your local repository
sacred as well. Generally, this means we will never commit _directly_
to the `main` branch anywhere. Instead we will commit to a local
_branch_ and then use a process called a Pull Request to get our local
branch into our remote `main` branch, then we'll use `fetch` and
`pull` to sync our local branch with the remote.

This is convenient because it allows us to apply some basic _process_
to our pull requests (e.g. static analysis, testing, code review) to
make sure only quality, working code makes it into our _main_ branch.

Let's start by listing all of our branches using the `branch`
subcommand.

```
$ git branch
* main
```

You only have the main branch. Let's create a new branch in our
`exercises` repository.

```
$ git branch one-set
```

Hmmmm. No output. Let's rerun the command from above to see our
branches.

```
$ git branch
* main
  one-set
```

The asterisk (*) means you are still on the `main` branch. You can
also see this by checking the state of your repository. Do that. Where
do you see that specified?

Let's `checkout` the `one-set` branch.

```
$ git checkout one-set
```

I just described two ways to determine which branch you're currently
on. Do both of those to confirm you are indeed on the `one-set`
branch.

Let's open up our `readme.md` file again and under question one, let's
describe the two different solutions in english. The first solution is
the nested loop solution. The second solution is to use a set or a map
as I described in class. Describe both in as much detail as you can
(with no code) and describe the trade-offs between the two solutions.

Now let's commit our code. Note that as long as you're on the correct
branch, all git operations will happen on that branch. Maybe check
you're on the correct branch one more time? Once you're confident, add
and commit your changes.

Now let's look at our history again. You should have several commits
now. One of those commits is the top of `main` and one of those
commits is the top of `one-set`. There's also one that's labeled
`HEAD`. Which one?

Now let's checkout our `main` branch and check our history
again. What's different? Is `HEAD` the same? Describe in english what
happened here.

### Still More Practice

**DO NOT USE CHAT GPT FOR THIS SECTION**

You may use Google, but you may not cut and paste any code. It's much
better to only use the documentation for the [Python
Set](https://docs.python.org/3/tutorial/datastructures.html#sets) or
the [Java
Set](https://docs.oracle.com/javase/8/docs/api/java/util/Set.html).

Now we're going to solve the question one using a Set data structure
instead of nested loops. You may do this in either Python or Java,
just make sure to name your new file appropriately.

Once you're done, commit your changes to the `one-set` branch. Double
check you're on the right branch before committing.

Remember the `diff` subcommand? Note that you can use the `diff`
subcommand to compare your two branches!

```
$ git diff main..one-set
```

### Pull Requests

Let's create a pull request by pushing our local branch to our
remote. Previously, we pushed to `main` but we don't want to do that
anymore. Instead, we want to push to our new branch.

```
$ git push origin one-set
```

What do you see? Note that there's a URL there that will take you to a
page that allows you to immediately create a pull request. Instead of
doing that, visit the homepage of your repository on Github. Notice
that at the top it also allows you to create a pull request.

Before doing that, notice that the dropdown that says `main` also
shows your new branch! You can click the drop-down and explore the
code in your branch before making a pull request.

Let's make a pull request now. You can do it in either of the two ways
that I described above.

Notice that the pull request title is pre-populated based on your
commit message. That may be okay, but if you have multiple commits in
your branch you might want to change it.

More interesting is the `Preview` tab. Github supports Markdown for
your pull request description! This means you can easily add links,
lists, and preformatted code snippets to your pull request
description. Add all of those things.

You can also add screenshots fairly easily. Take a screenshot of your
VS Code instance or of your SSH window. Once it's on your clipboard,
you can paste it directly in the description edit box. It will upload
the image and add some markdown. Now click on the Preview tab and you
will see it!

Create your pull request. In the upper right hand section, you'll see
the "Reviewers" section. Add me as a reviewer. If your repository is
private, you'll need to add me to it first by going into the
repository settings and adding me under "Collaborators".

### Merging a Pull Request

Click on the drop-down arrow in the green "Merge pull request"
button. There are three options there. Based on our discusssion in
class, what do the three options mean? Add them to your `answers.md`
file.

No need to wait for me to actually review it. Go ahead and choose
"Rebase and Merge" and then delete the branch.

### Post Merge

Perhaps interestingly, merging doesn't actually change anything in
your local repository. You can confirm this by examining the state of
both of your branches in your local repository.

You can pull the latest updates in your remote repository without
affecting your local repositories by using the `fetch` subcommand.

```
$ git fetch
```

Now check the state of the two branches on your local repository. What
do you see?

You can use `pull` to actually pull the latest changes into your local
branch. In this case, on the main branch, pull the changes.

```
$ git pull
```

Now you can delete your local `one-set` branch since we don't need it
anymore.

```
$ git branch -D one-set
```

## Submission

Commit your `answers.md` to your branch in the `software-engineering` repository and make a pull request. Include some markdown and a screenshot (or some other pic) in your Github description.

## Summary

We've learned a lot about Git in this lab, but much of it should have
been familiar from Lab 1 and Lab 2. You should be comfortable with the following git subcommands:

* init
* add
* commit
* log
* diff
* remote
* push
* branch
* checkout
* fetch

Now that you're finished, let's read the the following sections in
[Pro Git](https://git-scm.com/book/en/v2). They should be mostly
review at this point, but there's a few new things in there.

* Chapter 2, sections 1, 2, 3, 4, 5
* Chapter 3, sections 1, 2, 3, 6