# Private Events

This project is about building an application where users can create and schedule various events as well as see events created by other users..
  
[![View Code](https://img.shields.io/badge/View%20-Code-green)](https://github.com/vanheaven-ui/events)
[![Github Issues](https://img.shields.io/badge/GitHub-Issues-orange)](https://github.com/vanheaven-ui/events/issues)
[![GitHub Pull Requests](https://img.shields.io/badge/GitHub-Pull%20Requests-blue)](https://github.com/vanheaven-ui/events/pull/1)
[![Author](https://img.shields.io/badge/Github-Author-black)](https://github.com/vanheaven-ui)
[![Twitter Follow](https://img.shields.io/badge/Twitter-Ezekiel-%231DA1F2)](https://twitter.com/MworekwaE)
[![LinkedIn follow](https://img.shields.io/badge/LinkedIn-Ezekiel-%232867B2)](https://www.linkedin.com/in/vanheaven/)

## Index Page Screenshot

<img src="/app/assets/images/screenshot.png" alt="screenshot">

## Content

<a text-align="center" href="#about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#ins">Installations</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#usage">Usage</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#app">App</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#tests">Testing</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#with">Built With</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#author">Author</a>


## About <a name = "about"></a>
This project involves creating a simple ruby on rails application with a simple user sign in by name. The sign in is authenticable against user sign up. Once a user is able to sign into the application, a list of events curated by whether they are upcoming or they have ended is presented to the user. The user can click each event to see more details about it. More so, the user can edit their profile and they can see how many events they have created and how many events they have attended. A user is also able to create their own events by clicking the ``New Event`` item in the top navigation bar.

## Pre-coding Planning
Before writing code, the the following constituted the blueprint. 

### Data Modelling
Data modelling was the first step and is described in the associations below:

#### User Model
* ``has_many created_events with foreign_key as creator_id and class_name as User``
* ``has_many event_attendings``
* ``has_many attended_events through event_attendings joining table where source is event``

#### Event Model
* ``belongs_to creator where class-name is User``
* ``has_many event_attendings``
* ``has_many event_attendees through event_attendings joining table where source is user``

#### Event_Attending Model
* ``belongs_to User``
* ``belongs_to Event``

## 🔧 Built with<a name = "with"></a>

- ruby 2.7.0p0 (2019-12-25 revision 647ee6f091)
- Rails 6.0.3.3
- Gems/Dependencies
  - [ ] rubocop (0.81.0)
  - [ ] rspec-rails (4.0.1)
  - [ ] capybara (3.33.0)

## Usage <a name = "usage"></a>
To use the code in this repository, follow the steps in this section:

### 🔨 Preliquisites
 You should have the following packages installed on your computer inorder to run the code contained herein.

- Ruby version ``ruby 2.7.0p0 (2019-12-25 revision 647ee6f091)``. 
- Rails version ``Rails 6.0.3.3.``

### 🔨 Setup
First get a copy of the project on your computer:

- Clone or download the repository to a local directory on your computer by following the Github instructions at [Github clone/download repository](https://docs.github.com/en/enterprise/2.13/user/articles/cloning-a-repository).

### 🛠 Installing <a name = "ins"></a>
Once you have a local copy of the entire project on your computer,
If you don't meet the above preliquisites, then:

- Visit [Ruby Installations](https://www.ruby-lang.org/en/documentation/installation/) to install ruby version  2.7.0.
- Visit [Rails installations guide](https://guides.rubyonrails.org/v5.0/getting_started.html) to install rails version 6.0.3.3.

###  App <a name = "app"></a>
With the installations above complete, you are set to use the code and view the application built in this repository. Follow these simple steps:

- Change directory into the directory where you cloned the repository. Forexample ``vanheaven@vanheaven-VirtualBox:~/Microverse-projects$ cd private-event.``
- Run ``bundle install`` in the terminal to install gems and their dependencies.
- Run ``rails db:migrate`` to update the database.
- Run ``rails s`` or ``rails server`` in the terminal to start the server.
- Once the server starts(Might take about 3-5 minutes), you can access the application by typing localhost:3000 in your browser and striking ``Enter``.

## Testing <a name = "tests"></a>
The tests in this repository were written uing Rspec and capybara. So to run these tests successfully on your computer, follow the steps below;
* Crosscheck to make sure that your Gemfile has _**rails-rspec**_ in the development block and _**capybara**_ in the test block. See this example:
   ```<pre>
    group :development do
      gem 'listen', '~> 3.2'
      gem 'web-console', '>= 3.3.0'
      gem 'database_cleaner'
      gem 'rspec-rails'
      gem 'spring'
      gem 'spring-watcher-listen', '~> 2.0.0'
    end

    group :test do
      gem 'capybara', '>= 2.15'
      gem 'selenium-webdriver'
      gem 'webdrivers'
    end
 * Follow [SettingUp RSpec and Capybara](https://madeintandem.com/blog/setting-up-rspec-and-capybara-in-rails-5-for-testing/) guide to fully setup rails and capybara.
 * Then run ``rspec`` in the terminal.

## ✒️  Authors <a name = "author"></a>

👤 **Mworekwa Ezekiel**

- Github: [@vanheaven-ui](https://github.com/vanheaven-ui)
- Twitter: [@MworekwaE](https://twitter.com/MworekwaE)
- Linkedin: [@linkedin](https://www.linkedin.com/in/vanheaven/)
- Email: [ezekiel](mailto:vanheaven6@gmail.com)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

- To create an issue, visit the [issues page](https://github.com/vanheaven-ui/events/issues) and create a new issue.
- To contribute to the code base, follow the steps below:
  1. Fork this repository to your remote respository by clicking the Fork button in this repository.
  2. Clone this repository to a directory on your computer by following Github guidelines.
  3. Change directory into the directory where you cloned this repository to.
  4. Open the directory using your favorite editor.
  5. Create a feature branch off the develop branch.
  5. Make and commit the nuanced code.
  6. Open a pull request describing the improvements made
And your reward awaits in heaven.


## 👍 Show your support

Give a ⭐️ if you like this project!

## :clap: Acknowledgements
[The Odin project Guide:](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)<br />
[Microverse guide:](https://microverse.pathwright.com/library/fast-track-curriculum/69047/path/step/49722686/)


