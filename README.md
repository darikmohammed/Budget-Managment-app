# Budget Managment App

> This app is about building a mobile web application where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.

## Features

- Register and log in, so that the data is private to the user.
- Introduce new transactions associated with a category.
- See the money spent on each category.

## Built With

- Ruby on Rails
- Devise for authentication
- PostgreSQL
- Tailwind css
- Rspec test

## Live demo

https://rocky-dusk-21313.herokuapp.com/

# Getting Started

### Prerequisites

- Ruby ruby-3.1.2 installed
- PostgreSQL DBMS running

### Setup

- Open your terminal and navigate to the folder you would like to save the project.type the following commands to your terminal

```bash
git clone git@github.com:darikmohammed/Budget-Managment-app.git
```

```bash
cd Budget-Managment-app && bundle install
```

**_before running the project we have to setup our databses_**

<hr>

1. Set databased name and password in database.yml

2. Or Set `.env` file contains environment variables needed to get the Database up and running.

- `.env.local` file you can use as a guide to configuring your own. Type the following commands into the terminal (or Git Bash, if using Windows) to create your `.env` file:

```bash
cp .env.local .env
```

```bash
rails secret
```

- Set your variables at .env

```env
    DATABASE_HOST
    DATABASE_USER
    DATABASE_PASSWORD
```

### Then bootup your database by running the following command

```shell
rails db:reset

```

### Run application

```rb
rails server

```

- Open your web browser at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

### Testing

```
rspec

```

## Authors

👤 **Darik Mohammed**

- GitHub: [@githubhandle](https://github.com/darikmohammed)
- Twitter: [@twitterhandle](https://twitter.com/r_darik)
- LinkedIn: [darikmohammed](https://www.linkedin.com/in/darik-mohammed/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.
