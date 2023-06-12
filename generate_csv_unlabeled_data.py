import argparse
import json

import pandas as pd


def load_dataset(dataset_file):
    """
    Read the data from the dataset_file.

    Parameters
    ----------
    dataset_file : str
        The path to the filtering dataset file.

    Returns
    -------
    all_line_idx : list
        The list of the line idx.

    all_position_idx : list
        The list of the position idx.

    all_token: list
        The list of the token.

    all_embedding : list
        The list of the embedding.
    """
    all_line_idx = []
    all_position_idx = []
    all_token = []
    all_embedding = []

    with open(dataset_file) as f:
        dataset = json.load(f)

    for i in range(len(dataset)):
        data = dataset[i]
        info = data[0].split("|||")
        embedding = data[1]

        all_line_idx.append(info[2])
        all_position_idx.append(info[3])
        all_token.append(info[0])
        all_embedding.append(embedding)

    return all_line_idx, all_position_idx, all_token, all_embedding


def generate_csv_file(all_line_idx, all_position_idx, all_token, all_embedding, output_file):
    """
    Generate the csv file.

    Parameters
    ----------
    all_line_idx : list
        The list of the line idx.

    all_position_idx : list
        The list of the position idx.

    all_token: list
        The list of the token.

    all_embedding : list
        The list of the embedding.

    output_file : str
        The path to the output file.
    """
    df = pd.DataFrame(
        {'token': all_token,
         'line_idx': all_line_idx,
         'position_idx': all_position_idx,
         'embedding': all_embedding,
        })
    df.to_csv(output_file, index=False, sep='\t')


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--dataset_file', type=str, help='The path to the filtering dataset file.')
    parser.add_argument('--output_file', type=str, help='The path to the output file.')

    args = parser.parse_args()

    all_line_idx, all_position_idx, all_token, all_embedding = load_dataset(args.dataset_file)
    generate_csv_file(all_line_idx, all_position_idx, all_token, all_embedding, args.output_file)


if __name__ == '__main__':
    main()
