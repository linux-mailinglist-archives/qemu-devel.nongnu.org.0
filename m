Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539647C43F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:54:57 +0100 (CET)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziPY-0008SV-Bo
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIj-0008Gk-0Q
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:45 -0500
Received: from [2607:f8b0:4864:20::42a] (port=39527
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIh-0007aQ-8D
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:44 -0500
Received: by mail-pf1-x42a.google.com with SMTP id s15so1736663pfk.6
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kxu2jc1N0XAW22KzYj/CQSmUBlnyGwSKAlOvz/imWBo=;
 b=y0nHkSbil/DVwbssdDx6ugkFBI4T04HpsQQUDS6qOUVeZptIbWAzdmEp7YR2rvqsg2
 h8h8fXlK9xgZVTvXTpJonuL8Wtw3hvyIIVqGiwsNyuB8UlaoLcglk1FaIjVtkFlNSp43
 vDxxpa07Dl40gQIp2AtpCxaUFgy2L3xZQBmKr55/e/9fMW/1mAm+fjbPi5gGH6xsvvtF
 3hGf6LLlyEVu4wqZ7RNNKQgRSG4chB0YLcrIAUbo3Z7g9YvB2sJUi4smnTfwG0BmNdaW
 4ExHOchPIoA+4rkbybn7+8A2TvgBMMjhAOXYK3Tp0h+96IAmK4C9jhDGq9qJHgSTCyHx
 XVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kxu2jc1N0XAW22KzYj/CQSmUBlnyGwSKAlOvz/imWBo=;
 b=lsn429HdxUPs/I/qg+9PHtvbDrHKTPd8NxNywW3eBdvzJ9wj18mqoulKHHCD6G/sqb
 LQ27UpXncDOT9JOZc8YUASSTADa80gOnjGKRr5rQvVnc/Upc7dLyoCTrtEHMeN9yTvXJ
 ZnxYrGit3ln1QSIBhaU2jzgP3haea0Uk1THzr+JtGxuPqSYhEPVqFccZM6xuEu2boj70
 dWFjC1YN9iRXRT+pX/tGB2Cehjm+tYSsSr3eDqoxX8P55jFpwHFLVzr/U/eJR0S8FAEw
 t/5XvuTBGGy4xH+3z+rQIjAOKra7jS0R6bGRR/nwK0mrGcDr2myiaBM1XdsAZFyMzvsk
 RAgg==
X-Gm-Message-State: AOAM533dI+bqX+L6Y4YkQW+jv2s5zQmdIrs77D3eF5qPoah8tE9UXXpq
 dTApuhu+6pGlEeWQa1hExpcwzPzsbpVz3w==
X-Google-Smtp-Source: ABdhPJzTUZhJgDye7zXtTx+e7jYWRvJbNeocZSlA7ZIoc7TzUCIdl0EPDa5PemSRqk0l5VfVqWkWHw==
X-Received: by 2002:a63:4a5f:: with SMTP id j31mr3681554pgl.222.1640105261919; 
 Tue, 21 Dec 2021 08:47:41 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/31] tcg/loongarch64: Add the tcg-target.h file
Date: Tue, 21 Dec 2021 08:47:09 -0800
Message-Id: <20211221164737.1076007-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Support for all optional TCG ops are initially marked disabled; the bits
are to be set in individual commits later.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-4-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.h | 180 +++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 tcg/loongarch64/tcg-target.h

diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
new file mode 100644
index 0000000000..25328646f0
--- /dev/null
+++ b/tcg/loongarch64/tcg-target.h
@@ -0,0 +1,180 @@
+/*
+ * Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * Based on tcg/riscv/tcg-target.h
+ *
+ * Copyright (c) 2018 SiFive, Inc
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef LOONGARCH_TCG_TARGET_H
+#define LOONGARCH_TCG_TARGET_H
+
+/*
+ * Loongson removed the (incomplete) 32-bit support from kernel and toolchain
+ * for the initial upstreaming of this architecture, so don't bother and just
+ * support the LP64* ABI for now.
+ */
+#if defined(__loongarch64)
+# define TCG_TARGET_REG_BITS 64
+#else
+# error unsupported LoongArch register size
+#endif
+
+#define TCG_TARGET_INSN_UNIT_SIZE 4
+#define TCG_TARGET_NB_REGS 32
+#define MAX_CODE_GEN_BUFFER_SIZE  SIZE_MAX
+
+typedef enum {
+    TCG_REG_ZERO,
+    TCG_REG_RA,
+    TCG_REG_TP,
+    TCG_REG_SP,
+    TCG_REG_A0,
+    TCG_REG_A1,
+    TCG_REG_A2,
+    TCG_REG_A3,
+    TCG_REG_A4,
+    TCG_REG_A5,
+    TCG_REG_A6,
+    TCG_REG_A7,
+    TCG_REG_T0,
+    TCG_REG_T1,
+    TCG_REG_T2,
+    TCG_REG_T3,
+    TCG_REG_T4,
+    TCG_REG_T5,
+    TCG_REG_T6,
+    TCG_REG_T7,
+    TCG_REG_T8,
+    TCG_REG_RESERVED,
+    TCG_REG_S9,
+    TCG_REG_S0,
+    TCG_REG_S1,
+    TCG_REG_S2,
+    TCG_REG_S3,
+    TCG_REG_S4,
+    TCG_REG_S5,
+    TCG_REG_S6,
+    TCG_REG_S7,
+    TCG_REG_S8,
+
+    /* aliases */
+    TCG_AREG0    = TCG_REG_S0,
+    TCG_REG_TMP0 = TCG_REG_T8,
+    TCG_REG_TMP1 = TCG_REG_T7,
+    TCG_REG_TMP2 = TCG_REG_T6,
+} TCGReg;
+
+/* used for function call generation */
+#define TCG_REG_CALL_STACK              TCG_REG_SP
+#define TCG_TARGET_STACK_ALIGN          16
+#define TCG_TARGET_CALL_ALIGN_ARGS      1
+#define TCG_TARGET_CALL_STACK_OFFSET    0
+
+/* optional instructions */
+#define TCG_TARGET_HAS_movcond_i32      0
+#define TCG_TARGET_HAS_div_i32          0
+#define TCG_TARGET_HAS_rem_i32          0
+#define TCG_TARGET_HAS_div2_i32         0
+#define TCG_TARGET_HAS_rot_i32          0
+#define TCG_TARGET_HAS_deposit_i32      0
+#define TCG_TARGET_HAS_extract_i32      0
+#define TCG_TARGET_HAS_sextract_i32     0
+#define TCG_TARGET_HAS_extract2_i32     0
+#define TCG_TARGET_HAS_add2_i32         0
+#define TCG_TARGET_HAS_sub2_i32         0
+#define TCG_TARGET_HAS_mulu2_i32        0
+#define TCG_TARGET_HAS_muls2_i32        0
+#define TCG_TARGET_HAS_muluh_i32        0
+#define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_ext8s_i32        0
+#define TCG_TARGET_HAS_ext16s_i32       0
+#define TCG_TARGET_HAS_ext8u_i32        0
+#define TCG_TARGET_HAS_ext16u_i32       0
+#define TCG_TARGET_HAS_bswap16_i32      0
+#define TCG_TARGET_HAS_bswap32_i32      0
+#define TCG_TARGET_HAS_not_i32          0
+#define TCG_TARGET_HAS_neg_i32          0
+#define TCG_TARGET_HAS_andc_i32         0
+#define TCG_TARGET_HAS_orc_i32          0
+#define TCG_TARGET_HAS_eqv_i32          0
+#define TCG_TARGET_HAS_nand_i32         0
+#define TCG_TARGET_HAS_nor_i32          0
+#define TCG_TARGET_HAS_clz_i32          0
+#define TCG_TARGET_HAS_ctz_i32          0
+#define TCG_TARGET_HAS_ctpop_i32        0
+#define TCG_TARGET_HAS_direct_jump      0
+#define TCG_TARGET_HAS_brcond2          0
+#define TCG_TARGET_HAS_setcond2         0
+#define TCG_TARGET_HAS_qemu_st8_i32     0
+
+/* 64-bit operations */
+#define TCG_TARGET_HAS_movcond_i64      0
+#define TCG_TARGET_HAS_div_i64          0
+#define TCG_TARGET_HAS_rem_i64          0
+#define TCG_TARGET_HAS_div2_i64         0
+#define TCG_TARGET_HAS_rot_i64          0
+#define TCG_TARGET_HAS_deposit_i64      0
+#define TCG_TARGET_HAS_extract_i64      0
+#define TCG_TARGET_HAS_sextract_i64     0
+#define TCG_TARGET_HAS_extract2_i64     0
+#define TCG_TARGET_HAS_extrl_i64_i32    0
+#define TCG_TARGET_HAS_extrh_i64_i32    0
+#define TCG_TARGET_HAS_ext8s_i64        0
+#define TCG_TARGET_HAS_ext16s_i64       0
+#define TCG_TARGET_HAS_ext32s_i64       0
+#define TCG_TARGET_HAS_ext8u_i64        0
+#define TCG_TARGET_HAS_ext16u_i64       0
+#define TCG_TARGET_HAS_ext32u_i64       0
+#define TCG_TARGET_HAS_bswap16_i64      0
+#define TCG_TARGET_HAS_bswap32_i64      0
+#define TCG_TARGET_HAS_bswap64_i64      0
+#define TCG_TARGET_HAS_not_i64          0
+#define TCG_TARGET_HAS_neg_i64          0
+#define TCG_TARGET_HAS_andc_i64         0
+#define TCG_TARGET_HAS_orc_i64          0
+#define TCG_TARGET_HAS_eqv_i64          0
+#define TCG_TARGET_HAS_nand_i64         0
+#define TCG_TARGET_HAS_nor_i64          0
+#define TCG_TARGET_HAS_clz_i64          0
+#define TCG_TARGET_HAS_ctz_i64          0
+#define TCG_TARGET_HAS_ctpop_i64        0
+#define TCG_TARGET_HAS_add2_i64         0
+#define TCG_TARGET_HAS_sub2_i64         0
+#define TCG_TARGET_HAS_mulu2_i64        0
+#define TCG_TARGET_HAS_muls2_i64        0
+#define TCG_TARGET_HAS_muluh_i64        0
+#define TCG_TARGET_HAS_mulsh_i64        0
+
+/* not defined -- call should be eliminated at compile time */
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+
+#define TCG_TARGET_DEFAULT_MO (0)
+
+#ifdef CONFIG_SOFTMMU
+#define TCG_TARGET_NEED_LDST_LABELS
+#endif
+
+#define TCG_TARGET_HAS_MEMORY_BSWAP 0
+
+#endif /* LOONGARCH_TCG_TARGET_H */
-- 
2.25.1


