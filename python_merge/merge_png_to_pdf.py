import os
from PIL import Image

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

def convert_images_to_pdf(image_paths, output_path):
    """
    Convert a list of images into a single PDF file.

    Args:
        image_paths (list): A list of image file paths.
        output_path (str): The output path for the resulting PDF.
    """
    images = [Image.open(img).convert('RGB') for img in image_paths]

    if images:
        images[0].save(output_path, save_all=True, append_images=images[1:])

def main():
    """
    Main function to convert PNG files to a single PDF.
    """
    input_path = os.path.expanduser('downloads')
    image_files = ['1_cat.png', '2_ravioli.png', '3_spain.png']
    image_paths = get_full_paths(input_path, image_files)

    output_file = os.path.join(input_path, 'ConvertedImages.pdf')
    convert_images_to_pdf(image_paths, output_file)

    print(f"PDF created and saved to {output_file}")

if __name__ == '__main__':
    main()
