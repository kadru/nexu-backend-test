# Requirements

* Ruby version
  3.3.4

* Rails version
  7.2.1

* System dependencies

  Tested on Postgres 16 but must run with older versions of postgres

# Installing

  Run bundle to install required gems

  ```
   bundle install
  ```

## Database creation
  
  Create a file named `.env` with the following environment variable

  ```
    DATABASE_URL=url_to_your_postgres_db
  ```

  Then setup the db, it will create the db, load the schema and run and run db:seed

  ```
  bin/rails db:setup
  ```

# How to run the test suite

  ```
  bin/rails test
  ```

# Running on dev
  
  Needs DATABASE_URL environment variable
  
  ```
  bin/rails s
  ```

# Notes

  I chose to use rails fixtures to manage the records through test because is the already included as default but
  usually I use the factory_bot gem for a better control of the records and mantainability of the code.

  I chose to use minitest for same reason and also it can be faster compared to a rspec test suite, using parallel
  testing with threads or processes. But I still like the rspec DSL much more.

  The calculation of the average price of a brand can be a bottleneck for a large models table it can be solved by 
  caching the average every time that a model  is added or updated to a column in the brands table but it can make the
  code more complex, for example needing a transaction to make atomic changes and an abstraction to ensure DRY code. It
  was my first idea to solve the problem but I decided to a simpler solution for this excercise.

  Other thing that I want not note is the code to filter models by average price. I chose this solution by encapsulating
  the logic in a scope because is a shameless green(see Sandy Metz 100 bottle of OOP) for me, the code is enough 
  understandable and not over-abstract, in case of more filters added it will be valid reason to create a new class
  to manage the filters, maybe a query object or delegate the work to a gem (ransack could be an option).

  For last, to get working the db:seed rake I skipped validations for average_price and also delete a invalid datum (a 
  combination of model name a brand name was repeated) in the models.json file.
