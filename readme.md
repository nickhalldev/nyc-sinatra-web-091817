---
tags: orm, activerecord, sinatra, rspec, forms
languages: ruby
---

:statue_of_liberty: :oncoming_police_car: :taxi: :fire_engine: :construction: :vertical_traffic_light: :tram: :helicopter:
#Welcome to NYC Sinatra!

We're going to build a history site for New York City, so we're going to need to
create the following database structure.

* landmarks `belong_to` the figure who built it
* figures(Historical figures) `have_many` titles
* titles `have_many` figures

So for example:

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

| **id**             | **name**               |
|:------------------:|:----------------------:|
| 1                  | BQE                    |
| 2                  | Holland Tunnel         |
| 3                  | Wall Street Wall       |
| 4                  | Brooklyn Battery Tunnel|

**Titles**

| **id**             | **name**               |
|:------------------:|:----------------------:|
| 1                  | Mayor                  |
| 2                  | President              |
| 3                  | Govenor                |
| 4                  | NYC Parks commissioner |

Any time you have a `has_many` to `has_many` relationship, you'll need to create
a join table. An example of a `has_many` to `has_many` relationship is titles
and figures. A tiles `has_many` figures because many people hold a title over time
and a figure usually `has_many` titles over their career.

An example of a join table is below. We called it figure_titles, but you could
call it something less clear like Roles if you wanted to.

**Figure_titles**

| **id**             | **title_id**           | **figure_id** |
|:------------------:|:----------------------:|:-------------:|
| 1                  | 3                      | 2             |
| 2                  | 3                      | 3             |
| 3                  | 2                      | 3             |
| 4                  | 1                      | 9             |
| 5                  | 4                      | 1             |

Make sure to create web pages, routes, etc. to add, update, and edit figures,
titles, landmarks, years, etc.

Your forms will need to be complex. So when you create a new title, you can also
add a figure to that title. You should also be able to create a new figure if
he/she doesn't already exist in your database. The same applies for all your models
that have an association.

Your forms should allow multiple select, so you should also be able to add
multiple figures to a title at the same time, e.g. If I create the Mayor title
and a bunch of mayors are already in my database, I'll want to add them all at
once when I create the Mayor title.


**Make sure to migrate your test database by running `rake db:migrate SINATRA_ENV=test`**
