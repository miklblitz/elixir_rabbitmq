# Rabbitmq Tutorials

**Elixir and RabbiMQ prototype conversation**

## How check the example

* install message broker RabbitMQ
* run `mix deps.get`
* Open terminal 1: run `iex -S mix`
* * call `Receive.receiver` into iex shell
* Open second terminal 2: run `iex -S mix`
* * call `Send.sender` into iex shell, enter own message and hit Enter
* Be sure that message will come into terminal 1
