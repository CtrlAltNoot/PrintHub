switch_to_master(){
  cd $KLIPPER_DIR
  status_msg "Switching...Please wait ..."; echo
  git fetch origin -q && git checkout master; echo
}

switch_to_scurve_shaping(){
  cd $KLIPPER_DIR
  status_msg "Switching...Please wait ..."; echo
  if ! git remote | grep dmbutyugin -q; then
    git remote add dmbutyugin $DMBUTYUGIN_REPO
  fi
  git fetch dmbutyugin -q && git checkout scurve-shaping; echo
}

switch_to_scurve_smoothing(){
  cd $KLIPPER_DIR
  status_msg "Switching...Please wait ..."; echo
  if ! git remote | grep dmbutyugin -q; then
    git remote add dmbutyugin $DMBUTYUGIN_REPO
  fi
  git fetch dmbutyugin -q && git checkout scurve-smoothing; echo
}

switch_to_dgus_display(){
  cd $KLIPPER_DIR
  status_msg "Switching... Please wait..."; echo
  git remote set-url origin https://github.com/Desuuuu/klipper.git
  ok_msg "Set repo origin to: 'Desuuuu' repo!"; echo
  status_msg "Fetching Desuuuu/klipper..."; echo
  git fetch origin -q && git checkout master; echo
  ok_msg "Done fetching Desuuuu/klipper!"; echo
}