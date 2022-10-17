Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113360051D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 04:10:31 +0200 (CEST)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okFaH-0006qL-Nr
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 22:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>)
 id 1okFZA-0005IS-Sa; Sun, 16 Oct 2022 22:09:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43932 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>)
 id 1okFZ8-0005zQ-Fw; Sun, 16 Oct 2022 22:09:20 -0400
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx9OFDuUxjnFwwAA--.38243S2; 
 Mon, 17 Oct 2022 10:09:07 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, WANG Xuerui <git@xen0n.name>
Subject: [PATCH] tcg/aarch64: Remove unused code in tcg_out_op
Date: Mon, 17 Oct 2022 10:08:26 +0800
Message-Id: <20221017020826.990729-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx9OFDuUxjnFwwAA--.38243S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1kAFyftw4rJw45XF47urg_yoW8uF1kpr
 93Crnxtw43JrWDJrWavF1UC343Aa90kr9rWF4xKw48Xws0v343XrWfKr4ftFWDKFyfur4U
 Zan0yw1fGF4DAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUk0b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
 aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcVWlDUUUU
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQACCWNL9GEEiwAEs8
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

AArch64 defines the TCG_TARGET_HAS_direct_jump. So the "else" block is
useless in the case of "INDEX_op_goto_tb" in function "tcg_out_op". Add
an assertion and delete these codes for clarity.

Suggested-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 tcg/aarch64/tcg-target.c.inc | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index d997f7922a..344b63e20f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1916,24 +1916,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset != NULL) {
-            /* TCG_TARGET_HAS_direct_jump */
-            /* Ensure that ADRP+ADD are 8-byte aligned so that an atomic
-               write can be used to patch the target address. */
-            if ((uintptr_t)s->code_ptr & 7) {
-                tcg_out32(s, NOP);
-            }
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-            /* actual branch destination will be patched by
-               tb_target_set_jmp_target later. */
-            tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
-            tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
-        } else {
-            /* !TCG_TARGET_HAS_direct_jump */
-            tcg_debug_assert(s->tb_jmp_target_addr != NULL);
-            intptr_t offset = tcg_pcrel_diff(s, (s->tb_jmp_target_addr + a0)) >> 2;
-            tcg_out_insn(s, 3305, LDR, offset, TCG_REG_TMP);
+        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        /*
+         * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
+         * write can be used to patch the target address.
+         */
+        if ((uintptr_t)s->code_ptr & 7) {
+            tcg_out32(s, NOP);
         }
+        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        /*
+         * actual branch destination will be patched by
+         * tb_target_set_jmp_target later
+         */
+        tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
+        tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
         tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
         set_jmp_reset_offset(s, a0);
         break;
-- 
2.38.0


