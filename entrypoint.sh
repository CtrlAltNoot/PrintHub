#!/bin/bash
set -e
set -x

if id "klippy" &>/dev/null; then
  echo 'User klippy already exists; skipping user creation.'
else
  echo 'User klippy not found; Creating now...'
  adduser --system --shell /bin/bash --uid $U_ID --gid $G_ID klippy
  usermod -aG dialout klippy && usermod -aG sudo klippy
fi

install_packages avr-libc avrdude binutils-arm-none-eabi binutils-avr cmake extra-cmake-modules \
dfu-util findutils fontconfig-config fonts-dejavu-core geoip-database gcc-arm-none-eabi gcc-avr \
iproute2 libatm1 libbpf0 libelf1 libbsd0 libcap2 libcap2-bin libdeflate0 libffi-dev libfontconfig1 \
libfreetype6 libftdi1 libgd3 libgeoip1 libgpiod2 libhidapi-libusb0 libjbig0  libjs-jquery \
libjs-underscore libjs-sphinxdoc liblmdb-dev libmd0 libmnl0 libncurses-dev libnewlib-arm-none-eabi \
libnewlib-dev libnginx-mod-http-geoip libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter \
libnginx-mod-mail libnginx-mod-stream libnginx-mod-stream-geoip libopenjp2-7 libpam-cap libpng16-16 \
libpython3-dev libpython3.9 libpython3.9-dev libsodium-dev libsodium23 libtiff5 libwebp6 libx11-6 \
libx11-data libxau6 libxcb1 libxdmcp6 libxpm4 libxtables12 lmdb-doc

{ echo "$KP"; echo "$KP"; } | sudo passwd klippy

sudo chmod -R ${DP} /home/klippy
sudo chmod -R ${DP} /dockerfiles

sudo rm -rf /home/klippy/temp/README.md
sudo rm -rf /home/klippy/temp/entrypoint.sh

mv /home/klippy/temp/* /home/klippy/
rm -rf /home/klippy/temp/

mv /home/klippy/docker-systemctl/systemctl.py usr/bin/systemctl
rm -rf home/klippy/docker-systemctl/
touch /var/log/journal/sudo.service.unit.log
test -L /bin/systemctl || ln -sf /usr/bin/systemctl /bin/systemctl

sudo chown -R klippy /home/*

# to-do: add scripts to install octoprint, moonraker, klipper, and fluidd before ending setup

exec "/bin/bash"

