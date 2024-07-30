function formatNumber(number, totalLength) {
    let str = number.toString();
    while (str.length < totalLength) {
        str = '0' + str;
    }
    return str;
}

// Test cases
console.log(formatNumber(5, 4));   // Output: 0005
console.log(formatNumber(87, 7));  // Output: 0000087
