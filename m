Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C5207577
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 16:17:16 +0200 (CEST)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo6DD-00038f-HQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 10:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jo68y-0004I3-E7
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 10:12:52 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jo68w-0005xn-C4
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 10:12:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id 22so2474749wmg.1
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JsqTbe4nx5Y4ze+RsCvycmftPXZdnpOMBPVnwlH7Pw=;
 b=Zy5uGhZbVrUE8s9R5MwQljmeTArI2h6EuIR7XdyOUQB2h42SYTpt+fTHzwLIAxx9gA
 RazQPygD9QjKE8ReAH+2lo/+RcbihCXmbhIIzeNMP8KgzB9AcY3SHqGY+rASAmlDf8So
 3trIBocAW6fjoDQIq3FlYX3YGCu+aHrJYMaK1h3RlIT2CNiEfDt9FRKwVRDlZrhODdai
 w6THDSkse2iaMdF9IyIpDI0YTA0GwZMpUlTk8tQvFzv+UPh/TYmFGyEjISETJ4hiwgtL
 vZ2OkrYWvURyseBtKoAOFjdCMRfuu1QuZFiR27/hW8uhYvzPqdilDyXCOB0gATO5dInG
 +8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JsqTbe4nx5Y4ze+RsCvycmftPXZdnpOMBPVnwlH7Pw=;
 b=YJBFVT6ZrGeTQ11uadxWw+q0N9PY25TB7Rxwi7w/1xXzg8+UX2T42fOQaJZT49LZpy
 VKB/NFUBra4gg/1haHsv31qjg3WWeLHwyCc8NVLOjTiLqZinUy+9fLZpLDUMMLO+adNN
 BaMEEDMoqIn/K1JTnJd8c0u74sQOBy82Q0N2D34rn5XmBvgK1oziDy72/M9WosEOTuJp
 vX3mOkNvvFiQELTepo5icp9NYsBp1l6GOQvfoD9JfIiKikq1bLqiIM1KgYgbThMup0vw
 RcaEc/w+skA5pzdXXHEAyJbPN5cjdqgEbh5ind1vwex4Yvk+c2jKiXk0sA69HaVandhi
 dMKA==
X-Gm-Message-State: AOAM532Lho1lF3XFm9CxquzU/i4OiAfqSqQbtB1m7ZPWCQGZs8bmcyOI
 pvOYATF2j2666tm7JTRPJ5GIIQ==
X-Google-Smtp-Source: ABdhPJwpIwx4oujo6JpFWsB6StuWkOhS1lIrCOl4Yre6INAU6VAQJK7bnBTIAGoaoaQq9+x9U0y1TA==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr31544499wmd.156.1593007968819; 
 Wed, 24 Jun 2020 07:12:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z16sm17596847wrr.35.2020.06.24.07.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 07:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8804C1FFAB;
 Wed, 24 Jun 2020 15:04:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 22/25] gitlab: add acceptance testing to system builds
Date: Wed, 24 Jun 2020 15:04:43 +0100
Message-Id: <20200624140446.15380-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200624140446.15380-1-alex.bennee@linaro.org>
References: <20200624140446.15380-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

As part of migrating things from Travis to GitLab add the acceptance
tests. To do this:

  - rename system1 to system-ubuntu-main
  - rename system2 to system-fedora-misc
  - split into build/check/acceptance
  - remove -j from check stages
  - use artifacts to save build stage
  - add post acceptance template and use

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200622143204.12921-16-alex.bennee@linaro.org>

---
v2
  - updated with danp's docker changes
  - use needs instead of dependancies
---
 .gitlab-ci.yml | 65 +++++++++++++++++++++++++++++++++++++++++++++++---
 .travis.yml    | 23 ------------------
 2 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a7abc55a5c6..7fcbdacd9e9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,8 +1,12 @@
+# Currently we have two build stages after our containers are built:
+#  - build (for traditional build and test or first stage build)
+#  - test (for test stages, using build artefacts from a build stage)
 stages:
   - containers
   - containers-layer2
   - containers-layer3
   - build
+  - test
 
 include:
   - local: '/.gitlab-ci.d/edk2.yml'
@@ -24,26 +28,81 @@ include:
         ../configure --enable-werror $CONFIGURE_ARGS ;
       fi
     - make -j"$JOBS"
-    - make -j"$JOBS" $MAKE_CHECK_ARGS
+    - if test -n "$MAKE_CHECK_ARGS";
+      then
+        make $MAKE_CHECK_ARGS ;
+      fi
+
+.native_test_job_template: &native_test_job_definition
+  stage: test
+  image: $CI_REGISTRY_IMAGE/$IMAGE:latest
+  script:
+    - cd build
+    - make $MAKE_CHECK_ARGS
 
-build-system1:
+.post_acceptance_template: &post_acceptance
+  after_script:
+    - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP")]' | xargs cat
+    - du -chs $HOME/avocado/data/cache
+
+build:system-ubuntu-main:
   <<: *native_build_job_definition
   variables:
     IMAGE: ubuntu2004
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu lm32-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu m68k-softmmu ppc-softmmu
       riscv64-softmmu sparc-softmmu
+  artifacts:
+    paths:
+      - build
+
+check:system-ubuntu-main:
+  <<: *native_test_job_definition
+  needs:
+    - job: build:system-ubuntu-main
+      artifacts: true
+  variables:
+    IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
-build-system2:
+acceptance:system-ubuntu-main:
+  <<: *native_test_job_definition
+  needs:
+    - job: build:system-ubuntu-main
+      artifacts: true
+  variables:
+    IMAGE: ubuntu2004
+    MAKE_CHECK_ARGS: check-acceptance
+
+build:system-fedora-alt:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
     TARGETS: tricore-softmmu unicore32-softmmu microblaze-softmmu mips-softmmu
       riscv32-softmmu s390x-softmmu sh4-softmmu sparc64-softmmu x86_64-softmmu
       xtensa-softmmu nios2-softmmu or1k-softmmu
+  artifacts:
+    paths:
+      - build
+
+check:system-fedora-alt:
+  <<: *native_test_job_definition
+  needs:
+    - job: build:system-fedora-alt
+      artifacts: true
+  variables:
+    IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
+check:system-fedora-alt:
+  <<: *native_test_job_definition
+  needs:
+    - job: build:system-fedora-alt
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+
 build-disabled:
   <<: *native_build_job_definition
   variables:
diff --git a/.travis.yml b/.travis.yml
index 74158f741b1..c24dfbe377f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -289,29 +289,6 @@ jobs:
       python: 3.6
 
 
-    # Acceptance (Functional) tests
-    - name: "GCC check-acceptance"
-      dist: bionic
-      env:
-        - CONFIG="--enable-tools --target-list=aarch64-softmmu,alpha-softmmu,arm-softmmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sh4-softmmu,sparc-softmmu,x86_64-softmmu,xtensa-softmmu"
-        - TEST_CMD="make check-acceptance"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-acceptance"
-      after_script:
-        - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP")]' | xargs cat
-        - du -chs $HOME/avocado/data/cache
-      addons:
-        apt:
-          packages:
-            - python3-pil
-            - python3-pip
-            - python3-numpy
-            - python3-opencv
-            - python3-venv
-            - rpm2cpio
-            - tesseract-ocr
-            - tesseract-ocr-eng
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       addons:
-- 
2.20.1


