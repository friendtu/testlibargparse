# try libargparse by creating a simple program to do add 

# Crate runtime image
docker build -t testlibargparse .

# Run it
docker run testlibargparse add 1 2
