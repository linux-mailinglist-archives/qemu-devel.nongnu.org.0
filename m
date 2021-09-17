Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF6440FE09
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:40:28 +0200 (CEST)
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGuZ-00061S-I4
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeW-0003aG-Jw
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeT-0005Zp-CG
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id q26so16069458wrc.7
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Az4pZ3XvTnpuRBtAzS02EJrfreh1NdaE7t3x5B1fQ0=;
 b=ASCJRR3VwMKORKBhVkpyJO3+oRDRiGm3IF78c3cAVswPd+y/McoUXUMw3i81j0EPUU
 RBx1QqXXem06fczLibDJdFSYq/+YO9YVmX9PLQ7rckeMmPHsjdrLWm7afbhIoYvbkI0L
 ghWK7DySdRe+J8P0RIGVgizGyuomEGnPN2eCOsbCf5GW6Z/Qyu2HO9NjhY6sX1A2rNQt
 Jtrq6dKSZsVIPqjwQGndZymzs43HGsScVsuBMNtXmCK+YDbVMVl9D3aqSec5C6XTX4c0
 a4aGY6hmnN5LdrClqn8oWzUdFkx5y6UFUXnf8y4qcjni4zFfNIuJgyKDSwVrMQCUwtp/
 1KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Az4pZ3XvTnpuRBtAzS02EJrfreh1NdaE7t3x5B1fQ0=;
 b=f+NwCq4GMeB3oAsVjV4GxpKy1yBNdZkf577Yfgi0rGt7NOaLkuceAK9nSMAbf/nZoL
 lG63Z7+44ecMmpu3WqevAvM2+bAc5nV3DS11FAUikpZlZkUe99TkUKCquizp2ElKjFks
 6PY95GNvqcmLqHIvLnlXM73bc6Sb3mj5owvCy7Jtj3biYxS/UCwE/ensqccw6u1tPnbq
 dFq7e7p1a+LBaRFQcrRRMJGsjwhg0P8lg7/zWKUJnlGzPIOcOhJhMg0qcjIdL7m/jvxa
 ScoOtb06JTwkhKCI02h9wRxvLYXHVK7LM2w9YL/oFLazu2F0sCVW2EWHT2QjQLgsaIxo
 hWbA==
X-Gm-Message-State: AOAM533+TETVoGTfAkWeXSeRbbrFMNtgJp6Sm/AjBZdFPvfR0jEdeN9Q
 XnAzgc2HXlDEyehiO6sAZqlEGA==
X-Google-Smtp-Source: ABdhPJy+1mHTrROChaYmLBUS+6cXkXPIo+MfogcvkDrIDpocMbtlpu85Fojz2WXC1HPGmy81N/Rb1Q==
X-Received: by 2002:adf:ed82:: with SMTP id c2mr13208571wro.203.1631895827893; 
 Fri, 17 Sep 2021 09:23:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k4sm7033074wrv.24.2021.09.17.09.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEB7D1FFA5;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/11] gitlab: fix passing of TEST_TARGETS env to cirrus
Date: Fri, 17 Sep 2021 17:23:30 +0100
Message-Id: <20210917162332.3511179-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

A typo meant the substitution would not work, and the placeholder in the
target file didn't even exist.

The result was that tests were never run on the FreeBSD and macOS jobs,
only a basic build.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210915125452.1704899-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus.yml       | 2 +-
 .gitlab-ci.d/cirrus/build.yml | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 675db69622..e7b25e7427 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -35,7 +35,7 @@
           -e "s|[@]PIP3@|$PIP3|g"
           -e "s|[@]PYPI_PKGS@|$PYPI_PKGS|g"
           -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
-          -e "s|[@]TEST_TARGETSS@|$TEST_TARGETSS|g"
+          -e "s|[@]TEST_TARGETS@|$TEST_TARGETS|g"
       <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index 857bdc5536..c555f5d36e 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -13,6 +13,7 @@ env:
   PYTHON: "@PYTHON@"
   MAKE: "@MAKE@"
   CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
+  TEST_TARGETS: "@TEST_TARGETS@"
 
 build_task:
   install_script:
-- 
2.30.2


