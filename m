Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3C2D6628
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:17:04 +0100 (CET)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRR1-00033r-5O
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRFX-0005zA-EG
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:05:12 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRFU-0003d9-Md
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:05:11 -0500
Received: by mail-wr1-x435.google.com with SMTP id m5so6600094wrx.9
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGyJhuUq9nJhWmxBmUt1APOSMihuq+Wu//XDALmnB3Q=;
 b=w0EIe7fqnEznjb6OmpSemXMtFo08uUOFWrrJvmpNOvX3EZcuVV7XoymVmnFLQMCY7I
 ENRlL1sw5t3SZ3QKD3retbzNI2U19mlmUtaSOoyMoyKgTuc3NP1Nodh8utoFXMfcEbow
 GyTLfn3T53EOqtqEm4nI/4bvOkitbxzbxSDNV4Xh81Hffpkfxehqw34Mm8wxrQ9hTKME
 1bLIEo7TvVKlZf+o1BwT8CJUeUS1F0Jba9f2Xj5b2Nuckg4h9ivBGg7I4zQmk9WbDExX
 DoufT/fvdHyo//XukShjrEJT9H1x+aYkrvkjEOIp0nmaKTLrtlRfM4ybh0Y+E1mcG8tV
 vUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wGyJhuUq9nJhWmxBmUt1APOSMihuq+Wu//XDALmnB3Q=;
 b=ZmzGtAL0cPycLAmnCf4puoSmVyZxE/9fgWOEWoQneOVAldnvRQ6doDHLSGAPlrjT8g
 9MB8AviWU/7cF+0L7V8eZnPSaPFbSllwD3cRq7JAc5XnuiOSyAY/GM9oT69qXrs2hfFK
 nHOnXQ2VNX/RrSpZuNB1vmqKTBvgXxrxok0mwwntjbrUT2hb5NgyPGdnPEYKf2qZhFML
 mRsa7uH2BX3Dhijku/Y43+cK9bCiWMt+FwvDBh43f27u0JWzDPvCXRj6/zwE+hx5PXQN
 ksD9fwq/LY2E3gEhyrjitRb/N9ejwgY9IaJjeKtn5iXX/j2BbKWDPofsX4BInELI+cKo
 eQmA==
X-Gm-Message-State: AOAM533vMKMQin08NwoYaxABd70rvyjZp0k3vDqsDde0nlHii2gI14O/
 anKm2Uzrxv9YHxeE1+avCQdaLQ==
X-Google-Smtp-Source: ABdhPJzzjyWrAb3rI/BbNUfOXH7j2y5kkKh/5ZqWIXpG7BsXhPq2qHN/6aqLwq2/WTMmaD/gWahF6g==
X-Received: by 2002:a5d:6a4f:: with SMTP id t15mr9479864wrw.62.1607627107346; 
 Thu, 10 Dec 2020 11:05:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a144sm10590694wmd.47.2020.12.10.11.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:04:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8142E1FF92;
 Thu, 10 Dec 2020 19:04:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] gitlab: move --without-default-devices build from
 Travis
Date: Thu, 10 Dec 2020 19:04:15 +0000
Message-Id: <20201210190417.31673-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210190417.31673-1-alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
 stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - move to centos8
---
 .gitlab-ci.yml | 7 +++++++
 .travis.yml    | 8 --------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b3bcaacf7b..2134453717 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -514,6 +514,13 @@ build-trace-ust-system:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
 
+# Check our reduced build configurations
+build-without-default-devices:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos8
+    CONFIGURE_ARGS: --without-default-devices --disable-user
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
diff --git a/.travis.yml b/.travis.yml
index d01714a5ae..f2a101936c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -205,14 +205,6 @@ jobs:
         - ${SRC_DIR}/scripts/travis/coverage-summary.sh
 
 
-    # We manually include builds which we disable "make check" for
-    - name: "GCC without-default-devices (softmmu)"
-      env:
-        - CONFIG="--without-default-devices --disable-user"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-        - TEST_CMD=""
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.20.1


