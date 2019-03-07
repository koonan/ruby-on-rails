# EmailValidator Api checker
EmaiValidator is an api for checking if the email is valid or not

## usage
```bash
bundle install
```
```bash
rails s
```
you can use it by making a post  request[postman as an example] to ```/api/validator/email_valid``` with
email=test@example.com in  body.

### success and error messages
* **Email is valid** if email exist
* **email does not exist as an SMTP domain** if email doesn't exist

### used Gems and APIs
* [mailboxlayer](https://mailboxlayer.com) as a 3rd party api
