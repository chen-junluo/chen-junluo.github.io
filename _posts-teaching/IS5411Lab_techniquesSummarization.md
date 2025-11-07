---
collection: posts-teaching
layout: posts-blog
author_profile: false
date: 2025-10-30
title: 'IS5411 Lab Plog 1: Overview of Design Techniques'
excerpt: "This plog provides an overview of design techniques/diagrams used in the IS5411 system design and analysis."
permalink: /teaching/is5411/techniquesSummarization/
tags:
  - teaching
  - IS5411
---

# IS5411 System Design: Core Tools Summary

A concise guide to the essential tools/techniques used in system design and analysis.

---

## Part 1. Identifying A Business Problem (Lab 1-4)

- `Interview`: Stakeholder conversations, aims to gather requirement narratives and *identify system needs*.
  - Do not ask abstract questions, "big" questions, or questions that require cognitive load to answer.
    - Make the interviewee comfortable.
  - Do not strictly follow the interview outline.
    - An interview is a dynamic process.
    - Better adjust your question based on previous answers.
  - Focus on the core requirement rather than:
    - 1) specific details out of the focused use case (e.g., repairment)
    - 2) risk management: what if... (e.g., I have changed my mind)

- [`(Intermediate) Use Case Diagram`]({{ site.url }}/images/teaching/IS5411/example_useCaseDigram.png)`: Visual map showing what *use cases* exist and which *actors* interact with each one. Provides high-level system functionality overview.

---

## Part 2. Designing the Database (Lab 5-6)

- [`Noun Technique`]({{ site.url }}/images/teaching/IS5411/example_nounTechnique.png): Extract nouns from interview narratives to *identify data entities* that become database tables.
  - Criteria of exclusion in the noun table `(IOSO)`
    - `I`rrelevant / Not target (Within the scope? Unique to the process?)
    - `O`nly 1 of these items? 
    - `S`ynonym
    - `O`utput/input
  - When using the noun techniques, for the first column, better to put the modifier + noun.
    - E.g., doctor's office
  - Attributes are based on common sense (when you do the final examination)

- [`Class Diagram`]({{ site.url }}/images/teaching/IS5411/example_classDiagram.png): Blueprint defining entities, attributes, and relationships for *database structure*.

---

## Part 3. Designing Use Cases

- Step 1. what are detailed workflows (Lab 7)
  - [`Use Case Description`]({{ site.url }}/images/teaching/IS5411/example_useCaseDescription.png): Step-by-step narrative of detailed workflows (how users accomplish goals) within the system.

- Step 2. visual workflow & investigate information flow (Lab 8-9)
  - [`Activity Diagram`]({{ site.url }}/images/teaching/IS5411/example_activityDiagram.png): Visual workflow showing detailed *actor* processes, decision points, and loops.
  - [`Analysis SSD`]({{ site.url }}/images/teaching/IS5411/example_analysisSSD.png): Documents *user-system* information exchange. Focuses on inputs and outputs (information cross the boundary between *user* and system).

- Step 3. design a specific use case! (Lab 10)
  - **1. Input and output & data retrieval logic:**
    - [`Analysis SSD`]({{ site.url }}/images/teaching/IS5411/example_analysisSSD.png): Organizes inputs/outputs
    - [`First-cut Design Class Diagram`]({{ site.url }}/images/teaching/IS5411/example_first-cutDesignClassDiagram.png)`: Initial design classes showing data retrieval structure
  - **2. Technical logic design:**
    - [`Design SSD`]({{ site.url }}/images/teaching/IS5411/example_designSSD.png): Specifies technical logic with method calls, parameters, and return values
  - **3. Finalization:**
    - [`Complete Design Class Diagram`]({{ site.url }}/images/teaching/IS5411/example_completeDesignClassDiagram.png)`: Adds all methods and signatures to first-cut diagram for implementation-ready blueprint
