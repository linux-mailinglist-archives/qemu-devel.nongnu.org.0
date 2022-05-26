Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930965355DD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:57:55 +0200 (CEST)
Received: from localhost ([::1]:46992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLUQ-0003EJ-LN
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCH-0001oT-Te; Thu, 26 May 2022 17:39:11 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLC8-000878-I8; Thu, 26 May 2022 17:39:09 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 e11-20020a9d6e0b000000b0060afcbafa80so1832793otr.3; 
 Thu, 26 May 2022 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J848FYSgRu6IL+DQp4slez9fVUZ6cS0EFjZXM7XkCPQ=;
 b=bdbCTjVyyFSkWwI3PyLheLIo8GvH/Awe7hTrdcskM7zF0wzTgeEh4Twt/MRWNg/Vxn
 GCrHCVpgYOVUfPuXN8T0UBYdcUMq5jkN+YN0W8tTyl2+tXFvSjisYYy4ZIRJMfdrxIgu
 SzJjNkwVSFUOBczwxHy/h1cz1NTVuKJGR9xjLb/M/XSL0/gFFMDdYxbxkrY1o6e7QaAz
 9eI0jCOfp36C4unf9s8BwHlbmmVQAlzcsHOnHG5svsYSSPJbWiRlTIubu3Z3cqq8ccFG
 sry2zlLm6WrNtsN0WodggbNrLxZK5REu7gUxQ1BPenaBAgZHjgm1pSTIqwXJzdrU8qU9
 BIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J848FYSgRu6IL+DQp4slez9fVUZ6cS0EFjZXM7XkCPQ=;
 b=qZvEiYoQADMiVDTMmHHYvbn4LdZpe9JTXxt3nA9cMdF0ttBVou1Jj9bFObhg3Hta4U
 cWd4TAPSUkC6SYccdjBDdCNmYmm7816aCYg5Zjw32D35dR101RlURqe7vz3aS6u+sLRm
 g7AUH+BEhwUxM1JvxP4Lvpn4MeaFIuNVdi/ijKhPYW/FgQpeFRrFRg+ARyK2HS5fesXG
 OTvfiXyxTd1dT6IzWNlE2aNF6e9W/SKP0GLBOvcAa1Cvxy0rBNyXTb7PFHqDyy1DZDnx
 Xvw532ohLHCHwV+Orr7aY9mh7Mij9bpbrdE5iQBzF4gCl59/znhjc2iBEl0tWvfb6uSJ
 lCOw==
X-Gm-Message-State: AOAM532g+JEfbyTbhQ+BrRZdf+Zrj+LTSPPBJi3zlfWpv9ubjunEFxk/
 5SoiS4se9DxBKFTreaHhvFupHABcoc0=
X-Google-Smtp-Source: ABdhPJx01Z/8+nb4UXmJDvsMUmNUohHs7stZgznlJ73UFOPEip5utHoTzAltzSy7Lwj8s0U5kawmkw==
X-Received: by 2002:a05:6830:2647:b0:60b:138f:5254 with SMTP id
 f7-20020a056830264700b0060b138f5254mr9135792otu.218.1653601138973; 
 Thu, 26 May 2022 14:38:58 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:38:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Rashmica Gupta <rashmica.g@gmail.com>
Subject: [PULL 08/34] target/ppc: Fix FPSCR.FI changing in
 float_overflow_excp()
Date: Thu, 26 May 2022 18:37:49 -0300
Message-Id: <20220526213815.92701-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

This patch fixes another not-so-clear situation in Power ISA
regarding the inexact bits in FPSCR. The ISA states that:

"""
When Overflow Exception is disabled (OE=0) and an
Overflow Exception occurs, the following actions are
taken:
...
2. Inexact Exception is set
XX <- 1
...
FI is set to 1
...
"""

However, when tested on a Power 9 hardware, some instructions that
trigger an OX don't set the FI bit:

xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) = FI: CLEARED -> CLEARED
xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) = FI: CLEARED -> CLEARED
(just a few examples. Other instructions are also affected)

The root cause for this seems to be that only instructions that list
the bit FI in the "Special Registers Altered" should modify it.

QEMU is, today, not working like the hardware:

xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) = FI: CLEARED -> SET
xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) = FI: CLEARED -> SET

(all tests assume FI is cleared beforehand)

Fix this by making float_overflow_excp() return float_flag_inexact
if it should update the inexact flags.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Message-Id: <20220517161522.36132-3-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f1ea4aa10e..88f9e756a5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -329,24 +329,25 @@ static inline void float_zero_divide_excp(CPUPPCState *env, uintptr_t raddr)
     }
 }
 
-static inline void float_overflow_excp(CPUPPCState *env)
+static inline int float_overflow_excp(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
 
     env->fpscr |= FP_OX;
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
-    if (env->fpscr & FP_OE) {
+
+    bool overflow_enabled = !!(env->fpscr & FP_OE);
+    if (overflow_enabled) {
         /* XXX: should adjust the result */
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
         cs->exception_index = POWERPC_EXCP_PROGRAM;
         env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_OX;
-    } else {
-        env->fpscr |= FP_XX;
-        env->fpscr |= FP_FI;
     }
+
+    return overflow_enabled ? 0 : float_flag_inexact;
 }
 
 static inline void float_underflow_excp(CPUPPCState *env)
@@ -468,7 +469,7 @@ static void do_float_check_status(CPUPPCState *env, bool change_fi,
     int status = get_float_exception_flags(&env->fp_status);
 
     if (status & float_flag_overflow) {
-        float_overflow_excp(env);
+        status |= float_overflow_excp(env);
     } else if (status & float_flag_underflow) {
         float_underflow_excp(env);
     }
-- 
2.36.1


