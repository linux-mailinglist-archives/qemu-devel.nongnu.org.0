Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5039220A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:29:38 +0200 (CEST)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm15t-0000ov-Jl
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vW-000295-60
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:18:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vU-0008Er-JH
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:18:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so1382890wmk.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7R9KU2v40J4HPku0X26Zmix7Qt6Ns1y6ik1H3mrzsY=;
 b=NDdkL0qirTCXNoqUBOIGHfeTEaR7oJk3JYbkRptjgFvzROBtE5GMwRIXloG13OG5sF
 q8va0AHWv5YuI8RgnlxfU9L4u+JWhyyuIW7Jb9/ASVaO1Fh5IXtvu52/c/3NVF9/juqy
 GvQyjFt3a7cmE5pxZsuTk+YGsuh1FjmyLHx6+hxIbUWHXCNApLiBEFm42joBik+bYROU
 nl13ume1Rj2NCnb8VU0mfPTZw/rTZXybVjZBWPGE9TFhZAGF6rTemrMzdyvRXDldvG96
 0mvL3PazGVhqAmTTJHso4rupGrpTFgTklPYQBcWmwCFmSYLRR5sqEdqbVRPfICAOysGt
 CtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y7R9KU2v40J4HPku0X26Zmix7Qt6Ns1y6ik1H3mrzsY=;
 b=hPOcD6F8w/DHh/pqP8QnU/BUOW2NFyZ+AzZqkTInxUB6ecNtVdhW5Y3A4v07LkJX/u
 X/DXnhYNC7HbndiHshjiqqOKMVwyyFTISP/5h3J4ncHhXYH88cAQx/RJlh7wdT1zbqGs
 jc/RpIU2fxx2UNFaBVof82KS+ImL3I/ME1Tx5Ca0ZbMHuGHVlowgn6d90xO177BFSP83
 L2i0W4Un6TEpvxa1jX+BQ0+ZJLMmO+pEiubJdfFN6yYHAsArxbB4Oke2sM6ijnb7ZKXi
 1QsgIuUrhJDllDYH+cBHfGwi6eFri2dCyUCHrg8ZEycsIjgUJ5Zn0fFFZ5P+Ysnxi8Xi
 24GA==
X-Gm-Message-State: AOAM531j42vZj93244M25NCMxpFHfN9FuwgzNK9KyFyGINtazTdDtKa5
 Ixl9lFdJBPo9qFJ/r1GLwQB3U4tRmVFnwA==
X-Google-Smtp-Source: ABdhPJzigUGF7fOctFCngK5QZumFEICvPPQxrQbZhQOALWlFDB82l4JCfUoQApXtAOz0CPzkDmg+6A==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr5107047wmc.172.1622063931028; 
 Wed, 26 May 2021 14:18:51 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l7sm262994wmq.22.2021.05.26.14.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:18:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/19] gitlab: Rename ACCEL_CONFIGURE_OPTS to
 EXTRA_CONFIGURE_OPTS
Date: Wed, 26 May 2021 23:18:21 +0200
Message-Id: <20210526211838.421716-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210502235727.1979457-26-richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/crossbuilds.yml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index e44e4b49a25..2198abb400e 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -16,7 +16,7 @@
 #
 # Set the $ACCEL variable to select the specific accelerator (default to
 # KVM), and set extra options (such disabling other accelerators) via the
-# $ACCEL_CONFIGURE_OPTS variable.
+# $EXTRA_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -26,7 +26,7 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
+        --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
     - make -j$(expr $(nproc) + 1) all check-build
 
 .cross_user_build_job:
@@ -174,7 +174,7 @@ cross-s390x-kvm-only:
     job: s390x-debian-cross-container
   variables:
     IMAGE: debian-s390x-cross
-    ACCEL_CONFIGURE_OPTS: --disable-tcg
+    EXTRA_CONFIGURE_OPTS: --disable-tcg
 
 cross-mips64el-kvm-only:
   extends: .cross_accel_build_job
@@ -182,7 +182,7 @@ cross-mips64el-kvm-only:
     job: mips64el-debian-cross-container
   variables:
     IMAGE: debian-mips64el-cross
-    ACCEL_CONFIGURE_OPTS: --disable-tcg --target-list=mips64el-softmmu
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --target-list=mips64el-softmmu
 
 cross-win32-system:
   extends: .cross_system_build_job
@@ -205,7 +205,7 @@ cross-amd64-xen-only:
   variables:
     IMAGE: debian-amd64-cross
     ACCEL: xen
-    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
 
 cross-arm64-xen-only:
   extends: .cross_accel_build_job
@@ -214,4 +214,4 @@ cross-arm64-xen-only:
   variables:
     IMAGE: debian-arm64-cross
     ACCEL: xen
-    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
-- 
2.26.3


