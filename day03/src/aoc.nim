import std/[strutils, os]

let input = readFile("input.txt")
                .strip()
                .splitLines()

type
  Character = enum
    a=1, b=2, c=3, d=4, e=5, f=6, g=7, h=8, i=9, j=10, k=11, l=12, m=13, n=14, o=15, p=16, q=17, r=18, 
    s=19, t=20, u=21, v=22, w=23, x=24, y=25, z=26, A=27, B=28, C=29, D=30, E=31, F=32, G=33, H=34, I=35, 
    J=36, K=37, L=38, M=39, N=40, O=41, P=42, Q=43, R=44, S=45, T=46, U=47, V=48, W=49, X=50, Y=51, Z=52

proc part1() : int =
    for line in input:
        var pivot = toInt((len(line)/2))
        for i, letter in line[0..^pivot+1]:                
            if line[pivot..^1].contains(letter):
                result = result + ord(parseEnum[Character]($letter))
                break  

proc part2() : int =
    var lines : array[3, string]
    var i = 0
    for line in input:
        lines[i] = line
        if i == 2:
            for i, letter in lines[0]:
                if lines[1].contains(letter) and lines[2].contains(letter):
                    result = result + ord(parseEnum[Character]($letter))
                    break
            i = -1
        i = i + 1

when isMainModule:
  echo "Nim"
  echo case getEnv("part"):
      of "part2": intToStr(part2())
      of "part1", "": intToStr(part1())
      else: "Unknown part"