Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082213CEE8F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:51:31 +0200 (CEST)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5bAg-0001Ue-4S
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5b7q-0005wC-2u
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:48:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5b7o-0000bg-EY
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:48:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso680396wme.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UBpUNb+L8NMOfcLq0OwesI4pAHCDtHwuC35PJMpv0y8=;
 b=tdClvLvEte4+A3f/7IkJZQZLO86+xGvyxNSkSyPap5pLwb4VmmEWeJuuOTBOtpCuq/
 wYLCWuuqjIUJr2Mw/rtyTC6wODfUXjppaOZUDonppzBr5U0CZry1MIeKlfJwIPaz/4D6
 hmZUsz57LM7V7Z5zevUS+yQfWIetTg/CidurkXi9wH+QUikQCfR8fMnkAUqFi2inXjOe
 5Y3cPK0euNh1ZoV78tQNK1pyhl0mWgFwgYJ2FjU9nnRIhC2rlN8IgrUkVDcbcvWGBttI
 butuWARGcr81WYGULoXKSz2PaVWFEwnwtpSnCmMdj3kIyMIT622pXpbiRfa2lRyX9H1z
 22gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBpUNb+L8NMOfcLq0OwesI4pAHCDtHwuC35PJMpv0y8=;
 b=uTF/xFG8NNbjFT/IdCLgYjwpQRscPfRCjOG7wP4XwMeIWsM4pE/DYn9TIA6AYpjbpY
 q86Txzl3rFPG5bMrXX66YjbK/KlQfRmvnNYEit/y3oQS0i4tmz9aydvRgwnGuU7gigDh
 pY64avtYC9PHiHY+MWj6ZgkBkxXZxTWhfvwHLr9zKdwQZ4KBRh/GHQK63vNmF/hzoDEC
 QzziFwWS3ckN//hkCVggzDh4ciZ0zUEm4+Srl9LASxzhapplzmo0qDbR8stSUpxCD1Ak
 B+p7VrHThfVGyFJ/n1lHtxKfK2AvESU0Kyw0GkMGk+npwpTdJxO098Ci+nP1wX4/dclc
 hZGQ==
X-Gm-Message-State: AOAM530/Iq+BKN4qGvsF/QLRsxs8qebTtfZcD9rPdaLf/ubUQ+Epj0I8
 7gEHPLGEyDBDx3K3wsMt3ipYCw==
X-Google-Smtp-Source: ABdhPJxLBKHJ1tpp1JeyVZjYwDuba791K3hbRbWqm2j5y8LGQBLX6jq+A0XvBEhf16l07wJT4c9rpg==
X-Received: by 2002:a05:600c:4f12:: with SMTP id
 l18mr20708469wmq.22.1626731310855; 
 Mon, 19 Jul 2021 14:48:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o19sm9148638wmr.18.2021.07.19.14.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:48:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDB0D1FF8C;
 Mon, 19 Jul 2021 22:48:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] gitlab: enable a very minimal build with the tricore
 container
Date: Mon, 19 Jul 2021 22:48:25 +0100
Message-Id: <20210719214825.2264-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210719214825.2264-1-alex.bennee@linaro.org>
References: <20210719214825.2264-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
the minimal dependencies to build qemu-tricore-system and its
check-tcg tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml                    | 11 +++++
 .../dockerfiles/debian-tricore-cross.docker   | 40 ++++++++++++++++---
 2 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 89df51517c..5198b79deb 100644
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
+    CONFIGURE_ARGS: --disable-tools --enable-debug
+    TARGETS: tricore-softmmu
+    MAKE_CHECK_ARGS: check-tcg
+
 clang-system:
   extends: .native_build_job_template
   needs:
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 985925134c..4ea9112289 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -15,9 +15,39 @@ RUN git clone --single-branch \
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
+# Install very minimal QEMU build deps for use in CI
+# $ lcitool variables debian-10 qemu+minimal
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+       bzip2 \
+       ca-certificates \
+       ccache \
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


