Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E62FA04E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:49:14 +0100 (CET)
Received: from localhost ([::1]:52134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Ty5-00027c-M9
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1TwB-0000hF-VD
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:47:17 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Tw9-0008I8-G9
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:47:15 -0500
Received: by mail-ed1-x52d.google.com with SMTP id g24so17380566edw.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1BgCUTwfpzE34Pm0T4NFZZPFnLEuyaI7/uRzuYIpCPo=;
 b=TMNPj7sVoGYk5v1D70oyaGIaxlYr04MLWYSOYm1waquHIUNPAAjzqrCMC7dBVRIN4O
 r80RNbxn6Ub3Nmk4GckU2sQmRQi7iOyOIedeo1dgKC4kJh89ujBsAqjCf8XASv3qbgsW
 xbJg4/PN25cZQMFYeCZUP+q4VOPF2n6XtU77KUWmqPPQNR5i+0LzxHi09dV96TEil7cl
 4pVgb+BfxKAtDxSYh3myuyMDY4DqEer0TH1GIY2HA/AahPS4N4Nz9GhoQjKdRqpvtf/z
 bcyZOcPn5udopZqKWD2Pem2Oaq+4s/dpBggfI+UX3c6stgOmH3HRxpTYwYZ4RjaLZ0lg
 O/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1BgCUTwfpzE34Pm0T4NFZZPFnLEuyaI7/uRzuYIpCPo=;
 b=G3Py3xOxibG85SM/RTUiRMdcPTwTnIQvVnPEgqrN7HeJLdyCE/vHCcp0wSGN+6vsBk
 TxFX9QNST3nwJZ4Mv8K/sG6srN+qkVnOtktX5LuV89TeTW3fjR53O1NIouz0YStjamPU
 nPAK67CzmbGSPTfZduzfwUhPhgcvPQM9GMubu0O5FPAq+OCEhageyDM5r4rAfvVTfSkm
 e5Fq1V7ozZDR8f+Oa9DrfnNlvFWlC3UmgKngEEhcZzsta6OPbk5fnU+Rr3Zyazsv+N06
 GBfiGOGiD7+8esGCeF5FUeYhTVVBQBYeUCnMvNTsrH8ybBROKy2HPSUT79d4A8H70qzJ
 6l/g==
X-Gm-Message-State: AOAM530W3PCToAgrvHqZh9NhVbpF1A4G+h3y9tPSUWReKWtviuipaOEH
 EgeCVawEVSpyslcyQKDBwsG9zJ9XUOk=
X-Google-Smtp-Source: ABdhPJzA+pDAwehxrNwO9cL4xxylivjbg9t05bUzV355rwn9UGuMNOggLEJghRZagKcucDBd3zUlOw==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr19682527edj.293.1610974031701; 
 Mon, 18 Jan 2021 04:47:11 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id by30sm10702045edb.15.2021.01.18.04.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:47:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker: Update the xtensa container to debian 10
Date: Mon, 18 Jan 2021 13:47:09 +0100
Message-Id: <20210118124709.215800-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Align the Xtensa docker image with the other Debian-based ones.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/containers.yml                         |  2 ++
 tests/docker/Makefile.include                       |  1 +
 tests/docker/dockerfiles/debian-xtensa-cross.docker | 12 +++---------
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 910754a699f..08bccd96901 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -204,6 +204,8 @@ tricore-debian-cross-container:
 
 xtensa-debian-cross-container:
   <<: *container_job_definition
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-xtensa-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c254ac38d0a..464740533e9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -134,6 +134,7 @@ docker-image-travis: NOUSER=1
 
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
+docker-image-debian-xtensa-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
 
diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
index ba4148299c5..f89f1d9e247 100644
--- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -1,22 +1,16 @@
 #
 # Docker cross-compiler target
 #
-# This docker target builds on the debian stretch base image,
+# This docker target builds on the debian Buster base image,
 # using a prebuilt toolchains for Xtensa cores from:
 # https://github.com/foss-xtensa/toolchain/releases
 #
-FROM debian:stretch-slim
+FROM qemu/debian10
 
 RUN apt-get update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt-get install -y --no-install-recommends \
-        build-essential \
-        ca-certificates \
-        curl \
-        gettext \
-        git \
-        python3-minimal
+        curl
 
 ENV CPU_LIST dc232b dc233c de233_fpu dsp3400
 ENV TOOLCHAIN_RELEASE 2020.07
-- 
2.26.2


