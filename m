Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A231B69A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:45:17 +0100 (CET)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaRQ-0001dQ-Kn
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP8-0008P1-KJ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:54 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP5-0004LW-2d
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v14so8063257wro.7
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xcJX71cSYzlYbLeL0G+5Qp0GwFi/0FYEyERRdFlx7is=;
 b=cYTunfgYodr8o0V84ylgh0efmmiEjBNJCEUcdiOdozZw16Up6GWJcbeIkKTtpmo5Qy
 PA1VTp+50UFdoLd6tRTwQAWTBHaTIgxDsTVhAKFRveUfZ8XhrRmVm0DPsUWEG7bhuzGt
 C5iSPv4Kf7aI6nLUgP01trXATw4TbCagwjoAwY9dHrMZvh+L3/59mjuPzJAIQS99MEBX
 qFgptEjs/ACrCCzlbhJ5JsKGnkZr9dww/8TKBrvVb2Vt8QH4WZsWx7xSngXe7nxnjiou
 ZsubXFOqjj0BQSe7I/pIN0G5RbSoBRegVQNTL90L/BfULaGPZ+gfoExiYg8RVJMN0USl
 QPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcJX71cSYzlYbLeL0G+5Qp0GwFi/0FYEyERRdFlx7is=;
 b=DKv6NbuzRRzJBpssj67hIlvQ5DCS4iQwWUEZTpK12AB7yp6WbGLrpchoWYoEJ47iYn
 lt+kpPZrk52NZhlW57cwWhtow5Z8bW+S5ZcCClJqG0F/ANk2jbwX2c19QHpGaMlgZAiN
 B4d43pRQ4KCfkHBN/nsBTmovvQGYhYBhrhIRVFF0mxQ0rioUkfUJbWomOfG+hw03iaFP
 VotGw0hmmUc3EVqbJY77XKkqgIiIFGPaA81RTsogGAOGrkNE5h/+MlpsPgh/SK4edBEr
 X10hsK4r29WTAXv2wJdnKdzukftlflgso4Eev0TRhr9C54p47tOqd7fn/5X5cQ/Fwzu/
 3ZeQ==
X-Gm-Message-State: AOAM530JmDz05SJht9DFxGCaq4v/985aQZN0waDn7ll65qTGgOMTBPsA
 iUkPOavEgfsuKiuBYB6730l8ng==
X-Google-Smtp-Source: ABdhPJyEvpCpxy3FoRjUhX9e+tUuKRIZ/InQ7hH7GaaY5UX7oauUGNC9kTvdKWhF1MX94wUN95b+8A==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr17717514wrx.47.1613382169731; 
 Mon, 15 Feb 2021 01:42:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k11sm22415450wrv.51.2021.02.15.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26CDD1FF8C;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/15] travis.yml: Move the -fsanitize=undefined test to the
 gitlab-CI
Date: Mon, 15 Feb 2021 09:42:31 +0000
Message-Id: <20210215094244.12716-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
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

Add it to the existing Clang job and also add a job that covers the
linux-user code with this compiler flag. To make sure that the detected
problems are not simply ignored, let's also use "-fno-sanitize-recover=..."
now instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211045455.456371-3-thuth@redhat.com>
Message-Id: <20210211122750.22645-3-alex.bennee@linaro.org>

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


