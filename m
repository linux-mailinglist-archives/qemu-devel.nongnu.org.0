Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E34392207
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:27:18 +0200 (CEST)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm13d-0004Sk-59
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0w1-00037j-W8
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0w0-0008VN-3t
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id r12so2566919wrp.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtpQnhGZkfCRsXEa9SZ4yCe8E1ZJmuR7BJFCDJ8Dfpg=;
 b=sM+KBOMo8i8AaFapkk3uPcTcEQ5+Q+y5y3FOwrF21PX5OjHN6IvUiZGIRQ0o1KqANR
 xQO55637lghJ+YUqsN+ToFI9O/B1wF6fqS0/ghDh1aSHLf9NF+UWfShCqgy02VRisr5m
 gPVHANBM3oIbObDwLexiKw+vHh4rmvVIkQfPVYxHJZhq262u8flZVIU5ZJKGB/lU+mP2
 tKqOeQBJrdsAtBjXX3A8bN5gglXZUFiaq8kZdiqPiGZTT1ccWUkMX4dQLY1PRVi+WGyT
 oaz1P6XXYrmUE5pvMlmKnVhUYbeWywhunLLHXUD3oCpdd9oDgH1NMz65S6SNIERY3E/O
 q2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qtpQnhGZkfCRsXEa9SZ4yCe8E1ZJmuR7BJFCDJ8Dfpg=;
 b=AJG2voYVkU6pyIFCXVM/7u5ze7QALAqST/nHSU3dxzu2YJL//LK2VpgfjZ0XK/ZwKg
 9rqaGl00RU7Xu29UwdJA1ytC9Ub3PMnHd81f1+LgYxjw65R2om4FkCD+enO3edBdBJV+
 dUPcwnwuQ+su/vhARioUpiB5Tro03Tl5Z8q2Yv7ZwaRBIr21UPjBnPAl+65p8DyHZXm3
 1sPBBY6vYsGdxc/mQvuQDiCJ+A/XZbhV+do2M/5arFkXF0tWNbPbI6ymF1fKY6Sas1cu
 b73Q5JtzBa2MVhCYkKoE6E9lZMEBzBUqmB3eU2rmcCcCzwZk1vgjWK7ZUYn/wNkBFsGq
 29ig==
X-Gm-Message-State: AOAM530b12+vPgIIj/XOQzKaO++bLqrESGnQZH3PDRuYl1w5T/XLhkaI
 jghKbhOpAqSlhKVPQZhrJOypYt+t2AyNvA==
X-Google-Smtp-Source: ABdhPJwZ6SeNMe0on1Dv0GfJWh7hmfnXkI77XXiytIFPeUkPLaB71x9cDNbDnWgFZ9HxRxGBDLMzXA==
X-Received: by 2002:a5d:4246:: with SMTP id s6mr3842wrr.9.1622063960017;
 Wed, 26 May 2021 14:19:20 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id p6sm318808wma.4.2021.05.26.14.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/19] gitlab: Extract default build/test jobs templates
Date: Wed, 26 May 2021 23:18:27 +0200
Message-Id: <20210526211838.421716-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to reuse the mainstream build/test jobs templates,
extract them into a new file (buildtest-template.yml).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210519185504.2198573-8-f4bug@amsat.org>
[thuth: Keep the "acceptance_test_job_template" name for now]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 69 ++++++++++++++++++++++++++++
 .gitlab-ci.yml                      | 71 +----------------------------
 2 files changed, 70 insertions(+), 70 deletions(-)
 create mode 100644 .gitlab-ci.d/buildtest-template.yml

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
new file mode 100644
index 00000000000..167ee88c410
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
+.acceptance_test_job_template:
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
index f170065ac63..ccd11e1625a 100644
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
-.acceptance_test_job_template:
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


