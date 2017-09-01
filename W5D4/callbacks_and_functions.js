window.setTimeout(function(){
  alert('Hammertime');
  5000;
});

function hammerTime (time) {
  window.setTimeout(function(){
    alert(`${time} is hammertime!`);
    5000;
  }
);
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like some tea?', function (res) {
    console.log(`You replied ${res}.`);
    reader.question('Would you like some biscuits?'), function (res2) {
      console.log(`You replied: ${res2}.`);
      const firstRes = (res == 'yes') ? 'do' : 'dont';
      const secondRes = (res2 == 'yes') ? 'do' : 'dont';
      console.log(`You ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    })
  })
};

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);

Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);
