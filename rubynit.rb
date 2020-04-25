README = "# The Hacking Project (Week [i?] - Day [i?])

## Project : [project_name?]

/!\\ Be careful ! Configure the ruby version in Gemfile to adapt the program to your own ruby version /!\\

### Installation

To install the project, follow these steps :
1. Use command `git clone` to clone the project on your environnment\n
2. Use command `CD` to go in the project's repository\n
3. Use command `bundle install` to install all the gem dependancies\n

Then, you can :
- Launch the program thanks to the command `ruby app.rb`\n
- Use the code linter to get a clean code by using command `rubocop`

### Presentation"


# Create a folder named by user's ARGV
def make_project_folder
  # Check user input
  check_if_user_gave_input
  # Grab user input
  project_name = ARGV.first
  # Create dir
  Dir.mkdir(project_name)
  # Return the full path
  File.expand_path(project_name)
end

# If user don't input ARGV, explain how the command works then exit
def check_if_user_gave_input
  abort('[rubynit] Missing parameter project_name. Retry using command `rubynit project_name`') if ARGV.empty?
end

# Make Gemfile with THP's usual gems
def make_gemfile(project_name)
  file = File.open("#{project_name}/Gemfile", 'w')
  file.puts "source 'https://rubygems.org'"
  file.puts "ruby '2.7'"
  file.puts "gem 'rspec'"
  file.puts "gem 'pry'"
  file.puts "gem 'rubocop', '~> 0.57.2'"
  file.close
  path = system("pwd")
end

# Make Gemfile with THP's usual gems
def make_readme(project_name)
  file = File.open("#{project_name}/README.md", 'w')
  file.puts README
  file.close
  path = system("pwd")
end

# Make prefilled app.rb file
def make_app_file(project_name)
  file = File.open("#{project_name}/app.rb", 'w')
  file.puts "require 'bundler'"
  file.puts "Bundler.require"
  file.close
  path = system("pwd")
end

# Install Gems
def install_gems(project_name)
  system("cd #{project_name} && bundle install")
end

# Make .env file
def make_env_file(project_name)
  file = File.open("#{project_name}/.env", 'w').close
end

# Make .gitignore file
def make_gitignore_file(project_name)
  file = File.open("#{project_name}/.gitignore", 'w')
  file.puts ".idea"
  file.puts ".env"
  file.close
end

# Make lib folder
def make_lib_folder(project_name)
  Dir.mkdir("#{project_name}/lib")
end

# Make lib folder
def make_db_folder(project_name)
  Dir.mkdir("#{project_name}/db")
end

# Run rspec --init
def rspec_init(project_name)
  system("cd #{project_name} && rspec --init")
end
# Make Readme.md explaining it is a Ruby porject

# Run Git init and make first commit
def git_init(project_name)
  system("cd #{project_name} && git init && git add . && git commit -m 'Init commit'")
end

# Perform the program
def perform
  # Create a folder named by user's ARGV
  project_name = make_project_folder

  # Make Gemfile with THP's usual gems
  make_gemfile(project_name)

  # Make prefilled README.md
  make_readme(project_name)

  # Make prefilled app.rb
  make_app_file(project_name)

  # Make .env file
  make_env_file(project_name)

  # Make .gitignore file
  make_gitignore_file(project_name)

  # Make lib folder
  make_lib_folder(project_name)

  # Make db folder
  make_db_folder(project_name)

  # Run rspec --init
  rspec_init(project_name)

  # Run Git init and make first commit
  git_init(project_name)
end

perform
