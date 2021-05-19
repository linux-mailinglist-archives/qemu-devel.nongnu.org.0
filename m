Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3638968C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:23:17 +0200 (CEST)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRml-0001t7-Hw
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRD6-0000Xr-RD
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRD5-0005JR-58
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v12so15073227wrq.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgSX/LGDpg9kR/VLumzVDItz5dEMkMShrSHH51Rq6pY=;
 b=LyrYMArCHKNTZ+dZZOZ2Ls8+3hX27+UfsoVxtTHKosSZlV/qen7CA08zPjPxdHICMZ
 Usc/UD9KSs8BgeaAzFfmyHVxRi7mkfpaqybWm/TZasmvNnd8ziZ5BN4TjXjaO2Y38nMx
 mJq1yuNEysimFlOroIYpms9oKf4DHUZRyOTMk1n6CvdCvsDNOhMCDb38kQpBVUCS0OBW
 NN0XAxfbb+eA5Q0bSkyQSmCREETj9tZUlX0GMSU0BJQDciMmNZEqyr6a8czncHDt8Dgv
 GIHYm/UxQCNihMT37ZsODnH8ucBtb3KutIZCL7EaCjrZzIoDRPHdGhrPkmbWmXzdjzCu
 uaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tgSX/LGDpg9kR/VLumzVDItz5dEMkMShrSHH51Rq6pY=;
 b=DRjUWY5UojDTX8t8lq7+5p24vXsG3Qk1jvTIBa5xbd1SjWPSXYIF7izx9oanZXq5Fe
 zqXUD1MjL3RIKpKBQ0kJsu/kJXYePurd+NescbNH9nbB3+6QpAmMzurfqn/fI+dY2HD/
 We9K4KxxY/Qf9fXAEy75SkErY/ZFng7e2sBsa+d5ZtBelp5kbbqIxs6ef+1RAhDiwOP3
 BT8dCD428MTFdUMUCf9aBDOaAkSfR3w1ELxI08HwKeyNxJWz4D0ca8M12sVDsFa3SFf6
 BWfSmB9U4k9/u3QZGDeRoeFA3LRDb1RF5XuF42JaMi4Ol7UBmQdRKIbJxqggPT6D5oLQ
 pSIg==
X-Gm-Message-State: AOAM530k5eWjWX1ACifstOMQQy+sad3b8JGm0NZ8AUmvS7PGZ25VRHte
 0xoD2eb1QgWIkHnUG1Ee+AgYVRPiuJz8sQ==
X-Google-Smtp-Source: ABdhPJwu3MU2HWGzdmQ5m3R4pr/aRtgrOf9ewMrIHQm21Kb7nJvk35iZR5w/EdOt0C2jPy2566TbDA==
X-Received: by 2002:a5d:508e:: with SMTP id a14mr376839wrt.88.1621449981324;
 Wed, 19 May 2021 11:46:21 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x2sm2553550wmc.21.2021.05.19.11.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:46:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] gitlab-ci: Add FreeBSD jobs
Date: Wed, 19 May 2021 20:45:49 +0200
Message-Id: <20210519184549.2192728-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519184549.2192728-1-f4bug@amsat.org>
References: <20210519184549.2192728-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Reviewed by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-freebsd.yml | 59 ++++++++++++++++++++++++++++++
 .gitlab-ci.d/qemu-project.yml      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 .gitlab-ci.d/buildtest-freebsd.yml

diff --git a/.gitlab-ci.d/buildtest-freebsd.yml b/.gitlab-ci.d/buildtest-freebsd.yml
new file mode 100644
index 00000000000..bfaeff89330
--- /dev/null
+++ b/.gitlab-ci.d/buildtest-freebsd.yml
@@ -0,0 +1,59 @@
+include:
+  - local: '/.gitlab-ci.d/buildtest-template.yml'
+
+.runner_freebsd_template:
+  rules:
+    # To enable this job template, add 'freebsd' to the QEMU_CUSTOM_RUNNER
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


