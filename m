Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC83495070
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:41:56 +0100 (CET)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYdO-0000N1-Az
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVer-0005ap-3h; Thu, 20 Jan 2022 06:31:13 -0500
Received: from [2a00:1450:4864:20::32e] (port=36407
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVen-0006bJ-C3; Thu, 20 Jan 2022 06:31:12 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso19728514wma.1; 
 Thu, 20 Jan 2022 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WxWriVE1ssSmHCuwjL9f/3A2/ZRCLxWRYTu0rGXBP3I=;
 b=o0Ch+RME2l38bhl74gINOecYnAsjvaySVbbED4Cbw5Kr8EPsyXpVhr26xix88WgPPi
 8ZfNcNpeeR+AqQkiI8DPKKLzo+LKBwYXmHYfrQk7UsOXZeN/F/idK5CC35qUqqlrFTVG
 MLeb3QrmZqB4Gkj14xhajFoSJIri58LzGcpUvoIVpCo8Z+Zdfc+KbDIo12vh6IqXL3Nd
 mCqZUwrT22Q8mdCdtYQNCsbNlXojyv7cAHLltyQh3FjDQuG0ZbiS/mdjMs+4Ar1ZmayD
 MP5vi0RAENUhXZkutevBjHOqniuARdpeE1LhlpZQY15AT+qbFAQdR9vs+rw8hKYG0NRo
 3Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WxWriVE1ssSmHCuwjL9f/3A2/ZRCLxWRYTu0rGXBP3I=;
 b=Olxu/tViM7BMU5g3vHLh+yfryl95i/AAJ2VWv9GCIpyiEuvy25uyGH2XR4eVrIIf3+
 e4AnWcM91hsURk1nQKXojjC4GRYQyFbnqnm4Z42GjxvrgWDheGARzPkI+KNEy+t059za
 nRwAv0LGHdW36RRTsV0LX8MBU7YPoqge1AvYvC22V+wRih8v3bzzdmGNG2sPRm+PwhjV
 vfDqIdn/vn0GT5kG4mM/RtUXwIR3NiRczADWhxlnVnx7kZjpmo7rCOqh54nxQrHZl//Z
 9RqLtVnqDaOmt8dED8fiYzspRLIjBTFLPQD+Naz6S8S/9cW4rRONEM1ZwC3n1UGpf9De
 oHzA==
X-Gm-Message-State: AOAM532wXO1UHIlA2Q/D25W1ohEuwKKWA/gIO/JnfINeOdmKK4w3LSUX
 bB2A7M8cSfEU3yQ7DFx5Gnr8egaW5UY=
X-Google-Smtp-Source: ABdhPJz2RpyItu9y8Ccm1T089InmGwgEgignEQif+TBZnfBLF+jkg8K6XyjokLR0NGFg+cnQEk+sCw==
X-Received: by 2002:a5d:53c6:: with SMTP id a6mr8605148wrw.180.1642678243793; 
 Thu, 20 Jan 2022 03:30:43 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 ay29sm1970895wmb.38.2022.01.20.03.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:30:43 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v3 5/7] drop libxml2 checks since libxml is not actually used
 (for parallels)
Date: Thu, 20 Jan 2022 12:30:14 +0100
Message-Id: <20220120113016.268265-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120113016.268265-1-f4bug@amsat.org>
References: <20220120113016.268265-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

For a long time, we assumed that libxml2 is neecessary for parallels
block format support (block/parallels*). However, this format actually
does not use libxml [*]. Since this is the only user of libxml2 in
while qemu tree, we can drop all libxml2 checks and dependencies too.

It is even more: --enable-parallels configure option was the only
option which was silently ignored when it's (fake) dependency
(libxml2) isn't installed.

Drop all mentions of libxml2.

[*] Actually the basis for libxml use were merged in commit 25bfd5a75
    but the implementation was never merged:
    https://lore.kernel.org/qemu-devel/70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org/

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
[PMD: Updated description and adapted to use lcitool]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build                                     | 6 ------
 block/meson.build                               | 3 +--
 meson_options.txt                               | 2 --
 scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
 scripts/coverity-scan/coverity-scan.docker      | 1 -
 scripts/coverity-scan/run-coverity-scan         | 2 +-
 6 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/meson.build b/meson.build
index 333c61deba7..64a146e1d06 100644
--- a/meson.build
+++ b/meson.build
@@ -449,11 +449,6 @@
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
@@ -3489,7 +3484,6 @@
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
-- 
2.34.1


