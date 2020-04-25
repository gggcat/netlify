#!/bin/bash

#
# go to contents folder
#
cd ${NETLIFY_PUBLISH_FOLDER}
echo "WORKING_DIR: $(pwd)"

#
# .netlify Configuration
#
NETLIFY_CONFDIR=.netlify
sleep 10
# 少し待たないと vlomue のマウントが間に合わずエラーになる
if [ ! -e ${NETLIFY_CONFDIR} ]; then
    mkdir ${NETLIFY_CONFDIR}
fi

SITE_ID=$(netlify sites:list | grep "${NETLIFY_SITE_NAME} - " | awk '{ print $3 }')
cat << EOS > .netlify/state.json
{
	"siteId": "${SITE_ID}"
}
EOS

case $1 in
    site)
        # Site list
        netlify status
        netlify sites:list
        ;;
    draft)
        # Deploy - live draft
        netlify sites:list
        netlify deploy --message "update contents: site_name=${NETLIFY_SITE_NAME}, release_date=$(date +'%Y/%m/%d %H:%M:%S')"
        ;;
    deploy)
        # Deploy
        netlify sites:list
        netlify deploy --prod --message "update contents: site_name=${NETLIFY_SITE_NAME}, release_date=$(date +'%Y/%m/%d %H:%M:%S')"
        ;;
    *)
        echo "entrypoint.sh"
        echo " CMD)"
        echo "    site: netlify sites:list"
        echo "    draft: netlify draft"
        echo "    deploy: netlify deploy"
        ;;
esac

#
# Delete netlifyconf
#
rm -rf ${NETLIFY_CONFDIR}