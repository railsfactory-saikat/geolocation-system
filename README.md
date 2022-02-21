# README

Setup The application with docker

1. git clone git@github.com:railsfactory-saikat/geolocation-system.git
2. docker-compose run --no-deps web rails new . --force --database=postgresql
3. docker-compose run web rake db:create
4. docker-compose run web rake db:migrate
5. docker-compose up
