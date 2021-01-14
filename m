Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5C2F6633
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:48:15 +0100 (CET)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05nC-00022O-8a
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NJ-00041L-Iq
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NH-0000Wj-Jd
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id a6so5044606wmc.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PmPDJPn3tTAJ0biW67tY7Bo73ElMtNM9RooSA4GKocg=;
 b=sAkWarfSiKmIkSDVJNtb5j9IVzhapDb+JOULUIEcrhCjcQhwCBbqMBJcI4gzIZyvX9
 a995eg9H6QrwqQfsVSJWVElokVIENhhv3KEFrzrgT7u3h7Vvjz+0xxN3418/pp5ZzHTK
 8FRR3Vk9C2nyY0TrrdXzG2T4Ec/5sdxGzz3nVh+tzjM9KiJHs8AbnLExFfrp/EFShOyV
 eAISXh0uArgD2sd/q94ppM8LmrcbOVw3ElcYwYl+gbzeq5GXM2dNf18pFn8jh4DoTim4
 30X7f6w1D9lY4Tr99XeO8ryNcOTEqLlzFV4OciA6NrjPh6f0RMjWqNdM5N4tflkboX04
 qLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PmPDJPn3tTAJ0biW67tY7Bo73ElMtNM9RooSA4GKocg=;
 b=MPRUQEDOXF10/RoJOad/cEFb7WG214qc/BmLDwdFGFEMY3NPb8V9cabf286g7l4pqO
 +qHc4Ycl2eHplfsEUwhwNQA3zP/it8vPrhLy2W7OUFUx3HcXykOX3cx+JOAinc7COqHA
 6z9K5Z8GL6Xn8Nun4yeppW/33a5i2zSkdk9I1jn4iYXFjH+B4HPDZZEVW+uwKBxG6Uem
 W7/SYJCZG7Tnry07YxVPSo3a1LzqcwHJXNxbWj9zrRpDb3xE5i42WsQ0RDHCrVzHStNV
 Im0KVPgcEGGuxt8OjYr+7aRSuOtq5UWctdg6kcQCvZ/aHZIj2nr4eg+WFLX7icqs5JV3
 cgOg==
X-Gm-Message-State: AOAM530ukBC3ACyAAaHkgI/ry0tIW0VIN9WRjfntlUNEBcVnN+92WWpk
 Hf/4sip1j8dv3gMjdCTsXtwoUPUi1PU=
X-Google-Smtp-Source: ABdhPJw7ylf2xgE33+eQeL7rS+jxywHQCtG8WVE8HATiYIbGWXIM9TWTHWR3f0KiFfWOA6YBu9odOA==
X-Received: by 2002:a1c:40d6:: with SMTP id n205mr4808721wma.0.1610641285437; 
 Thu, 14 Jan 2021 08:21:25 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f9sm12056529wrw.81.2021.01.14.08.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 57/69] target/mips: Remove now unreachable LSA/DLSA opcodes
 code
Date: Thu, 14 Jan 2021 17:20:11 +0100
Message-Id: <20210114162016.2901557-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we switched to decodetree-generated processing,
we can remove this now unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-6-f4bug@amsat.org>
---
 target/mips/translate.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index d297029a777..e3bb1e83efe 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -280,9 +280,6 @@ enum {
     R6_OPC_DCLZ     = 0x12 | OPC_SPECIAL,
     R6_OPC_DCLO     = 0x13 | OPC_SPECIAL,
     R6_OPC_SDBBP    = 0x0e | OPC_SPECIAL,
-
-    OPC_LSA  = 0x05 | OPC_SPECIAL,
-    OPC_DLSA = 0x15 | OPC_SPECIAL,
 };
 
 /* Multiplication variants of the vr54xx. */
@@ -24318,9 +24315,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
-    case OPC_LSA:
-        gen_lsa(ctx, rd, rt, rs, extract32(ctx->opcode, 6, 2));
-        break;
     case OPC_MULT:
     case OPC_MULTU:
     case OPC_DIV:
@@ -24371,9 +24365,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
 #if defined(TARGET_MIPS64)
-    case OPC_DLSA:
-        gen_dlsa(ctx, rd, rt, rs, extract32(ctx->opcode, 6, 2));
-        break;
     case R6_OPC_DCLO:
     case R6_OPC_DCLZ:
         if (rt == 0 && sa == 1) {
@@ -24635,18 +24626,14 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         check_insn(ctx, ISA_MIPS2);
         gen_trap(ctx, op1, rs, rt, -1);
         break;
-    case OPC_LSA: /* OPC_PMON */
-        if ((ctx->insn_flags & ISA_MIPS_R6) || ase_msa_available(env)) {
-            decode_opc_special_r6(env, ctx);
-        } else {
-            /* Pmon entry point, also R4010 selsl */
+    case OPC_PMON:
+        /* Pmon entry point, also R4010 selsl */
 #ifdef MIPS_STRICT_STANDARD
-            MIPS_INVAL("PMON / selsl");
-            gen_reserved_instruction(ctx);
+        MIPS_INVAL("PMON / selsl");
+        gen_reserved_instruction(ctx);
 #else
-            gen_helper_0e0i(pmon, sa);
+        gen_helper_0e0i(pmon, sa);
 #endif
-        }
         break;
     case OPC_SYSCALL:
         generate_exception_end(ctx, EXCP_SYSCALL);
@@ -24737,11 +24724,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
         break;
-    case OPC_DLSA:
-        if ((ctx->insn_flags & ISA_MIPS_R6) || ase_msa_available(env)) {
-            decode_opc_special_r6(env, ctx);
-        }
-        break;
 #endif
     default:
         if (ctx->insn_flags & ISA_MIPS_R6) {
-- 
2.26.2


