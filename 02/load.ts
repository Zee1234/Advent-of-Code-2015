import * as fs from 'fs'

let text = fs.readFileSync('input.txt', 'utf8')

let hi

let step1 = text.split('\n')
let step2 = step1.filter( v => v)
let step3 = step2.map( v => v.split('x').map( v => parseInt(v) ) )

export default step3