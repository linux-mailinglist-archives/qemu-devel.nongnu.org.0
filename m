Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8240FDFB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:36:27 +0200 (CEST)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGqg-0006sb-7t
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeN-0003Vi-OJ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeL-0005Tz-Qh
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id t18so16145810wrb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jr+p0pukkZcez10LfB9z0Jh9oZrpZIn9A0EB/trEXmg=;
 b=xGbwMFVEx2KhUxYh8v6cDRnPmNV4u/ouYx4llkX5l8G+Q4tuNJE2l+Gk9JXqMvQwKK
 ZNG6hWdrmZj8hQ2H8cJ30NA30aevhed/VVjlO1KKy8djUglzvWi8nKkSg+8aO3LSu7na
 vpX6khvn5mduo8zCMF1K3fsmmnicrHLPpPiFPDWnWxQddkpCVo8+WEojSpFAq+wJoj1K
 e9E+eLBQjl2+iQ/3/z3lzj3lgw8BCeDSWYY3Hc9wqX4NKbiavv1LKIInJr4CuoPqsXpU
 iB3GnI0KVlT058NUKOjfMMwnoGdru8S9GxCy0lywBMQrvQKlqjG3g9lhPJcm6EeoEiBH
 4r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jr+p0pukkZcez10LfB9z0Jh9oZrpZIn9A0EB/trEXmg=;
 b=dLgxy3RL8hFf/dGjLjjYLE6dYTyqaKWkx93NlBEYQabn17Q6j9uErDiWEycCyB+mi9
 wBcOaEnak6BSUwM/cbL0b3UxuieUVuGBaW8X48epcYzavUjxvFYqWAkdrugNtv8coBpl
 m0hs5r6xtftBoPBjGypwADWE/X/bWNFJ7fMB1Ms2y7EVo04jWozgZRUyyfDsc157fqvm
 ZR9Zm8z+VmHqMSMwq1SHLeC+L0DkbUA+CFrtwthQeoE0eomigTIqHpLWu/c7VE4V7MwH
 T1YwND6UA3JQHe8tu+18rvb3tBbPtPC3z1YbMaaLOzFMMRe7moToEW2w+Huv5StBRgow
 v4Fw==
X-Gm-Message-State: AOAM532/3d8zspFeV628tTcYP4Bc/dYSGNY+LuYiethU/9K4hDDki6Kj
 fqke1xhDIZFYUuseaak0PIu3Zw==
X-Google-Smtp-Source: ABdhPJxZzzwPuggjprHpCxKrVoT8Vdbq04+4TZQ89vlbJR93UQLbnKPlSjCgQ7HdpHTEGwPyiyyhgQ==
X-Received: by 2002:a5d:608e:: with SMTP id w14mr13259245wrt.18.1631895820072; 
 Fri, 17 Sep 2021 09:23:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i1sm6843941wrb.93.2021.09.17.09.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 954921FF9B;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/11] tests/docker: promote debian-riscv64-cross to a full
 image
Date: Fri, 17 Sep 2021 17:23:25 +0100
Message-Id: <20210917162332.3511179-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to cross build QEMU itself we need to include a few more
libraries. These are only available in Debian's unstable ports repo
for now so we need to base the riscv64 image on sid with the the
minimal libs needed to build QEMU (glib/pixman).

The result works but is not as clean as using build-dep to bring in
more dependencies. However sid is by definition a shifting pile of
sand and by keeping the list of libs minimal we reduce the chance of
having an image we can't build. It's good enough for a basic cross
build testing of TCG.

Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210914185830.1378771-2-richard.henderson@linaro.org>
[AJB: tweak allow_failure]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - allow_failure: true
---
 .gitlab-ci.d/container-cross.yml              |  3 +-
 tests/docker/Makefile.include                 |  2 -
 .../dockerfiles/debian-riscv64-cross.docker   | 46 +++++++++++++++++--
 3 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 0fcebe363a..a3b5b90552 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -134,7 +134,8 @@ ppc64el-debian-cross-container:
 riscv64-debian-cross-container:
   extends: .container_job_template
   stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  # as we are currently based on 'sid/unstable' we may break so...
+  allow_failure: true
   variables:
     NAME: debian-riscv64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ff5d732889..3b03763186 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -141,7 +141,6 @@ docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-mips64el-cross: docker-image-debian10
 docker-image-debian-mipsel-cross: docker-image-debian10
 docker-image-debian-ppc64el-cross: docker-image-debian10
-docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
@@ -180,7 +179,6 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
-DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 2bbff19772..594d97982c 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -1,12 +1,48 @@
 #
-# Docker cross-compiler target
+# Docker cross-compiler target for riscv64
 #
-# This docker target builds on the debian Buster base image.
+# Currently the only distro that gets close to cross compiling riscv64
+# images is Debian Sid (with unofficial ports). As this is a moving
+# target we keep the library list minimal and are aiming to migrate
+# from this hack as soon as we are able.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:sid-slim
+
+# Add ports
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt update -yy && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt upgrade -yy
+
+# Install common build utilities
+RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+    bc \
+    build-essential \
+    ca-certificates \
+    debian-ports-archive-keyring \
+    dpkg-dev \
+    gettext \
+    git \
+    ninja-build \
+    pkg-config \
+    python3
+
+# Add ports and riscv64 architecture
+RUN echo "deb http://ftp.ports.debian.org/debian-ports/ sid main" >> /etc/apt/sources.list
+RUN dpkg --add-architecture riscv64
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
-        gcc-riscv64-linux-gnu \
-        libc6-dev-riscv64-cross
+         gcc-riscv64-linux-gnu \
+         libc6-dev-riscv64-cross \
+         libffi-dev:riscv64 \
+         libglib2.0-dev:riscv64 \
+         libpixman-1-dev:riscv64
+
+# Specify the cross prefix for this image (see tests/docker/common.rc)
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=riscv64-linux-gnu-
+ENV DEF_TARGET_LIST riscv64-softmmu,riscv64-linux-user
-- 
2.30.2


