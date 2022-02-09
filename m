Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76684AF45F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:47:25 +0100 (CET)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoFf-0003Zk-7L
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:47:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnll-00030G-7Y
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:29 -0500
Received: from [2a00:1450:4864:20::52d] (port=38640
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlK-0007rV-Av
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:10 -0500
Received: by mail-ed1-x52d.google.com with SMTP id cn6so5351165edb.5
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVg00yMIJwdpqhnWMuf3gNCiNHok2dMC5Smr25iXBBg=;
 b=bKrQhkjS3TbF2u80YQLoo0KBG0vrPwcQBhOfEboaXpc42Vo3QP7xiH3d6wwfhIGnzN
 3WhZi1NjcdZghnsA0Lpy+cof2rcT218riOdCkOI2w28LlLiH8Bpdq9kBNf9Y411UIEeA
 KiUEpsA1Fb3HGqzvLhkvCgDvvAiFPvbd1agM4l/EQj16NCRKDz3aGV7x0BHHv7NXEfw8
 K1Yz00g5omYd8Yx/FnRXCty6b6dGSr2CFHAWG1deln5SN8bnn/Tf3WVG5h4rsDWAuVwR
 dIFVlVIJwIV82TFf/l7c/aVi9geukUcu8piLvVUBm66XXZ+nvHh4ENRi0YTG2oaX+NgI
 /RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVg00yMIJwdpqhnWMuf3gNCiNHok2dMC5Smr25iXBBg=;
 b=bCdPGkQ7zXdlatvNM5wxVKSRjRNDwJN9ToG9o4j/5MiM+nZC2rvSuUGLnZdlv0xTui
 5I+aydCvxok6oponwv7wqktjDkU74lcjWkyFGmqob7xjxtmOpifPVPiIQ7/XRqzHWPbJ
 jaGpbFc7Y55Us0PvZ6g55nc5H+vkBU+xS7yOqNYvoaTLTRrXTFlSXk6ibNp2etDIDOT+
 isk2K9qpqtdza5VP67jbp7rwPhdsk7A6OyYn7+HWhgrKM2EpkSAUfuGQZVN8daSPIhXF
 vyf3K7Aum4P5UXlcS3+PfzLvuDWAaR1IZe5MvJ+ubuWNpzXwvxjRu5jzHJB1Vus97Dj8
 wbwQ==
X-Gm-Message-State: AOAM532wI+sv7EBV+ZjLcUaEE7ahGNfL09VIP3cD92e4bzWepYm9j5z6
 G8sGBoYp0n22GHxhKFs1xfskPw==
X-Google-Smtp-Source: ABdhPJzrw7hpMDfz827bUn04nk6hLNLZReNKhYjZWUS3hqydMEpRqo2utIdA6l+ArJ3N4ILyoEelpg==
X-Received: by 2002:a50:ee04:: with SMTP id g4mr2706404eds.297.1644416142029; 
 Wed, 09 Feb 2022 06:15:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ss14sm3852688ejb.199.2022.02.09.06.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE8FE1FFC0;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/28] drop libxml2 checks since libxml is not actually used
 (for parallels)
Date: Wed,  9 Feb 2022 14:15:09 +0000
Message-Id: <20220209141529.3418384-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

For a long time, we assumed that libxml2 is necessary for parallels
block format support (block/parallels*). However, this format actually
does not use libxml [*]. Since this is the only user of libxml2 in
whole QEMU tree, we can drop all libxml2 checks and dependencies too.

It is even more: --enable-parallels configure option was the only
option which was silently ignored when it's (fake) dependency
(libxml2) isn't installed.

Drop all mentions of libxml2.

[*] Actually the basis for libxml use were introduced in commit
    ed279a06c53 ("configure: add dependency") but the implementation
    was never merged:
    https://lore.kernel.org/qemu-devel/70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org/

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Updated description and adapted to use lcitool]
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-5-f4bug@amsat.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220204204335.1689602-9-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 5f43355071..82db1e7e74 100644
--- a/meson.build
+++ b/meson.build
@@ -453,11 +453,6 @@ if not get_option('linux_io_uring').auto() or have_block
                               required: get_option('linux_io_uring'),
                               method: 'pkg-config', kwargs: static_kwargs)
 endif
-libxml2 = not_found
-if not get_option('libxml2').auto() or have_block
-  libxml2 = dependency('libxml-2.0', required: get_option('libxml2'),
-                       method: 'pkg-config', kwargs: static_kwargs)
-endif
 libnfs = not_found
 if not get_option('libnfs').auto() or have_block
   libnfs = dependency('libnfs', version: '>=1.9.3',
@@ -3496,7 +3491,6 @@ summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
 summary_info += {'zstd support':      zstd}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
-summary_info += {'libxml2':           libxml2}
 summary_info += {'capstone':          capstone_opt == 'internal' ? capstone_opt : capstone}
 summary_info += {'libpmem support':   libpmem}
 summary_info += {'libdaxctl support': libdaxctl}
diff --git a/block/meson.build b/block/meson.build
index deb73ca389..90dc9983e5 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -58,8 +58,7 @@ block_ss.add(when: 'CONFIG_QED', if_true: files(
   'qed-table.c',
   'qed.c',
 ))
-block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'],
-             if_true: files('parallels.c', 'parallels-ext.c'))
+block_ss.add(when: 'CONFIG_PARALLELS', if_true: files('parallels.c', 'parallels-ext.c'))
 block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
 block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
 block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..95d527f773 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -113,8 +113,6 @@ option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
 option('libusb', type : 'feature', value : 'auto',
        description: 'libusb support for USB passthrough')
-option('libxml2', type : 'feature', value : 'auto',
-       description: 'libxml2 support for Parallels image format')
 option('linux_aio', type : 'feature', value : 'auto',
        description: 'Linux AIO support')
 option('linux_io_uring', type : 'feature', value : 'auto',
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5caa739db4..5e50111060 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -307,7 +307,6 @@ our @typeList = (
 	qr{target_(?:u)?long},
 	qr{hwaddr},
         # external libraries
-	qr{xml${Ident}},
 	qr{xen\w+_handle},
 	# Glib definitions
 	qr{gchar},
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index e05f2fddcc..9850dd4444 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -81,7 +81,6 @@
 --disable-libssh \
 --disable-libudev \
 --disable-libusb \
---disable-libxml2 \
 --disable-linux-aio \
 --disable-linux-io-uring \
 --disable-linux-user \
diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
index ecff6ac5b4..6f60a52d23 100644
--- a/scripts/coverity-scan/coverity-scan.docker
+++ b/scripts/coverity-scan/coverity-scan.docker
@@ -59,7 +59,6 @@ ENV PACKAGES \
     libubsan \
     libudev-devel \
     libusbx-devel \
-    libxml2-devel \
     libzstd-devel \
     llvm \
     lzo-devel \
diff --git a/scripts/coverity-scan/run-coverity-scan b/scripts/coverity-scan/run-coverity-scan
index 6d443250a9..181bdcb263 100755
--- a/scripts/coverity-scan/run-coverity-scan
+++ b/scripts/coverity-scan/run-coverity-scan
@@ -402,7 +402,7 @@ echo "Configuring..."
     --enable-libiscsi --enable-libnfs --enable-seccomp \
     --enable-tpm --enable-libssh --enable-lzo --enable-snappy --enable-bzip2 \
     --enable-numa --enable-rdma --enable-smartcard --enable-virglrenderer \
-    --enable-mpath --enable-libxml2 --enable-glusterfs \
+    --enable-mpath --enable-glusterfs \
     --enable-virtfs --enable-zstd
 
 echo "Running cov-build..."
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index a4af02c527..48a454cece 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -58,7 +58,6 @@ meson_options_help() {
   printf "%s\n" '  libssh          ssh block device support'
   printf "%s\n" '  libudev         Use libudev to enumerate host devices'
   printf "%s\n" '  libusb          libusb support for USB passthrough'
-  printf "%s\n" '  libxml2         libxml2 support for Parallels image format'
   printf "%s\n" '  linux-aio       Linux AIO support'
   printf "%s\n" '  linux-io-uring  Linux io_uring support'
   printf "%s\n" '  lzfse           lzfse support for DMG images'
@@ -188,8 +187,6 @@ _meson_option_parse() {
     --disable-libudev) printf "%s" -Dlibudev=disabled ;;
     --enable-libusb) printf "%s" -Dlibusb=enabled ;;
     --disable-libusb) printf "%s" -Dlibusb=disabled ;;
-    --enable-libxml2) printf "%s" -Dlibxml2=enabled ;;
-    --disable-libxml2) printf "%s" -Dlibxml2=disabled ;;
     --enable-linux-aio) printf "%s" -Dlinux_aio=enabled ;;
     --disable-linux-aio) printf "%s" -Dlinux_aio=disabled ;;
     --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=enabled ;;
-- 
2.30.2


