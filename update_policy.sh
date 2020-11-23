#!/bin/bash
#### config ####
policy_path='/home/attribute-filter-policy'
idp_path='/opt/shibboleth-idp'

################
policy_xml=$policy_path'/attribute-filter.xml'
idp_xml=$idp_path'/conf/attribute-filter.xml'

cd $policy_path
First=`md5sum $policy_xml | awk '{print $1}'`
git pull
Second=`md5sum $idp_xml | awk '{print $1}'`
if  [[ $First != $Second ]]
then
    /bin/cp -rf $policy_xml $idp_xml
    curl http://127.0.0.1:8080/idp/profile/admin/reload-service?id=shibboleth.AttributeFilterService
fi
