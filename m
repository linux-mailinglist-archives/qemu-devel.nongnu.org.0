Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB823B181F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:31:55 +0200 (CEST)
Received: from localhost ([::1]:47736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0Ak-0007kM-Rv
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw078-0001Jd-8w
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw076-0001ei-GV
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso1010677wmj.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XrMPkRbo2jtICIAp07uTFXIrIqcIVRJ0wae31z4THq8=;
 b=pNm4gpfvDFLdJoOaQdwsoXNvfG+3Qiz+AoKRG9sfTxDakrA9hr7keL5V+5HaUk/R/5
 +YQ2MbR08H8QEGjh++2Q3hONZPv20Uz4rBl9kTqp36/w4iSYc+3kMDj02POZVGtAxZvx
 O5w0Ld9Wg7gYQkqVQEJ3ZSAcEgbZp90cVg9MIf8q6YBXgV61QP7dP/8DGPnMQumXTGQF
 k9ELKJLR1DD868Aa4Wfbfgox2EkpprVDv8+hRPunV8iFbsCozDzn36SPw8CRiYgVgDSF
 zuEHqBofkmNnk5GUZbybN5ULCYSAVxmNmVPM/6wvWxxR0mjUKNEhd5G/eqVDh0Orsnl4
 ixww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XrMPkRbo2jtICIAp07uTFXIrIqcIVRJ0wae31z4THq8=;
 b=QJBNUrk0LMDv89MvXzZTMFKmh6HBrobU/mnx4ahGTcxcY6bK80qXdi+bCOYY5kz/la
 tlhJ2zCUylwfFHK6K3eBrqU9k+iKTuC6olRnksqqF7FD8EKGjPTIMWsOggXv3rpbWY7b
 F/vxXux64D5hekxV1cJRAx0f8NL7xvVgeilzInHCXCvDU/JPuJ4GIzfuF25132hJYQdd
 S5Xp17drKPj6caUGEhUEKl+55K7vIo0agHjG7TtE4Wj/KnT0RsqPmSLyPw/5Nb7SU7Gb
 1de8QWbIm9xysFEhdg/HK6joxO9N4lSHhiZRF+716SkmPsGWyZCGI7Zl8ws+y5HQLjhQ
 DdCw==
X-Gm-Message-State: AOAM531rruUnxkWmGa4QKei7DHdzoQV/HxyS4TjA8O48lA1bd6otYJFU
 0z8/LonA8kAUWyS2lPRWfEcKpg==
X-Google-Smtp-Source: ABdhPJxmfFPNw3LdyAOABlAvSEK2SvNAogw4FeSfq1zEH0UtAV6Xnl7DNapT4IOBdHT2j3y6VnAcxQ==
X-Received: by 2002:a1c:a943:: with SMTP id s64mr9841253wme.10.1624444085538; 
 Wed, 23 Jun 2021 03:28:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm2413325wrv.82.2021.06.23.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:27:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB3AE1FF8F;
 Wed, 23 Jun 2021 11:27:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/8] scripts/checkpatch: roll diff tweaking into checkpatch
 itself
Date: Wed, 23 Jun 2021 11:27:44 +0100
Message-Id: <20210623102749.25686-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623102749.25686-1-alex.bennee@linaro.org>
References: <20210623102749.25686-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210607171829.25111-1-alex.bennee@linaro.org>
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


