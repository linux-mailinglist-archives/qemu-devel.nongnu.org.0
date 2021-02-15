Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAD031B6A8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:48:32 +0100 (CET)
Received: from localhost ([::1]:33828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaUZ-0005DB-4Y
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPB-0008UM-5O
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:57 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP9-0004NM-GZ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:56 -0500
Received: by mail-wm1-x331.google.com with SMTP id h67so3865705wmh.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CsFHEa2dmZHo76urodPueIcMA6EuUDsw/Z/ua96i2cM=;
 b=xZHM2tem6wzewtdzpNaKM6awCYjffh9qMRVKPZMQkWo8/mz+J+YL4nt+Z9dixABcTm
 TTGo/knByv8O4SEb6GeP0/a2sO9r+ZpiSUe31uzKPMAaG7ZdhJa+ACLdnszIvojN1c9m
 YVk77hw+i6Pu57X6buw/1/YnCEYttA/9QHH5hJB43443OfI1L0WF156cbZfepBbSXEHP
 d3raeFuxSknevGzbIwWDPLGqqW+FJMV7V9bAUMoEJLB+QFt2k+Jua5V3JQ8s3MjgxSmD
 uA512FSoRP1M2HjbWfX23Epfo/5rG/ySDc2VYtOGkmJW6yZ0FlRp0lpxCRwTa/FjFyh+
 JadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CsFHEa2dmZHo76urodPueIcMA6EuUDsw/Z/ua96i2cM=;
 b=QMMgA7ODP1SDS6QCLeHHE9KRKPOYgP1vPaqfa/51N6qCGx/wOPqeAo5xsT2WsUGf5U
 ychamTwNng90sGUM/d3VNEg6SKMDM7li8znecPZRacp8IJEJJrZZ2PvtTKfHEc5B6Xpn
 anlfG60JkWiHjGdALc7lWH4GEH2hpRk4jjHPoOoHcV8n0rPFk7xBhL8PmQuyUA9P5SOc
 xJIfcRnzFG+1g56omFX8y3bgjB4/LMQJFXmjpfP9gHgl4bjXBlki7LRMEN2SAOSpHsj0
 nFuYW7hN4N6q7hnuZU4qRDHY62ndeZbHJHSs95IBUo0QxyeM8nQix6uvSGfVNjh5AKD3
 9M9A==
X-Gm-Message-State: AOAM532s4Orv7pfqqQ1nIHS+9xjUn29knXePKCZm7UBnWgJdwkXLEfPm
 C1f/Lxb8s7AUKgk1HsRea4564Q==
X-Google-Smtp-Source: ABdhPJyM2qzB5KfP4m10BPzOXbAJgx/X7Cz8OhRoDaIILnn89C702gZ4Lo4aA0p40+eqztg+EgoTyg==
X-Received: by 2002:a1c:a546:: with SMTP id o67mr13589124wme.151.1613382174154; 
 Mon, 15 Feb 2021 01:42:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y16sm19025901wrw.46.2021.02.15.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E4521FF91;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/15] travis.yml: Move the -fsanitize=thread testing to the
 gitlab-CI
Date: Mon, 15 Feb 2021 09:42:34 +0000
Message-Id: <20210215094244.12716-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

Use clang-10, so we can also use the --enable-tsan configure
option instead of only passing the flag via --extra-cflags.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211045455.456371-6-thuth@redhat.com>
Message-Id: <20210211122750.22645-6-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e878cc0847..7adb9a4cef 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -452,6 +452,15 @@ clang-user:
       --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check-unit check-tcg
 
+tsan-build:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
+                    --enable-fdt=system --enable-slirp=system
+    TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
+    MAKE_CHECK_ARGS: bench V=1
+
 # These targets are on the way out
 build-deprecated:
   <<: *native_build_job_definition
diff --git a/.travis.yml b/.travis.yml
index f0e2b1059c..0a4f38b9d8 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -119,57 +119,6 @@ after_script:
 jobs:
   include:
 
-
-    # Using newer GCC with sanitizers
-    - name: "GCC9 with sanitizers (softmmu)"
-      dist: bionic
-      addons:
-        apt:
-          update: true
-          sources:
-            # PPAs for newer toolchains
-            - ubuntu-toolchain-r-test
-          packages:
-            # Extra toolchains
-            - gcc-9
-            - g++-9
-            # Build dependencies
-            - libaio-dev
-            - libattr1-dev
-            - libbrlapi-dev
-            - libcap-ng-dev
-            - libgnutls28-dev
-            - libgtk-3-dev
-            - libiscsi-dev
-            - liblttng-ust-dev
-            - libnfs-dev
-            - libncurses5-dev
-            - libnss3-dev
-            - libpixman-1-dev
-            - libpng-dev
-            - librados-dev
-            - libsdl2-dev
-            - libsdl2-image-dev
-            - libseccomp-dev
-            - libspice-protocol-dev
-            - libspice-server-dev
-            - liburcu-dev
-            - libusb-1.0-0-dev
-            - libvte-2.91-dev
-            - ninja-build
-            - sparse
-            - uuid-dev
-      language: generic
-      compiler: none
-      env:
-        - COMPILER_NAME=gcc CXX=g++-9 CC=gcc-9
-        - CONFIG="--cc=gcc-9 --cxx=g++-9 --disable-linux-user"
-        - TEST_CMD=""
-      before_script:
-        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
-
-
     - name: "[aarch64] GCC check-tcg"
       arch: arm64
       dist: focal
-- 
2.20.1


