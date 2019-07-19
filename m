Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4206E686
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 15:36:26 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoT3h-00033m-KH
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 09:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hoT3I-000252-Lj
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hoT3H-0007Z7-F2
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:36:00 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1hoT3H-0007YV-7L; Fri, 19 Jul 2019 09:35:59 -0400
Received: by mail-pf1-x441.google.com with SMTP id 19so14206352pfa.4;
 Fri, 19 Jul 2019 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qlyo3dCk5IgBiAF31m6kZYE7s+bKfa6dvhE/A9REX7I=;
 b=TIsxcVkZeqtSkRWuL76KqVWQ2Kc+iYDWhApUj2UD/1qBuI/T1NsIsElRbqio6kyew0
 835nQ5q/QW2HX+29pXS3yPDGyOr2zXmrSzKE4dS8HhrI59jjPjxSG8dSnLXI0PezaVXq
 nr3Su6tM5Tx9VNHawmaAflak6h7UNVplrTyNtLTjtJc9uJp0y/rL5KOKbUHSE5yUb9uY
 2mHex+gg5BDLbORTTijALCF1zIU65ueR9+qIHRCW6YL0bVYT9lZ1bCDArLTVOkXCdtSX
 V5yHvrQqWwNo3zpa/kYLT0S7mHnUocJ0QQsnZGuauzOsAw8Z8kVXMIp4aYnM8bDYmgoj
 ohbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qlyo3dCk5IgBiAF31m6kZYE7s+bKfa6dvhE/A9REX7I=;
 b=DbAdsnJ56mQ9YECryiTKc8tOzcdZlOiPr0TbIhxV48vD6RJ4BeeRzv02/iX6Yw/GfN
 Ekeu6LLjiEymRchdmB1vGdBFX5REQDTfcTBn4FkWnVlFYdiBYslBnWF0N4egdzdTWh3D
 p69wZE9XXjxfpTYq6np225CNpXzyyJybkndintry9Zcd51jF6YF3bGmNVSE+GFd5jgFo
 9fwMXHW1ymdD0eiFLodctgL/3yqrc+0X5n9GMpXh22r4gj6RTqjBF8H59aaJuuFdnfhR
 W44DgPcytsaCGLCr4jc2mCkXXxjmsMkGD0/B3efmfLC2zvRW+sTbs5Qtyl8/nzMbDDCU
 6BNg==
X-Gm-Message-State: APjAAAV8Sba34yx3GL/iZx/+UosxOX9EnhTVQFXyYB3emx7wpqd1upcm
 +Z6lr0FitUzFsn8xbzwQymwDn8FtdE0=
X-Google-Smtp-Source: APXvYqzn/s3RzvAocfbh4IPpwtKiOlUZ29hLVvMX/B3aCKcwufexLOdJj6gCEmpdyeW/oFgxLu/sFw==
X-Received: by 2002:a63:505a:: with SMTP id q26mr52764546pgl.18.1563543357747; 
 Fri, 19 Jul 2019 06:35:57 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:433:31a4:f2fb:dab8:3a89:c056])
 by smtp.gmail.com with ESMTPSA id 11sm31895369pfw.33.2019.07.19.06.35.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 06:35:57 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 19:05:17 +0530
Message-Id: <20190719133530.28688-2-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190719133530.28688-1-mehta.aaru20@gmail.com>
References: <20190719133530.28688-1-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v6 01/14] configure: permit use of io_uring
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
index eb635c3b9a..b0e2e2158e 100755
--- a/configure
+++ b/configure
@@ -370,6 +370,7 @@ xen=""
 xen_ctrl_version=""
 xen_pci_passthrough=""
 linux_aio=""
+linux_io_uring=""
 cap_ng=""
 attr=""
 libattr=""
@@ -1271,6 +1272,10 @@ for opt do
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
@@ -1789,6 +1794,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   vde             support for vde network
   netmap          support for netmap network
   linux-aio       Linux AIO support
+  linux-io-uring  Linux io_uring support
   cap-ng          libcap-ng support
   attr            attr and xattr support
   vhost-net       vhost-net kernel acceleration support
@@ -3969,6 +3975,21 @@ EOF
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
@@ -6392,6 +6413,7 @@ echo "PIE               $pie"
 echo "vde support       $vde"
 echo "netmap support    $netmap"
 echo "Linux AIO support $linux_aio"
+echo "Linux io_uring support $linux_io_uring"
 echo "ATTR/XATTR support $attr"
 echo "Install blobs     $blobs"
 echo "KVM support       $kvm"
@@ -6878,6 +6900,11 @@ fi
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


