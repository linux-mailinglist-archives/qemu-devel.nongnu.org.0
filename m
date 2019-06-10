Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22F3B3FC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 13:25:03 +0200 (CEST)
Received: from localhost ([::1]:44580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haIQA-0006HM-W3
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 07:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43061)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1haIGd-00074O-Ij
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1haIGc-0000Wi-Bf
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:11 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1haIGc-0000UF-4Q
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:10 -0400
Received: by mail-wr1-x444.google.com with SMTP id n4so8771568wrs.3
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=ElZKCGuiZjv0T7oDmrIXGv2pOxAvcOLWWjOt4Xe9G90=;
 b=d3lQy6AW9hzOkwduoPZmT5mDb5MwZv7XIGUnTP7I43BJ5iOm77/Zxw9xS8N9lBgBJM
 /AHVxlxnTvCixGnYa+hxZ99vhiPeRXwDKvhs2tu23IHWPNrrjjszhiGO1yzdSAOcVz0N
 ubttsNLukYlT4HFjBgNk7Y1t2Am0kualo/Yu9Vt0hWWEXhd9JR6YX4mRn2BBxho+ptup
 7Da+lLNPuUUnwOfWhkJlYgYtJw1yocteXRnEZFvtCDgZKPhFZvAPQDogpeZMYKAzybWr
 ZcIEN1sVJIjd8uSgxG9fchiPaGjOX9/Egu3GgsWQa/DsHk4NqP9tK/XpBupHMYk4HLZl
 qT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=ElZKCGuiZjv0T7oDmrIXGv2pOxAvcOLWWjOt4Xe9G90=;
 b=QHldLZ2eiXDSkD7uCzX3hhospRWylNJbgBDeiJX3w/yf64j14faqg55ADqDUFw5lSi
 7gJCV3xBWpcQofGVJCKQ2lXmUYZNfGPg7LhXNXN58m4h74ZHqAUIKoB60QzQRqLRHUbP
 l6lYYkxdm+NN7B73Et5lOrMBi9FcGkQutZPeNQ0qktwnel7pySZs0E38BOx8+XHwXtlr
 TZapf3twbdti+sCIqehCusRauAemw0bdcgyrGZFHXHUmYAsfO528akrx1aiSyWktPEV/
 4IbGA+uvDci3YNPTL+MTpQQz71nXxvgXHVY7aD7AHflj1Qo//EFjwihGPBKIzz5QVFjF
 qbwg==
X-Gm-Message-State: APjAAAV/r3UJy8qDzFOgKugpB3JunzNhmM8h2B7Hd609S1sSQo68oyrU
 y2gVWGkmALZp6tvXp4Mv2CY98hUX
X-Google-Smtp-Source: APXvYqzl7MyzzUVZz2eH0I6jiJmkgbFV9oZYmQ1uOoDbZaP1H5ARpP7+Or75Jp8rWA0uzGob32rU2Q==
X-Received: by 2002:a5d:4e83:: with SMTP id e3mr11137394wru.263.1560165308741; 
 Mon, 10 Jun 2019 04:15:08 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id u13sm11934414wrq.62.2019.06.10.04.15.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 04:15:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 13:14:58 +0200
Message-Id: <1560165301-39026-5-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560165301-39026-1-git-send-email-pbonzini@redhat.com>
References: <1560165301-39026-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 4/7] libvhost-user: convert to Meson
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because libqemuutil.a is not converted yet, selected files have to be
compiled twice, once with Meson and once with Makefile.objs.  Apart
from this the conversion is straightforward.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                            | 10 ++++------
 Makefile.objs                       |  1 -
 contrib/libvhost-user/Makefile.objs |  1 -
 contrib/libvhost-user/meson.build   |  7 +++++++
 meson.build                         |  2 ++
 5 files changed, 13 insertions(+), 8 deletions(-)
 delete mode 100644 contrib/libvhost-user/Makefile.objs
 create mode 100644 contrib/libvhost-user/meson.build

diff --git a/Makefile b/Makefile
index b8f802c..6a3461e 100644
--- a/Makefile
+++ b/Makefile
@@ -426,7 +426,6 @@ dummy := $(call unnest-vars,, \
                 ivshmem-client-obj-y \
                 ivshmem-server-obj-y \
                 rdmacm-mux-obj-y \
-                libvhost-user-obj-y \
                 vhost-user-scsi-obj-y \
                 vhost-user-blk-obj-y \
                 vhost-user-input-obj-y \
@@ -529,7 +528,6 @@ Makefile: $(version-obj-y)
 # Build libraries
 
 libqemuutil.a: $(util-obj-y) $(trace-obj-y) $(stub-obj-y)
-libvhost-user.a: $(libvhost-user-obj-y) $(util-obj-y) $(stub-obj-y)
 
 ######################################################################
 
@@ -632,21 +630,21 @@ ivshmem-client$(EXESUF): $(ivshmem-client-obj-y) $(COMMON_LDADDS)
 ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
 endif
-vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) libvhost-user.a
+vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) contrib/libvhost-user/libvhost-user.a
 	$(call LINK, $^)
-vhost-user-blk$(EXESUF): $(vhost-user-blk-obj-y) libvhost-user.a
+vhost-user-blk$(EXESUF): $(vhost-user-blk-obj-y) contrib/libvhost-user/libvhost-user.a
 	$(call LINK, $^)
 
 rdmacm-mux$(EXESUF): LIBS += "-libumad"
 rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
 
-vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) $(libvhost-user-obj-y) libqemuutil.a libqemustub.a
+vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) contrib/libvhost-user/libvhost-user.a
 	$(call LINK, $^)
 
 ifdef CONFIG_VHOST_USER_INPUT
 ifdef CONFIG_LINUX
-vhost-user-input$(EXESUF): $(vhost-user-input-obj-y) libvhost-user.a libqemuutil.a
+vhost-user-input$(EXESUF): $(vhost-user-input-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
 
 # build by default, do not install
diff --git a/Makefile.objs b/Makefile.objs
index c8337fa..4f2fa6a 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -116,7 +116,6 @@ qga-vss-dll-obj-y = qga/
 elf2dmp-obj-y = contrib/elf2dmp/
 ivshmem-client-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-client/
 ivshmem-server-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-server/
-libvhost-user-obj-y = contrib/libvhost-user/
 vhost-user-scsi.o-cflags := $(LIBISCSI_CFLAGS)
 vhost-user-scsi.o-libs := $(LIBISCSI_LIBS)
 vhost-user-scsi-obj-y = contrib/vhost-user-scsi/
diff --git a/contrib/libvhost-user/Makefile.objs b/contrib/libvhost-user/Makefile.objs
deleted file mode 100644
index ef3778e..0000000
--- a/contrib/libvhost-user/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-libvhost-user-obj-y += libvhost-user.o libvhost-user-glib.o
diff --git a/contrib/libvhost-user/meson.build b/contrib/libvhost-user/meson.build
new file mode 100644
index 0000000..7ef610a
--- /dev/null
+++ b/contrib/libvhost-user/meson.build
@@ -0,0 +1,7 @@
+libvhost_user = static_library('vhost-user',
+               [files('libvhost-user.c', 'libvhost-user-glib.c'),
+                meson.source_root() / 'stubs/error-printf.c',
+                meson.source_root() / 'stubs/monitor.c',
+                meson.source_root() / 'util/error.c',
+                meson.source_root() / 'util/qemu-error.c',
+                meson.source_root() / 'util/memfd.c'])
diff --git a/meson.build b/meson.build
index b683d70..a6748f9 100644
--- a/meson.build
+++ b/meson.build
@@ -7,3 +7,5 @@ add_project_arguments(config_host['QEMU_CFLAGS'].split(),
                       language: 'c')
 add_project_arguments(config_host['QEMU_INCLUDES'].split(),
                       language: 'c')
+
+subdir('contrib/libvhost-user')
-- 
1.8.3.1



