Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575B3E2C49
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:13:40 +0200 (CEST)
Received: from localhost ([::1]:58230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0bT-0000hJ-9J
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YL-0004ut-Kq
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YI-0008G2-R0
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id n12so1209763wrr.2
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2YgIsxhH4SyNOO1OygJR5Zoi6AMbZFUCPRnEytRovzU=;
 b=w+fW2D9HKd5T7zjfS9cWuphHOAZL28vGIqnejVDyZMQd7a/lLSbCY0A3O3KcFp3hcQ
 /VwRfYcTCLTx7+ggYTLIKCTAOGoNn6bNQif3sv/9pcIhW7AyAGstpmo6C4bDLiLwON8a
 tfIVIv7GSZ0XzE0Kb6xwHH8vUKevw3fTrPsF3/B+kPAnQgqHuT9W6bknZtPy9Fp/Sw8J
 uj6AB9Omc7ZEL1VsDHKBtfat1Zi0mne1lRwzvbzApR0bW+A+/m/teNlbEME2rfAPRBS5
 cqW+YEAlBiZhOBEkOSsksA/UVZcfx2/KOU+wa32KGy1OudA39HPvIg0ptkRyESGoo6Sp
 8vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2YgIsxhH4SyNOO1OygJR5Zoi6AMbZFUCPRnEytRovzU=;
 b=oIL/IBITCkWqCV+rY5bqWEBiW8/Yf7H/7uLP9S1D6o3leU6EG6Zjd5Iz1PtO7K/S87
 yBV74i8wgm2VAi7VNzJ9vKMC6Y+c0kjGpsqgGGBQlUMwxLmaCxdYdq/rjBMS/Ea3JacE
 EQPslSspUZSoS9oP9qJef1mtLOMxEVEULjIq0PESxaPZ6jK+JW77O0JXZ+pe1XOlB5SI
 WHcIIDjTLAL/fnS43NsHVCjAyoRIaVickY6Jd4+MmATHmkFM0fPWmvrEpMIM50oaESpL
 UoOxZxsXomz3dsKGwSnDjeJXont+rCYPLLXVusRd3WyebkwhUdBbtQmYjsXudMfUTGeD
 MJLA==
X-Gm-Message-State: AOAM530LlyV7oNWupcx0wBUAHqc8bsv+cq6mUOIBPRFn0moiOVvSccWN
 qzruNgBmpSUDmZfQTydBMg3BaQ==
X-Google-Smtp-Source: ABdhPJwtGhX0jccvOa68wjSHXf4gBVbDM7K2NhiLB5H5FZ78aWIIM8tjCC/k7NuqPBy1EjlMRFuiMQ==
X-Received: by 2002:a05:6000:10d:: with SMTP id
 o13mr10867552wrx.88.1628259021414; 
 Fri, 06 Aug 2021 07:10:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g198sm15215710wme.0.2021.08.06.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 07:10:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11B4F1FF9B;
 Fri,  6 Aug 2021 15:10:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/4] gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and
 document them
Date: Fri,  6 Aug 2021 15:10:15 +0100
Message-Id: <20210806141015.2487502-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806141015.2487502-1-alex.bennee@linaro.org>
References: <20210806141015.2487502-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The patch that recently introduced the S390X_RUNNER_AVAILABLE variable
in custom-runners.yml missed that the bottom half of the file is rather
about aarch64 than s390x. Thus rename the S390X_RUNNER_AVAILABLE to
AARCH64_RUNNER_AVAILABLE in those jobs.

Finally mention both variables in our CI documentation, too.

Fixes: c5dd0f0342 ("Improve rules for the staging branch")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210730143809.717079-4-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci.rst               | 13 +++++++++++++
 .gitlab-ci.d/custom-runners.yml | 12 ++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index 205572510c..558327457c 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -48,6 +48,19 @@ these artifacts are not already cached, downloading them make the jobs
 reach the timeout limit). Set this variable to have the tests using the
 Avocado framework run automatically.
 
+AARCH64_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an aarch64 host that can be used as a gitlab-CI
+runner, you can set this variable to enable the tests that require this
+kind of host. The runner should be tagged with "aarch64".
+
+S390X_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an IBM Z host that can be used as a gitlab-CI
+runner, you can set this variable to enable the tests that require this
+kind of host. The runner should be tagged with "s390x".
+
+
 Jobs on Custom Runners
 ======================
 
diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 564b94565d..0d3e4a7b4b 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -137,7 +137,7 @@ ubuntu-20.04-aarch64-all-linux-static:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
@@ -157,7 +157,7 @@ ubuntu-20.04-aarch64-all:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -174,7 +174,7 @@ ubuntu-20.04-aarch64-alldbg:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -193,7 +193,7 @@ ubuntu-20.04-aarch64-clang:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
@@ -211,7 +211,7 @@ ubuntu-20.04-aarch64-tci:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -228,7 +228,7 @@ ubuntu-20.04-aarch64-notcg:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
-- 
2.30.2


