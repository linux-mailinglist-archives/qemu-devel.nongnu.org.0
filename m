Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7614408E3D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:32:05 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPm45-00089S-1N
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mPlgC-0007Nv-SO
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:07:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mPlg3-0002dI-N7
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:07:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b6so14576852wrh.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+KiKckyFlDN2qEuGt0nOh4JNFvDwuDMt9ylxfdkDTg=;
 b=lC1Ju+FkMBr96R6Ofpdm8WAE+r3y1cjz/r0F+KjsW7rwH5VoL4q7TcTwc3xpnNOPl3
 HBDAOBg4NGJzkUlczvjxKadP4Q8g1lAO5qcFk3LAv5RlaNRhsNbgzI0OGxK4iFUoFSj0
 O3DSZVWvMWvq77E5eY98Ehc2qS5UDr5Ecb4DsuBOQighRAkCK+hOIRh2FBk8BKM1dQQ3
 TijV+rkSeBpNJmj1LEbatheKbTv/qj4sGk15HzJfzdDkyEGL7ZJhzoChOCmJuJt88LYZ
 snyREl7ubdlZauBeuIbPQVHPzXEIkKCLGkNV6rXtLSGC+Bn+96gj7kuIkYSkyBujjrg7
 gI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+KiKckyFlDN2qEuGt0nOh4JNFvDwuDMt9ylxfdkDTg=;
 b=Q0gMLddX23RG64g3qutu+EZcDkyCZ7M8b5K0dwaC97+QuDCjNacwxrtEnME+mCarfv
 7uiHQq6S/fbQ8G/gehUBUzv+323rcjhphhM9DOywYvDXd+16uPY4JwGuib1N7jK1zZZG
 VgzPW+7s7lkoccuGOmqZ8g2umR5CYRO8zjaEh8/lq/MADaFSyPUgSZFdQcK0a6CRz6/6
 m5JWH7pJlymEPZeQ0IcvJUuFUH90Ojwrpt0WXJRpOKiJygKi3TIpVI0Ezc7YFKGUlvNg
 YUonuqOQrO4ZOF5ObbuUmD0CP51o9MF2wI0EfcQ6CjdtBUiXrLBnHzaNG4nvfv6kwTVa
 opSw==
X-Gm-Message-State: AOAM532sv8/HPd31YZJeEQi+1DEzEwCHtyQtuQD2e0OUFUFYSw3U313Q
 XrRsLX7Sx7qREsIcb0rcoTtFAw==
X-Google-Smtp-Source: ABdhPJw3eIXSY5goQGRwKXVr7k2Gyx4R7WX1AeeWW+bou2CIs2w2/H+4FdeFCw3Cld8D9ykMBPIO4g==
X-Received: by 2002:a5d:6741:: with SMTP id l1mr12560726wrw.289.1631538433349; 
 Mon, 13 Sep 2021 06:07:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q11sm6883906wrn.65.2021.09.13.06.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:07:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC7C51FF96;
 Mon, 13 Sep 2021 14:07:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/docker: promote debian-riscv64-cross to a full image
Date: Mon, 13 Sep 2021 14:07:03 +0100
Message-Id: <20210913130703.815611-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to cross build QEMU itself we need to include a few more
libraries. These are only available in Debian's unstable ports repo
for now so we need:

  - a debian-sid base image with a few tools
  - tweak the riscv64 image to use it
  - add the minimal libs needed to build QEMU (glib/pixman)

The result works but is not as clean as using build-dep to bring in
more dependencies. However sid is by definition a shifting pile of
sand and by keeping the list of libs minimal we reduce the chance of
having an image we can't build. It's good enough for a basic cross
build test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
---
 tests/docker/Makefile.include                 |  5 ++-
 .../dockerfiles/debian-riscv64-cross.docker   | 15 ++++++---
 tests/docker/dockerfiles/debian-sid.docker    | 33 +++++++++++++++++++
 3 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 tests/docker/dockerfiles/debian-sid.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ff5d732889..df56796405 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -11,7 +11,7 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
-DOCKER_PARTIAL_IMAGES := debian10 debian11 debian-bootstrap empty
+DOCKER_PARTIAL_IMAGES := debian10 debian11 debian-sid debian-bootstrap empty
 DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker))))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
@@ -141,7 +141,7 @@ docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-mips64el-cross: docker-image-debian10
 docker-image-debian-mipsel-cross: docker-image-debian10
 docker-image-debian-ppc64el-cross: docker-image-debian10
-docker-image-debian-riscv64-cross: docker-image-debian10
+docker-image-debian-riscv64-cross: docker-image-debian-sid
 docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
@@ -180,7 +180,6 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
-DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 2bbff19772..0f7e5e010e 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -1,12 +1,19 @@
 #
 # Docker cross-compiler target
 #
-# This docker target builds on the debian Buster base image.
+# This docker target builds on the Debian Sid (with ports) base image.
 #
-FROM qemu/debian10
+FROM qemu/debian-sid
 
+RUN dpkg --add-architecture riscv64
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
-        gcc-riscv64-linux-gnu \
-        libc6-dev-riscv64-cross
+         gcc-riscv64-linux-gnu \
+         libc6-dev-riscv64-cross \
+         libglib2.0-dev:riscv64 \
+         libpixman-1-dev:riscv64
+
+# Specify the cross prefix for this image (see tests/docker/common.rc)
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=riscv64-linux-gnu-
+ENV DEF_TARGET_LIST riscv64-softmmu,riscv64-linux-user
diff --git a/tests/docker/dockerfiles/debian-sid.docker b/tests/docker/dockerfiles/debian-sid.docker
new file mode 100644
index 0000000000..cb2fdf0d4f
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-sid.docker
@@ -0,0 +1,33 @@
+#
+# Docker sid/ports base packages
+#
+# This docker target uses the current unstable version of Debian as
+# a base for building QEMU for architectures yet to have an official
+# port.
+#
+# On its own you can't build much but the docker-foo-cross targets
+# build on top of the base debian image.
+#
+FROM docker.io/library/debian:sid-slim
+
+# Add ports
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy  eatmydata
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -yy debian-ports-archive-keyring
+
+RUN echo "deb http://ftp.ports.debian.org/debian-ports/ sid main" >> /etc/apt/sources.list
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+
+# Install common build utilities
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt upgrade -yy
+RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+    binutils \
+    dpkg-dev \
+    make \
+    ninja-build \
+    python3 \
+    pkg-config
-- 
2.30.2


