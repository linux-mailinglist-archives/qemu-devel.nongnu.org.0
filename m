Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95539DEED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:37:03 +0200 (CEST)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGNC-0002wb-Dx
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJa-0003CX-HT
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJX-0000OM-RW
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id l2so17917694wrw.6
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=En+VgcZCJTCFePloXJZOXFco80DAUV/fbZwnSy9v9hM=;
 b=d3DTT4JYzRL1LbjsEkjmAUldPJ2cuguWDymm26TGSUMKb/AOsd6hIomGGpbyFoJT61
 kP3Ko7IeeRWtOscXQSl1eBAfmRfSq21vPbX0dxJlZt/UBrCLuZFJzvOeGcys7EyQGjH3
 aKpnLPHd5ejVks7+KuXR1Lo+uD9I+vAF4xGU6LKYGWKZByI4M5/+nWpyzuuZ4iNLcGkm
 H1ziuRpw/G1ztom4DpnsGUXqwruL+FtR9pswmppZsO9kqQlFfLlbbesxVh7KOKcaLbpU
 9XWo5zuGXDBF6D/6ijtJaL+m1zk21tzYEtWKnBtqvHkjDyGyj5zsDydA4TkrMEiVKrL4
 MWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=En+VgcZCJTCFePloXJZOXFco80DAUV/fbZwnSy9v9hM=;
 b=iAlXg5fZD7BiS+aQD2Vd7lf5JPQSpJGYYRmcjx/EnQhok3AOLC0XvOLFU6dqJ2Z2uI
 0dJk0d+P9EIwojPpopzI7r+tFtvhDGJPxtBAupFHgQ3djqdtF1cJBlW+zwYpoPnDIfmb
 9ukazkrLqE6EFvM28T/uGOGikwbmFBNDavlLzVhqwI4nL5wD3Jct4CPzRbUDIKtO9cc9
 YV8yEWkDIi7CTQiBYDcmn4lALJ8rAHaHlhD4FQ2M4ny5+zI5Nyjlbb4vxWWL98IuZbyk
 UvAuWApiHy99TASsyaDNR0up7TUPA8pE5131lJw7lwKvie9x/X+mL2pYvclIRZxSa0C2
 YLMg==
X-Gm-Message-State: AOAM532f6TVqIvvJs8f1oUIZIFT8UNJG6KFiixqWvbR3gVp6D0CcYsgC
 VFdvsoi1MzA8KtUJ7RecdI3Hxw==
X-Google-Smtp-Source: ABdhPJxb5R+ZVdOx9puak7CKo7Vil8eA1DZe8vtMhZ+rR2Sdv0x/HDH3qpy8QKpbkB1vprCy+RDSXA==
X-Received: by 2002:adf:f5c9:: with SMTP id k9mr16793010wrp.180.1623076394487; 
 Mon, 07 Jun 2021 07:33:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a4sm14917064wme.45.2021.06.07.07.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21F871FF92;
 Mon,  7 Jun 2021 15:33:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 6/8] gitlab-ci: Split gprof-gcov job
Date: Mon,  7 Jun 2021 15:33:01 +0100
Message-Id: <20210607143303.28572-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This job is hitting the 70min limit, so split it in 2 tasks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210525082556.4011380-7-f4bug@amsat.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index b72c57e4df..d9b834c848 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -558,16 +558,27 @@ check-deprecated:
   allow_failure: true
 
 # gprof/gcov are GCC features
-gprof-gcov:
+build-gprof-gcov:
   extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-gprof --enable-gcov
-    MAKE_CHECK_ARGS: check
     TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
-  timeout: 70m
+  artifacts:
+    expire_in: 1 days
+    paths:
+      - build
+
+check-gprof-gcov:
+  extends: .native_test_job_template
+  needs:
+    - job: build-gprof-gcov
+      artifacts: true
+  variables:
+    IMAGE: ubuntu2004
+    MAKE_CHECK_ARGS: check
   after_script:
     - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
 
-- 
2.20.1


