
greetings = ['oi', 'olá', 'oiii']
adjectives = ['lindo', 'gato', 'gatinho', 'playboy', 'arrombado', 'delícia', 'picareta']
enterReplies = ['Seja bem vindo', 'Bem vindo', 'Olha só quem chegou... esse é']
badLanguageReplies = ['Nossa que boca suja', 'Calma cara não precisa xingar']
lol = [
  'HAHAHAHHAHAHAHA que bosta',
  'HAUEHAUEHAEHAUEAHE',
  'KKKKKKKKKKKKKKKK',
  'kkkkkkkkkkkkk',
  'rs.',
  'nossa que merda',
  'HUEHUEHUEHUE',
  'HUEHUEHUEBRBRBR'
]

allowed = ['thiago', 'rafaeldx7', 'Ronnie', 'mateus', 'towerz']

module.exports = (robot) ->

  robot.respond /sai do (\#?\#[a-z]*)/i, (msg) =>
    console.log "Saindo de ", msg.match[1]
    msg.send "Seu pedido é uma ordem"
    robot.adapter.bot.part(msg.match[1])

  robot.respond /entra no (\#?#[a-z])/, (msg) =>
    console.log "Entrando em ", msg.match[1]
    msg.send "Seu pedido é uma ordem"
    robot.adapter.bot.join(msg.match[1])

  robot.respond /pode usar tsuru em prod\?/, (msg) =>
    if msg.envelope.user.name in allowed
      msg.send "Abs."

  robot.hear /tsuru/i, (msg) ->
    if msg.envelope.user.name in allowed
      msg.reply("Não, abs.")
    
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

  robot.hear /vsf|vai se fuder?|fuder|tnc|tomar no cu|puta|pqp|cara(i|lho)|merda/i, (msg) ->
    msg.reply "#{msg.random badLanguageReplies}... ;)"

  robot.hear /(kk|h(a|e|i|o|u)(h(a|e|i|o|u)))+/i, (msg) ->
    msg.send msg.random lol

    # robot.enter (msg) ->
    #   msg.send "#{msg.random enterReplies} #{msg.random adjectives}"
    #   msg.send "kkkkk" if (Math.random() * 5) > 4.2
