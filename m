Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8352D895C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:50:09 +0100 (CET)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9y4-0002W6-EU
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9Ui-0001al-Uj
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:19:48 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:51695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9Uh-0002ON-4P
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:19:48 -0500
Received: from localhost.localdomain ([82.252.152.214]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MyvFC-1jtihO2VIA-00vyty; Sat, 12 Dec 2020 18:55:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] m68k: fix some comment spelling errors
Date: Sat, 12 Dec 2020 18:54:58 +0100
Message-Id: <20201212175458.259960-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201212175458.259960-1-laurent@vivier.eu>
References: <20201212175458.259960-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4xEk/o2/hRoQtBLpurBSFxNwfghpahVgGT9cl+V8HMTjNjB6fik
 ERwGSnrzK65sUwK92FmEEjaMyPDVGcf6dLcUFzK5KUKiw8J0IGIkuwZ2EpFcpg/0eCZ3pC3
 mO6LQxMuPXsk+a76b31Lbd6W69Q4DmQA65lZ3Z6puAdx2L6hRbA/aOg3WnfDis+Mq/W/ndt
 3MaNQ1drgdgwKLfTiL06g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nhZpg6qpyUQ=:5syejOJOuzseCVSFuUgrNC
 lWdgGeLTmsqcWET0jpM9ICPMV0h85GF5U5s+oejxgb3xLL6b6ATU4E+ub3/FlX0UFKbjauF2D
 ZfEwQecxFkIIz4yCK1Mznth9TFlvKpYXuj6SrRNAEK0bDUYMcWo/NynUlUM6Q1+8fmcBam1LR
 BQGh0hvKpmZ7XRMMX+C6Pdj3TONdhD5FUxR91no9iZTCSUWFrvHCmvS+DnwAZ2s6fzFanxHrf
 zZsHjtZ7yK3pVhLws/phsfVvzIb2gkLzPtQQE6qLlx/u1el4i+MYaldwflfLtyq2DnSdLcBq1
 trJTkha2gXCZ6FQRrN0Lwr7gFIgabYRX66O7mCBtMPJb8AsGgVCnoOhpq4l47rXAWOBcLBnCw
 9XhAeu3gjHJAqjl9krpBQgH+6fnbfUHSE9g+mm0pypXSjYsdXBFVVXyzHE4cqOa8IcN2xl3GI
 pFlVD/Zc5A==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 zhaolichang <zhaolichang@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhaolichang <zhaolichang@huawei.com>

I found that there are many spelling errors in the comments of qemu/target/m68k.
I used spellcheck to check the spelling errors and found some errors in the folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>
Reviewed-by: Laurent Vivier<laurent@vivier.eu>
Message-Id: <20201009064449.2336-9-zhaolichang@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 3fc67aa45261..133a4049191e 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -438,7 +438,7 @@ static TCGv gen_addr_index(DisasContext *s, uint16_t ext, TCGv tmp)
 }
 
 /*
- * Handle a base + index + displacement effective addresss.
+ * Handle a base + index + displacement effective address.
  * A NULL_QREG base means pc-relative.
  */
 static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
@@ -1696,7 +1696,7 @@ static void bcd_add(TCGv dest, TCGv src)
 
     /*
      * t1 = (src + 0x066) + dest + X
-     *    = result with some possible exceding 0x6
+     *    = result with some possible exceeding 0x6
      */
 
     t0 = tcg_const_i32(0x066);
@@ -1706,7 +1706,7 @@ static void bcd_add(TCGv dest, TCGv src)
     tcg_gen_add_i32(t1, t0, dest);
     tcg_gen_add_i32(t1, t1, QREG_CC_X);
 
-    /* we will remove exceding 0x6 where there is no carry */
+    /* we will remove exceeding 0x6 where there is no carry */
 
     /*
      * t0 = (src + 0x0066) ^ dest
@@ -1736,7 +1736,7 @@ static void bcd_add(TCGv dest, TCGv src)
     tcg_temp_free(t0);
 
     /*
-     * remove the exceding 0x6
+     * remove the exceeding 0x6
      * for digits that have not generated a carry
      */
 
@@ -2638,7 +2638,7 @@ DISAS_INSN(negx)
     gen_flush_flags(s); /* compute old Z */
 
     /*
-     * Perform substract with borrow.
+     * Perform subtract with borrow.
      * (X, N) =  -(src + X);
      */
 
@@ -2653,7 +2653,7 @@ DISAS_INSN(negx)
     /*
      * Compute signed-overflow for negation.  The normal formula for
      * subtraction is (res ^ src) & (src ^ dest), but with dest==0
-     * this simplies to res & src.
+     * this simplifies to res & src.
      */
 
     tcg_gen_and_i32(QREG_CC_V, QREG_CC_N, src);
@@ -3159,7 +3159,7 @@ static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
     gen_flush_flags(s); /* compute old Z */
 
     /*
-     * Perform substract with borrow.
+     * Perform subtract with borrow.
      * (X, N) = dest - (src + X);
      */
 
@@ -3169,7 +3169,7 @@ static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
     tcg_gen_andi_i32(QREG_CC_X, QREG_CC_X, 1);
 
-    /* Compute signed-overflow for substract.  */
+    /* Compute signed-overflow for subtract.  */
 
     tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, dest);
     tcg_gen_xor_i32(tmp, dest, src);
-- 
2.29.2


