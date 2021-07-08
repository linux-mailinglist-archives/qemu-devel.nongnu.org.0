Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC13C1A3F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:58:10 +0200 (CEST)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a9x-0005FN-1e
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZgH-0005bP-Di
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZgB-0001zg-4t
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id a8so8906060wrp.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVqTslJtY4FYTYh9yN/AgrJpuhlasOrPI7zLw6S0HIc=;
 b=XF55MZGAp8+N0P0sW+8f6Re3ymbiYxzFuHSGid/pkY1UrWf5m6HYOJg4Bd5Ww8PXd0
 wbOZ7kRRWU97jcZ8HL9DDU9So3HxWkh54VJccFvHu6B0gA8rvweD8/52Wv5oseL/pWnc
 pgsrh/vs4mRAdAVFhtMC7hwPUsfF3pOcDIEtHfa+QdUZNjmQNpEksRGDcroCye8eGckl
 wU1CNBKtmQ0T+kK86K+W1deQOKIoJz4+MOrFFkfo2e0Dth9MFeakShozDnpoFHHWsXbH
 m0/sPLvw4jVEBNb7/y0r0FfdnRexN6e+mxMF5syUBM3qBUeevhPM6YPkpHCSZXtL1jvk
 a+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVqTslJtY4FYTYh9yN/AgrJpuhlasOrPI7zLw6S0HIc=;
 b=dpxTo9qsYjGkgY9ldaAD6t8hX6YQPw6Y6vTpWf6CRIZHPRKHeYvTG035VNd2mhEmHo
 SG3UwyAPgepDpSGZdFm/gAc4QQocdBcZa4bN86YQKxcE3v34iB7wZZkazr+RLd1xBwT8
 Axj36Vr9rXuo1iNkk8n8HNfE7ZZZWZukXQHpx3gCpRQe9aNvDZpq4t7wB00CNKm2K4f+
 537RwSQxWPxPgHBwahjm4QWH6BdPcSnsKBG9L5nukVCRSLfwv7M/srXt0XQSZ1GRfX/y
 YjIG9B99heeO6C/RjpT2VIpU26b/6Nqg1fn19c+vJSKGMF6EFKm8fYJwn476Wscqq2kI
 povQ==
X-Gm-Message-State: AOAM533bN6GmDs3hE6R376XhzGTqRQ3ZkV5F6U5jQfPnf/YmDtczubuz
 DLZpwDeKYfof+YhnoiaSdWXmWA==
X-Google-Smtp-Source: ABdhPJwUUwCwRDqDvwqwbNpjAkiLNd6pMkyz59AsdwmzERlCXzlvaKgQe/svsKD7ql4MxLlHB3cnqg==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr36417242wrt.174.1625772441620; 
 Thu, 08 Jul 2021 12:27:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm2722864wmb.35.2021.07.08.12.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:27:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CF331FFA5;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 19/39] tests/docker: expand centos8 package list
Date: Thu,  8 Jul 2021 20:09:21 +0100
Message-Id: <20210708190941.16980-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


