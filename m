Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF293874CF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:09:48 +0200 (CEST)
Received: from localhost ([::1]:36852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livjX-0002Y0-FX
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhQ-00085o-WA
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhM-0005UX-S0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:36 -0400
Received: by mail-wr1-x433.google.com with SMTP id j14so7587737wrq.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vc8LrTg4vVRcCUK0lAtqysrbfC1yfp+yZGcfve2xqWo=;
 b=NofdYuN1UIyVr2MKvADN1ap9i5m88RB4wXIrUFdo5rqI1tdKBG7j+vsDaNVxtOm2iu
 jiO8RyFaqmUSXwNI4LymqSjwp1CG/7aycnICIXmOUwdckqFX86CHkyReOyAcxqFVxPwL
 gjj83+saf4aegVXI3FnKRI5ky1HKzAgDdHv4A62bv0EEFzQCyVOc+NKWDFgj7CWnIMSF
 M4Lu7m/4QQqRa98/cXpKeEceTfrjrcY+yz+IbcuK/Oy5fYCVZNlzO/u9sxn+T/3izekA
 vx17sHPCv1jABgncshtt58QbAt6vens70HzA9n1NFO7cpeo/OI8REVnK33QDzm+4opG4
 0yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vc8LrTg4vVRcCUK0lAtqysrbfC1yfp+yZGcfve2xqWo=;
 b=blZAjV3spXDon6Jbpn60bgEiZFyxPSKPPmS84PCRAUVLCfKPrjfJ7Sdl0cfK++Qelr
 u4lXyS54FO+j7PKGgBgBIsBQv+Dq4SjsUnJCElOVmlZzYV6NkKU/5iWChUFHCSRQv/bR
 kdh1ijYUCO82yFZgMDvRIOid48PiJLL9AcB4zrbSbgXsOcbz9+dSUilM2Rgt2BmvjDkI
 O1+hNww0CuIig2F1VeR9GxCP+25uv/3PxCpyEtUNl1MnYH00gdqjzx/bbooy+QVu62sk
 +IC9CQvT138DotujTU1So1YZiccLgjxizbV6bE+vcqUZQIoHVtf+BFuU29Z3DJumy66q
 EREQ==
X-Gm-Message-State: AOAM531EExkkcYc/eMN9vbdjPtZuJVFOc7imzYTykfBcd1Bp9g0cOmqF
 pmIcudve8hvqfiENHBVrGB30N2Wk5aBuwg==
X-Google-Smtp-Source: ABdhPJxKU31PyhUdvtdpmAdvUgjiVr+AB6zHGhS4sCFvYO7utyV1PeY7+8CVP5NBSCTo3mz9fu5mfQ==
X-Received: by 2002:a05:6000:1c1:: with SMTP id
 t1mr5432842wrx.421.1621328851451; 
 Tue, 18 May 2021 02:07:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f8sm16184927wmg.43.2021.05.18.02.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A93B71FF96;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 08/29] tests/tcg: don't iterate through other arch compilers
Date: Tue, 18 May 2021 10:06:59 +0100
Message-Id: <20210518090720.21915-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There should only be one compiler per architecture. Those cases where
the same compiler can deal with a different architecture should be
explicitly set for both cross_cc and docker configurations. Otherwise
you get strangeness like:

  --cross-cc-aarch64=/bin/false

causing the logic to attempt to use a locally available
arm-linux-gnueabihf-gcc rather than forcing the use of the docker
image which is what is implied by the command line option.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210512102051.12134-10-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index cf6062a15f..e6c1be5450 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -74,35 +74,6 @@ fi
 
 for target in $target_list; do
   arch=${target%%-*}
-  case $arch in
-    arm|armeb)
-      arches=arm
-      ;;
-    aarch64|aarch64_be)
-      arches="aarch64 arm"
-      ;;
-    mips*)
-      arches=mips
-      ;;
-    ppc*)
-      arches=ppc
-      ;;
-    sh4|sh4eb)
-      arches=sh4
-      ;;
-    x86_64)
-      arches="x86_64 i386"
-      ;;
-    xtensa|xtensaeb)
-      arches=xtensa
-      ;;
-    alpha|cris|hexagon|hppa|i386|microblaze|microblazeel|m68k|openrisc|riscv64|s390x|sh4|sparc64)
-      arches=$target
-      ;;
-    *)
-      continue
-      ;;
-  esac
 
   container_image=
   case $target in
@@ -236,70 +207,69 @@ for target in $target_list; do
   echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
 
   got_cross_cc=no
-  for i in $arch $arches; do
-    if eval test "x\${cross_cc_$i+yes}" != xyes; then
-      continue
-    fi
 
-    eval "target_compiler=\${cross_cc_$i}"
-    if ! has $target_compiler; then
-      continue
-    fi
-    write_c_skeleton
-    if ! do_compiler "$target_compiler" $target_compiler_cflags -o $TMPE $TMPC -static ; then
-      # For host systems we might get away with building without -static
-      if ! do_compiler "$target_compiler" $target_compiler_cflags -o $TMPE $TMPC ; then
-        continue
-      fi
-      echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
-    else
-      echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
-    fi
-    echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+  if eval test "x\${cross_cc_$arch}" != xyes; then
+      eval "target_compiler=\${cross_cc_$arch}"
 
-    # Test for compiler features for optional tests. We only do this
-    # for cross compilers because ensuring the docker containers based
-    # compilers is a requirememt for adding a new test that needs a
-    # compiler feature.
-    case $target in
-        aarch64-*)
-            if do_compiler "$target_compiler" $target_compiler_cflags \
-               -march=armv8.1-a+sve -o $TMPE $TMPC; then
-                echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
-            fi
-            if do_compiler "$target_compiler" $target_compiler_cflags \
-               -march=armv8.3-a -o $TMPE $TMPC; then
-                echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
-            fi
-            if do_compiler "$target_compiler" $target_compiler_cflags \
-               -mbranch-protection=standard -o $TMPE $TMPC; then
-                echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
-            fi
-            if do_compiler "$target_compiler" $target_compiler_cflags \
-               -march=armv8.5-a+memtag -o $TMPE $TMPC; then
-                echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
-            fi
-        ;;
-        ppc*)
-            if do_compiler "$target_compiler" $target_compiler_cflags \
-               -mpower8-vector -o $TMPE $TMPC; then
-                echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
-            fi
-        ;;
-        i386-linux-user)
-            if do_compiler "$target_compiler" $target_compiler_cflags \
-                -Werror -fno-pie -o $TMPE $TMPC; then
-                echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
-            fi
-        ;;
-    esac
+      if has $target_compiler; then
+          write_c_skeleton
+          if ! do_compiler "$target_compiler" $target_compiler_cflags \
+                 -o $TMPE $TMPC -static ; then
+              # For host systems we might get away with building without -static
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                     -o $TMPE $TMPC ; then
+                  got_cross_cc=yes
+                  echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
+                  echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+              fi
+          else
+              got_cross_cc=yes
+              echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
+              echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+          fi
+      fi
+  fi
 
-    enabled_cross_compilers="$enabled_cross_compilers $target_compiler"
-    got_cross_cc=yes
-    break
-  done
+  if test $got_cross_cc = yes; then
+      # Test for compiler features for optional tests. We only do this
+      # for cross compilers because ensuring the docker containers based
+      # compilers is a requirememt for adding a new test that needs a
+      # compiler feature.
 
-  if test $got_cross_cc = no && test "$container" != no && test -n "$container_image"; then
+      case $target in
+          aarch64-*)
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                             -march=armv8.1-a+sve -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                             -march=armv8.3-a -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                             -mbranch-protection=standard -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                             -march=armv8.5-a+memtag -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+              fi
+              ;;
+          ppc*)
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                             -mpower8-vector -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+              fi
+              ;;
+          i386-linux-user)
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                             -Werror -fno-pie -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+              fi
+              ;;
+      esac
+  elif test $got_cross_cc = no && test "$container" != no && \
+          test -n "$container_image"; then
       for host in $container_hosts; do
           if test "$host" = "$ARCH"; then
               echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
-- 
2.20.1


