Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7993BDA36
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:30:59 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n2I-0005UD-Sm
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfH-0005N1-II
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfE-00079p-H7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so2009533wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vkh+QsJsZ9gD8kp+cvBC59Qmlqe+1EP3ZHDMKhG7zhs=;
 b=ZrshiQV5Fw96d/n7aPY9mlByj+APGo4TkHHi2e1Su74zTwNykq29sqC5EfaqDlFsdp
 7OZ53zSHBJwZ6vsv4v4ddDc4HlmFZSjHrOa9ZkhTwkj0YyNYGPts8Jz5ZuQu9Pis/W+3
 UfScjVfne/f2wqrZpF6I8sFpXM7eJN0qsTi07Ke8J7hNKb5RvZ9xInn1kP5XUjJ8j96j
 5L0xWS0PooT7vuDgLEDPvDAAFpxeOg6RmSKOd36gGcGURmXPBdUrTOTlJO2hLhjgBNPB
 bgEz2XSJIDZZzdmKancuW9MF7YbJuIR8JuLxYM/PAOVH+F5NcgidsNqhfhc2YGbXwM3B
 JHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vkh+QsJsZ9gD8kp+cvBC59Qmlqe+1EP3ZHDMKhG7zhs=;
 b=bYe/NgbJpISMaJgC7ZlQkAQaHUyVhTFQJS6HdaNo5QLD5sPP2a129USGdSTLrnghcU
 2ZTVnIfMjt49ZiEOe89lw5zUD7MI6WMS3my6wKqAl4iZi9OL2CunpWsMT7opwgcPWl06
 oDL3sOQ2K7+Y7H4ZdnVI7U/jiVaciCjKi05w7UiWjOfD/r9O8cxo8/WkPTwfLxz+6Nfx
 k3sOHgBeQa/1/H4MInItI/U+3d1Zw6+V1R+DKto86DhtslFqR8Kdd8YLVSUMin5HLQVC
 RrrIr/U0kdh4A06Tz7tS7EqtrK3nNe1tWzEnhnkputAEBLZ9L9RosoKxavamxKwi2c3k
 YsFw==
X-Gm-Message-State: AOAM533taEU2gI8/JgAyMGHnUYUHicaKkSEigng64xAYUIOGY4gYXTpw
 bbLA82HqcCfSDHpeet+5IDdBug==
X-Google-Smtp-Source: ABdhPJwX5hvTkaFYtBsfop8eTUoIF16o0CHZlYitlIa7lWYpDmK5hyhz04zwCmTOnVcJgwTzyUWubA==
X-Received: by 2002:a7b:cd06:: with SMTP id f6mr1372689wmj.64.1625584027047;
 Tue, 06 Jul 2021 08:07:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm8861862wrx.77.2021.07.06.08.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31DF51FFA9;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 21/39] tests/docker: expand ubuntu1804 package list
Date: Tue,  6 Jul 2021 15:57:59 +0100
Message-Id: <20210706145817.24109-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


