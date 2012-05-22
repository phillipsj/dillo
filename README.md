#Dillo

Ruby library for working with the City of Austin [Data Portal](http://data.austintexas.gov).  This library is derived from [Windy](https://github.com/Chicago/windy) which is a library for interacting with Chicago's [Socrata](http://www.socrata.com) powered data portal.

##Installing

    $ gem install dillo

##Usage

###Views

Views are the most basic buidling blocks of Socrata, these are what you see when you use the website.  To get a list of views:

   all_views = Dillo.views

This returns an array of views.

###Rows

To get the data inside of a view use the following:

    unclaimed_property = Dillo.views.find_by_id("h3i4-5e5v")

To get an individual record:

    record = unclaimed_property[0]

The individual column names now became properties that can be accessed like:

    record.first  # first is the name of the column

To search rows by column name you can use the "find_by_columnname" method:

    just_first_names = unclaimed_property.find_all_by_first("insert a value")

##Future Plans

+ Full RDoc documentation
+ Rake tasks for running tests and misc.
+ More tests
+ Example applications

##Issues

Please use the issue tracker here on github.

##Contributions

Any contributions are welcome, there are not any specific requirements or standards being used at the moment.
