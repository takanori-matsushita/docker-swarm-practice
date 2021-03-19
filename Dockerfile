FROM ruby:2.7.2-alpine

RUN gem install sinatra \
  sinatra-contrib

WORKDIR /app

COPY ./app.rb .

CMD ["ruby", "app.rb", "-o", "0.0.0.0"]