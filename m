Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AA13C879D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:32:08 +0200 (CEST)
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3grn-0003Xn-1H
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geO-0004we-DP
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geL-0002H3-F9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:16 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t5so3653547wrw.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NeABLV7StpNg0vKloEwYcA5/N3mgXlUJz7t9QWy+kVI=;
 b=SnVuM2tTOoKZl7/8ta0gSp2nA47BqMNLYBL/adjGYTz8k0EpSRZ2/5BPvZOyeMb/ay
 1PcSUZg/i72VqRcfkqJur5D/ptE9SzKHMkgHe/IRU3uMsPtVvCbAzVdjDpr1xh/5PaYI
 2XTI892QmrMj/dba0xd69O/ibZeYziOR91+hoaXj0BDLjlawz2QtLFhrupOmWlMbO5/N
 ALXGCiLOfEYR/8CScxWeblPY8D5rN7HzeBYbdQqO6jnZkLiZKHF0nUts8qCrVsdVaw1t
 EaaTWdItLkExSzyU3UGqJLBVmua/Jnpxut/U6yTgOiGKB0buyL/OPsV7pGAuzjfYQ/U3
 yNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NeABLV7StpNg0vKloEwYcA5/N3mgXlUJz7t9QWy+kVI=;
 b=JtFxGiTMJlBpdFFSXExL2vNUimLZwS1plw/c4k70NxfCCbP48bFUiHeivkXObgn1dT
 xS0HPJZfZIBfPX2EMjgRMfdsiqTBBiaOWJkSxUI6gYbh31PDPcgALVR7BQowY7chJueo
 112BHIt3K9Aqd4+r6gDe1W/v11GKm65327zWZa63eIdz8oMS82Y7P6YUFTAQWJovreJP
 6P+35QznGnqMdi9OFaoc1wNDvlsViJe6uwEzlta6PH79z+NeJJrq8r7PMSFa9iiszWwE
 VPawrG8q5bPng8FmfymP4gvPoDevW5ioPSN4axFWauayC/ZcB+a0lr894SeUsamB0+hh
 0h7Q==
X-Gm-Message-State: AOAM531nHylV+GlIFDXFs2Zry/UJd8ji+FA0Pc3vtqXB02rmSBt30JoZ
 SXT0k4xzGtvOeifrGbCp5hcmhQ==
X-Google-Smtp-Source: ABdhPJyfXOHIs3YH/Wk69yhi30Er61KQVd4OCTDhqlm4c9RnyHVeEpOVgvse0sDEsL+nRn4v7cvf9w==
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr14146863wrt.251.1626275889613; 
 Wed, 14 Jul 2021 08:18:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z7sm2162775wmp.34.2021.07.14.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A53141FF9F;
 Wed, 14 Jul 2021 16:00:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 16/44] tests/docker: fix sorting in package lists
Date: Wed, 14 Jul 2021 16:00:08 +0100
Message-Id: <20210714150036.21060-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

This will make diffs in later patches clearer.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-7-berrange@redhat.com>
Message-Id: <20210709143005.1554-15-alex.bennee@linaro.org>

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


