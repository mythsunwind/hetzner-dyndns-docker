#!/bin/bash

ADDRESS=192.168.178.1
SCHEMA="urn:schemas-upnp-org:service:WANIPConnection:1"
#SOAP_ACTION="$SCHEMA#X_AVM_DE_GetExternalIPv6Address"
SOAP_ACTION="$SCHEMA#X_AVM_DE_GetIPv6Prefix"
#SOAP_OPERATION="GetExternalIPv6Address"
SOAP_OPERATION="GetIPv6Prefix"
DATA="<?xml version='1.0' encoding='utf-8'?><s:Envelope xmlns:s='http://schemas.xmlsoap.org/soap/envelope/' s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'><s:Body><u:$SOAP_OPERATION xmlns:'u=$SCHEMA'></u:$SOAP_OPERATION></s:Body></s:Envelope>"

echo $DATA

curl -v -H "Content-Type: text/xml; charset=\"utf-8\"" -H "SoapAction: $SOAP_ACTION" --data "$DATA" http://$ADDRESS:49000/igdupnp/control/WANIPConn1
echo
