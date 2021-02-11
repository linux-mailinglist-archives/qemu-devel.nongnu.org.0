Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59843318A7C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:29:39 +0100 (CET)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAB6I-0004WR-CQ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4g-0002kf-5T
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:27:58 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4e-0003pF-Ed
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:27:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b3so4000744wrj.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJnQ+vDRiYWzAH5ii1I9lgXMv0YbUk7I6oDAWjuTyE4=;
 b=Skz3IcpK9na6d4nJBiz/9U6mOPaMhG7CqM4t2K+ejgcd9W9c1GmoFB9xBVm2J/kp0G
 iTDg5SS2IkkDENxTV3VkEpyoAJO991Yvc2o7wkRxpQ2CoZxZpxepf8bdyIMiLWURLYZy
 V6/pTQd2EUkAM7XVEXUm+JE74Mm3mQklLiD1VV878oysmWcQWdetsAa26sZKG13P4Bb4
 czZIq8or+GByC40M5eUSyVK6v8txdscLbQNKgQZGN7Ap0KiwhZQ2P9d9d+mtHWYxSfpt
 LRrD1y75h7gtQy0hqNPu2rfzqglYYbTO27Num/onvuI2Q1K9/axvwcsXd12qS5KiIMry
 70dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJnQ+vDRiYWzAH5ii1I9lgXMv0YbUk7I6oDAWjuTyE4=;
 b=LVyy/j51gCyrq/Vba91HFcB7wnOEb/nUei+REh5p9Mh2dJofTsR6dABuOj1B2Wah1i
 BBQfwcu3f+OQCMKS6sfjGJhbsZdkPSmypzlD+gS0vR8V/9rCud1/d9QluAuSZpqSgUti
 zqiN1eU80GChjXMqfIT6n2cRMV05o7ARNjM2efMMTYzwg8DWQN716LYzHqVJdTmC3WRF
 +ccHBA36o3FDVbGa7AjOwHznn8aJgKqntmvtLEVu+O5WGdJSOLpLmAKccogA8HXY/OVB
 r5XjlrlfmMMNtYN/txDHjIcp1OUK1k1TwdE3smO4Mp9aJIvquzNze7EpKk6Bp6MsQiZ6
 k5Dg==
X-Gm-Message-State: AOAM53094JOWdSMbwC7SCAIRNWwRKW8wIb6rQpBYRg7NmlAMJnNKNopg
 G8ZuuzpULNj0TUt6gne1c59q4g==
X-Google-Smtp-Source: ABdhPJzj8bVYAqT2jrwF/3+vrREQndG9iqmCdZ1EH0qz1oRyzq00Px7i3PRpSg+dSTjcocNU5JFnFg==
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr5656415wrs.106.1613046475211; 
 Thu, 11 Feb 2021 04:27:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k205sm10642191wmf.23.2021.02.11.04.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F92B1FF8C;
 Thu, 11 Feb 2021 12:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/15] travis.yml: Move the -fsanitize=undefined test to
 the gitlab-CI
Date: Thu, 11 Feb 2021 12:27:37 +0000
Message-Id: <20210211122750.22645-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

Add it to the existing Clang job and also add a job that covers the
linux-user code with this compiler flag. To make sure that the detected
problems are not simply ignored, let's also use "-fno-sanitize-recover=..."
now instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211045455.456371-3-thuth@redhat.com>
---
 .gitlab-ci.yml | 16 +++++++++++++---
 .travis.yml    | 27 ---------------------------
 2 files changed, 13 insertions(+), 30 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 222858b553..5f3d42221a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -432,14 +432,24 @@ build-some-softmmu-plugins:
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
-build-clang:
+clang-system:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++
+      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
-      ppc-softmmu s390x-softmmu arm-linux-user
-    MAKE_CHECK_ARGS: check
+      ppc-softmmu s390x-softmmu
+    MAKE_CHECK_ARGS: check-qtest check-tcg
+
+clang-user:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
+      --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
+      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
+    MAKE_CHECK_ARGS: check-unit check-tcg
 
 # These targets are on the way out
 build-deprecated:
diff --git a/.travis.yml b/.travis.yml
index 05fa1ca905..533a60c130 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -138,33 +138,6 @@ jobs:
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
-    # Test with Clang for compile portability (Travis uses clang-5.0)
-    - name: "Clang (user)"
-      env:
-        - CONFIG="--disable-system --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
-      compiler: clang
-
-
-    - name: "Clang (main-softmmu)"
-      env:
-        - CONFIG="--target-list=${MAIN_SOFTMMU_TARGETS}
-                  --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-sanitize"
-      compiler: clang
-      before_script:
-        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-fsanitize=undefined -Werror" || { cat config.log meson-logs/meson-log.txt && exit 1; }
-
-
-    - name: "Clang (other-softmmu)"
-      env:
-        - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}
-                  --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
-      compiler: clang
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.20.1


