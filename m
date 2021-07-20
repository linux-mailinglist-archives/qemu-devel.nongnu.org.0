Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358533D05D9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:50:46 +0200 (CEST)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zVd-0000KQ-74
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFu-00043h-6M
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFr-0001fd-Fl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:29 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t5so155887wrw.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kMBGMCNJi8vwExvrsxeqq8I2lJQnUdceeasIbv5WjI=;
 b=YlTVyyB+T3S/TTstUbFp4zg0H8cEcjANUAj1YvJyx4EDYjgBdFT3/01V1b1N0EjBFn
 2Dy6KiLqlwN1kpBX2h2Ned6ILFOSa63z54UzdmOQnddm1U8rBVRazdhrd7lUkszEz13i
 h+39yfI9aTBeRTShy5/eq3e1zDQpkDb7uhtwpACQsJDiqh49/I/easHzMGVmwfkVIhI4
 pwhDuELoUA9uA7l6sx1nDCMKvJp6vfrNQmhRsg9/PsQX/uI3tVPwpr/SvXyK7mhxG6fL
 BAyxP3ppVOx1Ly8uNNrimzwFhVppV6pWiLhbbC44rc1gt9ZhLkfcsp87lddFMgf6MlIP
 p4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kMBGMCNJi8vwExvrsxeqq8I2lJQnUdceeasIbv5WjI=;
 b=cXtVbDTaVbetBB5DSjPqXuyWaLaao2AwdMgfviR3ICfuX4zfBNMjwuSmH2I1kGoWZ1
 /wEsUaH/Q3f2JYd2/JH5+3HrNH/Y9cYg8cFP0VZ4F8axSkijTGOM9pMtvQzL38dTG97d
 FKtluY4nme0fFvy8ADnedSHTmsCF/8mFIUqXftff/9GRfwVY3QZLpHyS9stbx2PV97FU
 N7nkEnqzkI6oK02e1orD7uBqFT6tLQbfdl8hPx3KisEdQffpm769/SzXMtYYVVix9q3e
 5RNjakQB7Gh+HuB3p2tsRLK1Vc57z79RC8Zbsde91RuTcuCGOafzGVFuNhpnlZj7A2mj
 ZpmQ==
X-Gm-Message-State: AOAM531EGmkayjDozt5GcpqyrYp8iPUwDxbmUcCt6MsFSR5OAGUDTT+V
 0/mST5iHlqx2tO/tPhOuzRTQtw==
X-Google-Smtp-Source: ABdhPJxVWI8TS4bEfAYqw8HoqxdDapnLBaEXsGmKJ5hkREkbEfSblhBvNhXW6ggiQ4nvFFzRKWrMdQ==
X-Received: by 2002:adf:fc85:: with SMTP id g5mr39448047wrr.296.1626824065998; 
 Tue, 20 Jul 2021 16:34:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s6sm29684144wrt.45.2021.07.20.16.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 606611FFB1;
 Wed, 21 Jul 2021 00:27:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 27/29] gitlab: enable a very minimal build with the tricore
 container
Date: Wed, 21 Jul 2021 00:27:01 +0100
Message-Id: <20210720232703.10650-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than base of the shared Debian 10 container which would require
us to bring in even more dependencies just bring in what is needed for
building tricore-softmmu in GitLab. We don't even remove the container
from the DOCKER_PARTIAL_IMAGES lest we cause more confusion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210720114057.32053-4-alex.bennee@linaro.org>
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


