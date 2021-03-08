Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C4331014
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:55:26 +0100 (CET)
Received: from localhost ([::1]:49842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGM1-00037R-3P
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI3-0006Wr-JH
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:19 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI0-0001DT-QS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id i9so6045464wml.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zvlHmg3Gvm+4PGagR+ylVzZ1n3v00RRhYPBHrbsRAfc=;
 b=Y0iGh15raylKqeIyeBOGp1/t6Jm+5pqSmFk058L31oVV83GImE83V2BYP3/TlAG1Ig
 At+UHfxOsPVfIcpbXA0iq3YthJ2L84FSx5phdsxNvqnGHzZVVsAtY7sqbvcThB2OTpp0
 Le7hkUDK/NwXd7yRszxkGEuWIEnvaUSG3gmmSpsqsiM/KCsZSYNoxkY07FL3T4IS7lWI
 vwSTxMhGkOM6aQiJ2NCLcbvedx717nJeP/uYY0BwtmpNJDYywxK3mfmS+L3K9U7XvTCY
 NMWZC2kpQg/R/O+KbRpV2WFRnql6roqvVILm4xyHxVUchZVRLFx5m9wztys5xSlgNwvH
 CgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zvlHmg3Gvm+4PGagR+ylVzZ1n3v00RRhYPBHrbsRAfc=;
 b=KmciYwjLzg8MouRDZdeS8Izj7pMAPDVfu0B91ZVIW3V5xhHfewpiwsJ5We1H2ydya4
 gRYC7dFGihqQqjdIUouANnLrzCyvhqsb89BBzeRxnOLy6OS/aJ04nI5cdJFMuPfEu2Vw
 J0rOfJ6wTr2tASUUp01oxpWPxXCXGyYd4PQrfGr4opqxDXtpRA5O6hGobrpy+FIX4ApK
 Eo+83oxNNOXAfouARMFK6lWFKJSDRY7cjQ7bLrwdCNnVitHXVUnqoqGcOhP3TpzKhcBf
 eIWuftizlsc++/5KMjk+RQtOn+Wrv0u8KXlJCDgze9ghkphSjRmvuMweX6iLv2wB9sIX
 w6Lg==
X-Gm-Message-State: AOAM533gzQwQ3sHLzIN6fuH0Re8v+LrTxlt6t2z0y7Q06JwMLbe7OAXV
 ZphpMaBRUsye+Aw89ze0/Tj/6Q==
X-Google-Smtp-Source: ABdhPJx5Vntr/Z9/eJo/pl4szopgjnHUTF6KL6ifQHuBqxOxZWSMYJrT8nBbFOsFBkf9vCDKe/05xA==
X-Received: by 2002:a05:600c:d1:: with SMTP id
 u17mr22836010wmm.64.1615211475477; 
 Mon, 08 Mar 2021 05:51:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x6sm19597648wmj.32.2021.03.08.05.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71BBF1FF93;
 Mon,  8 Mar 2021 13:51:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/18] gitlab-ci.yml: Add jobs to test CFI flags
Date: Mon,  8 Mar 2021 13:50:53 +0000
Message-Id: <20210308135104.24903-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

QEMU has had options to enable control-flow integrity features
for a few months now. Add two sets of build/check/acceptance
jobs to ensure the binary produced is working fine.

The three sets allow testing of x86_64 binaries for x86_64, s390x,
ppc64 and aarch64 targets

[AJB: tweak job names to avoid brands]

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210304030948.9367-3-dbuono@linux.vnet.ibm.com>
Message-Id: <20210305092328.31792-9-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1ea944eb91..5625265ef8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -494,6 +494,125 @@ clang-user:
       --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check-unit check-tcg
 
+# Set LD_JOBS=1 because this requires LTO and ld consumes a large amount of memory.
+# On gitlab runners, default value sometimes end up calling 2 lds concurrently and
+# triggers an Out-Of-Memory error
+#
+# Since slirp callbacks are used in QEMU Timers, slirp needs to be compiled together
+# with QEMU and linked as a static library to avoid false positives in CFI checks.
+# This can be accomplished by using -enable-slirp=git, which avoids the use of
+# a system-wide version of the library
+#
+# Split in three sets of build/check/acceptance to limit the execution time of each
+# job
+build-cfi-aarch64:
+  <<: *native_build_job_definition
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    LD_JOBS: 1
+    AR: llvm-ar
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
+      --enable-safe-stack --enable-slirp=git
+    TARGETS: aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-cfi-aarch64:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-aarch64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-cfi-aarch64:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-aarch64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
+build-cfi-ppc64-s390x:
+  <<: *native_build_job_definition
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    LD_JOBS: 1
+    AR: llvm-ar
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
+      --enable-safe-stack --enable-slirp=git
+    TARGETS: ppc64-softmmu s390x-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-cfi-ppc64-s390x:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-ppc64-s390x
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-cfi-ppc64-s390x:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-ppc64-s390x
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
+build-cfi-x86_64:
+  <<: *native_build_job_definition
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    LD_JOBS: 1
+    AR: llvm-ar
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
+      --enable-safe-stack --enable-slirp=git
+    TARGETS: x86_64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-cfi-x86_64:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-x86_64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-cfi-x86_64:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-x86_64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
 tsan-build:
   <<: *native_build_job_definition
   variables:
-- 
2.20.1


