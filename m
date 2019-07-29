Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3378F19
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 17:23:47 +0200 (CEST)
Received: from localhost ([::1]:53736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs7V5-0001eh-4w
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 11:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43493)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hs7P8-0006DB-Eh
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:17:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hs7P7-0006nA-Dm
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:17:38 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45803)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1hs7P7-0006ls-7N; Mon, 29 Jul 2019 11:17:37 -0400
Received: by mail-pf1-x443.google.com with SMTP id r1so28193024pfq.12;
 Mon, 29 Jul 2019 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbXKSdV5tn5FcTOHM2GayIdaoxtdtsUeiXsLP0/PfEA=;
 b=FaYq2WWRYuMymDWVl/iaKLoUG5kdYOHO0tzuCxEWNmJPXN1nY2E9G/GCh34gFPVUVH
 MV33u+ilM/fgIoagP7dhj49A0J1XAd4SacNByTPJstIPzqrwHyQ9ieDQZL41N1tzNafY
 8rZEChyR1WTMxfLvK1tPLjG14l3P9J1BEwCNlRgi2L6kChHiuduQmaQTua5Km2OZbQoY
 IOu50MBDxL2JnfxxxJZMJdbbapxpQz/gIShwBRoYXkCBP5eIcPYVe0GpkcbCjAk0xPra
 qL7KIfLyl4mBUMlTtxfdjScXs4SFh/3d9Xv5dd13hNyJgjl/jM8yXah1uLSUBgk3VWU6
 YMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbXKSdV5tn5FcTOHM2GayIdaoxtdtsUeiXsLP0/PfEA=;
 b=SQLMG1aLDj1ax6Jnv7mW4RK79/Q+xwh4xMqSmShJOE29xeYiUVh0pMq5p963tE+VvS
 6x2KDNwY8aKQB4mlw89LHHlc/azkROhOq72Jw10f27ivBR07VQ5dyKAWjElhIZiW0a3n
 xhpQrO7iOShVUATNElaLu6DzOuPjEBb0fENujrvFQJFdJpChPfBH5t5ySUbHNfz8cjrb
 NqHkBEtF05KfhgqsDfyBCehM2eX9qbndPbaRgLfSorO2VqbmmukCmqduIWOoGxroCzRM
 HadSpZ2u6Upf3OC8IZw0+d3vbmgGZlEraT+O8ZT0aArG1+QTLFNolcq8MSWrfGaxRAIG
 Jaiw==
X-Gm-Message-State: APjAAAUnoC3U4R2YLRYgGwpEwcXMfoWZC4sMEOVj0qkuxAdcJqF5MsnK
 ztU9FK5DUbT2ap7CF1gwBvVbJWnMQmjXfQ==
X-Google-Smtp-Source: APXvYqzYLM3VoeH98v4I54eB4N9PUQZDfHBJOWHTvzgWRxVM48cRbWLKC7gNFsntw1MyXOeoVdLd/w==
X-Received: by 2002:a17:90a:1c17:: with SMTP id
 s23mr113243093pjs.108.1564413455755; 
 Mon, 29 Jul 2019 08:17:35 -0700 (PDT)
Received: from localhost.localdomain ([136.233.9.97])
 by smtp.gmail.com with ESMTPSA id h129sm58693941pfb.110.2019.07.29.08.17.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 08:17:35 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 20:46:37 +0530
Message-Id: <20190729151651.21306-2-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190729151651.21306-1-mehta.aaru20@gmail.com>
References: <20190729151651.21306-1-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH v7 01/15] configure: permit use of io_uring
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 saket.sinha89@gmail.com, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefan@redhat.com>, Julia Suvorova <jusual@mail.ru>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 configure | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/configure b/configure
index 714e7fb6a1..493dbc2ec5 100755
--- a/configure
+++ b/configure
@@ -371,6 +371,7 @@ xen=""
 xen_ctrl_version=""
 xen_pci_passthrough=""
 linux_aio=""
+linux_io_uring=""
 cap_ng=""
 attr=""
 libattr=""
@@ -1272,6 +1273,10 @@ for opt do
   ;;
   --enable-linux-aio) linux_aio="yes"
   ;;
+  --disable-linux-io-uring) linux_io_uring="no"
+  ;;
+  --enable-linux-io-uring) linux_io_uring="yes"
+  ;;
   --disable-attr) attr="no"
   ;;
   --enable-attr) attr="yes"
@@ -1790,6 +1795,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   vde             support for vde network
   netmap          support for netmap network
   linux-aio       Linux AIO support
+  linux-io-uring  Linux io_uring support
   cap-ng          libcap-ng support
   attr            attr and xattr support
   vhost-net       vhost-net kernel acceleration support
@@ -3975,6 +3981,21 @@ EOF
     linux_aio=no
   fi
 fi
+##########################################
+# linux-io-uring probe
+
+if test "$linux_io_uring" != "no" ; then
+  if $pkg_config liburing; then
+    linux_io_uring_cflags=$($pkg_config --cflags liburing)
+    linux_io_uring_libs=$($pkg_config --libs liburing)
+    linux_io_uring=yes
+  else
+    if test "$linux_io_uring" = "yes" ; then
+      feature_not_found "linux io_uring" "Install liburing devel"
+    fi
+    linux_io_uring=no
+  fi
+fi
 
 ##########################################
 # TPM emulation is only on POSIX
@@ -6398,6 +6419,7 @@ echo "PIE               $pie"
 echo "vde support       $vde"
 echo "netmap support    $netmap"
 echo "Linux AIO support $linux_aio"
+echo "Linux io_uring support $linux_io_uring"
 echo "ATTR/XATTR support $attr"
 echo "Install blobs     $blobs"
 echo "KVM support       $kvm"
@@ -6885,6 +6907,11 @@ fi
 if test "$linux_aio" = "yes" ; then
   echo "CONFIG_LINUX_AIO=y" >> $config_host_mak
 fi
+if test "$linux_io_uring" = "yes" ; then
+  echo "CONFIG_LINUX_IO_URING=y" >> $config_host_mak
+  echo "LINUX_IO_URING_CFLAGS=$linux_io_uring_cflags" >> $config_host_mak
+  echo "LINUX_IO_URING_LIBS=$linux_io_uring_libs" >> $config_host_mak
+fi
 if test "$attr" = "yes" ; then
   echo "CONFIG_ATTR=y" >> $config_host_mak
 fi
-- 
2.21.0


