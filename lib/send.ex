defmodule Send do

  def sender do
    message = IO.gets("Type your message and press Enter: ") |> String.trim
    {:ok, connection} = AMQP.Connection.open
    {:ok, channel} = AMQP.Channel.open(connection)
    AMQP.Queue.declare(channel, "mychannel")
    AMQP.Basic.publish(channel, "", "mychannel", message)
    IO.puts " [x] Send #{message}"
    AMQP.Connection.close(connection)
  end
  
end