Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3393448D2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:09:08 +0100 (CET)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMB1-00031t-RA
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOLkd-0001TY-Ur
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:41:53 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOLka-0002RW-V3
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:41:51 -0400
Received: by mail-ej1-x629.google.com with SMTP id u5so21703265ejn.8
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CejmlcNvscNq0dw5Gi5JjyZRzRYwNFTs7qhAsYQjI0Y=;
 b=AXbR74bpGIPoPporm2EMsUl6AgS7FfjbVARFIIkS2BliE9rkwZ3mgAJKjtiZLmV5is
 zWJXccs0JJXLhfgtXzFE+nkCBl12flcQRLVTYS6coBuJhctFN7iHsSXpClHy49mZyzbC
 U93Yw6nG7sLjyWc48R8lfMGnCv37RcMiBSHFaaiwE4UcoddpVQ4oxpCAWDjPDrvHIsYM
 EuVzf+5tGpARJLqnhYASGERxqZdI2MNtn3NX98mg0onzA4XuWReqG1lSlUA7tl159qlZ
 4mbbNeXN+f8Ph7ANQ0Cz+K4DkY7codjKwPq/C76dQ9upGdE3NgpJW8SFAM+6GSppO6eQ
 jiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CejmlcNvscNq0dw5Gi5JjyZRzRYwNFTs7qhAsYQjI0Y=;
 b=TXKFf7J0Gk/aTCfD3FsLlHz7+f/Ba7A4E5d6TrrMHupOAexh9hU5J2zXwbLnCXAq8S
 1P7NwN+E4eWTVBBIac+/sCsakiT7mW/HK7k80sh+wX06VfcAhNH45vrmTN6yymrcQzI9
 jILAl+U0tyur4qe33kedAY5dv4jwRUygMeM/szyZOsI0aVfk8hsElEy74imPtDGApzzM
 ef2RT5nwoj5dmHJSH1Xru+ZlK8AnIGDQq+NjnaRq6FwcOj+mF4BB/wrxaDgV/AMjrc97
 xWdrdSp6/hOY34A8izFwN0zNBbf8EcFvy6pE6oEMHREjR+Bdhl2v19Anze+nexU5XTso
 AuiA==
X-Gm-Message-State: AOAM533hIAiY78aHEMdwpQGzi7dOFdqDH8MTkjBtrFdYTl/gtmU8YdkC
 //G3l9iw06sq+yFp4TFeTLSEFQ==
X-Google-Smtp-Source: ABdhPJz6IugM+uOa5cSzDBDJceD9TJGbeVBy0uZnKMhwZs/DdSIsLBFRZCbKwhD+V1IAlI6vCDS+Lw==
X-Received: by 2002:a17:906:85b:: with SMTP id f27mr91915ejd.414.1616424107361; 
 Mon, 22 Mar 2021 07:41:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gz20sm9953875ejc.25.2021.03.22.07.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:41:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D52891FF7E;
 Mon, 22 Mar 2021 14:41:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] gitlab: default to not building the documentation
Date: Mon, 22 Mar 2021 14:41:40 +0000
Message-Id: <20210322144140.13505-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

In d0f26e68a0 ("gitlab: force enable docs build in Fedora, Ubuntu,
Debian") we made sure we can build the documents on more than one
system. However we don't want to build documents all the time as it's
a waste of cycles (and energy). So lets reduce the total amount of
documentation we build while still keeping some coverage.

Fixes: a8a3abe0b3 ("gitlab: move docs and tools build across from Travis")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9ffbaa7ffb..7714c7cac8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -23,9 +23,9 @@ include:
     - cd build
     - if test -n "$TARGETS";
       then
-        ../configure --enable-werror $CONFIGURE_ARGS --target-list="$TARGETS" ;
+        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --target-list="$TARGETS" ;
       else
-        ../configure --enable-werror $CONFIGURE_ARGS ;
+        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
       fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - if test -n "$LD_JOBS";
       then
@@ -119,7 +119,7 @@ build-system-ubuntu:
     job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-fdt=system --enable-slirp=system
+    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -443,7 +443,7 @@ build-user-centos7:
     job: amd64-centos7-container
   variables:
     IMAGE: centos7
-    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
+    CONFIGURE_ARGS: --disable-system --disable-tools
     MAKE_CHECK_ARGS: check-tcg
 
 build-some-softmmu-plugins:
@@ -607,7 +607,7 @@ tsan-build:
     job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
+    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
           --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
@@ -619,7 +619,7 @@ build-deprecated:
     job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-docs --disable-tools
+    CONFIGURE_ARGS: --disable-tools
     MAKE_CHECK_ARGS: build-tcg
     TARGETS: ppc64abi32-linux-user lm32-softmmu unicore32-softmmu
   artifacts:
-- 
2.20.1


