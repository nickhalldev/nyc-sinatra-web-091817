# Welcome to NYC Sinatra!

## Introduction

We're going to build a history site for New York City, so we're going to need to create the following database structure:

* You will have three models (and their corresponding tables) `Landmark`, `Title`, `Figure` (think historical figure). 
* A landmark `belongs_to` a figure and a figure `has_many` landmarks. 
* Titles and figures have a "many-to-many" relationship, so we'll need a join table. 

### Domain Model

Our client has decided that the history app we're building them should have a special focus on historical figures. For this reason, it is through figure views and controllers that most of the magic of our app will happen. Our app will have view pages for all of the landmarks and a user will be able to create a new landmark. BUT, when a user creates or edits a figure, they should also be able to select or create a new landmark and/or title to associate to that figure. In other words, the form for a new figure and the form to edit a figure should allow the user to select from existing landmarks and title *and* create new landmarks and titles to associate to the figure. 

## Instructions

### Migrations

Write migrations to create the following tables:


**Figure**

| **id**             | **name**          |
|:------------------:|:-----------------:|
| 1                  | Robert Moses      |
| 2                  | Al Smith          |
| 3                  | Theodore Roosevelt|
| 4                  | Peter Stuyvesant  |
| 5                  | Boss Tweed        |
| 6                  | Michael Bloomberg |
| 7                  | Ed Koch           |
| 8                  | Fiorello LaGuardia|
| 9                  | Jimmy Walker      |
| 10                 | Belle Moskowitz   |

**Landmarks**

| **id**             | **name**               | **figure_id** |
|:------------------:|:----------------------:|:--------------|
| 1                  | BQE                    | 1
| 2                  | Holland Tunnel         | 5
| 3                  | Wall Street Wall       |3
| 4                  | Brooklyn Battery Tunnel|10

**Titles**

| **id**             | **name**               |
|:------------------:|:----------------------:|
| 1                  | Mayor                  |
| 2                  | President              |
| 3                  | Govenor                |
| 4                  | NYC Parks commissioner |

#### Join Tables

Any time you have a `has_many` to `has_many` relationship, you'll need to create a join table. An example of a `has_many` to `has_many` relationship is titles and figures. A title `has_many` figures because many people hold a title over time and a figure usually `has_many` titles over their career.

Below is an example of a join table. We called it figure_titles and you should do the same for this lab. 

**Figure_titles**

| **id**             | **title_id**           | **figure_id** |
|:------------------:|:----------------------:|:-------------:|
| 1                  | 3                      | 2             |
| 2                  | 3                      | 3             |
| 3                  | 2                      | 3             |
| 4                  | 1                      | 9             |
| 5                  | 4                      | 1             |


### Models

Now, use the `has_many`, `belongs_to` and `has_many, :through` macros to set up the correct associations in your models:

* A Landmark `belongs_to` a figure and a figure `has_many` landmarks.
* A title `has_many` figure_titles and many figures through figure_titles. 
* A figure `has_many` figure_titles and many titles through figure_titles.
* A figure_title `belongs_to` a figure and a title. 


**Top-Tip:** Type `tux` in your terminal in the directory of this project in order to drop into an interactive Ruby console that is connected to your models and database. Here, you can play around with creating and associating instances of the classes you create once you properly set up the above. This is a helpful way to solidify your understanding of the relationships between your models before you go into building the routes, views and forms that will allows your users to interact with them. Start out by creating a new figure, landmark and title. Then, add that landmark and title to the figures collection of landmarks and titles respectively. Keep playing around from there however you like. 

#### Test Database Migration

**Make sure to migrate your test database by running `rake db:migrate SINATRA_ENV=test`**

### Forms

Your forms will need to be complex. So when you create a new title, you can also add a figure to that title. You should also be able to create a new figure if he/she doesn't already exist in your database. The same applies for all your models that have an association.

Your forms should allow multiple select, so you should also be able to add multiple figures to a title at the same time, e.g. If I create the Mayor title and a bunch of mayors are already in my database, I'll want to add them all at once when I create the Mayor title.



