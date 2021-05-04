Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D143728C8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:23:31 +0200 (CEST)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsDC-00024f-PF
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzs-0002Xh-Ma
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzg-0006lJ-Vy
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:44 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 t11-20020a05600c198bb02901476e13296aso992869wmq.0
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/ukiiX+2G/6Tr/Ondx70r9sB5+hCuUswyNpWg3QywQ=;
 b=bNIHqwWTi6aw64aeMkx5v/o+Uy4BHZ54DuyI48Xnbx4VFDAmkC4gIgS+MxWuevjbz2
 BzTka50devAnLFoStBeuw8znCAr//V81kdRJiaRKFEFxa7WuqKR2Z0a79zXs2OsizBux
 VTt+ld8Qvvbnrq7Bz5C8PoRLeJnWxUm2mQiaCAV0sd92YO1xgdpj/XoINh/UiVYOpaZ7
 OiTUfiX0HpanORxIaCGo/tPtbPgoNkpZFeylF1Zz5u9NjIzJVyTmsJkbxOhJsjfibK0B
 qTRc7VGVjbLIpXryM39jAMZI/KQezDLwJnUPQ66QTiKS77IDaSATQB5nXXCr6127JlSZ
 nw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/ukiiX+2G/6Tr/Ondx70r9sB5+hCuUswyNpWg3QywQ=;
 b=dUoFrbbXmdyj81c60LfO/D6unzINk3M1EhTH6B6e5hqbiADVMMEF0PCfGOf6hioX+M
 J65R2hjDy1uvHvsXEG3uFeEgJdAPcpH4QEZweO3gTWD7yFgQydurJEwBMVcIa6QHr30S
 3ESuIoA8lWvy/OTvS7Unx/MDvRUnzqPs4NgtybyvfJuHrdKu0A7LfhoaYySxvWxCFPAB
 f2xRkQPaaNxH1m9mJRwogQzOjvzbqLZQu3XGSC1BvrRUitqvgOSXHZPab/O5wG/YTyl3
 HxGuHFi0ZIVQ9rgOmFSCwQj6zXNl842Z3Lz2gRJvhBd7kEyuoxo6ldUH90k5dRZ3wTf8
 f0ww==
X-Gm-Message-State: AOAM530oXmuXS3Hq9vPnY4OLSoucO/p8VNS21k5niwuCQ6T+2Fhov5+T
 g9/EPjgaxfInAy1DpsI081O+3Q==
X-Google-Smtp-Source: ABdhPJzb/gMKO4yeSI3j/wj5nX5NPevESW7fDgOWDPzjq0LDkymFMywkN8ksYd11UEzkzyK0LfNlOQ==
X-Received: by 2002:a1c:7516:: with SMTP id o22mr3020447wmc.91.1620122970743; 
 Tue, 04 May 2021 03:09:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q10sm11392633wre.92.2021.05.04.03.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 639721FFB1;
 Tue,  4 May 2021 11:02:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 26/30] tests/docker: gcc-10 based images for ppc64{,
 le} tests
Date: Tue,  4 May 2021 11:02:19 +0100
Message-Id: <20210504100223.25427-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

A newer compiler is needed to build tests for Power10 instructions. As
done for arm64 on c729a99d2701, a new '-test-cross' image is created for
ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
is added to verify that the toolchain in use has '-mpower10'. Finally,
Unused images (docker-power-cross and docker-ppc64-cross) are removed.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210423205757.1752480-2-matheus.ferst@eldorado.org.br>
---
 .gitlab-ci.d/containers.yml                   | 13 +++---------
 tests/docker/Makefile.include                 |  5 ++---
 .../dockerfiles/debian-powerpc-cross.docker   | 12 -----------
 .../debian-powerpc-test-cross.docker          | 17 ++++++++++++++++
 .../dockerfiles/debian-ppc64-cross.docker     | 11 ----------
 tests/tcg/configure.sh                        | 20 +++++++++----------
 6 files changed, 32 insertions(+), 46 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-powerpc-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-ppc64-cross.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e23..325191627d 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -144,19 +144,12 @@ mipsel-debian-cross-container:
   variables:
     NAME: debian-mipsel-cross
 
-powerpc-debian-cross-container:
+powerpc-test-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-powerpc-cross
-
-ppc64-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  needs: ['amd64-debian11-container']
   variables:
-    NAME: debian-ppc64-cross
+    NAME: debian-powerpc-test-cross
 
 ppc64el-debian-cross-container:
   <<: *container_job_definition
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 8967ecf118..ff5d732889 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -140,8 +140,6 @@ docker-image-debian-mips-cross: docker-image-debian10
 docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-mips64el-cross: docker-image-debian10
 docker-image-debian-mipsel-cross: docker-image-debian10
-docker-image-debian-powerpc-cross: docker-image-debian10
-docker-image-debian-ppc64-cross: docker-image-debian10
 docker-image-debian-ppc64el-cross: docker-image-debian10
 docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-s390x-cross: docker-image-debian10
@@ -174,13 +172,14 @@ docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.dock
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
+docker-image-debian-powerpc-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
 DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
+DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
-DOCKER_PARTIAL_IMAGES += debian-powerpc-cross debian-ppc64-cross
 DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
diff --git a/tests/docker/dockerfiles/debian-powerpc-cross.docker b/tests/docker/dockerfiles/debian-powerpc-cross.docker
deleted file mode 100644
index 07e1789650..0000000000
--- a/tests/docker/dockerfiles/debian-powerpc-cross.docker
+++ /dev/null
@@ -1,12 +0,0 @@
-#
-# Docker powerpc cross-compiler target
-#
-# This docker target builds on the debian Buster base image.
-#
-FROM qemu/debian10
-
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        gcc-powerpc-linux-gnu \
-        libc6-dev-powerpc-cross
diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
new file mode 100644
index 0000000000..36b336f709
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
@@ -0,0 +1,17 @@
+#
+# Docker powerpc/ppc64/ppc64le cross-compiler target
+#
+# This docker target builds on the debian Bullseye base image.
+#
+FROM qemu/debian11
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        gcc-powerpc-linux-gnu \
+        libc6-dev-powerpc-cross \
+        gcc-10-powerpc64-linux-gnu \
+        libc6-dev-ppc64-cross \
+        gcc-10-powerpc64le-linux-gnu \
+        libc6-dev-ppc64el-cross
+
diff --git a/tests/docker/dockerfiles/debian-ppc64-cross.docker b/tests/docker/dockerfiles/debian-ppc64-cross.docker
deleted file mode 100644
index 8efe68874e..0000000000
--- a/tests/docker/dockerfiles/debian-ppc64-cross.docker
+++ /dev/null
@@ -1,11 +0,0 @@
-#
-# Docker ppc64 cross-compiler target
-#
-# This docker target builds on the debian Buster base image.
-FROM qemu/debian10
-
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-       gcc-powerpc64-linux-gnu \
-       libc6-dev-ppc64-cross
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 11009fe433..6627318adf 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -147,18 +147,14 @@ for target in $target_list; do
       ;;
     ppc-*|ppc64abi32-*)
       container_hosts=x86_64
-      container_image=debian-powerpc-cross
-      container_cross_cc=powerpc-linux-gnu-gcc
+      container_image=debian-powerpc-test-cross
+      container_cross_cc=powerpc-linux-gnu-gcc-10
       ;;
-    ppc64-*)
+    ppc64-*|ppc64le-*)
       container_hosts=x86_64
-      container_image=debian-ppc64-cross
-      container_cross_cc=powerpc64-linux-gnu-gcc
-      ;;
-    ppc64le-*)
-      container_hosts=x86_64
-      container_image=debian-ppc64el-cross
-      container_cross_cc=powerpc64le-linux-gnu-gcc
+      container_image=debian-powerpc-test-cross
+      container_cross_cc=${target%%-*}-linux-gnu-gcc-10
+      container_cross_cc=powerpc${container_cross_cc#ppc}
       ;;
     riscv64-*)
       container_hosts=x86_64
@@ -272,6 +268,10 @@ for target in $target_list; do
                              -mpower8-vector -o $TMPE $TMPC; then
                   echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
               fi
+              if do_compiler "$target_compiler" $target_compiler_cflags \
+                             -mpower10 -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+              fi
               ;;
           i386-linux-user)
               if do_compiler "$target_compiler" $target_compiler_cflags \
-- 
2.20.1


