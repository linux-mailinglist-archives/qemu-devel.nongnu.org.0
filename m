Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989C3C2610
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:37:07 +0200 (CEST)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rco-0001yk-E4
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWh-00059Q-1C
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWS-0005ap-1L
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id i8so12383334wrp.12
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVqTslJtY4FYTYh9yN/AgrJpuhlasOrPI7zLw6S0HIc=;
 b=nnar00QSpkEPd1Q7PE8xyWfrSix2I6XI3lAtu4EhS+XCSvbWFsaR8e9mEXwhDnUErr
 sY5ly7ikCmxea53VTc7YXSP7KbrtFMODJD5dcr4pVlELpXeo2jC1ABpoT3bZc3TLRfGA
 qsOGhVHP39l1vPnKoT5TmuPq/iqaLF/bu5ZhTsRMfdLyGAZbdOBkSBsQJ0dbXkf49G5u
 pUlSf5cClTN/i4RaPRkgeQVknaw7Etv86F/QRaRC/6YrmolhZsxA0brCnHNfpQJEAjpw
 Ppu5RT13CAsQeqvBk+WbIRUpiNH+XCGvYW2XfQGrZT86lQvln4Srpuf3BRadpR+5ySJY
 ehCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVqTslJtY4FYTYh9yN/AgrJpuhlasOrPI7zLw6S0HIc=;
 b=ipUvulx0wzbAvwvcW9sbNOO2gKuOmBWP2gn/9a8ZLP4Iip6NAj4dnQwsl6BVNihwqn
 fAQe9REyJfoEUULSajizoX+8yGOxpx+/BLKuhQjVW76TT6JTjciHIVdtH62Lw7lqq3sO
 N1YyrBz1YxhE9x08aiurZCplEhRV7ZMiOFuwoTIn9vDEtgY6A8iy00TNQ9exyLRcI1kv
 QxtF6QSZUlAHneIudDrWDZaOp2wCXOKAliU5AqlM0JtASoHEfJFr2N3AQpgjcOu1BLLo
 ywjHxgE5NR2H7BPTvPZn9xoFDO03xMfR/Kq3Pzh9Cqh+7pl3LDkxS5KvwGRqRjvcqPUI
 nYNw==
X-Gm-Message-State: AOAM533E2QuceCMqi8JEEtVC1nAU4RrC2JxWxcAVf9TapqiV6zywsRx0
 ADPXN+A7Te5bmP6zMz0ptfqa7A==
X-Google-Smtp-Source: ABdhPJyGV99/QriZbggLwdD31iF/acZpIkCPzZfFTTgnNPILXvvYoKnPnjP7PBzjKUBq20q7zpI9kw==
X-Received: by 2002:adf:f592:: with SMTP id f18mr3613556wro.179.1625841029400; 
 Fri, 09 Jul 2021 07:30:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f82sm11041966wmf.25.2021.07.09.07.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66E291FFA5;
 Fri,  9 Jul 2021 15:30:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 19/40] tests/docker: expand centos8 package list
Date: Fri,  9 Jul 2021 15:29:44 +0100
Message-Id: <20210709143005.1554-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


