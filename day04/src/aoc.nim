import std/[strutils, sequtils, os]

let input = readFile("input.txt")
                .strip()
                .splitLines()

proc makeSet(fullset: string) : (seq[int], seq[int]) =
    result[0] = fullset.split(',')[0].split('-').map(parseInt)
    result[1] = fullset.split(',')[1].split('-').map(parseInt)     

proc part1(data: seq[string]) : int =    
    for sets in data:
        var (set1, set2) = makeSet(sets)
        if (set1[0] <= set2[0] and set1[1] >= set2[1]) or (set2[0] <= set1[0] and set2[1] >= set1[1]):
            result = result + 1
            
proc part2(data: seq[string]): int =
    for sets in data:
        var (set1, set2) = makeSet(sets)
        if (set1[0]>=set2[0] and set1[0]<=set2[1]) or (set1[1]>=set2[0] and set1[0]<=set2[1]) or 
            (set2[0]>=set1[0] and set2[0]<=set1[1]) or (set2[1]>=set1[0] and set2[0]<=set1[1]):
                result = result + 1

when isMainModule:
  echo "Nim"
  echo case getEnv("part"):
      of "part2": intToStr(part2(input))
      of "part1", "": intToStr(part1(input))
      else: "Unknown part"