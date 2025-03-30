# UmeDemo

## Setup

Start node A

```bash
cd ~/flight_tracker
iex --name crash24@127.0.0.1 --cookie secretofmana -S mix phx.server
```


Start node B 

```bash
cd ~/ume_demo
iex --name sam_site@127.0.0.1 --cookie secretofmana -S mix run
```

node B assumes node A is called crash24@127.0.0.1


### Init aircraft / sam site

```elixir
Aircraft.spawn_random(FlightControl, FlightTracker.Super, 750)

SamSite.round_trip(FlightControl, {Phoenix.PubSub, FlightTracker.PubSub})
```

