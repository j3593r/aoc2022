import std/[strutils, sequtils, math, os]

let input = readFile("input.txt")
                .strip()
                .splitLines()

var az = [count(input, "A Z") * 3, count(input, "A Z") * 8] # rock - scissor ? rock - paper
var bz = [count(input, "B Z") * 9, count(input, "B Z") * 9] # paper - scissor ? paper - scissor
var cz = [count(input, "C Z") * 6, count(input, "C Z") * 7]  # scissor - scissor ? scissor - rock
var ax = [count(input, "A X") * 4, count(input, "A X") * 3] # rock - rock ? rock - scissor
var bx = [count(input, "B X") * 1, count(input, "B X") * 1] # paper - rock ? paper - rock
var cx = [count(input, "C X") * 7, count(input, "C X") * 2] # scissor - rock ? scissor - paper
var ay = [count(input, "A Y") * 8, count(input, "A Y") * 4] # rock - paper ? rock - rock
var by = [count(input, "B Y") * 5, count(input, "B Y") * 5] # paper - paper ? paper - paper
var cy = [count(input, "C Y") * 2 ,count(input, "C Y") * 6] # scissor - paper ? scissor - scissor

func solve1(nums: openArray[int]): int = sum(nums)
func solve2(nums: openArray[int]): int = sum(nums)

when isMainModule:
  echo "Nim"
  echo case getEnv("part"):
      of "part2": intToStr(solve2([az[1],bz[1],cz[1],ax[1],bx[1],cx[1],ay[1],by[1],cy[1]]))
      of "part1", "": intToStr(solve1([az[0],bz[0],cz[0],ax[0],bx[0],cx[0],ay[0],by[0],cy[0]]))
      else: "Unknown part"