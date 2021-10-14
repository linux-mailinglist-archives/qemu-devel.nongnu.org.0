Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A24642E463
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:47:15 +0200 (CEST)
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9VK-0005ai-AP
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sw-0002tQ-0p
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9St-0004ME-Lj
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:45 -0400
Received: by mail-pl1-x634.google.com with SMTP id y1so5141175plk.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ckbjJRykTA5MsIBCGHObS6KYVtTnOmvV9h1EyLaQrJ8=;
 b=M4zNHK7PUgK+6wNAImdnQygx1qXMyQpAGaT8pPZvSE6SFkGJ7UQWYPrpKZKw1q1UFv
 xMexGC3wZAAee9xebS8HVS+52PknmTT4Lpwdv7ePQ9BIaekcnny1nxWIbgVO38EDoLuL
 jTsO1iYRE/oZew4qpcgSIR9XUqYJdCGfxz4gAP+67zDl//b0yWaQEO2f1WNJ0yJMw0WG
 yLWWs7E9pSzGTf8DpCY1Tkta6z1TFn4YM9JWuYDUpVIjJ+Q+fZX5ZiBN6h0BmGIMTsoc
 PNKSoa8cQP9CT2JcW20zq+zprFyqXwEltbHrhJLuYh56vh9wUuF9RTJ+pL2xxtR1D7ns
 gcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ckbjJRykTA5MsIBCGHObS6KYVtTnOmvV9h1EyLaQrJ8=;
 b=4fsk+YFUbDp00ZWC0g8bp+PmocVJvEDl2UVMxT3R0TkS9g4hVuo1PS1aMs2ut48CXX
 sNXvrU0fWtm5mOhdReXpfFwDnckpryvGRuVAN2x49Bn/m3cMi9boHU2txRs0DEYhsbUW
 QIRFsd92RlzyXxrr9zzLN+8XD1WpcxYUtZ8mGSIlVAvM6LH9C+Ap//UUTffP9hb7b3fK
 hbM71tU51ojOyaARf9eHBUdsY4CggLULXwhwS0O5RQeqiLYMYH2Wjgh0def1nnXs2z5C
 f+D5wheASCV6SyMbGzwjVGdeF46zQLUKXBUiyhFPUI94VQightedmKZs6LN2TVrmKe/N
 +9vg==
X-Gm-Message-State: AOAM530sK3Lf//rWxhxi4X/s+p8IggpeC2Ie4owp0np5TcK4vkQ1d/is
 NGBuq8MGtBtw4fF4JkFAm8lIxPMl6ul8iw==
X-Google-Smtp-Source: ABdhPJxzhtNH0EC5TYuidcy+thvDpMIAne4jVA/woJplbn8t+smsIxUMpCowv6QSvgaBUwPKuJk0LQ==
X-Received: by 2002:a17:90a:9404:: with SMTP id
 r4mr9194084pjo.240.1634251482254; 
 Thu, 14 Oct 2021 15:44:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm9506208pjs.21.2021.10.14.15.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:44:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] gitlab-ci: Remove special casing for hexagon testing
Date: Thu, 14 Oct 2021 15:44:32 -0700
Message-Id: <20211014224435.2539547-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014224435.2539547-1-richard.henderson@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the hexagon container is using a pre-built
toolchain, we do not need to make the build optional.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/buildtest.yml       |  4 ----
 .gitlab-ci.d/container-cross.yml | 27 +++------------------------
 2 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 5c378e35f9..27b9b6be6b 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -249,14 +249,10 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
-# Because the hexagon cross-compiler takes so long to build we don't rely
-# on the CI system to build it and hence this job has an optional dependency
-# declared. The image is manually uploaded.
 build-user-hexagon:
   extends: .native_build_job_template
   needs:
     job: hexagon-cross-container
-    optional: true
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index a3b5b90552..ed7a849a69 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -47,33 +47,12 @@ armhf-debian-cross-container:
   variables:
     NAME: debian-armhf-cross
 
-# We never want to build hexagon in the CI system and by default we
-# always want to refer to the master registry where it lives.
 hexagon-cross-container:
-  image: docker:stable
-  stage: containers
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: always
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hexagon-cross
-    GIT_DEPTH: 1
-  services:
-    - docker:dind
-  before_script:
-    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
-  script:
-    - echo "TAG:$TAG"
-    - echo "COMMON_TAG:$COMMON_TAG"
-    - docker pull $COMMON_TAG
-    - docker tag $COMMON_TAG $TAG
-    - docker push "$TAG"
-  after_script:
-    - docker logout
 
 hppa-debian-cross-container:
   extends: .container_job_template
-- 
2.25.1


