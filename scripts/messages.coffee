# Description:
#   Basic scripts that listen for a prompt and return an associated static message

request = require('request')

getRandomInt = (min, max) ->
  min = Math.ceil(min);
  max = Math.floor(max);
  Math.floor(Math.random() * (max - min)) + min;


module.exports = (robot) ->

  robot.respond /universe/gim, (res) ->
    res.send "> GitHub is great, and Training Day is greater!!"

  robot.respond /tgallant/gim, (res) ->
    res.send " > That person is awesome"

  robot.respond /fruit/gim, (res) ->
    res.send " > My favorites are apples and grapes."

  robot.respond /movie/gim, (res) ->
    res.send " > My favorite movie is The Wizard of Oz"

  robot.respond /lunch/gim, (res) ->
    res.send " > I want a peanut butter and jelly sandwich for lunch today."
    
  robot.respond /music/gim, (res) ->
    res.send "https://www.youtube.com/watch?v=TBp6wDoxW8I"

  robot.respond /quote/gim, (res) ->
    random = getRandomInt(1, 100000)
    url = "https://api.forismatic.com/api/1.0/?method=getQuote&format=json&key=#{ random }&lang=en"
    
    request url, { json: true }, (err, req, quote) ->
      res.send "#{ quote.quoteText } --   #{ quote.quoteAuthor }"