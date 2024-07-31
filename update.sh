version="0.0.1"

source=~/workspace/alupindev/alupin/agent/bin
artifact=./artifact
versions=./versions

name="amd64.$version"
cp $source/amd64_agent $artifact/agent.$name
amd64_md5sum=$(md5 $artifact/agent.$name | cut -d' ' -f 4)
echo "$amd64_md5sum" > $versions/$name.txt
echo "amd64.$version $amd64_md5sum" > $versions/latest.txt

name="arm64.$version"
cp $source/arm64_agent $artifact/agent.$name
arm64_md5sum=$(md5 $artifact/agent.$name | cut -d' ' -f 4)
echo $arm64_md5sum > $versions/$name.txt
echo "arm64.$version $arm64_md5sum" >> $versions/latest.txt

echo "updated: version $version"
echo "amd64: $amd64_md5sum" 
echo "arm64: $arm64_md5sum" 