module.exports = {
    //param A : array of integers
    //return an integer
    repeatedNumber: function (A) {
        var counts = {},
            numFound;

        A.forEach(function (num) {
            if (counts[num]) {
                numFound = num;
            } else {
                counts[num] = true;
            }
        });

        return numFound;
    }
};