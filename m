Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F016036388E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:40:51 +0200 (CEST)
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH21-00056N-2g
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwh-0000PM-8k
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwf-00037z-Nu
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so19508988wmy.5
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZ5w+1CeqdCiiYndsmhgl1cCVc6vRLgkh6Xz/B0ueLg=;
 b=hwOiMNn8zxPJk/P6jRrumol00B7lGsreH2Pr7KuMYp2AylsekPWMvcBm2/tiCrPCFC
 bVkfNApW388T/scgxThJBoqUZ29oF4r2NzgE4IrYhJKg/awtRDWGVjHLPSzFdZLFUGqB
 d5unXdCRw3Vt7EnAEqc4KGI3s7SyVDKxsLKmh0whYbYSywpPmZhRlu8+1jDwLo9Y6X50
 qqAh0GNkRShmsHW7AqQQilNp7tUucE9vLfK8SEZtiwZIZGudKA03YlID8rLSMjBlQ8bv
 tc/DZMBD9mQ6MrZLuQ+nhSFSeinoT+4Mle74WyADjyrGFZW1w+3CAAvENi2kktf6OhZS
 /P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rZ5w+1CeqdCiiYndsmhgl1cCVc6vRLgkh6Xz/B0ueLg=;
 b=qjNWtJdGIGsmDFDYV1/Di0O+9R2v2hewGijBCTkQ53pnlS4aXDSdxIxTvy7+Cxdzdq
 3zYEyv+Zat+8fZyiaGMVHNfEc04fvTplWtvfL/QZaja+sdq5p9V4SYFDGpIHt8Zfi9M/
 CHMPoFLq4SdKCxCSI4ERpSxb21MIpDAE/UVVpxjFCHwT74XqrKvQ2M7CG/5ai5gf153Q
 zeHyMnJs2cOFhBzSwVUQFqSBLaqjXI0xZp2RjrgPRLjK8YZpViRlFev3wYhVMGEjAces
 0cjtUAjn8dO/lhLVxXwx3I7RXKgASeXWY0DffhYPCi2NdWZC5zn7WfzxaSF+fL6nZ9r2
 VGMw==
X-Gm-Message-State: AOAM533GvjvZ0jd4S9Lc1eTwyFbA0JWE0rxCFv7+8pVWlgy9ON2iLEh3
 F/hrawK97L8nNHjQHPkxHL22Pt1CMFjBKA==
X-Google-Smtp-Source: ABdhPJwI2OXs9tPqGBJDyFVIHwZlgKwVG/2GKF8U4z61N4MHQfJH0k5l2fcz7osOsiwMjvtTvaOI3g==
X-Received: by 2002:a1c:196:: with SMTP id 144mr18503911wmb.72.1618788916255; 
 Sun, 18 Apr 2021 16:35:16 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l8sm17282484wme.18.2021.04.18.16.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/15] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
Date: Mon, 19 Apr 2021 01:34:38 +0200
Message-Id: <20210418233448.1267991-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The acceptance tests aren't accepting anything,
rename them as integration tests.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 07e5e737685..bf4862a78de 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -48,7 +48,7 @@ include:
     # Avoid recompiling by hiding ninja with NINJA=":"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
-.acceptance_test_job_template:
+.integration_test_job_template:
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
@@ -111,7 +111,7 @@ acceptance-system-alpine:
   variables:
     IMAGE: alpine
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 build-system-ubuntu:
   extends: .native_build_job_template
@@ -145,7 +145,7 @@ acceptance-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 build-system-debian:
   extends: .native_build_job_template
@@ -179,7 +179,7 @@ acceptance-system-debian:
   variables:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 build-system-fedora:
   extends: .native_build_job_template
@@ -214,7 +214,7 @@ acceptance-system-fedora:
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 build-system-centos:
   extends: .native_build_job_template
@@ -249,7 +249,7 @@ acceptance-system-centos:
   variables:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 build-system-opensuse:
   extends: .native_build_job_template
@@ -282,7 +282,7 @@ acceptance-system-opensuse:
   variables:
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 
 build-disabled:
@@ -525,7 +525,7 @@ acceptance-cfi-aarch64:
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 build-cfi-ppc64-s390x:
   extends: .native_build_job_template
@@ -562,7 +562,7 @@ acceptance-cfi-ppc64-s390x:
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 build-cfi-x86_64:
   extends: .native_build_job_template
@@ -599,7 +599,7 @@ acceptance-cfi-x86_64:
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  extends: .acceptance_test_job_template
+  extends: .integration_test_job_template
 
 tsan-build:
   extends: .native_build_job_template
-- 
2.26.3


