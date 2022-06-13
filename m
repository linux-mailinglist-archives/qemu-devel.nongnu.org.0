Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DF5499A9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:19:12 +0200 (CEST)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0niZ-0000LD-P5
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0nci-0001HH-Cz
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:08 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncg-0006wV-Fw
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:07 -0400
Received: by mail-ed1-x52d.google.com with SMTP id o10so8105644edi.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWtB77SS8UzWWppXKv/PKd8mKK1jf+oMFHLQZ6UbrHA=;
 b=A58wzM/thC1RKZ4kNI98Vh786epLQrgE51n+Dn3LXw6wQvej+CBRS5fRE2pZLbc022
 Rw2OG0FDJoN9HiyOmUtJli4V5tb+kLtB6CbjTCUiQlyQPjEHvi8q6J//vH++WG3klma7
 rR55u5Dk24+0OD23nKh9kHrisHARfypI/tfIgXSVSZVMC63QF3C6+OicGkLFrap2WjR9
 YLrd4V9B173jTcXmUFJg59OSgwC4zAH8AFQUcKdlyeyglfLBcf2dvrFSJgWHAG1KWlkX
 q4uvsAkjLDpixOYufVFyuJFZVqqYzAZ5qVoze2pdbfW+xDMctCe/YNBs2rqWi/NCQo5s
 ayiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWtB77SS8UzWWppXKv/PKd8mKK1jf+oMFHLQZ6UbrHA=;
 b=0n6GVW26MgPBn9xTVuwX0BdWmXd1yLDCZS1Fpou5q6a0bFI10Tup0xgGfK3mKIaV31
 icHR2xQuYgH1Cd0ejKInaanIEa3NHdkwG5EokR13vHBB1HJLCS1BsfAtbq+wWSOYNjaN
 X4haOZcMJvTU9733MTcVt4yAMBaLOEB7jkguYJyGgV/OGRXX5cZN0aTgVu8R/kMtbErl
 qwHLTrvv+Surle1fYvF+pfFP3FJnnoHnvi0Vs2uBxM+UgpUmOin3SvjioDiIgAMv85yC
 CMT/5vWxHcto7nVElbz2kZYMx9JPCMBsjnY6JEyPyP0MIQClpUuxcOKyQHjj/LSFmb/R
 juQQ==
X-Gm-Message-State: AOAM530TOBEqg1iYNIo4FIvAIGsjIguCQ3pQDoloJjnYlbSjQZ6XN9DI
 GLySBAUuVdkgGtSOLq3h3RK8Fg==
X-Google-Smtp-Source: AGRyM1vtPRZOHqns6jjxo4frCxCp18A/HKnyaoePDg4izzFqkIw90pdnxZ66p1lgbbpNlS3R0q7DRA==
X-Received: by 2002:a05:6402:40d2:b0:42f:ac14:34a3 with SMTP id
 z18-20020a05640240d200b0042fac1434a3mr852194edb.262.1655140385125; 
 Mon, 13 Jun 2022 10:13:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061d5900b006fe98fb9523sm4042738ejh.129.2022.06.13.10.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:13:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 43B5E1FFBB;
 Mon, 13 Jun 2022 18:12:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 3/7] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Date: Mon, 13 Jun 2022 18:12:54 +0100
Message-Id: <20220613171258.1905715-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613171258.1905715-1-alex.bennee@linaro.org>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The job definitions recently got a second "variables:" section by
accident and thus are failing now if one tries to run them. Merge
the two sections into one again to fix the issue.

And while we're at it, bump the timeout here (70 minutes are currently
not enough for the aarch64 job). The jobs are marked as manual anyway,
so if the user starts them, they want to see their result for sure and
then it's annoying if the job timeouts too early.

Fixes: e312d1fdbb ("gitlab: convert build/container jobs to .base_job_template")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220603124809.70794-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 544385f5be..cb7cad44b5 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -357,16 +357,15 @@ build-cfi-aarch64:
       --enable-safe-stack --enable-slirp=git
     TARGETS: aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
-  timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-  variables:
     # FIXME: This job is often failing, likely due to out-of-memory problems in
     # the constrained containers of the shared runners. Thus this is marked as
     # skipped until the situation has been solved.
     QEMU_JOB_SKIPPED: 1
+  timeout: 90m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
 
 check-cfi-aarch64:
   extends: .native_test_job_template
@@ -398,16 +397,15 @@ build-cfi-ppc64-s390x:
       --enable-safe-stack --enable-slirp=git
     TARGETS: ppc64-softmmu s390x-softmmu
     MAKE_CHECK_ARGS: check-build
-  timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-  variables:
     # FIXME: This job is often failing, likely due to out-of-memory problems in
     # the constrained containers of the shared runners. Thus this is marked as
     # skipped until the situation has been solved.
     QEMU_JOB_SKIPPED: 1
+  timeout: 80m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
 
 check-cfi-ppc64-s390x:
   extends: .native_test_job_template
-- 
2.30.2


