# Bookmark_manager

User Stories

## User Story 1
``As a user,
So that I keep track of certain websites,
I would like to see a list of bookmarks``

## User Story 2
`As a busy user,
So that I can save a website address,
I want to add the site's address and title to a bookmark manager`

Link to the domain model: https://miro.com/app/board/uXjVO9sGhD0=/

## User Story 3

As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark


<img src="https://lh3.googleusercontent.com/obdXwtpQk0IeJaAT7jkCMn2QE-c_Cy7IbuBck6eNNe91PhxKcpAlEx9IPtlfjtgkGovnnQ=s170"  width="800"  />

## How to set up and connect to database
1. Connect to `psql`
2. Create the database using the psql command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the pqsl command `\c bookmark_manager;`
4. Run the query we have saved in the file `\i ./db/migrations/01_create_bookmarks_table.sql;`

## How to set up and connect to database test
1. Connect to `psql`
2. Create the database using the psql command `CREATE DATABASE bookmark_manager_test;`
3. Connect to the database using the pqsl command `\c bookmark_manager_test;`
4. Run the query we have saved in the file `\i ./db/migrations/01_create_bookmarks_table.sql;


### Title column added to dev db

1. Connect to postgres in terminal `psql postgres`
2. Run `psql \c bookmark_manager;` (to connect to correct db) 
3. Run `03_add_title_to_bookmarks.sql`


### Title column added to test db

1. Connect to postgres in terminal `psql postgres`
2. Run `psql \c bookmark_manager_test;` (to connect to correct db) 
3. Run `03_add_title_to_bookmarks.sql`
