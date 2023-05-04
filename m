Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747026F6B2D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:29:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4V-0001Sz-E4; Thu, 04 May 2023 08:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4O-0001RR-1g
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:24 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4K-0002yF-6k
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:23 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx+endpFNkfaAEAA--.7527S3;
 Thu, 04 May 2023 20:28:13 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S4; 
 Thu, 04 May 2023 20:28:13 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 02/44] target/loongarch: meson.build support build LSX
Date: Thu,  4 May 2023 20:27:28 +0800
Message-Id: <20230504122810.4094787-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S4
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7WFWDtr1kJry3ur4xCF4xtFb_yoW8trykpr
 17ur18KF48JrZ3A3ZagayYqry5Xa1UGw42qayIq3s3Ar47XryxZF4kt3sFgFW7J3WUury0
 qF1Fkw1UWF48XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b08Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xAC
 xx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx2
 6rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/insn_trans/trans_lsx.c.inc | 5 +++++
 target/loongarch/lsx_helper.c               | 6 ++++++
 target/loongarch/meson.build                | 1 +
 target/loongarch/translate.c                | 1 +
 4 files changed, 13 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_lsx.c.inc
 create mode 100644 target/loongarch/lsx_helper.c

diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
new file mode 100644
index 0000000000..1cf3ab34a9
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LSX translate functions
+ * Copyright (c) 2022-2023 Loongson Technology Corporation Limited
+ */
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
new file mode 100644
index 0000000000..9332163aff
--- /dev/null
+++ b/target/loongarch/lsx_helper.c
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch LSX helper functions.
+ *
+ * Copyright (c) 2022-2023 Loongson Technology Corporation Limited
+ */
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 9293a8ab78..1117a51c52 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -11,6 +11,7 @@ loongarch_tcg_ss.add(files(
   'op_helper.c',
   'translate.c',
   'gdbstub.c',
+  'lsx_helper.c',
 ))
 loongarch_tcg_ss.add(zlib)
 
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 21d86077f4..97e019aeb4 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -171,6 +171,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fmemory.c.inc"
 #include "insn_trans/trans_branch.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_lsx.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
2.31.1


