# GotSurf Service ![Heroku](http://heroku-badges.herokuapp.com/?app=got-surf-service&root=/)

### Prerequisites

First will have to create a new entry in credentials file to store the Telegram access key, that will be used later to seed the Bot user information
```
$ EDITOR="vim" rails credentials:edit
```
Add the following lines
```
telegram_bot:
 access_key: <telegram_bot_access_key>
```

Seed the database using _rake:seed_ command
```ruby
$ rake db:create db:migrate db:seed
```

This process will create a user with an made up email and using the previous credentials _telegram_bot[:access_key]_
```
{email: "bot@gotsurf.com",password:Rails.application.credentials.telegram_bot[:access_key]}
```

Once done that, it's time to generate a JWT Token using a class method in _JsonWebToken_ class, so run rails console an type the following command:
```
irb(main):004:0> JsonWebToken.encode({sub:1})
=> "eyJhbGcisdfgsdJIUzI1NiJ9.eyJzdWIiOjEsdfsdsdszNjAxOTAzOH0.LwcpJ-3XW_pxocfdgfgdfg8oio7Kl0wuD3SYa60xcM"
```
Use this token on your Bot application to make the call towards the service.
```
response = self.class.get('/spots', headers: {"Authorization" => "Bearer #{ENV[:JWT_USER_TOKEN.to_s]}"})
```
 
### Usage

* [Got Surf Telegram Bot](https://github.com/eddygarcas/gotsurfbot) - Check out Got Surf Bot to see how the authentication works

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - Web framework


## Authors

**Eduard Garcia Castelló** - [Linkedin](https://www.linkedin.com/in/eduard-garcia-castello/) - [Twitter](https://twitter.com/egarciacastello)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


