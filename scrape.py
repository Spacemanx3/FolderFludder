import os

def search_files_and_write(start_path='/', output_file='sysFold.txt'):
    with open(output_file, 'w') as file:
        for root, dirs, files in os.walk(start_path):
            file.write(f"\nDirectory: {root}\n")
            for file_name in files:
                file_path = os.path.join(root, file_name)
                file.write(f"{file_path}\n")

def print_directory_contents(start_path='/'):
    for root, dirs, files in os.walk(start_path):
        print(f"\nDirectory: {root}")
        for file_name in files:
            file_path = os.path.join(root, file_name)
            print(file_path)

if __name__ == "__main__":
    search_files_and_write()
    print_directory_contents()
