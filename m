Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0812355747
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:05:59 +0200 (CEST)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnHC-0001hr-VQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCN-0006Qb-Ez
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCH-000521-Gs
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q26so8889858wrz.9
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V0d6tIYJ+1OdyVAPVLAuIBArrqK1MAgYqxZeXiKzEP0=;
 b=mqJCyORKnweruzNIYLTzJoT5smL85jiOdOs7N078sO0Ejhj1L8OiTMJUJRNn9ixhFY
 A0i7oWpSG3URnHQy6h2ZVVBiBIUjlB/IeXpCff/KIA3BQkF1zLxPSoDTVhGQjsSpNd6i
 Clhtf/Vjq3hf6Qw/THR8JRY/CwPLR+BA57uYsgdO+2vOoktPkRKN7d0Ax1NL1T0U3UZR
 xy1lQYZvrOhZjIYzgWWJF8vWNcWnKJZk+KGxrjtzhjS3XMVql45vwppfdltVicsGOSuv
 yTQx5vwwjwwK+TARrEnPyF4XI9Ub7wgxCihlnsRba01jkQX3zoLuifDe1IDv9xXh1dBc
 4nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V0d6tIYJ+1OdyVAPVLAuIBArrqK1MAgYqxZeXiKzEP0=;
 b=K9sXXqSTulMZnRqhx/iMXKu6h0kcfmWZPqQ4wnjpGnKpKRjOZuNyhMvVvr1inlJE8L
 aNb3v3/4AT77D9A65mBM6FieWArwQgQENnzPsIXUz5p3+JHu00Fshlexqn34+hhhQWaI
 6Vqa6Mr8yHOqQgwluZ/jpDrvkL8TIU7CsxBOcNULckGOCs77OtZwpG/uNfaZQAHsZauM
 C2eiJLIa50oH3F4ICvxTfLk8KOrtMwZcczcKIoJaVJQPn3N+n/Z8PuBg6pIqF2UtwOKi
 +9b8RngmTX3Rrk+k3RkCHQTu8zx4wvuR09Z848jVfY5ryHg0mECTkM+zHTpHQIV4D30M
 /Yww==
X-Gm-Message-State: AOAM533F2ZnNO6PVBxPgK5EIN/xJxn/Tyw7QdWjZiVWF2cFnUEnx3GfH
 7GEd0gIUSaEby/q3tCwCDnJtNA==
X-Google-Smtp-Source: ABdhPJx/7aaLUG6erKKX05vh86jFDqX9XXFh+r2E+jpzHOTJZY8OM+12If/YagKLDAKi+yR+Prukkw==
X-Received: by 2002:a05:6000:1209:: with SMTP id
 e9mr10667478wrx.36.1617721248553; 
 Tue, 06 Apr 2021 08:00:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 61sm21977828wrn.25.2021.04.06.08.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DEA71FF8F;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/11] tests/tcg: add concept of container_hosts
Date: Tue,  6 Apr 2021 16:00:33 +0100
Message-Id: <20210406150041.28753-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While docker is nominally multiarch these days it doesn't mean our
distros actually package all cross compilers for all architectures.
The upcoming Debian bullseye release will improve things further. At
least for now we can get things like the 32 bit ARM compiler on it's
64 bit cousin.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210401102530.12030-4-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 8275df1506..4f374b4889 100755
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


