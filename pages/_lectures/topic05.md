---
layout: module
title: Testing, Static Analysis, & Continuous Integration (CI)
type: topic
num: 5
draft: 0
start_date: 2024-09-24
labs: [6]
description: >
   Continuous integration (CI), static analysis, and testing are complementary software development techniques that ensure that teams can deploy software
   continuously with a high degree of confidence in the quality of their code.
   In this unit, we will learn about ways you and your team can automate code testing and validation procedures before merging code updates into the main branch. By setting up a few tools up front, you will save time and energy and increase the reliability of your code base. 
videos:
    - start_date: "2024-09-24"
      type: video
      title: Lecture recording
      url: https://drive.google.com/file/d/14vHyDyt-wZfVBMGjaDmLpupI5MFowU1a/view?usp=drive_link
slides: 
    - start_date: 2024-09-24
      type: lecture
      num: 7
      title: Intro to Testing & Static Analysis
      url: https://docs.google.com/presentation/d/1FP8lJuy1C6AzzPxpulNOu9al_SIub2zF/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true
    - start_date: 2024-10-29
      type: lecture
      draft: 1
      num: 8
      title: Shifting Left with Testing, Static Analysis, & Continuous Integration
      url: https://docs.google.com/presentation/d/1Fp1aWWNRoO9D3PPUf3xbU7mEZec1j8gY/edit?usp=sharing&ouid=113376576186080604800&rtpof=true&sd=true
readings:
    - start_date: 2024-10-29
      type: reading
      title: High-level overview of unit v. integration testing
      url: https://circleci.com/blog/unit-testing-vs-integration-testing
      required: 1
    - start_date: "2024-10-29"
      type: reading
      title: Chapter 11. Testing Overview
      url: https://abseil.io/resources/swe-book/html/ch11.html
      required: 1
    - start_date: "2024-10-29"
      type: reading
      title: Chapter 20. Static Analysis
      url: https://abseil.io/resources/swe-book/html/ch20.html
      skim: 1
    - start_date: "2024-10-29"
      type: reading
      title: Chapter 23. Continuous Integration
      url: https://abseil.io/resources/swe-book/html/ch23.html
      skim: 1
activities:
    - start_date: "2024-09-24"
      num: 2
      type: activity
      title: Practice writing tests and using some static analysis tools
      url: https://github.com/csci338/class-exercises-fall2024/blob/main/topic05/README.md
      notes: This activity didn't quite work out, but you will have another chance to practice with testing and static analysis in Lab 6.
questions:
    - <span class="badge-dark">general</span> What does "shifting left" mean?
    - <span class="badge-dark">testing</span> What are some of the benefits of automated testing? 
    - <span class="badge-dark">testing</span> What are some of the limits of automated testing? 
    - <span class="badge-dark">testing</span> What are the different test "sizes"? Why are these distinctions important? 
    - <span class="badge-dark">testing</span> What is meant by "nondeterminism" in testing? 
    - <span class="badge-dark">testing</span> What are some important qualities of a testing suite? 
    - <span class="badge-dark">testing</span> What are some considerations that go into writing testable code? 
    - <span class="badge-dark">testing</span> What is the difference between an interpreted and a compiled language? 
    - <span class="badge-dark">static analysis</span> What languages are interpreted? What languages are compiled?
    - <span class="badge-dark">static analysis</span> What do we mean by "static"? 
    - <span class="badge-dark">static analysis</span> What are some examples of static analysis tools? 
    - <span class="badge-dark">static analysis</span> What are some of the benefits of doing static analysis? 
    - <span class="badge-dark">static analysis</span> What are some of the challenges / limitations of static analysis? 
    - <span class="badge-dark">CI</span> What is continuous integration? 
    - <span class="badge-dark">CI</span> What are some of the key benefits and headaches (i.e. tradeoffs) of continuous integration?
    - <span class="badge-dark">CI</span> Can you still use CI if you're working on a really big feature that’s not ready for prime time?
    - <span class="badge-dark">CI</span> What happens in the "presubmit" phase?
    - <span class="badge-dark">CI</span> What is release candidate testing? How is it similar / different from the "presubmit" phase?
---