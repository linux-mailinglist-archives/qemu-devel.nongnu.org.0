Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D70F318A7B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:29:36 +0100 (CET)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAB6F-0004Nf-Di
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4e-0002je-Dk
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:27:56 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4c-0003o3-Ku
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:27:56 -0500
Received: by mail-wr1-x432.google.com with SMTP id g6so3952097wrs.11
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OfV20wDQiQfC7BsYy4k3NMKtcqz6Zhn9KKxdloWgusA=;
 b=m1rTmN78akKlGogycP+B0aGjC2yJbd0YeF8de/Fia2NPx/bFwyKHv7gRD+I14e3iqd
 Xo1NmWhCnWYTW8sG8Wm00dOIFPhM+CfxEq9vBIF734gCIueG3q4Qb5k5lxnpOxstG6bl
 fGB9sx5rC/i6NwPBNlr2svNTXkZacMNoZDtoXBMbniSKueE6e/S0nN+Z0w7Qdzm0RGwi
 dEC9/q+uZoSyPv5FwpQ8/8yHIJcEss694RsESxZt6KSqJHLhvZ5XYMuCsVtVFQmlJme2
 c3LQ2iNRpK/D8XEB61L2Y4O0kxmMTXhjOwhH0HZJdI5xDyFpVZI3MMFUsLEGyp9LRV2I
 oXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OfV20wDQiQfC7BsYy4k3NMKtcqz6Zhn9KKxdloWgusA=;
 b=W3smDiXSi5nto1HDysU/ytd3CUQpcN1ZJibj6kVCoVtJ9h0/yjYYi4x2Wp+ewJ81EG
 aXBGm4Ph0Kqdz8NFQT7Df3eVT4ecE9Lr+tJK2Kb/Zq05xuBrXOaHPio9PKN9TK0HqUG2
 sfivFI1xe66gLoRmzMHmYP5is4exIy8Hc0reEZVj6x1tnvMBAfHkVeieYz/L6Yk8MbjR
 RtxUI2M+Co5z/0WwL4wMlt697c2leDmJ0CPBLBBb8N5BS/0kWcrw8o3zWVpi6PeBBEe/
 b6Ymb6QXvY8H222u9/tQB+hmyN9p14vp4lD1RS3ZkwqR2l38IkFXSzqnNR32dFXDTlvA
 njaQ==
X-Gm-Message-State: AOAM530DskOCk0+3+w0gc2zkRduRvzsagE0MwH/b/l/DjgQbGMvSvle2
 G+5lIfnz0pjtPNosdZArVIzLgQ==
X-Google-Smtp-Source: ABdhPJx24daMA/rTsoXeUIX+w6CC9wXriYN8acBPCx1qbJESrG9qdbb4lRORB0ijtlemhJ/ms+KwOA==
X-Received: by 2002:a05:6000:242:: with SMTP id
 m2mr553581wrz.422.1613046473215; 
 Thu, 11 Feb 2021 04:27:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a84sm9943176wme.12.2021.02.11.04.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 161D41FF87;
 Thu, 11 Feb 2021 12:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/15] travis.yml: Move gprof/gcov test across to gitlab
Date: Thu, 11 Feb 2021 12:27:36 +0000
Message-Id: <20210211122750.22645-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Similarly to commit 8cdb2cef3f1, move the gprof/gcov test to GitLab.

The coverage-summary.sh script is not Travis-CI specific, make it
generic.

[thuth: Add gcovr and bsdmainutils which are required for the
        coverage-summary.sh script to the ubuntu docker file,
        and use 'check' as test target]

Message-Id: <20201108204535.2319870-10-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211045455.456371-2-thuth@redhat.com>
---
 .gitlab-ci.yml                             | 12 ++++++++++++
 .travis.yml                                | 15 ---------------
 MAINTAINERS                                |  2 +-
 scripts/{travis => ci}/coverage-summary.sh |  2 +-
 tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
 5 files changed, 16 insertions(+), 17 deletions(-)
 rename scripts/{travis => ci}/coverage-summary.sh (92%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 28a83afb91..222858b553 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -467,6 +467,18 @@ check-deprecated:
     MAKE_CHECK_ARGS: check-tcg
   allow_failure: true
 
+# gprof/gcov are GCC features
+gprof-gcov:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-gprof --enable-gcov
+    MAKE_CHECK_ARGS: check
+    TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
+  timeout: 70m
+  after_script:
+    - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
+
 build-oss-fuzz:
   <<: *native_build_job_definition
   variables:
diff --git a/.travis.yml b/.travis.yml
index 5f1dea873e..05fa1ca905 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -52,7 +52,6 @@ addons:
       - ninja-build
       - sparse
       - uuid-dev
-      - gcovr
       # Tests dependencies
       - genisoimage
 
@@ -166,20 +165,6 @@ jobs:
       compiler: clang
 
 
-    # gprof/gcov are GCC features
-    - name: "GCC gprof/gcov"
-      dist: bionic
-      addons:
-        apt:
-          packages:
-            - ninja-build
-      env:
-        - CONFIG="--enable-gprof --enable-gcov --disable-libssh
-                  --target-list=${MAIN_SOFTMMU_TARGETS}"
-      after_success:
-        - ${SRC_DIR}/scripts/travis/coverage-summary.sh
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
diff --git a/MAINTAINERS b/MAINTAINERS
index e6f1eca30f..cc8767d4b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3233,7 +3233,7 @@ R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: .github/lockdown.yml
 F: .travis.yml
-F: scripts/travis/
+F: scripts/ci/
 F: .shippable.yml
 F: tests/docker/
 F: tests/vm/
diff --git a/scripts/travis/coverage-summary.sh b/scripts/ci/coverage-summary.sh
similarity index 92%
rename from scripts/travis/coverage-summary.sh
rename to scripts/ci/coverage-summary.sh
index d7086cf9ca..8d9fb4de40 100755
--- a/scripts/travis/coverage-summary.sh
+++ b/scripts/ci/coverage-summary.sh
@@ -3,7 +3,7 @@
 # Author: Alex Bennée <alex.bennee@linaro.org>
 #
 # Summerise the state of code coverage with gcovr and tweak the output
-# to be more sane on Travis hosts. As we expect to be executed on a
+# to be more sane on CI runner. As we expect to be executed on a
 # throw away CI instance we do spam temp files all over the shop. You
 # most likely don't want to execute this script but just call gcovr
 # directly. See also "make coverage-report"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 8519584d2b..9750016e51 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,8 +1,10 @@
 FROM ubuntu:20.04
 ENV PACKAGES flex bison \
+    bsdmainutils \
     ccache \
     clang-10\
     gcc \
+    gcovr \
     genisoimage \
     gettext \
     git \
-- 
2.20.1


