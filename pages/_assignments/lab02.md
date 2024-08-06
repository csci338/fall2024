---
layout: assignment-two-column
title: "Version Control and Branch Management with git and GitHub"
type: lab
draft: 0
points: 6
abbreviation: Lab 2
show_schedule: 2
num: 2
start_date: 2023-08-31
due_date: 2024-09-04
---

## Introduction
Today we will be practicing collaborating on code by using **git** and **GitHub**. Here are <a href="https://docs.google.com/presentation/d/1_2F_vWW3rLR5vpurtKyS4dnb3EfOVk4aDjLNnwd_HYs/edit?usp=sharing" target="_blank">today's slides</a>.

### Lab Readings

| <span class="pj">required</span> | <a href="https://www.youtube.com/watch?v=_wQdY_5Tb5Q" target="_blank">Collaborating using Git and GitHub</a>: Branches, Pull Requests, Merging vs Rebasing (Video walkthrough) |
| <span class="badge">recommended</span> | <a href="https://www.youtube.com/watch?v=_UZEXUrj-Ds" target="_blank">What is git rebase?</a> |
| <span class="badge">recommended</span> | <a href="https://www.atlassian.com/git/tutorials/comparing-workflows" target="_blank">Article explaining how to rebase + handle merge conflicts</a> |

## Your Tasks

### 1. Add your GitHub username to the spreadsheet
If you haven't already, please register for a GitHub account, and then add your full name and your GitHub username to <a href="https://docs.google.com/spreadsheets/d/1UYLm8ZoEivGhikw6pbh2CTGSh3lixfvceGENRD3z-No/edit?usp=sharing" target="_blank">this spreadsheet</a>. Semmy and I will invite you to be a contributor to the relevant repos.
* Note that **you will have to confirm this invitation** via email.

{:#authentication}
### 2. Set up public / private key authentication for GitHub (and Arden)
When accessing a remote server (including a GitHub server), a common authentication strategy involves using public and private keys. Below, you will go through the process of generating a public / private key. Your private key is for you and you alone. It is your secret, and should not be shared with anyone. Your public key, on the other hand, is typically copied to a server for which you have access.

In the workflow outlined below, all commands should be run from the command line on your  **local computer** (not arden). If you're a Windows user, activate WSL.

#### 2.1. Generate a public / private key pair
To generate a public / private key pair:

* Type the following command: **`ssh-keygen`**
* This will generate your private key inside the `.ssh` folder inside your home directory. Typically, the private key is  called `id_rsa` and the public key is called `id_rsa.pub`.
* Verify that this worked by typing `ls -la ~/.ssh`. You should see both files (with today's timestamp).

#### 2.2. Copy your public key to the appropriate place 

##### On GitHub
1. Follow the <a href="https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account" target="_blank">GitHub instructions</a>

##### On Arden (Optional but Recommended)
1. Copy your public key into your home directory on arden. One way of doing this is by using the **`rsync`** utility:<br>`rsync ~/.ssh/id_rsa.pub <your_arden_username>@arden.cs.unca.edu:~/.`
1. Configure your public key on arden:
    * ssh into arden: `ssh <your_arden_username>@arden.cs.unca.edu`
    * Verify that the `id_rsa.pub` file is now in your home directory.
    * If your home directory on the remote server doesn't already contain a `~/.ssh/authorized_keys` file, create oneas follows:
        * `mkdir -p ~/.ssh`<br>`touch ~/.ssh/authorized_keys`
    * Then, append your public key to the `authorized_keys` file: `cat ~/id_rsa.pub >> ~/.ssh/authorized_keys`
    * Finally, delete your public key from your home directory on arden (you don't need it anymore):<br>`rm ~/id_rsa.pub`

That should be it! Read More here: <a href="https://kb.iu.edu/d/aews" target="_blank">https://kb.iu.edu/d/aews</a>

### 3. Set up a local copy of the coursework repository
In this class, we're going to have two repositories:
* **`class-exercises-fall2024`** -- For in-class exercises and labs
* **`app`** -- for our class project

Before we get into the details of the GitHub workflow, let's set up a clone of **`class-exercises-fall2024`** on your laptop while practicing some basic git commands. Please complete the following tasks:

1. Within your `csci338` directory, clone the `class-exercises-fall2024` repo using the **ssh method** (while in the `csci338` directory on your local computer): <br>`git clone git@github.com:csci338/class-exercises-fall2024.git`
1. Look at commit history (`git log`)
1. Create a new branch called `<your-username>`
    * For instance, Sarah would create a branch called **vanwars**: `git checkout -b vanwars`
1. Create a folder named `<your-github-username>` (e.g. Sarah would create a folder called `vanwars`) within the `class-exercises-fall2024` folder on your new branch.
1. Within the `<your-github-username>` folder, create a text file called `README.md` (note the case). 
1. Within the `README.md` file, add the sentence “hello world!” (or anything, really). You can use vim, VS Code, or another text editor.
1. Issue the `git status` command. What happened?
1. Stage your changes using `git add .` (the dot indicates that you want to stage all of the files that have been added / deleted / edited).
1. Commit your changes using `git commit -am "adding my user directory"`.
1. Push your branch to GitHub (`git push`)
    * Note, typing `git push` will display an error with a suggested push command (e.g., `git push --set-upstream origin <your-branch-name>`).
1. Create a pull request.

#### A note on your origin path
Within git, your **`remote origin`** variable holds both the address and the protocol you will be using to interact with a remote server (like GitHub). Some of you are accessing the remote server using the **https** protocol while others are using the **ssh** protocol. For the sake of simplicity, let's all use **ssh**. To check your origin, type: `git remote show origin`.

If it prints `git@github.com:csci338/class-exercises-fall2024`, you don't have to do anything. Otherwise, let's switch up your origin protocol to ssh as follows:

```bash
git remote rm origin  # removes current references
git remote add origin git@github.com:csci338/class-exercises-fall2024.git  # adds new reference
git remote show origin  # prints the new origin (which should be the correct one).
```

### 4. Set up the course project repo

#### 4.1. Clone app
1. Within your `csci338` directory, clone the course app repo **via ssh**:<br>`git clone git@github.com:csci338/app.git`
    * Be sure you don't accidentially put `app` underneath `class-exercises-fall2024`.

#### 4.2. Make a new branch
1. Create a new branch called `<your-username-readme>` 
    * For instance, Sarah would create a branch called **vanwars-readme**: `git checkout -b vanwars-readme`
1. Open the existing `README.md` file. At the bottom, add an entry with your name and your GitHub username. Please add your information so that the table is sorted in alphabetical order by last name. 
2. `add`, `commit`, and `push` your changes to a remote branch of the same name.
3. Create a pull request

#### 4.3. Resolve push / pull conflicts
1. Once your branch is approved, check it to ensure that there are no conflicts with the `main` branch.
1. If there are conflicts, follow the steps below:

##### Workflow for resolving conflicts
```bash
git checkout main  # checkout the main branch again
git pull # pull down the changes that have happened since you last pulled / cloned
git checkout <your-username>-readme # switch back to your branch
git rebase main # try to rebase

# Manually resolve the conflict and then continue steps below...

git status
git rebase --continue  # continue the process
git push # should reject your change
git push --force # force the change
```

#### 4.4. Incorporate your changes to main
When you're done, ask Semmy or Sarah to incorporate your changes to main.

## What to Turn In
Make sure that the following are completed before Wednesday (9/6) at midnight:

{:.checkbox-list}
* You have successfully committed and pushed your **username** directory and `README.md` file to the `class-exercises-fall2024` repo (<a href="https://github.com/csci338/class-exercises-fall2024" target="_blank">https://github.com/csci338/class-exercises-fall2024</a>).
* You have successfully committed and pushed your `README.md` edits to the `app` repo (<a href="https://github.com/csci338/app" target="_blank">https://github.com/csci338/app</a>).