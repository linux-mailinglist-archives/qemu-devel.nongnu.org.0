Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7DC5473E3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:44:15 +0200 (CEST)
Received: from localhost ([::1]:56242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzybG-0000Pf-L4
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRQ-0002NN-Dt
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRO-0006DG-Rp
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:04 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k19so1472802wrd.8
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSo+culpJATZACSBmjT9Ra1U4oAMbiKli3IdqMT5z10=;
 b=ZNIaS2om+mJ3/Ap4dfBoAEJoXCFy6zjT1jsQRHbgo+aB3k7VFLzD2IVUh3ZJhezHnA
 u1fPshoH7VT1puHMwtva31eT8gNEPMoW+9e5QM4x+IFTorL+4J3kx/jeJ0wKOMdzLHwj
 KeoVS41axm4Fv72LPASksrW9CfcC091VZao4ccZtHInDNkasBlZXkwxefW8B00X9Oir5
 RVZv36HS9xhBI2EwwE3trah4zTy+WzIPr6qBcnIxFn7PzuX4Be4kaiV6qhZEpx77VBhp
 Lkb98M+kdIKRipNxXhti/sY+4uxoWCkNaukRl2EwXy32F9bcp3j8XP482fUs2LdXIRmh
 dW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zSo+culpJATZACSBmjT9Ra1U4oAMbiKli3IdqMT5z10=;
 b=NMwaapl1+ZVJSH0i/azwcCdnGfgbHJbcV2g7seg4y4TU0bbub+eAmKVw5sPADaVk8r
 hE2fHjSUHkTKwNoA78vkaHLCiVOH6LeVDMvW9d1tu2mVymxUOWKURCHdkyQPr+h/NE77
 /XzEtXNsko5HuGbuospab+0ttkOjDMO2fXt3jIors6SIZ9/3wEG+c+wDJl1kb2zkkxyQ
 yGWXCtp8RqLOzSlAj14mRPdbX39HbBtjEGDD0iyDh/ZNeNycEkRi4s7TBKJtdLa/8xE5
 kpfUto6VQVNCPoehuDj0MW6Odm0LnE6rwRXjnbPkWW/jJKLMOAP7ZakDOn8Gv4asYPCO
 pSiA==
X-Gm-Message-State: AOAM533GfKKiPTycJIR7iYw+52n6J1OFGMr0gxxr1SqSh0OF15AOy+ZC
 LY8oU+OmBWA9upC288HzJs+IBZ8hQrY=
X-Google-Smtp-Source: ABdhPJyLtn6IyGaVDIk08THrDNIjw9YsIxxEKmKt0AGxdMQ9CuKCyOPFnANAkCrruxar3yDGyAvsUg==
X-Received: by 2002:a5d:67c2:0:b0:215:7a0f:71f9 with SMTP id
 n2-20020a5d67c2000000b002157a0f71f9mr41927621wrw.486.1654943641197; 
 Sat, 11 Jun 2022 03:34:01 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002183cf9cd69sm2144366wrb.15.2022.06.11.03.34.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:00 -0700 (PDT)
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
Subject: [PULL 09/49] target/mips: Fix emulation of nanoMIPS EXTRV_S.H
 instruction
Date: Sat, 11 Jun 2022 12:32:32 +0200
Message-Id: <20220611103312.67773-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

The field rs in the instruction EXTRV_S.H rt, ac, rs is specified in
nanoMIPS documentation as opcode[20..16]. It is, however, erroneously
considered as opcode[25..21] in the current QEMU implementation. In
function gen_pool32axf_2_nanomips_insn(), the variable v0_t corresponds
to rt/opcode[25..21], and v1_t corresponds to rs/opcode[20..16]), and
v0_t is by mistake passed to the helper gen_helper_extr_s_h().

Use v1_t rather than v0_t in the invocation of gen_helper_extr_s_h()
to fix this.

Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
Fixes: 8b3698b294 ("target/mips: Add emulation of DSP ASE for nanoMIPS")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220504110403.613168-3-stefan.pejic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 58ae35a156..9ee4df2135 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -2036,7 +2036,7 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
         case NM_EXTRV_S_H:
             check_dsp(ctx);
             tcg_gen_movi_tl(t0, rd >> 3);
-            gen_helper_extr_s_h(t0, t0, v0_t, cpu_env);
+            gen_helper_extr_s_h(t0, t0, v1_t, cpu_env);
             gen_store_gpr(t0, ret);
             break;
         }
-- 
2.36.1


