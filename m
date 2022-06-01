Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FAA53ACE3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:35:39 +0200 (CEST)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTBt-0000np-R2
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrH-0002ES-Dh
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:15 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrF-0006aw-JK
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:15 -0400
Received: by mail-ed1-x536.google.com with SMTP id 25so3038549edw.8
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CgrZcRvEC92TB5SicobcmdhVz8wTpWobClc7Uf+aGt4=;
 b=aF4PaLdLf8rwIpc+89gKetlg8JhP6PFDIKfInBzrKMjuatrfx3emJjORW9gWX2AUjO
 Tqtsqth7x2/9EZeN3pjNyLoMTf5YHmjzXaonQKdn0GsaLQSrlriv4Zos5mYWAeJz9vek
 lQWFeKrevsMJFc5lKTl/qFEBCR9metVzm5rmU6EPIPopzvpDsuydDEHIMYJ/2Nrtgl66
 5+9GFyEdtU9GiF8Jj9FNRLLfyI7ShyDSOzOAXuOBKVUWgrKjhnPKFbN6krrX5lTpUT1x
 5/ZBW5X9euodHRK9dGL02Xf96CTa1wwT7IJp4mQ1L6+jvIvO7gqY3RE1BBGzdaIUs2ZA
 Qg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CgrZcRvEC92TB5SicobcmdhVz8wTpWobClc7Uf+aGt4=;
 b=zFduaboKvl2sSKcy69Nv0An96192GnY1UGsIBnW6Nk86OA5CREDZ5aRGUcgOaCQmWa
 KDouxboZuMqDePlWkVBOT9vUw1uuI3db97e8XR2ORsY5nTIFQrocQQwKj3+00fSihMgi
 RpiEVsgkw2LBmkMWt7NSTWOr7wnAThySLzkxmfQB/GA5NznKc4SOY6IICmUp2ltd9O7v
 FMmEBFC11ui+0NSRy4K24QMpQiqEZYFNsq/RJS/4PxOE9oDCRlVWmaXGpx8HwcG7bl3J
 M7kGOTJ+r7VTqfFgLPL8bg3EIauVATWse/bbRzajgQDixRct/C9iLPxI2zsaweu44RVQ
 cI3g==
X-Gm-Message-State: AOAM531fgqumMbndqNlvRsQ19XGveZfQxS3wYwu81tl2R50XguW/YIDl
 /4DY0K/TCnrqlNfzNJovfHsF4w==
X-Google-Smtp-Source: ABdhPJyDKROM3SqXWgB/hUS9tZTkyty0KnGYajGgVT9pnGEYuoqW6O4WhYG+3HW/c04hwrikimIQBQ==
X-Received: by 2002:a05:6402:1cb5:b0:42d:ddda:7459 with SMTP id
 cz21-20020a0564021cb500b0042dddda7459mr1157829edb.16.1654107252157; 
 Wed, 01 Jun 2022 11:14:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170906560700b006fef5088792sm977430ejq.108.2022.06.01.11.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D0E01FFD4;
 Wed,  1 Jun 2022 19:05:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 29/33] gitlab: convert Cirrus jobs to .base_job_template
Date: Wed,  1 Jun 2022 19:05:33 +0100
Message-Id: <20220601180537.2329566-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

This folds the Cirrus job rules into the base job
template, introducing two new variables

  - QEMU_JOB_CIRRUS - identifies the job as making
    use of Cirrus CI via cirrus-run

  - QEMU_JOB_OPTIONAL - identifies the job as one
    that is not run by default, primarily due to
    resource constraints. It can be manually invoked
    by users if they wish to validate that scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220526110705.59952-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220527153603.887929-30-alex.bennee@linaro.org>

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index eb6a9e6122..a539f502da 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -52,6 +52,20 @@ Maintainer controlled job variables
 The following variables may be set when defining a job in the
 CI configuration file.
 
+QEMU_JOB_CIRRUS
+~~~~~~~~~~~~~~~
+
+The job makes use of Cirrus CI infrastructure, requiring the
+configuration setup for cirrus-run to be present in the repository
+
+QEMU_JOB_OPTIONAL
+~~~~~~~~~~~~~~~~~
+
+The job is expected to be successful in general, but is not run
+by default due to need to conserve limited CI resources. It is
+available to be started manually by the contributor in the CI
+pipelines UI.
+
 Contributor controlled runtime variables
 ----------------------------------------
 
diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 10eb6ab8bc..5734caf9fe 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -12,12 +12,21 @@
     # want jobs to run
     #############################################################
 
+    # Cirrus jobs can't run unless the creds / target repo are set
+    - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
+      when: never
+
 
     #############################################################
     # Stage 2: fine tune execution of jobs in specific scenarios
     # where the catch all logic is inapprorpaite
     #############################################################
 
+    # Optional jobs should not be run unless manually triggered
+    - if: '$QEMU_JOB_OPTIONAL'
+      when: manual
+      allow_failure: true
+
 
     #############################################################
     # Stage 3: catch all logic applying to any job not matching
diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index b96b22e269..609c364308 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -11,6 +11,7 @@
 # special care, because we can't just override it at the GitLab CI job
 # definition level or we risk breaking it completely.
 .cirrus_build_job:
+  extends: .base_job_template
   stage: build
   image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
   needs: []
@@ -40,11 +41,8 @@
       <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
-  rules:
-    # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
-      when: never
-    - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
+  variables:
+    QEMU_JOB_CIRRUS: 1
 
 x64-freebsd-12-build:
   extends: .cirrus_build_job
@@ -90,11 +88,11 @@ x64-macos-11-base-build:
 
 # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
 .cirrus_kvm_job:
+  extends: .base_job_template
   stage: build
   image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
   needs: []
   timeout: 80m
-  allow_failure: true
   script:
     - sed -e "s|[@]CI_REPOSITORY_URL@|$CI_REPOSITORY_URL|g"
           -e "s|[@]CI_COMMIT_REF_NAME@|$CI_COMMIT_REF_NAME|g"
@@ -105,8 +103,10 @@ x64-macos-11-base-build:
       <.gitlab-ci.d/cirrus/kvm-build.yml >.gitlab-ci.d/cirrus/$NAME.yml
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
-  rules:
-    - when: manual
+  variables:
+    QEMU_JOB_CIRRUS: 1
+    QEMU_JOB_OPTIONAL: 1
+
 
 x86-netbsd:
   extends: .cirrus_kvm_job
-- 
2.30.2


