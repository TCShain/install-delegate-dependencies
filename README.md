# install-delegate-dependencies

## Purpose

This is a simple script to install dependencies into a immutable Harness Delegate container image.

## Use

Choose from the available dependencies in the `install_scripts` directory by passing them in a set of quoted script paramaters.

Example:
`sh build_delegate_dockerfile.sh "aws_cli serverless_framework"`

## Extend

You can add your own dependencies to the process by adding a new file in the `install_scripts` directory.  Be sure to add the Docker `RUN` command ahead of your script or whichever Docker build commands are necessary to install your dependencies.

Example:
`RUN microdnf install ipuitls`