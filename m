Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CE12F4E4D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:16:47 +0100 (CET)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzht8-0007D5-W5
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqk-0005SA-SV
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqj-0008UJ-0W
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id n16so3807754wmc.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHG6iE5XpiFzundF/bz1yqHKc9e6/PGKTf+tg0nbrXM=;
 b=QQfwcpiI3AUDYvnARVqLRLDkO558uEcdWlxpmmBPftlvcuUXyvbkfDoxL0jmplPKq5
 MzWIZK6GHVf3CEL8koBKPNfx0ID+zC0uRRSuOlCvhvF9cuirhHlM+A41LzUNpRC3huxB
 H8FfobcMr75O12f6n+jqp1yOtcMzEIdY6sp2JUXbaKdztsvUOT0vQeTd2TrWVOdhGtqM
 u719JGVJHAcEeEW30PBVIetGGvXlBc/bQjQ78PkR+5yO231tBW94yWIA1M/VfvmNFLGO
 1ABPKDEGSnJ8fYwfg7pPfPRfVwCuSeRcEyRUZ1klZECs2gixjVvskmqm+Y32R365KKxx
 cRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sHG6iE5XpiFzundF/bz1yqHKc9e6/PGKTf+tg0nbrXM=;
 b=IumKKmf5YYzhptATIxf6L7+zyFy98GmwEpKtwmPhZ3OqKbtigHh0nnnLzRdIz6FJcJ
 99XMs2hx84KFwiAOo3D0b/7ywds/yjfEev0gbKOw5j7hUFfpTIEMeWJkP3NOQp2DPYPy
 bxQZ7VOEvLoYiqfqLznyzR6KIic0AvwvLhdWXiyKxlRfUeUSOsi1Pa2binSA9/TOW7UC
 xRnAM6bu0PxV2UGSTYmt6lG/jHIifcrAEz7ojnrVeCFNqyxbmnFyz9Doetc6PCfaoTrs
 odReWypXs3ErWE/RsbDBKw6esn3FiMrC5PNfKMgAYGJxnxN0eqA2FuDVoWH26kS9QiYW
 Xeig==
X-Gm-Message-State: AOAM533RcrgZ+0mW47bqZAyKlQtsInf1hju8gX1t63Z1wrbEz8HbvDc+
 ysVwAbagrWy+5avRkV7BSZ0KqA==
X-Google-Smtp-Source: ABdhPJw7B8V9uEqcMJk+AeaQ+a7VqLRoDBm5RWRCS0tkikJ5NkmZe/stGqPnxGgAJW+ecPvfBP2kIw==
X-Received: by 2002:a1c:7f8c:: with SMTP id a134mr2679950wmd.184.1610550855730; 
 Wed, 13 Jan 2021 07:14:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h187sm3259760wmf.30.2021.01.13.07.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5B331FF8F;
 Wed, 13 Jan 2021 15:14:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/9] shippable.yml: Remove jobs duplicated on Gitlab-CI
Date: Wed, 13 Jan 2021 15:14:02 +0000
Message-Id: <20210113151408.27939-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following jobs are duplicated on Gitlab-CI since commit
6bcb5fc0f7a ("gitlab-ci: Add cross-compiling build tests"):

- IMAGE=debian-armel-cross

  TARGET_LIST=arm-softmmu               -> cross-armel-system
  TARGET_LIST=arm-linux-user            -> cross-armel-user
  TARGET_LIST=armeb-linux-user          -> cross-armel-user

- IMAGE=debian-armhf-cross

  TARGET_LIST=arm-softmmu               -> cross-armhf-system
  TARGET_LIST=arm-linux-user            -> cross-armhf-user
  TARGET_LIST=armeb-linux-user          -> cross-armhf-user

- IMAGE=debian-arm64-cross

  TARGET_LIST=aarch64-softmmu           -> cross-arm64-system
  TARGET_LIST=aarch64-linux-user        -> cross-arm64-user

- IMAGE=debian-s390x-cross

  TARGET_LIST=s390x-softmmu             -> cross-s390x-system
  TARGET_LIST=s390x-linux-user          -> cross-s390x-user

- IMAGE=debian-mips-cross

  TARGET_LIST=mipsel-linux-user         -> cross-mips-user

- IMAGE=debian-mips64el-cross

  TARGET_LIST=mips64el-softmmu          -> cross-mips64el-system
  TARGET_LIST=mips64el-linux-user       -> cross-mips64el-user

- IMAGE=debian-ppc64el-cross

  TARGET_LIST=ppc64-softmmu             -> cross-ppc64el-system
  TARGET_LIST=ppc64-linux-user          -> cross-ppc64el-user
  TARGET_LIST=ppc64abi32-linux-user     -> cross-ppc64el-user

Remove them from Shippable CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210108145103.269353-1-f4bug@amsat.org>
---
 .shippable.yml | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/.shippable.yml b/.shippable.yml
index 14350e6de8..97bfa2a0f3 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -7,20 +7,8 @@ env:
   matrix:
     - IMAGE=debian-amd64
       TARGET_LIST=x86_64-softmmu,x86_64-linux-user
-    - IMAGE=debian-armel-cross
-      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
-    - IMAGE=debian-armhf-cross
-      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
-    - IMAGE=debian-arm64-cross
-      TARGET_LIST=aarch64-softmmu,aarch64-linux-user
-    - IMAGE=debian-s390x-cross
-      TARGET_LIST=s390x-softmmu,s390x-linux-user
     - IMAGE=debian-mips-cross
-      TARGET_LIST=mips-softmmu,mipsel-linux-user
-    - IMAGE=debian-mips64el-cross
-      TARGET_LIST=mips64el-softmmu,mips64el-linux-user
-    - IMAGE=debian-ppc64el-cross
-      TARGET_LIST=ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
+      TARGET_LIST=mips-softmmu
 build:
   pre_ci_boot:
     image_name: registry.gitlab.com/qemu-project/qemu/qemu/${IMAGE}
-- 
2.20.1


