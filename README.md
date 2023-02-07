<div align="center">
  <h1>Menu-ify API</h1>
</div>

## Project Overview 
This is a description of the project

# Table of Contents
- [Learning Goals](#learning-goals)
- [Planning Documents](#planning-documents)
- [Tech & Tools Used](#tech-and-tools)
- [How to Set Up](#how-to-set-up)
- [How to Run Test Suite](#how-to-run-test-suite)
- [Use of Bīk-n-Brü](#use-of-bīk-n-brü)
- [Contributors](#contributors)


# Learning Goals 
[Project Spec](https://mod4.turing.edu/projects/capstone/)

This project's goal is to create a successful web application from a student-led project idea, focusing on Service-Oriented Architecture. This is the first time that a front-end cohort and a back-end cohort have worked together. This project is built using Agile methodologies. A main goal of this project is to focus on learning about a new technology. We decided to use consume a third party API using Python and FastAPI. That repo is found here: 


## Built With 
- Rails 5.2.8
- Ruby 2.7.4

## Developer Setup 

1. Clone the respository 
2. cd into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:{drop,create,migrate}`
5. Seed the database using the rake task: `rake csv_load:all`
6. Run `rails c` and then `Restaurant.count` and `MenuItem.count`. You should have 3 and 30 respectively 
7. You may run the RSpec test suite locally with `bundle exec rspec`
8. Run `rails s` to use the localhost:3001 server 


## Schema 

## Known Issues/ Future Goals 

## Contributors 

## Endpoints 
Available Endpoints: 

Local Server: http://localhost:3001
Heroku Server:

### Restaurants 
<details close>
<summary>Get all restaurants</summary>
<br>

Request: <br>
```
GET /api/v1/restaurants
```
Example:

JSON Response Example: 
```json 
{
    "data": [
        {
            "id": "100",
            "type": "restaurant",
            "attributes": {
                "name": "Pho Kyah",
                "description": "Experimental Asian fusion gastropub",
                "logo": "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Ph%E1%BB%9F_v%E1%BB%8Bt_quay.jpg/640px-Ph%E1%BB%9F_v%E1%BB%8Bt_quay.jpg"
            }
        },
        {
            "id": "200",
            "type": "restaurant",
            "attributes": {
                "name": "Tim's Tiki Bar",
                "description": "All the aloha you can eat",
                "logo": "https://publicdomainvectors.org/photos/SteveLambert_Tiki_Bar.png"
            }
        },
        {...}
    ]
}
```
</details>

<details close>
<summary>Create a new restaurant</summary>
<br>

Request: <br>
```
POST /api/v1/restaurants
```
Example:

JSON Response Example: 
```json 

```
</details>

<details close>
<summary>Update existing restaurant</summary>
<br>

Request: <br>
```
PATCH /api/v1/restaurants/:restaurant_id
```
Example:

JSON Response Example: 
```json 

```
</details>

### Menu Items 



# Tech and Tools
#### Gems Used:
  - [Pry](https://github.com/pry/pry-rails)
  - [Faraday](https://lostisland.github.io/faraday/)
  - [Capybara](https://github.com/teamcapybara/capybara)
  - [Figaro](https://github.com/laserlemon/figaro)
  - [RSpec](https://github.com/rspec/rspec-metagem)
  - [Simple-Cov](https://github.com/simplecov-ruby/simplecov)
  - [Factory Bot for Rails](https://github.com/thoughtbot/factory_bot_rails)
  - [Faker](https://github.com/faker-ruby/faker)
  - [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)





