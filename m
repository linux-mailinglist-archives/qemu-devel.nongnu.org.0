Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B243C5CFC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:13:53 +0200 (CEST)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vku-0005LG-Jk
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7Y-00059h-Vd
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7X-0002Od-4c
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id f9so19715661wrq.11
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qP523ThVXNn/joePqNyuk2xzCec54/sZ7rkgV006rqk=;
 b=g6eSGdRnH26YIdfvJ8RtaYFaeP16HnC6iSr4BYVz0CKXAjnBmQ5aq2wbYzQ9xVvrXG
 Gfp/lPcI6t3jXWznlDlacjdRIVi1thQ/8Mec68MZ/1cdolDD2C1Q+U6fhTsk2usgPRt4
 te/pTUqJbWlygpqv/BWt/leyWYBTJr8gbIYCaYwYS+uRW18as1LtXumGkh75LdkE/EYa
 ylwN5zKZBsxutM1BaN7205DFmdSAhBr+hdUWpcl+WRRPyR8rql4Z3scpzYHetTuycXvN
 QLmUtyhd4dEAM9icrFai3gMPDJJ9n9T8Z7rIdac3nxcrW1gS7jQAyt2xjuE0ghQjjZGy
 qmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qP523ThVXNn/joePqNyuk2xzCec54/sZ7rkgV006rqk=;
 b=l2/aeGRDseEjoyKXDsjMEmwpW5LacOkEbSlTIf0reu9aJVKrX0Ay9u7Vb9pKusjfc3
 VvzwDCqROsbrptXIWHDWsUE0rxMbYUWaOwc1lPbZmdW5MJrH+fDPm34aVsDzd7aHDYx9
 OlNgMJzX5nSkHwIabgZsd7do1am9mbyiLwDivGTpEXYpr+SDl59w9AYjr+DqTgwfPZek
 ADASabPq1qTi2NN1RLiFOUq2287v3hK+Js2OJOvi0uCDR9JBzd7A3Cah1kEb+d/luw2H
 JWc7BflFpceye0LmUCuDPouhzr5BDYTZ2DZqS3cPuuGvuaxAcFZhwJ4ofS435qc/BtBi
 p0Vw==
X-Gm-Message-State: AOAM530r+Rvkto24taVmfvRwCweIrSexsSBhlOsmDAhG6lZ3RSAQZ6Ue
 5m7QSUOBnB0RYygF9el3h/L6lg==
X-Google-Smtp-Source: ABdhPJw9Whwxm34mxsx5CY/Tf7w0wLQGOPoBq2eyUxG8GiWn598y19YvFIdZPJjdH8uISh/WiqDMXw==
X-Received: by 2002:adf:ed07:: with SMTP id a7mr26513208wro.70.1626093189971; 
 Mon, 12 Jul 2021 05:33:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t9sm13777644wrq.92.2021.07.12.05.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:33:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EBD361FFA9;
 Mon, 12 Jul 2021 13:26:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/40] tests/docker: expand centos8 package list
Date: Mon, 12 Jul 2021 13:26:32 +0100
Message-Id: <20210712122653.11354-20-alex.bennee@linaro.org>
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

[AJB: added centos-release-advanced-virtualization/epel-release]

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-12-berrange@redhat.com>
Message-Id: <20210709143005.1554-20-alex.bennee@linaro.org>

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


