# Participant Name: Isaias Menorca

# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

[Question 1: Answer](./erd1.png)

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

[Question 2: Answer](./erd1.png)
The fields: start_time, end_time, and shift_name enables discerning morning/evening shifts

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Bonus: Are there privacy implications to this, why or why not?
```
Your answer...
[Question 3: Answer]

[Architecture1] (./erd1.png)
[Architecture2] (./erd2.png)

#### Architecture 1: Overwrite Changes (Type 1)
- **Table Structure**:
  - `CUSTOMER_ID` (Primary Key)
  - `ADDRESS`
  - `CITY`
  - `STATE`
  - `ZIP_CODE`
  - `COUNTRY`

In this architecture, the customer's address is updated in place. When a customer's address changes, the old address is overwritten with the new address. 

#### Architecture 2: Retain Changes (Type 2)
- **Table Structure**:
  - `CUSTOMER_ID`
  - `ADDRESS`
  - `CITY`
  - `STATE`
  - `ZIP_CODE`
  - `COUNTRY`
  - `START_DATE` (Primary Key)
  - `END_DATE`
  - `IS_CURRENT`

For this one, each change to a customer's address is recorded as a new row in the table. The `START_DATE` and `END_DATE` columns indicate the period during which the address was valid, and the `IS_CURRENT` flag indicates the current address. 

### Privacy Implications
- **Architecture 1 (Overwrite Changes)**:
  - **Implications**: Since the old address is overwritten, there is less historical data stored. This reduces the risk of exposing previous addresses, which can be beneficial for privacy.
  
- **Architecture 2 (Retain Changes)**:
  - **Implications**: Storing historical addresses can have privacy implications, as it retains a record of all previous addresses. This could be sensitive information and may require additional security measures to protect the data.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
1.) The requirement set for this Bookstore Database is much smaller thus have a simpler schema with less tables.

2.) Within Adventureworks, there is a context grouping of tables i.e. Sales, HR, Purchasing, etc. There is none of that in the Bookstore DB. Adventure DB also leverages using base tables to minimize duplication of data, which may result in more complicated joins). Bookstore DB has only a base table used for audit (who and when for record updates, and creation)


```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ok] Create a branch called `model-design`.
- [ok] Ensure that the repository is public.
- [ok] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ok] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
