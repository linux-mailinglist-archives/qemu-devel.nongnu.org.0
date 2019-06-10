Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3735B3B3F0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 13:22:35 +0200 (CEST)
Received: from localhost ([::1]:44566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haINk-00045e-KP
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 07:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1haIGa-00071t-OT
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1haIGZ-0000R5-JO
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:08 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35097)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1haIGZ-0000Q7-CR
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:07 -0400
Received: by mail-wr1-x443.google.com with SMTP id m3so8771252wrv.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=1omRPDRi7iCVPq5GB5WX2fT+eVVyp3BW8K0GbfnTaX8=;
 b=Ge8VqP9EoqailoiM5YlJbaNRMZz5BSRZMEK3HU0RJIdeplbQVbbvxMr3fYHG0a+/ZK
 uBvLk06WNFu6Pmd86zL7SzMmeoFdlh9syLFUuZCZH9/C6DVet2NU1tfu6/bnY/88OMQz
 jTFQ1PYZzg9PWdn+mYpYJ8ca6BUtg5ho3oU0YiJDVk65AL4zu6FfmZbJuq/3kac6K8Wh
 S1zIesIFjhvp1vF68mPZHrlAT2WCGRqc5KYAjmooahKj2nKcVpD1syMIVJvefvLlrWW4
 PRpTQ6u7bDVEtvrkEh9DtmTq88yt00Mav2MgnSiiKwDEvRQLCZ/ZGTOQ7bhFEwnzi5U6
 nU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=1omRPDRi7iCVPq5GB5WX2fT+eVVyp3BW8K0GbfnTaX8=;
 b=XV31UPpX24yLXuy4umfZC1/OXNzmU2cB19+Q718pL0iSO36AWBy395hunKodLu3CrZ
 tEJ/gAjP7i/0prullxxM8kD7L4cOZVfmtP0MaYCVU3G702R2xU3kmpufQYUexvbZUd1b
 40oN/Dp4ozvCWvUDfDIVonuf8f8cFxR6oBH6i5uMwFE7FvyF1DRRzqGSwAwSKFHWBhwA
 J5xaOVkuPTosDEE/UhBIH7phAcMKGSh+mpikacVSM8dPAY9a6smpfgwWYVTFmG3FtA0S
 p7Q9koJZdKEJRLvAOsU+AjVDBsQnHrOQZjZhpk40imQpFmEu/snOUltItxjiHbfOKcDl
 EXxw==
X-Gm-Message-State: APjAAAXqgajKHz4AWdEWyezujc+r6/0VPFrnPCYETp/WtSOyJWgW35S/
 bXnavsY7a8aXZoKQGHBiUi55y70D
X-Google-Smtp-Source: APXvYqypX8uI75F1/mPNi8c5XmVKBIe/R9Jzl3n4Co8pwLMRSgt3ur0lKl66TOp7WY9/aadigcmang==
X-Received: by 2002:a5d:51cb:: with SMTP id n11mr5149562wrv.143.1560165305921; 
 Mon, 10 Jun 2019 04:15:05 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id u13sm11934414wrq.62.2019.06.10.04.15.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 04:15:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 13:14:55 +0200
Message-Id: <1560165301-39026-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560165301-39026-1-git-send-email-pbonzini@redhat.com>
References: <1560165301-39026-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH 1/7] configure: do not include $(...) variables
 in config-host.mak
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

This ensures that Meson will be able to reuse the results of
the tests that are performed in the configure script.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index 6cdcfb2..203dece 100755
--- a/configure
+++ b/configure
@@ -597,7 +597,7 @@ QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv -std=gnu99 $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wall -Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
-QEMU_INCLUDES="-iquote . -iquote \$(SRC_PATH) -iquote \$(SRC_PATH)/accel/tcg -iquote \$(SRC_PATH)/include"
+QEMU_INCLUDES="-iquote . -iquote ${source_path} -iquote ${source_path}/accel/tcg -iquote ${source_path}/include"
 if test "$debug_info" = "yes"; then
     CFLAGS="-g $CFLAGS"
     LDFLAGS="-g $LDFLAGS"
@@ -896,7 +896,7 @@ Linux)
   linux="yes"
   linux_user="yes"
   kvm="yes"
-  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers -I$PWD/linux-headers $QEMU_INCLUDES"
+  QEMU_INCLUDES="-I${source_path}/linux-headers -I$PWD/linux-headers $QEMU_INCLUDES"
   supported_os="yes"
   libudev="yes"
 ;;
@@ -4090,8 +4090,8 @@ EOF
               symlink "$source_path/dtc/Makefile" "dtc/Makefile"
               symlink "$source_path/dtc/scripts" "dtc/scripts"
           fi
-          fdt_cflags="-I\$(SRC_PATH)/dtc/libfdt"
-          fdt_ldflags="-L\$(BUILD_DIR)/dtc/libfdt"
+          fdt_cflags="-I${source_path}/dtc/libfdt"
+          fdt_ldflags="-L$PWD/dtc/libfdt"
           fdt_libs="$fdt_libs"
       elif test "$fdt" = "yes" ; then
           # Not a git build & no libfdt found, prompt for system install
@@ -5040,13 +5040,13 @@ case "$capstone" in
       git_submodules="${git_submodules} capstone"
     fi
     mkdir -p capstone
-    QEMU_CFLAGS="$QEMU_CFLAGS -I\$(SRC_PATH)/capstone/include"
+    QEMU_CFLAGS="$QEMU_CFLAGS -I${source_path}/capstone/include"
     if test "$mingw32" = "yes"; then
       LIBCAPSTONE=capstone.lib
     else
       LIBCAPSTONE=libcapstone.a
     fi
-    LIBS="-L\$(BUILD_DIR)/capstone -lcapstone $LIBS"
+    LIBS="-L$PWD/capstone -lcapstone $LIBS"
     ;;
 
   system)
@@ -5951,8 +5951,8 @@ case "$slirp" in
       git_submodules="${git_submodules} slirp"
     fi
     mkdir -p slirp
-    slirp_cflags="-I\$(SRC_PATH)/slirp/src -I\$(BUILD_DIR)/slirp/src"
-    slirp_libs="-L\$(BUILD_DIR)/slirp -lslirp"
+    slirp_cflags="-I${source_path}/slirp/src -I$PWD/slirp/src"
+    slirp_libs="-L$PWD/slirp -lslirp"
     ;;
 
   system)
@@ -7307,21 +7307,21 @@ if test "$sheepdog" = "yes" ; then
 fi
 
 if test "$tcg_interpreter" = "yes"; then
-  QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/tci $QEMU_INCLUDES"
+  QEMU_INCLUDES="-iquote ${source_path}/tcg/tci $QEMU_INCLUDES"
 elif test "$ARCH" = "sparc64" ; then
-  QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/sparc $QEMU_INCLUDES"
+  QEMU_INCLUDES="-iquote ${source_path}/tcg/sparc $QEMU_INCLUDES"
 elif test "$ARCH" = "s390x" ; then
-  QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/s390 $QEMU_INCLUDES"
+  QEMU_INCLUDES="-iquote ${source_path}/tcg/s390 $QEMU_INCLUDES"
 elif test "$ARCH" = "x86_64" || test "$ARCH" = "x32" ; then
-  QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/i386 $QEMU_INCLUDES"
+  QEMU_INCLUDES="-iquote ${source_path}/tcg/i386 $QEMU_INCLUDES"
 elif test "$ARCH" = "ppc64" ; then
-  QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/ppc $QEMU_INCLUDES"
+  QEMU_INCLUDES="-iquote ${source_path}/tcg/ppc $QEMU_INCLUDES"
 elif test "$ARCH" = "riscv32" || test "$ARCH" = "riscv64" ; then
-  QEMU_INCLUDES="-I\$(SRC_PATH)/tcg/riscv $QEMU_INCLUDES"
+  QEMU_INCLUDES="-I${source_path}/tcg/riscv $QEMU_INCLUDES"
 else
-  QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
+  QEMU_INCLUDES="-iquote ${source_path}/tcg/\$(ARCH) $QEMU_INCLUDES"
 fi
-QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg $QEMU_INCLUDES"
+QEMU_INCLUDES="-iquote ${source_path}/tcg $QEMU_INCLUDES"
 
 echo "TOOLS=$tools" >> $config_host_mak
 echo "ROMS=$roms" >> $config_host_mak
-- 
1.8.3.1



