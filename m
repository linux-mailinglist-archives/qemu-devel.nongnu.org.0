Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736D2DC4D6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:59:05 +0100 (CET)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa8m-0003br-Hq
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyp-0008Fu-GS
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyn-0002PN-M6
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a12so23816104wrv.8
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eVOlhod5aYsfnXeJBxVOLpS1FoyFiYktCGQIZA6BEI=;
 b=M7yZQxuNESFLxC8e3Xr2DO6fLSWyl7x/wlT6B7SivBQ0T+kaZTEqlOuSh+vTTNBBWK
 Cmyh6RemptgZKGsu2t9UiNFyz3I8IQS8nl64Xpwnh+J7y+aKR+bIrAKj+IzH42lkx77I
 j5Cz5OTmyo1cavJGL0BO9oOmE1Sky+EBybPfZ9rzWtJ8mfcakrvVYC3Ayi+eQzNAvPyq
 hmCnpAyNfM8pYQMFQeF+4ZZs/RBtTR/uHiKzU/YU30QmMMiifqAICLIwGPHFJEOxu9Mk
 CaoW0UOFrgG6nLaa5ap5bLkf5ni9+AAoHENnCxdRSiQpxyY0fDl5gwH5Ye/YSNOw0lgl
 2hJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eVOlhod5aYsfnXeJBxVOLpS1FoyFiYktCGQIZA6BEI=;
 b=eyEq65Eh2qKZmzixDXYsqgz5FKcX0qy97jmjVLTbzntcSoeMsLLXVw/T7IU1ruHjR1
 xxx+v2uspawGw98cWfvuq1BfAwaiNnYrCRE1h6zd5BXBoNDNqyg80BCdBmQZ+Ewc6KMo
 6TzIS5RrI+Y17q4vBOYr7b91CbzttRSKgLSvzUpasG39Ie81Pbi2KzjKZ+Di0H7wdwqy
 iBSETluf8quldbWDY5c/Ii7JM9xrUfAQ18eUCGj5Sh8cjYWOFJjfcZIA7XH0/eyjHpgC
 6CA/db9MjQd53ml/R6RQCXaH11iuvQlaHIxjHpBTGuDN81wIj93e7AbGxjwc/GwX2oC7
 ImhQ==
X-Gm-Message-State: AOAM531Q9JW2p6pZxMlRV1RFw1ZKY/8JhuLnPIfUEjQTnjkrsHNsFH+c
 VpB/1Og1b55tMell6fTjShzEwQ==
X-Google-Smtp-Source: ABdhPJwY8L5UUKpjLlQFIW+xnMLQa1NDPVdVqOWts6vAJL6BWTkiSnaUyrBBTXFUCYvnEM3t2/9l1Q==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr7985246wrx.6.1608137324335; 
 Wed, 16 Dec 2020 08:48:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w3sm3743673wma.3.2020.12.16.08.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFC771FF98;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/11] gitlab-CI: Test 32-bit builds with the fedora-i386-cross
 container
Date: Wed, 16 Dec 2020 16:48:25 +0000
Message-Id: <20201216164827.24457-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

After adding some missing packages, it's possible to check 32-bit
builds and tests with the fedora-i386-cross container in the gitlab-CI,
too. Unfortunately, the code in subprojects/ ignores the --extra-cflags
(on purpose), so the vhost-user part has to be disabled for this.

While we're at it, update the container to Fedora 31. Unfortunately the
gcc from the later versions emits some very dubious format-truncation
warnings, so Fedora 32 and 33 are currently unsuitable for this job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201215083451.92322-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index fcc1b95290..66547b6683 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -10,7 +10,7 @@
         --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
           microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
           ppc-softmmu sh4-softmmu xtensa-softmmu"
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 # Job to cross-build specific accelerators.
 #
@@ -37,7 +37,7 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 cross-armel-system:
   extends: .cross_system_build_job
@@ -69,6 +69,18 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
+cross-i386-system:
+  extends: .cross_system_build_job
+  variables:
+    IMAGE: fedora-i386-cross
+    MAKE_CHECK_ARGS: check-qtest
+
+cross-i386-user:
+  extends: .cross_user_build_job
+  variables:
+    IMAGE: fedora-i386-cross
+    MAKE_CHECK_ARGS: check
+
 cross-mips-system:
   extends: .cross_system_build_job
   variables:
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index cd16cd1bfa..a6e411291b 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,14 +1,26 @@
-FROM fedora:30
+FROM fedora:31
 ENV PACKAGES \
+    bzip2 \
+    diffutils \
+    findutils \
     gcc \
+    git \
+    libtasn1-devel.i686 \
+    libzstd-devel.i686 \
+    make \
+    meson \
+    ninja-build \
     glib2-devel.i686 \
     glibc-devel.i686 \
     glibc-static.i686 \
     gnutls-devel.i686 \
     nettle-devel.i686 \
+    perl-Test-Harness \
     pixman-devel.i686 \
-    zlib-devel.i686 \
-    libzstd-devel.i686
+    zlib-devel.i686
+
+ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32 --disable-vhost-user
+ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.20.1


