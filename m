Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD63C1A27
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:51:42 +0200 (CEST)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a3h-0001oz-Ec
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1Zg9-0005WE-NE
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:47016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1Zg3-0001xz-Ko
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so4738677wms.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6rn2rW0jesZ7fjWeIQQTMy5p25VbdIDcQJRFypEibA=;
 b=Zm8062JgL9g+dJUbOFNS/04LTf/XWOa+qVnaWMnbW5daR6LyrMSXzRGF3sa8ek5iY3
 9myG8gP/JHy1V5ggssPm7R4LIb7S3kDZslF4/3TkOabwezOBCRf3LI+J0zuFO/k7VSDH
 XJSE14PV/p9uJJPtYCoM3XrFy1ZFA3Dk4fk7qedIt/s04fCzaZ8oxtTl7dv4UycndFKY
 gSvxBcmU/UmB2uixTT6duO9d5AwfT8ZS3b1cVjF2a4qwWl2bxijn+hLIEwMcK0PHeZWv
 HXKqOsiRnLAm5RRyBe1kMiW5iuS0fOoa0XSpuus7/Y/Rpi7D6N5GarYnbb4xbG8ywDxg
 o62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6rn2rW0jesZ7fjWeIQQTMy5p25VbdIDcQJRFypEibA=;
 b=NqgB6c+7XJVRyiNNioDwHc+ZwkdYNcjb4Jp5di3BQCv5aN0Lo6tb+L7A/dQwFq4WDc
 szzsI3kIkwiYO0wwIQxcLGEJeT1JLx9iu+vngi/NoAxcz08wUGPbfcRj9aD2hh5oGxFP
 QtzApBj3K06O0sVwqUEKhsIe4K5cxcqLOVUXZnvDIDURP+k/26tO08tTzYF6j0cA0DW2
 tOLpfACn2Q1CeriUQtLBnfEp2zTomunyIOCHQ9d7/1du+/gqShW8g5h26ucjbx0gAV94
 gWpaXo52qpmk/HVBh+LwZod0nKopZpJxdnik7FkKGL/z1Q75Yjn5tKEKxfTv97h5FlyT
 aYww==
X-Gm-Message-State: AOAM531aEdHgCxRn1xu4svoe1syf6BMSQBSUcQ2YTkvgre23IrEhKdo2
 mjHyPhqCeHGzjf8MaweiRsIatA==
X-Google-Smtp-Source: ABdhPJwqZXlMOcTrHBf+lZZ+D85V3hBnzcX5PEtQLRpP4DUirfC+sO2ZDJR/JQUhbdVbNT43q8yjIA==
X-Received: by 2002:a05:600c:2289:: with SMTP id
 9mr5983302wmf.86.1625772434216; 
 Thu, 08 Jul 2021 12:27:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l4sm2737938wme.26.2021.07.08.12.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 43D9E1FFA6;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 20/39] tests/docker: expand fedora package list
Date: Thu,  8 Jul 2021 20:09:22 +0100
Message-Id: <20210708190941.16980-21-alex.bennee@linaro.org>
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
Message-Id: <20210623142245.307776-13-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora.docker | 30 ++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 5849ea7617..eec1add7f6 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -3,63 +3,83 @@ FROM registry.fedoraproject.org/fedora:33
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     SDL2-devel \
+    SDL2_image-devel \
+    alsa-lib-devel \
     bc \
     brlapi-devel \
     bzip2 \
     bzip2-devel \
+    ca-certificates \
     capstone-devel \
     ccache \
     clang \
+    ctags \
     cyrus-sasl-devel \
+    daxctl-devel \
     dbus-daemon \
     device-mapper-multipath-devel \
     diffutils \
     findutils \
     gcc \
     gcc-c++ \
+    gcovr \
     genisoimage \
     gettext \
     git \
     glib2-devel \
+    glibc-langpack-en \
+    glibc-static \
     glusterfs-api-devel \
     gnutls-devel \
     gtk3-devel \
     hostname \
+    jemalloc-devel \
     libaio-devel \
     libasan \
     libattr-devel \
+    libbpf-devel \
     libcacard-devel \
     libcap-ng-devel \
     libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
-    libbpf-devel \
     libffi-devel \
+    libgcrypt-devel \
     libiscsi-devel \
     libjpeg-devel \
+    libnfs-devel \
     libpmem-devel \
     libpng-devel \
     librbd-devel \
     libseccomp-devel \
     libslirp-devel \
     libssh-devel \
+    libtasn1-devel \
     libubsan \
     libudev-devel \
+    liburing-devel \
     libusbx-devel \
     libxml2-devel \
     libzstd-devel \
     llvm \
+    lttng-ust-devel \
     lzo-devel \
     make \
+    mesa-libgbm-devel \
     meson \
     ncurses-devel \
     nettle-devel \
     ninja-build \
     nmap-ncat \
     numactl-devel \
-    perl \
+    openssh-clients \
+    pam-devel \
     perl-Test-Harness \
+    perl-base \
     pixman-devel \
+    pkgconfig \
+    pulseaudio-libs-devel \
     python3 \
     python3-PyYAML \
     python3-numpy \
@@ -70,19 +90,25 @@ ENV PACKAGES \
     python3-sphinx_rtd_theme \
     python3-virtualenv \
     rdma-core-devel \
+    rpm \
+    sed \
     snappy-devel \
     sparse \
+    spice-protocol \
     spice-server-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
     tesseract \
     tesseract-langpack-eng \
+    texinfo \
     usbredir-devel \
+    util-linux \
     virglrenderer-devel \
     vte291-devel \
     which \
     xen-devel \
+    xfsprogs-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3
 
-- 
2.20.1


