# The Hacking Project - Rubynit Script
A Ruby script allowing to quickly bootstrap a Ruby project for The Hacking Project
with predefined architecture and gems.

## Presentation
This script allows to :

- Create a folder named by user's input
- Create a Gemfile with THP's most used gems
- Create a .env file to store API keys, passwords, etc...
- Create a .gitignore file to prevent tracking .env file and .idea folders
- Create a lib/ folder
- Create a db/ folder
- Create a ./app.rb file with a few code lines

## Usage

1. Run this program using command `ruby rubynit.rb project_name`.
2. This will create the new project in your current directory.

To go further, you could define an alias running the following code :
```ruby
#Bootstrap a ruby project for THP
alias rubynit='ruby /var/www/rubynit/rubynit.rb'
```
This way, you will be able to create your project from any repository just by using
`rubynit project_name`.