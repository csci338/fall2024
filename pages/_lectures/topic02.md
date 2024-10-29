---
layout: module
title: Version Control & Branch Management
num: 2
type: topic
draft: 0
start_date: 2024-08-27
description: >
    Version control is perhaps one of the most important topics in software engineering. Version control systems allow teams to collaborate on projects, review one another's code, experiment with new features and ideas, and revert to previous versions when needed. In this unit, we will explore different approaches that teams might take to organize their code repositories. We will also do various hands-on activities so that you can familiarize yourself with bash and git commands.
slides: 
    - start_date: "2024-08-27"
      num: 3
      type: lecture
      title: Intro to Version Control
      url: https://docs.google.com/presentation/d/1Caf-Ri8A5TNeYjTNC4yL5aD074NYNJAD/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true
      link: > 
        Lecture 3: <a href="https://docs.google.com/presentation/d/1Caf-Ri8A5TNeYjTNC4yL5aD074NYNJAD/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true" target="_blank">Intro to Version Control</a>
    - start_date: "2024-08-29"
      type: lecture
      title: Introduction to Lab 2
      url: https://docs.google.com/presentation/d/11HyT_sktBgkhoM2_LgQ3cHB68YZj_AZZ/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true
      link: > 
        Lab 2: <a href="https://docs.google.com/presentation/d/11HyT_sktBgkhoM2_LgQ3cHB68YZj_AZZ/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true" target="_blank">Introduction to Lab 2</a>
    - start_date: "2024-09-03"
      num: 4
      type: lecture
      title: Version Control and Collaborative Workflows
      url: https://docs.google.com/presentation/d/1Jw5noRHBzAtxJL-j13OCawd615ca7swk/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true
      link: > 
        Lecture 4: <a href="https://docs.google.com/presentation/d/1Jw5noRHBzAtxJL-j13OCawd615ca7swk/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true" target="_blank">Version Control and Collaborative Workflows</a>
readings: 
    - start_date: "2024-08-27"
      title: Chapter 16. Version Control and Branch Management
      num: 1
      type: reading
      required: 1
      url: https://abseil.io/resources/swe-book/html/ch16.html
    - start_date: "2024-09-03"
      title: Git Wikipedia article 
      num: 2
      type: reading
      notes: > 
        Read the history section (including all subsections: Naming, Characteristics, Data Structures, and References).
      required: 1
    - start_date: "2024-09-03"
      title: Pro Git book
      type: reading
      num: 3
      notes: > 
        The Pro Git book provides some useful context and conceptual models, particularly 2.1-2.5, 3.1-3.1, and 3.6.
      url: https://git-scm.com/book/en/v2
    - start_date: "2024-09-05"
      title: Collaborating with git and GitHub (video)
      num: 4
      type: reading
      url: https://www.youtube.com/watch?v=_wQdY_5Tb5Q
      instructions: > 
        Covers branches, pull requests, and merging vs rebasing
      required: 1
    - start_date: "2024-09-05"
      title: What is git rebase? (video)
      num: 5
      type: reading
      url: https://www.youtube.com/watch?v=_UZEXUrj-Ds
    - start_date: "2024-09-05"
      title: How to rebase + handle merge conflicts
      num: 6
      type: reading
      url: https://www.atlassian.com/git/tutorials/comparing-workflows
activities:
    - start_date: "2024-09-03"
      title: Git Collaboration Activity
      num: 1
      type: activity
      url: /activities/git-in-class-activity
videos:
    - start_date: "2024-08-27"
      type: video
      title: Lecture recording
      url: https://drive.google.com/file/d/1d-UBkRjfNZ7ll_x05zz2EvR5uVE4yN1T/view?usp=drive_link
    - start_date: "2024-09-03"
      type: video
      title: Lecture recording
      url: https://drive.google.com/file/d/19nCHNg0rMgWyS_XyLr4LcUF4ByB2LJ7-/view?usp=drive_link
labs: [2, 3]
questions:
    - Why is version control important?
    - Why is code history important?
    - What is the difference between centralized and distributed version control?
    - What is the problem with having long-running dev branches? What is the solution?
    - What is the one version rule?
    - What are the tradeoffs of having a "monorepo" versus multiple repos?
    - What is the difference between git and GitHub?
    - What is the difference between a merge commit and rebasing? What would you want to do one over the other (i.e., what are the the tradeoffs of each)?
    - What does the "origin" typically refer to?
    - What is a public / private key pair?
    - > 
        What do the following git commands do? 
        <code>clone</code>, <code>status</code>,
        <code>add</code>, <code>log</code>, <code>commit</code>, <code>push</code>, <code>pull</code>, <code>merge</code>, <code>rebase</code>
    - > 
        What do the following bash commands do? 
        <code>ls</code>, <code>cat</code>,
        <code>mv</code>, <code>pwd</code>, <code>cd</code>, <code>rm</code>
---



