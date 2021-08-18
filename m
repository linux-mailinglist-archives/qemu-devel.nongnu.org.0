Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67EF3F0CD9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:35:22 +0200 (CEST)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSHR-00043z-V3
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2O-0008BN-DP
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:48 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2L-0006GZ-BX
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so3156304pjl.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vy83n381f/P0a9RBv7Zua8KHFnM0TgwxLmEkGAu93xY=;
 b=qYYB/tgu8zLpGaSG6YMuMDCvv2NsSjLQ4rRReG6UsJFgeWSbAJDW8C9Vk4m3JyiCmD
 9o3XKMPEYOjWot1fqyYlvpdZOapvu2Od76sA9pvGZRU1TkzdKaWqWreW713WPZ6GXv5C
 W2cLyVixv6e2Zzx6rkk4iaoCKjdWDHVcBlR6yfe9XsNmnbQTX9HnIKTS4WDY1PBZMxYC
 6CFFc+y/VHWfm8eZg30GM8qVCa9PBxOHVLvQS4i5ZJz4x8uvZ88oEauECrdNTI/sfHqi
 GNPnIltMdm/ewDGfMQ1YpwlYkC9O3xCc8s4x2/EPccBveO2MnZ/2RBBL73DZLATXIMJ8
 DEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vy83n381f/P0a9RBv7Zua8KHFnM0TgwxLmEkGAu93xY=;
 b=cDPAu/X6PCtPGuVnAtBm5cEFN+I/+382m6iUcsX7QoojPfZYeBWz2n74aPABgtx5Os
 uuSecTM7G00dW78Fj0OtZSEgML18zrOk2bvHFQDvKEky7Vb5Toe2aSBGezQL/xk8MxTK
 WeKWjQukWh/tSsrDzmPhwxeBDXcXlU9JhvZbAmAJQLvLghlcXdcPMAsPrj7i5nbxeWE1
 4mNvHS01+6+YRzEPTa8UtfAX5gwhWK9W/EpgS7B6zPsouI5UTjf9HbUB2Cdpa7ZqGYQs
 4Jk4ebSJLHBrEd2tFnqh+rnn8eUoDDmiOFTLDzOXSgBGyCHRpAJIzE8bFE3hU/bju2Si
 2v2A==
X-Gm-Message-State: AOAM531GBQR4Kpw3e+wbFU4tjiLmY2iOCg2G5QNLyg3glw4zWcQgc7/K
 i7TwLceIYICd2mKX0YK3lGp2MWa6dTv7fA==
X-Google-Smtp-Source: ABdhPJzJhRCIeuthzXhs4gAuIycAoTKK9Ts5K+HeeeUyPkNtlnreAluPXpG1FAMOAzBp7reqAYs4Uw==
X-Received: by 2002:a17:902:8506:b029:12c:76a8:d1b8 with SMTP id
 bj6-20020a1709028506b029012c76a8d1b8mr8755538plb.14.1629317984023; 
 Wed, 18 Aug 2021 13:19:44 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/16] tcg/mips: Create and use TCG_REG_TB
Date: Wed, 18 Aug 2021 10:19:25 -1000
Message-Id: <20210818201931.393394-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

This vastly reduces the size of code generated for 64-bit addresses.
The code for exit_tb, for instance, where we load a (tagged) pointer
to the current TB, goes from

0x400aa9725c:  li       v0,64
0x400aa97260:  dsll     v0,v0,0x10
0x400aa97264:  ori      v0,v0,0xaa9
0x400aa97268:  dsll     v0,v0,0x10
0x400aa9726c:  j        0x400aa9703c
0x400aa97270:  ori      v0,v0,0x7083

to

0x400aa97240:  j        0x400aa97040
0x400aa97244:  daddiu   v0,s6,-189

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 73 ++++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 12 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 1c5c0854c7..333b9572d0 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -88,6 +88,11 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #ifndef CONFIG_SOFTMMU
 #define TCG_GUEST_BASE_REG TCG_REG_S7
 #endif
+#if TCG_TARGET_REG_BITS == 64
+#define TCG_REG_TB         TCG_REG_S6
+#else
+#define TCG_REG_TB         (qemu_build_not_reached(), TCG_REG_ZERO)
+#endif
 
 /* check if we really need so many registers :P */
 static const int tcg_target_reg_alloc_order[] = {
@@ -1961,34 +1966,72 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     switch (opc) {
     case INDEX_op_exit_tb:
         {
-            TCGReg b0 = TCG_REG_ZERO;
+            TCGReg base = TCG_REG_ZERO;
+            int16_t lo = 0;
 
-            a0 = (intptr_t)a0;
-            if (a0 & ~0xffff) {
-                tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_V0, a0 & ~0xffff);
-                b0 = TCG_REG_V0;
+            if (a0) {
+                intptr_t ofs;
+                if (TCG_TARGET_REG_BITS == 64) {
+                    ofs = tcg_tbrel_diff(s, (void *)a0);
+                    lo = ofs;
+                    if (ofs == lo) {
+                        base = TCG_REG_TB;
+                    } else {
+                        base = TCG_REG_V0;
+                        tcg_out_movi(s, TCG_TYPE_PTR, base, ofs - lo);
+                        tcg_out_opc_reg(s, ALIAS_PADD, base, base, TCG_REG_TB);
+                    }
+                } else {
+                    ofs = a0;
+                    lo = ofs;
+                    base = TCG_REG_V0;
+                    tcg_out_movi(s, TCG_TYPE_PTR, base, ofs - lo);
+                }
             }
             if (!tcg_out_opc_jmp(s, OPC_J, tb_ret_addr)) {
                 tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0,
                              (uintptr_t)tb_ret_addr);
                 tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
             }
-            tcg_out_opc_imm(s, OPC_ORI, TCG_REG_V0, b0, a0 & 0xffff);
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_V0, base, lo);
         }
         break;
     case INDEX_op_goto_tb:
         /* indirect jump method */
         tcg_debug_assert(s->tb_jmp_insn_offset == 0);
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
-        tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
-        tcg_out_nop(s);
-        set_jmp_reset_offset(s, a0);
+        {
+            TCGReg base, dest;
+            intptr_t ofs;
+
+            if (TCG_TARGET_REG_BITS == 64) {
+                dest = base = TCG_REG_TB;
+                ofs = tcg_tbrel_diff(s, s->tb_jmp_target_addr + a0);
+            } else {
+                dest = TCG_TMP0;
+                base = TCG_REG_ZERO;
+                ofs = (intptr_t)(s->tb_jmp_target_addr + a0);
+            }
+            tcg_out_ld(s, TCG_TYPE_PTR, dest, base, ofs);
+            tcg_out_opc_reg(s, OPC_JR, 0, dest, 0);
+            /* delay slot */
+            tcg_out_nop(s);
+
+            set_jmp_reset_offset(s, args[0]);
+            if (TCG_TARGET_REG_BITS == 64) {
+                /* For the unlinked case, need to reset TCG_REG_TB. */
+                tcg_out_ldst(s, ALIAS_PADDI, TCG_REG_TB, TCG_REG_TB,
+                             -tcg_current_code_size(s));
+            }
+        }
         break;
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_opc_reg(s, OPC_JR, 0, a0, 0);
-        tcg_out_nop(s);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
+        } else {
+            tcg_out_nop(s);
+        }
         break;
     case INDEX_op_br:
         tcg_out_brcond(s, TCG_COND_EQ, TCG_REG_ZERO, TCG_REG_ZERO,
@@ -2672,6 +2715,9 @@ static void tcg_target_qemu_prologue(TCGContext *s)
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, tcg_target_call_iarg_regs[1]);
+    }
 
     /* Call generated code */
     tcg_out_opc_reg(s, OPC_JR, 0, tcg_target_call_iarg_regs[1], 0);
@@ -2853,6 +2899,9 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_RA);   /* return address */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);   /* stack pointer */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_GP);   /* global pointer */
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_regset_set_reg(s->reserved_regs, TCG_REG_TB); /* tc->tc_ptr */
+    }
 }
 
 typedef struct {
-- 
2.25.1


