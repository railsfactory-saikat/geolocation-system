# README

Setup The application with docker

1. git clone git@github.com:railsfactory-saikat/geolocation-system.git
2. docker-compose build
3. docker-compose run web rake db:create
4. docker-compose run web rake db:migrate
5. docker-compose up

API end-points are as follows

* POST '/users' - params { email, password } -> To create user
* GET '/generate_token' - params { email, password } - To generate authorization token

Below APIs are secured. Pass your token as Authorization > Bearer Token to get response

* POST '/geolocations', params { IPV4 address } -> Save the IP details
* GET '/geolocations' -> List all your saved geolocations
* GET '/geolocations/:id' -> See details of a geolocation
* DELETE '/geolocations/:id' -> Delete a saved geolocation
