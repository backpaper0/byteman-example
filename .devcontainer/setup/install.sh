#!/bin/bash
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo -e ""
    exit 1
fi

mkdir -p "${_REMOTE_USER_HOME}/.m2"
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${_REMOTE_USER_HOME}/.m2"

byteman_version="4.0.25"
zip_name="byteman-download-${byteman_version}-bin.zip"
curl -LO "https://repo.maven.apache.org/maven2/org/jboss/byteman/byteman-download/${byteman_version}/${zip_name}"
unzip "${zip_name}" -d /tmp
mv "/tmp/$(ls /tmp | grep byteman)" /opt/byteman
rm "${zip_name}"
