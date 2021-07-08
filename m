Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9123C1A3C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:56:45 +0200 (CEST)
Received: from localhost ([::1]:59980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a8a-0002WN-5B
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1Zg9-0005WH-Qd
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:34689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1Zg4-0001yI-Ep
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso5396541wmc.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7OPU4as02HZtXljAleSB6EF+rLr9JRR7CPBqu3EwDbk=;
 b=PGOiXV0yg0rNK+LskLaQ9l+f60M6ZNixaQpNvd2N9jA6uwq5u3znEvAj4xUGiZ4EX1
 5+TiCPm1QF0bSM9Jkwo6qKOfNCRtab8tCzRloG37u0iFBUHc1KlNRNFqynyAiDA7kjBa
 HzJvuGQCSd3BIZtmmmksiQ3gWRrbqPXwTHN+xUlT5oeW6on7jIOVSuZXFlrBQDLgeyaT
 WgJBu/zZaF3zZjQ2/3a5KsaIswx7o4yo3l8IzL66HRbtH3eiDhwyE9MlXQmukKSaneRw
 RK+Y3395HAZJIZzlsM+5XgTEHndzj1CEHo6u1+nCaDcQB0wy9zzQImJAGijJJ6L5PH8O
 kqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7OPU4as02HZtXljAleSB6EF+rLr9JRR7CPBqu3EwDbk=;
 b=aOZZvQs5Xhz5wIA2B7Jzxuqu31C3pTzRQ/34F4q5/dvhs81X7RM0gCTHjjDxeVLY/r
 Cvh7OqOejO6uFdsPEOGHMzS+NUC1x8j34peZBADbd3xbL9jXk80+x+qInTMIN9hgGPI9
 wePDi9SlhdZ8C0c9tv0gFKDFRAru9ReKbgCj88Aqb1kCW8UKntf7lAhJHa4pM263qo2D
 ALaKieAaNolpMaV15Jn0g1CI/ufaqcEQrjDQbl1RD1h2J7iDSFeX5AB5UFyTmzlCW/iP
 mbVBs0CRtL5EZESBj9JW5aABrYwH6FLkk9NyXnARIDy6RLuMEz20qbiPfYP60SkHIuQO
 8umw==
X-Gm-Message-State: AOAM5330BkWVJsHOokRxwoZ0ERnNxey5Yt1jGKZ1T7wSJan/FEjHeAPd
 Zuy5ad2Z1hBM+SMGLjBCx0MAPQ==
X-Google-Smtp-Source: ABdhPJxlJRKqVjpoEw+vZe0xTN7mDY3ZFIUtFS68J3nZzaN6xUfWwe2kPJOL8xUBZQ1btbA2oFnrkw==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr34637154wmj.44.1625772434844; 
 Thu, 08 Jul 2021 12:27:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm2967832wru.24.2021.07.08.12.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 744891FFAA;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 22/39] tests/docker: expand ubuntu2004 package list
Date: Thu,  8 Jul 2021 20:09:24 +0100
Message-Id: <20210708190941.16980-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Message-Id: <20210623142245.307776-15-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu2004.docker | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 25f56adfb2..39de63d012 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,25 +1,44 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
+    bc \
     bsdmainutils \
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
     gcovr \
     genisoimage \
     gettext \
     git \
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
+    libglusterfs-dev \
+    libgnutls28-dev \
     libgtk-3-dev \
     libibverbs-dev \
     libiscsi-dev \
@@ -30,39 +49,66 @@ ENV PACKAGES \
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
     libslirp-dev \
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
     ncat \
+    nettle-dev \
     ninja-build \
+    openssh-client \
+    perl-base \
+    pkgconf \
+    python3 \
     python3-numpy \
     python3-opencv \
-    python3-pil \
+    python3-pillow \
     python3-pip \
+    python3-setuptools \
     python3-sphinx \
     python3-sphinx-rtd-theme \
     python3-venv \
+    python3-wheel \
     python3-yaml \
     rpm2cpio \
+    sed \
     sparse \
+    systemtap-sdt-dev \
+    tar \
     tesseract-ocr \
     tesseract-ocr-eng \
-    xfslibs-dev
+    texinfo \
+    xfslibs-dev \
+    zlib1g-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.20.1


