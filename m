Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB55589D05
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:46:08 +0200 (CEST)
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJbAs-0006JF-Rk
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oJaqX-0005BP-LV
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:25:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59194 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oJaqT-0003rC-Ci
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:25:03 -0400
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx8M6iyOti5u8FAA--.22631S2; 
 Thu, 04 Aug 2022 21:24:50 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] target/loongarch: Fix macros SET_FPU_* in cpu.h
Date: Thu,  4 Aug 2022 21:24:50 +0800
Message-Id: <20220804132450.314329-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx8M6iyOti5u8FAA--.22631S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWrWr13ArWDuryUJryDGFg_yoW8GF1rpr
 4xCFyrtw4YyF42k3WfAFWYywnxZrW2kws7XFn7C3y7G3ZxW3WkAFyF9w10vryDW34fJF1F
 qr15A34FgFsxuFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAICV3QvP+hCAAxsW
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

The macros SET_FPU_* are used to set corresponding bits of fcsr.
Unfortunately it forgets to set the result and it causes fcsr's
"CAUSE" never being updated. This patch is to fix this bug.

Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 target/loongarch/cpu.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index a36349df83..dce999aaac 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -47,11 +47,23 @@ FIELD(FCSR0, FLAGS, 16, 5)
 FIELD(FCSR0, CAUSE, 24, 5)
 
 #define GET_FP_CAUSE(REG)      FIELD_EX32(REG, FCSR0, CAUSE)
-#define SET_FP_CAUSE(REG, V)   FIELD_DP32(REG, FCSR0, CAUSE, V)
+#define SET_FP_CAUSE(REG, V) \
+    do { \
+        (REG) = FIELD_DP32(REG, FCSR0, CAUSE, V); \
+    } while (0)
+
 #define GET_FP_ENABLES(REG)    FIELD_EX32(REG, FCSR0, ENABLES)
-#define SET_FP_ENABLES(REG, V) FIELD_DP32(REG, FCSR0, ENABLES, V)
+#define SET_FP_ENABLES(REG, V) \
+    do { \
+        (REG) = FIELD_DP32(REG, FCSR0, ENABLES, V); \
+    } while (0)
+
 #define GET_FP_FLAGS(REG)      FIELD_EX32(REG, FCSR0, FLAGS)
-#define SET_FP_FLAGS(REG, V)   FIELD_DP32(REG, FCSR0, FLAGS, V)
+#define SET_FP_FLAGS(REG, V) \
+    do { \
+        (REG) = FIELD_DP32(REG, FCSR0, FLAGS, V); \
+    } while (0)
+
 #define UPDATE_FP_FLAGS(REG, V) \
     do { \
         (REG) |= FIELD_DP32(0, FCSR0, FLAGS, V); \
-- 
2.37.1


