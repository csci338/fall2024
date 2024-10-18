---
layout: module
title: Version Control & Branch Management
description: >
    Version control is perhaps one of the most important topics in software engineering. It allows teams to collaborate on projects, review one another's code, experiment with new features and ideas, and revert to previous versions when needed. In this unit, we will explore different approaches that teams can take to collaborate on code. We will also do various hands-on activities so that you can familiarize yourself with bash and git commands, and practice branching, merging, rebasing, and writing good commit messages.

readings: 
    - due_date: "2024-08-27"
      link: > 
        <a href="https://abseil.io/resources/swe-book/html/ch16.html" target="_blank">Chapter 16. Version Control and Branch Management</a> 
      required: 1
    - due_date: "2024-09-03"
      link: > 
        Read the <a href="https://en.wikipedia.org/wiki/Git#History" target="_blank">History section</a> of the Wikipedia article on Git (including all subsections: Naming, Characteristics, Data Structures, and References).
      required: 1
    - due_date: "2024-09-03"
      link: > 
        As we work through the next two labs, the following sections of the <a href="https://git-scm.com/book/en/v2" target="_blank">Pro Git book</a> will provide context and some useful conceptual models: <ul><li>Chapter 2, sections 1, 2, 3, 4, 5</li><li>Chapter 3, sections 1, 2, 3, 6</li></ul>
    - due_date: "2024-09-05"
      link: >
        <a href="https://www.youtube.com/watch?v=_wQdY_5Tb5Q" target="_blank">Collaborating using Git and GitHub</a>: Branches, Pull Requests, Merging vs Rebasing (Video walkthrough)
      required: 1
    - due_date: "2024-09-05"
      link: >
        <a href="https://www.youtube.com/watch?v=_UZEXUrj-Ds" target="_blank">What is git rebase?</a>
    - due_date: "2024-09-05"
      link: >
        <a href="https://www.atlassian.com/git/tutorials/comparing-workflows" target="_blank">Article explaining how to rebase + handle merge conflicts</a>

slides: 
    - date: "2024-08-27"
      link: > 
        <a href="https://docs.google.com/presentation/d/1Caf-Ri8A5TNeYjTNC4yL5aD074NYNJAD/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true" target="_blank">Big Ideas in Software Engineering & Intro to Version Control</a>
    - date: "2024-08-29"
      link: > 
        <a href="https://docs.google.com/presentation/d/11HyT_sktBgkhoM2_LgQ3cHB68YZj_AZZ/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true" target="_blank">Lab 2 Slides</a>
    - date: "2024-09-3"
      link: > 
        <a href="https://docs.google.com/presentation/d/1Jw5noRHBzAtxJL-j13OCawd615ca7swk/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true" target="_blank">Version Control and Collaborative Workflows</a>

questions:
    - Why is version control important?
    - Why is code history important?
    - What is the difference between centralized and distributed version control?
    - What is the problem with having long-running dev branches? What is the solution?
    - What is the one version rule?
    - What is Hyrum's Law?
    - What are the tradeoffs of having a Monorepo versus multiple repos?
    - What is the difference between git and GitHub?

num: 2
type: topic
draft: 0
due_date: 2024-08-27
---


## In-Class Activities
* [Merging / Rebasing Exercise](/fall2024/activities/git-in-class-activity)