import List from './load'

let sides = List.map( ([l, w, h]) => [l*w, l*h, w*h].sort( (a,b) => a-b ) )
let sqft = sides.reduce( (acc, [s, m, l]) => {
  return acc+3*s+2*m+2*l
}, 0)
console.log(sqft)