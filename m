Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45263C5D34
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:25:30 +0200 (CEST)
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vw9-0008Ei-PQ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vH3-0007bJ-M5
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:43:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vH1-0006HS-Pq
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:43:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id l7so24503114wrv.7
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRpuG5GjYZFaZpFczANpcbFMUqHvtpS+BlaRY7FR9ww=;
 b=Eiad69jK+FNvRvB0MqK6bA7ZhnGZFB1PjoD3hlbDWd75jxvojV4vBhQbtqUFFJsS0Z
 k6V6YQZdaYYyAg+AZfkVhx2MPr/84tY5O5RzTBI9C0+55mNQ5xWyAzomBd45d0E9uonp
 m95cbGcqPyOhxUFl912dOPd1eFhrFtNSqdyPIGI3QBqlbF49ZQGCbd/iosQkHk9AQsL8
 XfozznHh9SJg6ORWhmm4TQDnyB8V1qVrRclWMwLDL7SFLaslDAywXlrWaZ6Tp3KT+KCR
 JNpfy+nEIqZgD2mYURZLPFIfFWiHMVL4VVP/bz9LyLdXnidZ7stPqhQz8m4WJuW5rAVn
 jFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRpuG5GjYZFaZpFczANpcbFMUqHvtpS+BlaRY7FR9ww=;
 b=k1WFNCrsR87lJvuAej5CjphyY8KT5jMWtluWyVdwLrY/N0r4SH4B25IYGiFrURGKte
 5OfWuTp+LYVPVv06IFxHA2hVozSkud09JBTnCn8ICUQ8wZbaCPgZAzHCvuOPfTXlBbPc
 WLGqcchjutH0Go1bx+1390RgAMZCjfu30sW6ikwiwi9deI5WK+HzdPpp3pKqD6cD/xTc
 hnvQD01DvFitWb2wrKL9jN8CmsHSfzjVxvxsGHP184f7htqQS383RVPjpQTTG2A4bOcQ
 X1Comyc6ug84xDWKn+gb0Oxyetlgj0GaXx40CaWBSCDSKnWfTcqUasi2zPIHw+gNOQsq
 1NaA==
X-Gm-Message-State: AOAM530Kcmou0rySlLrsXzuTlT2L1ZpqRQe/LU2bHseFusvCXNsUD74O
 9DZFyIttjoRABKVapVRzKUlfgA==
X-Google-Smtp-Source: ABdhPJyl2BTZdMPZJcofeL662WpCflbxVBFZ5r3TQk3YkRlmoKdkxv3Qb0ZzDUGD/wz5bD5saChlhw==
X-Received: by 2002:a5d:47a7:: with SMTP id 7mr27350949wrb.150.1626093778237; 
 Mon, 12 Jul 2021 05:42:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x1sm21290835wmc.0.2021.07.12.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:42:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 24D3C1FF9B;
 Mon, 12 Jul 2021 13:26:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/40] tests/docker: use explicit docker.io registry
Date: Mon, 12 Jul 2021 13:26:25 +0100
Message-Id: <20210712122653.11354-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

It is good practice to use an explicit registry for referencing the base
image. This is because some distros will inject their own registries
into the search path. For example registry.fedoraproject.org comes ahead
of docker.io. Using an explicit registry avoids wasting time querying
multiple registries for images that they won't have.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-5-berrange@redhat.com>
Message-Id: <20210709143005.1554-13-alex.bennee@linaro.org>

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


