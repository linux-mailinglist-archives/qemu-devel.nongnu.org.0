Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53A3C2648
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:50:35 +0200 (CEST)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rpq-0001Ii-Bl
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdZ-000577-3x
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdR-0000Gh-4F
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id a13so12426510wrf.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRopgnAuRpqjJ5MAitTX29dKnbdmWON3ciEwighPhUk=;
 b=wUy7RXdKogMqUjnYo9mo0WvZrU9dg/zQfXh8FP3tMXruXGMEmm3s1OD6MqAf6LZHT0
 ELzc99x1rgH7gnrrTtQtLGtJLbO1HVTncaRIL4b2chKtLE5DlUKsjZtcuQJ94R8FAU2E
 i90ktvNTQDFn92dkUYbRe3ZUjw1LevXYbFnmJnXN5a/oly0CQU81OE8eOCLt8an2POUO
 VX60LlCK5Y3OGMmXcJlmPiJvrGqNSwEcWathUQKLeKaLuHBFshIcYnLOBvmZ7U0CUBJr
 q3r9LIZ+i7mdCZcPaY4w/0TAn9Za+Re3VoThYjb1NquJ18NXWph6OadAbo+otT7dfFCO
 J3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRopgnAuRpqjJ5MAitTX29dKnbdmWON3ciEwighPhUk=;
 b=MoG31Ll9spur53EHHZN/Qsj6Muech+kxZHSV/tGdVFCZZ+8+KPGOOC48kpDCVbuRT7
 VOxsftzxw0YntT2aI0sbPENwlvcgaNtV2FkA4cOxbjjX5tqnimwni/kK/45FhDABfftr
 KtJYuZ7oQNgCjhShXhXIKvEL7RGz3eSP2yPyBakDcgmKjGGIvmdkfNJj+MrNfEwlItMp
 SrWwui0d1MIX3WNh/PHh8ZthxAIBwD/3LLMiOsoNb2PPRoEZCNzzM1/lPTDDHunb8Pzz
 nnutfjMjkd/wKVIG7TZ5pmxm5bPJYoLENWN3npUlDu7gX6RrKY9aeqd9uFhWgcqwbR2d
 jcSQ==
X-Gm-Message-State: AOAM5331gRVlBjrkEIVTrGNRqPM0hbbLIDFL5b7aRnld7QaPkq0Y70/b
 Y9HxFwxl1V/ravIlsl+FDJNeAA==
X-Google-Smtp-Source: ABdhPJwZ1xUcELkIFr9RUfB6icNzIWGV9XjvTIYKfxwkUwMlFJJbnMXo8B4zXT4IZPmQEJFAQfZORg==
X-Received: by 2002:adf:e107:: with SMTP id t7mr42169485wrz.165.1625841463428; 
 Fri, 09 Jul 2021 07:37:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x1sm12584109wmc.0.2021.07.09.07.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F63F1FFAA;
 Fri,  9 Jul 2021 15:30:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 23/40] tests/docker: expand opensuse-leap package list
Date: Fri,  9 Jul 2021 15:29:48 +0100
Message-Id: <20210709143005.1554-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Message-Id: <20210623142245.307776-16-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/opensuse-leap.docker | 59 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

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


