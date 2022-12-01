import strutils, std/sequtils, math, os

var subt = 0
var topthree = @[0,0,0]

proc day01 =
    let f = open("input.txt")
    defer: f.close()

    for line in f.lines:
        if isEmptyOrWhitespace(line):
            if len(filter(topthree, proc(x: int): bool = x < subt)) > 0:
                topthree[minIndex(topthree)] = subt
            subt = 0
        else: 
            subt = subt + parseInt(line)

when isMainModule:
  echo "Nim"
  day01()
  echo case getEnv("part"):
      of "part2": intToStr(sum(topthree))
      of "part1", "": intToStr(topthree[maxIndex(topthree)])
      else: "Unknown part"