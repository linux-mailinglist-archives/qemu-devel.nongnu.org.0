Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D961F31B6A7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:48:27 +0100 (CET)
Received: from localhost ([::1]:33316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaUU-00050l-QQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP6-0008NQ-OV
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:52 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP3-0004K6-3o
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:52 -0500
Received: by mail-wr1-x430.google.com with SMTP id n4so5099188wrx.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQ/6RDk+ec6tSQpdU82wiTpV0wKowPCQXjSChMlKrbs=;
 b=W3nbuC/Bn5iTIbHImpYtkTiWfeKWFT5sVRxKN083pPSVaeKX1JlyeZHvxTOjP+5TZZ
 twNDP6bEhMlH8E3Krs5994X/75XmV3EXRb0h+wodKO+FyNq+swXqvDepU8oYVduPpwMf
 kv7Kph+qWW65BYRlkzp0SFXe3+/EICCocKr0ZykU4nGj1wtN6ljD36qc7a9SVHftZuPt
 RSt88+/TCecgUPeWeLnMcbsfeFH75PDYJWoyg5eZT5bony3CtlwyjTBPrK3N4xCDd2ZQ
 6GcLLSU5E1DqNfvOWa+Z+2b56XSpfuUc1xx6rPVUdstfonyAEGH5s5ctUqPzoYZbqrbX
 TuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQ/6RDk+ec6tSQpdU82wiTpV0wKowPCQXjSChMlKrbs=;
 b=ctQTt6BAF+hKmF07AVbiCMv/oIIorlhBMluh+BKLfagi5LwSlq6u7Uf9q2FapHnGTH
 Xi3+2h5G9NoY7jZnKzR1jeJmkQESSxXG1heouozIQSgfr6RvE5CE9w4GRguq6rFI2Kza
 zR6DhSJmb7eRmXb7WRwaeH5EJ30DqwAMIUaYwhU+08gUe+2zTp58vqX09E1ks8E8Vdyw
 XHbMUduJ5TGe1PhjctTRPYHrLuUjRX1QYeCCDaLz8+ggyiXdJVFCt/tT0HVEqbkTKjH7
 dRPnCsEfr9U8hySYPwTpdY2jcwl3MqJXwXLf5NnrgtsQsp91y2adOXSHkK3UcvaMYcMM
 imiQ==
X-Gm-Message-State: AOAM533Dya7qqvwmkv7DE/lMi1wua4753R4EpyQG35YHXlWbKSL1pIOE
 /n0MvGEGFh83fCU5YzTzEgL2YQ==
X-Google-Smtp-Source: ABdhPJycJxa0SMW+1YuyfufUbWSMwwjX8IbWNOePKrRiPQz9oC7pradXiUNgxzIWxTss9UWfgQNbtw==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr17854598wrn.197.1613382167579; 
 Mon, 15 Feb 2021 01:42:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v17sm17710588wru.85.2021.02.15.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E7051FF87;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/15] travis.yml: Move gprof/gcov test across to gitlab
Date: Mon, 15 Feb 2021 09:42:30 +0000
Message-Id: <20210215094244.12716-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Similarly to commit 8cdb2cef3f1, move the gprof/gcov test to GitLab.

The coverage-summary.sh script is not Travis-CI specific, make it
generic.

[thuth: Add gcovr and bsdmainutils which are required for the
        coverage-summary.sh script to the ubuntu docker file,
        and use 'check' as test target]

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201108204535.2319870-10-philmd@redhat.com>
Message-Id: <20210211045455.456371-2-thuth@redhat.com>
Message-Id: <20210211122750.22645-2-alex.bennee@linaro.org>

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
index de5fe1c65f..7f0781b7cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3235,7 +3235,7 @@ R: Philippe Mathieu-Daudé <philmd@redhat.com>
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


