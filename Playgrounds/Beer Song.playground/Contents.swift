import UIKit

func beerSong(_ totalBeers: Int) {
    for number in (0...totalBeers).reversed() {
        if number == 0 {
            print("\nNo more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, \(totalBeers) bottles of beer on the wall.")
        } else if number ==  1 {
            print("\n\(number) bottles of beer on the wall, \(number) bottles of beer. Take one down and pass it around, no more bottles of beer on the wall.")
        } else {
            print("\n\(number) bottles of beer on the wall, \(number) bottles of beer. Take one down and pass it around, \(number - 1) bottles of beer on the wall.")
        }
    }
}

beerSong(6)
