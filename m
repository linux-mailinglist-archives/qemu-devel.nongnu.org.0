Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE2D32E4BA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:26:06 +0100 (CET)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6ij-0002Ra-69
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gP-00015N-P8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gN-0004KU-8o
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:41 -0500
Received: by mail-wr1-x431.google.com with SMTP id a18so1249566wrc.13
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=72D9Jy5CJJNVD1AtWucx1rIrJFM00v3oHS4BU4E4eAs=;
 b=ZCawgAspMWtMT53fQFPXd4QoSfYht2qf3zxrdJ42eNSwXXGn2gRfoqOInX8Ck0cUwg
 HnWqWDWPeoiWtCCxov1Rc5Py9Xir9GnYx1oxwr/8vNwfQGQWjX2557wTXqxQnjzUfF9K
 uZe+UOsRxqzK10UEGbBiYazE7VcgUbbzTBbQTdBDoXRUaL6qNBlHGnhvOjGhQrtDQMJZ
 f6VeJTeh1lF8AlLnZGzvWrhmt6KcpYVoLe1x72f0i5SKY+dJFzQ2O+RAboECxeoL/WFp
 pbTEVXae5yJRHRfHr2UfG6wWE/RE1aoCuNrZ6WgCzskLmiIu90gfmRKtz1vL7nvs+Ue9
 RcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=72D9Jy5CJJNVD1AtWucx1rIrJFM00v3oHS4BU4E4eAs=;
 b=H442lG2+86JHWmxjKinHH8G0BYjL/gAT8tT/+qzhWO0v81onKg2HTMNF0lAcgO41s0
 yv15RBGaERv11mQ9iIrzMaSyzJBMEjIfvR+8EzBE7nlxs5poxUbv/edkSAVIKHjnnJBs
 EUR1aW832ig15IgxQfozxAJElq6NtWKNjrtS9C+ade173dn+rF86Gva0Ki7nSKTbaO8H
 oDODq+O9AVnVPGh6T2U8VoSPQtnlEh/ON0P+3/oaKPxrkfHROAYMuWG43nPoZVcHNjHd
 rDzQ4i0mRYqf91eSI/neE/kM7BczjNH4AG15k5DAOoSzmUH4JPsf8tcLvj2cW8oyUp2G
 l6jw==
X-Gm-Message-State: AOAM532vGmInyw4ResvX1i0rCmSkQZKZnSag2oVvlnw1QUAc6hUjf2Cq
 SfpiaZ6yS8zq13MPvJ6uXh7ALw==
X-Google-Smtp-Source: ABdhPJxmEsK4ufogOimC75LUSjxDJgSezSBh6NRc0E6jUVeqOP2es32aG76dAYrLFltgM6RWRPzWAg==
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr8200484wrs.160.1614936217860; 
 Fri, 05 Mar 2021 01:23:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v5sm3642019wmh.2.2021.03.05.01.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADD7D1FF96;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 8/9] gitlab-ci.yml: Add jobs to test CFI flags
Date: Fri,  5 Mar 2021 09:23:27 +0000
Message-Id: <20210305092328.31792-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

QEMU has had options to enable control-flow integrity features
for a few months now. Add two sets of build/check/acceptance
jobs to ensure the binary produced is working fine.

The three sets allow testing of x86_64 binaries for x86_64, s390x,
ppc64 and aarch64 targets

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20210304030948.9367-3-dbuono@linux.vnet.ibm.com>
[AJB: tweak job names to avoid brands]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 119 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

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


