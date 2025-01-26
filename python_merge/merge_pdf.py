import os
from PyPDF2 import PdfMerger

def get_full_paths(directory, file_names):
    """
    Construct the full file paths for the provided file names in the given directory.

    Args:
        directory (str): The directory containing the files.
        file_names (list): A list of file names.

    Returns:
        list: A list of full file paths.
    """
    return [os.path.join(directory, file) for file in file_names]

def merge_pdfs(pdf_paths, output_path):
    """
    Merge multiple PDF files into a single PDF.

    Args:
        pdf_paths (list): A list of PDF file paths to merge.
        output_path (str): The output path for the merged PDF.
    """
    pdf_merger = PdfMerger()
    for pdf in pdf_paths:
        pdf_merger.append(pdf)

    with open(output_path, 'wb') as output_pdf:
        pdf_merger.write(output_pdf)

def main():
    """
    Main function to merge specific PDF files in a given folder.
    """
    input_path = os.path.expanduser('downloads')
    pdf_files = ['table1.pdf', 'graphic1.pdf', 'totals1.pdf']
    pdf_paths = get_full_paths(input_path, pdf_files)

    output_path = os.path.join(input_path, 'MergedPDF.pdf')
    merge_pdfs(pdf_paths, output_path)

    print(f"Merged PDF saved to {output_path}")

if __name__ == '__main__':
    main()
