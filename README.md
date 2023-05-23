 # Back4app Containers - Ruby on Rails Application

 This is a simple Ruby on Rails application that has been configured to run on Back4app Containers. It serves a welcome page when accessed via a web browser.

 ## Getting Started

 These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

 ### Prerequisites

 - You should have [Ruby](https://www.ruby-lang.org/) and [Rails](https://rubyonrails.org/) installed on your local machine.
 - Install [Docker](https://www.docker.com/products/docker-desktop) if you want to build and run the Docker container locally.

 ### Installing

 1. Clone this repository:

 ```sh
 git clone https://github.com/templates-back4app/containers-ruby-rails-app.git
 cd containers-ruby-rails-app
 ```

 2. Install the project dependencies:

 ```sh
 bundle install
 ```

 3. Start the development server:

 ```sh
 rails server
 ```

 Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

 ### Building a Docker Image

 To build a Docker image of the application, run the following command:

 ```sh
 docker build -t containers-ruby-rails-app .
 ```

 ### Running the Docker Container

 To run the Docker container, use the following command:

 ```sh
 docker run -p 8080:3000 containers-ruby-rails-app
 ```

 Now, the app is running at [http://localhost:8080](http://localhost:8080)

 ## Deployment

 The project can be deployed on Back4app Containers. Refer to the [Back4app Documentation](https://www.back4app.com/docs-containers) for more information.

 ## Built With

 - [Ruby on Rails](https://rubyonrails.org/)
 - [Docker](https://www.docker.com/)


 ## Authors

 - **Back4app** - Initial work - [Back4app](https://github.com/back4app)

 See also the list of [contributors](https://github.com/templates-back4app/containers-ruby-rails-app/contributors) who participated in this project.

 ## License

 This project is licensed under the MIT License
