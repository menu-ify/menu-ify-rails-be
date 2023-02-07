<div align="center">
  <h1>Menu-ify API</h1>
</div>

## Table of Contents 
- [Project Overview](#project-overview)
- [Learning Goals](#learning-goals)
- [Built With](#built-with)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Gems](#gems)
- [Schema](#schema)
- [Contributors](#contributors)
- [Schema](#schema)

## Project Overview 

## Learning Goals 
[Project Spec](https://mod4.turing.edu/projects/capstone/)

This project's goal is to create a successful web application from a student-led project idea, focusing on Service-Oriented Architecture. This is the first time that a front-end cohort and a back-end cohort have worked together. This project is built using Agile methodologies. A main goal of this project is to focus on learning about a new technology. We decided to use consume a third party API using Python and FastAPI. That repo is found here: 


## Built With 
- Rails 5.2.8
- Ruby 2.7.4

## Setup 

1. Clone the respository 
2. cd into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:{drop,create,migrate}`
5. Seed the database using the rake task: `rake csv_load:all`
6. Run `rails c` and then `Restaurant.count` and `MenuItem.count`. You should have 3 and 30 respectively 
7. You may run the RSpec test suite locally with `bundle exec rspec`
8. Run `rails s` to use the localhost:3001 server 


## Endpoints 
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/24609974-ee444c00-5719-4a1b-9f98-f07984581074?action=collection%2Ffork&collection-url=entityId%3D24609974-ee444c00-5719-4a1b-9f98-f07984581074%26entityType%3Dcollection%26workspaceId%3D2902cec5-b68c-4ae7-a836-ede59d44bd2d#?env%5BNew%20Environment%5D=W3sia2V5IjoidXJsIiwidmFsdWUiOiJodHRwczovL2pzb25wbGFjZWhvbGRlci50eXBpY29kZS5jb20iLCJlbmFibGVkIjp0cnVlLCJ0eXBlIjoiZGVmYXVsdCJ9XQ==)

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


## Gems 
- [Pry](https://github.com/pry/pry)
- [RSpec-rails](https://github.com/rspec/rspec-rails)
- [Capybara](https://github.com/teamcapybara/capybara)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
- [Faker](https://github.com/vajradog/faker-rails)
- [Factory Bot](https://github.com/thoughtbot/factory_bot_rails)

## Schema 

## Known Issues/ Future Goals 

## Contributors 

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/57226658?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/108035840?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/108249540?v=4"></td>
  </tr>
  <tr>
    <td>Emily Port</td>
    <td>Yuji Kosakowski</td>
    <td>Gabe Nunez</td>

  </tr>
  <tr>
    <td>
      <a href="https://github.com/eport01">GitHub</a><br>
      <a href="https://www.linkedin.com/in/emily-port-3ab6389b/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Yuji3000">GitHub</a><br>
      <a href="https://www.linkedin.com/in/yujikosa/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/MisterJackpots">GitHub</a><br>
      <a href="https://www.linkedin.com/in/gabriel-c-nunez/">LinkedIn</a>
    </td>
  </tr>
</table>
<p align="right">(<a href="#top">back to top</a>)</p>



