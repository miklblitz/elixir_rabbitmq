defmodule Receive do
  def wait_for_messages do
    receive do
      {:basic_deliver, payload, _meta} ->
        IO.puts " [x] Received #{payload}"
        wait_for_messages()
    end
  end

  def receiver do
    {:ok, connection} = AMQP.Connection.open
    {:ok, channel} = AMQP.Channel.open(connection)
    AMQP.Queue.declare(channel, "mychannel")
    AMQP.Basic.consume(channel, "mychannel", nil, no_ack: true)
    IO.puts " [*] Waiting for messages. To exit press CTRL+C, CTRL+C"

    Receive.wait_for_messages()
  end
end

