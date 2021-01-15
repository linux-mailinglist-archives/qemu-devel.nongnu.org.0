Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED8C2F8745
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:10:56 +0100 (CET)
Received: from localhost ([::1]:55164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WMx-0000ig-DG
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHT-0003oT-Dq
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:15 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHR-0004Df-KC
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:15 -0500
Received: by mail-pf1-x431.google.com with SMTP id h186so6270365pfe.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1zhX9HoNCoqNSfA3lKM1uK/iJZZfElVtea9UqcV1b+A=;
 b=bewR34zvbhIcib2KhT3xVv+1ckvBNJAr1XTQZy0tgZJMbLlYtaNuJ4+zKls4Cj5QeG
 n63WRfsUsXoFcqDtxFGFz3NM+j7vksWl1J6aokQ5HRd9pyzN30YDnXs0oNnZYFfopvE9
 Z7YAqw+u4kjQtNvF71bR0EW3hSUPBY/Pvzd70M0ycxKpC8BSB+vP0xXSzFIBWFnSmGWV
 U4Ic+D6l+fcHi/nkwPqRsG7H/M/b1FoySb54qDFefzGMzRJVrYlsMEf0+FKtwXZ3VIw6
 So+ejdJzoujxD2c2jtDBWJAbq1XjlK33IK72SnJN7TmBszX03n7OYfd9hT4/DeWqDeW4
 h1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zhX9HoNCoqNSfA3lKM1uK/iJZZfElVtea9UqcV1b+A=;
 b=HR1aIve7Cjll+c6IN6wIt6WxUp3D+StO3pR0mJF32ZlP3IuwaAC8TBS+RjScBWsEMI
 Pzz1xiWMWErvbKV8c96RfxtQQnFrXXoyKVDawY1qHShmcl9yv4GNlb8zKnNBbu44Ekj4
 m1HtRkvXZElc3u1ThPQ+rx6cil+7zc1B6TQp0XNqwT9uCQjbReGf3bpFzbLCDeVytWeg
 R6xl9W6zD/f8yhju5TF3jKQA17ttNPAHkR3qyMawZBo676JqcX/L90S37ZIgbOYo6aIP
 IVBj5Yu4zq4aSUPoVksP0/eGKPKYsRQfUrl8oRYE+BEJmfl7zIXln/twT8iDWBZbA2gR
 z8zQ==
X-Gm-Message-State: AOAM530GD2ZD6dSTW1KUmH5dhuiy5P6hq6X1gdASXEvet4LK0QMoiiKT
 tQ1MK6VGXL5EtN9momF7I4jKYl5jwYbD2c0v
X-Google-Smtp-Source: ABdhPJw+X+SDB4LX2CHwGO6g55PN8p36y1i5fe+ipC7Wpt0ylwmE0hhPxXwHyCzaxjo+5OinGHxQSw==
X-Received: by 2002:a62:7586:0:b029:19d:9ba9:c1bd with SMTP id
 q128-20020a6275860000b029019d9ba9c1bdmr14334521pfc.27.1610744712347; 
 Fri, 15 Jan 2021 13:05:12 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/22] tcg/riscv: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 15 Jan 2021 11:04:43 -1000
Message-Id: <20210115210456.1053477-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-str.h | 21 ++++++++++++++
 tcg/riscv/tcg-target.h         |  1 +
 tcg/riscv/tcg-target.c.inc     | 50 ++++++++--------------------------
 3 files changed, 33 insertions(+), 39 deletions(-)
 create mode 100644 tcg/riscv/tcg-target-con-str.h

diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
new file mode 100644
index 0000000000..587fcd3593
--- /dev/null
+++ b/tcg/riscv/tcg-target-con-str.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define RISC-V target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_QLDST_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_S12)
+CONST('N', TCG_CT_CONST_N12)
+CONST('M', TCG_CT_CONST_M12)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 727c8df418..daf3ef7b5c 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -171,5 +171,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 71c0badc02..185b569f4b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -122,6 +122,17 @@ static const int tcg_target_call_oarg_regs[] = {
 #define TCG_CT_CONST_N12   0x400
 #define TCG_CT_CONST_M12   0x800
 
+#define ALL_GENERAL_REGS  0xffffffffu
+#ifdef CONFIG_SOFTMMU
+#define ALL_QLDST_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_A0) | (1 << TCG_REG_A1) | \
+                          (1 << TCG_REG_A2) | (1 << TCG_REG_A3) | \
+                          (1 << TCG_REG_A5)))
+#else
+#define ALL_QLDST_REGS   ALL_GENERAL_REGS
+#endif
+
+
 static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 {
     if (TCG_TARGET_REG_BITS == 32) {
@@ -131,45 +142,6 @@ static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
     }
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r':
-        ct->regs = 0xffffffff;
-        break;
-    case 'L':
-        /* qemu_ld/qemu_st constraint */
-        ct->regs = 0xffffffff;
-        /* qemu_ld/qemu_st uses TCG_REG_TMP0 */
-#if defined(CONFIG_SOFTMMU)
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[0]);
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[1]);
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[2]);
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[3]);
-        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[4]);
-#endif
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_S12;
-        break;
-    case 'N':
-        ct->ct |= TCG_CT_CONST_N12;
-        break;
-    case 'M':
-        ct->ct |= TCG_CT_CONST_M12;
-        break;
-    case 'Z':
-        /* we can use a zero immediate as a zero register argument. */
-        ct->ct |= TCG_CT_CONST_ZERO;
-        break;
-    default:
-        return NULL;
-    }
-    return ct_str;
-}
-
 /* test if a constant matches the constraint */
 static int tcg_target_const_match(tcg_target_long val, TCGType type,
                                   const TCGArgConstraint *arg_ct)
-- 
2.25.1


