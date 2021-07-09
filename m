Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26803C266C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:58:04 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rx6-0000ne-0K
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdR-0004qu-P5
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdN-0000Fd-OK
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:45 -0400
Received: by mail-wm1-x335.google.com with SMTP id g10so6492645wmh.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6rn2rW0jesZ7fjWeIQQTMy5p25VbdIDcQJRFypEibA=;
 b=dOwEwNL9dNoKbcLg1AyNwY/ZQ5FQ1n/tnGFHITiDhcA1YWTnXPiajao13KExwZrUKq
 RraJ8OMZXb1SjWizBkMzHS+wfNMGGm1iM28etY2q7e4J/CAPAJPBuiebfdb9cZijWZH1
 rM8O7CxVPcP8/cXRvFgo18muDpHhV8mRPr8CeIW7JnKlmp9d6ffF3eErnA9r56pPxxrx
 6ln0bfyidYr0G+TQXUe0yvFqEvNLiQJ0prJpt1qyDhxyfwurv1Qa5ggvdqrEb+gZHwbq
 VtfWMQkXJtO5x1M4SeWlJ83+2utUXps39ZbG4TyRAsWKicPucIryyBDOmf1PSxk1ZC2C
 WUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6rn2rW0jesZ7fjWeIQQTMy5p25VbdIDcQJRFypEibA=;
 b=HgdIl9Cdtp65PWFr5UHMEXaegXk6bs8qGdJ/ufg8Ha/ga2IpxFiwg+kzUach2TnB5X
 NMFFyFms1paznwCHJ1XST9bVm3CeJC2UFG8SPO60yvn1C5lEoDdPJ0WLxgwgWsfm2Zgj
 LALWT5B0EP3aMFG/UHzjmyVTXYeL4yqRFrltjtiFCIMc4Mfico5y1xztwxL4P5tgOVIO
 dOp0PyYSof3WFvOiI6ccsSa+8eqTDA8HDS86GJP5deZOHOMcFwTA1aElrIv9izItDprs
 xzeWq4znnT4XfzkvxgSxwjHILAXYc9wxHmM7r1Ri0UyH+S5oOPwE4GL2uFbBvY0KZHQs
 93dA==
X-Gm-Message-State: AOAM532fFDDI3WacgCof4yHIxHZgP29HKrd5aisQbBlHeql8CZdwTE+R
 R1aUPQM/V9WRGBzLeRPR5qs92Q==
X-Google-Smtp-Source: ABdhPJzL5Vxn7GQ0yoYcr7weGfq5ObxhYD0x33Ac9pHJt5qJDQ5eyrfAIU2QGWM9XU840/i3o0Incg==
X-Received: by 2002:a1c:7410:: with SMTP id p16mr41102816wmc.24.1625841459499; 
 Fri, 09 Jul 2021 07:37:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u12sm5501654wrt.50.2021.07.09.07.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A109E1FF8C;
 Fri,  9 Jul 2021 15:30:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 20/40] tests/docker: expand fedora package list
Date: Fri,  9 Jul 2021 15:29:45 +0100
Message-Id: <20210709143005.1554-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


