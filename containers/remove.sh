#!/bin/bash


docker rmi --force $(docker images |grep nginx | awk '{print $3}')
