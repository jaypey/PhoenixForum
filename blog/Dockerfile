FROM elixir:latest

RUN apt-get update && \
	apt-get install -y postgresql-client


RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force

ENV MIX_ENV=prod

RUN mix deps.get --only $MIX_ENV
RUN mix deps.compile

RUN mix phx.digest

RUN mix do compile

RUN mix release

EXPOSE 4000

CMD ["/app/entrypoint.sh"]
