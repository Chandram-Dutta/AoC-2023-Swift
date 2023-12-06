//
//  File.swift
//
//
//  Created by Chandram Dutta on 05/12/23.
//

import Foundation

struct Day05: AdventDay {

  var data: String

  func part1() -> Any {
    let lines = data.split(whereSeparator: \.isNewline)
    let seeds = lines[0].split(separator: ":")[1].split(whereSeparator: \.isWhitespace)
      .compactMap {
        Int($0)
      }

    let seed_to_soil = transform(
      map: lines,
      range: (lines.firstIndex(of: "seed-to-soil map:")! + 1)...(lines.firstIndex(
        of: "soil-to-fertilizer map:")! - 1))
    let soil_to_fertilisers = transform(
      map: lines,
      range: (lines.firstIndex(of: "soil-to-fertilizer map:")! + 1)...(lines.firstIndex(
        of: "fertilizer-to-water map:")! - 1))
    let fertilizers_to_water = transform(
      map: lines,
      range: (lines.firstIndex(of: "fertilizer-to-water map:")! + 1)...(lines.firstIndex(
        of: "water-to-light map:")! - 1))
    let water_to_light = transform(
      map: lines,
      range: (lines.firstIndex(of: "water-to-light map:")! + 1)...(lines.firstIndex(
        of: "light-to-temperature map:")! - 1))
    let light_to_temperature = transform(
      map: lines,
      range: (lines.firstIndex(of: "light-to-temperature map:")! + 1)...(lines.firstIndex(
        of: "temperature-to-humidity map:")! - 1))
    let temperature_to_humidity = transform(
      map: lines,
      range: (lines.firstIndex(of: "temperature-to-humidity map:")! + 1)...(lines.firstIndex(
        of: "humidity-to-location map:")! - 1))
    var humidity_to_location = [[Int]]()

    for line in lines[(lines.firstIndex(of: "humidity-to-location map:")! + 1)...] {
      humidity_to_location.append(
        line.split(whereSeparator: \.isWhitespace).compactMap {
          Int($0)
        })
    }

    var locations = [Int]()

    for seed in seeds {
      let soil = mapping(i: seed, r: seed_to_soil)
      let fertilizer = mapping(i: soil, r: soil_to_fertilisers)
      let water = mapping(i: fertilizer, r: fertilizers_to_water)
      let light = mapping(i: water, r: water_to_light)
      let tempertature = mapping(i: light, r: light_to_temperature)
      let humidity = mapping(i: tempertature, r: temperature_to_humidity)
      let location = mapping(i: humidity, r: humidity_to_location)
      locations.append(location)

    }

    return locations.min()!
  }

  func part2() -> Any {
    let lines = data.split(whereSeparator: \.isNewline)
    let seed_ranges = lines[0].split(separator: ":")[1].split(whereSeparator: \.isWhitespace)
      .compactMap {
        Int($0)
      }

    let seed_to_soil = transform(
      map: lines,
      range: (lines.firstIndex(of: "seed-to-soil map:")! + 1)...(lines.firstIndex(
        of: "soil-to-fertilizer map:")! - 1))
    let soil_to_fertilisers = transform(
      map: lines,
      range: (lines.firstIndex(of: "soil-to-fertilizer map:")! + 1)...(lines.firstIndex(
        of: "fertilizer-to-water map:")! - 1))
    let fertilizers_to_water = transform(
      map: lines,
      range: (lines.firstIndex(of: "fertilizer-to-water map:")! + 1)...(lines.firstIndex(
        of: "water-to-light map:")! - 1))
    let water_to_light = transform(
      map: lines,
      range: (lines.firstIndex(of: "water-to-light map:")! + 1)...(lines.firstIndex(
        of: "light-to-temperature map:")! - 1))
    let light_to_temperature = transform(
      map: lines,
      range: (lines.firstIndex(of: "light-to-temperature map:")! + 1)...(lines.firstIndex(
        of: "temperature-to-humidity map:")! - 1))
    let temperature_to_humidity = transform(
      map: lines,
      range: (lines.firstIndex(of: "temperature-to-humidity map:")! + 1)...(lines.firstIndex(
        of: "humidity-to-location map:")! - 1))
    var humidity_to_location = [[Int]]()

    for line in lines[(lines.firstIndex(of: "humidity-to-location map:")! + 1)...] {
      humidity_to_location.append(
        line.split(whereSeparator: \.isWhitespace).compactMap {
          Int($0)
        })
    }

    var locations = [Int]()
    var counter = 0
    while counter < seed_ranges.count {
      let seed_start = seed_ranges[counter]
      let range = seed_ranges[counter + 1]
      for i in 0..<range {
        let seed = seed_start + i
        let soil = mapping(i: seed, r: seed_to_soil)
        let fertilizer = mapping(i: soil, r: soil_to_fertilisers)
        let water = mapping(i: fertilizer, r: fertilizers_to_water)
        let light = mapping(i: water, r: water_to_light)
        let tempertature = mapping(i: light, r: light_to_temperature)
        let humidity = mapping(i: tempertature, r: temperature_to_humidity)
        let location = mapping(i: humidity, r: humidity_to_location)
        locations.append(location)
      }
      counter += 2
    }

    return locations.min()!
  }
}

func transform(map: [String.SubSequence], range: ClosedRange<Int>) -> [[Int]] {
  var ans = [[Int]]()
  for line in map[range] {
    ans.append(
      line.split(whereSeparator: \.isWhitespace).compactMap {
        Int($0)
      })
  }
  return ans
}

func mapping(i: Int, r: [[Int]]) -> Int {
  var ans = 0
  for ranges in r {
    if (ranges[1]..<(ranges[1] + ranges[2])).contains(i) {
      ans = ranges[0] + (i - ranges[1])
      return ans
    }
  }
  ans = i
  return ans
}
