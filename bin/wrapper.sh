#!/bin/bash

###################################################################################
# Shell script for launching Airsonic in a snap.
#
# Author: ArubIslander
###################################################################################

# Note: set some environment variables relative to the snap.

export LC_ALL=C.UTF-8 

export AIRSONIC_HOME=$SNAP_USER_COMMON/var/airsonic
export AIRSONIC_DEFAULT_MUSIC_FOLDER=$SNAP_USER_COMMON/var/music
export AIRSONIC_DEFAULT_PODCAST_FOLDER=$SNAP_USER_COMMON/var/music/Podcast
export AIRSONIC_DEFAULT_PLAYLIST_FOLDER=$SNAP_USER_COMMON/var/playlists

export AIRSONIC_HOST="$(snapctl get host)"    # ${AIRSONIC_HOST:-0.0.0.0}
export AIRSONIC_PORT="$(snapctl get port)"    # ${AIRSONIC_PORT:-8080}
export AIRSONIC_HTTPS_PORT="$(snapctl get https-port)"    # ${AIRSONIC_HTTPS_PORT:-0}
export AIRSONIC_CONTEXT_PATH="$(snapctl get context-path)"    # ${AIRSONIC_CONTEXT_PATH:-/}
export AIRSONIC_MAX_MEMORY="$(snapctl get max-memory)"    # ${AIRSONIC_MAX_MEMORY:-150}

export PATH=$SNAP/usr/lib/jvm/java-8-openjdk-$SNAP_ARCH/bin:$PATH

java -Dairsonic.home=$AIRSONIC_HOME \
     -Dserver.address=$AIRSONIC_HOST \
     -Dserver.port=$AIRSONIC_PORT \
     -Dserver.context-path=$AIRSONIC_CONTEXT_PATH \
     -Xmx${AIRSONIC_MAX_MEMORY}m \
     -jar $SNAP/airsonic.war
