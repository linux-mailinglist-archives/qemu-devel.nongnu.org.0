Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E328716C0E8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:36:10 +0100 (CET)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZRZ-00060j-UH
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j6Z8i-0002LF-L5
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:16:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j6Z8e-00019d-TU
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:16:40 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:37557)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j6Z8e-00017K-KV; Tue, 25 Feb 2020 07:16:36 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWz4j-1ivO5B1Ckj-00XMhb; Tue, 25 Feb 2020 13:16:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/21] linux-user: introduce parameters to generate
 syscall_nr.h
Date: Tue, 25 Feb 2020 13:15:33 +0100
Message-Id: <20200225121553.2191597-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225121553.2191597-1-laurent@vivier.eu>
References: <20200225121553.2191597-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QSCc3TddwX3lly3KukqNvrBIJJMeoEt8mHTWB41vO9P0kwdnTaD
 Rvof5GsoqtLMH+SEyfnfiuvB34iTpsNM056PQS6yOO1HmhkMf8NQCkmmpCRxvoyavaov7Z8
 7xWkdl7DzyxdhMgd3T3LbuNz+Bbjqu5XCk4VX2En8yo3phvFIXrNPg7WDbSI5Ggs2SuPJn0
 cKy8QyvaOVZVzx3phcRtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:40Go5ricSUU=:QUO7WR3fuGWny/tHWAbbLI
 GM6/ZXaemgvDoGi2NXfaMeuVfmE027ZRXlrZ+41FetwkKeNjGmpVkdUZPfB8D8HQB+xifB7GR
 G+JtIC1j+z+NHFaoZlSs4pFBnTJa3zOc+78WoUbErNLGWLPwvUF3qi9I9M3VrVJJtindxRYXR
 /kdv0Z9BDvK3TawWbWfG/7JYRcNG9IQ2tKr6RmDpAOK24rkb2JOBBukKZKu/AS9mLKBM9Bis0
 J3WBDx9W+8YXVBX10AOtdKLhZ4TKtJiKlQPdixAhP+pmaZ+clXQIjFxhkDJGlLlR6hMh23cGk
 dKnecA1yQgmRYBjcgFXSsBzh4wzEL8FdoftDs+iP2TvpDzaJvdw3hk2bvLmjfPM22f3aPsFfT
 pqH6gpxifZNThhxfZGth0/EevEPRSfNTRjrITS99zZrRsY4B72BaEr4asxSX4XsXrB1mdnhRH
 W7acoQcrwvGLyn9Mrrx9Kj5upCpFuQeg+OzQfQGIBeQf5m9e+BUJsbLfTZk8H93N37ywOoKUA
 6odt7bVL7VzVXQLuTb/pBhgegcLJMat+nZ/hPqw+lt1Hb8GZadFDyQIm+X84iTIfJHh584fUe
 KjMa+8qRBn/Qh0seHFUDi1j4VXz92Qt3ZcSezPlgOrns+mkhamC6bnF4XyfUaFIENqFcLQyqH
 sa1O68HZckuF5SpkHre+6dXzd7zJ4J/gqkDkoM3wpvvB5BBIC+DX6G1FHKDkyy3k0ozlZA0oS
 IqLnyY3rfhn91O5UlQ7gXsw9ljpnsFj4Vh+6gFiZVWKQzBEwCFWYP6ucDRpnVQ55//gRRWaTB
 zebYyvJDHo0voQkMbNiVghqxYbUrnT/AG/HMjVZsTmpEOgr+azT6wHNzrBCn9mey62WO+fD
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used when we'll import syscall.tbl from the kernel

Add a script to remove all the dependencies to syscall_nr.h
that point to source directory and not to the build directory.
The list of arch will be update while the generated files are added.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 Makefile.target |  3 ++-
 configure       | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Makefile.target b/Makefile.target
index 6e61f607b14a..9babf2643e0b 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -128,7 +128,8 @@ ifdef CONFIG_LINUX_USER
 
 QEMU_CFLAGS+=-I$(SRC_PATH)/linux-user/$(TARGET_ABI_DIR) \
              -I$(SRC_PATH)/linux-user/host/$(ARCH) \
-             -I$(SRC_PATH)/linux-user
+             -I$(SRC_PATH)/linux-user \
+             -Ilinux-user/$(TARGET_ABI_DIR)
 
 obj-y += linux-user/
 obj-y += gdbstub.o thunk.o
diff --git a/configure b/configure
index d57261e3ad0c..c94161ced84f 100755
--- a/configure
+++ b/configure
@@ -1855,6 +1855,17 @@ fi
 # Remove old dependency files to make sure that they get properly regenerated
 rm -f */config-devices.mak.d
 
+# Remove syscall_nr.h to be sure they will be regenerated in the build
+# directory, not in the source directory
+for arch in ; do
+    # remove the file if it has been generated in the source directory
+    rm -f "${source_path}/linux-user/${arch}/syscall_nr.h"
+    # remove the dependency files
+    find . -name "*.d" \
+           -exec grep -q "${source_path}/linux-user/${arch}/syscall_nr.h" {} \; \
+           -exec rm {} \;
+done
+
 if test -z "$python"
 then
     error_exit "Python not found. Use --python=/path/to/python"
@@ -7849,6 +7860,9 @@ echo "TARGET_ABI_DIR=$TARGET_ABI_DIR" >> $config_target_mak
 if [ "$HOST_VARIANT_DIR" != "" ]; then
     echo "HOST_VARIANT_DIR=$HOST_VARIANT_DIR" >> $config_target_mak
 fi
+if [ "$TARGET_SYSTBL_ABI" != "" ]; then
+    echo "TARGET_SYSTBL_ABI=$TARGET_SYSTBL_ABI" >> $config_target_mak
+fi
 
 if supported_xen_target $target; then
     echo "CONFIG_XEN=y" >> $config_target_mak
-- 
2.24.1


