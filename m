Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C9364AAA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 18:22:50 +0200 (CEST)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlFMn-0003Be-Qx
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 12:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55411)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hlFF4-00068U-6l
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 12:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hlFEy-0007bl-39
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 12:14:46 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37140)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hlFEv-0007Sm-8V
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 12:14:42 -0400
Received: by mail-wm1-x344.google.com with SMTP id f17so2875265wme.2
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eMj9sCghdLmXY/G42Fi7R4xA4WRieEP59eUIotUR6Ac=;
 b=igpTHkmJgR7Vya+GpEMq5Lt7/BfYCeMTNC08tKSGGYIrV/pfR/Yb5TkcDfqQszr965
 vtkESt+8PcXoLzJjnlN3s3az3rd0VRFl9Ix7Xvng0ePjxKgDTptJ49MMQs0vX92kcwkS
 WeFgMfYCwCSHECxeQ1nbVgEz7szvoVKGCkj6ZoDoTn/fqLO4Khp4ULTggLCMF/aVHhhQ
 qE6h9jY63oCCSTzXr4DtkiCnQ056t2giTs4M76QgHNzgtmUKHSqdE4Xh2B68vya40zRy
 i36ZVVPceR0W7PPfs/94Ef1XsC2ZHOjlTrGhyt7Fd7GxDP4CDhCfFWUSOIIE6PPfeu76
 OPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=eMj9sCghdLmXY/G42Fi7R4xA4WRieEP59eUIotUR6Ac=;
 b=J+k4emvj2cAyXbEIptg9d2ayBhrVMIbKxT1no6wau3F/yAgk3YaLe35pQPgeFlIs7C
 tnxjPOHb3i5Dmw9+lirheJ+NYTonPQxkZzQ641WYxESoL6D+M5dVTirim5Ta6sueg/RD
 cPplhFFyiw1KEuw4H4DvoKYiO+i8PoBtaKyAgJmWbJKax++iAYot+koMNSwxWQ76v3YK
 ZyaucEYmFs4L+ZYVT61UxtSw1jSf48I5g0PInQpIIiNjg7iamdycAVHBoVp0Ku60MByR
 OO9AYHkmwfts2rD9DojJ59D6mGLR2RfZnhT5GBVE517XabwivI7VE8HMfOfpQ5Rm0CuN
 rC0g==
X-Gm-Message-State: APjAAAVP8hgqc4n771s51MpkKfw4JId8zF5REHCImwYvV+pI7PSG+xSQ
 GygkJ8nGvJxiOUBiRCBw2lQobGHRlkE=
X-Google-Smtp-Source: APXvYqw1jbbErpqeN+Oz18asQ1xnPkIbE99twsTjgTUi2XUycLBuXMSr61QK7DDMmsWHxKA30sM7nA==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr6360477wma.90.1562775276827; 
 Wed, 10 Jul 2019 09:14:36 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id w14sm2573747wrk.44.2019.07.10.09.14.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 09:14:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Jul 2019 18:14:25 +0200
Message-Id: <1562775267-1222-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562775267-1222-1-git-send-email-pbonzini@redhat.com>
References: <1562775267-1222-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH 6/8] vhost-user-blk: convert to Meson
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GLib pkg-config information is extracted from config-host.mak and
used to link vhost-user-blk.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitignore                           | 2 +-
 Makefile                             | 3 ---
 Makefile.objs                        | 1 -
 configure                            | 2 ++
 contrib/vhost-user-blk/Makefile.objs | 1 -
 contrib/vhost-user-blk/meson.build   | 3 +++
 meson.build                          | 3 +++
 7 files changed, 9 insertions(+), 6 deletions(-)
 delete mode 100644 contrib/vhost-user-blk/Makefile.objs
 create mode 100644 contrib/vhost-user-blk/meson.build

diff --git a/.gitignore b/.gitignore
index 026dded..c39a02e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -64,7 +64,7 @@
 /module_block.h
 /scsi/qemu-pr-helper
 /vhost-user-scsi
-/vhost-user-blk
+/contrib/vhost-user-blk/vhost-user-blk
 /fsdev/virtfs-proxy-helper
 *.tmp
 *.[1-9]
diff --git a/Makefile b/Makefile
index 3763d8c..da60ec5 100644
--- a/Makefile
+++ b/Makefile
@@ -324,7 +324,6 @@ dummy := $(call unnest-vars,, \
                 ivshmem-server-obj-y \
                 rdmacm-mux-obj-y \
                 vhost-user-scsi-obj-y \
-                vhost-user-blk-obj-y \
                 vhost-user-input-obj-y \
                 vhost-user-gpu-obj-y \
                 qga-vss-dll-obj-y \
@@ -513,8 +512,6 @@ ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
 endif
 vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
-vhost-user-blk$(EXESUF): $(vhost-user-blk-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
-	$(call LINK, $^)
 
 rdmacm-mux$(EXESUF): LIBS += "-libumad"
 rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
diff --git a/Makefile.objs b/Makefile.objs
index 0bcba93..b192250 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -117,7 +117,6 @@ ivshmem-server-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-server/
 vhost-user-scsi.o-cflags := $(LIBISCSI_CFLAGS)
 vhost-user-scsi.o-libs := $(LIBISCSI_LIBS)
 vhost-user-scsi-obj-y = contrib/vhost-user-scsi/
-vhost-user-blk-obj-y = contrib/vhost-user-blk/
 rdmacm-mux-obj-y = contrib/rdmacm-mux/
 vhost-user-input-obj-y = contrib/vhost-user-input/
 vhost-user-gpu-obj-y = contrib/vhost-user-gpu/
diff --git a/configure b/configure
index dfd603c..25138c3 100755
--- a/configure
+++ b/configure
@@ -7347,6 +7347,8 @@ echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_INCLUDES=$QEMU_INCLUDES" >> $config_host_mak
+echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
+echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 if test "$sparse" = "yes" ; then
   echo "CC           := REAL_CC=\"\$(CC)\" cgcc"       >> $config_host_mak
   echo "CPP          := REAL_CC=\"\$(CPP)\" cgcc"      >> $config_host_mak
diff --git a/contrib/vhost-user-blk/Makefile.objs b/contrib/vhost-user-blk/Makefile.objs
deleted file mode 100644
index 72e2cdc..0000000
--- a/contrib/vhost-user-blk/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-vhost-user-blk-obj-y = vhost-user-blk.o
diff --git a/contrib/vhost-user-blk/meson.build b/contrib/vhost-user-blk/meson.build
new file mode 100644
index 0000000..b9a593e
--- /dev/null
+++ b/contrib/vhost-user-blk/meson.build
@@ -0,0 +1,3 @@
+executable('vhost-user-blk', files('vhost-user-blk.c'),
+           link_with: [libvhost_user, libqemuutil],
+           dependencies: glib)
diff --git a/meson.build b/meson.build
index a0a8554..cee759b 100644
--- a/meson.build
+++ b/meson.build
@@ -13,6 +13,8 @@ configure_file(input: files('scripts/ninjatool.py'),
                output: 'ninjatool',
                configuration: config_host)
 
+glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
+                          link_args: config_host['GLIB_LIBS'].split())
 slirp = declare_dependency(compile_args: config_host['SLIRP_CFLAGS'].split(),
                            link_args: config_host['SLIRP_LIBS'].split())
 
@@ -144,3 +146,4 @@ libqemuutil = static_library('qemuutil',
 # Other build targets
 
 subdir('contrib/libvhost-user')
+subdir('contrib/vhost-user-blk')
-- 
1.8.3.1



