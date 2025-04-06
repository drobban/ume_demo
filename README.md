# UmeDemo

## Repos related to this demo 

```
UmeDemo
FlightTracker
FlightControl
SamSite
Aircraft
```

### UmeDemo 
Just an application to spin up PubSub and get it connnected to other available PubSub's in the cluster

### FlightTracker
An application 
Handling Web Service - Map and visuals of all the processes broadcasting their state to the Web client
Handling Dynamic supervisor used by all the Aircrafts
Handling the FlightController

### SamSite 
A Module implementing the SamSite genserver

### FlightControl 
A Module implementing the FlightControl genserver 

### Aircraft
A Module implementing the Aircraft genserver 

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

SamSite.supervised_round_trip(UmeDemo.Super, FlightControl, {Phoenix.PubSub, FlightTracker.PubSub})

Aircraft.spawn_kalinin_random(FlightControl, FlightTracker.Super, 10)

Aircraft.spawn_random(FlightControl, FlightTracker.Super, 2750)

```

## Final words

This is a product intended to give a visual demo of what BEAM & Elixir is capable of.
The duration of the talk is 50min including questions.

The code is the result of me experimenting / trying out ideas and getting shit done quickly.

Dont use this as a template for how to architect your cool application running in BEAM - To be viewed more as inspiration for something better.
