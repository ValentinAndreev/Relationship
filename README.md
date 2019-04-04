# Relationship
Simple gem for connection following/followed between two users.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'relationship', git: 'git://github.com/ValentinAndreev/Relationship.git'
```

And then execute:
```bash
$ bundle
```
You should have User model, rake db:migrate for create Relation model.  
Inside User model - include Relationship.
This give you next methods for User:

    follow(other_user)

    unfollow(other_user)

    followings?(other_user)
    
    following
    
    followers

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
