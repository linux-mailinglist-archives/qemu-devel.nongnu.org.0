Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7052D35A7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:56:35 +0100 (CET)
Received: from localhost ([::1]:34510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkyE-0000PA-4b
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjr-0004I2-UI
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:41 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:39228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjq-0008HO-Hz
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:35 -0500
Received: by mail-ej1-x641.google.com with SMTP id n26so26514673eju.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bGWb+orU5EBa5WEZB/m/zvIZ1UpmUYqQ14OUTga+crA=;
 b=Qu6VOzA09QIUgjgW9P4/iNjRYJVEeNG0bUFp7NQNMHiK/mgC+8lm+l5LpESjdlkRoy
 j1bZwLkledO56th/GZ4Mp2Uqfoaz9Al9p0lhoVC9gGNVJlh7CgTrKfjGc1bKZUsHF1cl
 284t+hah105YFdg3/GaShnBel6z3Y+c4m0EAvs6Fnj/9pUOkEgkCbCl/n9+P/2+frtBB
 pGCfCWF8nrFNqypbqPH/bA1TalOmnmGUaXUFKymM9+sUO1M7cusfApVhd1GqBeqEt5O3
 Z2SOwpfMXoms6JcIaMuAPl22IEurF5zUITx1QP2RNeuH/vFcCgX+NvG9kECVxm54yI2l
 4EIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bGWb+orU5EBa5WEZB/m/zvIZ1UpmUYqQ14OUTga+crA=;
 b=T5ZbYWEJMdBmskKIqZ6iYfrjTEFfw4CSLf0KPEoZyQ3ZtMxVkbhByU5gT0W/2gSohJ
 ZE2K6e6rxP/ED5u/56KAXhqyGPl/oHWHlWnYaPqDsoYJDL6kWs0wBJlx8Ve1gHX6IOrM
 VGMIl3pw+6LIgTKlTSQVe4LXHD2vF/VhgoiywLLoCfBhAGV412ZoagVgQkfdiJX8mIJl
 X88qgB7NjxGKeobEHnU+FTOKGDy+epyk5X2Fmc2xsYp/bfCYmW59VPdW3f0jQkKFBCEG
 gveQkQ7msTp9suBRlKVOok2uofcH+GgX4NsC1P4dfBfgmaP5mC0N/0K2l7sJyu3f5GHL
 VBLA==
X-Gm-Message-State: AOAM5300xHxV2KGtLHpARlRd3/CuWqd0WBooMpcQVV/vNLscniCJsgra
 PmerwrK5rDuIhhT0oWnQPqS7igWKSHM=
X-Google-Smtp-Source: ABdhPJx3FPsI4+gFmgIxR0dwF20Q5lDR33asDcN+tv4OnbYrTeVIu79UYGD/zEINItcEA+OeU3lNsw==
X-Received: by 2002:a17:906:6713:: with SMTP id
 a19mr25686980ejp.468.1607459853021; 
 Tue, 08 Dec 2020 12:37:33 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id ca4sm12286018edb.80.2020.12.08.12.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/13] target/mips: Remove now unreachable LSA/DLSA opcodes
 code
Date: Tue,  8 Dec 2020 21:36:56 +0100
Message-Id: <20201208203704.243704-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we switched to decodetree-generated processing,
we can remove this now unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9b333f97822..8f0a0a3830c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -286,9 +286,6 @@ enum {
     R6_OPC_DCLZ     = 0x12 | OPC_SPECIAL,
     R6_OPC_DCLO     = 0x13 | OPC_SPECIAL,
     R6_OPC_SDBBP    = 0x0e | OPC_SPECIAL,
-
-    OPC_LSA  = 0x05 | OPC_SPECIAL,
-    OPC_DLSA = 0x15 | OPC_SPECIAL,
 };
 
 /* Multiplication variants of the vr54xx. */
@@ -24327,9 +24324,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
-    case OPC_LSA:
-        gen_LSA(ctx, rd, rs, rt, extract32(ctx->opcode, 6, 2));
-        break;
     case OPC_MULT:
     case OPC_MULTU:
     case OPC_DIV:
@@ -24380,10 +24374,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
 #if defined(TARGET_MIPS64)
-    case OPC_DLSA:
-        check_mips_64(ctx);
-        gen_DLSA(ctx, rd, rs, rt, extract32(ctx->opcode, 6, 2));
-        break;
     case R6_OPC_DCLO:
     case R6_OPC_DCLZ:
         if (rt == 0 && sa == 1) {
@@ -24645,18 +24635,14 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         check_insn(ctx, ISA_MIPS2);
         gen_trap(ctx, op1, rs, rt, -1);
         break;
-    case OPC_LSA: /* OPC_PMON */
-        if ((ctx->insn_flags & ISA_MIPS32R6) || ase_msa_available(env)) {
-            decode_opc_special_r6(env, ctx);
-        } else {
-            /* Pmon entry point, also R4010 selsl */
+    case OPC_PMON:
+        /* Pmon entry point, also R4010 selsl */
 #ifdef MIPS_STRICT_STANDARD
-            MIPS_INVAL("PMON / selsl");
-            generate_exception_end(ctx, EXCP_RI);
+        MIPS_INVAL("PMON / selsl");
+        generate_exception_end(ctx, EXCP_RI);
 #else
-            gen_helper_0e0i(pmon, sa);
+        gen_helper_0e0i(pmon, sa);
 #endif
-        }
         break;
     case OPC_SYSCALL:
         generate_exception_end(ctx, EXCP_SYSCALL);
@@ -24747,11 +24733,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
         break;
-    case OPC_DLSA:
-        if ((ctx->insn_flags & ISA_MIPS32R6) || ase_msa_available(env)) {
-            decode_opc_special_r6(env, ctx);
-        }
-        break;
 #endif
     default:
         if (ctx->insn_flags & ISA_MIPS32R6) {
-- 
2.26.2


