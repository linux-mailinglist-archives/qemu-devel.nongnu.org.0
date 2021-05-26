Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478AC392208
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:27:20 +0200 (CEST)
Received: from localhost ([::1]:56516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm13f-0004b8-9o
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vS-00024e-1A
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:18:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vP-0008C2-L7
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:18:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id v12so2556747wrq.6
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1xwDYaxd6JVF19FGs2XehHjTnmolRlelitlWwSXhuc=;
 b=cNwI2wrtS7BWA9T331flCjCfiewk+KOiHD15Y8i153eOQ6aubNv7msWG1yumrBhyVH
 1Bkr4C4kC+rJhCbUJTDQH8aDjLyEx1M/UWE8AIyUEqN+YBxqgx4KAURjv6d/SxtdFMXT
 xgi6q40jCMbjQxaIUBPNpk+pe/JvkC82V9Rn7twnNA+k5hO2zVuogu5OpuzlplsYJoLc
 VWpupS/nFyel2STonunrT5oyssMeS9S+AfkqaR9fD8hdsGeAKVTyAd6plGBdq5rkf9jc
 ARTp6hM2FioDP0tSZ7u86u1SKAZ/h8geToTNk+wk+oTerlItOwKluAigdpvxVrrGO8zF
 158Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A1xwDYaxd6JVF19FGs2XehHjTnmolRlelitlWwSXhuc=;
 b=ptWnPKmN2fWQtAE52f1tx6IAxWqQgdiO+MpD7Jau7laGweSNj6qxXdYI71omcVNavL
 YtFhANCVsIscq/qdBv5yz/NwzqemWlgF8YZRKAI4XdgV2gNKhic9zDQJcRkgha27Rraz
 dUsMjtF4xJNWbiqQTJk34OL6ODJrLYNXSBqbw1+yY6lBG/lELiyLdBFMsEexz8BqFzwF
 fj/UDCRoaLbmOIf9eq69UeBQhBZeTob8aBFa6ozP+aKJW/aeEtLNcxkSMEzObJgyISu/
 vxcc2K7msYTeJKzTDzjV5IMt5yfi8J0+a02VWSWWq1JGtHbFpVcaBDIhU5Qw/OuRUSTM
 IJFQ==
X-Gm-Message-State: AOAM530R3WaQoT+nECZd7HEF3vv92lG55xy0cCCvK9eTHu6jjzl75D1Y
 CTvr4QXyUcUthEbDU9+CuLRT4YXOBB+cdg==
X-Google-Smtp-Source: ABdhPJxkmxNuvi9bBcf3ZWWkQKjuqx1QNSKYhCrQ8cA7leooS2vAnZEB2gxX9u0Psla4Yi/pC/RreA==
X-Received: by 2002:a5d:6804:: with SMTP id w4mr35572390wru.363.1622063926062; 
 Wed, 26 May 2021 14:18:46 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id u14sm7802902wmc.41.2021.05.26.14.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:18:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/19] gitlab: Replace YAML anchors by extends
 (acceptance_test_job)
Date: Wed, 26 May 2021 23:18:20 +0200
Message-Id: <20210526211838.421716-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210519185504.2198573-2-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6a0d311cf40..d6e93369d6b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -52,7 +52,8 @@ include:
     # Avoid recompiling by hiding ninja with NINJA=":"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
-.acceptance_template: &acceptance_definition
+.acceptance_test_job_template:
+  extends: .native_test_job_template
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
@@ -108,14 +109,13 @@ check-system-alpine:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-alpine:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
   variables:
     IMAGE: alpine
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-ubuntu:
   extends: .native_build_job_template
@@ -142,14 +142,13 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
   variables:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-debian:
   extends: .native_build_job_template
@@ -176,14 +175,13 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
   variables:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-fedora:
   extends: .native_build_job_template
@@ -211,14 +209,13 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-centos:
   extends: .native_build_job_template
@@ -246,14 +243,13 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
   variables:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-opensuse:
   extends: .native_build_job_template
@@ -279,14 +275,13 @@ check-system-opensuse:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
   variables:
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 
 build-disabled:
@@ -535,14 +530,13 @@ check-cfi-aarch64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-aarch64:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-cfi-ppc64-s390x:
   extends: .native_build_job_template
@@ -572,14 +566,13 @@ check-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-ppc64-s390x:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-cfi-x86_64:
   extends: .native_build_job_template
@@ -609,14 +602,13 @@ check-cfi-x86_64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-x86_64:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 tsan-build:
   extends: .native_build_job_template
-- 
2.26.3


