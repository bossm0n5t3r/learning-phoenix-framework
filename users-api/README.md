# UsersApi

## Create a new Phoenix project

### Initialize

```shell
❯ mix phx.new users-api --no-assets --no-html --binary-id --app users_api
* creating users-api/lib/users_api/application.ex
* creating users-api/lib/users_api.ex
* creating users-api/lib/users_api_web/controllers/error_json.ex
* creating users-api/lib/users_api_web/endpoint.ex
* creating users-api/lib/users_api_web/router.ex
* creating users-api/lib/users_api_web/telemetry.ex
* creating users-api/lib/users_api_web.ex
* creating users-api/mix.exs
* creating users-api/README.md
* creating users-api/.formatter.exs
* creating users-api/.gitignore
* creating users-api/test/support/conn_case.ex
* creating users-api/test/test_helper.exs
* creating users-api/test/users_api_web/controllers/error_json_test.exs
* creating users-api/lib/users_api/repo.ex
* creating users-api/priv/repo/migrations/.formatter.exs
* creating users-api/priv/repo/seeds.exs
* creating users-api/test/support/data_case.ex
* creating users-api/lib/users_api/mailer.ex
* creating users-api/lib/users_api_web/gettext.ex
* creating users-api/priv/gettext/en/LC_MESSAGES/errors.po
* creating users-api/priv/gettext/errors.pot
* creating users-api/priv/static/robots.txt
* creating users-api/priv/static/favicon.ico

Fetch and install dependencies? [Yn]
* running mix deps.get
* running mix deps.compile

We are almost there! The following steps are missing:

    $ cd users-api

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```

### Add docker-compose.yml

```docker
version: '3.9'
services:
  db:
    container_name: learning-phoenix-framework-users-api-postgres
    image: postgres:latest
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    ports:
      - '54321:5432'
```

### Run docker compose

```shel
$ docker compose up -d
```

### Edit config/dev.exs

```ex
...

# Configure your database
config :users_api, UsersApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "54321",
  database: "users_api_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

...
```

### Ecto create

```shell
❯ mix ecto.create
Compiling 10 files (.ex)
Generated users_api app
The database for UsersApi.Repo has been created
```

### Create Phoenix Context

```shell
❯ mix phx.gen.context Admin User users name:string email:string:unique role:string address:string
* creating lib/users_api/admin/user.ex
* creating priv/repo/migrations/20240119170200_create_users.exs
* creating lib/users_api/admin.ex
* injecting lib/users_api/admin.ex
* creating test/users_api/admin_test.exs
* injecting test/users_api/admin_test.exs
* creating test/support/fixtures/admin_fixtures.ex
* injecting test/support/fixtures/admin_fixtures.ex

Remember to update your repository by running migrations:

    $ mix ecto.migrate

```

### Migration

```shell
❯ mix ecto.migrate
Compiling 2 files (.ex)
Generated users_api app

02:09:11.161 [info] == Running 20240119170200 UsersApi.Repo.Migrations.CreateUsers.change/0 forward

02:09:11.162 [info] create table users

02:09:11.178 [info] create index users_email_index

02:09:11.183 [info] == Migrated 20240119170200 in 0.0s
```

---

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
