Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730B03C5CB5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:57:27 +0200 (CEST)
Received: from localhost ([::1]:40438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vV0-0007Jh-EU
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7J-0004ik-4F
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7H-0002JK-Hu
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id p8so25388809wrr.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Kc/AtnrUFUSMDCa/D5pKIGcs4TC9hfXWUXk1KzQyfo=;
 b=cW+llawbtEl0xG2YlpH+kTjbfnezk6wsHu7LmTDH+XlwXNqDISZxq2urRN94HjYp/3
 0sH2xKRK8u/EMg4M7pDAXbuDKSIe9vYMS9iTi1r47f448vOk/HUwyb5Sn33uJcyQfl1G
 xUja1ZnwBFcTuA4oiCmfDw88Dq4HwuUMY0MR+N3tBl24jGZuFTS6MX+h65WdEmcM+3vK
 YDkIp+65EFkurTQSTplwuI4tP2wWNzMGon1up9w9OleP9M9keOwJid5U4/kkxwAjrzfQ
 LkwxK8sn41M6ZA7269697RBIwDJetCFNNOYQ3bqOixQLTGFDp6V36dxQtatIrj/m1t54
 azuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Kc/AtnrUFUSMDCa/D5pKIGcs4TC9hfXWUXk1KzQyfo=;
 b=ltEMGWsKNtjvG+h6qu6/tAKkCnvpkst9CXk2/JMBx69lJj6cj8S+ib1LyyF2VJ+C9l
 TB5KTCx+GxdvzMDHZ86nwhajVOZmsINUZwSp2LoXuksqMsCYy1Ecq12NG1IXTH7N4o2X
 urefYD6Q0FzrvLa9x0SA/SHpTeaq7Gvc9kxYrfBes2kxJjtAX3RKcXzKIdEMlg4XMSir
 JsqIKHaENLj97Dn3TC6ktxBGaySWD6v2K/nwm29rK1nEdc2DkAQi7vIZguXDKYD5BLfz
 YWe2qGw9P8c4qcZspdHgkZNFCXBEizJJGhKk7BzcJcD5WRIZ/L0jeIZp8wOHCYEvIlBu
 H0aw==
X-Gm-Message-State: AOAM531UA3D+DCHQL+gpqdJVvBZ1g7Eftqa3m3Ak4g8H6X0lADveZaUq
 fIjAW5P4IAdjbjsga98Qs+VvPg==
X-Google-Smtp-Source: ABdhPJw+esLlRdE6vd1gbNTH4b2DFy5EATtyIU5Ek0b/JcWUlNM4Zt7yiOdLoqMBfagemunt/UVmvA==
X-Received: by 2002:a5d:408a:: with SMTP id o10mr19915613wrp.272.1626093174229; 
 Mon, 12 Jul 2021 05:32:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n7sm19225626wmq.37.2021.07.12.05.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5132A1FF7E;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 23/40] tests/docker: expand opensuse-leap package list
Date: Mon, 12 Jul 2021 13:26:36 +0100
Message-Id: <20210712122653.11354-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Message-Id: <20210623142245.307776-16-berrange@redhat.com>
Message-Id: <20210709143005.1554-24-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 6011447181..5a8bee0289 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -2,53 +2,110 @@ FROM registry.opensuse.org/opensuse/leap:15.2
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    Mesa-devel \
+    alsa-lib-devel \
     bc \
     brlapi-devel \
     bzip2 \
+    ca-certificates \
     ccache \
+    clang \
+    ctags \
     cyrus-sasl-devel \
+    dbus-1 \
+    diffutils \
+    findutils \
     gcc \
     gcc-c++ \
+    gcovr \
     gettext-runtime \
     git \
     glib2-devel \
+    glibc-locale \
+    glibc-static \
     glusterfs-devel \
     gtk3-devel \
+    hostname \
+    jemalloc-devel \
     libSDL2-devel \
     libSDL2_image-devel \
     libaio-devel \
+    libasan6 \
     libattr-devel \
+    libbpf-devel \
+    libbz2-devel \
+    libcacard-devel \
     libcap-ng-devel \
+    libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
+    libffi-devel \
+    libgcrypt-devel \
     libgnutls-devel \
     libiscsi-devel \
     libjpeg8-devel \
+    libndctl-devel \
+    libnettle-devel \
+    libnfs-devel \
     libnuma-devel \
     libpixman-1-0-devel \
     libpmem-devel \
     libpng16-devel \
+    libpulse-devel \
     librbd-devel \
     libseccomp-devel \
     libspice-server-devel \
     libssh-devel \
+    libtasn1-devel \
+    libubsan1 \
+    libudev-devel \
+    libusb-1_0-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lttng-ust-devel \
     lzo-devel \
     make \
     mkisofs \
+    ncat \
     ncurses-devel \
     ninja \
-    perl \
+    openssh \
+    pam-devel \
+    perl-Test-Harness \
+    perl-base \
+    pkgconfig \
+    python3-Pillow \
+    python3-PyYAML \
+    python3-Sphinx \
     python3-base \
+    python3-numpy \
+    python3-opencv \
+    python3-pip \
+    python3-setuptools \
+    python3-sphinx_rtd_theme \
     python3-virtualenv \
+    python3-wheel \
     rdma-core-devel \
+    rpm \
+    sed \
     snappy-devel \
+    sparse \
+    spice-protocol-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    texinfo \
     usbredir-devel \
+    util-linux \
     virglrenderer-devel \
     vte-devel \
+    which \
     xen-devel \
+    xfsprogs-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
 
-- 
2.20.1


