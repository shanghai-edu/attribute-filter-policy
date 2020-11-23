#!/bin/bash
cd /home/attribute-filter-policy
First=`md5sum /home/attribute-filter-policy/attribute-filter.xml | awk '{print $1}'`
git pull
Second=`md5sum /home/attribute-filter-policy/attribute-filter.xml | awk '{print $1}'`
if  [[ $First != $Second ]]
then
    /bin/cp -rf attribute-filter.xml /opt/shibboleth-idp/conf/attribute-filter.xml
    curl http://127.0.0.1:8080/idp/profile/admin/reload-service?id=shibboleth.AttributeFilterService
fi
