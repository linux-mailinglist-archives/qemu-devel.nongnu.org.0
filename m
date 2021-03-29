Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9471834CE74
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:06:07 +0200 (CEST)
Received: from localhost ([::1]:53186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpig-0001Tr-Lp
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfp-00005T-NZ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:09 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfn-0004fQ-V8
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k8so12408018wrc.3
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AYugguvZY758PcKs/PdSeUMvYaWOhfGF5y8PoXI3cIc=;
 b=LBb1HsCuaO5dYU6L2NSursxxGaKkAfOS1DuvjQxqlUd17JMFdZIzh10PCIIP7/cRpZ
 F7WLxSjDyDU40rfE7QnyzO5VM1jqKcsSkQKQRjSL/pHUItMi9GOFKS8Cd1I9HgTyZ+66
 hAo7LkeslsSa7lz3RrmhT+VcfJL3003CkVzqi4VZd5MHIlVgHTpqLXBENlrhxP7qunkh
 pV2wrrR88G7H/729COfD7rkrfnnJQVkUImPw52d55LuJ6gYUsV/4XT7Ddm6titHoAc3c
 isRvSotxB09yzz5KRxrlvex1OtJGgOkm0ptKk0UJ6x6RKRlsG6Akd+uWZDSsznMUPSQe
 kOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AYugguvZY758PcKs/PdSeUMvYaWOhfGF5y8PoXI3cIc=;
 b=BBBh7dLdoesiyfoV9Xi2KaqnHtjElY4S8KSCHhWYw5e0k6ZWOw8cXh+esljvuKN5VL
 AJhJqetPg/4z3b0VRtQpyWSKSDtKjeZ6HkqpX+Q50TlRbMWTiYVwRLgxkLdxvoQA3u+H
 n11av+BKaVZuQ+LTfSKEDRF7qhHwepW1E3YnZv2q11XMyx0Qzf6M3hERkcKvkZi8SsUE
 4/OQBZsuEO+lsur2Y1BC4tDoUrRbZ87PXNm9WvpftytQUxxEFERR3Ge7rXP/7Ap2pBz9
 1DBwBbqHRi8gxq66zjV9cdfTqgzb76iN7brOyErJC8dXUPFUuQuYNwddeTPPrw8nu2tK
 nWCg==
X-Gm-Message-State: AOAM533G/XxYUOambcNL6Bui8ri+Qh/D7IWlLxF2BU2LQDmqQFZFZipT
 cuwmnIljYz8d960o/QJFXicb434fovnhnP4A
X-Google-Smtp-Source: ABdhPJyLGOl++n7Pllt4Vm8AU6I+y/G/Frd1bNphvUQlIJsyXIJMg0gMiy842TxfQUMpYXnlr7yRbg==
X-Received: by 2002:a5d:58fc:: with SMTP id f28mr18632423wrd.180.1617015786084; 
 Mon, 29 Mar 2021 04:03:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm28672679wrx.73.2021.03.29.04.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 04:03:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B42A21FF8F;
 Mon, 29 Mar 2021 12:03:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/6] tests/tcg: add concept of container_hosts
Date: Mon, 29 Mar 2021 12:03:00 +0100
Message-Id: <20210329110303.15235-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329110303.15235-1-alex.bennee@linaro.org>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While docker is nominally multarch these days it doesn't mean our
distros actually package all cross compilers for all architectures.
The upcoming Debian bullseye release will improve things further. At
least for now we can get things like the 32 bit ARM compiler on it's
64 bit cousin.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure              |  2 +-
 tests/tcg/configure.sh | 27 +++++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 535e6a9269..7df7750a14 100755
--- a/configure
+++ b/configure
@@ -6299,7 +6299,7 @@ done
 (for i in $cross_cc_vars; do
   export $i
 done
-export target_list source_path use_containers
+export target_list source_path use_containers ARCH
 $source_path/tests/tcg/configure.sh)
 
 # temporary config to build submodules
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index af4aecf14e..87a9f24b20 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -108,79 +108,98 @@ for target in $target_list; do
   case $target in
     aarch64-*)
       # We don't have any bigendian build tools so we only use this for AArch64
+      container_hosts="x86_64 aarch64"
       container_image=debian-arm64-test-cross
       container_cross_cc=aarch64-linux-gnu-gcc-10
       ;;
     alpha-*)
+      container_hosts=x86_64
       container_image=debian-alpha-cross
       container_cross_cc=alpha-linux-gnu-gcc
       ;;
     arm-*)
       # We don't have any bigendian build tools so we only use this for ARM
+      container_hosts="x86_64 aarch64"
       container_image=debian-armhf-cross
       container_cross_cc=arm-linux-gnueabihf-gcc
       ;;
     cris-*)
+      container_hosts=x86_64
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
     hppa-*)
+      container_hosts=x86_64
       container_image=debian-hppa-cross
       container_cross_cc=hppa-linux-gnu-gcc
       ;;
     i386-*)
+      container_hosts=x86_64
       container_image=fedora-i386-cross
       container_cross_cc=gcc
       ;;
     m68k-*)
+      container_hosts=x86_64
       container_image=debian-m68k-cross
       container_cross_cc=m68k-linux-gnu-gcc
       ;;
     mips64el-*)
+      container_hosts=x86_64
       container_image=debian-mips64el-cross
       container_cross_cc=mips64el-linux-gnuabi64-gcc
       ;;
     mips64-*)
+      container_hosts=x86_64
       container_image=debian-mips64-cross
       container_cross_cc=mips64-linux-gnuabi64-gcc
       ;;
     mipsel-*)
+      container_hosts=x86_64
       container_image=debian-mipsel-cross
       container_cross_cc=mipsel-linux-gnu-gcc
       ;;
     mips-*)
+      container_hosts=x86_64
       container_image=debian-mips-cross
       container_cross_cc=mips-linux-gnu-gcc
       ;;
     ppc-*|ppc64abi32-*)
+      container_hosts=x86_64
       container_image=debian-powerpc-cross
       container_cross_cc=powerpc-linux-gnu-gcc
       ;;
     ppc64-*)
+      container_hosts=x86_64
       container_image=debian-ppc64-cross
       container_cross_cc=powerpc64-linux-gnu-gcc
       ;;
     ppc64le-*)
+      container_hosts=x86_64
       container_image=debian-ppc64el-cross
       container_cross_cc=powerpc64le-linux-gnu-gcc
       ;;
     riscv64-*)
+      container_hosts=x86_64
       container_image=debian-riscv64-cross
       container_cross_cc=riscv64-linux-gnu-gcc
       ;;
     s390x-*)
+      container_hosts=x86_64
       container_image=debian-s390x-cross
       container_cross_cc=s390x-linux-gnu-gcc
       ;;
     sh4-*)
+      container_hosts=x86_64
       container_image=debian-sh4-cross
       container_cross_cc=sh4-linux-gnu-gcc
       ;;
     sparc64-*)
+      container_hosts=x86_64
       container_image=debian-sparc64-cross
       container_cross_cc=sparc64-linux-gnu-gcc
       ;;
     xtensa*-softmmu)
+      container_hosts=x86_64
       container_image=debian-xtensa-cross
 
       # default to the dc232b cpu
@@ -265,7 +284,11 @@ for target in $target_list; do
   done
 
   if test $got_cross_cc = no && test "$container" != no && test -n "$container_image"; then
-    echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
-    echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> $config_target_mak
+      for host in $container_hosts; do
+          if test "$host" = "$ARCH"; then
+              echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
+              echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> $config_target_mak
+          fi
+      done
   fi
 done
-- 
2.20.1


