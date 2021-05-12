Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1733937B58D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:42:30 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghdd-0000jW-6B
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghZA-00026v-KC
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghZ8-0006mF-V2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 p14-20020a05600c358eb029015c01f207d7so2358507wmq.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2VdBYXj2r7JhlOGwI/fnubAf5eKc/fp9EiRl43x/fg=;
 b=BfLJF1J9odSFulzQ18Eya8AAMw55QCfCn61Mk8I/mSvubKG+A57FjfOD+SxUIThvJ7
 qsCChxcMZIbSyYpejncRkMT97dibdJJ2WHzS5j3iF6uKiFZ7z0RNMMiC3ki8EfF2csgq
 1wuAX+9YwcDMsYRWRfvfdiKH6hxu87Kj4RSyKK8w84n1MyqfF8wwFI26ay+ZUNIzUpJn
 gZkghppihav696JSYb70IYWcWs1ly49m1tcSWkBRQidCBQGUX1kZD+Sg3bLSjqqMKP5g
 6oKmmdQsx6MkdOhuthmx5QgXdcnouXoMtQFIjONiRpBCcKbzTSOTWkoW9pWj4Hir3+Aj
 97Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h2VdBYXj2r7JhlOGwI/fnubAf5eKc/fp9EiRl43x/fg=;
 b=JRBZmVbXcRWKvp4uUWWJ5WOCODiBZkUDY5c4m7cnH8+wQCDE1IgnAkah91v6QC36UT
 PXYiVYezwSx/Sv8sulgItbf9kwAK7E5QXwVwULPy2sLuL6RfmsvEBA6NDpOhvfFIjlYn
 n65yjSpoVYYkrUEgsoF8MYbdowRLto5hfGFssPmmMX7z9U3H74aCh77po8YcnMzlftif
 C8t+0oJF8hA4/Q+C+tY2W81EDuxbHYlJKqupYBCMzq8yIQRZyhY/AGo60bEjSWITU2to
 jDUNQV3GFriar9GKX+RykCtJEhZb1GghWclEKxvR8YMhhrnqpU/oQd0SxxJHvtUPneYp
 KC3g==
X-Gm-Message-State: AOAM533RazC1CzEO46QvlxZUR1tIYaTevu9b+1T6Q3i3+TenzfB+su3C
 bXaFg6ndNdj7Z1V/PmuFm8Ta3RdgKlnOVw==
X-Google-Smtp-Source: ABdhPJwtYPWfY0lOhFM8xEpOcKk/sBWpun9sbZ9GFBm2+Gxmp0+b1KHcHCZ0uwq9jx9k35TLjbgeqA==
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr9551118wmh.86.1620797869224; 
 Tue, 11 May 2021 22:37:49 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x16sm3400869wrp.6.2021.05.11.22.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 22:37:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] gitlab-ci: Add FreeBSD jobs
Date: Wed, 12 May 2021 07:37:14 +0200
Message-Id: <20210512053714.3268162-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512053714.3268162-1-f4bug@amsat.org>
References: <20210512053714.3268162-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add system/user emulation jobs on FreeBSD host.

To build these jobs, you need to add a FreeBSD runner and
add 'freebsd' to the QEMU_CUSTOM_RUNNER variable in your
GitLab project.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-freebsd.yml | 59 ++++++++++++++++++++++++++++++
 .gitlab-ci.d/qemu-project.yml      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 .gitlab-ci.d/buildtest-freebsd.yml

diff --git a/.gitlab-ci.d/buildtest-freebsd.yml b/.gitlab-ci.d/buildtest-freebsd.yml
new file mode 100644
index 00000000000..683e815afbf
--- /dev/null
+++ b/.gitlab-ci.d/buildtest-freebsd.yml
@@ -0,0 +1,59 @@
+include:
+  - local: '/.gitlab-ci.d/buildtest-template.yml'
+
+.runner_freebsd_template:
+  rules:
+    # To enable thss job template, add 'freebsd' to the QEMU_CUSTOM_RUNNER
+    # variable in your project UI via Settings -> CI/CD -> Variables
+    # https://docs.gitlab.com/ee/ci/variables/README.html#project-cicd-variables
+    - if: $QEMU_CUSTOM_RUNNER =~ /freebsd/
+      when: always
+    - when: never
+  tags:
+    - freebsd
+
+build-user-freebsd:
+  extends:
+    - .runner_freebsd_template
+    - .native_build_job_template
+  image:
+  variables:
+    MAKE_CHECK_ARGS: check-build
+    CONFIGURE_ARGS: --disable-system --python=/usr/local/bin/python3.7
+
+build-system-freebsd:
+  extends:
+    - .runner_freebsd_template
+    - .native_build_job_template
+  image:
+  variables:
+    TARGETS: aarch64-softmmu avr-softmmu hppa-softmmu ppc64-softmmu
+      riscv64-softmmu s390x-softmmu x86_64-softmmu
+    MAKE_CHECK_ARGS: check-build
+    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog
+      --python=/usr/local/bin/python3.7
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - .git-submodule-status
+      - build
+
+check-system-freebsd:
+  extends:
+    - .runner_freebsd_template
+    - .native_test_job_template
+  needs:
+    - job: build-system-freebsd
+      artifacts: true
+  variables:
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-freebsd:
+  extends:
+    - .runner_freebsd_template
+    - .integration_test_job_template
+  needs:
+    - job: build-system-freebsd
+      artifacts: true
+  variables:
+    MAKE_CHECK_ARGS: check-acceptance
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 64cb2ba1da5..5dcf1d34c5b 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -8,4 +8,5 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/buildtest.yml'
+  - local: '/.gitlab-ci.d/buildtest-freebsd.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
-- 
2.26.3


