FROM elixir:1.13.1


RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y inotify-tools && \
    apt-get install -y postgresql-client


WORKDIR /usr/app
COPY . .

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

CMD ["mix", "phx.server"]