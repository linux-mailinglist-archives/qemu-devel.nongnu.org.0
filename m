Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3FC3C2654
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:54:16 +0200 (CEST)
Received: from localhost ([::1]:49824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rtP-0000YN-4k
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdB-0004a2-8I
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rd8-00008t-U5
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l7so11518872wrv.7
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFyLbsCarDbcc8xVrNzNM3GtcCMt9zLW6sDCVFExxAQ=;
 b=NH0b7hmoxCx9S6ssFxod8LRR4YjxD85nXwDLW6iufTMqTV4p6MlDiUQfGM08hm928Y
 EfP1wP5sEGsLvE+p1LW7UmjMZTv3OlSdYgoYtwh4U2BunEb1rUpjhPYx3G/VuCaGlnGU
 lub0FKjcIycvT/mt6fEiI9/4rZU0zFJMbibsxnPXvdLm2zhuGWZYmzX4buR74Q6Uh4Dv
 oaR6Zr2kCabu/F7aZBHbsUALRlDyTXDaZ4FWUP4oAnnbCRpBGs5auErzV0WSLBDOwebv
 qliTSkvmRJVpmt+8z69B8ILfod9KfM/Rmj20BeuGhTNtN8XwHQZF40A7L1TFidLvBSHE
 evwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFyLbsCarDbcc8xVrNzNM3GtcCMt9zLW6sDCVFExxAQ=;
 b=eRpbNWt0PkTTEyC/2JbXkUn1HWUfzBSMQN64oYpYCJlBXozuVn5L61Y5PM96t6WIp/
 k5oBj0dBFDhbNLk1GRR2dco5+vXFRpFQzH96O9QrccOfU9dZEOY/hIpmlMYmEyiW6mwB
 j4sTjU+xqxEeSmoGENxKo4yCR/swQUXS0zmkAxpDVzs59tTKn6CqEYiJI3hg/reRa4Ue
 XiyIXqTs8WHqRRscDxTeXzbIu2pCdCqOpkYwdf9vQta12a3bzkvsUTnaSka0vtmFHlif
 YAziRo+yOf39rkCKr417Y/1wOBBXA+VQp376geHEh7XjwSGCriRt9VGR6VVRtG1+7mtG
 9ZRQ==
X-Gm-Message-State: AOAM531fQso45/3M+jDoOx2SM183nZcUAgqfiPDaTPkFRF+zjrsyyNBF
 OOCUeOqPTWmRcrAvGjE2Ym3QEA==
X-Google-Smtp-Source: ABdhPJzd5QVdj/kpdmdHpU1O6ybIFBEH8lK+ivXG5k1ZjsYMUIvwErQ5kB9a2nTHdvu7MdjQ+VkV5A==
X-Received: by 2002:adf:f592:: with SMTP id f18mr3652097wro.179.1625841445359; 
 Fri, 09 Jul 2021 07:37:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j10sm5360007wrt.35.2021.07.09.07.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 69A0B1FF9B;
 Fri,  9 Jul 2021 15:30:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 14/40] tests/docker: fix sorting in package lists
Date: Fri,  9 Jul 2021 15:29:39 +0100
Message-Id: <20210709143005.1554-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


