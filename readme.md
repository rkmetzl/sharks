sharks
=========

Format ICU SimpleDateFormat time declarations in Ruby

What?
=========

It's well known that sharks are always on time, and not just the sea creatures, either. Land sharks, loan sharks, lone sharks, shark attacks, and used car salesmen are all known for their poignancy with regards to timing. That's why `sharks` exists. but what does `sharks` do?

So say someone says "Hey, I want the time displayed in the following format: `yyyy.MM.dd G 'at' HH:mm:ss z`"<br>
And you're in Ruby.<br>
And you're like "No way, Jose! I need a strftime-readable string there!"<br>

Well guess what, buster? You don't have to say that anymore.<br>
Instead, you can say "Sure thing, no problem!"<br>
or "Look what I can do! Inline string conversion!"<br>
or "Where are my pants?"<br>

All because of `sharks`.

`sharks` adds a new Time method: `strficu`. <br>
`strficu` stands for "Sharks Tackles Really Fun and Interesting Common Usages (...of various time-based strings and timestamps used in Ruby). We're still working on the acronym.


Usage:
==========

once requiring 'sharks' (you know, with `require 'sharks'`), simply call .strficu from a Time object.

For example:
<pre>
irb(main)> Time.now.strficu("yyyy.MMMMM.dd GGG hh:mm aaa")
=> "2013.September.9 AD 11:18 pm"
</pre>

or

<pre>
irb(main)> "I lost my pants around #{Time.now.strficu("hh 'o''clock' a, zzzz")}"
=> "I lost my pants around 11 o'clock PM, EDT"
</pre>

And that's it! Easy peasy.

Known differences:
==========
(between these two standards)<br>
- G (era designator) is hardcoded to "AD". Why would you use otherwise?
- W and w (Weeks in year/month respectively) is not supported.
- F (day of week) may be one off. I've never actually had to use this one yet.
- k and K (24-hour (1-24) and 12-hour (0-11)) don't seem to be supported by Ruby natively.
- S is mapped to "%L", which I'm not confident is a good solution.

Contributions:
=========

A special thanks to my coworker and good friend Michael for his thoughts on this.<br>
You can find him here: http://github.com/desperatethelark<br>

The ICU spec is a complicated one and `sharks` does not yet support everything it has to offer. If you'd like to contribute code, I ask that you at least take a gander through http://userguide.icu-project.org/formatparse/datetime before making any pull requests.
Copyright
========

GPLv2 yo.
