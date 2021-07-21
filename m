Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C93D1784
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:07:38 +0200 (CEST)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IVF-0000ZB-Ft
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOK-0002xx-W4
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:31 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOH-0005qk-Jv
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:28 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 a17-20020a17090abe11b0290173ce472b8aso533557pjs.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJN2k5SJVEq9tPKHGr6/aHWCsTEx2Fk2u0dskQ4Nk1Y=;
 b=CKZc+AERNhFDelEz+YIZ8FT6VBQlFzwBReeyHf0pn44hKCtsLiYQGcY7Z62vNC8lL9
 mc/zNXW9Ydz3ClUMfHUGyksHx5tBaQszzTQ8IFPCsP0mQxj2Xnc+/4FkBpsWZ+G8WglL
 rziuHqlIugPFHzqe5H2tRwUElfcSsXElrYjcXPTT729x/1f1yiAvx0gvsCafI5VMliaK
 6AYFVCc4N4mQj69Q+SBKItH364U9/40Et9uAjQ9DHrEfVUwQOn/qWpvFm6PrjuclI/U5
 UuCNqh8962cgEohsR1nTvCA5q5ie9EXws5KkK4ZBOsmrnLN3Lm4Xd4ao28lo1X3sJYt8
 DU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJN2k5SJVEq9tPKHGr6/aHWCsTEx2Fk2u0dskQ4Nk1Y=;
 b=S+05t+JV9RmT4S49b0Xz23EBS67fMETogQk4bjvP/M8YogzHD5oShunnKjQc5HzUB8
 +Ren9W6iyM/2K3Z6TgvzatQcr+mh7i5BzwIAu8dJsUYIFaiOGcjEhg5wvP207sebzm6Y
 k4Ia9dlwtCJK9Ce4jiyhgaH0SkN1OZisEOGC1QbRUVuKNLLJkdxA4Lsh7SJ+9UW8gG+U
 G/gEbevaGbYLoVta7nvaNr5F4mGZPg30jtEJf/zAAHs3uTSLXVLXXdl0cQoAvhzHAc1l
 HhuLgUvmDYomFgmZAOEsK/T5lwBME/Gi1ZKALJ/xglOxG55aZxbAXEqmTSPlgkm9qIzQ
 lLbQ==
X-Gm-Message-State: AOAM530+9gB/dLY5Sg1U8LBx0YF8vhfPnD5CAnvfYonRG05Gq5068wQW
 dTpeFPlT1nPxFMuxHe5IgV2saEEhWRxRqQ==
X-Google-Smtp-Source: ABdhPJxWyRun/y/ri+jY+tZgM3kk6Dy1TW9aUGkSFTmmWJClT37YItTkzoHuQvpJ5RHqlWXS+mj71w==
X-Received: by 2002:aa7:8c47:0:b029:340:aa57:f65 with SMTP id
 e7-20020aa78c470000b0290340aa570f65mr22899786pfd.56.1626897623005; 
 Wed, 21 Jul 2021 13:00:23 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/27] target/arm: Implement debug_check_breakpoint
Date: Wed, 21 Jul 2021 09:59:46 -1000
Message-Id: <20210721195954.879535-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reuse the code at the bottom of helper_check_breakpoints,
which is what we currently call from *_tr_breakpoint_check.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 3 +++
 target/arm/cpu.c          | 1 +
 target/arm/cpu_tcg.c      | 1 +
 target/arm/debug_helper.c | 7 +++----
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3ba86e8af8..11a72013f5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -282,6 +282,9 @@ void hw_breakpoint_update(ARMCPU *cpu, int n);
  */
 void hw_breakpoint_update_all(ARMCPU *cpu);
 
+/* Callback function for checking if a breakpoint should trigger. */
+bool arm_debug_check_breakpoint(CPUState *cs);
+
 /* Callback function for checking if a watchpoint should trigger. */
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9cddfd6a44..752b15bb79 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1984,6 +1984,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .do_unaligned_access = arm_cpu_do_unaligned_access,
     .adjust_watchpoint_address = arm_adjust_watchpoint_address,
     .debug_check_watchpoint = arm_debug_check_watchpoint,
+    .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d2d97115ea..ed444bf436 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -911,6 +911,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .do_unaligned_access = arm_cpu_do_unaligned_access,
     .adjust_watchpoint_address = arm_adjust_watchpoint_address,
     .debug_check_watchpoint = arm_debug_check_watchpoint,
+    .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2ff72d47d1..4a0c479527 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -216,8 +216,9 @@ static bool check_watchpoints(ARMCPU *cpu)
     return false;
 }
 
-static bool check_breakpoints(ARMCPU *cpu)
+bool arm_debug_check_breakpoint(CPUState *cs)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     int n;
 
@@ -240,9 +241,7 @@ static bool check_breakpoints(ARMCPU *cpu)
 
 void HELPER(check_breakpoints)(CPUARMState *env)
 {
-    ARMCPU *cpu = env_archcpu(env);
-
-    if (check_breakpoints(cpu)) {
+    if (arm_debug_check_breakpoint(env_cpu(env))) {
         HELPER(exception_internal(env, EXCP_DEBUG));
     }
 }
-- 
2.25.1


