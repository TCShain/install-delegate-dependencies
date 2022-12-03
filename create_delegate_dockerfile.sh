#!/bin/bash

echo "\n> Building Dockerfile with the following dependencies...\n"

for d in $1
do
    echo $d
done

sleep 2

cat << EOF > pre_template
FROM $DELEGATE_IMAGE

USER root
EOF

cat pre_template > Dockerfile

for d in $1
do
    cat install_scripts/$d >> Dockerfile && echo \\n >> Dockerfile
done

cat post_template >> Dockerfile

echo "\n> Complete:"
echo "-------------------\n"

cat Dockerfile