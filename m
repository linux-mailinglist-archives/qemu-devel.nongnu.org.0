Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393B3C261D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:40:19 +0200 (CEST)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rfu-0001WY-IQ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWc-00051L-7G
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:43 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWT-0005cg-7e
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id d12so11808672wre.13
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7K2T+7/xRZArnCf+GLaEJe8OjH8H/Pc9dQvIHChB5w=;
 b=i3RN/tEAcpD7RS9NM8D7PRFkn2HeRutNk33d3tO3Sx04SxXpKM1UkE0vhBz0ftG/DI
 2gVfGb5c7WiWS/Vry22pPa5rIyLMmBp3BHj8l/FEoMHrAvRah5xoV/RGuIv5f8s0oCMU
 00PJMyxE3dVbehbxBjhGu2taePQJGNIbX096QHEiyEy2IwU5RxG0V9qAKtQrtclU3gsf
 PFOFhnlCD7wXTyV4NcThNRvfm75KbS9cv4uX/sPvgLBkyDlcoZsyVliY3UxdAJ0jmzra
 /5hs+N1krQ/pFzdU2UQhnz/LVfherWE6i8DQ5p1r0eD869FyhKMZapHDVZ/fTx+vFfil
 GnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7K2T+7/xRZArnCf+GLaEJe8OjH8H/Pc9dQvIHChB5w=;
 b=Tkjf7RAhanQmkneEhlG5aAmbw8w9ZbsZiTJ1QMMdZx4tpHmOeDkC/gtxPRyYqJGiyr
 xSIkJztTkwMt6gsg02Y84ts4fpEOrbJqsYAdcDj3ZEF/92DXIVqDBJJms60pP8Pv8pG1
 aeMfRGtHs+TiP5c0yMXK9jFgPIOOZoskeji5M4nMva0zEwhkSeju/xQuLdB2vSVraIvC
 IxmDtyMPizZgj6OObFfo6j9THj2f7klEScZ6CqucJ50WsRKHW8KMejb4G0gDnajy3TSB
 h9cQQ3mSurZRM6FfjKKijxoOJQxiyRDRdohGFp5UEp0h5d6fhzNQGS2rfeRP4oBhusVh
 xuSw==
X-Gm-Message-State: AOAM5317DGDJGjTWcD2NkA+9Xiw+Vq1pgTYYuR8Uu83BchMZKzKo2Tkb
 xwXYduAa3S/AZheq870wNtMp/Q==
X-Google-Smtp-Source: ABdhPJxSAg0VxLdL/Z6WP386A2VSCGi5WkoNT1nhCTlFHljGQ1biC/wiZqLx+02vfti3kpolyyTEig==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr43941610wri.66.1625841031712; 
 Fri, 09 Jul 2021 07:30:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm6258957wro.32.2021.07.09.07.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 053981FF9E;
 Fri,  9 Jul 2021 15:30:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 17/40] tests/docker: fix mistakes in ubuntu package lists
Date: Fri,  9 Jul 2021 15:29:42 +0100
Message-Id: <20210709143005.1554-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-10-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker |  3 ---
 tests/docker/dockerfiles/ubuntu2004.docker | 10 ++--------
 2 files changed, 2 insertions(+), 11 deletions(-)

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


