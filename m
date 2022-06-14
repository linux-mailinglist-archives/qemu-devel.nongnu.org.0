Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863BB54A341
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 02:49:37 +0200 (CEST)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0ukS-0000kV-LI
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 20:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udO-0008Mv-EO
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:18 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udM-00052E-CF
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:17 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c21so9102630wrb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 17:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LbJvesSj/XUONUT1pSTDj21cx22O0woqvcv66/J8IsI=;
 b=vfW22iCNEvMUcoLasIUgBD+g2Z02LbbENqvFGssMIUcAZF7/oeGFE02xe6vvy5WXsS
 qhjOgZabRF53hwF0K2tioP5IZwUQ9Gqlq42IvRXv9XJfsm+wOAitYvxkVtg+8UcD/mWP
 X9/AObCVRXcLIA4oWVONVh8jFydwobrfumH40G5wJw9A9BKJyLC6aZwX8dqhIt+SlLZG
 UZNTZXtjoZtT+OPdB0P5uIpqYj1E/F/orZAbh6QjiZ1DhhRWApZgCeB+dmHWIcpB/XsF
 v4eRIJPunuGB6NuW9/+oE6n73xN1by0souDdSrofzKNTIwgNK0zzouUIlGTfUsmkeh4f
 gPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LbJvesSj/XUONUT1pSTDj21cx22O0woqvcv66/J8IsI=;
 b=MCWEnmr405t5CA61M7Z640pju7kN2uQLqXL8LNZAvmbgfm2/UR6pdcPr5vIYa27szC
 g871RYx49zyw4gg/l4JCUxUnQMeR1VSF/fR/HBYQ9woDaWBBbltRB/OwqSkuJhcmNAOj
 cFVUd6rTEaMlMAGUgLeoGy98v4nEStlyZJ6Ceax8CKhj2+BFZ0N4WzippnpXHZ/JadQm
 BI8fU3zbpA7FSxIYsqTz1c2nQHuoOUO2ro30/nFze9Pr9mEoZQ9krA0aQc5Nn59RWTE0
 jRT7QLPNQgWAl56XJg8GV7DMuftGrBFIFFWXpqftBE2HI5v3+nstbjHpvjovdHhy7BlZ
 cR3A==
X-Gm-Message-State: AJIora/Ck0GgCVhpQ2YgaNweLtOM93/AmDE80WSDUFtCzGqQszbMnrqK
 oU3h3SGoz9go8qN8neIyNjSfrQ==
X-Google-Smtp-Source: AGRyM1vglvTRLsPdSxZOTM3AxdssRRxyo2bE0qolQtkgTn0iXxye7Dl/kHPwFubd/hgPPkl+BC8BaQ==
X-Received: by 2002:adf:d1c9:0:b0:20f:c3dc:e980 with SMTP id
 b9-20020adfd1c9000000b0020fc3dce980mr2226192wrd.552.1655167334037; 
 Mon, 13 Jun 2022 17:42:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adffc8d000000b002102f2fac37sm11245006wrr.51.2022.06.13.17.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:42:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59B821FFBB;
 Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 3/7] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Date: Tue, 14 Jun 2022 01:42:05 +0100
Message-Id: <20220614004209.1970284-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220613171258.1905715-4-alex.bennee@linaro.org>

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


