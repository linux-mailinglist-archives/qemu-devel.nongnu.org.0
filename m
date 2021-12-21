Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9057B47C43E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:54:44 +0100 (CET)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziPT-0008Qc-NM
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIp-0008MI-1I
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:51 -0500
Received: from [2607:f8b0:4864:20::102c] (port=35839
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIj-0007as-3U
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:46 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso3156404pji.0
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZMFGlzlAMRYV/UR7JxBV1nelVYIW0dbJHkficncfnY=;
 b=jHvsVAXWGx/YvGZuCWnetVMcnm8llRohA+bupLNZM95+QQqxJiU1etpDLyihAma45u
 TZAvUjJw/FgdlKs4kJOtmb+Za9s75EPj3+U645lp8KvVwelfOCZIJTpDLvmL98S9BfDQ
 8KNv4UQ+di0r/H3MN62nMgAb7lAJI6WUz0B3Rx2hkt0tF94vkYEc1cCUbW/n2mY+evPo
 oXF0FJ3iHZpp+37O+IYX0G95O69WgAyYR9c+3cDi+0hJcTV/yQFxK8NS5NMG8h4yYV+q
 +J4N2KxO0pkBzmvu5bwIDgqDsCUvHCjQ+ZOVWjCMHSJebC9+oZPpS/X6QBJP2Z0dvlT8
 Zi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZMFGlzlAMRYV/UR7JxBV1nelVYIW0dbJHkficncfnY=;
 b=ZhNve1vzC83TVCG32Hxu54t+rdqnD9mm8mHt84l6hYy6EmXyOvroncacFzjXWBPoL5
 0TWKFgRsQjalxZkQI3HaAOBTLrVJrlWB77VOC0Q4yU+NGACz5e/hIVKWFw8SYtNiq+wJ
 8bg8AWbicgLVYlt89/zSdIaLOh2vdU2Esmbg3yGvVzACMYxlJ47wK/d+pluZfuQXPd83
 JhwG6pghUKds1S1BwabGlWND78lBqfUu4/W3fWZspowTbldsfqH+pYk4xrYaybBV9SdZ
 sf4x+qkGz2MbgvnKJ48ybXgkMdNVVvOo0aYoJ1hAnOA8QfjzyWxFYfgZSx+4Q9vLDVL0
 /HFA==
X-Gm-Message-State: AOAM530FHrab4U1hGA2sEa8GjJkhA7EiqjEZT36XiT7YUPWoFhJbJmPz
 uoJ+g8eoX1TyFQk1MGz1uc4aYVsPIxNpdg==
X-Google-Smtp-Source: ABdhPJyHWhw5k7HlF6BetJ0xYwz+cvspWZuZ63CfGNgG0RYHlOYWBOr7s2zQiqBUD/x/Sw4v7/Yfqg==
X-Received: by 2002:a17:902:6b46:b0:142:8470:862e with SMTP id
 g6-20020a1709026b4600b001428470862emr3704981plt.49.1640105263781; 
 Tue, 21 Dec 2021 08:47:43 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/31] tcg/loongarch64: Add register names,
 allocation order and input/output sets
Date: Tue, 21 Dec 2021 08:47:11 -0800
Message-Id: <20211221164737.1076007-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-6-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 118 +++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 tcg/loongarch64/tcg-target.c.inc

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
new file mode 100644
index 0000000000..653ef0a4bb
--- /dev/null
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -0,0 +1,118 @@
+/*
+ * Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * Based on tcg/riscv/tcg-target.c.inc
+ *
+ * Copyright (c) 2018 SiFive, Inc
+ * Copyright (c) 2008-2009 Arnaud Patard <arnaud.patard@rtp-net.org>
+ * Copyright (c) 2009 Aurelien Jarno <aurelien@aurel32.net>
+ * Copyright (c) 2008 Fabrice Bellard
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
+#ifdef CONFIG_DEBUG_TCG
+static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
+    "zero",
+    "ra",
+    "tp",
+    "sp",
+    "a0",
+    "a1",
+    "a2",
+    "a3",
+    "a4",
+    "a5",
+    "a6",
+    "a7",
+    "t0",
+    "t1",
+    "t2",
+    "t3",
+    "t4",
+    "t5",
+    "t6",
+    "t7",
+    "t8",
+    "r21", /* reserved in the LP64* ABI, hence no ABI name */
+    "s9",
+    "s0",
+    "s1",
+    "s2",
+    "s3",
+    "s4",
+    "s5",
+    "s6",
+    "s7",
+    "s8"
+};
+#endif
+
+static const int tcg_target_reg_alloc_order[] = {
+    /* Registers preserved across calls */
+    /* TCG_REG_S0 reserved for TCG_AREG0 */
+    TCG_REG_S1,
+    TCG_REG_S2,
+    TCG_REG_S3,
+    TCG_REG_S4,
+    TCG_REG_S5,
+    TCG_REG_S6,
+    TCG_REG_S7,
+    TCG_REG_S8,
+    TCG_REG_S9,
+
+    /* Registers (potentially) clobbered across calls */
+    TCG_REG_T0,
+    TCG_REG_T1,
+    TCG_REG_T2,
+    TCG_REG_T3,
+    TCG_REG_T4,
+    TCG_REG_T5,
+    TCG_REG_T6,
+    TCG_REG_T7,
+    TCG_REG_T8,
+
+    /* Argument registers, opposite order of allocation.  */
+    TCG_REG_A7,
+    TCG_REG_A6,
+    TCG_REG_A5,
+    TCG_REG_A4,
+    TCG_REG_A3,
+    TCG_REG_A2,
+    TCG_REG_A1,
+    TCG_REG_A0,
+};
+
+static const int tcg_target_call_iarg_regs[] = {
+    TCG_REG_A0,
+    TCG_REG_A1,
+    TCG_REG_A2,
+    TCG_REG_A3,
+    TCG_REG_A4,
+    TCG_REG_A5,
+    TCG_REG_A6,
+    TCG_REG_A7,
+};
+
+static const int tcg_target_call_oarg_regs[] = {
+    TCG_REG_A0,
+    TCG_REG_A1,
+};
-- 
2.25.1


