'use strict';

/**
 * TODO: ...
 * 
 * @param {*} param
 * @returns any[]
 */
class test {

  constructor(param) {

    this.param = param;

    this.method1 = () => { };
    const CONST = "yooo";
    var empty = null;
    let number = 0;

    /* TODO: ... @param yo @returns void */
    function method2(param) {
      console.log(`${this.yoo} some texting ${param.yoo}`);
    }

    method1();
    method2();

    // Testing themes.
    return [empty, CONST, number, param];
  }
}

function hello() {
  var a = "function";
  for (var i = 0; i < 5; i++) {
    (function () {
      var a = "block";
    })();
  }
  console.log(a);
}
hello();

setTimeout(() => {
  console.log("setTimeout called!")
}, 1000);

setTimeout(() => console.log("setTimeout called!"), 1000);

let add = (a, b) => a + b;
console.log(add(1, 2));

let obj = {
  name: "Asim",
  sayLater: function () {
    setTimeout(() => console.log(`${this.name}`), 1000)
  }
};
obj.sayLater();

// Object Destructuring
const obj1 = { first: 'Asim', last: 'Hussain', age: 39 };

function getObj() {
  return obj1;
}

const { first, last } = getObj();

console.log(first);
console.log(last);

// Array Destructuring
const arr = ['a', 'b'];
const [x, y] = arr;
console.log(x);
console.log(y);

// Function Parameter Destructuring
function func({ x = 1 }) {
  console.log(x);
}
func({});

let array = [10, 20, 30];

console.log('for-of');
for (let index in array) {
  console.log(typeof (index));
}

console.log('for-in');
for (let value of array) {
  console.log(value);
}

// Map
let map = new Map();
map.set("A", 1);
map.set("B", 2);
map.set("C", 3);

let map2 = new Map()
  .set("A", 1)
  .set("B", 2)
  .set("C", 3);

let map3 = new Map([
  ["A", 1],
  ["B", 2],
  ["C", 3]
]);

for (let [key, value] of map) {
  console.log(key, value);
}

console.log(map.get("A"));
console.log(map.has("A"));
console.log(map.size);

map.delete("A");
console.log(map.size);

map.clear();
console.log(map.size);

'use strict';

// Set
let set = new Set();
set.add('APPLE');
set.add('ORANGE');
set.add('MANGO');


let set2 = new Set()
  .add('APPLE')
  .add('ORANGE')
  .add('MANGO');

let set3 = new Set(['APPLE', 'ORANGE', 'MANGO']);

console.log(set.has('APPLE'));

set.delete('APPLE');

console.log(set.size);

set.clear();
console.log(set.size);


let set4 = new Set();
set3.add('Moo');
console.log(set3.size);
// 1
set4.add('Moo');
console.log(set4.size);
// 1

for (let entry of set2) {
  console.log(entry);
}

// Via callbacks
/*
 function doAsyncTask(cb) {
 setTimeout(() => {
 console.log("Async Task Calling Callback");
 cb();
 }, 1000);
 }
 doAsyncTask(() => console.log("Callback Called"));
 */

// Via Promise
let error = false;
function doAsyncTask() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (error) {
        reject('error');
      } else {
        resolve('done');
      }
    }, 1000);
  });
}

doAsyncTask().then(
  (val) => console.log(val),
  (err) => console.error(err)
);

// Immediately Resolved Promise
let promise = Promise.resolve('done');
promise.then((val) => console.log(val)); // 'done'

// Handling Errors
Promise.resolve('done')
  .then((val) => { throw new Error("fail") })
  .then((val) => console.log(val))
  .catch((err) => console.error(err));