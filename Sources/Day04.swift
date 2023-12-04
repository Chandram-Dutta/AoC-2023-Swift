//
//  Day04.swift
//
//
//  Created by Chandram Dutta on 04/12/23.
//

import Foundation

struct Day04: AdventDay {

  var data: String

  func part1() -> Any {
    var ans = 0
    for lines in data.split(whereSeparator: \.isNewline) {
      let sets = lines.split(separator: ":")[1].split(separator: "|")
      let wins = sets[0].trimmingCharacters(in: .whitespaces).split(whereSeparator: \.isWhitespace)
        .compactMap { num in
          return Int(num)
        }
      let nums = sets[1].trimmingCharacters(in: .whitespaces).split(whereSeparator: \.isWhitespace)
        .compactMap { num in
          return Int(num)
        }
      var win = 0
      for w in wins {
        for n in nums {
          if w == n {
            if win == 0 {
              win += 1
            } else {
              win = win * 2
            }
          }
        }
      }
      ans += win
    }
    return ans
  }

  func part2() -> Any {
    var ans = [Int: [Int]]()
    var copies = [Int: Int]()
    var sum = 0
    for lines in data.split(whereSeparator: \.isNewline) {
      let sets = lines.split(separator: ":")[1].split(separator: "|")
      let cardNo = lines.split(separator: ":")[0].split(whereSeparator: \.isWhitespace).compactMap {
        num in
        return Int(num)
      }.first!
      let wins = sets[0].trimmingCharacters(in: .whitespaces).split(whereSeparator: \.isWhitespace)
        .compactMap { num in
          return Int(num)
        }
      let nums = sets[1].trimmingCharacters(in: .whitespaces).split(whereSeparator: \.isWhitespace)
        .compactMap { num in
          return Int(num)
        }
      ans[cardNo] = [Int]()
      var win = cardNo
      for w in wins {
        for n in nums {
          if w == n {
            win += 1
            ans[cardNo]?.append(win)
          }
        }
      }
      for c in ans[cardNo]! {
        if copies[c] == nil {
          copies[c] = 1
        } else {
          copies[c]! += 1
        }
      }
      if copies[cardNo] != nil {
        for _ in 1...copies[cardNo]! {
          for s in ans[cardNo]! {
            if copies[s] == nil {
              copies[s] = 1
            } else {
              copies[s]! += 1
            }
          }
        }
      }
    }
    for k in copies {
      sum += k.value
    }
    for _ in ans.keys {
      sum += 1
    }
    return sum
  }
}
