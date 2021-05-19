Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B6389664
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:17:43 +0200 (CEST)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRhO-0008Jm-Hq
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRM9-0007mJ-RU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRM7-0002RO-E1
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id i17so15078033wrq.11
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bjnA+gVSos/4L4pe4X9nECSmvxFmx+T23Lr7fU98jg=;
 b=Limkia0/BmsUroLFZgw7BbPrDVu218wQ0t6iYbO3cW3UNY/vQm4yrcYvL9WeBdeHON
 7VNvYKvO4GByQcMGjxSK3zMtCyVpkJ5rRMa2YgaFulc5jfv35t+BaS5YQ4mrCSNGwSlB
 QJj8wfn1v7ITFjv/JRCjy/hlq51WZgpAAPL3bWs6Z5O+NSS58RnXl4tRneVX99oVPSMM
 w4iqXdW81qPE/A6GhGAceDXjdgwCr+00T1UrYaLeMimvciLP4+9fH/QmBMl1eC4m7C2B
 RxJFmdlLD/tXqb6W6lFEuAZwTF6OGFnL6Ez77zQaH0xyHPUiQ4bgPdTjdMCrqQjc9bcb
 RfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8bjnA+gVSos/4L4pe4X9nECSmvxFmx+T23Lr7fU98jg=;
 b=TRMQuqzAVKB+6Vq1mtfoKgp2atT9V9KWiXwXqjTZZLmcw9JMy8F52BmKSiVVPv9gR3
 XJMAf+yp6aqxU5JOLMzicPNLZngXcy10Kj920Q6FYVTGUsVK/1EbWiU/Is3fcZ/QthHk
 qCGT4lcCneKNWR7ttWqnXprL1qS7ebnDQ0zFon+qDqJKVHPfxgoSrhs5Av1YHmTSwuYz
 pY38ScQ62bhv3EPi0kPpVHrFGd54ih+VgvpiDy0DPP6VJKoUWjRc/18GUHNVH3NtX2d/
 +PGqdmTQSdMUFxjR4K0bvP0jp4gLiYeKAp16FpVhRNPKoYwnM+BubYTg1OeK+g5nirOP
 qh2A==
X-Gm-Message-State: AOAM5311TUd9eeON/4HoE4xiIfu4LPaSu0oIn6JRfF7BVPQayPVs8P9Z
 6QHKZVVXP5CtEqSJhtxJR78Un/JsALqcuA==
X-Google-Smtp-Source: ABdhPJwMQI3+VK6b6vQZtznySd5W6uSsOPzBWA1nDuu9tnp3ZEJ5YjSVnzK1VrB+KvIfFDl1q7FxIw==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr392318wrn.176.1621450541869;
 Wed, 19 May 2021 11:55:41 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u8sm6215180wmq.29.2021.05.19.11.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/10] gitlab-ci: Extract default build/test jobs templates
Date: Wed, 19 May 2021 20:55:01 +0200
Message-Id: <20210519185504.2198573-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to reuse the mainstream build/test jobs templates,
extract them into a new file (buildtest-template.yml).

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 69 ++++++++++++++++++++++++++++
 .gitlab-ci.yml                      | 71 +----------------------------
 2 files changed, 70 insertions(+), 70 deletions(-)
 create mode 100644 .gitlab-ci.d/buildtest-template.yml

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
new file mode 100644
index 00000000000..32aaef1a213
--- /dev/null
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -0,0 +1,69 @@
+.native_build_job_template:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  before_script:
+    - JOBS=$(expr $(nproc) + 1)
+  script:
+    - if test -n "$LD_JOBS";
+      then
+        scripts/git-submodule.sh update meson ;
+      fi
+    - mkdir build
+    - cd build
+    - if test -n "$TARGETS";
+      then
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS --target-list="$TARGETS" ;
+      else
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS ;
+      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - if test -n "$LD_JOBS";
+      then
+        ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
+      fi || exit 1;
+    - make -j"$JOBS"
+    - if test -n "$MAKE_CHECK_ARGS";
+      then
+        make -j"$JOBS" $MAKE_CHECK_ARGS ;
+      fi
+
+.native_test_job_template:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  script:
+    - scripts/git-submodule.sh update
+        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
+    - cd build
+    - find . -type f -exec touch {} +
+    # Avoid recompiling by hiding ninja with NINJA=":"
+    - make NINJA=":" $MAKE_CHECK_ARGS
+
+.integration_test_job_template:
+  extends: .native_test_job_template
+  cache:
+    key: "${CI_JOB_NAME}-cache"
+    paths:
+      - ${CI_PROJECT_DIR}/avocado-cache
+    policy: pull-push
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    when: always
+    expire_in: 2 days
+    paths:
+      - build/tests/results/latest/results.xml
+      - build/tests/results/latest/test-results
+    reports:
+      junit: build/tests/results/latest/results.xml
+  before_script:
+    - mkdir -p ~/.config/avocado
+    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
+    - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
+           >> ~/.config/avocado/avocado.conf
+    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
+           >> ~/.config/avocado/avocado.conf
+    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
+        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
+      fi
+    - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
+  after_script:
+    - cd build
+    - du -chs ${CI_PROJECT_DIR}/avocado-cache
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a348c101f6d..82346debb93 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,78 +4,9 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/buildtest-template.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
 
-.native_build_job_template:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  before_script:
-    - JOBS=$(expr $(nproc) + 1)
-  script:
-    - if test -n "$LD_JOBS";
-      then
-        scripts/git-submodule.sh update meson ;
-      fi
-    - mkdir build
-    - cd build
-    - if test -n "$TARGETS";
-      then
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS --target-list="$TARGETS" ;
-      else
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS ;
-      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
-    - if test -n "$LD_JOBS";
-      then
-        ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
-      fi || exit 1;
-    - make -j"$JOBS"
-    - if test -n "$MAKE_CHECK_ARGS";
-      then
-        make -j"$JOBS" $MAKE_CHECK_ARGS ;
-      fi
-
-.native_test_job_template:
-  stage: test
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  script:
-    - scripts/git-submodule.sh update
-        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
-    - cd build
-    - find . -type f -exec touch {} +
-    # Avoid recompiling by hiding ninja with NINJA=":"
-    - make NINJA=":" $MAKE_CHECK_ARGS
-
-.integration_test_job_template:
-  extends: .native_test_job_template
-  cache:
-    key: "${CI_JOB_NAME}-cache"
-    paths:
-      - ${CI_PROJECT_DIR}/avocado-cache
-    policy: pull-push
-  artifacts:
-    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-    when: always
-    expire_in: 2 days
-    paths:
-      - build/tests/results/latest/results.xml
-      - build/tests/results/latest/test-results
-    reports:
-      junit: build/tests/results/latest/results.xml
-  before_script:
-    - mkdir -p ~/.config/avocado
-    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
-    - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
-           >> ~/.config/avocado/avocado.conf
-    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
-           >> ~/.config/avocado/avocado.conf
-    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
-        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
-      fi
-    - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
-  after_script:
-    - cd build
-    - du -chs ${CI_PROJECT_DIR}/avocado-cache
-
 build-system-alpine:
   extends: .native_build_job_template
   needs:
-- 
2.26.3


