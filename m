Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309CD426B0A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:39:22 +0200 (CEST)
Received: from localhost ([::1]:40866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp9l-0003e7-0f
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYoxA-00039a-RS
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:21 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYox4-00070I-T4
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id o20so29231075wro.3
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCqSveEjhHk9BnAZ8LogSOQHlGWbu7ehSdKzjcVgaFA=;
 b=uDOC6c8BozHYJU21RbDMttFOUa9OwitawpN54hbPkeF2f4iinMZO9HOk0pUEHIXY6i
 WCJZ+rh3jJpocAjmksTaf8uy5WGJ2yoKbpnFgWZmudoZQyKRCjkZ4WOeLWfAz+9B3oJJ
 bt+VOJvIOBcnaqJBcJjsq02QcAhIfvG9HiNZ9mZXnyGVj9LgUzDUpILEMmVGn5iOckeG
 KHuCHkyhlxKKuxUXZAs1UhZ3uIMxKFOHa5ryDIzBPYWvbCu7RlccOGvtD209sd2BigEN
 GUr0HATNPC4d5GucBNmFrhJgB3yg7AKQDwGzsLBv2AUOmDrhL4EtWkEkVCQWPGGDiQ8z
 d98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCqSveEjhHk9BnAZ8LogSOQHlGWbu7ehSdKzjcVgaFA=;
 b=N87EH5NMAEblBsH8su6qsKhE3R2tjdeFEbBOdEnsyIpkGrnZY2Pz2WHQNXNhOVPaGS
 yRF0T8vq4ZoLbAzM0m98K/z0SlY2+/eBzSvO5hxVPdwBP5Av4bBobmuAo8ByCw8R1dkB
 b2u1GHJf7/dYfdiRuhJxquNj6czyXAkQ1nk+AYAWKx5pw7gz1JLnrDd8yekQrg6zDmJq
 dx8sfXYKB4hhgL9uf1HnKGSRaaqpwpb4UEcDIJ6p5FHQ8PccS4b4vsCRjqDAr0p3rXfm
 skcD2TX1cfV2IOGnzupyDHHhkwcdw5R8kBJ1Jj4CjrUIAsgfvfqQYsZRZ7PitVjpEjtV
 ZgXA==
X-Gm-Message-State: AOAM533CzqdZORTVPcVAcsCUAqwZ1s/YkiU8uM60PrmQBrEqm6CBiKKx
 AxRxHMTypaOQmTxEIhCX7yYoWA==
X-Google-Smtp-Source: ABdhPJxw7PtTraWZ2bhfpILPRYbq61c+c7BhOQCJEWJRJVi/S5h5YXbLpB5eCmV99RTb48OCgWSTmQ==
X-Received: by 2002:adf:d1eb:: with SMTP id g11mr3666154wrd.16.1633695973403; 
 Fri, 08 Oct 2021 05:26:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l17sm2272787wrx.24.2021.10.08.05.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0FB551FFA9;
 Fri,  8 Oct 2021 13:25:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 11/12] .github: move repo lockdown to the v2 configuration
Date: Fri,  8 Oct 2021 13:25:55 +0100
Message-Id: <20211008122556.757252-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was getting prompted by GitHub for new permissions but it turns out
per https://github.com/dessant/repo-lockdown/issues/6:

  Repo Lockdown has been rewritten for GitHub Actions, offering new
  features and better control over your automation presets. The legacy
  GitHub App has been deprecated, and the public instance of the app
  has been shut down.

So this is what I've done. As the issues tab is disabled I've removed
the handling for issues from the new version.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20211004154308.2114870-1-alex.bennee@linaro.org>

diff --git a/.github/lockdown.yml b/.github/lockdown.yml
deleted file mode 100644
index d3546bd2bc..0000000000
--- a/.github/lockdown.yml
+++ /dev/null
@@ -1,34 +0,0 @@
-# Configuration for Repo Lockdown - https://github.com/dessant/repo-lockdown
-
-# Close issues and pull requests
-close: true
-
-# Lock issues and pull requests
-lock: true
-
-issues:
-  comment: |
-    Thank you for your interest in the QEMU project.
-
-    This repository is a read-only mirror of the project's repostories hosted
-    at https://gitlab.com/qemu-project/qemu.git.
-    The project does not process issues filed on GitHub.
-
-    The project issues are tracked on GitLab:
-    https://gitlab.com/qemu-project/qemu/-/issues
-
-    QEMU welcomes bug report contributions. You can file new ones on:
-    https://gitlab.com/qemu-project/qemu/-/issues/new
-
-pulls:
-  comment: |
-    Thank you for your interest in the QEMU project.
-
-    This repository is a read-only mirror of the project's repostories hosted
-    on https://gitlab.com/qemu-project/qemu.git.
-    The project does not process merge requests filed on GitHub.
-
-    QEMU welcomes contributions of code (either fixing bugs or adding new
-    functionality). However, we get a lot of patches, and so we have some
-    guidelines about contributing on the project website:
-    https://www.qemu.org/contribute/
diff --git a/.github/workflows/lockdown.yml b/.github/workflows/lockdown.yml
new file mode 100644
index 0000000000..ad8b8f7e30
--- /dev/null
+++ b/.github/workflows/lockdown.yml
@@ -0,0 +1,30 @@
+# Configuration for Repo Lockdown - https://github.com/dessant/repo-lockdown
+
+name: 'Repo Lockdown'
+
+on:
+  pull_request_target:
+    types: opened
+
+permissions:
+  pull-requests: write
+
+jobs:
+  action:
+    runs-on: ubuntu-latest
+    steps:
+      - uses: dessant/repo-lockdown@v2
+        with:
+          pull-comment: |
+            Thank you for your interest in the QEMU project.
+
+            This repository is a read-only mirror of the project's repostories hosted
+            on https://gitlab.com/qemu-project/qemu.git.
+            The project does not process merge requests filed on GitHub.
+
+            QEMU welcomes contributions of code (either fixing bugs or adding new
+            functionality). However, we get a lot of patches, and so we have some
+            guidelines about contributing on the project website:
+            https://www.qemu.org/contribute/
+          lock-pull: true
+          close-pull: true
-- 
2.30.2


