Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C2347AE8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:39:31 +0100 (CET)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4fS-000895-QK
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wv-0006cb-0M
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Ws-0007PD-TB
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e18so24678876wrt.6
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iTIRV2au7uDnVgnh+e3nvQfcgQFM6RJm5G7qLpBLBrw=;
 b=i4NTPUhL3a3RmbczQKpO0xNOgJ9+C6oZXifouVcFPbRqWNhGE9rYbTvVjY0Ie94iqC
 I7UrJB68sw3tfw/1Vb4UYrZFdRsMv7+fhOpNL9Q3Sw/Wm0cqRQa+WNc1pAnYvsAFHil2
 YWiyBLq5iljKiL7U/Pi3mcyeVk2fsikJBgedjdgM4zyAgFACEk/JCtUFl2nGcZ7jlqwY
 pOQLrJ8IeoYCKlJsdvfDGDLFmQ01I1thSqj2SW2ib872Nb54QaghEpMikcPhqGfCEWDi
 PtYHPDULnS2n1HpBfGERqbtRuPdZ7afOr7/bWVInyJ19VVZVw/m4tgz7trRNoCoyANR7
 zIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iTIRV2au7uDnVgnh+e3nvQfcgQFM6RJm5G7qLpBLBrw=;
 b=XelBy3I18mY4C58SiXtscXa9WAl1tGhgZKYC6q3sN68KrXZz79Sr4ni9t6YIXqTnIu
 KIBEa+hRt2ZwBCkzW4c3kOSYIQHpabveCLa4gq1t2iho7/WUyTgAxe8AiPijDzZla6kN
 U8w8sXyT0JmiklIRbVt7t+tjnJ8pc1nGYHOpEMCzgbpjKyeq2VQ2pWhYe2tqXi1pslqY
 1nUjYZire/aQafbacSs2FHuXJMgklXmQMVQw0zVYgD8PZFMZRX4lwYq0FEOt7Em59LGe
 XvD2J4nGCEarXm2ZAHwbFGFAE+2yZC6X12Z3PaKK720ZstUQjohfJ/mZuiCqR4ANhMf+
 ZGsQ==
X-Gm-Message-State: AOAM530qGPIVqxsqgulqqvI7xXHJEV8bvtDSDNNYzS5JmhOYxankcqBZ
 FPFd3ebbG+qME1YwiIMkULXFhF7imtyIs3oL
X-Google-Smtp-Source: ABdhPJzj5Is3KVSghUfCgZ7rg+FDI9Vy9lMnOdWCD3YYaIB8deLm6Zv+r3N+exNuk//VqzeHEs/Vaw==
X-Received: by 2002:adf:b355:: with SMTP id k21mr3896250wrd.156.1616596237423; 
 Wed, 24 Mar 2021 07:30:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n8sm2158632wrm.70.2021.03.24.07.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A79801FF99;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/22] gitlab-ci.yml: Merge the trace-backend testing into
 other jobs
Date: Wed, 24 Mar 2021 14:30:09 +0000
Message-Id: <20210324143021.8560-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Our gitlab-ci got quite slow in the past weeks, due to the immense amount
of jobs that we have, so we should try to reduce the number of jobs.
There is no real good reason for having separate jobs just to test the
trace backends, we can do this just fine in other jobs, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210319095726.45965-1-thuth@redhat.com>
Message-Id: <20210323165308.15244-11-alex.bennee@linaro.org>

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


