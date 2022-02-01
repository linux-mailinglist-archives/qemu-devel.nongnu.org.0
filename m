Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E34A6729
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:41:09 +0100 (CET)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0tg-0005D8-VS
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:41:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Cs-5G
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::632] (port=45617
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000dA-F3
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:38 -0500
Received: by mail-ej1-x632.google.com with SMTP id me13so56926406ejb.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fzrsHIr2UBl/pseqKFbHnJlYZQrcZbG/aifIugk8tsI=;
 b=sQSLNu/68GC26rywKI50nXZjz54Y8UwBBE44nSR+MjKg5kj9XuuoWu1duzSD5abfGo
 5VUOMn9D0bZVRg+bE5Atgb0CSXvU08M2k+4gRXodfwrns78tprHs91YX7ABzdgno2vEf
 jFBbDLBwKsRCGC+aeWbusosMWV6aPg1V52AFyZaKKCib7aFeElwrTBJI2Q13uVlyahsQ
 /Qvb5OsH0u5eTSyHEoMfxNY8vVL7xhiounSMhHWRaZf7GWsWpeipnfydZeBFMOPfNFIl
 BMv6d+KIjKrMGQODiCZetrhG59DxSiGkIMiTiBLS9sY+w//fRsp8S2wWNtAePvC3oJCL
 amMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fzrsHIr2UBl/pseqKFbHnJlYZQrcZbG/aifIugk8tsI=;
 b=u5t+Q6PJ/u2XwCXo0WBiJiimZu+1QiF2vxw5fZhEem24uVTZOqNYWVF6A1k7ULia3h
 9WgHvMEYC7AIlckCBXqeCA3tvjCIWkBZRVX764REZnHDTFOtikQeUbQD592diyH+q2C7
 lB66xH9KQozKT/2Ccr7i4YWfIW7rH1U6+JZP2lUxDHbXI1e/xU9HgvqLNH3zZA/XL1Rx
 NLCcfhO2FjqObo2TN8tsbg9tS0Y+7VmM5cI8mg0fJg14oDlkwrgJgx2ZDj3Z+uNlk06f
 T7BJZ1dBmE9ecddOXcHxUov5IuXbxf1DbeVD1FXh2qt2g78v9iK2JJyIyMaI/XqzeGw4
 GEmw==
X-Gm-Message-State: AOAM533TEO/9IzbPoDDlC5dbeRbEBapX1v41EVGnhheke1BVIl98TIiG
 l2WBE+W/5dQqK6oAIkUqpy9q8Q==
X-Google-Smtp-Source: ABdhPJzmO3z49EkK1MKa6QP/CW0XBZbGpl5IrDTJyoffoAmE5BTkWkLdhdqHxcHN2XhVzOWPhXKXfQ==
X-Received: by 2002:a17:906:7316:: with SMTP id
 di22mr22580895ejc.505.1643739666831; 
 Tue, 01 Feb 2022 10:21:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gg4sm875953ejc.153.2022.02.01.10.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64A9A1FFC0;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/25] drop libxml2 checks since libxml is not actually
 used (for parallels)
Date: Tue,  1 Feb 2022 18:20:33 +0000
Message-Id: <20220201182050.15087-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 Luke.Craig@ll.mit.edu, Michael Tokarev <mjt@tls.msk.ru>,
 mahmoudabdalghany@outlook.com,
 "open list:Block layer core" <qemu-block@nongnu.org>, minyihh@uci.edu,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 aaron@os.amperecomputing.com, cota@braap.org, Thomas Huth <thuth@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org, robhenry@microsoft.com,
 Hanna Reitz <hreitz@redhat.com>, pbonzini@redhat.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
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
Message-Id: <20220124201608.604599-9-alex.bennee@linaro.org>
---
 meson.build                                     | 6 ------
 block/meson.build                               | 3 +--
 meson_options.txt                               | 2 --
 scripts/checkpatch.pl                           | 1 -
 scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
 scripts/coverity-scan/coverity-scan.docker      | 1 -
 scripts/coverity-scan/run-coverity-scan         | 2 +-
 scripts/meson-buildoptions.sh                   | 3 ---
 8 files changed, 2 insertions(+), 17 deletions(-)

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


