Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C572436388A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:37:36 +0200 (CEST)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGyt-0001hD-O1
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwX-00005H-FQ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwV-000339-NO
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so10127979wma.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dN+1Fz7A3P3flnj/XHZg7NUSu3iHLZrIm3Xc3Jtho64=;
 b=NHjdVQQPbg0h2BoT3TB/xsQpVYFyaP2c30iAnxuY3b0I+c/8YQAEjnJnjJ3szFA4UK
 L22H/SOea1hQ+dgyzkoy8q91F44OGKH30K6UF4iJP8NYs5tRm6Z6sVUL/k1Zx8PAYYXn
 rxOJLIzS9hBfy5v7NWaJIFBDh6eWg3ELAl5/E/zABqHxt7jdTKNaG9yWgn8/RGg2iPD8
 Ke/TsojbNrLq5QC7gmfyqmNW3pzlSLAtoGbVXTbaapmVJyURHwsusac69yYYlxR6iu/t
 16GFENjQXAAESjTpdWqST00AZppq8x3t7XCtkPCV82XYGpuIQSSthEIP7hr/8xcLTFlm
 gvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dN+1Fz7A3P3flnj/XHZg7NUSu3iHLZrIm3Xc3Jtho64=;
 b=di1qDrwSCbp/KoEw4Fcgi3XsquJqB5UCYEq1Tsxd6OHrIAxf9bQyyp32C3Pg4tn1pq
 +mo3YiqduUROW49sFp+BLQzjgUUE4IoawcZZS9CydD8cLwZivrqM6bFHXHBGkiIl6au5
 RtKdstcateSK7px5RbSNGexs8/QAaFpBYKNIB/Y4VS/uzx96RnJ+6E9VGjDHHPX2Qiwl
 1Bht5GmYDaVTY1kv6CnKIpqY/aCFpmN+QvVdnmxKwJxUYirMtW1eqyInkDQVREApEzFR
 DM8mxq7mMCQXlh43urtZp5lRJH/dJeBC2asIH+2uTKxYTl4UitUUd/fZdD7T//7iwZq0
 OdlQ==
X-Gm-Message-State: AOAM5309MK/U6vNtgiuMvBIILFDzoqyX3oOPWcLhZWLqo9eNFzSbPau1
 fyMroMCYfz8BgPzkq1QXvri1SVAMTRme8w==
X-Google-Smtp-Source: ABdhPJyc3HbGD5jyUNW/cCdefGgzzTpmXBmMWbJt6OrmXNymv3BhY9KYWk26+bTjA6tAxxiJirQoig==
X-Received: by 2002:a05:600c:3594:: with SMTP id
 p20mr17992590wmq.173.1618788906135; 
 Sun, 18 Apr 2021 16:35:06 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l14sm8984920wrv.94.2021.04.18.16.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/15] gitlab-ci: Replace YAML anchors by extends
 (native_test_job)
Date: Mon, 19 Apr 2021 01:34:36 +0200
Message-Id: <20210418233448.1267991-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98d73429405..11bda3abf33 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -37,7 +37,7 @@ include:
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
-.native_test_job_template: &native_test_job_definition
+.native_test_job_template:
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -95,7 +95,7 @@ build-system-alpine:
       - build
 
 check-system-alpine:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
@@ -104,7 +104,7 @@ check-system-alpine:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-alpine:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
@@ -129,7 +129,7 @@ build-system-ubuntu:
       - build
 
 check-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -138,7 +138,7 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -163,7 +163,7 @@ build-system-debian:
       - build
 
 check-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
@@ -172,7 +172,7 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
@@ -198,7 +198,7 @@ build-system-fedora:
       - build
 
 check-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -207,7 +207,7 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -233,7 +233,7 @@ build-system-centos:
       - build
 
 check-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
@@ -242,7 +242,7 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
@@ -266,7 +266,7 @@ build-system-opensuse:
       - build
 
 check-system-opensuse:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
@@ -275,7 +275,7 @@ check-system-opensuse:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
@@ -509,7 +509,7 @@ build-cfi-aarch64:
       - build
 
 check-cfi-aarch64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
@@ -518,7 +518,7 @@ check-cfi-aarch64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-aarch64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
@@ -546,7 +546,7 @@ build-cfi-ppc64-s390x:
       - build
 
 check-cfi-ppc64-s390x:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
@@ -555,7 +555,7 @@ check-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-ppc64-s390x:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
@@ -583,7 +583,7 @@ build-cfi-x86_64:
       - build
 
 check-cfi-x86_64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
@@ -592,7 +592,7 @@ check-cfi-x86_64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-x86_64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
@@ -630,7 +630,7 @@ build-deprecated:
 # We split the check-tcg step as test failures are expected but we still
 # want to catch the build breaking.
 check-deprecated:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-deprecated
       artifacts: true
-- 
2.26.3


