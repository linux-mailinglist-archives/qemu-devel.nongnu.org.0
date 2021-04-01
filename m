Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D6D3513AB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:33:16 +0200 (CEST)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRudX-0002Cg-1u
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWc-0002l8-V3
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:14 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWA-0001jj-Nf
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:25:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id x16so1281844wrn.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AYugguvZY758PcKs/PdSeUMvYaWOhfGF5y8PoXI3cIc=;
 b=idQ0RiOVaSVEc/U9EK5wZ7J8gUpIFM9pfQtXVB7nSJe0s0hIT+nGMf53xbnSNJBV4y
 fXWIdwg1bVteuYaE7iebTYmGBwyR6nzEJIrNba5ab75mGp8jwEOzWKHMJsrJQ7oP/Ygc
 fYAQUmaZN54cZA5AL2SmTVND62rugm4yegQzqHKknoDCOagVcvZH6dJQM0iAfeWp1UG0
 3ClOEmQBHHGp1+dev6BkG2eKJvsszCOgRknTthC2DN0e2+yIoJnB374rpwhS3bDJXYIs
 EiESZy4FcZ2IeTo5q8HZQtggYzvm+3ZoGR8QI+7LfzRuBhH0cqok6bceOXsFcyIYh9rK
 gQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AYugguvZY758PcKs/PdSeUMvYaWOhfGF5y8PoXI3cIc=;
 b=ZrcTE+QLUCuDOpyxfZsVlHjxQrch7yJ/ZyJMnr+j1QBE7AyYg/U+39/sVZ0fogsL/8
 QnakJl+V4dZF/hVmzEuE9AZH6jX3kAl09HM100yjGIQaMaJeNQuBwNucCi+UWY+G8BSk
 IG8FVx2eKXSmcLrBS7TzgeATMgi+s4wgrppW2ye5wOi37JMccySH/rv3QPjNTkFsH4L7
 QU1knQt1+9QnhsG0OAbTr7l7WvE50F0mEReTYnUHEVo7yCpUfRcmaHuSzTU+OghYAk68
 GkoctubBfYGtQkGS8QebNwoO16UKbdVXU+304x/LZ4HhK3/NQl9ToZHZesV7kcyyOg7Z
 MweA==
X-Gm-Message-State: AOAM532TCr24E+Ly3SPpGl8ZJeA8jnT6PHgHNOh448jqGsT5fnDwRpr1
 T6GkgzrwWDKCtsQInF0FO+P5iUECGOVBHQ==
X-Google-Smtp-Source: ABdhPJxNN12VNH4+Vk2ZETfOe1df2iG+jcfeLyhZVK16wzhP4TsS9nULK8VTYTDuC0rlyXBpSXAxMg==
X-Received: by 2002:a05:6000:2af:: with SMTP id
 l15mr8959975wry.387.1617272735522; 
 Thu, 01 Apr 2021 03:25:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l15sm9071526wru.38.2021.04.01.03.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0CDC1FF8F;
 Thu,  1 Apr 2021 11:25:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 03/11] tests/tcg: add concept of container_hosts
Date: Thu,  1 Apr 2021 11:25:22 +0100
Message-Id: <20210401102530.12030-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


