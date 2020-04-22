# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=blueimage

 
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username anumshr
docker tag blueimage anumshr/blueimage

# Push image to a docker repository
docker push anumshr/blueimage
