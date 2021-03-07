Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14693303CF
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 19:09:56 +0100 (CET)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIxql-0008TB-5u
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 13:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIxoY-0007U5-77
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:07:38 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:39769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIxoW-0001hz-36
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 13:07:37 -0500
Received: from localhost.localdomain ([82.252.159.174]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MEFfB-1lQQ3U2a2f-00AGwM; Sun, 07 Mar 2021 19:07:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/m68k: implement rtr instruction
Date: Sun,  7 Mar 2021 19:07:30 +0100
Message-Id: <20210307180730.471165-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/bb9HB5EVOGbtuzhkF/IwyHo+5aE78199asBB3V7zxuDYVd54EH
 UpgX81gaxw6OAJwaFEvSH/NthwUKv9FgevqalXuFqplfADWBvG3+NiALohRBkVdDJRYOhPu
 09mVVWxC5brNX9uE80ulCHRcimEqJazcXP2D1xDSdUwQQsD7LNLWAXNDnWaCZQzS/qIvo+k
 GoogkMv+1MtcIQnfKX+aA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S4oCrIWSKkU=:J5RHE7lQMBaYa0ekxV1TMB
 I4XpWyorRmaFPKqdmfpjvdZfFqBEQVMWeCc2tQs7iMGCingGEE5IfDMzYYi5AfjItr5dGXxuA
 GACKauwA1S3PQDHy8jvfSD+d9IGpxTO7JFRZDuxkQb5/8pKaDNDrjUldUQaG9fRjCpXOYTC5z
 qQMuWbnHYbb9PmDiQO/vtmbNStO40Vsf2lWp1IgRCvczyEjFV1xh12YTk53jT7H03/zJwgfuQ
 PhcoVM2bTFM4RZkn2uWK1cT0q85HzbCEDrcKE0ShMJZ5wGMP1uv5L19JSd89Dmdi5GCB91Ocr
 BKVDN9m4zQKEgxcP/q6n7zWIk6PoBvPyznOWVvRLO972V/NGQD1aVar4Q9gxkix0Mu2+NOvVl
 Rhnc5+eFrbkRcCkXoGt3VaP0oadn1c8ChKOdQgF4ah5FZ7PwfpLOvfrqkBY8xZbGRcC+Fr9SA
 4NHBf04ROQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed to boot MacOS ROM.

Pull the condition code and the program counter from the stack.

Operation:

    (SP) -> CCR
    SP + 2 -> SP
    (SP) -> PC
    (SP + 4) - > SP

This operation is not privileged.

Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index ac936ebe8f14..e6942955713c 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2969,6 +2969,20 @@ DISAS_INSN(rtd)
     gen_jmp(s, tmp);
 }
 
+DISAS_INSN(rtr)
+{
+    TCGv tmp;
+    TCGv ccr;
+
+    ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
+    gen_set_sr(s, ccr, true);
+    tcg_temp_free(ccr);
+    tcg_gen_addi_i32(QREG_SP, QREG_SP, 2);
+    tmp = gen_load(s, OS_LONG, QREG_SP, 0, IS_USER(s));
+    tcg_gen_addi_i32(QREG_SP, QREG_SP, 4);
+    gen_jmp(s, tmp);
+}
+
 DISAS_INSN(rts)
 {
     TCGv tmp;
@@ -6015,6 +6029,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
     INSN(addsubq,   5000, f080, M68000);
-- 
2.29.2


