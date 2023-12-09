//
//  File.swift
//
//
//  Created by Chandram Dutta on 07/12/23.
//

import Foundation

struct Day07: AdventDay {
  var data: String

  func part1() -> Any {
    let lines = data.split(whereSeparator: \.isNewline)
    var game = [String: Int]()
    var hands = lines.map { data in
      let tmp = data.split(whereSeparator: \.isWhitespace)
      game[String(tmp[0])] = Int(tmp[1])!
      return String(tmp[0])
    }
    hands = hands.bubble_sort
    var res = 0
    for i in 1...hands.count {
      res += (game[hands[i - 1]]! * i)
    }
    return res
  }

  func part2() -> Any {
    let lines = data.split(whereSeparator: \.isNewline)
    var game = [String: Int]()
    var hands = lines.map { data in
      let tmp = data.split(whereSeparator: \.isWhitespace)
      game[String(tmp[0])] = Int(tmp[1])!
      return String(tmp[0])
    }
    hands = hands.bubble_sort2
    var res = 0
    for i in 1...hands.count {
      res += (game[hands[i - 1]]! * i)
    }
    return res
  }
}

extension [String] {
  var bubble_sort: [String] {
    var sortedArray = self
    var i = sortedArray.count - 1
    while i != 0 {
      for j in 0..<i {
        if sortedArray[j].type == sortedArray[j + 1].type {
          let s1 = sortedArray[j].map {
            return $0
          }
          let s2 = sortedArray[j + 1].map {
            return $0
          }
          for k in 0..<sortedArray[j].count {
            if s1[k].strength == s2[k].strength {
              continue
            } else if s1[k].strength > s2[k].strength {
              sortedArray.swapAt(j, j + 1)
              break
            } else {
              break
            }
          }
        } else if sortedArray[j].type > sortedArray[j + 1].type {
          sortedArray.swapAt(j, j + 1)
        }
      }
      i -= 1
    }
    return sortedArray
  }

  var bubble_sort2: [String] {
    var sortedArray = self
    var i = sortedArray.count - 1
    while i != 0 {
      for j in 0..<i {
        if sortedArray[j].type2 == sortedArray[j + 1].type2 {
          let s1 = sortedArray[j].map {
            return $0
          }
          let s2 = sortedArray[j + 1].map {
            return $0
          }
          for k in 0..<sortedArray[j].count {
            if s1[k].strength2 == s2[k].strength2 {
              continue
            } else if s1[k].strength2 > s2[k].strength2 {
              sortedArray.swapAt(j, j + 1)
              break
            } else {
              break
            }
          }
        } else if sortedArray[j].type2 > sortedArray[j + 1].type2 {
          sortedArray.swapAt(j, j + 1)
        }
      }
      i -= 1
    }
    return sortedArray
  }
}

extension String {
  var type2: Int {
    var m = [Character: Int]()
    for c in Array(self.replacingOccurrences(of: "J", with: "")) {
      if m[c] == nil {
        m[c] = 1
      } else {
        m[c]! += 1
      }
    }
    let high = m.max { a, b in a.value < b.value }
    var str = self
    if high != nil {
      str = self.replacingOccurrences(
        of: "J", with: String(high!.key), options: .literal, range: nil)
    }
    let hands = Set(str)
    switch hands.count {
    case 1:
      return 6
    case 2:
      var map = [String.Element: Int]()
      for c in Array(str) {
        if map[c] == nil {
          map[c] = 1
        } else {
          map[c]! += 1
        }
      }
      if map.values.contains(1) {
        return 5
      } else {
        return 4
      }
    case 3:
      var map = [String.Element: Int]()
      for c in Array(str) {
        if map[c] == nil {
          map[c] = 1
        } else {
          map[c]! += 1
        }
      }
      if map.values.contains(3) {
        return 3
      } else {
        return 2
      }
    case 4:
      return 1
    case 5:
      return 0
    default:
      print("error in type")
      return 100
    }
  }
  var type: Int {
    let hands = Set(self)
    switch hands.count {
    case 1:
      return 6
    case 2:
      var map = [String.Element: Int]()
      for c in Array(self) {
        if map[c] == nil {
          map[c] = 1
        } else {
          map[c]! += 1
        }
      }
      if map.values.contains(1) {
        return 5
      } else {
        return 4
      }
    case 3:
      var map = [String.Element: Int]()
      for c in Array(self) {
        if map[c] == nil {
          map[c] = 1
        } else {
          map[c]! += 1
        }
      }
      if map.values.contains(3) {
        return 3
      } else {
        return 2
      }
    case 4:
      return 1
    case 5:
      return 0
    default:
      print("error in type")
      return 100
    }
  }
}

extension String.Element {
  var strength: Int {
    switch self {
    case "A":
      return 12
    case "K":
      return 11
    case "Q":
      return 10
    case "J":
      return 9
    case "T":
      return 8
    case "9":
      return 7
    case "8":
      return 6
    case "7":
      return 5
    case "6":
      return 4
    case "5":
      return 3
    case "4":
      return 2
    case "3":
      return 1
    case "2":
      return 0
    default:
      print("error in strength")
      return 100
    }
  }

  var strength2: Int {
    switch self {
    case "A":
      return 12
    case "K":
      return 11
    case "Q":
      return 10
    case "T":
      return 9
    case "9":
      return 8
    case "8":
      return 7
    case "7":
      return 6
    case "6":
      return 5
    case "5":
      return 4
    case "4":
      return 3
    case "3":
      return 2
    case "2":
      return 1
    case "J":
      return 0
    default:
      print("error in strength")
      return 100
    }
  }
}
