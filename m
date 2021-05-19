Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552E3896C5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:31:14 +0200 (CEST)
Received: from localhost ([::1]:51244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRuT-0005PD-8O
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLo-0006cd-7w
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:24 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLj-00027t-EJ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a4so15141220wrr.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w2agzS5VFQNlX6AHwHl8UePmDDMjCEXV7NxwZmTKQqM=;
 b=A0X0gJKYA/n3MX7Rvoi6eRt+dmam4iaBzLl67okgo62KJa1yP75M1AKHVjdSmu8idX
 KHBvu1SWGz6wOKCO1QWxRXhT5U0agYaO+IM/WosEPekYsvWqlkEYEGbDkmn/KztA4uMh
 efOG3vbXCwmCgAzKwGot5hWD9jcdv/PZBrkdAFa3FRnnP/yrWKQGbaytn5oZUDP1IkQD
 S5r6z6XSkkxREIOKrp7lPkciYBdw4XUOXA3N2bDEp+Pz0omK0415TUu8lAmSornhJgIR
 iwJMuq0i9RLbEl2vf2HBrpblbiVqqflEiQpnfLy7s/2yURJneRoBlP2+JFTCJfUjBKgA
 nPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w2agzS5VFQNlX6AHwHl8UePmDDMjCEXV7NxwZmTKQqM=;
 b=cYA/LSzlQlWGbh2LqJM/V4qr6w0FxIVGZJscHys/RnrEK4zm/vDYQzv1A0FKMMp7FD
 gpjmxsHjYfs8CYel+4PW3trRbM/VdewLm8s6R0BdnboVkjkghizlgRmwvCc9KnG3yczf
 cowmhQlCRE9MfBgJkP29E2QBtsStY+/MMgcrP15DyosQ90Sdyd+RjcF9qjiCA/ekZRR+
 yY2kcXp4QW+hke9v+xCVIEhvejbhNSpu9iSwqRdGqhx/nD+uGhY2IiOqCpSOg8s59XDI
 IH2JCdyG4TJfQKMg3W5fjgSsu2RMf1F0R9Iv98WNQQ0FJq5iF4mGJ6UQUQRSsNp5llM0
 7/rw==
X-Gm-Message-State: AOAM532docKbkgrkmBEZq76eduzrez8zQndc03UKMNo2B9URjRMpHEZP
 iaiu/IzRGrepMG9c8QzKuG063eYU9TZbaw==
X-Google-Smtp-Source: ABdhPJygTzvRy3wiD94hZaEcnSzzep+OM0ONBQ2zZV/0Pq4yhzTXe7fjYgDeU8KI/reEz6mo4KV+YQ==
X-Received: by 2002:a5d:534f:: with SMTP id t15mr385055wrv.206.1621450516603; 
 Wed, 19 May 2021 11:55:16 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m9sm241537wrq.78.2021.05.19.11.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/10] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
Date: Wed, 19 May 2021 20:54:56 +0200
Message-Id: <20210519185504.2198573-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The acceptance tests aren't accepting anything,
rename them as integration tests.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6a36f8299bf..ef9b4804f32 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -52,7 +52,7 @@ include:
     # Avoid recompiling by hiding ninja with NINJA=":"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
-.acceptance_test_job_template:
+.integration_test_job_template:
   extends: .native_test_job_template
   cache:
     key: "${CI_JOB_NAME}-cache"
@@ -109,7 +109,7 @@ check-system-alpine:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-alpine:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
@@ -142,7 +142,7 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -175,7 +175,7 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
@@ -209,7 +209,7 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -243,7 +243,7 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
@@ -275,7 +275,7 @@ check-system-opensuse:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
@@ -516,7 +516,7 @@ check-cfi-aarch64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-aarch64:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
@@ -552,7 +552,7 @@ check-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-ppc64-s390x:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
@@ -588,7 +588,7 @@ check-cfi-x86_64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-x86_64:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
-- 
2.26.3


