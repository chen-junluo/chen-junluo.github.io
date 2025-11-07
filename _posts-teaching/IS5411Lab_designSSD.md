---
collection: posts-teaching
layout: posts-blog
author_profile: false
date: 2025-11-07
title: 'IS5411 Lab Plog 3: How to Draw Design SSD: Understanding Object-Oriented Programming & A Step-Based Guide'
excerpt: "This plog provides a step-by-step guide on how to draw a Design SSD for an object-oriented programming assignment."

permalink: /teaching/is5411/designSSD/
tags:
  - teaching
  - IS5411
---

# How to Draw Design SSD: Understanding Object-Oriented Programming & A Step-Based Guide
This is a little bit complicated, hope this would help you better understand and finish the Design SSD (in a few days, an addtional illustration would be updated).

---
## Understanding Object-Oriented Programming

- Key concepts on object-oriented programming (OOP).

  - **Methods** (what actions a person can perform)
    - Think of methods as verbs — the actions someone is capable of doing
    - Example: `calculateTotal()`, `sendEmail()`, `validateInput()`
    - Just like a person can "walk", "talk", or "write", objects have methods they can execute

  - **Class vs Instance** (the blueprint vs the actual entity)
    - **Class**: A category or type — like "Doctor" as a general concept / type of person
    - **Instance**: A specific individual from that category — like "John" (who is a doctor)

- Different roles/instances in the system design stage

  - **You = `CEO`**
    - The initiator who starts the whole process
    - Provides high-level commands without knowing implementation details

  - **Controller = `Manager`**
    - Receives requests from the CEO (througth the interface)
    - Coordinates and delegates tasks to appropriate `employees`
    - Doesn't do the actual work with data but orchestrates who does what

  - **Other Classes = `Employees` Who Can Be Summoned**
    - Specialists with specific skills and responsibilities
    - Can be called/summoned upon when their expertise is needed (See later for what 'summoned' means)
    - Usually interact with the `librarian(s)`
    - Example: An accountant, a designer, a data analyst

  - **DA (Data Access) = `Librarian`**
    - The only category of person who has access to stored information/data
    - Knows where everything is kept and how to retrieve it
    - Guards the database and handles all data retrieval requests

- Three Architectural Layers

  - **View Layer** — where the `CEO` and interface reside
    - What the user sees and interacts with
    - Contains UI elements: buttons, forms, displays
    - Presents information to the user
    - Example: *The dashboard on your screen*

  - **(Business) Logic Layer** — where the `manager` and other `employees` work
    - Contains the core business rules and processes
    - Where calculations, validations, and decisions happen
    - Coordinates between view and data
    - Example: *The office where actual work gets done*

  - **Data Layer** — where the database lives and the `librarian` operates
    - Stores all persistent information
    - Handles data retrieval and storage
    - Accessed only through the librarian (DA)
    - Example: The filing room or archive
---
# Design SSD: Step-Based Guidance

- Step 1: CEO tells manager
  - The CEO (user) communicates their need to the manager (controller) through the interface
- Step 2: Manager summons employees
  - **What happens**: The controller identifies which employees (objects) are needed
    - Manager doesn't do the actual work
    - Manager creates/summons the right type of employee
      - **What "summoning" actually means**: Instantiation through code
        - When you see: `aLi := createLoanItem()`
        - What's happening behind the scenes:
          - The controller (manager) executes an **instantiation command**
          - This creates a new **instance** called `aLi` (a specific employee)
          - `aLi` is now a real, working object that can perform detailed tasks
          - Think of it as: The manager hires a new employee named "aLi" to handle loan-related work
        - The difference:
          - `LoanItem` = the job description/class (what a loan item employee should do)
          - `aLi` = the actual employee/instance (the specific person doing the work)
          - The manager says "I need a LoanItem specialist" and the system creates `aLi` to fulfill that role
- Step 3: Employee actions
  - **Option 1: Find librarian, get output**
    - Sends request to the Data Access object (librarian)
    - Receives and processes the data
  - **Option 2: Ask others to help**
    - Some employees (after getting output from librarian), need to use the returned data as the input
    - in this case, it coordinates other employees to use the data as input
    - Example: person A get two data, and person B and C use these two data respectively to do some calculation

- Step 4: Summarize the key outputs (the long input and output messages)

  - **What happens**: Collect and organize the results
    - Identify what information flows back
    - Show return values on the diagram

- Step 5: Add interface elements

- Step 6: Complete/double check the details

  - **Finalize the diagram** by adding:
    - **Loop boxes** for repeated actions
      - Example: Processing each item in a shopping cart
    - **Conditional boxes (alt/opt)** for decision points
      - Example: If payment succeeds, confirm order; else, show error
    - **Parameters** on all method calls
      - Be specific: what data is being passed?
    - **Return values** with proper labels
      - Show what comes back from each interaction