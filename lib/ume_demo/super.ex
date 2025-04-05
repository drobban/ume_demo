defmodule UmeDemo.Super do
  use DynamicSupervisor

  def start_link(_) do
    {:ok, pid} = DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
    {:ok, pid}
  end

  @impl true
  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
