Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE1A3DBACF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:40:13 +0200 (CEST)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9TgK-0008S0-Hu
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m9Ten-0005jv-L9
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 10:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m9Tel-0008Jh-1Q
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 10:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627655914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=El9+xrAfWvuYHlwDBx0KsXaLYgJersb22QeZiEQ8vdI=;
 b=EU05OQepXImu4Hl6u6YW9J9sCZihREcMnmV93k0rBtrAMF9kk0dXkZG7uSNptOEA4iBfBo
 fYwHr1eQsdkSThpuy1nN8D7XDYrxAZ0zo97+eUP1HME8fFxowaV13oeD45aiBB1+JAZ4M7
 4qSahq5MYlFonPdv5PCdTgeqweLRuZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-e4DRHCP5MMOXEqwmz19hhA-1; Fri, 30 Jul 2021 10:38:30 -0400
X-MC-Unique: e4DRHCP5MMOXEqwmz19hhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929B5800471;
 Fri, 30 Jul 2021 14:38:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22DE560C17;
 Fri, 30 Jul 2021 14:38:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and
 document them
Date: Fri, 30 Jul 2021 16:38:09 +0200
Message-Id: <20210730143809.717079-4-thuth@redhat.com>
In-Reply-To: <20210730143809.717079-1-thuth@redhat.com>
References: <20210730143809.717079-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch that recently introduced the S390X_RUNNER_AVAILABLE variable
in custom-runners.yml missed that the bottom half of the file is rather
about aarch64 than s390x. Thus rename the S390X_RUNNER_AVAILABLE to
AARCH64_RUNNER_AVAILABLE in those jobs.

Finally mention both variables in our CI documentation, too.

Fixes: c5dd0f0342 ("Improve rules for the staging branch")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/custom-runners.yml | 12 ++++++------
 docs/devel/ci.rst               | 13 +++++++++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

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
 
-- 
2.27.0


