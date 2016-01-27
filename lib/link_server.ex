defmodule LinkServer do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    list_of_links = []
    children = [
      worker(LinkServerWorker, [list_of_links])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LinkServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def list, do: LinkServerWorker.list

  def add(link), do: LinkServerWorker.add(link)
end
