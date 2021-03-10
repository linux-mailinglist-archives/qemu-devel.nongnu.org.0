Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E0F3342A6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:12:03 +0100 (CET)
Received: from localhost ([::1]:46892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1RK-0006QI-Pg
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fy-0004Wk-S1
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:18 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fw-0002da-Fc
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:18 -0500
Received: by mail-ej1-x629.google.com with SMTP id mj10so39694607ejb.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BD2BGoLYoCF2ln1sjTH9tzIFeeIkbRtfrQqCp8IPVOg=;
 b=P15qt0l73JI/0NhG9gGZhfbgDc1zUTL7bupzjdiHKj7B5dtZU7Z9ni37Y8rxgp6kfz
 6I0VdkKbUv6YjpZhI+BVFaAWzqwKVuuoWfT4tC6n6QWGvhk98ue7ww6xy7tPy5a5oi3c
 G1CFsYIUHT9JmqUpSolSFuUG2saQ7O8YOlz2m+mW68b69sCTbpyRZ2MRj85pcLooGdhr
 BqE6BoC6DC1u9krtO3hP39WDkyaojLtjrqcEJmm9tdkOsgzVuUsAoNldY/R+Ej02i14i
 hWegO0MBqCGsr9HMRDL/RsT8lIqUDAwM8MylKaA5Qxl9Zy+AaEWzGC/ynkfslFhHY5xP
 GtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BD2BGoLYoCF2ln1sjTH9tzIFeeIkbRtfrQqCp8IPVOg=;
 b=FgfQcM+o5Ya/MsX9i59PHpnRhbG8Pu7KcVpHujxNw9WCNaWwIiXdXX/R2fDpLNjCfA
 J/f18OMMwAqENivGD5e+GYCINZTDgDY8AV9s8a3VKMsrRWKvxKBD7kLlpTO7UXu46Wsy
 OEmxjxIReidN9fNrX6DjlQfYibrjvC8CQwDET2Gkj1a8OLs0zOrOSYqcoXE+0L9n4SfL
 ZcvhPBcOcPrZYfH66PqraE3tr7MpFm6NlC4WcaGMNS2Wet+Cf/NdLiiF7oy76ElNsvb7
 Kzku/6MUNN/eOcnw8sDDibJmgECeVMLKqBtd/VYv/T2BgF48Pq6WAz+YZ+E0HgMS0jDy
 koyA==
X-Gm-Message-State: AOAM530ZOGFsBjoNbF4D1ou0uJ+3WKCJB4eVDuzb1gj56/aTgQDklioS
 wvhmxlQT8ynvl+pnHiYT1c2VlQ==
X-Google-Smtp-Source: ABdhPJwTOhVT9BZSB7WMzyioG1vVujvvq6HUun2wNwS1aK2O2KOPDT0pxcC5gPvisYqhjfp/qV6opg==
X-Received: by 2002:a17:906:9152:: with SMTP id
 y18mr4406277ejw.19.1615392010277; 
 Wed, 10 Mar 2021 08:00:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t15sm11757447edc.34.2021.03.10.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB2081FF90;
 Wed, 10 Mar 2021 16:00:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 04/15] gitlab-ci.yml: Add jobs to test CFI flags
Date: Wed, 10 Mar 2021 15:59:51 +0000
Message-Id: <20210310160002.11659-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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
index 814f51873f..b23364bf3a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -483,6 +483,125 @@ clang-user:
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


