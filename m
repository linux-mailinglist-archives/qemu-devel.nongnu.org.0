Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029A342D20
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:42:54 +0100 (CET)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbsT-0008GU-8n
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbnI-0003Cf-Ez
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:34 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbnC-0004Jp-HA
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:32 -0400
Received: by mail-ej1-x62a.google.com with SMTP id t18so14031952ejc.13
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GabEOI8qt2VYTbFRWHqczSknP0jlmCGZSofoXChZAOc=;
 b=vTSOM5/ga2T/vUz15TYvcWOAcva2vI0SIv5D6+yB7BrggkQRGPHbJc2yrTby1SqVd5
 +zfzIbRK1cc/TMYLf5lMdSBl9d6X4dejfJlye5jWQLeiJInq5XMjHqlGR/VkBV7gKEmR
 wi7fuMTyp87DeAd6hcRVSDuKDmqNAzJhymavWDe5fl/4MKMBawCNVfA51k3XKRNwVEig
 8ttGmAHeDFea+bW4Azt8O5Bv9AXw2hVHbow8NnbuyebvrQq3xtmIP+cXsvin9sZfuubm
 SQjmVF1gUgRe20GMVPX8DhT/fhzpIHDeIyJN2rURAI8xmJXI9/p3p0Cl4lW17cXQ6kPQ
 6CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GabEOI8qt2VYTbFRWHqczSknP0jlmCGZSofoXChZAOc=;
 b=HedzoPYpDR5C/PGAEvG5UT0v/G9jCJvQxl1ByVorqTIlpMMHwoCOARG0ahvDk3L4hW
 0XiY+HI/ljuiEOkpXETf+FWhMYt3fAQD3N6Wwza97J9MtUa2vXPBuhXVRbbvFVOhZvYO
 rrjkhzwxqZz6Annut1qMq7BnGwBOHSXb+ezKZ31FY9t2xqsmhzLed91ne9HY0B4QPnjX
 WfSmwHQPb0gFrJzCBVRb5PKx9Xf1I/9R2x+c+b6/tMu/gliUYKx37Fd/b2EDImXeiBoZ
 4Dej3b7FgxliCRCQ2Vzpqb8dAWDGdA8bk0EFJQsdNGB4zjQE2BC72Vosod9Zk6RIEIB6
 FoFQ==
X-Gm-Message-State: AOAM533WQoCSFZ6NQ7WQZlblEsEf2QBOmx+MJm/DvJpv/ELjq7tvwbXa
 cQQHirow3fUqasa5ekq0MGo1zA==
X-Google-Smtp-Source: ABdhPJwxSoMs7mQ+hzXzzCLWKmDDL7bifCwselag3ti1ulr+3FsU0VEeEZKlH4qK1gmFgjo+F5TamA==
X-Received: by 2002:a17:906:4747:: with SMTP id
 j7mr9634327ejs.221.1616247444264; 
 Sat, 20 Mar 2021 06:37:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lk12sm5311014ejb.14.2021.03.20.06.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD7741FF99;
 Sat, 20 Mar 2021 13:37:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/14] gitlab-ci.yml: Merge the trace-backend testing into
 other jobs
Date: Sat, 20 Mar 2021 13:37:02 +0000
Message-Id: <20210320133706.21475-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Our gitlab-ci got quite slow in the past weeks, due to the immense amount
of jobs that we have, so we should try to reduce the number of jobs.
There is no real good reason for having separate jobs just to test the
trace backends, we can do this just fine in other jobs, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210319095726.45965-1-thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f65cb11c4d..f746d5fbea 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -87,7 +87,7 @@ build-system-alpine:
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
-    CONFIGURE_ARGS: --enable-docs
+    CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
   artifacts:
     expire_in: 2 days
     paths:
@@ -605,7 +605,7 @@ tsan-build:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
-                    --enable-fdt=system --enable-slirp=system
+          --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
 
@@ -702,6 +702,7 @@ build-coroutine-sigaltstack:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
+                    --enable-trace-backends=ftrace
     MAKE_CHECK_ARGS: check-unit
 
 # Most jobs test latest gcrypt or nettle builds
@@ -739,31 +740,6 @@ crypto-only-gnutls:
     MAKE_CHECK_ARGS: check
 
 
-# We don't need to exercise every backend with every front-end
-build-trace-multi-user:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
-
-build-trace-ftrace-system:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=x86_64-softmmu
-
-build-trace-ust-system:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
-
 # Check our reduced build configurations
 build-without-default-devices:
   <<: *native_build_job_definition
-- 
2.20.1


