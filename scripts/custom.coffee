
greetings = ['oi', 'oi lindo', 'oi gato', 'olá', 'oe']

module.exports = (robot) ->
  robot.hear /\boi$/i, (msg) ->
    msg.send greetings[parseInt(Math.random() * greetings.length, 10)]

  robot.hear /\bachei\b/i, (msg) ->
    msg.send "achou ERRADO"

  robot.hear /\bpensei\b/i, (msg) ->
    msg.send "pensou ERRADO"



