import { strict } from "assert";

const pascal = (column, row) => {
  if (column === row) return 1;
  if (column === 1) return 1;
  return pascal(column - 1, row - 1) + pascal(column, row - 1);
};

strict.equal(pascal(3, 5), 6);
