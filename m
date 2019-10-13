Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A29D550D
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Oct 2019 09:50:51 +0200 (CEST)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJYeQ-0002hu-IA
	for lists+qemu-devel@lfdr.de; Sun, 13 Oct 2019 03:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1iJYcB-0000eQ-PO
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 03:48:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1iJYcA-0008Hr-8f
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 03:48:31 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41136)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1iJYcA-0008HB-1Z
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 03:48:30 -0400
Received: by mail-wr1-x435.google.com with SMTP id p4so258013wrm.8
 for <qemu-devel@nongnu.org>; Sun, 13 Oct 2019 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sXgUfb/k+VBdpZH8pPaVua4ZrgGvG7BUVKKWHWPW/NE=;
 b=AY3J+EbHueZ251jh791SjOJ2X9QtgJN+7QEny+6zP11QmV8Z381oMoIBw/6Ily5g3n
 zor3r5rYka+RC1rkDiegUD1thNCai0LjSXOcR4+j+c+HqWA5AGYU/IfnmLlCUXEJFUge
 qSOJ89y6btDA/Go9t0h7D+FVO92SSpG+MxY9iqK5EXmYRhlrSBVI3xJ4ltuwOKOJB94Z
 90ol4TBWUfvJhpLSa8YTduFONNqg1r7b4f3H+YOZcQTsa5pqIF8ruE75KQVlpDPTnxwT
 LtI/SfC/NRdUIByOY6bNJaQZ545cf+nV2iEhsU9kdFS/VQu6ieMIABSU55dUfolEZjbs
 sFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sXgUfb/k+VBdpZH8pPaVua4ZrgGvG7BUVKKWHWPW/NE=;
 b=FtjCWbLun3fc6dfaPI5AxsnCcFfawp1o0yYz+cedjoeLzi3wiIEFV9DJgbADR2B2wd
 Ml0PDHH32GUeq73s7SgrEEA9EsugN3rvr5fb1rMHbNiM+Y6Wx/D6cnq7JW2abVbGnLi3
 izjQV8OP63E85Is0Aen4NaPUvCvSpEs5cX1YltL4urrDWZSCpw2Q0E3Kt6ShkJeEdw9e
 T/w2qr7dL2K5++dJNQiC1OE+kGbXtAT+UNi2YUQ4Zb7dBRnj0yXOMzZaPat6jQQMiett
 mXlz8xaoshFd82t1d2yGvUPQ4R2woMB0aioHSTNWzvlnEDLd8V4dBctn0vmP3x0HXFI9
 RlpQ==
X-Gm-Message-State: APjAAAUHGt/YEYgQvZFwSIqtjV9I0jdZyjqzCLXfaf5XNfonFnbWUuiV
 OiiXy2paluy/GR+/FHLCHrFZXvLCpNY=
X-Google-Smtp-Source: APXvYqzjM0SwwjU14w9QClZX91S+BYdqSQkWxITfp2sKfBD0G1j8qlXhSMwkjp9r6g0nKzuA8VfVnA==
X-Received: by 2002:adf:f4c2:: with SMTP id h2mr21281586wrp.69.1570952908609; 
 Sun, 13 Oct 2019 00:48:28 -0700 (PDT)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-179-64-109.red.bezeqint.net. [79.179.64.109])
 by smtp.gmail.com with ESMTPSA id u26sm9277532wrd.87.2019.10.13.00.48.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 13 Oct 2019 00:48:28 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v32 04/13] target/avr: Add instruction translation - Registers
 definition
Date: Sun, 13 Oct 2019 10:47:56 +0300
Message-Id: <20191013074803.91390-5-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191013074803.91390-1-mrolnik@gmail.com>
References: <20191013074803.91390-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 richard.henderson@linaro.org, dovgaluk@ispras.ru, imammedo@redhat.com,
 philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/translate.c | 132 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 target/avr/translate.c

diff --git a/target/avr/translate.c b/target/avr/translate.c
new file mode 100644
index 0000000000..53c9892a60
--- /dev/null
+++ b/target/avr/translate.c
@@ -0,0 +1,132 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/qemu-print.h"
+#include "tcg/tcg.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "disas/disas.h"
+#include "tcg-op.h"
+#include "exec/cpu_ldst.h"
+#include "exec/helper-proto.h"
+#include "exec/helper-gen.h"
+#include "exec/log.h"
+#include "exec/gdbstub.h"
+#include "exec/translator.h"
+#include "exec/gen-icount.h"
+
+/*
+ *  Define if you want a BREAK instruction translated to a breakpoint
+ *  Active debugging connection is assumed
+ *  This is for
+ *  https://github.com/seharris/qemu-avr-tests/tree/master/instruction-tests
+ *  tests
+ */
+#undef BREAKPOINT_ON_BREAK
+
+static TCGv cpu_pc;
+
+static TCGv cpu_Cf;
+static TCGv cpu_Zf;
+static TCGv cpu_Nf;
+static TCGv cpu_Vf;
+static TCGv cpu_Sf;
+static TCGv cpu_Hf;
+static TCGv cpu_Tf;
+static TCGv cpu_If;
+
+static TCGv cpu_rampD;
+static TCGv cpu_rampX;
+static TCGv cpu_rampY;
+static TCGv cpu_rampZ;
+
+static TCGv cpu_r[NO_CPU_REGISTERS];
+static TCGv cpu_eind;
+static TCGv cpu_sp;
+
+static TCGv cpu_skip;
+
+static const char reg_names[NO_CPU_REGISTERS][8] = {
+    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
+    "r8",  "r9",  "r10", "r11", "r12", "r13", "r14", "r15",
+    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
+    "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
+};
+#define REG(x) (cpu_r[x])
+
+enum {
+    DISAS_EXIT   = DISAS_TARGET_0,  /* We want return to the cpu main loop.  */
+    DISAS_LOOKUP = DISAS_TARGET_1,  /* We have a variable condition exit.  */
+    DISAS_CHAIN  = DISAS_TARGET_2,  /* We have a single condition exit.  */
+};
+
+typedef struct DisasContext DisasContext;
+
+/* This is the state at translation time. */
+struct DisasContext {
+    TranslationBlock *tb;
+
+    CPUAVRState *env;
+    CPUState *cs;
+
+    target_long npc;
+    uint32_t opcode;
+
+    /* Routine used to access memory */
+    int memidx;
+    int bstate;
+    int singlestep;
+
+    TCGv skip_var0;
+    TCGv skip_var1;
+    TCGCond skip_cond;
+    bool free_skip_var0;
+};
+
+static int to_A(DisasContext *ctx, int indx) { return 16 + (indx % 16); }
+static int to_B(DisasContext *ctx, int indx) { return 16 + (indx % 8); }
+static int to_C(DisasContext *ctx, int indx) { return 24 + (indx % 4) * 2; }
+static int to_D(DisasContext *ctx, int indx) { return (indx % 16) * 2; }
+
+static uint16_t next_word(DisasContext *ctx)
+{
+    return cpu_lduw_code(ctx->env, ctx->npc++ * 2);
+}
+
+static int append_16(DisasContext *ctx, int x)
+{
+    return x << 16 | next_word(ctx);
+}
+
+
+static bool avr_have_feature(DisasContext *ctx, int feature)
+{
+    if (!avr_feature(ctx->env, feature)) {
+        gen_helper_unsupported(cpu_env);
+        ctx->bstate = DISAS_NORETURN;
+        return false;
+    }
+    return true;
+}
+
+static bool decode_insn(DisasContext *ctx, uint16_t insn);
+#include "decode_insn.inc.c"
+
-- 
2.17.2 (Apple Git-113)


