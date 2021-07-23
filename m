Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28A13D3E45
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:13:57 +0200 (CEST)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ykG-0004D9-RZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybu-0002dv-Ek
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:05:18 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybq-0005vy-QB
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:05:18 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so1075031wmq.2
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jx7A6ir3Pd5IqO8pTL8XUcRpiT40w3NiQ1bVTzzR3Gg=;
 b=QKEd5JnkXSPJwPZaYxrkks7zWinNS3eEDFFZMl+LHQ/ioj0DIZrqPz5RoFiGS8gDgQ
 sNKNSe/795oUcGT6iVzaiPg0tV1r2ZMx9lPh0PtXWCyjRamMQz1KFGN0sBxwPvbwytla
 n6Mjrz7xilYnJs7vg0TDbrgdZ7UnSb3cCF64CPkEK1F1VfYsdXuSsD/pW8wcTwJmSohK
 oZOkq1kUYg8bnDKAxVCBAYZt4A7AcKEFaVkR2cNe/IJ8cHeNz+0RpQ47fqkcm8tOCSk9
 jahuabok4f2Vp6qrFEyEJT1B6iYpiAJLU0/JX9NNcFFDeDGWM5wIjX+1kTpOZcqT6JwL
 gRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jx7A6ir3Pd5IqO8pTL8XUcRpiT40w3NiQ1bVTzzR3Gg=;
 b=DWc1UrUwDr1bRe21r62Ijku3/jBzMLK4N5gFyl1xkEOBZk+zlpDNaxKS9vu2W3rBo7
 PSvKFIpFEgIJ2w8wsjicmKDm7hNrlDyMeNUCcOckdaisRj5Wy4W6w0wEX61pyOd5RQO5
 DWKZPaqVJUPW2Br4vYGKOcL7Gw3w8bUKMUjRyEDBdTqWJ24B5nedlD1+m9/68kbEUc0k
 1v6PQh+HVHi3nxXclsKp6b8xW+vwdGJxFshxAPU5fr5evHATw3qG8G5VHOJewUSPC4LX
 A3y4z+H+Iti3udHe/+StzW4nmFmCB6OroRJZwcfOU66kh2L8Zy/Pp4nWjrLkejey0N9T
 sN7w==
X-Gm-Message-State: AOAM532eVDCqbVwKHKJTN+y4yd93IrLf+1KUXFJOel5AHXV1iRYzq1u0
 5D1jajeW2cWXTxydEmd9MHKchQ==
X-Google-Smtp-Source: ABdhPJyThqGVubzpm6Puypj4F+k4Sj6SfAE0VmkB2QRh88pYU7OcDF/i5DUTDrVUVv1pvKRySfod2A==
X-Received: by 2002:a05:600c:47c4:: with SMTP id
 l4mr14925568wmo.125.1627059913587; 
 Fri, 23 Jul 2021 10:05:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm32559104wrx.59.2021.07.23.10.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 938BF1FFB3;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 26/28] gitlab: enable a very minimal build with the tricore
 container
Date: Fri, 23 Jul 2021 18:03:52 +0100
Message-Id: <20210723170354.18975-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than base of the shared Debian 10 container which would require
us to bring in even more dependencies just bring in what is needed for
building tricore-softmmu in GitLab. We don't even remove the container
from the DOCKER_PARTIAL_IMAGES lest we cause more confusion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210720232703.10650-28-alex.bennee@linaro.org>

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
2.20.1


