# GotSurf Service ![Heroku](http://heroku-badges.herokuapp.com/?app=got-surf-service&root=/)

### Prerequisites

First will have to create a new entry in credentials file to store the Telegram access key that will be used later to seed the Bot user information
```
telegram_bot:
 access_key: <telegram_bot_access_key>
```

Seed the database using the following rake command
```ruby
$ rake db:create db:migrate db:seed
```

This process will create a user with the following information, notice that user password will reuse the access key from Telegram 
```
{email: "bot@gotsurf.com",password:Rails.application.credentials.telegram_bot[:access_key]}
```

Once done that, it's time to generate a JWT Token using a class method in _JsonWebToken_ class.
Run the rails console an type the following command:
```
irb(main):004:0> JsonWebToken.encode({sub:1})
=> "eyJhbGcisdfgsdJIUzI1NiJ9.eyJzdWIiOjEsdfsdsdszNjAxOTAzOH0.LwcpJ-3XW_pxocfdgfgdfg8oio7Kl0wuD3SYa60xcM"
```
Use this generated token on your Bot application to make the call towards the service.

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - Web framework


## Authors

**Eduard Garcia Castelló** - [Linkedin](https://www.linkedin.com/in/eduard-garcia-castello/) - [Twitter](https://twitter.com/egarciacastello)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


