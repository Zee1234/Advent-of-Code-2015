let input = 'yzbqklnj'

import * as md5 from 'md5'

let hash = ''

let i = 0
while (hash.slice(0,5) !== '00000') {
  i++
  hash = md5(input+i)
}

console.log(i, hash)