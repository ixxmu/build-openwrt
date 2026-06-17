#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 基本不需要添加啥插件了,我搜集了各位大神的插件都集成一个软件包直接打入源码里面了
# 要了解增加了什么东西，就到我的专用软件包里面看看看吧，如果还是没有你需要的插件，请不要一下子就拉取别人的插件包
# 相同的文件都拉一起，因为有一些可能还是其他大神修改过的容易造成编译错误的
# 想要什么插件就单独的拉取什么插件就好，或者告诉我，我把插件放我的插件包就行了
# 软件包地址：https://github.com/281677160/openwrt-package
# 拉取插件请看《各种命令的简单介绍》第4条、第5条说明,不管大神还是新手请认真的看看,再次强调请不要一下子就拉取别人一堆插件的插件包,容易造成编译错误的
# 增加出国源
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
# 切换增加源的方式
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# 你可能需要删除lienol的插件
# Uncomment a feed source，如果用lede的源码只用加上这一句就可以看见ssr插件了！不用再次添加源的
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# 发现天灵的是最新的
# 这里注意你如果要在lieonl的固件中使用acc加速，你必须选择 DNSForwarder把它也加上，因为加速里面 目前仅支持 PDNSD 和 DNSForwarder，而此固件有没有内置；
# 天灵acc 不能加，一加就编译失败 svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-19.07/package/ctcgfw/luci-app-turboacc package/diy/luci-app-turboacc

# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-sfe package/diy/luci-app-sfe
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-flowoffload package/diy/luci-app-flowoffload

#　svn co https://github.com/281677160/openwrt-package/branches/19.07/feeds/luci/applications/luci-app-gowebdav package/luci-app-gowebdav

#真的是每一个都不一样，lienol维护的是19.07的主分支，如果需要添加passwall添加下面2行就可以，第二个是依赖，跟新的也算频繁，貌似很稳定，该有的插件都有了

# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

 # git clone https://github.com/kenzok8/litte package/litte
 #  git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
  
# 下面这个据说是官方支持的passwall，最好和上面的不要同时启用，怕冲突！！！
#  sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default

# 可能再加一个官方ssrplus
# git clone https://github.com/fw876/helloworld package/diy/helloworld

# 这里展示的是另外一种拉取方式，可能更加稳妥？想要passwall的在这里开启，已经试过可以正常拉取的
# git clone https://github.com/xiaorouji/openwrt-passwall package/diy/luci-app-passwall

# 自定义添加？
 # git clone -b 19.07 --single-branch https://github.com/281677160/openwrt-package
 
# git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
# git clone https://github.com/fw876/helloworld package/luci-app-ssr-plus

# mkdir -p package/helloworld
# for i in "dns2socks" "microsocks" "ipt2socks" "pdnsd-alt" "redsocks2"; do \
#   svn checkout "https://github.com/immortalwrt/packages/trunk/net/$i" "package/helloworld/$i"; \
# done

#　sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
#　svn co https://github.com/immortalwrt/packages/trunk/net/dns2socks package/helloworld/dns2socks
#　svn co https://github.com/immortalwrt/packages/trunk/net/microsocks package/helloworld/microsocks
#　svn co https://github.com/immortalwrt/packages/trunk/net/ipt2socks package/helloworld/ipt2socks
#　svn co https://github.com/immortalwrt/packages/trunk/net/pdnsd-alt package/helloworld/pdnsd-alt
#　svn co https://github.com/immortalwrt/packages/trunk/net/redsocks2 package/helloworld/redsocks2

#最好不要替换，替换后固件会变慢！
# rm -rf feeds/packages/libs/libcap
# svn co https://github.com/openwrt/packages/branches/openwrt-21.02/libs/libcap/ feeds/packages/libs/libcap

# little 自带了ddnsto
# git clone https://github.com/kenzok8/litte package/litte  
git clone https://github.com/immortalwrt-collections/openwrt-gowebdav package/diy2
# git clone https://github.com/kenzok8/jell package/jell
# git clone https://github.com/xiaorouji/openwrt-passwall package/passwall

# git clone https://github.com/kenzok78/jeii package/jeii
# git clone https://github.com/kenzok8/litte package/litte
#　git clone https://github.com/xiaorouji/openwrt-passwall package/passwall

 # 添加ddnsto, lieonl下无法添加成功,问题已经解决，可以正常添加了。
# sed -i '$a src-git nas https://github.com/linkease/nas-packages.git;master' feeds.conf.default
# sed -i '$a src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' feeds.conf.default

# 取消默认的 autosamba 依赖的 luci-app-samba 到 slim 里

# find  ./target/linuxfind  ./target/linux/ -maxdepth 2 -type f  -name Makefile -exec sed -i 's#luci-app-vlmcsd##' {} \;
# / -maxdepth 2 -type f  -name Makefile -exec sed -i 's#luci-app-vlmcsd##' {} \;

# git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/diy/luci-app-unblockneteasemusic
# lieonl 的19.07 不用加这些主题，small-package自带啊，都有 貌似只有大雕的不行需要自己加
# rm -rf package/lean/luci-theme-argon
# Add luci-theme-argon 这是那个修改版
# git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon # 适配的是18.06以及LEDE版本
# git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon # 主线适配的是19.07
# git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git
# 这个大佬应该是把ssr和passwall的依赖分开了，导致编译失败，加上看看吧
# git clone https://github.com/kenzok8/small-package package/small-package



# 可能与yml文件内的编译命令有关系，用 sed 语句拉下来的包不生效，一直无法拉取最新的xray，所以这里同为改为git clone 命令，可以拉到最新的了
# 这里的逻辑应该是在最开始就让它加载在feeds conf的默认里面，不折腾了~~~~ 新编译的会自动崩溃！
git clone https://github.com/kenzok8/openwrt-packages package/kenzo
git clone https://github.com/kenzok8/small package/small
# git clone https://github.com/yichya/luci-app-xray package/luci_app_xray

## sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
## sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# sed -i '$a src-git-full luci_app_xray https://github.com/yichya/luci-app-xray' feeds.conf.default

