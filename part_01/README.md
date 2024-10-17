# Part 01

## Important Notes
Due to time constraint, and to my best understanding of the coding challenge, I am focusing solely on the matcher logic between two properties.

Other aspects of the application are mainly out of scope, listed below. I also include some notes for future improvements:
* a more versatile way of feeding data to the script. Ideally it should be able to accept data via different file format, direct user input, etc
* there is no database component because it is not explicitly mentioned as being part of the requirement. Ideally we should be able to have internal database already to populate/represent database properties. Otherwise, a migration script is also an option.
* a more interactive console. It should continue comparing upon user command until user decides to quit.


## Installation

```
bundle install
```

## Usage
To compare a property from agency against a property in the database, please enter the property details in `data/input.yml` first.

And then run the script:
```
bundle exec ruby runner.rb
```

## Test and Development

Run automated tests:
```
bundle exec rspec
```

Run rubocop:
```
bundle exec rubocop
```
