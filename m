Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A7318AC9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:35:51 +0100 (CET)
Received: from localhost ([::1]:40928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABCH-0003EJ-4E
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4i-0002qz-U3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4h-0003qh-6C
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id v14so3977658wro.7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LhvdiUgnExmYSuc2t56I/3IBPaK+wI6GsmdLTVz1jsU=;
 b=PHVX1UUG5dj+/F/uJcKga8x13AlKW7g5NIvjlNDgxdHgzBKv5YK2U93oA7l2NNZPBA
 Lj2PVsOiS6wicERznUgFHppHeHhpqpdcjIqAcOW+pHFkIIwOjoiapEUd6eLxMOoC3StE
 8fZcfD8Fhs/4hkmMO0mLFfdJvOA2V0K8zYDdswqKTVhbLTDwT9vDpxmsMN3My+Z5231s
 ymobvSfI/GT/IiumoyzosHzYSJ4QaSZ3Hz7GWU/RquFRTKhloiJ2+m6ZgnMmcrfHcjQ1
 r5WnPSAgp8kNRxXmg9NtrTBFGS39kX/mHlu9V2N0ntdKUqLeKskyoVLGu+db9R03HAU/
 EXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LhvdiUgnExmYSuc2t56I/3IBPaK+wI6GsmdLTVz1jsU=;
 b=s+YD2e8UHhU0u1RxXYJ7Zu1rE9TIE44lstFxc0vlBKo6XyxPoMHsOcfEDfrLX3WkFs
 2U+jWqGpdg3j7VWL1NNPZnbBrTL38ipIdJPfCqtZXO++p3NyJob6Fopu9OBYJCtbYRnH
 tW9XdaV8Hx2Qnwwh5uwYG26d+wLp5fkkf3gcaXjCGl047FiGywm9j8KHZ5E6RR0DTtxR
 brxSl6tLnLTfhnIv2JLNMkpv9CBwQXnuHRp+6xJjTI9ZwFIPYsqF5SFkAgnn4n8qytPT
 jcV79dPNurwr7HKDPOv14VDX4JRV3t/glPqaaNg7plWpq3df+QSqqQMmh+zVhSZWkeqf
 shoA==
X-Gm-Message-State: AOAM5333IYkEfG8XGiJqWfTp82WuMk+7X5k14peBidbJfNLPJnlgNbpU
 tSaAv4nDs3tc9c86i6RDlmUyKA==
X-Google-Smtp-Source: ABdhPJxZQmJpj7Vpffk85CkNnaXWyVT6Q7AUQta+zZzhwMkPar8oBDyLE4M22ay3hnG1XBN44X98ZA==
X-Received: by 2002:a5d:618e:: with SMTP id j14mr3535658wru.377.1613046477939; 
 Thu, 11 Feb 2021 04:27:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm4705978wrx.33.2021.02.11.04.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 637441FF90;
 Thu, 11 Feb 2021 12:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/15] travis.yml: (Re-)move the --enable-debug jobs
Date: Thu, 11 Feb 2021 12:27:39 +0000
Message-Id: <20210211122750.22645-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

We already have similar jobs in the gitlab-CI ("build-some-softmmu" and
"build-user-plugins"), so let's switch one of them to use --enable-debug
instead of --enable-debug-tcg, then we can simply drop these jobs from
the Travis-CI.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211045455.456371-5-thuth@redhat.com>
---
 .gitlab-ci.yml |  2 +-
 .travis.yml    | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index da2fad1249..e878cc0847 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -403,7 +403,7 @@ build-some-softmmu:
   <<: *native_build_job_definition
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --enable-debug-tcg
+    CONFIGURE_ARGS: --disable-tools --enable-debug
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
diff --git a/.travis.yml b/.travis.yml
index 7744ec3a2f..f0e2b1059c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -118,18 +118,6 @@ after_script:
 
 jobs:
   include:
-    # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
-    - name: "GCC debug (main-softmmu)"
-      env:
-        - CONFIG="--enable-debug --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
-
-
-    # TCG debug can be run just on its own and is mostly agnostic to user/softmmu distinctions
-    - name: "GCC debug (user)"
-      env:
-        - CONFIG="--enable-debug-tcg --disable-system"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
 
     # Using newer GCC with sanitizers
-- 
2.20.1


