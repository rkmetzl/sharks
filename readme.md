sharks
=========

Convert SimpleDateFormat Java time declarations into Ruby-friendly ones

What?
=========

So say someone says "Hey, I want the time displayed in this format: `yyyy.MM.dd G 'at' HH:mm:ss z`"
And you're in Ruby.
And you're like "No way, Jose! I need a strftime-readable string there!"

Well guess what, buster? You don't have to say that anymore.
Instead, you can say "Sure thing, no problem!" 
or "Look what I can do! Inline string conversion!"
or "Where are my pants?"

All because of `sharks`.

`sharks` adds a new Time method: `strfjtime`.
`strfjtime` stands for "Sharks Tackles Really Fun Java(/other) Time Inconsistencies for Me. Egad!"


Usage:
==========

once requiring 'sharks' (you know, with `require 'sharks'`), simply call .strfjtime from a Time object.

For example:
`irb(main)> Time.now.strfjtime("yyyy.MMMMM.dd GGG hh:mm aaa")`
`=> "2013.September.9 AD 11:18 pm"`

or

`irb(main)> Time.now.strfjtime("hh 'o''clock' a, zzzz")`
`=> "11 o'clock pm, EDT"`

And that's it! Easy peasy.

Known differences (between these two standards):
==========

- G (era designator) is hardcoded to "AD". Why would you use otherwise?
- W and w (Weeks in year/month respectively) is not supported.
- F (day of week) may be one off. I've never actually had to use this one yet.
- k and K (24-hour (1-24) and 12-hour (0-11)) don't seem to be supported by Ruby natively.
- S is mapped to "%L", which I'm not confident is a good solution.

Contributions:
=========

A special thanks to my coworker and good friend Michael for his thoughts on this.
You can find him here: http://github.com/desperatethelark

There are TONS of small discrepancies between these time formats. I have tried to handle all that I could, but I'm sure I missed some obvious ones. Cloning/pull requests would be best, but if you have an idea and no gumption, an email to me would be neat.

Copyright
========

GPLv2 yo.
