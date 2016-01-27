defmodule LinkServerTest do

  # setup do
  #   LinkServer.start(:type, :args)

  #   on_exit fn ->
  #     :application.stop(:link_server)
  #   end

  #   {:ok, []}
  # end

  use ExUnit.Case
  doctest LinkServer

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "Empty server returns empty list of link" do
    assert LinkServer.list() == []
  end

  test "Added link is on the list" do
    link = "http://google.com"
    LinkServer.add(link)
    assert LinkServer.list == [link]
  end

  test "" do
    link = "http://google.com"
    {:noreply, state} = LinkServerWorker.handle_cast({:add, link}, [])
    assert state == [link]
  end
end
