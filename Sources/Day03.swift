//
//  Day03.swift
//
//
//  Created by Chandram Dutta on 03/12/23.
//

import Foundation

struct Day03: AdventDay {

  var data: String

  func part1() -> Any {
    var sum = 0
    var arr = [[String.Element]]()
    for lines in data.split(whereSeparator: \.isNewline) {
      let line = Array((String(lines)))
      arr.append(line)
    }
    for i in 0..<arr.count {
      for j in 0..<arr[i].count {
        if (arr[i][j].isSymbol || arr[i][j].isMathSymbol || arr[i][j].isPunctuation
          || arr[i][j].isCurrencySymbol) && arr[i][j] != "."
        {
          if arr[i - 1][j] != "." {
            var num = ""
            var k = 0
            var run = true
            while run {
              if j - k >= 0 && arr[i - 1][j - k] != "." {
                num = String(arr[i - 1][j - k]).appending(num)
              } else {
                run.toggle()
              }
              k += 1
            }
            k = 1
            run.toggle()
            while run {
              if j + k <= (arr[i].count) - 1 && arr[i - 1][j + k] != "." {
                num.append(arr[i - 1][j + k])
              } else {
                run.toggle()
              }
              k += 1
            }
            sum += Int(num)!
          } else {
            if arr[i - 1][j - 1] != "." {
              var num = 0
              var k = 1
              var run = true
              while run {
                if j - k >= 0 && arr[i - 1][j - k] != "." {
                  num =
                    num
                    + (Int(String(arr[i - 1][j - k]))! * Int(truncating: pow(10, k - 1) as NSNumber))
                } else {
                  run.toggle()
                }
                k += 1
              }
              sum += num
            }
            if arr[i - 1][j + 1] != "." {
              var num = ""
              var k = 1
              var run = true
              while run {
                if j + k <= (arr[i].count) - 1 && arr[i - 1][j + k] != "." {
                  num.append(String(arr[i - 1][j + k]))
                } else {
                  run.toggle()
                }
                k += 1
              }
              sum += Int(num)!
            }
          }

          if arr[i][j - 1] != "." {
            var num = 0
            var k = 1
            var run = true
            while run {
              if j - k >= 0 && arr[i][j - k] != "." {
                num =
                  num
                  + (Int(String(arr[i][j - k]))! * Int(truncating: pow(10, k - 1) as NSNumber))
              } else {
                run.toggle()
              }
              k += 1
            }
            sum += num
          }
          if arr[i][j + 1] != "." {
            var num = ""
            var k = 1
            var run = true
            while run {
              if j + k <= (arr[i].count) - 1 && arr[i][j + k] != "." {
                num.append(String(arr[i][j + k]))
              } else {
                run.toggle()
              }
              k += 1
            }
            sum += Int(num)!
          }

          if arr[i + 1][j] != "." {
            var num = ""
            var k = 0
            var run = true
            while run {
              if j - k >= 0 && arr[i + 1][j - k] != "." {
                num = String(arr[i + 1][j - k]).appending(num)
              } else {
                run.toggle()
              }
              k += 1
            }
            k = 1
            run.toggle()
            while run {
              if j + k <= (arr[i].count) - 1 && arr[i + 1][j + k] != "." {
                num.append(arr[i + 1][j + k])
              } else {
                run.toggle()
              }
              k += 1
            }
            sum += Int(num)!
          } else {
            if arr[i + 1][j - 1] != "." {
              var num = 0
              var k = 1
              var run = true
              while run {
                if j - k >= 0 && arr[i + 1][j - k] != "." {
                  num =
                    num
                    + (Int(String(arr[i + 1][j - k]))! * Int(truncating: pow(10, k - 1) as NSNumber))
                } else {
                  run.toggle()
                }
                k += 1
              }
              sum += num
            }
            if arr[i + 1][j + 1] != "." {
              var num = ""
              var k = 1
              var run = true
              while run {
                if j + k <= (arr[i].count) - 1 && arr[i + 1][j + k] != "." {
                  num.append(String(arr[i + 1][j + k]))
                } else {
                  run.toggle()
                }
                k += 1
              }
              sum += Int(num)!
            }
          }
        }
      }
    }
    return sum
  }

  func part2() -> Any {
    var sum = 0
    var arr = [[String.Element]]()
    for lines in data.split(whereSeparator: \.isNewline) {
      let line = Array((String(lines)))
      arr.append(line)
    }
      for i in 0..<arr.count {
          for j in 0..<arr[i].count {
              if (arr[i][j] == "*"){
                  var nums = [Int]()
                  
                    if arr[i - 1][j] != "." {
                      var num = ""
                      var k = 0
                      var run = true
                      while run {
                        if j - k >= 0 && arr[i - 1][j - k] != "." {
                          num = String(arr[i - 1][j - k]).appending(num)
                        } else {
                          run.toggle()
                        }
                        k += 1
                      }
                      k = 1
                      run.toggle()
                      while run {
                        if j + k <= (arr[i].count) - 1 && arr[i - 1][j + k] != "." {
                          num.append(arr[i - 1][j + k])
                        } else {
                          run.toggle()
                        }
                        k += 1
                      }
                        nums.append(Int(num)!)
                    } else {
                      if arr[i - 1][j - 1] != "." {
                        var num = 0
                        var k = 1
                        var run = true
                        while run {
                          if j - k >= 0 && arr[i - 1][j - k] != "." {
                            num =
                              num
                              + (Int(String(arr[i - 1][j - k]))! * Int(truncating: pow(10, k - 1) as NSNumber))
                          } else {
                            run.toggle()
                          }
                          k += 1
                        }
                          nums.append(num)
                      }
                      if arr[i - 1][j + 1] != "." {
                        var num = ""
                        var k = 1
                        var run = true
                        while run {
                          if j + k <= (arr[i].count) - 1 && arr[i - 1][j + k] != "." {
                            num.append(String(arr[i - 1][j + k]))
                          } else {
                            run.toggle()
                          }
                          k += 1
                        }
                          nums.append(Int(num)!)
                      }
                    }

                    if arr[i][j - 1] != "." {
                      var num = 0
                      var k = 1
                      var run = true
                      while run {
                        if j - k >= 0 && arr[i][j - k] != "." {
                          num =
                            num
                            + (Int(String(arr[i][j - k]))! * Int(truncating: pow(10, k - 1) as NSNumber))
                        } else {
                          run.toggle()
                        }
                        k += 1
                      }
                        nums.append(num)
                    }
                    if arr[i][j + 1] != "." {
                      var num = ""
                      var k = 1
                      var run = true
                      while run {
                        if j + k <= (arr[i].count) - 1 && arr[i][j + k] != "." {
                          num.append(String(arr[i][j + k]))
                        } else {
                          run.toggle()
                        }
                        k += 1
                      }
                        nums.append(Int(num)!)
                    }

                    if arr[i + 1][j] != "." {
                      var num = ""
                      var k = 0
                      var run = true
                      while run {
                        if j - k >= 0 && arr[i + 1][j - k] != "." {
                          num = String(arr[i + 1][j - k]).appending(num)
                        } else {
                          run.toggle()
                        }
                        k += 1
                      }
                      k = 1
                      run.toggle()
                      while run {
                        if j + k <= (arr[i].count) - 1 && arr[i + 1][j + k] != "." {
                          num.append(arr[i + 1][j + k])
                        } else {
                          run.toggle()
                        }
                        k += 1
                      }
                        nums.append(Int(num)!)
                    } else {
                      if arr[i + 1][j - 1] != "." {
                        var num = 0
                        var k = 1
                        var run = true
                        while run {
                          if j - k >= 0 && arr[i + 1][j - k] != "." {
                            num =
                              num
                              + (Int(String(arr[i + 1][j - k]))! * Int(truncating: pow(10, k - 1) as NSNumber))
                          } else {
                            run.toggle()
                          }
                          k += 1
                        }
                          nums.append(num)
                      }
                      if arr[i + 1][j + 1] != "." {
                        var num = ""
                        var k = 1
                        var run = true
                        while run {
                          if j + k <= (arr[i].count) - 1 && arr[i + 1][j + k] != "." {
                            num.append(String(arr[i + 1][j + k]))
                          } else {
                            run.toggle()
                          }
                          k += 1
                        }
                          nums.append(Int(num)!)
                      
                    }
                  }
                  if nums.count == 2 {
                      sum += (nums[0]*nums[1])
                  }
              }
          }
      }
    return sum
  }
}
