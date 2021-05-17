Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E419383A71
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:48:51 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligQE-0002j7-0U
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lig8H-00047w-NQ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:30:17 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lig8A-0005x1-IE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:30:17 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5518437wmh.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SG64un54Q9dR+nW/jKLTv4A2RmDY5Rqb3p7F8J5Dt48=;
 b=W89sO4vUX5l8oqFUkAQGpZiZzt+06eW0VNoHAhdC+PnyVDZZ6TMT5vsEwIGrwgsuBN
 tQ7ntY+0lw2hnM/wqVGxbrNax6EIsNSok8VmUAK4/TJqCeDdY1wQpdtR4SEQfOrR+GcU
 Gi4kpZQVmXa9uGlYqENxhRqdCUVJjbqJejnAWvTqiT/ZvhPN4gHkxvGyLkqljbcv4Dcb
 FGAJpkYM9XN2yQwBCIi25dPGeyFDJiipiyS6r8GwK+c6FY/s+SMeA6chKoVHNvAj0rCz
 lfY74Mb9GcZiRUikKQs7+LvQdv88+UjH0cuEO8eDB/Li1KCr1CL/3fN7mnNAPL/DPgBw
 v+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SG64un54Q9dR+nW/jKLTv4A2RmDY5Rqb3p7F8J5Dt48=;
 b=HDVKYqZKRKbGfMQGqvflpImX4RcVG6lNYQrI4BIaQRLWg+wuOH6G4oAPd0ETRH6vm7
 uqJKUjM+I8BhQNXD4kLdJXYRq8MWxtgw3RRRvb/AXMexiu9/Derbx458mbYdbSGqXo+q
 tUG7LWODDuza8vH3H2oidrV9DpaDZGdngHhJTlg0fA0NYVIOsCvVf60EzVkIGrumXwnQ
 7q5CKU43t+bl8m10ITBIP5mcV4DCdZnchV/6p92vVG0z5/y+o39U0yBTt1au3gxAQsLW
 qcM8KvSomM521sQl/8E5wOS9uIFl5CMsYD9WnawPrgNahARkVE4QjwKNEJoO4xs3wUgj
 PdAg==
X-Gm-Message-State: AOAM530xmkOCGucvvQehvk7XwH4hFp9CRRDUYYmPWnFjuQ4VU40HKrgV
 26YGwZ3m61KqPbt0FvcJcKHgEg==
X-Google-Smtp-Source: ABdhPJy9Hq2Pb4qks9Hi0Qbseea+Edwo8zMOhFmZHc+79uPHuF5V9i27yWPuAgOGo/dG20WhEWG9sw==
X-Received: by 2002:a7b:cf13:: with SMTP id l19mr746724wmg.140.1621269008949; 
 Mon, 17 May 2021 09:30:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q186sm1974451wme.20.2021.05.17.09.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:30:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 77D5D1FF87;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 24/29] tests/tcg: don't allow clang as a cross compiler
Date: Mon, 17 May 2021 17:10:17 +0100
Message-Id: <20210517161022.13984-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Currently there are two problems.

The first is clang generates a preamble (that is always executed) to
stack xmm registers. This causes a ILLOP on the x86_64 softmmu tests
as SSE isn't enabled.

The second is the inline assembler in test-i386.c breaks clangs
compiler and I don't know how to fix it. Even with Theodore's patch
series (D5741445-7EFD-4AF1-8DB2-E4AFA93CBB1A@icloud.com) I still get
compiler failures.

For now lets just skip clang and allow it to fall back to the
containers which we know have compilers which work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index d13d2bb388..016aa24ce4 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -105,6 +105,14 @@ for target in $target_list; do
   esac
 
   container_image=
+  container_hosts=
+  container_cross_cc=
+  container_cross_as=
+  container_cross_ld=
+
+  # suppress clang
+  supress_clang=
+
   case $target in
     aarch64-*)
       # We don't have any bigendian build tools so we only use this for AArch64
@@ -142,6 +150,7 @@ for target in $target_list; do
       container_hosts=x86_64
       container_image=fedora-i386-cross
       container_cross_cc=gcc
+      supress_clang=yes
       ;;
     m68k-*)
       container_hosts=x86_64
@@ -213,6 +222,7 @@ for target in $target_list; do
       container_hosts="aarch64 ppc64el x86_64"
       container_image=debian-amd64-cross
       container_cross_cc=x86_64-linux-gnu-gcc
+      supress_clang=yes
       ;;
     xtensa*-softmmu)
       container_hosts=x86_64
@@ -246,71 +256,75 @@ for target in $target_list; do
     if eval test "x\${cross_cc_$i+yes}" != xyes; then
       continue
     fi
+    eval "target_compiler=\${cross_cc_$arch}"
 
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
+    if has "$target_compiler"; then
+        if test "$supress_clang" = yes &&
+                $target_compiler --version | grep -qi "clang"; then
+            got_cross_cc=no
+        else
+            write_c_skeleton
+            if ! do_compiler "$target_compiler" $target_compiler_cflags \
+                 -o $TMPE $TMPC -static ; then
+                # For host systems we might get away with building without -static
+                if do_compiler "$target_compiler" $target_compiler_cflags \
+                               -o $TMPE $TMPC ; then
+                    got_cross_cc=yes
+                    echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
+                    echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+                fi
+            else
+                got_cross_cc=yes
+                echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
+                echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+            fi
+
+            # Test for compiler features for optional tests. We only do this
+            # for cross compilers because ensuring the docker containers based
+            # compilers is a requirememt for adding a new test that needs a
+            # compiler feature.
+            case $target in
+                aarch64-*)
+                    if do_compiler "$target_compiler" $target_compiler_cflags \
+                                   -march=armv8.1-a+sve -o $TMPE $TMPC; then
+                        echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+                    fi
+                    if do_compiler "$target_compiler" $target_compiler_cflags \
+                                   -march=armv8.3-a -o $TMPE $TMPC; then
+                        echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+                    fi
+                    if do_compiler "$target_compiler" $target_compiler_cflags \
+                                   -mbranch-protection=standard -o $TMPE $TMPC; then
+                        echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+                    fi
+                    if do_compiler "$target_compiler" $target_compiler_cflags \
+                                   -march=armv8.5-a+memtag -o $TMPE $TMPC; then
+                        echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+                    fi
+                    ;;
+                ppc*)
+                    if do_compiler "$target_compiler" $target_compiler_cflags \
+                                   -mpower8-vector -o $TMPE $TMPC; then
+                        echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+                    fi
+                    ;;
+                i386-linux-user)
+                    if do_compiler "$target_compiler" $target_compiler_cflags \
+                                   -Werror -fno-pie -o $TMPE $TMPC; then
+                        echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+                    fi
+                    ;;
+            esac
+        fi
     fi
-    echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
 
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
+    if test $got_cross_cc = no && test "$container" != no && test -n "$container_image"; then
+        for host in $container_hosts; do
+            if test "$host" = "$ARCH"; then
+                echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
+                echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> $config_target_mak
             fi
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
-
-    enabled_cross_compilers="$enabled_cross_compilers $target_compiler"
-    got_cross_cc=yes
-    break
+        done
+    fi
   done
-
-  if test $got_cross_cc = no && test "$container" != no && test -n "$container_image"; then
-      for host in $container_hosts; do
-          if test "$host" = "$ARCH"; then
-              echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
-              echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> $config_target_mak
-          fi
-      done
-  fi
 done
-- 
2.20.1


