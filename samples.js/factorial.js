"use strict";
const factorial = (n) => (n === 1 ? 1 : n * factorial(n - 1));

const createFactorialIterator = (start, end) => ({
  [Symbol.iterator]: function () {
    let current = start;
    let value = undefined;
    const factorial = (n) => (n === 1 ? 1 : n * factorial(n - 1));

    return {
      next() {
        if (current > end) return { done: true };
        else if (value) value *= current;
        else value = factorial(current);
        current += 1;
        return {
          done: false,
          value,
        };
      },
    };
  },
});

console.log("factorial iterator created by function");
for (const fact of createFactorialIterator(5, 6)) {
  console.log(fact);
}

class FactorialIterable {
  constructor(start, end) {
    this.#current = start;
    this.#end = end;
  }

  #current = 0;
  #end = 0;
  #value = undefined;

  next() {
    if (this.#current > this.#end) return { done: true };
    else if (this.#value) this.#value *= this.#current;
    else this.#value = this.factorial(this.#current);
    this.#current += 1;
    return {
      done: false,
      value: this.#value,
    };
  }

  factorial(n) {
    return n === 1 ? 1 : n * factorial(n - 1);
  }

  [Symbol.iterator]() {
    return this;
  }
}

console.log("factorial iterator created by function");
for (const fact of new FactorialIterable(5, 6)) {
  console.log(fact);
}

const createFactorialGenerator = (start, end) => ({
  [Symbol.iterator]: function* () {
    const factorial = (n) => (n === 1 ? 1 : n * factorial(n - 1));
    let value = undefined;
    for (let current = start; current <= end; current++) {
      value = value ? value * current : factorial(current);
      yield value;
    }
    return { done: true };
  },
});

console.log("factorial generator created by function");
for (const fact of createFactorialGenerator(5, 6)) {
  console.log(fact);
}
