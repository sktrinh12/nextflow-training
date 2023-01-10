import argparse
from pathlib import Path
import numpy as np


def FindClumps(text, k, L, t):
    n = len(text)
    out = []
    # FOR each window of size L
    for i in range(n - L):
        pattern = []
        window = text[i : i + L]
        # FOR each pattern present in window
        for j in range(len(window) - k):
            pattern.append(window[j : j + k])
        # find unique k-mers and their frequencies
        kmers, counts = np.unique(pattern, return_counts=True)
        out += kmers[counts >= t].tolist()
    return np.unique(out, return_counts=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-sq", help="The nucleic acid sequence input file path", required=True
    )
    parser.add_argument(
        "-k", help="The sub-sequence that is to be found", required=True
    )
    parser.add_argument(
        "-L", help="The window to search in, length of amino acids", required=True
    )
    parser.add_argument("-t", help="Number of times kmer shows up", required=True)
    args = parser.parse_args()
    source_dir = Path(args.sq)
    with open(source_dir, "r") as f:
        genome = f.read().strip()
    res = FindClumps(genome, int(args.k), int(args.L), int(args.t))
    print(res)
