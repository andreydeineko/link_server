defmodule LinkServerWorker do
  use GenServer
  def start_link(links) do
    GenServer.start_link(LinkServerWorker, links, name: __MODULE__)
  end

  # Callbacks
  def handle_call(:list, _from, links) do
    {:reply, links, links}
  end

  def handle_cast({:add, link}, links) do
    {:noreply, [link| links]}
  end

  def list, do: GenServer.call(__MODULE__, :list)

  def add(link), do: GenServer.cast(__MODULE__, {:add, link})

end
