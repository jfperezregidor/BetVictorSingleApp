# BetVictorSinglePage

Interview Test

## Usage
Before start:
* Install Ruby and Rails: you can check https://gorails.com/setup/ubuntu/16.04
* Install Firefox browser: you can check https://www.mozilla.org/en-US/firefox/new/

* The project has been tested with ruby and rails version:
```
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin15]
Rails 5.1.4
```


* Download https://github.com/mozilla/geckodriver/releases for your computer and extract the file
* Move the geckodriver to /user/local/bin/
```
$ mv geckodriver /usr/local/bin/
```
* Clone the repository in your workspace
```
$ git clone https://github.com/jfperezregidor/BetVictorSingleApp.git
```
* To go to BetVicotorSingleApp folder and install the project
```
$ cd BetVictorSingleApp
$ source ~/.rvm/scripts/rvm
$ bundle install
$ bin/rails db:migrate RAILS_ENV=development
```


## Run

```
$ cd BetVictorSingleApp
$ source ~/.rvm/scripts/rvm
$ rails server
```
Open browser like Chrome with url: localhost:3000

You can do query as:
1. /sports -  it shows all sports
2. /sports/id  -  it shows all events
3./sports/id/events/id  - it shows the outcomes for an event


## Test

```
$ cd BetVictorSingleApp
$ source ~/.rvm/scripts/rvm
$ rspec
```
The test are 7 to test the funcionality of the webapp.

All the test are running with selenium:
1. First visit the page visit(/)
2. Introduce a query in input-form
3. Click in submit button
4. Check the result

The test are:
1. Query to /sports and show all sports
2. Query to /sports/100 and show events
3. Query to /sport/100/events/ and show outcomes
4. Query /sports/300 it has not results
5. Query error 1 query short /sport
6. Query error 2 query = //
7. Query error 3 the query is big and it is not correct query = /sportsevents

In the other hand the test has been make with testing the json file from qwerty folder. It has a version of the json from BetVictor url.


## Other things
I had to create a json file in qwerty, because I am in Lisbon and here the webpage of BetVictor is restricted. Then I installed the Hola Vpn for chrome browser and I get the json file from betVictor changing the location
Also, I have coded the controllers to use HTTParty to request the BetVictor Url but the code has been comented, but you can see in SportsController and EventController

Before play with Json:
response = JSON.parse(HTTParty.get("http://www.betvictor.com/live/en/live/list.json"))
