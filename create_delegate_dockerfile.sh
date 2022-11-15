#!/bin/bash

echo "\n> Building Dockerfile with the following dependencies...\n"

for d in $1
do
    echo $d
done

sleep 2

cat << EOF > pre_template
FROM harness/delegate-immutable:$DELEGATE_IMAGE

USER root
EOF

cat pre_template > Dockerfile

for d in $1
do
    is=install_scripts/$d
    case $d in
        aws_cli ) cat $is >> Dockerfile;;
        serverless_framework ) cat $is >> Dockerfile;;
    esac
done

cat post_template >> Dockerfile

echo "\n> Complete:"
echo "-------------------\n"

cat Dockerfile