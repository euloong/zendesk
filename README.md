# Zendesk Ticket Viewer (browser based)

## Installation

Install git if not already installed [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

You can check your version of git by typing the following in the terminal:
```
git --version
```

Use ruby v2.5.3 or newer [Ruby](https://www.ruby-lang.org/en/downloads/)

You can check your version of ruby by typing the following in the terminal:
```
ruby -v
```

To set up this project type the following in the terminal
```
cd ~/
mkdir zendesk-challenge-eu-loong-lim && cd zendesk-challenge-eu-loong-lim
git clone git@github.com:euloong/zendesk.git
cd zendesk
bundle install
touch .env
echo ZENDESK_USERNAME = 'username provided in email to zendesk' >> .env
ZENDESK_API_TOKEN = 'token provided in email to zendesk' >> .env
rails server
```
## Usage instructions
Enter http://localhost:3000/ in your web browser.

You will see a list of the first 25 tickets with their subject and a page selector.

Click on the link for each ticket to view details for each ticket.

Click on the back button to return to the index view.

## Error handling
If a ticket number greater than 100 is provided in the url e.g. http://localhost:3000/tickets/999, the page will redirect to the index and the following error message will appear:
```
 Sorry the requested ticket could not be found will appear
```
this can be cancelled by clicking on the x.

If the internet connection is turned off or the username or API token are incorrect, a verbose error message is provided for dev environment otherwise it will provide a friendly message for the user.

To test this press control + c to stop the server and run the server with the following in the terminal. This will run the server in the production environment.

```
RAILS_ENV=production rails s
```
Turn off the internet connection on your computer and refresh the browser. You should then see the following message:

```
Sorry there was a problem connecting to the service, please try again later.
```

## How to run the test suite

### Unit tests with RSpec
In the terminal type
```
rake spec
```
They can be viewed in the ticket_viewer_spec.rb file in the spec folder.

### System tests were run with Capybara and Selenium
In the terminal type
```
rails test:system

```
These tests can be viewed in test/system/tickets_test.rb

## Design approach

I decided to use ruby on rails to quickly build the application, though in hindsight this may have been too much as a database was not required.

I tried to stick to the MVC approach but this was a bit tricky as we did not need to use a database.

I separated the API GET method from the controller and used the index and show views to render the UI.

In order to connect to the Zendesk API I used Open-URI as it was what I was most familar with. I later found out that there was a Zendesk Ruby gem but had already started down the path with Open-URI.

I had some difficulty in working out the syntax for the basic authentication with Open-URI but eventually managed to get it to work.

For handling pagination I decided to use the will_paginate gem to save me time.

Error handling - I decided to use a rescue from StandardError rather than creating multiple bespoke error messages in order to save time.

Testing - I focused on unit testing using RSpec and system testing using Capybara and Selenium with headless chrome.









