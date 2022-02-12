import { strict } from "assert";

const even = (n) => n % 2 === 0;
const square = (n) => n * n;
const exptIter = (b, n, a) => {
  if (n === 0) return a;
  if (n === 1) return a === 1 ? b : a;
  return even(n)
    ? exptIter(b, n / 2, a * square(b))
    : exptIter(b, n - 1, a * b);
};

const fastExpt = (b, n) => exptIter(b, n, 1);

strict.equal(fastExpt(2, 2), 4);
strict.equal(fastExpt(2, 4), 16);
strict.equal(fastExpt(3, 5), 243);
