Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11379589C31
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:08:12 +0200 (CEST)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaaA-00061u-U7
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJaUj-00007W-HQ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:02:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52764 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJaUf-0008AQ-MY
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:02:32 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axis1Vw+tiTugFAA--.19495S4; 
 Thu, 04 Aug 2022 21:02:14 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 2/5] target/loongarch: add gdb_arch_name()
Date: Thu,  4 Aug 2022 21:02:10 +0800
Message-Id: <20220804130213.1364164-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220804130213.1364164-1-gaosong@loongson.cn>
References: <20220804130213.1364164-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axis1Vw+tiTugFAA--.19495S4
X-Coremail-Antispam: 1UD129KBjvJXoW7trW7CFWrtry7Cr4rWFW7urg_yoW8CFW8pF
 Z3uFnrKFW8JFZIyay8t398Xrn8ZrZ3uF4aqa13tr18Cw45uryvv3Wvya4qqF4UJ3yxCr4a
 vF1rCF15Xa17ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LoongArch gdb_arch_name() is "Loongarch64", Dump from GDB.

GNU gdb (GDB) 13.0.50.20220519-git
Copyright (C) 2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "loongarch64-unknown-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word".
(gdb) show architecture
The target architecture is set to "auto" (currently "Loongarch64").
(gdb)

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d84ec38cf7..94d5617639 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -661,6 +661,11 @@ static const struct SysemuCPUOps loongarch_sysemu_ops = {
 };
 #endif
 
+static gchar *loongarch_gdb_arch_name(CPUState *cs)
+{
+    return g_strdup("Loongarch64");
+}
+
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 {
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
@@ -686,6 +691,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_stop_before_watchpoint = true;
+    cc->gdb_arch_name = loongarch_gdb_arch_name;
 
 #ifdef CONFIG_TCG
     cc->tcg_ops = &loongarch_tcg_ops;
-- 
2.31.1


