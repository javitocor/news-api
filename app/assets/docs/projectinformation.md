# PROJECT INFORMATION

## Project description
The project main target is to create an API to feed a home of news in an online platform.
The task is to build an API focusing on quality and good practices.
The project consists of two main user stories, one to create news and the other one to
show those news in the feed. 
Only admin users can create and only logged users can see the news.

## Project Structure
The project is divided in different milestones, each one in a different branch with its single and descriptive pull request. The milestones are in the following order:

- Main branch: Production branch.
- Development branch: Branch to merge the approved pull requests before deploying into production.
- Set up branch: Add gems to project and set up the basic configuration of the API.
- Models branch: Create and implement the project models( users and news) and its associations.
- Controllers branch: Create and implement registrations, sessions and news controller. Add endpoints to routes.rb.
- Serializers branch: Implement how the data is presented to the user.
- Testing branch: Create and implement tests for the project.
- Final branch: Create documentation and add MIT license.

## Gems used and Procedures
This app has been built using Ruby on Rails 5.2.4 under Ruby 2.6.5. The authentication system has been built with [devise](https://github.com/heartcombo/devise) and [simple token authentication](https://github.com/gonzalo-bulnes/simple_token_authentication). Firstly, users has to sign up and the sign in, in both cases they get a JSON response(depending the case will be successful or rejected) with the information of the user and, the request status and an information message.
Once the user is logged and authenticated, they can access to the inforation provided by the API, in that cases also a JSON response with status and infomration message. In case they are admin users, they also will be able to create News. If the user is not an admin the create request wil be rejected.
The JSON response it is serializer using [active model serializers](https://github.com/rails-api/active_model_serializers) to provide only the necessary information.
This API can be integrated in an frontend client, since the project is implemented with simple token authentication and [rack-cors](https://github.com/cyu/rack-cors) it's allowed to receive request from everywhere.
Some models tests are available thanks to [Rspec](https://github.com/rspec/rspec-rails) and [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers).

## Usage
In order to check the API with no frontend client, you can follow those instructions:

- Using an app like [Postman](https://www.postman.com/)
- Using command line with [Curl](https://curl.haxx.se/)
- Using browser extensions like [Restman](https://chrome.google.com/webstore/detail/restman/ihgpcfpkpmdcghlnaofdmjkoemnlijdi?hl=en)

- Endpoints:
  - Sign up: Create a POST request to `http://localhost:3000/api/v1/sign_up` with passing parameters in body as JSON object like this(you also can add the admin field, it is false by default).
    {
      "user": {
        "email":"abc@example.com",
        "password":"password",
        "password_confirmation":"password"
      }
    }
  - Sign in: Create a POST request to `http://localhost:3000/api/v1/sign_in` with passing parameters in body as JSON object like this. If the password or email is not correct you will get a `401-Unauthorized` error.
    {
      "user": {
        "email":"abc@example.com",
        "password":"password"
      }
    }
  - View News: Once the user has signed in, can make a GET request to `http://localhost:3000/api/v1/news` to get a JSON response with a list of all the news and its creator.
  - Create News: If the user is logged and it is an admin user, can make a POST request to `http://localhost:3000/api/v1/news` with passing parameters(title and the content fields) in a body JSON object. The 'User_id' will be automatically added using the devise helper 'current_user'.