Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4FC28109D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 12:33:48 +0200 (CEST)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOINn-0003kz-63
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 06:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kOIMZ-0003IC-3Y
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 06:32:31 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kOIMW-0000Hx-DR
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 06:32:30 -0400
Received: by mail-wm1-x341.google.com with SMTP id w2so1135414wmi.1
 for <qemu-devel@nongnu.org>; Fri, 02 Oct 2020 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SjTBlRRC5dzBrQAGy139YYIuxmAQhfYfFMHZmhkZzw4=;
 b=SDr2Md+arG/wQkaOW3ZH0oPwt7M3hfmU/ZwmdCpGNI33LPx5gaaECSicKmj5e/GnYM
 PD2Y2mrxNO8juxa9UeLtqfblAI5y4YrGoQQJYbxBMpfFkm2LBwbJ7vrxc75xxw6pCSHZ
 wgyEqlONfUrIUec/tcg96exGKtUNWKKIFOxd9Mi4eoH3Cl1APxt1CYMw2C1sofLCm8o6
 X9SG1bfhGi98qTwxTnTuSfyhZYeRloL+URLQ60kBl8A3riisRfw2/S6cWyj25mW7VFXT
 rA6aNNzQFkv/gYf2/0iyDVm47wjNFxDnCPSoqjlzFPHLeAgNW/cVnDI6x+s2ZxYpK1Bh
 kHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SjTBlRRC5dzBrQAGy139YYIuxmAQhfYfFMHZmhkZzw4=;
 b=pNuP1ek5RFTzz06jARCci6b5+NLiklChT0dE2ifqz6Am3UtCYBh5VbeCmoGk189x/V
 VzgduW58UaDSYincBoTau3Xf7BNbo7BUr8srxW4p4/jqVDn6P1Sy/3ssldS4YNU5DPK3
 r2DNAiLh5JMgXTwT+qkLfNO1t//ed8cSRrjOpya2ggD+eNi4jtaImY7cG4kM9WpDi0Y5
 287P0vwDbdyYBBPz27MDUVsCwSf63a9UuqFiElGv/zciKzSk6uBjPYKWiGGn/eR7gtny
 Zog65guDK8BkeKg38AC/S5KjT9imxHbiXnCNtgYJNOSBlh6N1RkP/H+NXE3QuFD/ruTm
 qDpw==
X-Gm-Message-State: AOAM530wU4IJR9QZGWMW9mcwSb+SNWMHoBLchOgUBezgo4diPXd0rM9z
 85p6QbdwGxfMqKJvzH6/TE8pZg==
X-Google-Smtp-Source: ABdhPJw0OiWOwerIOAN1QhCMSrwseBaLpioK63VFCLXl+c+hmB01SG+obesIZJsL1gFR71iQOLm7ZA==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr2057373wmj.166.1601634746965; 
 Fri, 02 Oct 2020 03:32:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j206sm1257716wmj.5.2020.10.02.03.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 03:32:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C2051FF7E;
 Fri,  2 Oct 2020 11:32:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] gitlab: move linux-user plugins test across to gitlab
Date: Fri,  2 Oct 2020 11:32:23 +0100
Message-Id: <20201002103223.24022-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even with the recent split moving beefier plugins into contrib and
dropping them from the check-tcg tests we are still hitting time
limits. This possibly points to a slow down of --debug-tcg but seeing
as we are migrating stuff to gitlab we might as well move there and
bump the timeout.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use timeout instead of split build
---
 .gitlab-ci.yml | 11 +++++++++++
 .travis.yml    | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c265e7f8ab..346f23acf7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -244,6 +244,17 @@ build-user:
     CONFIGURE_ARGS: --disable-tools --disable-system
     MAKE_CHECK_ARGS: check-tcg
 
+# Run check-tcg against linux-user (with plugins)
+# we skip sparc64-linux-user until it has been fixed somewhat
+# we skip cris-linux-user as it doesn't use the common run loop
+build-user-plugins:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
+    MAKE_CHECK_ARGS: check-tcg
+  timeout: 1h 30m
+
 build-clang:
   <<: *native_build_job_definition
   variables:
diff --git a/.travis.yml b/.travis.yml
index c255c331a7..519e62432d 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -311,17 +311,6 @@ jobs:
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
 
-    # Run check-tcg against linux-user (with plugins)
-    # we skip sparc64-linux-user until it has been fixed somewhat
-    # we skip cris-linux-user as it doesn't use the common run loop
-    - name: "GCC plugins check-tcg (user)"
-      env:
-        - CONFIG="--disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user"
-        - TEST_BUILD_CMD="make build-tcg"
-        - TEST_CMD="make check-tcg"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
-
-
     # Run check-tcg against softmmu targets
     - name: "GCC check-tcg (some-softmmu)"
       env:
-- 
2.20.1


