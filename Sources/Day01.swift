struct Day01: AdventDay{
	var data: String
	
	var entities1: [[Int]] {
		data.split(separator: "\n").map {
			$0.compactMap {
				Int("\($0)")
			}
		}
	}
	
	let strToNum = [
		"one": 1,
		"two": 2,
		"three": 3,
		"four": 4,
		"five": 5,
		"six": 6,
		"seven": 7,
		"eight": 8,
		"nine": 9
	]
	
	var entities2: [[Int]] {
		 data.split(separator: "\n").map {
			var num: [Int] = []
			for i in 0..<($0.count) {
				for j in i..<($0.count) {
					let seq = String(Array($0)[i...j])
					if Int(seq) != nil {
						num.append(Int(seq)!)
						break
					}
					if strToNum[seq] != nil {
						num.append(strToNum[seq]!)
						break
					}
				}
			}
			return num
		}
	}
	
	func part1() -> Any {
		var sum = 0
		for number in entities1 {
			let num = 10*(number.first!) + number.last!
			sum += num
		}
		return sum
	}
	
	func part2() -> Any {
		var sum = 0
		for number in entities2 {
			let num = 10*(number.first!) + number.last!
			sum += num
		}
		return sum
	}
}
