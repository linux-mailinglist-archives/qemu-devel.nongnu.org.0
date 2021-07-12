Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7C3C5CEC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:05:07 +0200 (CEST)
Received: from localhost ([::1]:54178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vcP-0001cS-Po
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vH5-0007gX-A9
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:43:03 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vH3-0006IS-HU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:43:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id j34so11311574wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmFE7FnSh3z5LhPSBBcy1LLJxZ6gzWkY9BVFfkjPXgk=;
 b=I6LzuEipWvc2ywlXcDj3RNdyYHlF2heIwlQQUTe9an+4bOYz+OuTrNQDCOljaRbJEe
 JBqMfW4D0YQiOj7ZGdXzgiRoD1q5uQXkDNrg9+7xui35P7CtUBiQskOrPU3HLW1NFh/P
 U9eDgwaV3JkKVkXBe3x5Ykxnx9QB5VmikfstxspT+IqOlxqAGReioL/Y1ZwZjRVRHN5t
 B+rCIMMtnev/6uK1P/Jz/q/wQQ34WZWlpNc72y1qRhvdrXPV98b0rJ63fVdOUGg35L2w
 QoHNdCb+7XBnokci38O8vowLwspKMLQzbg3yZX51j8q+ohqcEf5/KGYGXxut/89P+QGA
 KMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmFE7FnSh3z5LhPSBBcy1LLJxZ6gzWkY9BVFfkjPXgk=;
 b=m5vthjHtYLh3LGiIE+ti2r7nPci/L+Yn+hz2MSN9CNLLIOay/StJHHMoew4WpTEBcQ
 5pV/xi6PZpb+DqV6F2mTPm8YnIj96f6eYmpqoWCNbI1EFqd+jvSWZ7778+Q5qvS2bY5k
 9nowR6Cj5NY/Tu5I2f1vO9Kkks9BaF1UttjHl44ZhvW9P3iYjTmbgS45aI/9g1pL9lDK
 h5MoIFrh7MV4vfvLRznTacEjUj+T5YtODQnMTZtFh2vyoRzvXJORrzwoU8APbzo/kraL
 y/E233q8sk7w16g2QrVMI3ITR0LdLNSBFjX4BhPFM7NZat0zQd9Mtsr4hOsEkre0spew
 f6TA==
X-Gm-Message-State: AOAM531S53430hK4Ymw141HFBXlS10rS/n0twR7wan7lgmuWs0yGSM4e
 XQ7pkLvb07BVlno4VpoC2fLgGg==
X-Google-Smtp-Source: ABdhPJyNYEHacL4yYr209qoGmx3wYmQ/DKvOIns0Wlej2m0WCsgdZ2DU1LBlyhnkABgg6l3U9XPYGA==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr25619550wma.178.1626093780179; 
 Mon, 12 Jul 2021 05:43:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm498853wma.48.2021.07.12.05.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:42:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 22FA11FFAB;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/40] tests/docker: expand ubuntu1804 package list
Date: Mon, 12 Jul 2021 13:26:34 +0100
Message-Id: <20210712122653.11354-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


