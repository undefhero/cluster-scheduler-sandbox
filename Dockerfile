FROM elixir:latest

RUN mix local.hex --force \
    && mix local.rebar --force

COPY . .

RUN mix deps.get \
    && mix compile --warnings-as-errors \
    && mix release --overwrite

CMD ["_build/dev/rel/cluster_scheduler/bin/cluster_scheduler", "start"]