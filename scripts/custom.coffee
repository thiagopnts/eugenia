
greetings = ['oi', 'olá', 'oiii']
adjectives = ['lindo', 'gato', 'gatinho', 'playboy', 'arrombado', 'delícia', 'picareta']
enterReplies = ['Seja bem vindo', 'Bem vindo', 'Olha só quem chegou... esse é']

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
    msg.send "me add no feice, " + msg.random(adjectives) + " https://www.facebook.com/ediordiychuk" if (Math.random() * 5) > 4.2

  robot.enter (msg) ->
    msg.send "#{msg.random enterReplies} #{msg.random adjectives}"
    msg.send "kkkkk" if (Math.random() * 5) > 4.2

