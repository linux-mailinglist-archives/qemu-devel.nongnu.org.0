Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169986E658
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 15:28:31 +0200 (CEST)
Received: from localhost ([::1]:45280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoSw2-0005Bx-3f
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 09:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35607)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hoSvC-0001vM-EP
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:27:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hoSvB-00011v-8G
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:27:38 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36582)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1hoSvB-00010X-2i
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:27:37 -0400
Received: by mail-pg1-x542.google.com with SMTP id l21so14480419pgm.3
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oDnqH32U85mBdPXWotpEn0azhljqe4/V7Zd7VTgbzbw=;
 b=QNyU2Zg3CvXnHXFA9YWEGapLyjC0b6prRo/Hm5u/ENYhS5hrE1PpbAOGckFwR/cYO4
 D1onesc0+W35QekDt2fCvXyKcRFyvfLi+XixdykV+YefdiKxPS9yL0vafG9vrlDYhKc2
 Du0ZQ2e6nRXGwC19G605qvfWW1moRvIHyA/KNbe3xnfNguDZIJUJI7bw6+ybwXPaweyt
 Y2PuFUdrT9iuXXeKiLI6sU7dgET6ppFXNYfHkKcdoANubgT7xiS8uQUnehRKNgx20PDC
 ZrNKGVcpbg9pgHShWX3c7LEYxlJkm0YCw/7wqqfqryvv980JLovnqMxmVyRor3V0qdVQ
 4gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oDnqH32U85mBdPXWotpEn0azhljqe4/V7Zd7VTgbzbw=;
 b=SXO93eulvSTcEnpv3U8CADnkKIHSOr+WPeLDmJZu9EIFH/8IKFESZkUHBcc95VXhiw
 4ihLXXVjZKjZIjEyLv1poqfp41W8tPYLE/JYNj5hd7OgYjrAFSHQLNrgIiVbaQ0EGWpr
 wAqO2fyA+ouqdchSaV0gic4VztdlVkPXu50TRRyhrM8J5yPNWaqVjaRjagM0WPuNVFTu
 i1S6FqrM2IJT+uXQ5Ftu+BWoJJFlQGt8E9Wl8eAtK0pHl++oSTxdO83EECpOgf3n7UIM
 ktSnGD5SSp9djHU6ujK5V5Qzw9OtTHMO15hCQjtxdi3b0KqEjaeldM9kl4+E2YCB15F2
 J5mA==
X-Gm-Message-State: APjAAAX+DczSgFghGtO5wV6Lz1ryGAnyZrSXWSehp4NZ4R4LipMxkz2f
 I95yoowwnRVWScGI43YJhOkEwD/f
X-Google-Smtp-Source: APXvYqxJn90I3vCoYOehgBJ9vVt66craswwkPpocl5xcgdrWA7HotDnphB6l5MoS2ky1C75EuLfasg==
X-Received: by 2002:a17:90a:3ac2:: with SMTP id
 b60mr58595743pjc.74.1563542855787; 
 Fri, 19 Jul 2019 06:27:35 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:433:31a4:f2fb:dab8:3a89:c056])
 by smtp.gmail.com with ESMTPSA id s7sm26520357pjn.28.2019.07.19.06.27.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 06:27:35 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 18:57:07 +0530
Message-Id: <20190719132720.27519-2-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190719132720.27519-1-mehta.aaru20@gmail.com>
References: <20190719132720.27519-1-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
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


