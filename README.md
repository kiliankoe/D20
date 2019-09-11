<h1>D20
<img src="https://user-images.githubusercontent.com/2625584/64739158-95fb6c00-d4f1-11e9-886d-e43e9d4d21a0.png" align="right" width="128" />
</h1>

Need to evaluate [dice notation](https://en.wikipedia.org/wiki/Dice_notation) in Swift? This package is for you.



### Examples

```swift
let roll = Roll("1d20").roll()
roll.result
// $R0: Int = 18

let roll = Roll("3d8+1d6").roll()
roll.result
// $R0: Int = 19
roll.expression
// $R1: String = "1+6+7+5"

D(20).average
// $R0: Double = 10.5
```

The rest of the API is pretty self-explanatory. `D`ice and `Roll`s have attributes for accessing the max, half and average values of their rolls. Use the `roll()` function to actually throw the dice on both of these types and get some random values. 

That's pretty much it, cheers 🍻



#### Logo Credits

[D20](https://thenounproject.com/search/?q=d20&i=2453700) by Lonnie Tapscott from the Noun Project

