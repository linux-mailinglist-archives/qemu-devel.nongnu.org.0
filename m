Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F53039BF83
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:24:20 +0200 (CEST)
Received: from localhost ([::1]:37646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEUV-000437-6D
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET1-0000lQ-IQ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:47 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpESx-0000L7-3Q
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:47 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso8434059wmi.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FUsBx0TJprnzGFmcrQF1BJlipqIhjCqwyWs1QwVqKdE=;
 b=oV5RDrvNSAbsUtf5gqKc/5V9R99tlLG1WhiuoSlxkHsk7facSWO7BV9n9eAkqZBIqU
 CDrhWpjIdEBTJP9IrIQc4YLHPB6eeWI7vXui3ZweoQk4xCLo2dm+zzBq+/o3c/2GBwL4
 WdKiv3swS6QmOzCEHRqinnVKCHQiTp34jK5OOBec2K9IKCMcofjdK/aqfdZtPjMi+YG1
 vvjLwxVDiRhoxddoG6uz2riEfTyeJcaqfTtxjKxvkDCaew2Dk7ogU7GiV3ZhKrc5DDlK
 P7m/lDhSMEBPbCNeezVEXUjMJcO4N408zCnaYkdZKGDm7tR/cdWIUW2lwwBZ43xNJ5AO
 B4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FUsBx0TJprnzGFmcrQF1BJlipqIhjCqwyWs1QwVqKdE=;
 b=gSOmWo/Lw56jM2txa8N1q2eoin6eTwbaSC21blzsppDWKSigmQBbOpDbzEfwEfOzOs
 BLnQQ9U3wsVBe+6dB1dSLn5Sel5g1PPOp31Iz0vnOKzyVSNZox7t3ntTE7+u9Htoloah
 lhDyFhDqf/i/2ik5TwuYv1aTbpgz4fgW6YHlY/2OanvX78tCpo8m9Qd1l36s0bTJJPS1
 4aIN7BdlpvKetjwytjULycLVA5gNVN/e8yDybW6Ih1Qj4X8IdbbeutotCz+Y55iDzh3Q
 7OpeGL1iH+NIBg0W4l8/ktGDJqWhgarMCrnazJ00oa/qVRlponEXAsBPaWv7mgq5XL4/
 5GqQ==
X-Gm-Message-State: AOAM5304dxO8FnxfrWc+itLBoD9Worq0EOiCJGR/wadYsJPdvPwDsuaj
 HYKSrgYTFZP89lK9KTWchvCW6A==
X-Google-Smtp-Source: ABdhPJxqeeJp9ZounOIkwNB2tiqJAeAAtKpnDZ/PNTYNtbIDZRsSN12LcCmiyLul+kz7arS2U2CnHQ==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr5015358wmc.12.1622830961673; 
 Fri, 04 Jun 2021 11:22:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm6236678wmj.36.2021.06.04.11.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D2041FF90;
 Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 55/99] target/arm: move cpu_tcg to tcg/tcg-cpu-models.c
Date: Fri,  4 Jun 2021 16:52:28 +0100
Message-Id: <20210604155312.15902-56-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} | 7 +------
 target/arm/meson.build                         | 4 ----
 target/arm/tcg/meson.build                     | 1 +
 3 files changed, 2 insertions(+), 10 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} (99%)

diff --git a/target/arm/cpu_tcg.c b/target/arm/tcg/tcg-cpu-models.c
similarity index 99%
rename from target/arm/cpu_tcg.c
rename to target/arm/tcg/tcg-cpu-models.c
index 4606ad8436..91af2174a1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG CPUs.
+ * QEMU ARM TCG-only CPUs.
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -9,10 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
-#ifdef CONFIG_TCG
 #include "tcg/tcg-cpu.h"
-#endif /* CONFIG_TCG */
 #include "internals.h"
 #include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -24,7 +21,6 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#ifdef CONFIG_TCG
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -48,7 +44,6 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0ccd2fb0bc..8d0c12b2fc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -18,10 +18,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gdbstub64.c',
 ))
 
-arm_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cpu_tcg.c',
-))
-
 arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 4e690eea6c..5b36a13a24 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -32,6 +32,7 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'crypto_helper.c',
   'debug_helper.c',
   'tcg-cpu.c',
+  'tcg-cpu-models.c',
 
 ), if_false: files(
   'tcg-stubs.c',
-- 
2.20.1


