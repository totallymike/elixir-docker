FROM totallymike/elixir:1.0.2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY mix.exs /usr/src/app/
ONBUILD COPY mix.lock /usr/src/app/

ONBUILD RUN mix local.hex --force && \
        mix local.rebar --force && \
        mix deps.get && \
        mix deps.compile && \
        MIX_ENV=test mix deps.compile

ONBUILD COPY . /usr/src/app

ONBUILD RUN mix compile

EXPOSE 3000

CMD ["iex", "-S", "mix"]
