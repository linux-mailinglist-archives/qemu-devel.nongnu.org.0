Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB13C5CBA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:59:39 +0200 (CEST)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vX7-0002bQ-W3
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vGx-0007JC-PX
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:56 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vGw-0006FN-74
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id l6so3028120wmq.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Es1RG/B2xZon5hl3f2n44IU4fzXdGWAsx08bjdmHm3k=;
 b=Q7eYlYQcX8FFzbywsBDNVeYSIJvnSfvPNgD08h/G2GzTyHdj5aE7diosPGuxlItTbR
 7dezITfsnCpFjP1aN3JqfL2fa2VYxxaJHEpDmb+qIdFkAHCpnGVIEdbw+vVzU1xIpACj
 R+XLfQD+HoML7mavzO0pudE5Q3YH5azSetj49Z8FSEcPzszHq0LV7EyNCkfs0ccGQBQI
 NJjWezPDm0BECe00d0Sz9lnYSxfJeoWQ89wxH1ufjAAEIt6dnhOfcXgzZGi2lvGS1H3b
 obOUIDjPV/GKg1lCizAZGfHau4JbyherXNQ1ZDxJxLu8ZO8dXbCzqmyGARHJ3GAs4hPv
 TqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Es1RG/B2xZon5hl3f2n44IU4fzXdGWAsx08bjdmHm3k=;
 b=IpUt5D6sK8U1JZDg0ok7xJ1X4CzrVG6wppePaE/iPp5j/idq5qk/74kT42OYj2zHYy
 ehVz+k8hWDggllCMu/1rXP16x2+MfrbXjjeE1O1FOZAeexw4fgIgUf6uRkrzg02QA53Q
 Pt5Z8/xOtDNTExnC9b9a+GP7QOderCrvCORIzJkWh8LnwSZM/1U5nmO+NEKD8QVk0/Qa
 iVwFIiV+Xe6VPf+qxpRuOaCEpqnFHd6qMii3QaBvSmTYuhiBSn2kVX1SZJ3ies/znDaa
 BK1vvNEA5scO48hWd/ZPKWmGtuPM4IKimJQ26j8kYo501kYxY7CxKjWn9ePI8V2LvvoA
 0rzw==
X-Gm-Message-State: AOAM532VahVXDeeEJ73twcLyQ+BgAy/oWuZjdv/8MLpJadzAa3R2B0+H
 oFchS8WO6papbufYPQbLAmiLRA==
X-Google-Smtp-Source: ABdhPJw5YZs1P5EMIZZzYFBSlxLly71W6NeVmSNJAduPCC7dP72B/iiLBu2fEhaBRpYjJjFWqTc6KA==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr5252269wmi.21.1626093772846; 
 Mon, 12 Jul 2021 05:42:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i11sm22319891wmg.18.2021.07.12.05.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:42:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC8AE1FFA5;
 Mon, 12 Jul 2021 13:26:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/40] tests/docker: fix mistakes in ubuntu package lists
Date: Mon, 12 Jul 2021 13:26:30 +0100
Message-Id: <20210712122653.11354-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

librados-dev is not required by QEMU directly, only librbd-dev.

glusterfs-common is not directly needed by QEMU.

QEMU uses ncursesw only on non-Windows hosts.

The clang package is clang 10.

flex and bison are not required by QEMU.

Standardize on nmap ncat implementation to match Fedora/CentOS.

Remove vim since it is not a build pre-requisite and no other containers
include it.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-10-berrange@redhat.com>
Message-Id: <20210709143005.1554-18-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index a50a35e6fe..ee8545e4b1 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -5,7 +5,6 @@ ENV PACKAGES \
     gcc \
     gettext \
     git \
-    glusterfs-common \
     libaio-dev \
     libattr1-dev \
     libbrlapi-dev \
@@ -24,12 +23,10 @@ ENV PACKAGES \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
     liblzo2-dev \
-    libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
     libpixman-1-dev \
-    librados-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index eee2ef3cac..25f56adfb2 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,16 +1,13 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
-    bison \
     bsdmainutils \
     ccache \
-    clang-10\
-    flex \
+    clang \
     gcc \
     gcovr \
     genisoimage \
     gettext \
     git \
-    glusterfs-common \
     libaio-dev \
     libattr1-dev \
     libbrlapi-dev \
@@ -30,12 +27,10 @@ ENV PACKAGES \
     libjpeg-turbo8-dev \
     liblttng-ust-dev \
     liblzo2-dev \
-    libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
     libpixman-1-dev \
-    librados-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
@@ -53,7 +48,7 @@ ENV PACKAGES \
     libxen-dev \
     libzstd-dev \
     make \
-    netcat-openbsd \
+    ncat \
     ninja-build \
     python3-numpy \
     python3-opencv \
@@ -67,7 +62,6 @@ ENV PACKAGES \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-    vim \
     xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
-- 
2.20.1


