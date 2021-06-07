Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42FE39E713
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:03:23 +0200 (CEST)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKWw-0006LC-Vi
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRg-0003zZ-J7; Mon, 07 Jun 2021 14:57:56 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRd-0005tv-Ah; Mon, 07 Jun 2021 14:57:56 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsqIi-1lWahY2Cm8-00t964; Mon, 07
 Jun 2021 20:57:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] target/mips: Fix 'Uncoditional' typo
Date: Mon,  7 Jun 2021 20:57:28 +0200
Message-Id: <20210607185730.346641-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/eqKLFFWMtqvP7f34pFrlSEeeprZqU1BSJNzfJBGsKB9W6QP6h6
 HI7QQeJ9LLMd3luS+zv2r/JsZ7DAfngEpThAkCCbf8bXs/ZoHRHLXh1gVHETbGQ5TgOb7E+
 F/powcSGk7hzn8zhMXO5V47UVOGFnidU/L/Nbkz0mgxph66Uk0wt52UmcYIIOYeksJR8P+E
 +d4je0oIBom7bWk0hhEWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5pLnGTTIw4Q=:Qelr1qLYzkqqauKb+uW3YD
 sRBwKojDAZAE5M4gPG+ygeq4W6lHKZ78JUvAev1XYYOL6BEKB//A7xSIBK6tmZxXbvdyD+zOL
 n9mKHoa6tTG3dIUVJL6KbsNveV7JLKSgzDVLOdoaEbAFvamc5ol2NKudYeXlgMiXc+HNzPXDK
 WS7CKRwQxWVFdz2IAiBOfupw9QjwX/VUjBfAxoyyereOgAZezX9YJyR8+asctXkCWyLT74SWy
 Y1ghJN8duaJvZpi7AyfJgCeA6Q3jSxdjCYBK8LuZR4LOVl11LS8yszsgcq7AAAApJSbwcbyOm
 In5Z9kX2AZY6dIBUGq1ivSCjnclXOKGLMtf5z3iZXTx1FFitTHWL2Y+0tL34+KwrMG3gryxDH
 kPHTZgASIXZVGCNbWxh0zUiR5PjnizsEjYys8txhfqedwQ2ux4fgDkQJdNut/BvVxzAYZqvnI
 ZQSKPyCW420JwQu1nx9Xf3P1SEuBBmzA1Kt4QRL/BVuOi4u3jl1UJs3OnFHR7pMH1Qu/OVYOL
 Busw0/H5u2iqd1ZHtJ0RAo=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Luis Pires <luis.pires@eldorado.org.br>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix Uncoditional -> Unconditional typo.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Message-Id: <20210602170759.2500248-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/mips/tcg/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c03a8ae1fed8..797eba443470 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12238,7 +12238,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
     }
 
     if (bcond_compute == 0) {
-        /* Uncoditional compact branch */
+        /* Unconditional compact branch */
         switch (opc) {
         case OPC_JIALC:
             tcg_gen_movi_tl(cpu_gpr[31], ctx->base.pc_next + 4 + m16_lowbit);
@@ -19092,7 +19092,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
     ctx->base.is_jmp = DISAS_NORETURN;
 
     if (cond == TCG_COND_ALWAYS) {
-        /* Uncoditional compact branch */
+        /* Unconditional compact branch */
         gen_goto_tb(ctx, 0, ctx->btarget);
     } else {
         /* Conditional compact branch */
@@ -19201,7 +19201,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
     }
 
     if (bcond_compute == 0) {
-        /* Uncoditional compact branch */
+        /* Unconditional compact branch */
         switch (opc) {
         case OPC_BC:
             gen_goto_tb(ctx, 0, ctx->btarget);
-- 
2.31.1


