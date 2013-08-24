
greetings = ['oi', 'olá', 'oiii']
adjectives = ['lindo', 'gato', 'gatinho', 'playboy', 'arrombado', 'delícia', 'picareta']

module.exports = (robot) ->
  robot.hear /\boi$/i, (msg) ->
    msg.send msg.random(greetings) + ', ' + msg.random(adjectives)

  robot.hear /\bachei\b/i, (msg) ->
    msg.send "achou errado, " + msg.random(adjectives)

  robot.hear /\bpensei\b/i, (msg) ->
    msg.send "pensou errado, " + msg.random(adjectives)

  robot.hear /\bpensando\b/i, (msg) ->
    msg.send "pensando errado, " + msg.random(adjectives)

  robot.hear /https?.*/i, (msg) ->
    msg.send "graaaaaaças a deus, mandaram um link!"

  robot.hear /\bfacebook\b/i, (msg) ->
    msg.send "me add no feice, " + msg.random(adjectives) + " https://www.facebook.com/ediordiychuk"

