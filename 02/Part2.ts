import List from './load'

let vals = List.map ( ([a, b, c]) => [2*a+2*b, 2*a+2*c, 2*b+2*c].sort( (a,b) => a-b))
let length = vals.reduce( (acc, [s, a, b], i) => acc+s+List[i][0]*List[i][1]*List[i][2] , 0)
console.log(length)