#!/bin/sh

inputDir=

while [ $# -gt 0 ]; do
  case $1 in
    -i | --input-dir )
      inputDir=$2
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

cd $inputDir

npm install -g gulp
npm install -g bower

npm install

bower install

gulp test

mkdir -p ui-unit-report

mv build/test-results/coverage ui-junit-report/
mv build/test-results/karma ui-junit-report/

