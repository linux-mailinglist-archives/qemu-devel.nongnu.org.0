Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1A639E5B4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:45:27 +0200 (CEST)
Received: from localhost ([::1]:46768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJJV-0007nJ-S8
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqItg-0002rc-Tr
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:18:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqItb-0007va-RP
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:18:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c5so18463214wrq.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j5k0oIoIWdvhtoUvcL122b402BM5eBr1x6LJEnAcLN0=;
 b=ZUunQuvZwv04DiCOB/yTnGnEHBPWxyoWkBu46/YR2xXFTP6/3FMgTo48bcHoko48d+
 d/GIwsMVznoYc4kXw2/Rsrh13LDHWbZEwyzrK1u8rm7vMUJUTuZIW8bGI24Uq/vidqvJ
 /XXdl7NvMXW+vKY7YS46K6CobddJVfY/lrOhylbB5F99naeIspR+rvlwXzaRE+HBtQYN
 OUg7rbK22igC+nvri4KwuVZd+XfGIb8UM/kczn7TDzjbGOWnv/yVWCwk291VTML2Vit3
 UL730Wuiobm6F7M7qj/UUl6I2BmJlQPPaybs6ixb0IOOiTBUABe14ZXav/AomzlwqV4b
 Dpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j5k0oIoIWdvhtoUvcL122b402BM5eBr1x6LJEnAcLN0=;
 b=RHnk0yd9K9SyHvt4P7WL12fLAPLSoNdSy/QmDR+ZRb19rzQI54Ia5apW8PjMXkIaDQ
 Af1F2vaR+hOPnMf1h54vXWygFyVow/OKDog2SjR9kp/OGkfyap1rw0KbGK9P629qKoEw
 xWlN+dSS+rXqkFiP0tVlHuv7ZrA/90C8kHwoB0OCiyHcQSHOoAeCS5zvxI/iqwN5bt+k
 T462e4rzxaoyQE+/ep3VvkeszIK8mFJtyCNzCLSL4OrUhL+/dKFCD3d9V1/2Kuxv+zH9
 voaGSaOZPGEOLhG95/f+QD/6VTI/3hfpEWtl9pmEyD5RiKyLX56C3f63GhIowDVK5tln
 qoIA==
X-Gm-Message-State: AOAM530pW3neKsTxUmiFY7uMtDTQ8EEsw2PRLU9dJ5FhI/qquA7TnHz5
 PeCh2DtuYFjudpKdM69jCFlljg==
X-Google-Smtp-Source: ABdhPJzbVhC1/2XglW3ZbVnM4kMoMpoyDiPk6vb8sSloQIVu+5qe8CnX18CVS0QTYepPkKnsuZdfKA==
X-Received: by 2002:a5d:6482:: with SMTP id o2mr17719684wri.79.1623086318122; 
 Mon, 07 Jun 2021 10:18:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r4sm16692802wre.84.2021.06.07.10.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:18:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AED61FF7E;
 Mon,  7 Jun 2021 18:18:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] scripts/checkpatch: roll diff tweaking into checkpatch
 itself
Date: Mon,  7 Jun 2021 18:18:29 +0100
Message-Id: <20210607171829.25111-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than relying on external tweaks lets just do it inside
checkpatch's direct commitish handling which is QEMU specific code
anyway.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/static_checks.yml | 3 ---
 .patchew.yml                   | 3 ---
 scripts/checkpatch.pl          | 7 ++++++-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 7e685c6a65..c5fa4fce26 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -4,9 +4,6 @@ check-patch:
   needs:
     job: amd64-centos8-container
   script:
-    - git config --local diff.renamelimit 0
-    - git config --local diff.renames True
-    - git config --local diff.algorithm histogram
     - .gitlab-ci.d/check-patch.py
   variables:
     GIT_DEPTH: 1000
diff --git a/.patchew.yml b/.patchew.yml
index 2638b7f564..1b78262ce5 100644
--- a/.patchew.yml
+++ b/.patchew.yml
@@ -138,9 +138,6 @@ testing:
       script: |
         #!/bin/bash
         git rev-parse base > /dev/null || exit 0
-        git config --local diff.renamelimit 0
-        git config --local diff.renames True
-        git config --local diff.algorithm histogram
         ./scripts/checkpatch.pl --mailback base..
     docker-mingw@fedora:
       enabled: true
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bbcd25ae05..cb8eff233e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -399,7 +399,12 @@ if ($chk_branch) {
 	my $num_patches = @patches;
 	for my $hash (@patches) {
 		my $FILE;
-		open($FILE, '-|', "git", "show", "--patch-with-stat", $hash) ||
+		open($FILE, '-|', "git",
+                     "-c", "diff.renamelimit=0",
+                     "-c", "diff.renames=True",
+                     "-c", "diff.algorithm=histogram",
+                     "show",
+                     "--patch-with-stat", $hash) ||
 			die "$P: git show $hash - $!\n";
 		while (<$FILE>) {
 			chomp;
-- 
2.20.1


