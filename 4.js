const  generatePattern = (n) =>{
    for (let i = 1; i <= n; i++) {
        console.log('*'.repeat(2 * i - 1));
    }
}

// Test cases
generatePattern(3);
// Output:
// *
// ***
// *****

generatePattern(4);
// Output:
// *
// ***
// *****
// *******
