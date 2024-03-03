#!/bin/bash
set -e

bin/airbnbex eval "airbnbEx.Release.migrate"
bin/airbnbex start

exec "$@"
