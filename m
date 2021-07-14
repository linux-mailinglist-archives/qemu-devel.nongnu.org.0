Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E044F3C86CC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:11:51 +0200 (CEST)
Received: from localhost ([::1]:52714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gYA-00060N-V2
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUh-00064t-Tm
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUg-0003rg-66
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4118086wmh.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6g7OEJH6E8yVDlIOcjDja7bxAlnLzWd8G8NXFDS/dM=;
 b=a9pP9xk1aR+ODQunLJd+WJWrCAKB+cl5Bv7TkR5kAh6R7b1ybAHisE8AzCo2TWhWAw
 xwgd+bnTfFjLzfOn5VUQ4CSQ3DkrlvtXP4ARMKBBpiBqYTNBl3lFG7co5oNa8ClcFyVM
 C7aF/z+9BIkeO6cMRrMj5x5nETR5+Mhr/YyykxOeghCgR/2qE59W/8QOHfvzVdos0rH0
 QscS0fNlq+um4Hz5Qn1mcjQpvE+VCT5vVEUHCzw9TyCoZY6pC9B0MuzGv3qodOo24sL5
 h0IjMzh9XR1pkLCTarwGybparwU7nAlFVxKD5X/OknIczqORRY/0UiqggO5rTxa5/TWQ
 qJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6g7OEJH6E8yVDlIOcjDja7bxAlnLzWd8G8NXFDS/dM=;
 b=FoBaal/0fM9W/SJHzFudNmjYCZNldccySgHj9Tz3jMsb9qQ1SaR3Vebq3i5SMxTeQq
 47a+exXJ+T/NRcGEGdvQeMuzJUkk6GqTsrW+2q2CB1Py7ULb3wm/459zLa6zgxmXgaaF
 0elj6gYgZghSmFQRU8/4UPVOI0N51Hr5cqmEXjuU1czJ6vK14MjeQKW01mUkj5hFVd1w
 tYHG6MVZx9isJiU9fFjcu6645IcfnTUUbRKj16Ka0t+KrFLLy0mwCltFj+PZ4GbEQtTM
 6WUfdZxh59cmzGs8wEtOK9zVBlTHz7EAsds8P/3E+DH+iCQlyuIKjiZYDMvMqXET337x
 Tp3w==
X-Gm-Message-State: AOAM530xYbNMp7t14DTefcghWL+BAkKQgcNbe20gtoH3BfXr61j0Cujs
 dnC9Dj0+L4RLNcO5cAnaS94iNA==
X-Google-Smtp-Source: ABdhPJysRP0gjG346hTidWf/OIegcu2kS4mlyJ/+W5aOpECj0QBRdeUjQD661IWXGCSRRXZrkmZRFA==
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr11847924wma.30.1626275292537; 
 Wed, 14 Jul 2021 08:08:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a207sm6529099wme.27.2021.07.14.08.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A0361FFAF;
 Wed, 14 Jul 2021 16:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 24/44] tests/docker: expand ubuntu2004 package list
Date: Wed, 14 Jul 2021 16:00:16 +0100
Message-Id: <20210714150036.21060-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
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
Message-Id: <20210623142245.307776-15-berrange@redhat.com>
Message-Id: <20210709143005.1554-23-alex.bennee@linaro.org>

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


