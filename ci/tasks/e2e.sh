#!/bin/sh

set -e
set -x

echo "stating the process"
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

echo "stating the process Done 1"
echo $inputDir

error_and_exit() {
  echo $1 >&2
  exit 1
}
echo "stating the process Done 2"

if [ ! -d "$inputDir" ]; then
  error_and_exit "missing input directory: $inputDir"
fi

if [ ! -d "$outputDir" ]; then
  error_and_exit "missing output directory: $outputDir"
fi
echo "stating the process Done 3"
pwd

env

echo "stating the process Done 4 $inputDir"

cd $inputDir
ls -lrt

cd ..

whoami


mkdir -p $VIDEOS_DIR/e2e-jar

echo "stating the process Done 6"

mkdir -p $VIDEOS_DIR/e2e-jar-extract

echo "stating the process Done 7"

cp $inputDir/e2e.jar $VIDEOS_DIR/e2e-jar

echo "stating the process Done 8"


unzip -qqo $VIDEOS_DIR/e2e-jar/e2e.jar -d $VIDEOS_DIR/e2e-jar-extract/

echo "stating the process Done 9"

supervisorctl -c /etc/supervisor/supervisord.conf start video-rec

echo "stating the process Done 10 video started"

java -cp "$VIDEOS_DIR/e2e-jar/e2e.jar:$VIDEOS_DIR/e2e-jar-extract/libs/*:" org.junit.runner.JUnitCore com.naresh.uiapps.web.Automation

echo "stating the process Done 11"

supervisorctl -c /etc/supervisor/supervisord.conf stop video-rec

echo "stating the process Done 12 video stopped"

cd $VIDEOS_DIR

ls -lrt

echo "stating the process Done 13 DONE"
#echo "stating the process Done 5"
#supervisorctl -c /etc/supervisor/supervisord.conf start video-rec
#echo "stating the process Done 6"
#java -cp "$inputDir/e2e.jar:e2e-jar-extract/libs/*:" org.junit.runner.JUnitCore com.naresh.uiapps.web.Automation
#echo "stating the process Done 7"
#supervisorctl -c /etc/supervisor/supervisord.conf stop video-rec
#
#echo "stating the process Done 8 $VIDEO_PATH"
#mkdir -p $outputDir
#
#cp $VIDEO_PATH $outputDir/


