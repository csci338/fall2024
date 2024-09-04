---
layout: module
title: Git Collaboration Activity
type: activity

---

> Credit: This activity was designed by Semmy Purewall

This activity is designed to be completed entirely in class. The goals with this activity are as follows:

1. Practice with merge conflicts
2. Practicing with various merging/rebasing strategies
3. More practice with basic git & CLI stuff

## Setup

For this activity, you'll work with (at least) one other person. To
bootstrap, you'll both create a new git repository called
merge-activity.

On the command line (Windows users use WSL, create a new directory at the root of your `csci338` folder:

```bash
$ mkdir merge-activity
```

1. Navigate into the directory (`cd merge-activity`)
2. Initialize a new git repository (`git init`)
3. Create a README.md file with a header
1. State your `README.md` file using `git add .`
4. Commit it (`git commit -m "Added README.md"`)

Next add a `my_code.py` file. It should look like this.

```py
def say_hello() -> None:
    print("hello world!");


if __name__ == "__main__":
    say_hello();
```

Commit it.

Now create a github repository for this and push it. Let's keep it a
private repository for now.

After a successful push, add your collaborator to the
repository. Next, change directory back into your `csci338` directory and clone your partner's repository, but let's change the name
when cloning (so as to not create a conflict with your
`merge-activity` repository) like this:

```bash
$ # make sure you're in your csci338 directory
$ git clone git@github.com:<owner-username>/merge-activity.git <your-username>-merge-activity
```

For instance, if Sarah was cloning Walter's repository, she would type:

```bash
$ git clone git@github.com:walter/merge-activity.git walter-merge-activity
```

* Sarah's repository: merge-activity
* Walter's repository: walter-merge-activity

Now you should have two versions of the respository: yours (`merge-activity`) and your partners (`<owner-username>-merge-activity`). List the contents of your `csci338` directory to confirm that this is the case.

## Creating a Conflict

**Pick one of the two github repositories to use for this section.** We'll
refer to the repository owner as "owner" and the other person as the
"collaborator" from here on out.

We're going to work on two features in parallel now. The owner will
work on Feature A and the collaborator will work on Feature B. The
owner of the repo will change directories to their home directory and
then go into `merge-activity` activity directory like this:

```bash
$ cd merge-activity
```

The collaborator will go into their clone of the owner's repo on their
computer.

```bash
$ cd <username>-merge-activity
```

These two repositories should have the same remote urls. 

**Question:** Which Git subcommand can you use to confirm that? Go ahead and confirm it.


**Answer:** `git remote show origin`


Complete the next two sections in parallel.

### Feature A

This feature will be implemented on the `main` branch.

**The owner of the repository** should complete Feature A. Instead of always printing "hello world", let's make your function print out "hello \<name\>" where "\<name\>" is specified as a parameter to the
function. In other words, when called like this:

```py
say_hello("Walter")
```

It will print out:

```bash
hello Walter!
```

Once this is tested and working commit it locally, then **push your main branch to the
remote repository** on GitHub.

### Feature B

The collaborator will complete this feature on a branch. First, create
and check out a branch.

```bash
$ git checkout -b feature-b
```

Now implement feature-b. Allow an argument to specify the number of
times the message should be repeated. So if it's called like this:

```py
say_hello(3)
```

It will print out:

```bash
hello world!
hello world!
hello world!
```

Once you're happy with your change, commit it locally, but **do not push
anything yet.**

## Merging

Once you're both finished with the sections above, you'll work
together on this section on the **collaborator's** computer.

At this point, we are in the situation where you are in a feature
branch, but main is ahead.

![image](/fall2024/assets/images/activities/feature_branch_main_ahead.png)

Check the state of your git repository and make sure you're on the
`feature-b` branch. Let's  checkout `main` on your laptop and then  pull your partner's
changes down from GitHub.

```bash
$ git checkout main
```

Confirm you're on the main branch now.

```bash
$ git pull origin main
```

Now take a look at the history and make sure you see the commit that
implements feature A. Let's check out feature-b.

```bash
$ git checkout feature-b
```

Let's take a look at the history again. Do you see the commit with
feature A? Probably not, but you can see it by doing this:

```bash
$ git log --all
```

And if you want a visual representation, add the `--graph`
option. Where is `HEAD`? Where is `feature-b`?

```bash
$ git log --all --graph
```

Let's merge the branches! First, check out main again. Take a look at
the history (with all commits and the graph option enabled). Where is
`HEAD`?

Now let's use the `merge` subcommand to merge the branches. Make sure
you're on `main` and then run:

```bash
$ git merge feature-b
```

This attempts to merge the `feature-b` branch into the `main`
branch. It should look something like this:

```bash
<<<<<<< HEAD
[Feature A Code]
=======
[Feature B Code]
>>>>>>> feature-b
```

Note that `[Feature A Code]` will be replaced with the actual code
associated with Feature A. The top part represents the state of the
code at your `HEAD` (in this case, `HEAD` is an alias for `main`).

Before going further, take a look at the state of your
repository. Note that `git` gives you helpful instructions on how to
proceed -- you can either fix the conflicts and then run `git commit -m "some message"`
which will create your merge commit, or you can abort the process
altogether.

Your job is now to reconcile these conflicts, and remove the merge
conflict separators. Do that now. At the end of your reconciliation,
both features should work as expected. You can test them by running it
with Python.

Once that's done, let's take a look at the state of the repo
again. Git should tell you that you're good to go!

```bash
$ git status
```

Let's take a look at the log with the `--graph` option. You should see
your merge commit with two parent pointers.

Commit and Push the changes to the main branch on Github, and take a look at all
the commits.

## Rebasing

Let's reverse roles now so that the owner becomes the collaborator and
vice-versa. Change directories into the other repository that was
created and clone at the beginning, and reimplement Feature A and
Feature B. Like before:
* The owner will be working on the `main` branch and the collaborator will be working on a branch called `feature-b`.

Once again, you'll collaborate on the **collaborator's** computer (but
the other person should be the collaborator now). We'll do a rebase and
fast-forward this time, instead of a merge. Start by examining the
history as described above. Take a note of the commit hash of
`feature-b`. After a successful rebase, that should change (since
we're creating a new commit).

Next, we'll rebase `main` on the `feature-b` branch, then fast-forward
merge feature-b back into `main`. So check out the `feature-b`
branch. And then, after confirming you're in the right place, the collaborator should do the rebase.

```bash
$ git rebase main
```

Git will try to "replay" the new commit in `main` on top but it will hit
the same conflict we saw in the merge case. Read the message Git outputs.

Now take a look at the code. You'll see it looks something like this.

```bash
<<<<<<< HEAD
[Feature A Code]
=======
[Feature B Code]
>>>>>>> 1a0ffaa (Add feature b)
```

In this case `HEAD` is `main` again, since we checked it out to replay
the commits on top. Check the status of the repository, and read all
the hints Git is giving you. Fix the conflicts as you did this time.

Once you're done, check the status again and read the message. 

**Question:** What should you do now? Go ahead and do it.

**Answer:** `git rebase --continue`

Once that's done, you've successfully rebase `main` onto
`feature-b`. Check the history and note that the commit hash
associated with `feature-b` has changed as we expected!

We're not finished yet, because we wanted to get `feature-b` into
`main`. Now that `main` is no longer ahead, we can do a fast-forward
merge into main. To complete this, check out the main branch and do a
merge.

```bash
$ git checkout main
$ git merge feature-b
```

Read the output. Now take a look at the history with the `--graph`
option. How is the history different from the merge above? Do you see
a merge commit?

Push the changes to Github and take a look at the commits.

Now you've successfully fixed some merge conflicts, merged, and
rebased. Do you have any opinions on which is better? Talk with your
partner about your newly found strong opinions.