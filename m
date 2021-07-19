Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF443CEB76
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 21:52:06 +0200 (CEST)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZJ7-0006bI-UQ
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 15:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5ZHG-0004UK-6W
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:50:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5ZHE-0006e1-Bx
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:50:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id k4so23418117wrc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k2M04I6fdSAVcFHWF90gT3uBV37ys7ZO5OsLg838FEk=;
 b=p+TxOSX4Hl9Yez6xfacbSJpNa1UHbar4/P/XPyEA7OGrJasUT2DIoBATW2WJVvb4v9
 D0eP8E3HW5mzS8V915wtFRZUR5n6AreyDMSmk/zdJkAk3srmNQekXGEfCtsqu6bT4/5j
 IKTWWZ2zxS9311i8sWG0+sLuC2LUHw7tPmzeIvCVdKaqDdP9rorCYcDg1sqCxh1WfCch
 bOpmJsWBmWnuoa6kp2PKKRow4g0u2i3dhzz2JQ1CI727RHMYUWL0Zq5IB/2P7vc8ULTZ
 XNJgeejsIGGP6/aSZzDvVY1eYPNGuR7X5kfn+D9kkmHdQg+13HDhub9HD32udiqKyfXq
 nEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k2M04I6fdSAVcFHWF90gT3uBV37ys7ZO5OsLg838FEk=;
 b=K8eA7JQjPq/nCgH0SY6qDBx5qz1v2n2RhKkqiWzozbQFFNeWjKVST9PdMve84/5eel
 Gi2ghbhnxZTROj0t9hr3JldRP5SCzYPS9qCVih8Dem6Tyn+P+rOFelMs7PNK2zjtARHH
 fLJF+4EfRpBm1EI59qEsfxBuTRExZw1qPMMN+dIKkD6wiVEpxmIvCWQ05dD0f2mbX7JB
 TfR9jk+UGXkwoz8onyx4gHhaE5gJCW5NLRCQgu7FhfUjhNnKqyn4fikOBZXOqO5gIGWO
 3dwx8nLbLMc5BXeaxGOditNha63G9xi/Log7FErMorU+U+qOdOZHGTEaJ6eZy1lcHPTb
 jL5Q==
X-Gm-Message-State: AOAM532PtD8ZHM0fqbfWvFQv94TnVLNKM+5JqGxb5XC/kMnr/X4FKKtn
 7BpFomOkcgBV1+EgB/APbnstMA==
X-Google-Smtp-Source: ABdhPJwSFeQ0cid+rMtFQz+ar9bdoy7UBeqZl+1xSxt4D4tnOIouSI/KXXGBHjJ9OQX6lkGeKVi47g==
X-Received: by 2002:a5d:4e0d:: with SMTP id p13mr31608708wrt.372.1626724207058; 
 Mon, 19 Jul 2021 12:50:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a10sm20938479wrm.12.2021.07.19.12.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 12:50:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38EC61FF8C;
 Mon, 19 Jul 2021 20:50:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] gitlab: enable a very minimal build with the tricore
 container
Date: Mon, 19 Jul 2021 20:50:02 +0100
Message-Id: <20210719195002.6753-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210719195002.6753-1-alex.bennee@linaro.org>
References: <20210719195002.6753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do the same thing as hexagon and do a two stage build that provides
the minimal dependencies to build qemu-tricore-system and it's
check-tcg tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml                    | 11 +++++
 .../dockerfiles/debian-tricore-cross.docker   | 48 +++++++++++++++++--
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 89df51517c..1f3fbcd965 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -354,6 +354,17 @@ build-some-softmmu:
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
+# We build tricore in a very minimal tricore only container
+build-tricore-softmmu:
+  extends: .native_build_job_template
+  needs:
+    job: debian-tricore-cross-container
+  variables:
+    IMAGE: debian-tricore-cross
+    CONFIGURE_ARGS: --disable-tools --enable-debug
+    TARGETS: tricore-softmmu
+    MAKE_CHECK_ARGS: check-tcg
+
 clang-system:
   extends: .native_build_job_template
   needs:
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 985925134c..50c87f251f 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -15,9 +15,47 @@ RUN git clone --single-branch \
         https://github.com/bkoppelmann/tricore-binutils.git \
         /usr/src/binutils && \
     cd /usr/src/binutils && chmod +x missing && \
-    CFLAGS=-w ./configure --prefix=/usr --disable-nls --target=tricore && \
-    make && make install && \
-    rm -rf /usr/src/binutils
+    CFLAGS=-w ./configure --prefix=/usr/local --disable-nls --target=tricore && \
+    make && make install
 
-# This image isn't designed for building QEMU but building tests
-ENV QEMU_CONFIGURE_OPTS --disable-system --disable-user
+FROM debian:buster-slim
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+# Install QEMU build deps for use in CI
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+       build-essential \
+       git \
+       libglib2.0-dev \
+       libpixman-1-dev \
+       ninja-build \
+       python3 \
+       pkg-config
+       bzip2 \
+       ca-certificates \
+       ccache \
+       diffutils \
+       findutils \
+       g++ \
+       gcc \
+       git \
+       libcapstone-dev \
+       libfdt-dev \
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
+COPY --from=0 /usr/local /usr/local
+ENV PATH $PATH:/usr/local/bin/
+
+# This image can only build a very minimal QEMU as well as the tests
+ENV DEF_TARGET_LIST tricore-softmmu
+ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools
-- 
2.32.0.264.g75ae10bc75


