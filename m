Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99417E67D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 01:43:10 +0200 (CEST)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htKj0-0006k5-5r
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 19:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60004)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1htKh6-0005BD-St
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 19:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1htKh5-0002SE-Q5
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 19:41:12 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35401)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1htKh5-0002Rn-JW; Thu, 01 Aug 2019 19:41:11 -0400
Received: by mail-pg1-x543.google.com with SMTP id s1so28749396pgr.2;
 Thu, 01 Aug 2019 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbXKSdV5tn5FcTOHM2GayIdaoxtdtsUeiXsLP0/PfEA=;
 b=XcXPW8Y3cwkYwf8ls0CKEcz3q1LG1Wb84wXqMaBg9HsqpKStZy154RzAEXgl/VHa+g
 cZIWffMKlBmrDwS7aa0iy1kMYYkcplqFsa4nmgTLM8wVgTsG0IInqy1h7P1MEfCCwznS
 v+mhO4RVlj1593/pNThaffWHDokk1s9CANQ7XoB7XIvGO6gR51h77/f3Tn1BWpxH7FN3
 t1JERqqPF0lGujhePRHTo5FTxZOmQIhQ2q3lvfGRrHor5LyMVJdAwRZ+ryHoOhBKF/kc
 FyqhA5yFAF6oDXHn4c64qC9ZOzRvn9W8baf6Y8WJjY+e2O9CWsL/XYWhfYiIRlXsNrlN
 QmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbXKSdV5tn5FcTOHM2GayIdaoxtdtsUeiXsLP0/PfEA=;
 b=UspJq+3GjOqGIZPdGK3f6/2aXEfW2sHLejGAp22UA4mwfs9lrpQyOjDNC7txUrfyX2
 SWESFVsM4/Oclj/vZAj5LzwH7r9jsCoan7hYsxxyzw4XluwqNxtIjHAvmC878IH//2mF
 K9un9zxnVh1GhjSc2gupZWtYfm/0IHPG6SmHAMBKbraw/GwDEdwN0yhhdqeque1BejGD
 w4NXa/rbzTTU8mt0fzY6KXB78h5jzY7UJ12ck22kNRs6Ca/kkfum4iXCExn7po+7m4P8
 6veMP0jAR+rLf5RN9R7H5MVgmpcMwf/ecTPih0RRhPIa2JAkFAVnAgaw//EajiqJWuqG
 JZkA==
X-Gm-Message-State: APjAAAUWfeyAE3Bx05SLh2qAivIjyRFS/3CDjzwIw726EBQDhUkgiUSX
 17zIEPdo/jTcVSC4KbVUUsv4Y7MKWNv9Ag==
X-Google-Smtp-Source: APXvYqwTi0qOhhC8naDCx1QJ2LHXpCkNuSh0hRzvuqIqND4XsMKJROjj/m1FZ0RExzHbXK/Gr2JZtw==
X-Received: by 2002:a62:7d13:: with SMTP id y19mr56342938pfc.62.1564702869685; 
 Thu, 01 Aug 2019 16:41:09 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:572:3de5:765:cb16:92cd:ee3e])
 by smtp.gmail.com with ESMTPSA id
 g18sm117975426pgm.9.2019.08.01.16.41.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 16:41:09 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 05:10:15 +0530
Message-Id: <20190801234031.29561-2-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190801234031.29561-1-mehta.aaru20@gmail.com>
References: <20190801234031.29561-1-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH v9 01/17] configure: permit use of io_uring
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 saket.sinha89@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
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


