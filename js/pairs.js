let nums1 = [4, 5, 6, 7, 0, 1];
let nums2 = [3, 9, 10, 11, 12, 19];
let k = 13;

function findPairs(nums1, nums2, k) {
    let set = new Set(nums1);
    let result = [];

    for (let num of nums2) {
        let complement = k - num;
        if (set.has(complement)) {
            result.push([complement, num]);
        }
    }

    return result;
}

console.log(findPairs(nums1, nums2, k));
