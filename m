Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F55657298D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:57:42 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOp3-0004T0-8d
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBP-0007VL-LB
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:44 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBO-0002Tm-63
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:43 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o19-20020a05600c511300b003a2de48b4bbso181485wms.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBc9V+yOG3dBwW/jvrYjFLsdaX8yGI4FNvVQk/4l+Qo=;
 b=LRc5gfsSv4Rqe9JiXV8l7R6YVLb7yRkViWWW1+euONgGfDBz/cVsNOXTX1WYctddgf
 3NN+yHMVqCVIL3QufBHnJIR7m8S/hXSvxyvrmwmDQdplSwIovWeKvzH8wj4Yok0cIF0d
 EfrqBkG6HwvbaIsFnpmMkn5dQURk88oQNB1zRuwe0feZPBvTABypJWduEnT98sgE9D/9
 b8TD/kySTR8yb9i27NMGpB6jee7X8ro+N3OQyIoCUGFyRpDS+8z1NLpDIHBvcXlvM5Qk
 WSVQJFuPlY9lYkbv0nBjxmsAkDDCAwULolueAeterEOzGypQN8E2pXrZC6+u4zqZs0Nl
 7/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wBc9V+yOG3dBwW/jvrYjFLsdaX8yGI4FNvVQk/4l+Qo=;
 b=oUQhlndQUgcK1rxV3RtG82jsNuCiOpRdzimwvKwXpyXUKDuK6KgcjwWC/GBlk6ABoP
 7Uim1vaQzyak2n3OEYQvSIShMmxtTfesZBXNP0pA0lY4h3ruoB50GKz5znZ3xVEGy3Bk
 Ogld79nqZYvF4tw7iZB7/8WdZVk9i2h4b1vxvADnSNITeCQ1WVv6RB86emhcF5X/oHpy
 HBWqu0GTHVw9HgzOxcPlBxigu8OyYB8sQMLJco2eA0gVSWF2QyGY1DBuLwDVX1hDaMtT
 aB9XPUI/rT7EP90KsOWSx/PhmdC170rpTRbFQrMY8WE5iBWArsTa0Gg8pVaPiS8sg05M
 c87Q==
X-Gm-Message-State: AJIora9IFE17xZEI3AM7M9X7fk8ueYBK7dmxYzua/bK8d4tV7gexTmQ9
 m0ml+Lo/8/v3O1AqN9QTBolWfwqWNJpexjSO
X-Google-Smtp-Source: AGRyM1sCv6j8tL0UKtLepwDH9NppIxuManWOUt2qhxUoHSeGha6+0C1+HM7BfE8/eTu6Y9bOhKEgRQ==
X-Received: by 2002:a05:600c:2946:b0:3a2:e11f:ce4 with SMTP id
 n6-20020a05600c294600b003a2e11f0ce4mr6224924wmd.186.1657664200060; 
 Tue, 12 Jul 2022 15:16:40 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b0021d9d13bf6csm7859060wrs.97.2022.07.12.15.16.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 15:16:39 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/5] configure: Restrict TCG to emulation
Date: Wed, 13 Jul 2022 00:16:04 +0200
Message-Id: <20220712221607.9933-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712221607.9933-1-f4bug@amsat.org>
References: <20220712221607.9933-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

If we don't need to emulate any target, we certainly don't need TCG.

This should also help to compile again with
 ".../configure --enable-tools --disable-system --disable-user"
on systems that do not have a TCG backend.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[thuth: Re-arranged the code, remove check-softfloat from buildtest.yml]
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220706153816.768143-1-thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml |  2 +-
 configure                  | 20 ++++++++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8a4353ef93..1931b77b49 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -599,7 +599,7 @@ build-tools-and-docs-debian:
     optional: true
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
+    MAKE_CHECK_ARGS: check-unit ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
     QEMU_JOB_PUBLISH: 1
   artifacts:
diff --git a/configure b/configure
index e8cc850727..465c5000ee 100755
--- a/configure
+++ b/configure
@@ -329,7 +329,7 @@ fi
 fdt="auto"
 
 # 2. Automatically enable/disable other options
-tcg="enabled"
+tcg="auto"
 cfi="false"
 
 # parse CC options second
@@ -1409,11 +1409,6 @@ EOF
   fi
 fi
 
-if test "$tcg" = "enabled"; then
-    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
-    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
-fi
-
 if test -z "${target_list+xxx}" ; then
     default_targets=yes
     for target in $default_target_list; do
@@ -1444,6 +1439,19 @@ case " $target_list " in
   ;;
 esac
 
+if test "$tcg" = "auto"; then
+  if test -z "$target_list"; then
+    tcg="disabled"
+  else
+    tcg="enabled"
+  fi
+fi
+
+if test "$tcg" = "enabled"; then
+    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
+    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
+fi
+
 feature_not_found() {
   feature=$1
   remedy=$2
-- 
2.36.1


