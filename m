Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5024A3C262A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:44:23 +0200 (CEST)
Received: from localhost ([::1]:47226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rjq-0002B4-8u
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWa-000508-J9
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWS-0005ai-3U
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id k32so3253400wms.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vkh+QsJsZ9gD8kp+cvBC59Qmlqe+1EP3ZHDMKhG7zhs=;
 b=BQCTmaboIE3f31NI7DH2eYzek+nujMmyXPnHp2Q4/Y6ZF+C+ow2c/iSi2yfid3I14X
 s0ZvBGpMZcFSVXWIhgAPN+I6QsUkXvQvmoiK31vy13T2kdzKA8jBBL+JRsrdOjJVSoo8
 mcj1n12X/EwkK/8EI7KSP7eRrJAo6QUiEn4AkotKjw2poIvntBv4c0Vlu5eW1NJcloLE
 d7I2aOj8nRG317vqpmAcuP7RCQazDZIhka1wgFwo4XvUAH8rAqir0ak0733MbwR/HWjg
 x80gN1acgIkCOJD0HERTOm+JNCyMkyJj1498vNNlpTXGup2bfkBtt1eVb4eNpuzheO04
 k4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vkh+QsJsZ9gD8kp+cvBC59Qmlqe+1EP3ZHDMKhG7zhs=;
 b=hieMqKI96kN0jTHPseu3HF5WBR4rQ6U06iLDQaY8ZJp4bgkEAd4N3hXxVBsPJlWUpR
 mJ1A3n24VBYDhv7X8Uva/Z8e/0klBCckgPvKnmyDQwXWndSovyo44ma3Rr53cOWQONgO
 XaQd0X9ymlRRIn48ca99nVv86HqsyhYmjo6Wdbywt4JoC4HtHFabYWSUNQXDuKOX+PPu
 vUhWA070NJFmixL51jIZ6A8uornRcOoH475JFTVJL0eLYRknBDBFarLh7lde7z6vKm22
 EYYrkAwFw+TiTno9FulPAN1jUDLICI3OVaW4C8kqdRVTjSwqzCFQBsiF22a6SHQQiuGU
 2M2A==
X-Gm-Message-State: AOAM533rbv1Kt+99g9r6UxM2ngg+JyTd22M31GfVkkKqj5wLqclY1hYJ
 +eQ5r4dyzv4XCiniG5ww6hG9yw==
X-Google-Smtp-Source: ABdhPJxvkL1/fTy8l5mC8YPFsVyBNbA3CNzLSf2kRicwtJPeVDR1fGNrlfIi3X5GUd1VLcypDYcedQ==
X-Received: by 2002:a05:600c:154b:: with SMTP id
 f11mr12635622wmg.82.1625841028419; 
 Fri, 09 Jul 2021 07:30:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p11sm4440982wro.78.2021.07.09.07.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB8F21FFA6;
 Fri,  9 Jul 2021 15:30:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 21/40] tests/docker: expand ubuntu1804 package list
Date: Fri,  9 Jul 2021 15:29:46 +0100
Message-Id: <20210709143005.1554-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
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

This is the fully expanded list of build pre-requisites QEMU can
conceivably use in any scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-14-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 61 +++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index ee8545e4b1..0880bf3e29 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,54 +1,113 @@
 FROM docker.io/library/ubuntu:18.04
 ENV PACKAGES \
+    bc \
+    bsdmainutils \
+    bzip2 \
+    ca-certificates \
     ccache \
     clang \
+    dbus \
+    debianutils \
+    diffutils \
+    exuberant-ctags \
+    findutils \
+    g++ \
     gcc \
+    gcovr \
+    genisoimage \
     gettext \
     git \
+    glusterfs-common \
+    hostname \
     libaio-dev \
+    libasan5 \
+    libasound2-dev \
     libattr1-dev \
     libbrlapi-dev \
     libbz2-dev \
+    libc6-dev \
     libcacard-dev \
     libcap-ng-dev \
+    libcapstone-dev \
     libcurl4-gnutls-dev \
+    libdaxctl-dev \
     libdrm-dev \
     libepoxy-dev \
     libfdt-dev \
     libffi-dev \
     libgbm-dev \
+    libgcrypt20-dev \
+    libglib2.0-dev \
+    libgnutls28-dev \
     libgtk-3-dev \
     libibverbs-dev \
     libiscsi-dev \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
+    liblttng-ust-dev \
     liblzo2-dev \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
+    libpam0g-dev \
     libpixman-1-dev \
+    libpmem-dev \
+    libpng-dev \
+    libpulse-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
     libsdl2-dev \
+    libsdl2-image-dev \
     libseccomp-dev \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
     libssh-dev \
+    libsystemd-dev \
+    libtasn1-6-dev \
+    libtest-harness-perl \
+    libubsan1 \
+    libudev-dev \
     libusb-1.0-0-dev \
     libusbredirhost-dev \
     libvdeplug-dev \
+    libvirglrenderer-dev \
     libvte-2.91-dev \
     libxen-dev \
+    libxml2-dev \
     libzstd-dev \
+    llvm \
+    locales \
     make \
+    multipath-tools \
+    netcat-openbsd \
+    nettle-dev \
     ninja-build \
+    openssh-client \
+    perl-base \
+    pkgconf \
+    python3 \
+    python3-numpy \
+    python3-opencv \
+    python3-pillow \
+    python3-pip \
+    python3-setuptools \
     python3-sphinx \
     python3-sphinx-rtd-theme \
+    python3-venv \
+    python3-wheel \
     python3-yaml \
+    rpm2cpio \
+    sed \
     sparse \
-    xfslibs-dev
+    systemtap-sdt-dev \
+    tar \
+    tesseract-ocr \
+    tesseract-ocr-eng \
+    texinfo \
+    xfslibs-dev \
+    zlib1g-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.20.1


