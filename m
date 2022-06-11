Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE225473D0
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:38:25 +0200 (CEST)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyVc-0005UF-TD
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRW-0002cA-En
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:10 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRT-0006Dd-Qv
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:10 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 i131-20020a1c3b89000000b0039c6fd897b4so1754348wma.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXGp9AEBGIcAPuqUO7kDAfXP5dRhKuWFhn6lRxbnldQ=;
 b=ajf0ZmtyTbXN2bM0Dc1a5vgSH27N0+T8VGtIxa6R8BtL7EB6owHZq7IfejLZhtEP6v
 eSFha7d7tFLdr6OPZUX06hJ1V1RMJoQM7n98OYOkvBIVOoeYWrS7yvSjqf/YpBGFbO7D
 oSREvV5wlwIYyFZA0lCnqgPHSfb+yxIpsxfBJ6sirGCsxrvm8XQFvILWTmDFGlLi2Lgn
 qHeKvtaBXebX/HOVDMWiJikXtnzoZlOeX9Ur9+0rbpSgnMvSAFntd4aTzodxaK+touk5
 jKyX7wuoojoTAaEXT9NyR16OSBKXdqrb/icQtadAMc+y6y7/17sQ1JmyY8kDX3wvi5zL
 EPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXGp9AEBGIcAPuqUO7kDAfXP5dRhKuWFhn6lRxbnldQ=;
 b=rf70rYbSsLmTyPeSWwSJ1pSfuZaTXhI3MHXtVAtGLcjB6Jl7NSt25qF/UsuW2FdcbW
 xD7YzpqxYjVOWDD8NKg6VTvDMCtv06VvMvDP52PSMlUWdFsXXRarwEvZqICTlEsVYwwd
 4RkfJJEo5SYPPJDR+pdWQhaFV2pqHMKjynqPNQDCKu50BKxSr7M5L1H+QEv5EZ1QoIvx
 kXmOTLnH0PWOA2mYvOsjxT7423EifQlI5kg4K9PWKdXPK8BXr4d3D4brBXxU5oMcLliR
 oms5MUnVyYlJas0kQXc6go1LlOfIrNSO55deamYN7YidZ1hnKf+oSzPiNf6CxQoXlMO5
 Tl6w==
X-Gm-Message-State: AOAM533IYQre9NnX/+3NSR3bb1arIDYHAEqxSESFpi6Hp6i1Ig27s72N
 ZUfu4pxJf6TNNJLzfzurzhS9MkChEKM=
X-Google-Smtp-Source: ABdhPJz4UJ2Cp/bjwNocgIYBOHYa6jG5XF77jjEIEy8s3UoazE0alhPhcdMl9vK/lvq5LolBMqKLpQ==
X-Received: by 2002:a05:600c:4fd2:b0:39c:1586:a2e0 with SMTP id
 o18-20020a05600c4fd200b0039c1586a2e0mr4113680wmq.62.1654943646298; 
 Sat, 11 Jun 2022 03:34:06 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 q1-20020adff501000000b002117ef160fbsm2189441wro.21.2022.06.11.03.34.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 10/49] target/mips: Fix emulation of nanoMIPS BPOSGE32C
 instruction
Date: Sat, 11 Jun 2022 12:32:33 +0200
Message-Id: <20220611103312.67773-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>

There are currently two problems related to the emulation of the
instruction BPOSGE32C.

The nanoMIPS instruction BPOSGE32C belongs to DSP R3 instructions
(actually, as of now, it is the only instruction of DSP R3). The
presence of DSP R3 instructions in QEMU is indicated by the flag
MIPS_HFLAG_DSP_R3 (0x20000000). This flag is currently being properly
set in CPUMIPSState's hflags (for example, for I7200 nanoMIPS CPU).
However, it is not propagated to DisasContext's hflags, since the flag
MIPS_HFLAG_DSP_R3 is not set in MIPS_HFLAG_TMASK (while similar flags
MIPS_HFLAG_DSP_R2 and MIPS_HFLAG_DSP are set in this mask, and there
is no problem in functioning check_dsp_r2(), check_dsp()). This means
the function check_dsp_r3() currently does not work properly, and the
emulation of BPOSGE32C can not work properly as well.

Change MIPS_HFLAG_TMASK from 0x1F5807FF to 0x3F5807FF (logical OR
with 0x20000000) to fix this.

Additionally, check_cp1_enabled() is currently incorrectly called
while emulating BPOSGE32C. BPOSGE32C is in the same pool (P.BR1) as
FPU branch instruction BC1EQZC and BC1NEZC, but it not a part of FPU
(CP1) instructions, and check_cp1_enabled() should not be involved
while emulating BPOSGE32C.

Rearrange invocations of check_cp1_enabled() within P.BR1 pool
handling to affect only BC1EQZC and BC1NEZC emulation, and not
BPOSGE32C emulation.

Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220504110403.613168-4-stefan.pejic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h                        | 2 +-
 target/mips/tcg/nanomips_translate.c.inc | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 6b6b8776d1..42efa989e4 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1077,7 +1077,7 @@ typedef struct CPUArchState {
 #define EXCP_INST_NOTAVAIL 0x2 /* No valid instruction word for BadInstr */
     uint32_t hflags;    /* CPU State */
     /* TMASK defines different execution modes */
-#define MIPS_HFLAG_TMASK  0x1F5807FF
+#define MIPS_HFLAG_TMASK  0x3F5807FF
 #define MIPS_HFLAG_MODE   0x00007 /* execution modes                    */
     /*
      * The KSU flags must be the lowest bits in hflags. The flag order
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 9ee4df2135..941cfaa6bb 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -4478,12 +4478,13 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             case NM_P_BR3A:
                 s = sextract32(ctx->opcode, 0, 1) << 14 |
                     extract32(ctx->opcode, 1, 13) << 1;
-                check_cp1_enabled(ctx);
                 switch (extract32(ctx->opcode, 16, 5)) {
                 case NM_BC1EQZC:
+                    check_cp1_enabled(ctx);
                     gen_compute_branch_cp1_nm(ctx, OPC_BC1EQZ, rt, s);
                     break;
                 case NM_BC1NEZC:
+                    check_cp1_enabled(ctx);
                     gen_compute_branch_cp1_nm(ctx, OPC_BC1NEZ, rt, s);
                     break;
                 case NM_BPOSGE32C:
-- 
2.36.1


