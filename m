Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83B3BD9EC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:16:50 +0200 (CEST)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0moa-0000Lj-KM
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfE-0005Iw-RL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:08 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfC-00077n-J8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:08 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so2481668wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6rn2rW0jesZ7fjWeIQQTMy5p25VbdIDcQJRFypEibA=;
 b=MRrSwHtaqQbHLJ5hNSBszU3KUyVW8WG4vlq2J9qkMgnc00BFkbafCg4vDAqBeG+2LR
 DRDZco5ff34zRDr67dVN9f2P/tcNwKw8AfNDrwGnmMyVLabFod4tCNt6KtoS5yWcsCUL
 ZAKRZtu91+yr84Fvgk3Fl1YeR2uesaysOeZObGQneTg5qhvp6Igjgxh6R3oYgFEVm0VZ
 RlbjaG3y6g3y0qDoq9SCRBWFAC5Eow+cmVqK/Qppx2b0AB3bprZ47C3t9hGZDIG0G/v8
 duGT+b51WylIkhxXNtu/sYTb9CKhLNt2lDvcVTaVO/DYN14HQVyQ0p0BghM13GfD4U+U
 cOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6rn2rW0jesZ7fjWeIQQTMy5p25VbdIDcQJRFypEibA=;
 b=C3xILZ2Z1xpD7X05XWzeN+q4vu/1g7q4Ee3Tjfr4CqBBdXQKxtEz9b+nRgdxYRXEW3
 +cBHQdJc94334MdrNqFNo11UmDceDT1Tm49Q657j4cJkPqzwcFi8QKnoc3LceE3nrCwP
 O8dw+3hjKCecqLr8jrVEZfnHBSUl2N+f11lvKMCbV79ZTscdy7L2CVSjyHhPMzRM0hI3
 fFE2nO0kzNgZJQ9IOcD/yX2QVInnNt+HLCEV9tZr0a97Obpkca2a/g0Cri9/y2UzGG+I
 bUnIPX9yhG1KK7tw5vwYdZetYGCbi4p37/Nzo8UT0ZzZ1EvR8hv18ksJiAJvMSLg/v3l
 onWQ==
X-Gm-Message-State: AOAM532SMUA6MayCBA4lGMtG7gHNuSAF/tvKd2ldfzYdQvkOifvCOWXv
 /fMjwcvN6UFaHj2uXGKUbKcZDg==
X-Google-Smtp-Source: ABdhPJyfaJUdHglH2bGCNDp+th0q30QQ83d5Dxyn5Ii0cEStwUYH4jQxJHpp1GIU+E//hMJIiMgRoA==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr20636505wmi.171.1625584025168; 
 Tue, 06 Jul 2021 08:07:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r9sm11662485wmq.25.2021.07.06.08.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19CFF1FF87;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 20/39] tests/docker: expand fedora package list
Date: Tue,  6 Jul 2021 15:57:58 +0100
Message-Id: <20210706145817.24109-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


