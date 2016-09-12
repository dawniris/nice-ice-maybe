# nice-ice-maybe
sweet, sweet poetry (possibly)

![](http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2012/4/5/2/FNM_050112-Ted-Farmers-Market-001_s4x3.jpg.rend.sniipadlarge.jpeg)

## the why
don't _you_ get all _your_ best app ideas on Friday afternoon at Ruby on Ales?

## the how
First create a local clone of the _nice-ice-maybe_ repo, then `cd` into that directory and execute the following three rake tasks:

```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake populate_lyric_db
```

Now spin up a local Rails server with `bundle exec rails s` and poem to your heart's content by navigating to `http://localhost:3000/` in your browser of choice (i.e. not IE).

## parting thoughts
In the infamous words of Robert Matthew Van Winkle:
>Ninja, Ninja rap, Ninja, Ninja rap, Ninja, Ninja rap