if(!String.prototype.format) {
  String.prototype.format = function() {
    var params = arguments
    return this.replace(/{(\d+)}/g, function(match, number) {
      if((typeof params[number]) != 'undefined')
        return params[number];
      return match
    });
  }
}


var replies    = ["Oi {0}, prazer em conhece-lo ;)", "{0} prazer :**"],
    badReplies = ["Se toca cara, te conheço?", "Sai fora.", "Não conheço nem você, imagina esse outro mané."],
    yes        = ['yeeees', 'sim', 'yep'],
    no         = ['nop', 'nope', 'não', 'nam'];

module.exports = function(robot) {

  robot.isFriend = function(name) {
    var user = robot.brain.userForName(name);
    return user && user.friend;
  }

  robot.respond(/(\w+) é amigo nosso$/, function(msg) {
    var nick   = msg.match[1],
        sender = robot.brain.userForName(msg.envelope.user.name);
    
    if(sender.friend) {
      user = robot.brain.userForName(nick);
      user.friend = true;
      msg.reply(msg.random(replies).format(nick));
    } else {
      msg.reply(msg.random(badReplies));
    }
  });

  robot.respond(/(\w+) não é( mais)? nosso amigo$/, function(msg) {
    var user = robot.brain.userForName(msg.match[1]),
        sender = robot.brain.userForName(msg.envelope.user.name);
    if(sender.friend && !user.admin) {
      user.friend = false;
      msg.reply("Eu nunca gostei dele também");
    } else if(!sender.friend && user.friend) {
      msg.reply("seu cu, ele é meu amigo sim!");
      msg.reply("eu <3 {0}".format(user.name));
    } else {
      msg.reply("Desculpa não falo com estranhos");
    }

  });

  robot.respond(/(\w+) é (nosso|amigo) (amigo|nosso)\?$/, function(msg) {
    var user = robot.brain.userForName(msg.match[1]),
        sender = robot.brain.userForName(msg.envelope.user.name);
    if(user.friend) {
      msg.reply(msg.random(yes));
    } else {
      msg.reply(msg.random(no));
    }
  });

  robot.respond(/olá katie/, function(msg) {
    robot.brain.userForName('thiago').friend = true;
    robot.brain.userForName('thiago').admin = true;
  });
}
