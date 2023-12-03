//
//  Day01.swift
//
//
//  Created by Chandram Dutta on 03/12/23.
//

import Foundation

struct Day01: AdventDay {

  var data: String

  func part1() -> Any {
    var sum = 0
    for line in data.split(whereSeparator: \.isNewline) {
      if let numbers = Int(
        line.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
      {
        let digits = numbers.digits
        sum += ((digits.first! * 10) + digits.last!)
      }
    }
    return sum
  }

  func part2() -> Any {
    var sum = 0
    for line in data.split(whereSeparator: \.isNewline) {
      let numbers = line.to_digits
      sum += (numbers.first! * 10) + numbers.last!
    }
    return sum
  }
}

extension BinaryInteger {
  var digits: [Int] {
    return String(describing: self).compactMap { Int(String($0)) }
  }
}

extension String {
  var to_number: Int? {
    return switch self {
    case "nine", "9": 9
    case "eight", "8": 8
    case "seven", "7": 7
    case "six", "6": 6
    case "five", "5": 5
    case "four", "4": 4
    case "three", "3": 3
    case "two", "2": 2
    case "one", "1": 1
    default: nil
    }
  }
}

extension String.SubSequence {
  var to_digits: [Int] {
    var ans: [Int] = []
    let arr = Array(self)
    for i in 0..<arr.count {
      for w in i...arr.count {
        if String(arr[i..<w]).to_number != nil {
          ans.append(String(arr[i..<w]).to_number!)
        }
      }
    }
    return ans
  }
}
