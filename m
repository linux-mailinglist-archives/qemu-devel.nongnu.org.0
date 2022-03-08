Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5CD4D114F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:51:52 +0100 (CET)
Received: from localhost ([::1]:36746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUdL-00024l-7j
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:51:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9P-0005Pe-68
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:55 -0500
Received: from [2607:f8b0:4864:20::433] (port=36736
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9N-0006UP-Gb
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:54 -0500
Received: by mail-pf1-x433.google.com with SMTP id z16so16597919pfh.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqZvZTH6wFGuxyM1NjswBFnNnEpmS+qPeWcZX7KLadU=;
 b=rIL1y4EQpEQ7X1sHZUXv4JidRXY804cQfIZePSa37qj60jaj6p8v5QryBdDWQoNhHI
 BNJ9ft5XEiLArOtNun3Nh3piAm3lX6uoxK9d/PQMmqRlT5nnvRQWbZQobkk+qOmTVPEb
 A7N7xSdiYCwCH6CquUmdcTqCt9PVGhEEtDg+nJ1s7cBI3O2YDxfgXcjnd1eSc5NdY2qz
 koVbNkaV7wY8BpMpVRF4LQRFZX9TmJ19JUyfKBdi+02Yf430FclSPSBknAwFXdL4CeQ0
 dXuK1e8S7b3blObYLdeKXsZQR0sBaJXLB+QMxfhwJYq0kqW2+Xg1nublvaoG0hOW/1Ps
 LRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqZvZTH6wFGuxyM1NjswBFnNnEpmS+qPeWcZX7KLadU=;
 b=KHdenRqNSxEIye2qt7jNMFDVBCeRppkm1bF1Nb79rF3nfmplcByArtW3Jv+i7Qow/8
 sX+eOUOTcMD/wkLuZ+B2djlvqtrSb9RstnUusPmaF7F0swy4vBoeezzdkwDrVz0RdY/9
 wKAuCOLo6NFODZpphO8uomM0kL72woI9kxYX8aK/mNEfz8G41lJ05x7Odrl4rEbgD3wc
 7K+mvHCvmW8k6wjCfgozocEgNuno4sjjsw9w/a4XwnuPK30Yx7eeLWwStoSnkAnqGpDl
 YAqvs3aZa3i3Qgmau6qdboOZAIVn/TLZF2v4i5Jco0IXvWu+n+oUPomDgT6v4BR1pyfx
 zzuw==
X-Gm-Message-State: AOAM53387Obra18/E3vYa7yOioGgA5mOpcm+y00kTyvfps04sLDmtpa6
 UJQfJeJo2KLL0WV5fHyHiWcRIcb7SBdURQ==
X-Google-Smtp-Source: ABdhPJzV0ZBI7Qoj18AnfocDgmXUjvCJ5MH0bsq31W4Gol74YXJ0Y2Dhv17mZVPI8XkB9dp6PQPQ/Q==
X-Received: by 2002:a63:2a89:0:b0:380:957a:790b with SMTP id
 q131-20020a632a89000000b00380957a790bmr742401pgq.438.1646724052240; 
 Mon, 07 Mar 2022 23:20:52 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/33] target/nios2: Create EXCP_SEMIHOST for semi-hosting
Date: Mon,  7 Mar 2022 21:19:59 -1000
Message-Id: <20220308072005.307955-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Decode 'break 1' during translation, rather than doing
it again during exception processing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/helper.c    | 15 ++++++---------
 target/nios2/translate.c | 17 ++++++++++++++++-
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index c48daa5640..13e1d49f38 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -162,6 +162,7 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 
 /* Exceptions */
 #define EXCP_BREAK    0x1000
+#define EXCP_SEMIHOST 0x1001
 #define EXCP_RESET    0
 #define EXCP_PRESET   1
 #define EXCP_IRQ      2
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 007496b957..a338d02f6b 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -146,17 +146,14 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->pc = cpu->exception_addr;
         break;
 
+    case EXCP_SEMIHOST:
+        qemu_log_mask(CPU_LOG_INT, "BREAK semihosting at pc=%x\n", env->pc);
+        env->pc += 4;
+        do_nios2_semihosting(env);
+        return;
+
     case EXCP_BREAK:
         qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
-        /* The semihosting instruction is "break 1".  */
-        if (semihosting_enabled() &&
-            cpu_ldl_code(env, env->pc) == 0x003da07a)  {
-            qemu_log_mask(CPU_LOG_INT, "Entering semihosting\n");
-            env->pc += 4;
-            do_nios2_semihosting(env);
-            break;
-        }
-
         if ((env->status & CR_STATUS_EH) == 0) {
             env->bstatus = env->status;
             nios2_crs(env)[R_BA] = env->pc + 4;
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 7730735639..f9b84e31d7 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -33,6 +33,7 @@
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 #include "exec/gen-icount.h"
+#include "semihosting/semihost.h"
 
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
@@ -711,6 +712,20 @@ static void trap(DisasContext *dc, uint32_t code, uint32_t flags)
     t_gen_helper_raise_exception(dc, EXCP_TRAP);
 }
 
+static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+#ifndef CONFIG_USER_ONLY
+    /* The semihosting instruction is "break 1".  */
+    R_TYPE(instr, code);
+    if (semihosting_enabled() && instr.imm5 == 1) {
+        t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
+        return;
+    }
+#endif
+
+    t_gen_helper_raise_exception(dc, EXCP_BREAK);
+}
+
 static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(eret),                                /* eret */
@@ -764,7 +779,7 @@ static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION(add),                                 /* add */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_ILLEGAL(),
-    INSTRUCTION_FLG(gen_excp, EXCP_BREAK),            /* break */
+    INSTRUCTION(gen_break),                           /* break */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(nop),                                 /* nop */
     INSTRUCTION_ILLEGAL(),
-- 
2.25.1


