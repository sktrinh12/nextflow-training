import argparse
from pathlib import Path


def frequent_words(seq, k):
    count = {}
    for i in range(len(seq) - k + 1):
        pattern = seq[i:i + k]
        count[pattern] = count.get(pattern, 0) + 1
    maxvalue = max(count.values())
    return [key for key, value in count.items() if value == maxvalue]

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-sq", help="The nucleic acid sequence input file path", required=True)
    parser.add_argument("-k", help="k number (length of substring)", required=True)
    args = parser.parse_args()
    target_dir = Path(args.sq)
    with open(target_dir, 'r') as f:
        content = f.read()
    #print(content)
    res = frequent_words(content, int(args.k))
    if len(res) > 1:
        print(', '.join(res))
    else:
        print(res[0])
