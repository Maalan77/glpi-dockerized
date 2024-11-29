#!/bin/bash

glpi-agent --daemon --server=http://glpi/ --no-task=deploy

tail -F anything
