# AirbnbEx

```
docker compose run --rm airbnbex mix ecto.create
```

```
docker compose run --rm airbnbex mix ecto.migrate
```

```
docker compose run --rm airbnbex mix ecto.drop
```

```
docker compose run --rm airbnbex mix test
```

```
docker compose run --rm airbnbex mix coveralls
```

```
docker compose run --rm airbnbex mix credo --strict
```

```
docker compose run --rm airbnbex mix credo gen.config
```

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).
