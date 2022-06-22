Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D4D554BD0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 15:52:45 +0200 (CEST)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o40mi-000783-Q4
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o40i4-0004KO-Pc
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 09:47:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o40i1-0007Vj-7H
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 09:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655905672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yeGDow+8EVhQawKYaDDy5JAqCFmtRtZztZWE2S3CuuI=;
 b=azzezhkQJOfBiI8KG3GzKTlL4RzVKx5L5cm4uyAKcG7RIQ7w6JbnkDjMSiapmrN4BluqSo
 uRbFMR5+k0KmIUifOOPpSWm58Io8iQTmKn6SkuRzYoiNm8fTQi4U0WrhQCNESqKOXh4d08
 yPLhzvXvOPPy6URXt0ziIXeV4VhMguc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-DQsfFY24N5KGu_3CcFiMgw-1; Wed, 22 Jun 2022 09:47:50 -0400
X-MC-Unique: DQsfFY24N5KGu_3CcFiMgw-1
Received: by mail-ej1-f72.google.com with SMTP id
 oz40-20020a1709077da800b00722ef1e93bdso1089175ejc.17
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 06:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yeGDow+8EVhQawKYaDDy5JAqCFmtRtZztZWE2S3CuuI=;
 b=j/h17oXmobCoSR+AHtVWJNRRebegu7ZaxIIRwgouTczr4/SzmY/pNu0qrVD756Q3pU
 StZGk7A5zQlkBWkgadqOPIjuSiFHs9cw/cqW+kFQRZ+ifb3FmcRdf/Ir6/z583q8nw8j
 m3JoRX62hqYBmPGCPCE2cVev/3QyM2EI1+UmaiPbbTHm9e3MnD684LCGzCjKPj5h23Zo
 95CS8DhfeupDYpc/X7FZpwDVbGgQthdguTdAKy5jMFBrJo02htHofiyJAEaTDBMBIj7T
 Gh6FR34LQgBCTBV1Dh82WBxF340y3yMPc183ouclNJ1QpFd/aWv7glnWlN+nVES51/OH
 +Zsg==
X-Gm-Message-State: AJIora8KK5VwO3dWU3McdqHGxhei/r55WwSPJiHpByXp9BJ3uW3WJ81b
 PJno6c2ZtJ2j+iFXqPQsAeDhdBF/qxsnIXeSlyCBp5G6iKkt6BxrFe+iwBy1cN4vOIhEIkzypGZ
 0L+zEEIUbrYjCJ7t/E1biRWQ6CrPfhPHEzs6NP9mblsNRq7QYoGxD8CRN2Qj/l4/JZDw=
X-Received: by 2002:a05:6402:e83:b0:435:a9bd:8134 with SMTP id
 h3-20020a0564020e8300b00435a9bd8134mr4124780eda.243.1655905668765; 
 Wed, 22 Jun 2022 06:47:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ssxYB4g6h/RtUwRvA/4DgGfu4xwDkFqigExnD34HD/ZumvibXQeRKjKWExnNFODv1pF36tKg==
X-Received: by 2002:a05:6402:e83:b0:435:a9bd:8134 with SMTP id
 h3-20020a0564020e8300b00435a9bd8134mr4124751eda.243.1655905668480; 
 Wed, 22 Jun 2022 06:47:48 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 os6-20020a170906af6600b007101f6f0720sm9172350ejb.120.2022.06.22.06.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 06:47:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 alex.bennee@linaro.org
Subject: [PATCH 2/2] build: try both native and cross compilers for linux-user
 tests
Date: Wed, 22 Jun 2022 15:47:42 +0200
Message-Id: <20220622134742.139306-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622134742.139306-1-pbonzini@redhat.com>
References: <20220622134742.139306-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Configure is trying to fall back on cross compilers for targets that
can have bi-arch or bi-endian toolchains, but there are many corner
cases where just checking the name can go wrong.  For example, the RHEL
ppc64le compiler is bi-arch and bi-endian, but multilibs are disabled.
Therefore it cannot be used to build 32-bit hosted binaries like the
linux-user TCG tests.

Trying the cross compiler first also does not work, and an example for
this is also ppc64le.  The powerpc64-linux-gnu-gcc binary from the
cross-gcc package is theoretically multilib-friendly, but it cannot
find the CRT files on a ppc64le host, because they are not in the .../le
multilib subdirectory.

This can be fixed by testing both the native compiler and the cross
compiler, and proceeding with the first one that works.  To do this,
move the compiler usability check from the tests/tcg snippet to inside
probe_target_compiler and, while at it, restrict it to just the user-mode
emulation tests; if a compiler is not able to build nostdlib freestanding
binaries the installation is broken.
---
 configure | 166 ++++++++++++++++++++++++++++++++----------------------
 1 file changed, 100 insertions(+), 66 deletions(-)

diff --git a/configure b/configure
index 0fd2838e82..e719afb80b 100755
--- a/configure
+++ b/configure
@@ -1868,6 +1868,7 @@ fi
 : ${cross_cc_cflags_x86_64="-m64"}
 
 compute_target_variable() {
+  eval "$2="
   if eval test -n "\"\${cross_prefix_$1}\""; then
     if eval has "\"\${cross_prefix_$1}\$3\""; then
       eval "$2=\"\${cross_prefix_$1}\$3\""
@@ -1875,8 +1876,21 @@ compute_target_variable() {
   fi
 }
 
+# probe_target_compiler TARGET TEST-PROGRAM
+#
+# Look for a compiler for the given target, either native or cross.
+# Set variables target_* if a compiler is found, and container_cross_*
+# if a Docker-based cross-compiler image is known for the target.
+# Set got_cross_cc to yes/no depending on whether a non-container-based
+# compiler was found.
+#
+# If TEST-PROGRAM is present, use it to test the usability of the
+# compiler, and also set build_static to "y" if static linking is
+# possible.
+#
 probe_target_compiler() {
   # reset all output variables
+  got_cross_cc=no
   container_image=
   container_hosts=
   container_cross_cc=
@@ -1887,14 +1901,6 @@ probe_target_compiler() {
   container_cross_objcopy=
   container_cross_ranlib=
   container_cross_strip=
-  target_cc=
-  target_ar=
-  target_as=
-  target_ld=
-  target_nm=
-  target_objcopy=
-  target_ranlib=
-  target_strip=
 
   case $1 in
     aarch64) container_hosts="x86_64 aarch64" ;;
@@ -2041,22 +2047,8 @@ probe_target_compiler() {
     : ${container_cross_strip:=${container_cross_prefix}strip}
   done
 
-  eval "target_cflags=\${cross_cc_cflags_$1}"
-  if eval test -n "\"\${cross_cc_$1}\""; then
-    if eval has "\"\${cross_cc_$1}\""; then
-      eval "target_cc=\"\${cross_cc_$1}\""
-    fi
-  else
-    compute_target_variable $1 target_cc gcc
-  fi
-  target_ccas=$target_cc
-  compute_target_variable $1 target_ar ar
-  compute_target_variable $1 target_as as
-  compute_target_variable $1 target_ld ld
-  compute_target_variable $1 target_nm nm
-  compute_target_variable $1 target_objcopy objcopy
-  compute_target_variable $1 target_ranlib ranlib
-  compute_target_variable $1 target_strip strip
+  local t try
+  try=cross
   case "$1:$cpu" in
     aarch64_be:aarch64 | \
     armeb:arm | \
@@ -2065,27 +2057,89 @@ probe_target_compiler() {
     ppc*:ppc64 | \
     sparc:sparc64 | \
     "$cpu:$cpu")
-      : ${target_cc:=$cc}
-      : ${target_ccas:=$ccas}
-      : ${target_as:=$as}
-      : ${target_ld:=$ld}
-      : ${target_ar:=$ar}
-      : ${target_as:=$as}
-      : ${target_ld:=$ld}
-      : ${target_nm:=$nm}
-      : ${target_objcopy:=$objcopy}
-      : ${target_ranlib:=$ranlib}
-      : ${target_strip:=$strip}
-      ;;
+      try='native cross' ;;
   esac
-  if test -n "$target_cc"; then
-    case $1 in
-      i386|x86_64)
-        if $target_cc --version | grep -qi "clang"; then
-          unset target_cc
+  eval "target_cflags=\${cross_cc_cflags_$1}"
+  for t in $try; do
+    case $t in
+    native)
+      target_cc=$cc
+      target_ccas=$ccas
+      target_ar=$ar
+      target_as=$as
+      target_ld=$ld
+      target_nm=$nm
+      target_objcopy=$objcopy
+      target_ranlib=$ranlib
+      target_strip=$strip
+      ;;
+    cross)
+      target_cc=
+      if eval test -n "\"\${cross_cc_$1}\""; then
+        if eval has "\"\${cross_cc_$1}\""; then
+          eval "target_cc=\"\${cross_cc_$1}\""
         fi
-        ;;
+      else
+        compute_target_variable $1 target_cc gcc
+      fi
+      target_ccas=$target_cc
+      compute_target_variable $1 target_ar ar
+      compute_target_variable $1 target_as as
+      compute_target_variable $1 target_ld ld
+      compute_target_variable $1 target_nm nm
+      compute_target_variable $1 target_objcopy objcopy
+      compute_target_variable $1 target_ranlib ranlib
+      compute_target_variable $1 target_strip strip
+      ;;
     esac
+
+    if test -n "$target_cc"; then
+      case $1 in
+        i386|x86_64)
+          if $target_cc --version | grep -qi "clang"; then
+            continue
+          fi
+          ;;
+      esac
+    elif test -n "$target_as" && test -n "$target_ld"; then
+      # Special handling for assembler only targets
+      case $target in
+        tricore-softmmu)
+          build_static=
+          got_cross_cc=yes
+          break
+          ;;
+        *)
+          continue
+          ;;
+      esac
+    else
+      continue
+    fi
+
+    if test $# = 2 && do_compiler "$target_cc" $target_cflags -o $TMPE $TMPC -static ; then
+      build_static=y
+      got_cross_cc=yes
+      break
+    fi
+    if test $# = 1 || do_compiler "$target_cc" $target_cflags -o $TMPE $TMPC ; then
+      build_static=
+      got_cross_cc=yes
+      break
+    fi
+  done
+  if test $got_cross_cc != yes; then
+    build_static=
+    target_cc=
+    target_ccas=
+    target_cflags=
+    target_ar=
+    target_as=
+    target_ld=
+    target_nm=
+    target_objcopy=
+    target_ranlib=
+    target_strip=
   fi
 }
 
@@ -2488,9 +2542,10 @@ tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
 
-  probe_target_compiler ${arch}
   config_target_mak=tests/tcg/config-$target.mak
 
+  write_c_skeleton
+
   echo "# Automatically generated by configure - do not modify" > $config_target_mak
   echo "TARGET_NAME=$arch" >> $config_target_mak
   case $target in
@@ -2501,35 +2556,14 @@ for target in $target_list; do
     *-softmmu)
       test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
       qemu="qemu-system-$arch"
+      probe_target_compiler ${arch}
       ;;
     *-linux-user|*-bsd-user)
       qemu="qemu-$arch"
+      probe_target_compiler ${arch} $TMPC
       ;;
   esac
 
-  got_cross_cc=no
-  unset build_static
-
-  if test -n "$target_cc"; then
-      write_c_skeleton
-      if ! do_compiler "$target_cc" $target_cflags \
-           -o $TMPE $TMPC -static ; then
-          # For host systems we might get away with building without -static
-          if do_compiler "$target_cc" $target_cflags \
-                         -o $TMPE $TMPC ; then
-              got_cross_cc=yes
-          fi
-      else
-          got_cross_cc=yes
-          build_static=y
-      fi
-  elif test -n "$target_as" && test -n "$target_ld"; then
-      # Special handling for assembler only tests
-      case $target in
-          tricore-softmmu) got_cross_cc=yes ;;
-      esac
-  fi
-
   if test $got_cross_cc = yes; then
       # Test for compiler features for optional tests. We only do this
       # for cross compilers because ensuring the docker containers based
-- 
2.36.1


