Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9A426B13
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:42:04 +0200 (CEST)
Received: from localhost ([::1]:45096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYpCN-0006k1-6N
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYoxC-00039t-Q1
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYox9-00070a-6l
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:22 -0400
Received: by mail-wr1-x436.google.com with SMTP id s15so29383072wrv.11
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6Md3DXGhaogoIPC2KfJR0RFUjtrXYLoKKIxGJdWSbA=;
 b=VYpbx2A7aV7Wp3oBifjKjvEFTyKwcMA6bNaVFq4nNKaR0pz+jlVCCofwYWYx1iewhK
 ZbKkE2BQqb2+q0QBcZ0ZLAZC6yRz4xin0DOCsDvJ/6Ep4uk8mCdiSSUkAYD89m2YpquP
 4IrYvZOIvjvdfgBvszRY9GESqbL6zFY2OBcbXB+lYMWEk1/4U/jvSljWQ0EFu1kVbErV
 vvPeqCMYnmIMQ2I/TzXsRGOLMfNq/h87lBolnVDVXbydIUkA7Kmd0ZqjC8+zf1jdihnN
 vtOlut7bkPDTT9ceVuwrS5Mwr+79Sn6eQZiAXMpAArLIemQTgEwslAJdl/H+NbGfagKo
 BG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6Md3DXGhaogoIPC2KfJR0RFUjtrXYLoKKIxGJdWSbA=;
 b=Tom6NyaiOFeoBK7dPQ1F67GeWfy9gcL2TZ+K9LeIvDUXard4y7ZfdDPjx9NJX1Nn7U
 maXr9qJ8AWvtUzX1nC0wNFsnkBd3OAEegQ5wUwDj4OFAesU/mAo/RLO7VGOrVvBMNYeR
 quo/4kVRur6AHfz9O2AtKMzNasmGFz5TVKTFIy21zoGnS3050EmDk0vNJL/nUv4VHJmT
 69At0Gu6YN3G8tZ+bAjJ7GIfRHmODybhJejMepgy5KDP8FTB5e2qMuKe+B6iWlYzUnw7
 o7AHILPvw9Ql6+4y/JJR0easiZlPObSSbX9ildLSbTQ84vYgL1XcZI5AkUcQRaa4Oj9E
 eJvQ==
X-Gm-Message-State: AOAM533NJYf0UXNDj30HRtmRVT6ypyBBVDWCH/tYz5westvDa3joR2hR
 wPAbgUomFQ6SJsDozzJlxBdLow==
X-Google-Smtp-Source: ABdhPJyNvBhGob0Sa+LicKAPvjq0JOcvinwMNz5QtKnvCFccgA3NRvPAt2r3XAGlQIQNhszPPXzsmQ==
X-Received: by 2002:adf:fe8a:: with SMTP id l10mr3703466wrr.434.1633695974178; 
 Fri, 08 Oct 2021 05:26:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w26sm2199473wmk.34.2021.10.08.05.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F9741FFAA;
 Fri,  8 Oct 2021 13:25:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 12/12] tests/docker: add a debian-native image and make
 available
Date: Fri,  8 Oct 2021 13:25:56 +0100
Message-Id: <20211008122556.757252-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This image is intended for building whatever the native versions of
QEMU are for the host architecture. This will hopefully be an aid for
3rd parties who want to be able to build QEMU themselves without
redoing all the dependencies themselves.

We disable the registry because we currently don't have multi-arch
support there.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Acked-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210922151528.2192966-1-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 450c76a3ca..b9d4094c2e 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -145,6 +145,10 @@ docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
+# The native build should never use the registry
+docker-image-debian-native: DOCKER_REGISTRY=
+
+
 #
 # The build rule for hexagon-cross is special in so far for most of
 # the time we don't want to build it. While dockers caching does avoid
diff --git a/tests/docker/common.rc b/tests/docker/common.rc
index c5cc33d366..e6f8cee0d6 100755
--- a/tests/docker/common.rc
+++ b/tests/docker/common.rc
@@ -12,8 +12,14 @@
 # the top-level directory.
 
 # This might be set by ENV of a docker container... it is always
-# overriden by TARGET_LIST if the user sets it.
-DEF_TARGET_LIST=${DEF_TARGET_LIST:-"x86_64-softmmu,aarch64-softmmu"}
+# overriden by TARGET_LIST if the user sets it. We special case
+# "none" to allow for other options like --disable-tcg to restrict the
+# builds we eventually do.
+if test "$DEF_TARGET_LIST" = "none"; then
+    DEF_TARGET_LIST=""
+else
+    DEF_TARGET_LIST=${DEF_TARGET_LIST:-"x86_64-softmmu,aarch64-softmmu"}
+fi
 
 requires_binary()
 {
diff --git a/tests/docker/dockerfiles/debian-native.docker b/tests/docker/dockerfiles/debian-native.docker
new file mode 100644
index 0000000000..efd55cb6e0
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-native.docker
@@ -0,0 +1,49 @@
+#
+# Docker Debian Native
+#
+# This this intended to build QEMU on native host systems. Debian is
+# chosen due to the broadest range on supported host systems for QEMU.
+#
+# This docker target is based on the docker.io Debian Bullseye base
+# image rather than QEMU's base because we would otherwise confuse the
+# build grabbing stuff from the registry built for other
+# architectures.
+#
+FROM docker.io/library/debian:bullseye-slim
+MAINTAINER Alex Bennée <alex.bennee@linaro.org>
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+
+# Install common build utilities
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt build-dep -yy --arch-only qemu
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        cscope \
+        genisoimage \
+        exuberant-ctags \
+        global \
+        libbz2-dev \
+        liblzo2-dev \
+        libgcrypt20-dev \
+        libfdt-dev \
+        librdmacm-dev \
+        libsasl2-dev \
+        libsnappy-dev \
+        libvte-dev \
+        netcat-openbsd \
+        ninja-build \
+        openssh-client \
+        python3-numpy \
+        python3-opencv \
+        python3-venv
+
+ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS
+ENV DEF_TARGET_LIST "none"
-- 
2.30.2


