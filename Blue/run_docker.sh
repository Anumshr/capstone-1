# Build image and add a descriptive tag
docker build --tag=blueimage .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run container
docker run -p 8000:80 blueimage
