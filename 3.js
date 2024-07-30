const generateSequence = (n) => {
    let result = [1, 1];
    
    while (result[result.length - 1] < n) {
        let nextValue = result[result.length - 1] + result[result.length - 2];
        result.push(nextValue);
    }
    
    if (result[result.length - 1] > n) {
        result.pop();
    }
    
    console.log(result.join(' '));
}

generateSequence(3);  // Output: 1 1 2 3
generateSequence(5);  // Output: 1 1 2 3 5
generateSequence(12); // Output: 1 1 2 3 5 8
generateSequence(25); // Output: 1 1 2 3 5 8 13 21
