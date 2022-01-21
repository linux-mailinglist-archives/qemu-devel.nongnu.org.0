Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB45849626E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:56:18 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwGv-0007j9-TU
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:56:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw35-0001Ys-OQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:59 -0500
Received: from [2a00:1450:4864:20::429] (port=43707
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw33-0007i7-Ru
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:59 -0500
Received: by mail-wr1-x429.google.com with SMTP id v13so373239wrv.10
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRMk9oLd+X58jCruqv6bDjXuXptPpTM6cy14Pp19F9Y=;
 b=dQUyRqMbfFM6Bj9evZP+9mbX4a3l5g/b0rJbUqmnKrsyTOdTNJb3LuEanBad//d8t6
 LY6u+Vlyiwao+HEnxfyiBa3TiBzuu3l+yrUp7YjHh94kuDra2RfQl/7EvErHoN8QXczD
 8EcjPj8WeCSQixMpeVcRQFtsXAGESPLmUL/UJrBDvRPCGkcAhr8DQ1E3RDOYSXCKqlSi
 JppS2v8quu1kutFgD6VbYUcLdiEEtwJ+lH0XbESyq5eqiGtvVLUjrT6G+cMWPNj4TkvB
 rgPa1pV9ZX+iStLHqXPWLGD6lJQhi2Yn2LOVdr0rT97YGCouXpUjcp2/fhCg5tLWN/sz
 VjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wRMk9oLd+X58jCruqv6bDjXuXptPpTM6cy14Pp19F9Y=;
 b=hjVTkG/af7nBzJUc4zvr4ZHnVWxUMBsNCW34STpZ3ovcq99jHTc2SnqVWPwgIfv+cn
 2x0p0CuTDlmaO5vxs0HoqoCr/koStt74tK8I1EDlc/FzQEy5iE4en57IzOOyKCoOsYYB
 SVCcgPv3CGBfjrUpIr3JrGJWOMEHUhy19HGhukW8FfHAKKEzNFk16s6Zs9sZgfm0ZnKD
 HpsAXwjf1RZRhLWwOiZqmQ37C9cZhNXwqvNFZJLGMAXcr2bkHjmhpdr00Xx3+ohwQc8f
 +S0CEabdpvelaslC2dJ/I2Nv202Jg+KOHhH3YmjraU7xLdxy7nFY1GkJzKuCtSmsNZSM
 Qtdw==
X-Gm-Message-State: AOAM532EQ4kk2t/KuxgdiTwKZEQan21tIkX7VdFEOPGCZp2qgGndYlDh
 wUDeSMrqwuEdcyY82axWCXvS/6h94z8=
X-Google-Smtp-Source: ABdhPJx2r7Hd+mu3rwxcY9Zr9bzp9NtXfMbfufWunyD8Co/+sO5rQDQ6hZfh5Dbr8+GG5m+GR4y1DA==
X-Received: by 2002:a5d:688a:: with SMTP id h10mr4407785wru.415.1642779716278; 
 Fri, 21 Jan 2022 07:41:56 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 y6sm6746767wrs.108.2022.01.21.07.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:41:55 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 4/7] drop libxml2 checks since libxml is not actually used
 (for parallels)
Date: Fri, 21 Jan 2022 16:41:31 +0100
Message-Id: <20220121154134.315047-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154134.315047-1-f4bug@amsat.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

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
index 833fd6bc4ca..51e3090438d 100644
--- a/meson.build
+++ b/meson.build
@@ -451,11 +451,6 @@
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
@@ -3491,7 +3486,6 @@
 summary_info += {'lzfse support':     liblzfse}
 summary_info += {'zstd support':      zstd}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
-summary_info += {'libxml2':           libxml2}
 summary_info += {'capstone':          capstone_opt == 'internal' ? capstone_opt : capstone}
 summary_info += {'libpmem support':   libpmem}
 summary_info += {'libdaxctl support': libdaxctl}
diff --git a/block/meson.build b/block/meson.build
index deb73ca389f..90dc9983e56 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -58,8 +58,7 @@
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
index 921967eddbb..95d527f7732 100644
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
index 5caa739db48..5e501110601 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -307,7 +307,6 @@ sub help {
 	qr{target_(?:u)?long},
 	qr{hwaddr},
         # external libraries
-	qr{xml${Ident}},
 	qr{xen\w+_handle},
 	# Glib definitions
 	qr{gchar},
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index e05f2fddcc2..9850dd44444 100755
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
index ecff6ac5b4b..6f60a52d231 100644
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
index 6d443250a9b..181bdcb2638 100755
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
index a4af02c5273..48a454cece2 100644
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
2.34.1


