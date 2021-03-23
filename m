Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC83466CC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:53:12 +0100 (CET)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlDL-0006sS-22
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHg-0007HT-Cj
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHY-0002vQ-FV
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:34 -0400
Received: by mail-ej1-x634.google.com with SMTP id e14so10028661ejz.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1R5dBzICN7UKyVr4RtsD3A7GJeQOBuWX0KqOefj2HYI=;
 b=Npt/0ihztyIgQ/YYKncErYm+GRxbseFYjc/t1xqHvGCKrJP5/j2fwZZA/nKMRTOEWR
 W7NnbJ46XsRuwZ9dh/gsnGRGEG8Evkbx8eMVTy9DNzw32NC6ggfDnA5GgIJ6b3r7rgJ5
 CViz5y9klJfzUtzKY2TqWtC+guPiGP4QG+CHdJ9qcmCsdgJEr6gkfvnUjAAu8tQXvaYL
 56eCv67NUShy2hagumng/fagelUn1C9irO36CoY4uLjWXTGIQQAc8nbEsggJfgPFMaTk
 1mKN8FoxhFERi0B9SxN0SVosIbbkCVQFxQeBPyig1Qle2vsPi42XvxoODOSv4+6XvSFo
 EZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1R5dBzICN7UKyVr4RtsD3A7GJeQOBuWX0KqOefj2HYI=;
 b=oww4SYpGa8tvAPiHzESI/EvqrnYCOKNJWfHKgUY57pmeRtF0MCg9Mvs4lFS4W6exkY
 W6eNSUVrFNR35qGEba1roP8KyB1Jda1Phz2hiFIDPY26a+e1fXWf4xvmqdB/W+oQ0jWe
 1Pcz+5+8OOVSgR9tf0o4o9MCklxeP33tEGlZUdIscuxKuYqq0t36EqP9+/fNl+z7MBtS
 ihvVUET7N3PzIfkUec9Bcby1R7hJRMnOS6sQZ9mzqlCrucQQvwR7AHevwnWTp95BnxpW
 0FPyziGev/uVXZbYqOpfgS/ZmhYhKqOEFdslHqcOjavg6Yo2T6S5CvQw6gbu3PXouBzB
 1GkA==
X-Gm-Message-State: AOAM533r7fK2Xuzm+R2C0f7zc5wvfjdpuhBU60AQ/IBtlGy2HOb/fkCj
 L3IDObTYcj1f51eWA14Yh0onLw==
X-Google-Smtp-Source: ABdhPJyYUW4WNt+FpedUBfMvQePYZlcAxt/GZUEc+/xgMASR9MFxsqFGFPKI1rERKjLERzJeoqeu6A==
X-Received: by 2002:a17:907:7799:: with SMTP id
 ky25mr5776427ejc.217.1616518406030; 
 Tue, 23 Mar 2021 09:53:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k9sm13320651edn.68.2021.03.23.09.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 710791FF7E;
 Tue, 23 Mar 2021 16:53:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/22] gitlab-ci.yml: Merge the trace-backend testing into
 other jobs
Date: Tue, 23 Mar 2021 16:52:56 +0000
Message-Id: <20210323165308.15244-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210319095726.45965-1-thuth@redhat.com>
Message-Id: <20210320133706.21475-11-alex.bennee@linaro.org>
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


