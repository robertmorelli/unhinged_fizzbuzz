const mult = 20;
const n = 100;
const diff = 4;

let t = 0;
const ar = [];

function count() {
    setTimeout(count, 1 * mult);
    ar.push(t++);
}

function fizz() {
    setTimeout(fizz, 3 * mult);
    ar.pop();
    ar.push("fizz");
}

function buzz() {
    setTimeout(buzz, 5 * mult);
    ar.pop();
    ar.push("buzz");
}

function fizzbuzz() {
    setTimeout(fizzbuzz, 15 * mult);
    ar.pop();
    ar.push("fizzbuzz");
}

setTimeout(() => {
    console.log(ar.slice(1).join("\n"));
    delete ar
}, n * mult);

count();
setTimeout(fizz, 3 * mult + diff);
setTimeout(buzz, 5 * mult + diff * 2);
setTimeout(fizzbuzz, 15 * mult + diff * 3);
