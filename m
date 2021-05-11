Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81337A0DD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:33:30 +0200 (CEST)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMtV-0006Jx-Fm
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqG-00044K-Da
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqE-00089h-2L
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:07 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n2so19097346wrm.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSxyb2XLxEd7xp/LblnlIgvehK/JlbNRJcr6qBoGWfk=;
 b=AmFCgAQjjCHN+mTMM5XI5bCzZQUBXTRQaDWfkJII50Ss+MmlInevvbFJ3iJKF4JaOp
 09mA4tpI+xCKTwDPy+X+LMAr/ASmk0phTR4PG7KrXVeTW040MI25cG7HLE5BWDoqLsGw
 L4Me0Y/Q5ga3ULte9mINKCrJjTlOejRtV9fQr3vNXYR+L3evs4t1WfE2boUqoKWQ6CIq
 RtUxEt1Jn8GsQC/bqTDV1SlOYqb2QhA2B2NN0TmR/vv3S1aLfCqHRBiksnyF2pUksp4J
 0B5tuIMtG30Hei7374mCvafH3qDRkEHc3BluHn5rMIWYkbxVB76Fj3CEBpCa5agrzGe/
 lrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HSxyb2XLxEd7xp/LblnlIgvehK/JlbNRJcr6qBoGWfk=;
 b=MRAYRpU3KJz1r6TZPPvMZeWejoshaZNDMy95FlOLKLgbs+jlxdRTAVy1sazf5PolYG
 6yr2Fi1WGBEXz11ZzLIeN9q7rceTxn9hRM+1/osUbz+C/BP3KdnLg0ycFvRe+gQKaUXX
 Y8d5ywug7s7psMCeDtaGBE2OLHPNawEURPJddfnRPNScw7Ee9ec/OPK0psmSZCVXHg0j
 COjVAvDS0HOi48BmN9Hhmcw0YWIzt+hAisaaxklfr2iKOh+DE/mV9qRrCj6isWX2moSb
 8JD6NrsVsYmmj+2s8Qhd7n82P+MbwCKtChb2yBj/XkVxyIqvPTL+mrPCbgAwpoUTZpuQ
 3PXg==
X-Gm-Message-State: AOAM53376YFRFNefOOX8YnfUAX9ZOyjRiOJT88XgG6rz8pcJg1bg1nzL
 TDNc9OrlUdnnW2LktTmDVThIjaQaL3wVaQ==
X-Google-Smtp-Source: ABdhPJyHbSXBfcFIi/dQyXTw6qos9YOk0FF8wFs4Yt59HNPwOLHjYoj+2IlmD6aguKfwHmbSbHTB+g==
X-Received: by 2002:adf:e9cf:: with SMTP id l15mr26623043wrn.209.1620718204256; 
 Tue, 11 May 2021 00:30:04 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o13sm24078131wrf.91.2021.05.11.00.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/10] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
Date: Tue, 11 May 2021 09:29:44 +0200
Message-Id: <20210511072952.2813358-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
index 1d8ecc281b4..d474ffa030a 100644
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
@@ -517,7 +517,7 @@ check-cfi-aarch64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-aarch64:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
@@ -553,7 +553,7 @@ check-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-ppc64-s390x:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
@@ -589,7 +589,7 @@ check-cfi-x86_64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-x86_64:
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
-- 
2.26.3


