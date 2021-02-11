Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7F6318ACD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:36:12 +0100 (CET)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABCY-0003Ej-SH
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4p-0002xK-3N
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:07 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4n-0003sK-0c
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id a16so5898993wmm.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JjI+A8S8kj24iQBJyBWYv0s3f8Vb/UMmaw7Q2yhCD7g=;
 b=SjF4S3+oEwpJvqubfAKLClqml7TDxOQLlCD5SAmjK0f22BwIC9Cu2AEJeKgqQZaIQO
 Oy4awsYiSNK4DGGAznRGKVNLQ8Fab9jHf+qhsEzsoa1IeyjzozWnYfDvT1degUEVhB7l
 9FtA9F1YSx6YBsy2KcgyE/n8fcA5jUT5lMn/kR+6CQd8wULShjMHG3ht6NgYquq+VQfX
 +niGB283yirB4HymNW2mQH4wYxc8zTiQCxpobOnfRqfN0rxbm5DJb5ACq3gAVHxv0mCp
 tmLD7TxgLnDk1MwBw97Fh01D3DxX+fZ55NHwrkd3eMHgx9+JDkLuf08RvfYdbZrDvX0J
 uIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjI+A8S8kj24iQBJyBWYv0s3f8Vb/UMmaw7Q2yhCD7g=;
 b=cB8DjHevOh7mFCnlkF3OA2TiN9WouJpgLiLO8tCZANp4VV072WrDTI3Znq84aAngvb
 t/fu/myNibbFJ08K7XG0zwBXPbbDXcYucZ1M4nT/81U64hEaehZuPxcKRqqOlbxSDHuq
 kqw0mqBq79/4npTsi6uJdQpzf3Ywl82Y1qWPdjnKRho6772xuadSw7U5KgRz78KJp0t0
 s+0jf6DtI4x/Q4kQyHRJV8QFLJb0b7GXzZEsYNquNaWQwQTKomsqS4f+BV46n1bqZC7a
 GJPCrd2g/F7EHNbz05p9kD75MH73OT9gOSRF46Q8rLNMhvQq8xoGdis4aAZpwA1GA6y/
 pJ4g==
X-Gm-Message-State: AOAM531yaNlvg8McRMRZeHv68J9UTOTlEAq7LtKfHHdpc8fKWczwi+Gq
 HLk+NKEu0jte4knirHFncI6HzQ==
X-Google-Smtp-Source: ABdhPJx8MtxF497teYSBDw9pjyesUT8QaAOSxmpx4PCxUBLgqgvXqkTst7v9bVfAHV76nN4sNn2yEg==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr4746467wmc.80.1613046483722; 
 Thu, 11 Feb 2021 04:28:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm9547388wmh.9.2021.02.11.04.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D9531FF91;
 Thu, 11 Feb 2021 12:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/15] travis.yml: Move the -fsanitize=thread testing to
 the gitlab-CI
Date: Thu, 11 Feb 2021 12:27:40 +0000
Message-Id: <20210211122750.22645-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Use clang-10, so we can also use the --enable-tsan configure
option instead of only passing the flag via --extra-cflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211045455.456371-6-thuth@redhat.com>
---
 .gitlab-ci.yml |  9 +++++++++
 .travis.yml    | 51 --------------------------------------------------
 2 files changed, 9 insertions(+), 51 deletions(-)

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


