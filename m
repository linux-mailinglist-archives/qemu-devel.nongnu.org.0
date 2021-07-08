Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7883C19D8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:32:41 +0200 (CEST)
Received: from localhost ([::1]:55712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZlI-0003YK-FX
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPV-0003c1-TI
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:11 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPL-0004pE-Bo
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id w13so4771754wmc.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXT7sol+1pk4kO/P5DB1EVTnMN8KnY6InxmVm1gqicQ=;
 b=DVhPmJDb0yo7R3plJywQ22DFk9Lt8ftcebrkHKAXRSDYD7fnMpnsQZqMYSRk0fV7DT
 mruIrIvTVulUXGT6cWO+GtcSStCWRfIB8M9/Sv2tlZrvwayTKgK9+7GxWJJiVTh+64RK
 5MmhtypkNUlUVkpuUZvVHYzarxTIoabU3/AXMHrfqWHH1yu3gOh9LM3knv5fyx3ARW50
 A7AyioFOkpnR21wzNueKXWwEV+7fHPY4wX0hPWjXQHWO4q3XGg8U/ZKrI426C1BOZJIG
 PqBpRiidDwZKOiBrrkOpCp3Qo40xbdbBCT3tx8xiYW1pgaAt7xMOrOU4jhNOPjd1mqvB
 +y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXT7sol+1pk4kO/P5DB1EVTnMN8KnY6InxmVm1gqicQ=;
 b=GTe6lIOMGOBmO54fsEcUb62qgJbw7U6+T2RMpZSp+ULUN6vuy5TeKBkHvhyHzVqiil
 bEIIU0R6fk43CNQk3DGyOa02GLCRuYsAJ1lI65CMEbiU+eiXrPzlzI0P4D/oufuTi6t3
 xbMjm0PcKttz8JXBqElDDz5S5vU95fqQFZXr+fSy6wU6WzuElWdh7Eh15P/5ZJdvS11E
 PC797m+odfR6Pi9+OApVClcwtKGDM2gA5oTl1aUCeQqoJOoxuOc5TjDuPeiR3h1IQR+i
 EK6i+6EGyuNo2Z4RhTXbnvYborOGIV1ZzTa/EmrhNu+aTHpsOcPYRr1jXT6svBPMAmMe
 ZTAw==
X-Gm-Message-State: AOAM533wIhkKDhcxzMZC4Xmql6U+M/GIOJjSXq49+7P22hcPbLTmdSgS
 6NtkBe1JAiTR+IFB0+zcgos8nw==
X-Google-Smtp-Source: ABdhPJwhpuQGDClvxilXAjmwq9z1sXypaQCDA2aDFrQ7c5/gRo9kGxRf5GmdpfhTdbR/Qtft+Bno/Q==
X-Received: by 2002:a1c:e485:: with SMTP id b127mr6956656wmh.91.1625771397889; 
 Thu, 08 Jul 2021 12:09:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x1sm10031947wmc.0.2021.07.08.12.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56A3A1FF87;
 Thu,  8 Jul 2021 20:09:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 12/39] tests/docker: use explicit docker.io registry
Date: Thu,  8 Jul 2021 20:09:14 +0100
Message-Id: <20210708190941.16980-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

It is good practice to use an explicit registry for referencing the base
image. This is because some distros will inject their own registries
into the search path. For example registry.fedoraproject.org comes ahead
of docker.io. Using an explicit registry avoids wasting time querying
multiple registries for images that they won't have.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-5-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/centos8.docker             | 2 +-
 tests/docker/dockerfiles/debian-xtensa-cross.docker | 2 +-
 tests/docker/dockerfiles/debian10.docker            | 2 +-
 tests/docker/dockerfiles/debian11.docker            | 2 +-
 tests/docker/dockerfiles/ubuntu.docker              | 2 +-
 tests/docker/dockerfiles/ubuntu1804.docker          | 2 +-
 tests/docker/dockerfiles/ubuntu2004.docker          | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 03e0440e03..8f810810f3 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,4 +1,4 @@
-FROM centos:8.3.2011
+FROM docker.io/centos:8
 
 RUN dnf -y update
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
index ba4148299c..2f11b3b7bc 100644
--- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -5,7 +5,7 @@
 # using a prebuilt toolchains for Xtensa cores from:
 # https://github.com/foss-xtensa/toolchain/releases
 #
-FROM debian:stretch-slim
+FROM docker.io/library/debian:stretch-slim
 
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 4ffe47671e..a27b88df55 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -7,7 +7,7 @@
 # On its own you can't build much but the docker-foo-cross targets
 # build on top of the base debian image.
 #
-FROM debian:buster-slim
+FROM docker.io/library/debian:buster-slim
 
 # Duplicate deb line as deb-src
 RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
diff --git a/tests/docker/dockerfiles/debian11.docker b/tests/docker/dockerfiles/debian11.docker
index 5adfd62d55..febf884f8f 100644
--- a/tests/docker/dockerfiles/debian11.docker
+++ b/tests/docker/dockerfiles/debian11.docker
@@ -8,7 +8,7 @@
 # On its own you can't build much but the docker-foo-cross targets
 # build on top of the base debian image.
 #
-FROM debian:bullseye-slim
+FROM docker.io/library/debian:bullseye-slim
 
 # Duplicate deb line as deb-src
 RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index 100cfa76e3..e0ff425c01 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -9,7 +9,7 @@
 # system won't pick up that it has changed.
 #
 
-FROM ubuntu:20.04
+FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
     ccache \
     clang \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 86114be23a..adcdef8244 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,4 +1,4 @@
-FROM ubuntu:18.04
+FROM docker.io/library/ubuntu:18.04
 ENV PACKAGES \
     ccache \
     clang \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index b33ed139d9..78755bc2e3 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,4 +1,4 @@
-FROM ubuntu:20.04
+FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES flex bison \
     bsdmainutils \
     ccache \
-- 
2.20.1


