Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C85571B00
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:18:47 +0200 (CEST)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFmo-0002Eb-6t
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLU-0003Ep-U0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLH-0001Sp-NP
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCs0cyrj/ENyELnGuzGXsZmFkpS6XumC8TYkq/Y7rNg=;
 b=e1MhHSMjA93BYGxmdDoPtEgWRUy494pDx1PHzB18+znfiG6T9FPly9C19KKuTqx7jKntH+
 wBQ96TDtKeRGeFY2HrYLWVPipQWO8IDwfaBIZHk11aqMH8Tady14NsyToFnp8kFIDupg3m
 IfYxQyV8er2jSY+K2SChm2Lx+rnF8jE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-9IGfbdj8Ot6a2xyIxcfCJw-1; Tue, 12 Jul 2022 08:50:18 -0400
X-MC-Unique: 9IGfbdj8Ot6a2xyIxcfCJw-1
Received: by mail-ej1-f69.google.com with SMTP id
 gb37-20020a170907962500b0072b820af09dso645286ejc.20
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pCs0cyrj/ENyELnGuzGXsZmFkpS6XumC8TYkq/Y7rNg=;
 b=gWhUIW7YaTXycwVaHtpC6HVdOrb6bKj1fv4zJTFzi84Mw4qsk7v8YCdJ+Slu6MGOpH
 u5NmtUJNeF9XSUjW/rGDmFw2xDB+pHGJ6d+UQL3Ua+992aGtoSTqc6PXI9lxB46bZ4Ne
 DUHT6AvJ+A0Y+vEGYY55OX0XoX6qIXkgtzAouEv3L8gG8ehOPMXt2BKZ3SL2OOpF3N45
 b6okGUR+vdhZeJVMwTd5OpZ633t9oTiyzzABI6AW90dcc+2Sfq0oigsP1tMyGVol0kFc
 59PVIdPEwQMGwjXf+h+5fKHV1kzwUdkFIggQ2n+LbCN1Lselz/PfggjqCXP7IXwLvbn4
 3kzQ==
X-Gm-Message-State: AJIora+7XEPUIindmyLnqyHpWB9P7vDWw2tRCbTI4yj9UrB9WP708+kx
 V00rNBOOC1QY1e4Qi/F5F4sWUMR7mNsEC8L8QJNALZQilhAQQ3Sd/l3gDioyx5VRuYkc9FuwnB5
 G0qXl3L/FkbRXUuzIRrs4tR92BsSNeh1NNh4M/sZvMktJwyRbeI0LTiDv0LQuKQDkT5Y=
X-Received: by 2002:a17:907:b0a:b0:72b:3176:3fe5 with SMTP id
 h10-20020a1709070b0a00b0072b31763fe5mr19921980ejl.48.1657630216474; 
 Tue, 12 Jul 2022 05:50:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tlhIU8GhL42Vfj8a6HtVkjr3AlElTLNYNjywiM/COQMlMuKNUA4zih6t3QzS7iaIZRrcXCDw==
X-Received: by 2002:a17:907:b0a:b0:72b:3176:3fe5 with SMTP id
 h10-20020a1709070b0a00b0072b31763fe5mr19921952ejl.48.1657630216166; 
 Tue, 12 Jul 2022 05:50:16 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 26-20020a170906311a00b0070e238ff66fsm3756976ejx.96.2022.07.12.05.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 11/18] build: try both native and cross compilers
Date: Tue, 12 Jul 2022 14:49:49 +0200
Message-Id: <20220712124956.150451-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
probe_target_compiler and, while at it, restrict the softmmu emulation
target to basically a test for the presence of libgcc.

Tested-by: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 159 ++++++++++++++++++++++++++++++++----------------------
 1 file changed, 95 insertions(+), 64 deletions(-)

diff --git a/configure b/configure
index 5256bc88e5..e8cc850727 100755
--- a/configure
+++ b/configure
@@ -1868,6 +1868,7 @@ fi
 : ${cross_cc_cflags_x86_64="-m64"}
 
 compute_target_variable() {
+  eval "$2="
   if eval test -n "\"\${cross_prefix_$1}\""; then
     if eval has "\"\${cross_prefix_$1}\$3\""; then
       eval "$2=\"\${cross_prefix_$1}\$3\""
@@ -1888,6 +1889,7 @@ compute_target_variable() {
 #
 probe_target_compiler() {
   # reset all output variables
+  got_cross_cc=no
   container_image=
   container_hosts=
   container_cross_cc=
@@ -1898,14 +1900,6 @@ probe_target_compiler() {
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
 
   target_arch=${1%%-*}
   case $target_arch in
@@ -2053,22 +2047,8 @@ probe_target_compiler() {
     : ${container_cross_strip:=${container_cross_prefix}strip}
   done
 
-  eval "target_cflags=\${cross_cc_cflags_$target_arch}"
-  if eval test -n "\"\${cross_cc_$target_arch}\""; then
-    if eval has "\"\${cross_cc_$target_arch}\""; then
-      eval "target_cc=\"\${cross_cc_$target_arch}\""
-    fi
-  else
-    compute_target_variable $target_arch target_cc gcc
-  fi
-  target_ccas=$target_cc
-  compute_target_variable $target_arch target_ar ar
-  compute_target_variable $target_arch target_as as
-  compute_target_variable $target_arch target_ld ld
-  compute_target_variable $target_arch target_nm nm
-  compute_target_variable $target_arch target_objcopy objcopy
-  compute_target_variable $target_arch target_ranlib ranlib
-  compute_target_variable $target_arch target_strip strip
+  local t try
+  try=cross
   case "$target_arch:$cpu" in
     aarch64_be:aarch64 | \
     armeb:arm | \
@@ -2077,27 +2057,101 @@ probe_target_compiler() {
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
-    case $target_arch in
-      i386|x86_64)
-        if $target_cc --version | grep -qi "clang"; then
-          unset target_cc
+  eval "target_cflags=\${cross_cc_cflags_$target_arch}"
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
+      if eval test -n "\"\${cross_cc_$target_arch}\""; then
+        if eval has "\"\${cross_cc_$target_arch}\""; then
+          eval "target_cc=\"\${cross_cc_$target_arch}\""
+        fi
+      else
+        compute_target_variable $target_arch target_cc gcc
+      fi
+      target_ccas=$target_cc
+      compute_target_variable $target_arch target_ar ar
+      compute_target_variable $target_arch target_as as
+      compute_target_variable $target_arch target_ld ld
+      compute_target_variable $target_arch target_nm nm
+      compute_target_variable $target_arch target_objcopy objcopy
+      compute_target_variable $target_arch target_ranlib ranlib
+      compute_target_variable $target_arch target_strip strip
+      ;;
+    esac
+
+    if test -n "$target_cc"; then
+      case $target_arch in
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
+    write_c_skeleton
+    case $1 in
+      *-softmmu)
+        if do_compiler "$target_cc" $target_cflags -o $TMPO -c $TMPC &&
+          do_compiler "$target_cc" $target_cflags -r -nostdlib -o "${TMPDIR1}/${TMPB}2.o" "$TMPO" -lgcc; then
+          got_cross_cc=yes
+          break
+        fi
+        ;;
+      *)
+        if do_compiler "$target_cc" $target_cflags -o $TMPE $TMPC -static ; then
+          build_static=y
+          got_cross_cc=yes
+          break
+        fi
+        if do_compiler "$target_cc" $target_cflags -o $TMPE $TMPC ; then
+          build_static=
+          got_cross_cc=yes
+          break
         fi
         ;;
     esac
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
 
@@ -2519,29 +2573,6 @@ for target in $target_list; do
   esac
 
   probe_target_compiler $target
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



