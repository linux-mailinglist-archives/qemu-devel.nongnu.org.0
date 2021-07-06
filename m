Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1D3BDA29
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:27:13 +0200 (CEST)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mye-0006Pi-M1
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfS-0005fx-0q
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfP-0007Hd-VN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n9so9126644wrs.13
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFyLbsCarDbcc8xVrNzNM3GtcCMt9zLW6sDCVFExxAQ=;
 b=HiJngSbqS6k+mUQCr3YV666d/elEh1N2PJdFFPMLBN9Okjv17qAXcSse+XOSFN93y7
 6SAmrBwJBRoZN2u+Vbk/ejY1m+YARlMNgJpj9o1+OupJLBV8ENbU58P1GqSw+yZGVHN+
 5l3/smIaChJmyEYvONPE+EsKAB6dgLeX72isp5AnONZqRzNDndY446pLe0sDxPcfr2p4
 LD85R/2AocMT1FDqcIZYLHirbLqMIoNKpIPEffIPTtkIoH4Dvub1FJm+RwNQi5XMQy2c
 9Onm6SWcs5ObmryQ51zbmnMYrj3PCNq4rRWgPKkc/ymwrxo4I2J/4KF4G70Xkt7vsPvs
 0pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFyLbsCarDbcc8xVrNzNM3GtcCMt9zLW6sDCVFExxAQ=;
 b=C9jDZCjNll1Qvvbi6/e54NH0Ieif6PJMctxghpoKRgSAS4yyPWL2EoSI6YGB37iNiu
 SG9gH4Q1DTiq/ifFlOgkO4dWOOg+k3dIUv0lffmq3snlviqqUPAFugozl5gGOhUXW9aW
 i/8VxmW7bvpJD0HPxF76NGvv/G4zriB0zkG4sOb1NCWvyzcG3cnZSRt9Yl8/LiETijvt
 9PeVM9Aib9zJBneOMUUPf6/RpQWwfiiPeuXeY808Y9jHCknofiYmX5P0iRdzLxzYOU9D
 QzNeUPmKroVkx3j5NzZ3qPwaT2ux3kelOAse1cEqchSskEAm5fnsnfy8EEJuzifTSpnf
 LgPg==
X-Gm-Message-State: AOAM5335P6WXxUxMOfLl1SbGsJso8u/3yEDm0hywtSmDmCtUbsFCwJUl
 yHr2m9TJ+B+sGK7DzrDj5xb9cCmL6iu5nw==
X-Google-Smtp-Source: ABdhPJwWWByY5FV6iJdzxzGQqQpNp86dcAtDGcs1RmacgHGRTutz1Vw6+9gZ85pUOz03gZSesZQMDA==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr22805718wrq.387.1625584038555; 
 Tue, 06 Jul 2021 08:07:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z7sm3151308wmi.1.2021.07.06.08.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E8431FF7E;
 Tue,  6 Jul 2021 15:58:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/39] tests/docker: fix sorting in package lists
Date: Tue,  6 Jul 2021 15:57:52 +0100
Message-Id: <20210706145817.24109-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This will make diffs in later patches clearer.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-7-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/centos8.docker       |  2 +-
 tests/docker/dockerfiles/fedora.docker        |  4 ++--
 tests/docker/dockerfiles/opensuse-leap.docker | 16 ++++++++--------
 tests/docker/dockerfiles/ubuntu1804.docker    |  4 ++--
 tests/docker/dockerfiles/ubuntu2004.docker    |  8 +++++---
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 8f810810f3..ee52305646 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -22,9 +22,9 @@ ENV PACKAGES \
     lzo-devel \
     make \
     mesa-libEGL-devel \
-    nmap-ncat \
     nettle-devel \
     ninja-build \
+    nmap-ncat \
     perl-Test-Harness \
     pixman-devel \
     python36 \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 64a413f5e0..4a0a84eb43 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -2,6 +2,7 @@ FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    SDL2-devel \
     bc \
     brlapi-devel \
     bzip2 \
@@ -79,10 +80,10 @@ ENV PACKAGES \
     mingw64-pixman \
     mingw64-pkg-config \
     mingw64-SDL2 \
-    nmap-ncat \
     ncurses-devel \
     nettle-devel \
     ninja-build \
+    nmap-ncat \
     numactl-devel \
     perl \
     perl-Test-Harness \
@@ -97,7 +98,6 @@ ENV PACKAGES \
     python3-sphinx_rtd_theme \
     python3-virtualenv \
     rdma-core-devel \
-    SDL2-devel \
     snappy-devel \
     sparse \
     spice-server-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 7ebff1b3a8..6011447181 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -9,46 +9,46 @@ ENV PACKAGES \
     cyrus-sasl-devel \
     gcc \
     gcc-c++ \
-    mkisofs \
     gettext-runtime \
     git \
     glib2-devel \
     glusterfs-devel \
-    libgnutls-devel \
     gtk3-devel \
+    libSDL2-devel \
+    libSDL2_image-devel \
     libaio-devel \
     libattr-devel \
     libcap-ng-devel \
     libepoxy-devel \
     libfdt-devel \
+    libgnutls-devel \
     libiscsi-devel \
     libjpeg8-devel \
+    libnuma-devel \
+    libpixman-1-0-devel \
     libpmem-devel \
     libpng16-devel \
     librbd-devel \
     libseccomp-devel \
+    libspice-server-devel \
     libssh-devel \
     lzo-devel \
     make \
-    libSDL2_image-devel \
+    mkisofs \
     ncurses-devel \
     ninja \
-    libnuma-devel \
     perl \
-    libpixman-1-0-devel \
     python3-base \
     python3-virtualenv \
     rdma-core-devel \
-    libSDL2-devel \
     snappy-devel \
-    libspice-server-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
     usbredir-devel \
     virglrenderer-devel \
-    xen-devel \
     vte-devel \
+    xen-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
 
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0acdb0d9ad..a50a35e6fe 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -46,10 +46,10 @@ ENV PACKAGES \
     libxen-dev \
     libzstd-dev \
     make \
-    python3-yaml \
+    ninja-build \
     python3-sphinx \
     python3-sphinx-rtd-theme \
-    ninja-build \
+    python3-yaml \
     sparse \
     xfslibs-dev
 RUN apt-get update && \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 88b3cfa136..eee2ef3cac 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,8 +1,10 @@
 FROM docker.io/library/ubuntu:20.04
-ENV PACKAGES flex bison \
+ENV PACKAGES \
+    bison \
     bsdmainutils \
     ccache \
     clang-10\
+    flex \
     gcc \
     gcovr \
     genisoimage \
@@ -65,8 +67,8 @@ ENV PACKAGES flex bison \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-    xfslibs-dev\
-    vim
+    vim \
+    xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.20.1


