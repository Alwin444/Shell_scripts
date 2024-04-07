#! /bin/bash
echo "Enter the directory name: "
read directory_path
cd /$directory_path
echo "The directory is been found, present working directory is $(pwd)"
echo "Files: "
ls
