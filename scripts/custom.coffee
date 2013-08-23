
greetings = ['oi', 'olá', 'oiii']
adjectives = ['lindo', 'gato', 'gatinho', 'playboy', 'arrombado', 'delícia']

module.exports = (robot) ->
  robot.hear /\boi$/i, (msg) ->
    msg.send getRandomGreeting() + ', ' + getRandomAdjective()

  robot.hear /\bachei\b/i, (msg) ->
    msg.send "achou errado, " + getRandomAdjective()

  robot.hear /\bpensei\b/i, (msg) ->
    msg.send "pensou errado, " + getRandomAdjective()

  robot.hear /\bpensando\b/i, (msg) ->
    msg.send "pensando errado, " + getRandomAdjective()

  robot.hear /https?.*/i, (msg) ->
    msg.send "graaaaaaças a deus, mandaram um link!"

  robot.hear /\bfacebook\b/i, (msg) ->
    msg.send "me add no feice, " + getRandomAdjective() + " https://www.facebook.com/ediordiychuk"

getRandomAdjective = ->
  adjectives[parseInt(Math.random() * adjectives.length, 10)]

getRandomGreeting = ->
  greetings[parseInt(Math.random() * greetings.length, 10)]
