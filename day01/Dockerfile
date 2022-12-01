FROM nimlang/nim:onbuild as BASE

FROM nimlang/nim
COPY --from=BASE /usr/src/app .
COPY input.txt .
CMD [“./aoc”]