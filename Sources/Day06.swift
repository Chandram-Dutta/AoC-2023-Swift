//
//  File.swift
//
//
//  Created by Chandram Dutta on 06/12/23.
//

import Foundation

struct Day06: AdventDay {
  var data: String

  func part1() -> Any {
    let lines = data.split(whereSeparator: \.isNewline)
    let times = lines[0].split(separator: ":")[1].split(whereSeparator: \.isWhitespace).compactMap {
      Int($0)
    }
    let distances = lines[1].split(separator: ":")[1].split(whereSeparator: \.isWhitespace)
      .compactMap {
        Int($0)
      }

    var num = 1

    for round in 0..<times.count {
      var score = 0
      for t in 0...times[round] {
        let speed = t
        let time_remaining = times[round] - t
        let distance = speed * time_remaining
        if distance > distances[round] {
          score += 1
        }
      }
      num *= score
    }

    return num
  }

  func part2() -> Any {
    let lines = data.split(whereSeparator: \.isNewline)
    let times = Int(
      lines[0].split(separator: ":")[1].split(whereSeparator: \.isWhitespace).joined())!
    let distances = Int(
      lines[1].split(separator: ":")[1].split(whereSeparator: \.isWhitespace).joined())!

    var num = 0
    for t in 0...times {
      let speed = t
      let time_remaining = times - t
      let distance = speed * time_remaining
      if distance > distances {
        num += 1
      }
    }

    return num
  }
}
