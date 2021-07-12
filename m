Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837833C5C94
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:48:21 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vMC-0006gL-8n
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7S-0004zr-C4
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7P-0002M1-AN
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id p8so25389352wrr.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cP7o8wiVJfZhkAdD0nznZLEDoJtABzddO1b/wxyVoMc=;
 b=V7I8i4qOEK4uS2xjB3G/A+sTdR0spA1Wi4WRNn7jp8I5mKFj33EO0od5q6Nx0/XpLl
 +/ya/cEe+CPFERMfztEDKIaPQ21EpD/STKJGlgjX9VmggWTrAaYJJnUfHJsAR1JNYhyE
 9/jYstCWvG0SGEdaE2MymSYV/T5dwOqO0RYrAMvL7VAxeX7ixVP2o7ct/pK7X/3U966g
 MrVorCyHGDTXMZX4EPeQn88FHvQ/IYIfYz+xNWvjYA68QriLBGxEjpc2ZpQQCIGOBNHh
 0Idw4gbz0MaidTRTrMIvpwNrAvqfUKcPufES1/bUiQKxCdUs+Neu+29g873Q5EoV6cEY
 d5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cP7o8wiVJfZhkAdD0nznZLEDoJtABzddO1b/wxyVoMc=;
 b=Bzp6/EWYgGOqsoc1Z8a/3ZYlfxZt6YCV1o2EXirqJh5z8tsDxprWnaQFEaxrvBwGxG
 CURFguNCrxUcLTyXPOHpgmDQ/IdJnUhV0bmJbZoGUfbbIF6DZFBD/N4M0tRDUvZ1if3L
 a4eTha3756N5SWZmEXJwuCA1X59wLy2+teSSec1TSyCDWL8jT681j5A7c7gxBffH4RAk
 Hds5FbobobwbCzSJCZUXMI0fPbwWOUnaV1GgnqlvwZijLXPC5PMtrHvxRJmH0WHL+bmx
 FB80+jAs4wo6m6uVoCohM/Ajz4JbeEEh99N5Ndd+dbGghkU7To8wlGrM58428GypCnK9
 Ma/A==
X-Gm-Message-State: AOAM531g9qXTIGJsYex4dMk36IFigr2gveDThuiefzXGWgIhwXo+h9PK
 w1ij0Q0AuIGJwG4XcuBdMAD04A==
X-Google-Smtp-Source: ABdhPJx2CS3NBzlIcNRm0TokPfYvmJhmONQp+/44GApHOrJPinW802Cs7Cp5RCpJJlk+lLXFhIA2jQ==
X-Received: by 2002:adf:e507:: with SMTP id j7mr58755669wrm.152.1626093182138; 
 Mon, 12 Jul 2021 05:33:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm11255883wms.32.2021.07.12.05.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0DAA31FFAA;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 20/40] tests/docker: expand fedora package list
Date: Mon, 12 Jul 2021 13:26:33 +0100
Message-Id: <20210712122653.11354-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-Id: <20210623142245.307776-13-berrange@redhat.com>
Message-Id: <20210709143005.1554-21-alex.bennee@linaro.org>

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


