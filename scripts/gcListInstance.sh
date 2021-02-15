#!/bin/bash
argc=$#
argv=("$@")
debug=false
project="something1"
zone=""
defaultZone=europe-west1-b
for (( i=0; i<argc; i++ )); do
	arg="${argv[i]}" 
	if [ "$arg" == "--help" ] || [ -z "$1" ] ; then
		echo "USAGE: gcListInstance.sh <servicePrefix> [flag] [value]"
		echo "	name:			description:									default:"
		echo "	servicePrefix		required, filter prefix								*"
		echo "	--project 		optional, or something,something1,							something1"
		echo "	--zone 			optional, or zone default							prd: us-central1-a,	stg:europe-west1-b"
		echo "	--debug 		optional, prints entire instance group details					false"
		exit 0
	fi

	if [ "$arg" == "--debug" ] ; then
		debug=true
	fi
	
	if [ "$arg" == "--zone" ] ; then
		zone="${argv[i+1]}"
	fi

	if [ "$arg" == "--project" ] ; then
		project="${argv[i+1]}"
	fi
done

service=$1

if [ "$project" == "something" ] || [ -z "$project" ] ; then
  	project=something
elif [ "$project" == "something1" ] ; then
	project=something1
	defaultZone=us-central1-a
fi

if [ -z "$zone" ] ; then
	zone=$defaultZone
fi

if [ debug == true ] ; then
	echo "filter: ${service}*, project: ${project}, zone: ${zone}"
	gcloud auth print-access-token | (read token; curl --silent -H "Authorization: OAuth $token" https://compute.googleapis.com/compute/v1/projects/${project}/zones/${zone}/instances?filter="name=${service}*" )
else
	gcloud auth print-access-token | (read token; curl --silent -H "Authorization: OAuth $token" https://compute.googleapis.com/compute/v1/projects/${project}/zones/${zone}/instances?filter="name=${service}*" | jq '.items[] | .name + " " + .networkInterfaces[].networkIP')
fi
