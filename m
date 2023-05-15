Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDE702B4D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:20:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWEh-0002DO-4W; Mon, 15 May 2023 07:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pyWEd-00029d-V2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:19:24 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pyWEZ-0001Vk-E6
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:19:22 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxOuoxFWJk0ssIAA--.14981S3;
 Mon, 15 May 2023 19:19:13 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a8tFWJkkOZfAA--.35452S7; 
 Mon, 15 May 2023 19:19:13 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 5/5] hw/intc: Add NULL pointer check on LoongArch ipi device
Date: Mon, 15 May 2023 19:19:08 +0800
Message-Id: <20230515111908.2606580-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230515111908.2606580-1-gaosong@loongson.cn>
References: <20230515111908.2606580-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a8tFWJkkOZfAA--.35452S7
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGw1kZF4DZF43XFy5Xr1xAFb_yoW5ZFW3pr
 9ruwnIqr18tFZrXas5W34UXFn8Jr4xW342vF43K3sYkr4kZrykWrZ5t3s7ZFn8C34rXFyY
 vwn7Ar4jg3W7XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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

When ipi mailbox is used, cpu_index is decoded from iocsr register.
cpu maybe does not exist. This patch adds NULL pointer check on
ipi device.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230512100421.1867848-4-gaosong@loongson.cn>
---
 hw/intc/loongarch_ipi.c | 40 +++++++++++++++++++++++++++++-----------
 hw/intc/trace-events    |  1 +
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 054e143842..d6ab91721e 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -77,31 +77,42 @@ static void send_ipi_data(CPULoongArchState *env, uint64_t val, hwaddr addr)
 
 static void ipi_send(uint64_t val)
 {
-    int cpuid, data;
+    uint32_t cpuid;
+    uint8_t vector;
     CPULoongArchState *env;
     CPUState *cs;
     LoongArchCPU *cpu;
 
-    cpuid = (val >> 16) & 0x3ff;
+    cpuid = extract32(val, 16, 10);
+    if (cpuid >= LOONGARCH_MAX_CPUS) {
+        trace_loongarch_ipi_unsupported_cpuid("IOCSR_IPI_SEND", cpuid);
+        return;
+    }
+
     /* IPI status vector */
-    data = 1 << (val & 0x1f);
+    vector = extract8(val, 0, 5);
+
     cs = qemu_get_cpu(cpuid);
     cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
     address_space_stl(&env->address_space_iocsr, 0x1008,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
-
+                      BIT(vector), MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
 static void mail_send(uint64_t val)
 {
-    int cpuid;
+    uint32_t cpuid;
     hwaddr addr;
     CPULoongArchState *env;
     CPUState *cs;
     LoongArchCPU *cpu;
 
-    cpuid = (val >> 16) & 0x3ff;
+    cpuid = extract32(val, 16, 10);
+    if (cpuid >= LOONGARCH_MAX_CPUS) {
+        trace_loongarch_ipi_unsupported_cpuid("IOCSR_MAIL_SEND", cpuid);
+        return;
+    }
+
     addr = 0x1020 + (val & 0x1c);
     cs = qemu_get_cpu(cpuid);
     cpu = LOONGARCH_CPU(cs);
@@ -111,14 +122,21 @@ static void mail_send(uint64_t val)
 
 static void any_send(uint64_t val)
 {
-    int cpuid;
+    uint32_t cpuid;
     hwaddr addr;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
+
+    cpuid = extract32(val, 16, 10);
+    if (cpuid >= LOONGARCH_MAX_CPUS) {
+        trace_loongarch_ipi_unsupported_cpuid("IOCSR_ANY_SEND", cpuid);
+        return;
+    }
 
-    cpuid = (val >> 16) & 0x3ff;
     addr = val & 0xffff;
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    cs = qemu_get_cpu(cpuid);
+    cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
     send_ipi_data(env, val, addr);
 }
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 50cadfb996..5c6094c457 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -292,6 +292,7 @@ sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
 # loongarch_ipi.c
 loongarch_ipi_read(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
 loongarch_ipi_write(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
+loongarch_ipi_unsupported_cpuid(const char *s, uint32_t cpuid) "%s unsupported cpuid 0x%" PRIx32
 
 # loongarch_pch_pic.c
 loongarch_pch_pic_irq_handler(int irq, int level) "irq %d level %d"
-- 
2.39.1


