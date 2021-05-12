Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B461137BA42
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:24:04 +0200 (CEST)
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgm27-0006Or-PS
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzJ-0003cn-LU
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzG-0003fa-UR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id t18so23060683wry.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPzJesUomMFY9absGAV+e0gSasa1u8Mhgwq7e7l5rQ4=;
 b=ZsLvS6GA9VNr4FhF9xXNcNLQgbhsb0np6w7cD7L1bMiTZC7mip7HqDTlxuKod3tha3
 FkhCg5MdsDeYd3YG39coNMIF0dDp5XC9yQaqBd0bQY97Q8RFRFQMybeQfXbt9SVAlHos
 uiu4YFiI6EheGo0+cHLLMiI3YNtnrwhx7/Y4IedODOV+qCIOSLRhdgzLqsCp/soNCfa5
 Cop4bKDnBEGYHqZM9GtZ6ei1qaNBFf1hjzkDjRWV7Mp+e4qWuyQgW3vcrwmMQ+oCP61P
 EZ9k3rQV4QkVGFjmfwshYFRZsUc85P+vE74ryeeNueGehJy5Sz9lyeEeHmXbXFhq1ihk
 MTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sPzJesUomMFY9absGAV+e0gSasa1u8Mhgwq7e7l5rQ4=;
 b=TL0ho+7RK+mdiOGIwpny61UdhZjiHhf0vALWA25KPw4X1rotPBxjEJtPuIZcUXKgoN
 qkNziQuKZwhkQmsEWkMRev5YL/6wp7pVGRodGfdm2ULrMLR+AapPNRQ9gc75DoYx9He3
 AzGGdN8zSoYCbbNJ8oSNAN9+9ft/glFUghZSAHVWj3wZUp2XYSxpwp3Jh+Z3Rv8c9nt3
 K/bfNrZEU/KbFm1Vf7ByF847TzeG1H6EPuloYpVM+KPJ1UyCHhRteWKbly/0sHVD1pcV
 d+MZfZKWQYLlF1FCZTGwrB2uA0izQGnrsxcAT1deFMlb1AgisS6FiQPrEBAGoghVIDL/
 /G9A==
X-Gm-Message-State: AOAM5337xLMxBN/Zt+D32ZsslFwmu2noBNZdzz38hdwaOeqKls2BNVlW
 shu9Xn+JcHYfJpPsTafwHs3IKg==
X-Google-Smtp-Source: ABdhPJy0AoljF82+5kGK2piDyr6mxU4YfEvTv3RGtJ+0UpmHZhALODu/CQltu7bwDhLRb4EK7cWpUw==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr45028899wrs.204.1620814865538; 
 Wed, 12 May 2021 03:21:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm5645592wmr.48.2021.05.12.03.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 040A71FF98;
 Wed, 12 May 2021 11:20:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/31] tests/tcg: don't iterate through other arch compilers
Date: Wed, 12 May 2021 11:20:29 +0100
Message-Id: <20210512102051.12134-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
---
 tests/tcg/configure.sh | 148 ++++++++++++++++-------------------------
 1 file changed, 59 insertions(+), 89 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 24cc847688..e6c1be5450 100755
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
-    alpha|cris|hexagon|hppa|i386|lm32|microblaze|microblazeel|m68k|openrisc|riscv64|s390x|sh4|sparc64)
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


