#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# svn co https://github.com/kousyougi/openwrt/trunk/trojan package/trojan

# Add shadowsocks-rust
# git clone https://github.com/honwen/openwrt-shadowsocks-rust.git package/shadowsocks-rust

# replace shadowsocks-libev
# rm -rf package/feeds/packages/shadowsocks-libev
# svn co https://github.com/kousyougi/openwrt/trunk/shadowsocks-libev package/feeds/packages/shadowsocks-libev


# IPV6 disable
# cut_line_n=$( grep -n "config\ IPV6" config/Config-build.in | cut -d ":" -f 1)
cut_line_n=$( sed -n '/config\ IPV6/=' config/Config-build.in )
cut_line_n=$(( $cut_line_n + 1 ))
sed -i "${cut_line_n}s/def_bool\ y/def_bool\ n/" config/Config-build.in

