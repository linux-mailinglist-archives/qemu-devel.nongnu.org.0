Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5383BDA04
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:21:01 +0200 (CEST)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mse-0007vA-GU
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfJ-0005RA-NY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:14 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfH-0007D7-Oi
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so2009691wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVqTslJtY4FYTYh9yN/AgrJpuhlasOrPI7zLw6S0HIc=;
 b=bh0vCDd4ys4vhyrP0NOBDo5lY1mEJvTGuVTX0PlfJ2IVgSH8SOAt4pSC7tXAhR1CDw
 72Mau83TyUodva77bXQJwO8rwPHHX5DgOxy+gtvkL7No6wCCgB02dPqjBe8YHxsW+nWO
 pOK108lW4H47bSwtUAMQ2dFN9rh5Nfi7+HnCzoJY2dAnNSG4W+mLPT+ZdTUDParN6VBc
 DuUBuDiClFWas0KR+ZJRD1fz5VBf3O8ya2z47uNlLXAV8V0xvOqaAqcrhQbMAGylEwW7
 HIQ10DoTwIqKCLZfZO0U1tEmDdswHv3BlLMe74fO9oCY7GUJV0PQzJ9t88wCyEg2q1gj
 UkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVqTslJtY4FYTYh9yN/AgrJpuhlasOrPI7zLw6S0HIc=;
 b=HdaGbNcfURauEZ1bo4hx6xW7TDBJisA12J6ltPcE6T/zMthnMu/d/1nJoAZyLlRJ9j
 1cRFNY21M8HCw6jhMqx/31lhAbY2QF/SlqH5iCfYIFBunBrN7fpJSvsCMfiWn4AEOwxS
 An4V6i4iLlBLsMGaobJ53nFv/46QOhp+6JnJo/+pdFkv/6+PJRKxrZTGXOBq5JPG7qj5
 HVg5KZ5t51ism48CxPOVdRLIEp+nErf2bZ1puoVbZQ3fAiHy5aaS8W7bh8G42uLbq206
 J2Lo/6wqZuzkrPpZk6PtXrZewE9UA/NhvyUel8cDMevyGpoU5E5RBZyuEZyw9nKLKi2u
 gzSA==
X-Gm-Message-State: AOAM532Y9bqZleKE5cUkHlAPOnUjVcTcfFASlpjHxp29Vp1rlifTCqLx
 AuvxfPp0kmBDnp6d+IwFU4J9fg==
X-Google-Smtp-Source: ABdhPJyHd1wTsu7wRfCeJsIEzB9nwCAPbK1IY9n6MgI/v/Hfu+Cc/TdqcmzfnbTO7w6ZCweZe+YNuA==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr1298361wmk.97.1625584030310; 
 Tue, 06 Jul 2021 08:07:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m18sm15728584wmq.45.2021.07.06.08.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0141C1FFA6;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 19/39] tests/docker: expand centos8 package list
Date: Tue,  6 Jul 2021 15:57:57 +0100
Message-Id: <20210706145817.24109-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210623142245.307776-12-berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
[AJB: added centos-release-advanced-virtualization/epel-release]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/centos8.docker | 70 +++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 5f1c57b4ad..46398c61ee 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -3,39 +3,109 @@ FROM docker.io/centos:8
 RUN dnf -y update
 ENV PACKAGES \
     SDL2-devel \
+    alsa-lib-devel \
+    bc \
+    brlapi-devel \
     bzip2 \
     bzip2-devel \
+    ca-certificates \
+    capstone-devel \
+    ccache \
+    clang \
+    ctags \
+    cyrus-sasl-devel \
+    daxctl-devel \
     dbus-daemon \
+    device-mapper-multipath-devel \
     diffutils \
+    findutils \
     gcc \
     gcc-c++ \
     genisoimage \
     gettext \
     git \
     glib2-devel \
+    glibc-langpack-en \
+    glibc-static \
+    glusterfs-api-devel \
+    gnutls-devel \
+    gtk3-devel \
+    hostname \
+    jemalloc-devel \
     libaio-devel \
+    libasan \
+    libattr-devel \
     libbpf-devel \
+    libcacard-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
     libffi-devel \
     libgcrypt-devel \
+    libiscsi-devel \
+    libjpeg-devel \
+    libnfs-devel \
+    libpmem-devel \
+    libpng-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libslirp-devel \
+    libssh-devel \
+    libtasn1-devel \
+    libubsan \
+    libudev-devel \
+    libusbx-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
     lzo-devel \
     make \
     mesa-libgbm-devel \
+    ncurses-devel \
     nettle-devel \
     ninja-build \
     nmap-ncat \
+    numactl-devel \
+    openssh-clients \
+    pam-devel \
+    perl \
     perl-Test-Harness \
     pixman-devel \
+    pkgconfig \
+    pulseaudio-libs-devel \
     python3 \
+    python3-PyYAML \
+    python3-numpy \
+    python3-pillow \
+    python3-pip \
+    python3-setuptools \
+    python3-sphinx \
+    python3-sphinx_rtd_theme \
+    python3-virtualenv \
+    python3-wheel \
     rdma-core-devel \
+    rpm \
+    sed \
+    snappy-devel \
     spice-protocol \
     spice-server-devel \
+    systemd-devel \
     systemtap-sdt-devel \
     tar \
+    texinfo \
+    usbredir-devel \
+    util-linux \
+    virglrenderer-devel \
+    vte291-devel \
+    which \
+    xfsprogs-devel \
     zlib-devel
 
 RUN dnf install -y dnf-plugins-core && \
   dnf config-manager --set-enabled powertools && \
+  dnf install -y centos-release-advanced-virtualization && \
+  dnf install -y epel-release && \
   dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.20.1


