const fs = require('fs');

// Read input file
const instructions = fs.readFileSync('../day-01/input.txt', 'utf8').trim();

let floor = 0;
for (let i = 0; i < instructions.length; i++) {
  if (instructions[i] === '(') {
    floor++;
  } else if (instructions[i] === ')') {
    floor--;
  }
}

console.log(`Santa ended up on floor ${floor}.`);
