boot2docker-9p
==============

Docker image for installing 9p modules into boot2docker

Can be built with `./build.sh`.

Synopsis
--------

When connected to boot2docker hosted docker server

    docker run --rm --privileged -v /etc:/data xforty/boot2docker-9p

Alternatively, you can run without privileged and it will just place the compiled kernel modules in /etc/9p

Description
-----------

When built, this will use the `xforty/boot2docker-9p-builder` image to pre-build kernel modules for different versions of boot2docker.

When run, boot2docker-9p will detect the boot2docker version and either load a pre-built kernel module in, or build a new one on the
fly if one isn't found.
