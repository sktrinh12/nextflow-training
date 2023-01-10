import argparse
import sys
print(sys.version)
print(sys.version_info)
from pathlib import Path

compl = {'A':'T','T':'A','C':'G','G':'C'}
TEXT = 'ATCG'

def reverser(text):
    x = ''
    for i in range(len(text)):
        x += compl[text[len(text) - i - 1]]
    return x


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-sq", help="The nucleic acid sequence input file path", required=True)
    args = parser.parse_args()
    target_dir = Path(args.sq)
    with open(target_dir, 'r') as f:
        content = f.read().strip()
    #print(content)
    res = reverser(content)
    print(res)
