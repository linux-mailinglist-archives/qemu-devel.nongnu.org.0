Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C196D3CF924
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:49:44 +0200 (CEST)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oFr-0002xW-RU
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5o7W-0005VG-FR
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:41:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5o7U-0008FM-Hy
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:41:06 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d2so25707255wrn.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0+GPJUpv/2AzF0aBnfTMkoDpWD3ukBFAJPYuPusAuc=;
 b=S2YN4hCFJ5yz3o7Dvzdrh7WaIb7wgHrLD70bWWIQTCeAOdzaZjhS3m0gdcRU2j8tGz
 oXs6RIMYR5lKq99aajxQ3VfKW0SSc/lC3lxyVfZQH4GenCoauZNbiICdJNFVoLAa+L7V
 CLeR9hGQMFLoM2GMDUL3yOayxkPU9APZ2Bi2Ar8RDLtphMqY7VaEacEJlx0ICE2YCzkv
 vp/JA5xM1/xn1AAFOMj2uJWj4VNRBN+6yhYXgjsEYBCCwuUPOU15fQQRNGSESRjgmHQs
 WBFFITStY3aaGMfzMMouucQktgbLlN2ZbLYQnBRQFmXw4Xks145JEePCXlh4ERUM+TgO
 OQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0+GPJUpv/2AzF0aBnfTMkoDpWD3ukBFAJPYuPusAuc=;
 b=rUOoHPHZ1K93LJ0dsaNkWiCo4hQ5HRGcuEnHp/n0wKn2nxVTz1E8PF335K8t1sxleh
 CDK41pT/5YRlxf6Z6k8mF1+WU4g1N2h8LSM0olsaDl5BfbIZlVHWToZTtumb/q9thOs5
 5mzYpXMWgmi5nPR5jm0JDEabJCBrSwYuHv/mt1WE4jO6VlFWFxdcm8kgaLE6Z+mHJOC/
 Cmwu62opGH3PxdMaOUic+4k+PEsYy1ocrP8C2ezqhflBDp2yX0qkz2oAYc+Ij1FvvUuJ
 3hebIAkonR5iOolcJTQUXATmCqPjBZRMcjpuwOaChWY/oE+3MT4Kxr5CEPh1ynlEXpLY
 eJMA==
X-Gm-Message-State: AOAM533Egln0zk/JC/Eqo5F2yxq0nRaWfhOeHA81XaxOUdlTlqyKI4ih
 3dRekW6+2634jIJ0exT5vo+/Cg==
X-Google-Smtp-Source: ABdhPJzMYNFiJWf5S+ByhfL3EVOdFeBGkZGOJkXX4FHKnZQ4x5diyNDBoymJXQpgRDkcZXYikeKsrw==
X-Received: by 2002:adf:facf:: with SMTP id a15mr35053871wrs.39.1626781263149; 
 Tue, 20 Jul 2021 04:41:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm19223920wma.48.2021.07.20.04.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 04:41:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD1411FF8F;
 Tue, 20 Jul 2021 12:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] gitlab: enable a very minimal build with the tricore
 container
Date: Tue, 20 Jul 2021 12:40:57 +0100
Message-Id: <20210720114057.32053-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720114057.32053-1-alex.bennee@linaro.org>
References: <20210720114057.32053-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than base of the shared Debian 10 container which would require
us to bring in even more dependencies just bring in what is needed for
building tricore-softmmu in GitLab. We don't even remove the container
from the DOCKER_PARTIAL_IMAGES lest we cause more confusion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - make a uni-container (but not based from common code)
---
 .gitlab-ci.d/buildtest.yml                    | 11 ++++++
 .../dockerfiles/debian-tricore-cross.docker   | 34 ++++++++++++++++---
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 89df51517c..48cb45a783 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -354,6 +354,17 @@ build-some-softmmu:
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
+# We build tricore in a very minimal tricore only container
+build-tricore-softmmu:
+  extends: .native_build_job_template
+  needs:
+    job: tricore-debian-cross-container
+  variables:
+    IMAGE: debian-tricore-cross
+    CONFIGURE_ARGS: --disable-tools --disable-fdt --enable-debug
+    TARGETS: tricore-softmmu
+    MAKE_CHECK_ARGS: check-tcg
+
 clang-system:
   extends: .native_build_job_template
   needs:
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 985925134c..d8df2c6117 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -1,23 +1,47 @@
 #
 # Docker TriCore cross-compiler target
 #
-# This docker target builds on the debian Stretch base image.
+# This docker target builds on the Debian Buster base image but
+# doesn't inherit from the common one to avoid bringing in unneeded
+# dependencies.
 #
 # Copyright (c) 2018 Philippe Mathieu-Daudé
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:buster-slim
 
 MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+       bzip2 \
+       ca-certificates \
+       ccache \
+       g++ \
+       gcc \
+       git \
+       libglib2.0-dev \
+       libpixman-1-dev \
+       libtest-harness-perl \
+       locales \
+       make \
+       ninja-build \
+       perl-base \
+       pkgconf \
+       python3-pip \
+       python3-setuptools \
+       python3-wheel
+
 RUN git clone --single-branch \
         https://github.com/bkoppelmann/tricore-binutils.git \
         /usr/src/binutils && \
     cd /usr/src/binutils && chmod +x missing && \
-    CFLAGS=-w ./configure --prefix=/usr --disable-nls --target=tricore && \
+    CFLAGS=-w ./configure --prefix=/usr/local --disable-nls --target=tricore && \
     make && make install && \
     rm -rf /usr/src/binutils
 
-# This image isn't designed for building QEMU but building tests
-ENV QEMU_CONFIGURE_OPTS --disable-system --disable-user
+# This image can only build a very minimal QEMU as well as the tests
+ENV DEF_TARGET_LIST tricore-softmmu
+ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools --disable-fdt
-- 
2.32.0.264.g75ae10bc75


