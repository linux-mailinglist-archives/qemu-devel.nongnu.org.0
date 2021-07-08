Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64173C1A43
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:01:15 +0200 (CEST)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aCw-00008p-L1
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZgE-0005ZS-MK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1Zg9-0001zN-Vg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id i94so8903294wri.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRopgnAuRpqjJ5MAitTX29dKnbdmWON3ciEwighPhUk=;
 b=QdPsJl88nB9i85jhd7eGM1N8Fx+e4Alz8KENwk/NVrRY/lmprlJAN9vrC9E7h83rpV
 RBnnpWtlHxFDO56jpALE+LRaLm3n0t8F0zIJ258d6R7on9j63Rb//omOUmCHrUBEjwwq
 lRBcmD/pjNqFqKOceFBnomzTayNx8a3ksGRGjczlPxPruwuW7pAZUvcZhoXt3q60Ef4D
 3Qedadc4Xtqo429Jeoo2t0O4+n2f6ggZv2K2qb59BgILs86EDS0SfcIoCpsOUGvQdI+9
 a+Hdm7E0wIC7rio9ybW9prTomOm9EWpZQz3GhjbUyWumWJJ2FJRHP1kquMXiBs9N+jsX
 HArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRopgnAuRpqjJ5MAitTX29dKnbdmWON3ciEwighPhUk=;
 b=HoxT1Gs3EjSRpBebXbGm4z7fliXm2CDwPO36CcpXQbGCDSw291F83gCLPVK6hrdWaf
 GPQTBTaI44kx+YhmlQCuGvm95bT2CCAL2g3VOT57myauEUkhk08fDbc9RGjAjbg824AY
 /V2I6pZvZmb9WlYs7Q83p/8HeDBzY2TRzIJAKYzembvVaQR+/R/OROzrlq/MQt6mXll3
 mXdXhqofhgzFN3qTYWYo4pOgkdIHrkU14PvtfnyHvgoCGOLDth7CYOgA/V54d2njUVyv
 yqb0rAxmWYaoNGJd+bL0K0bkcsXpRmQPDUNENCfJyabUvA64SwLXn9Q02mOQuwVSDK0r
 ERcw==
X-Gm-Message-State: AOAM533L7rn9iP2iVHW8C+fPrfpjJQbRG6MylCP0ICPH+kNsEnDpR/uo
 Q/n8OSGPZKZXnwF3+k1mYd+Opf55RvOilQ==
X-Google-Smtp-Source: ABdhPJwsskTdQ0Yb/lDDa0/HcB49E+ty1MLXQqrKpWbkqNNySwMH8tyRWXcahGJ/SY+4EMcTjh/sKw==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr36158991wry.299.1625772440659; 
 Thu, 08 Jul 2021 12:27:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k5sm3061141wmk.11.2021.07.08.12.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:27:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8AB3C1FFAB;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 23/39] tests/docker: expand opensuse-leap package list
Date: Thu,  8 Jul 2021 20:09:25 +0100
Message-Id: <20210708190941.16980-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


