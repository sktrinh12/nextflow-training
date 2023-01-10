import argparse
from pathlib import Path

pattern = "ATAT"
genome = "GATATATGCATATACTT"
Position = []


def main(Pattern, Genome):
    for i in range(len(Genome) - len(Pattern) + 1):
        if Genome[i : i + len(Pattern)] == Pattern:
            Position.append(i)
    return Position


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-sq", help="The nucleic acid sequence input file path", required=True
    )
    parser.add_argument(
        "-pattern", help="The sub-sequence that is to be found", required=True
    )
    parser.add_argument(
        "-sort",
        help="The sub-sequence that is to be found",
        required=False,
        default=False,
    )
    args = parser.parse_args()
    target_dir = Path(args.sq)

    with open(target_dir, "r") as f:
        content = f.read().strip()
    res = main(args.pattern, content)
    if args.sort:
        res.sort()
    print(*res)
