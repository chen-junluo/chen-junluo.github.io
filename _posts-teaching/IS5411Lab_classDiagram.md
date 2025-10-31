---
collection: posts-teaching
layout: posts-blog
author_profile: false
date: 2025-10-31
title: 'IS5411 Lab Plog 1: Clarification on Class Diagram Exercise'
excerpt: "Clarification on class diagram design for the Patient Record and Scheduling System assignment."
permalink: /teaching/is5411/classDiagram/
tags:
  - teaching
  - IS5411
---

# IS5411 Class Diagram Clarification

I hope this clarification helps address common questions about the class diagram design for the Patient Record and Scheduling System assignment.

## Background

A patient record and scheduling system in a doctor's office is used by the receptionists, nurses, and doctors. The receptionists use the system to enter new patient information when first-time patients visit the doctor. They also schedule all appointments. The nurses use the system to keep track of the results of each visit including diagnosis and medications. For each visit, free form text fields are used captures information on diagnosis and treatment. Multiple medications may be prescribed during each visit. The nurses can also access the information to print out a history of patient visits. The doctors primarily use the system to view patient history. The doctors may enter some patient treatment information and prescriptions occasionally, but most frequently they let the nurses enter this information.

Each patient is assigned to a family. The head of family is responsible for payment and is also the person with the primary medical coverage. Information about doctors is maintained since a family has a primary care physician, but different doctors may be the ones seeing the patient during the visit.

## Reference Solution

![Class Diagram 1]({{ site.url }}/images/teaching/IS5411/classDiagram_1.png)

This design implements the following key features:
- Appointment and Visit as independent entities. Supports business scenario of "scheduled but not visited" (0..1 relationship)
- Direct querying of all Appointments from Patient
- Doctors associated with patients through Appointment
- Prescription management support
- Family insurance information management

## Design Analysis

Let's focus on two suboptimal designs and analyze their problems.

### Problematic Design 1: Visit as Association Class

![Class Diagram 2]({{ site.url }}/images/teaching/IS5411/classDiagram_2.png)

#### Core Issue: Visit as association class blocks independent queries

**Design characteristics:**
- Visit is modeled as an **association class** between Patient and Doctor (connected with dashed line)
- Visit maintains a 0..1 to 1 relationship with Appointment

#### ❌ Why is this design problematic?

**Cannot independently query patient appointments**

Typical business scenario: When a patient arrives at the clinic, the receptionist needs to query: "Does this patient have an appointment today?"

With the design in Diagram 2, the query path has issues:
- Visit is an association class of the Patient-Doctor relationship
- Appointment can only be accessed after having a Visit record
- But Visit records actual visits that have occurred
- If a patient has scheduled but hasn't come yet (no Visit record), we can't find the Appointment ❌

#### Business Process Disruption

Actual medical workflow:
1. Patient calls to schedule → Appointment created
2. Patient arrives at scheduled time → Visit record created

Diagram 2's design:
- Cannot query "what appointments does this patient have" after step 1
- Must wait until step 2 (Visit creation) to access Appointment
- Completely reverses business logic!

### Problematic Design 2: Attribute Modeling Complexity

![Class Diagram 3]({{ site.url }}/images/teaching/IS5411/classDiagram_3.png)

**Design characteristics:**
- Added `isPrimaryPhysician` boolean attribute to Doctor entity
- Missing independent PrimaryPhysician entity

#### ❌ Why is this design problematic?

**Querying a family's primary physician becomes overly complex**

Typical business scenario: System needs to display "Who is the Smith family's primary physician?"

**Using Diagram 3's attribute approach:**
Requires complex multi-step query:
1. Find all patients in the Smith family
2. Find all doctors these patients have seen
3. Filter doctors with `isPrimaryPhysician = true` and responsible for Smith family

**Diagram 1's advantage:**
- PrimaryPhysician as independent entity/subclass
- Directly models the 1-to-1 relationship from FamilyInsurance to PrimaryPhysician
- Clear query path: `Family → PrimaryPhysician`
- Semantically accurate: PrimaryPhysician is a special role