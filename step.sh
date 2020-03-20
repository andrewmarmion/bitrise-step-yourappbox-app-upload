#!/bin/bash

if [ -z "$yab_api_key" ]; then
  echo "Please provide your API Key"
  exit 1
fi

if [ -z "$yab_apk_ipa_filepath" ]; then
  echo "Please provide the path for the IPA or APK that you wish to upload."
  echo "For IPA it is usually \$BITRISE_IPA_PATH"
  echo "For APK it is usually \$BITRISE_APK_PATH"
  exit 1
fi

if [ "$yab_use_legacy" == "yes" ]; then
  curl https://installfish.com/upload -F apikey="$yab_api_key" -F app="@$yab_apk_ipa_filepath" -F whatsnew="$whats_new"
else
  curl https://yourappbox.com/api/upload -F apikey="$yab_api_key" -F app="@$yab_apk_ipa_filepath" -F whatsnew="$whats_new"
fi
