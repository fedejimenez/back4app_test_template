# Start from the official Ruby image
FROM ruby:3.0.3

# Install Node.js and Yarn (needed for Rails asset compilation)
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Add permissions
RUN mkdir /back4app_test_template \ 
  && chown $(id -un):$(id -gn) /back4app_test_template

# Set the working directory
WORKDIR /back4app_test_template

# Add the Gemfile and Gemfile.lock to the image
COPY Gemfile /back4app_test_template/Gemfile
COPY Gemfile.lock /back4app_test_template/Gemfile.lock

# Set production environment
ENV RAIlS_LOG_STDOUT="1" \
  RAILS_SERVE_STATIC_FILES="true" \
  RAILS_ENV="production" \
  BUNDLE_WITHOUT="development"

# Install gems
RUN bundle install

# Precompile assets
RUN rails assets:precompile

# Create db and run migrations
RUN rails db:create
RUN rails db:migrate

# Copy the rest of the application into the image
COPY . /back4app_test_template

# Add a script to be executed everytime the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose the port that the Rails server will run on
EXPOSE 80

# Define the command to start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
