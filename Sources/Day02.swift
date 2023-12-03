//
//  Day02.swift
//
//
//  Created by Chandram Dutta on 03/12/23.
//

import Foundation

struct Day02: AdventDay {

  var data: String

  func part1() -> Any {
    let red = 12
    let green = 13
    let blue = 14

    var ans = 0
    var wrong = 0
    for line in data.split(whereSeparator: \.isNewline) {
      let comp1 = (line).components(separatedBy: ":")
      let game = Int(comp1[0].components(separatedBy: " ")[1])!
      ans += game
      let sets = comp1[1].trimmingCharacters(in: .whitespaces).components(separatedBy: "; ")
      for set in sets {
        if set.sets_to_dict["red"]! > red || set.sets_to_dict["green"]! > green
          || set.sets_to_dict["blue"]! > blue
        {
          wrong += game
          break
        }
      }
    }
    return ans - wrong
  }

  func part2() -> Any {
    var sum = 0

    for line in data.split(whereSeparator: \.isNewline) {
      let comp1 = (line).components(separatedBy: ":")
      let sets = comp1[1].trimmingCharacters(in: .whitespaces).components(separatedBy: "; ")
      var red: Set<Int> = []
      var green: Set<Int> = []
      var blue: Set<Int> = []
      for set in sets {
        red.insert(set.sets_to_dict["red"]!)
        green.insert(set.sets_to_dict["green"]!)
        blue.insert(set.sets_to_dict["blue"]!)
      }
      let red_max = red.max()!
      let green_max = green.max()!
      let blue_max = blue.max()!
      let power = red_max * blue_max * green_max
      sum += power
    }
    return sum
  }
}

extension String {
  var sets_to_dict: [String: Int] {
    var ans = [
      "red": 0,
      "green": 0,
      "blue": 0,
    ]
    let set = self.components(separatedBy: ", ")
    for cubes in set {
      let color = cubes.components(separatedBy: " ")[1]
      let cube = Int(cubes.components(separatedBy: " ")[0])!
      ans[color]? += cube
    }
    return ans
  }
}
