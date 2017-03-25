#!/bin/sh

set -e

inputDir=  outputDir=

while [ $# -gt 0 ]; do
  case $1 in
    -i | --input-dir )
      inputDir=$2
      shift
      ;;
    -o | --output-dir )
      outputDir=$2
      shift
      ;;

    * )
      echo "Unrecognized option: $1" 1>&2
      exit 1
      ;;
  esac
  shift
done

error_and_exit() {
  echo $1 >&2
  exit 1
}

if [ ! -d "$inputDir" ]; then
  error_and_exit "missing input directory: $inputDir"
fi

if [ ! -d "$outputDir" ]; then
  error_and_exit "missing output directory: $outputDir"
fi

pwd

env

unzip -qq $inputDir/e2e.jar -d e2e-jar-extract
supervisorctl -c /etc/supervisor/supervisord.conf start video-rec
java -cp "$inputDir/e2e.jar:e2e-jar-extract/libs/*:" org.junit.runner.JUnitCore com.naresh.uiapps.web.Automation
supervisorctl -c /etc/supervisor/supervisord.conf stop video-rec

cp $VIDEO_PATH $outputDir/


