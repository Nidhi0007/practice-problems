// Question 1: Maximum Subarray Sum Write a function that takes an array of integers as input and returns the maximum sum of a subarray within the array. The subarray must consist of consecutive elements from the original array.

// const arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]; //input
// console.log(maxSubarraySum(arr)); // Output: 6



function maxSubarraySum(arr) {
    var maxSum = arr[0]
    var temp = []
    for (let i = 0; i <= arr.length - 1; i++) {
        maxSum = maxSum + arr[i]

        if (
            maxSum > temp[i]
        ) {
            temp.push(arr[i])
        } else {
            temp = []
        }
    }
    let sum = 0
    for (let j = 0; j <= temp.length - 1; j++) {
        sum = sum + temp[j]
    }
    return sum
}
let arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
console.log(maxSubarraySum(arr))


// Question 3: Word Break Problem Write a function that takes a string and a dictionary of words as input. The function should determine if the string can be segmented into a space-separated sequence of one or more dictionary words.
// const s = "leetcode"; const wordDict = ["leet", "code"]; console.log(wordBreak(s, wordDict)); // Output: true

// const s = "leetcode"; const wordDict = ["leet", "code"];
// function wordBreak(s, wordDict) {
//     let word = s.split("")
//     let w = ""
//     for (let i = 0; i <= word.length - 1; i++) {
//         w = w + word[i]
//         if (wordDict.includes(w)) {
//             return true
//         }

//     }
//     return false
// }
// console.log(wordBreak(s,wordDict))


