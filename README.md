# Home Game Calendar for the ALBA Berlin Basketball team

`create_homegame_calendar.rb` takes the [game schedule (calendar)](https://calovo.de/f/albaberlin/spielplan) of [ALBA Berlin](https://www.albaberlin.de/spielplan/) and turns it into a calendar that only contains the home games.

## Why?

Together with a group of friends we are season ticket holders of Alba Berlin, i.e. we split the home games between all of us. Hence we need a calendar with just the home games, so that we can then mark in the calendar events who is going to which game.

Every year I am creating this calendar manually. This year I got annoyed with this, so I am automating this now :) Scratch your own itch!

## Create a Calendar

1. Download [game schedule (calendar)](https://calovo.de/f/albaberlin/spielplan) from calovo.de.
e.g. `a29dcd34.f637522e-c1d948eb.ics`

2. Run the script:

```
ruby create_homegame_calendar.rb a29dcd34.f637522e-c1d948eb.ics > alba-homegame-calendar.ics
```

3. Import `homegame-calendar.ics` into your favorite calendar app of choice.

Enjoy the ALBA home pages :)
