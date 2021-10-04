Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA694212EE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:44:35 +0200 (CEST)
Received: from localhost ([::1]:49260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXQ8n-0006uJ-Py
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXQ7d-00069E-EA
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:43:21 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXQ7b-0006pn-Br
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:43:21 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v25so20846021wra.2
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FxcFivdb7ldKb1vbf9bOgm40w2gpba3W+6g6SxQS9Cw=;
 b=KVZpStamR2MZFLrqcHzs4yUU72WtftB1IuqIzuKQbc4E/uR3M6Q9oR7fX+0k7c8oik
 G0ofHXLXoNNXimf9p7FycWeMUAgqwHWRZnneqUZJu45sCa3lxlCKMZ14X+VmwQ3bbcWV
 5rn/hdtGPqzpLTkAzgV9wrNA2CdW9RhCTpTvLJgzlR3h/4BFaGT3ciXk/WZhPMfa0qW+
 cZJtKMtNbz7B1MXlqobxAlQz++9m8jsEW+GPAPuzVN8Yfj+VEGOuJJvW9DzqeI+zed3V
 9irV1bWa0wVjiMeLXyA/OUo6FQGEonZIuuOqOwhJ/N/hnU2f6mj3jcx82BsKaYzPqrfk
 UCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FxcFivdb7ldKb1vbf9bOgm40w2gpba3W+6g6SxQS9Cw=;
 b=3fpdCW1sVY1z1jaYbpnGJOXI+RDKFHfe25C4j+R2Nhy/lIQlxbAJ53XFmTxpLrLtDM
 ikMsyJNxR3TUhF+UZrcvkHdsECxMRQ2SAn8T+U2qci/MHO1C7VnqsjziSCEYkddPixi8
 kdmF0yYgAwOeLtMODku+8e1tzGz6Az8Z+LV5zbGjQlbIdQ6ZOsXIWz9ACW9ZzFP0buiB
 A+YGcLOTrORwERwObvNTjKQm38q06Udiia4DbXKO1eBzhV8fYj8cio3YOWLN45JrA+zf
 ar++WEPLpc3mR11tKSydro2eIq0VBcbtZVYbV+dZZz4hI9VmgkmboHudSQU2iAa6+ALd
 Wpjw==
X-Gm-Message-State: AOAM531T/rNu7H65eyK5qLEbqMS+Xgs5Z/Mv2+whe06IC7LUtVGDTIbc
 iZNp+hxLW/GkraVqk5jiToVCcg==
X-Google-Smtp-Source: ABdhPJwqg+38nJYroCleWXRoSgIq50CZiVQ3sqNIrCl8BGipCzAy4Y4EsD2HF5/8tmzyg8C0d8iGNA==
X-Received: by 2002:a05:6000:162f:: with SMTP id
 v15mr15441265wrb.118.1633362197536; 
 Mon, 04 Oct 2021 08:43:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y5sm11896508wma.5.2021.10.04.08.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 08:43:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B65CD1FF96;
 Mon,  4 Oct 2021 16:43:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] .github: move repo lockdown to the v2 configuration
Date: Mon,  4 Oct 2021 16:43:08 +0100
Message-Id: <20211004154308.2114870-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was getting prompted by GitHub for new permissions but it turns out
per https://github.com/dessant/repo-lockdown/issues/6:

  Repo Lockdown has been rewritten for GitHub Actions, offering new
  features and better control over your automation presets. The legacy
  GitHub App has been deprecated, and the public instance of the app
  has been shut down.

So this is what I've done.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .github/lockdown.yml           | 34 ------------------------
 .github/workflows/lockdown.yml | 47 ++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 34 deletions(-)
 delete mode 100644 .github/lockdown.yml
 create mode 100644 .github/workflows/lockdown.yml

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
index 0000000000..20e6208487
--- /dev/null
+++ b/.github/workflows/lockdown.yml
@@ -0,0 +1,47 @@
+# Configuration for Repo Lockdown - https://github.com/dessant/repo-lockdown
+
+name: 'Repo Lockdown'
+
+on:
+  issues:
+    types: opened
+  pull_request_target:
+    types: opened
+
+permissions:
+  issues: write
+  pull-requests: write
+
+jobs:
+  action:
+    runs-on: ubuntu-latest
+    steps:
+      - uses: dessant/repo-lockdown@v2
+        with:
+          issue-comment: |
+            Thank you for your interest in the QEMU project.
+
+            This repository is a read-only mirror of the project's repostories hosted
+            at https://gitlab.com/qemu-project/qemu.git.
+            The project does not process issues filed on GitHub.
+
+            The project issues are tracked on GitLab:
+            https://gitlab.com/qemu-project/qemu/-/issues
+
+            QEMU welcomes bug report contributions. You can file new ones on:
+            https://gitlab.com/qemu-project/qemu/-/issues/new
+          lock-issue: true
+          close-issue: true
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


