---
layout: assignment-two-column
title: Code Editors
type: lab
draft: 0
points: 6
abbreviation: Lab 1
num: 1
start_date: 2024-08-22
due_date: 2024-08-27
---

## Introduction
Welcome to your first CSCI 338 lab! The goal of today's lab is to get you a little more comfortable doing "configuration things," including working on the command line, configuring your command line environment, and working with command line code editors. You will complete the following tasks:
1. [VS Code Exercises](#vscode)
1. [Command Line Exercises](#command-line)
1. [OS Environment Exercises](#dot-files)
1. [Vim / Emacs Exercises](#vim-emacs)

**We have curated a list of useful resources on the [course resources page](../resources/).** Please see the "Command Line" and "Code Editors" sections:


{:#vscode}
## Part 1. VS Code Exercises

### 1.1. Install VS Code and Extensions
Please install [VS Code](https://code.visualstudio.com/download). When you're done, please install the following VS Code Extensions:
* Live Server (by Ritwick Dey)
* Prettier (by Prettier should have the blue "verified" badge)
* Prettier ESLint (by Rebecca Vest)
* Remote - SSH (by Microsoft)

To install VS Code Extensions:
* Open the extensions window by either clicking the extensions icon (looks like 4 squares on the gray, left-hand bar) or use the keyboard shortcut (Shift+Cmd+X or Shift+Ctrl+X).
* Search for the extension name using the search textbox.

### 1.2. Configuration Tasks

#### Configuring Prettier
[Configure "Format on Save" using Prettier](https://www.robinwieruch.de/how-to-use-prettier-vscode/) by modifying `settings.json` file (CTRL+, or CMD+,).

When you're done, test that the "format on save" functionality works by creating a `test.js` JavaScript file with following code:

```js
function foo(a, b) {const c=a+b; const d = c**2; return c+d;}
```

When you save the file, it should be autoformatted as follows:

```js
function foo(a, b) {
    const c = a + b;
    const d = c ** 2;
    return c + d;
}
```

#### Configuring SSH
1. If you haven't already, register for a CSCI account here: [https://canton.cs.unca.edu/register](https://canton.cs.unca.edu/register). This will allow you to set (or reset) your password. Your username is the same as your email address (without the @unca.edu).
2. Verify that you can ssh into arden as follows:
    * Open the command line / terminal
    * Type: `ssh your_username@arden.cs.unca.edu`
    * Enter your password when prompted
    * type ls -la at the command prompt (this should be your home directory)
3. Make a remote connection via VS code:
    * Click the green icon in the lower left-hand corner of VS Code
    * Click "connect to host"
    * Enter your credentials (your_username@arden.cs.unca.edu)
    * Enter your password when prompted
    * Open your home directory
4. Make the simplest homepage imaginable:
    * Create a file called `index.html` inside of your `public_html` folder.
    * Edit the file (e.g., add "hello world")
    * Save it
    * Look at it on http://cs.unca.edu/~your_username (e.g., [http://cs.unca.edu/~svanwart](http://cs.unca.edu/~svanwart))

> ### Before Moving On, Verify That...
>
>{:.checkbox-list}
> * VS Code autoformats when you save
> * You have successfully created a webpage on Arden

{:#command-line}
## Part 2. Complete the Command Line Exercises
Please complete the following command line exercises with the help of the [Command Line Reference](../resources/command-line) that has been compiled for you. Feel free to collaborate with your classmates!

### 2.1 Open a Terminal
* If you are a Mac user, open the Terminal program
* If you are a Windows user, [follow these instructions to install WSL and a Linux distribution](/fall2024/resources/wsl) (Windows Subsystem for Linux). Once you're done, open a WSL terminal.

### 2.2. Navigation
1. Figure out which directory you're in (use `pwd`)
    * Windows users: if you type `explorer.exe`, it will open a Windows Explorer window to show you where your files are.
1. Navigate to the folder where you plan to save your coursework (use `cd`). <br>**Pro-tips**:
    * If any of your folder names have spaces, you'll have to surround the path with quotes
    * Use the tab key to autocomplete the path
    * Use the up and down keys to revive old commands
    * Use the `history` command to see the commands you've issued in the past

### 2.3. Create
1. Create a directory called `csci338` (use `mkdir`)
1. Navigate into `csci338`
1. Create a new file called `index.html` (use `touch`)
1. Create another new file called `style.css` (use `touch`)
1. Copy the Google homepage locally as follows: `curl https://www.google.com > google-home.html`

If you did everything correctly, you should have a directory structure that looks like this:

```bash
csci338
    ├── google-home.html
    ├── index.html
    └── style.css
```

### 2.4. List
1. Verify that the two new files exist in your current directory (use `ls`)
1. List all of the files and folders in your home (use `ls ~`)
1. List all of the files and folders on your home directory including hidden files (use `ls -la`)
1. List all of the files and folders in your home recursively, Try: 
    * `tree ~ -La 1`
    * `tree ~ -La 2`
    * `tree ~`

### 2.5. Read
1. Read the contents of the `google-home.html` file you just created (use `cat`)
1. Inspect the file using some of the other read commands (e.g., `less`, `head`, `tail`, open wc).
    * **Pro-tip**: For `less`, `head`, and `tail`, use the space bar to scroll down, and "q" to quit

### 2.6. Write
1. Append the sentence "Hello World" to the contents of the `index.html` file (`echo "Hello World" >> index.html`).
1. Do it again.
1. Read the contents of `index.html` (use `cat`)
1. Now replace the contents of `index.html` with "Goodbye" (`echo "Goodbye" > index.html`)
1. Read the contents of `index.html` (use `cat`)
1. You can also use the `>>` and `>` operators to direct the output of the terminal to a non-existant file: `echo 'Yo yo' > new.txt`
1. Read 'new.txt' (use cat)
1. Now remove it (rm new.txt)
1. Make sure you understand the difference between `>>` and `>`?

### 2.7. Move & Copy
1. Copy a directory and all subdirectories (try: `cp -r my_folder copy_of_my_folder`)
1. Copy a file (try: `cp foo.txt bar.txt`)
1. Rename a file (try: `mv bar.txt bar1.txt`)
1. Move a file to a parent directory (try `mv bar.txt ../.`)

### 2.8. Search
Use grep to search for files for strings / text...
1. To find the word "Goodbye" in your current directory or any descendents (try: `grep "Goodbye" ./ -r`)
1. To find the word "goodbye" -- case insensitive -- in your current directory or any descendents (try: `grep "goodbye" ./ -ri`)
1. To find the word "goodbye" -- case insensitive -- anywhere in your home directory or its descendents (try: `grep "goodbye" ~ -ri`)

### 2.9. Make a bash script
You can also combine multiple commands into a bash script (use the `.sh` extension). Let's make a bash script that sets up a basic web app in your current directory. Try the following:
* Create a script called `start-web-prj.sh`
* Add the following lines of code to the script:

```bash
# 1. Create a new directory called "src"
mkdir my_new_folder

# 2. Navigate into it:
cd my_new_folder

# 3. Create a new starter index.html file:
echo '''
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" />
    <title>Hello World</title>
</head>

<body>
    <h1>Hello World</h1>
    <p>Your starter file.</p>
</body>

</html>
''' > index.html

# 4. Create a new starter style.css file:
echo '''
body * {
    box-sizing: border-box;
}
body {
    font-family: Arial, sans-serif;
}
''' > style.css

# 5. Navigate to original directory:
cd ..

# # 6. Open the index.html file in a web browser:
# open my_new_folder/index.html
```

When you're done, execute the script as follows:

`bash ./start-web-prj.sh`

Take a look at the new `src` folder (and nested files) that were created by typing: `tree .`

Now, open the HTML file you just made in a new browser:
`open my_new_folder/index.html`

And finally, open the folder you just made in VS Code:

`code .`

If that didn't work and you're on a Mac, see <a href="https://stackoverflow.com/questions/29955500/code-is-not-working-in-on-the-command-line-for-visual-studio-code-on-os-x-ma" target="_blank">this Stack Overflow post</a>.


> ### Before Moving On, Verify That...
>
>{:.checkbox-list}
> * You have practiced working with the following commands:
>    * cat (read)
>    * cd (change directories)
>    * tree (list files and subdirectories)
>    * touch (create new empty file)
>    * ls (list files)
>    * rm (delete a file)
>    * mv (rename a file)
>    * cp (copy a file)
>    * history (view recent bash commands)
>    * `>>` (append operator)
>    * `>` (overwrite operator)
>    * grep (search)
>    * running a bash script: `bash ./start-web-prj.sh`
>    {:.compact}
>
> * You can open VS Code from the command line
> * Your file structure looks like the file structure below:

```bash
csci338
├── google-home.html
├── index.html
├── my_new_folder
│   ├── index.html
│   └── style.css
├── start-web-prj.sh
└── style.css
```

{:#dot-files}
## Part 3. OS Environment Exercises
Try making a few adjustments to your `.zshrc` file on your own. Some suggestions:

* <a href="https://dev.to/haamid/how-to-define-custom-alias-in-zsh-3b6a" target="_blank">Create an alias</a> to your `csci338` directory in your `.zshrc` file so that when you type: `338` on the command line, it automatically puts you into the `csci338` directory. 
    * Here is what Sarah's `.zshrc` entry looks like:<br>`alias 338='cd /Users/svanwart/unca/csci338'`
* Extend the size of your history file by adding some variables to your `.zshrc` file (google it).

> ### Before Moving On, Verify That...
>
>{:.checkbox-list}
> * `338` on the command line, it automatically jumps you to the `csci338` directory

{:#vim-emacs}
## Part 4. Vim / Emacs Exercises

Using either [vim](../resources/vim) or [emacs](../resources/emacs):

1. Opening a file from the command line
2. Edit it
3. Save it
4. Exit the editor

## What do I turn in?
Under Lab 1, paste the following into the textbox:
1. A link to your "Hello World" website on Arden.
2. A dump of your history (type `history` on the command line, copy it, and paste it into the Moodle).

### Other Thoughts...
* Make sure you can ssh into another server.
* Make sure your VS code editor is set up.
* Make sure you know some basic shell commands, and specifically how to navigate, search, create, delete, copy, read, and move files.
* Make sure you know how to open, edit, save, and exit either vim or emacs.
