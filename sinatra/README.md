This Program runs through the following steps:
bash ./build.sh (text file) is run from command line, passing
  a text file in as an argument
script then runs commands to create a database, run the 
  schema.sql file through it, and start the server in sinatra,
  passing the file as an argument.
Server Starts:
  *The file is passed to [lines_array] variable and each line is
  added to that array.
  *[insert_lines] function is called, using [lines_array] as a variable
  *[insert_lines] calls [db_connection] function to start a connection
  to the database.
  *[insert_lines] takes each line of [lines_array] and uses a SQL 
  Insert into statement to add the line to the database.
  [db_connection] closes the connection and sinatra waits for further 
  instruction.
In a Seperate Command Line Tab (becuase localhost needs to be up).
  *bash ./run.sh is run from command line (new tab).
  *script runs several cURL lines to ping sinatra with :id numbers 
  over the localhost:4567.
  *[find_text(:id)] function finds the corresponding line in the database
  and attaches it to a PG object.
  *if the line is found, return the line as part of cURL request.
  *if the line is not found, halt with 413 error.

Run time with varying file sizes:
  If the file is sufficiently small, run time is minimal. The server only needs 
  to compile the database once.

  If the file is sufficiently large, run time will increase, but not at a drastic 
  level. There are only two points of running through the file lines, once to
  read to ARGF, once to INSERT into the database.

Sustainability with multiple users:
  Puma (server I used) is very fast and supports concurrency, allowing for 
  multiple simultaneous inputs.
  I am not sure how the system will perform with 1,000,000 users.

Resources:
https://github.com/sklise/sinatra-api-example/blob/master/app.rb
  sinatra api example

http://www.andrewhavens.com/posts/20/beginners-guide-to-creating-a-rest-api/
  Beginners guide to creating a REST API

https://www.gnu.org/software/bash/manual/bashref.html#What-is-Bash_003f
  Bash documentation

http://tldp.org/LDP/abs/html/internalvariables.html
  Explained what IFS is

http://ss64.com/bash/read.html
  maybe a better documentation

http://blog.flatironschool.com/a-short-explanation-of-argv/
  ARGV

https://superuser.com/questions/272265/getting-curl-to-output-http-status-code
  For outputting HTTP status codes

http://curl.haxx.se/docs/manpage.html
  Curl Docs

http://ruby-doc.org/core-1.9.3/ARGF.html
  ARGF docs

http://myronmars.to/n/dev-blog/2012/01/why-sinatras-halt-is-awesome
  Custom sinatra errors

  Some of this I didn't end up using, but almost all of the resources I did use 
  are here. There were a few Stack Overflow threads I used that I forgot to 
  get the url of.

Tools used:
  PostgreSQL - I am most comfortable with this databse
  Ruby - Again, language of choice
  Sinatra - I wanted to use sinatra because I haven't used it since I started
    Rails, and it seemed like a small enough project that I could get my hands dirty with it.
  Pry - debugging
  Curl - I've never used it before so that was fun messing around with it.
  Bash - Same as curl, but was much easier to figure out.

Time Spent:
  Actual time programming: 3 hours
  Time debugging: 5 hours

If I had unlimited time: 
  I would write out a full blown API using knowledge gleaned from all the API 
  tutorials I could get my hands on. I would make authentication a first priority because its currently usable by anyone.

Critques:
  I wish I knew more about bash scripts and cURL before I had started this. 
  It would have saved me a lot of headache if I had known what directions I could
  have gone in and what would lead me down the rabbit hole.

  Rails would have made organization a lot easier, but I wanted to use Sinatra.

  I want to say that I could have passed the ARGF straight into the [insert_lines]
  function. Would have saved reading the lines into an array.