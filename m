Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C33C86A7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:10:44 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gX5-000338-5Y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNn-0007Ta-Nj
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNh-0007c2-Mj
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3614911wme.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmFE7FnSh3z5LhPSBBcy1LLJxZ6gzWkY9BVFfkjPXgk=;
 b=yxbZOlZ0Y0rbv0crK9F4+RP7p2yXB873KGrqdj8haYZuGFl+Xo1ZKTQMH2Db4nkVMi
 p0r4hBBHA748Ub7UEEdyMPDM+E967SaUey3c0ZFxGzHspirkUycgyupqZ7z1qVjXSLQU
 Ca0e8DBUgTD2dPqiT4MIPda/HPa9hsEdUrm9YoYPwaCmA5ZzeDYyZOYZL3mlNBoV9Q0p
 F2adJq1ugqOjNbzptFKZrLnLz/tlAsEcZZCNwbDXD7dpVsBO1p25DnedX88iK04eXWhX
 RAWWJJB8nMDKcLf8JtNFo8IfxPzjKURBuPrvcQsrLskEwD1lQNTpsvz+YCZWdA/h6TXf
 zqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmFE7FnSh3z5LhPSBBcy1LLJxZ6gzWkY9BVFfkjPXgk=;
 b=eotY7I0oFZCZP6kpt0ToyF5ib+hj8gKhe5vv9OqH80OtG8uW/1+FzNFh2/I88yybc1
 DFaBGe8OJJo2FZ/PXJ0CQu7E3SGr88ncimxarsDQDcc73lwn1kLAojaa9id1FxPE18fR
 9QG/zdUDevgHBC4ZhJ9WIJpajJ2pkixwK9Zqdy4rtFruCoZ7QEoQ1atyCCQwMvxBVXpg
 T2qR4B5Mq9vC+8Nw/gT47u0bdKziosqZVgET8TtyJnFhudKaH+WnNvGnajxJumnAHW2V
 VGvTwBTIyWCj7BU+2LVdqde4uT9AVPdBAzji28k9rZKIp2j53OnrgwftHwx9J9Ks08X+
 ukGQ==
X-Gm-Message-State: AOAM531qzQ/nhk0Duprl6daW6aNaxFJ2cVRDT9sVXeCQrll4FA8vxeen
 AdNpqPXrUlup4poEwxwsYjTGsTQpfQRU6w==
X-Google-Smtp-Source: ABdhPJwXpwCwVsQWv5PVBXIHr3cLmeXxJbg+UCWIzM5Z3gmDgnQGhFehYNZmcS4PIH66MsgTi0pjUw==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr4624573wmh.69.1626274859968;
 Wed, 14 Jul 2021 08:00:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm5782968wmc.2.2021.07.14.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 523EC1FFAE;
 Wed, 14 Jul 2021 16:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 23/44] tests/docker: expand ubuntu1804 package list
Date: Wed, 14 Jul 2021 16:00:15 +0100
Message-Id: <20210714150036.21060-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
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

This is the fully expanded list of build pre-requisites QEMU can
conceivably use in any scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-14-berrange@redhat.com>
Message-Id: <20210709143005.1554-22-alex.bennee@linaro.org>

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


