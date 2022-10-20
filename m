Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6305C605AFA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:18:57 +0200 (CEST)
Received: from localhost ([::1]:60420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRhY-0005EC-80
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:18:56 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRhY-0004ao-00
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1olRU8-0002rX-V2
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:05:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48402 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1olRU6-000091-3t
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:05:04 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cxq9g4D1FjJP8AAA--.5026S3;
 Thu, 20 Oct 2022 17:04:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxb+I4D1FjP9UBAA--.7687S3; 
 Thu, 20 Oct 2022 17:04:56 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 f4bug@amsat.org, philmd@linaro.org
Subject: [PATCH v7 1/2] hw/intc: Convert the memops to with_attrs in LoongArch
 extioi
Date: Thu, 20 Oct 2022 17:04:54 +0800
Message-Id: <20221020090455.2371099-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221020090455.2371099-1-yangxiaojuan@loongson.cn>
References: <20221020090455.2371099-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+I4D1FjP9UBAA--.7687S3
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKw1xXFWktF18Jw4rur43Awb_yoWxGw18pr
 y7uwnI9r1Utayfu3Z0g3WUXF1kGws3W347ZFWI934F9w18Ar1S9Fyqqw1vyF4UCaykJ3yU
 tFn3Aw4UZF4jq3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

Converting the MemoryRegionOps read/write handlers to
with_attrs in LoongArch extioi emulation.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_extioi.c      | 32 +++++++++++++++++---------------
 hw/intc/trace-events            |  3 +--
 target/loongarch/iocsr_helper.c | 18 ++++++++++--------
 3 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index 22803969bc..16f2261844 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -17,7 +17,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-
 static void extioi_update_irq(LoongArchExtIOI *s, int irq, int level)
 {
     int ipnum, cpu, found, irq_index, irq_mask;
@@ -68,44 +67,45 @@ static void extioi_setirq(void *opaque, int irq, int level)
     extioi_update_irq(s, irq, level);
 }
 
-static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
+static MemTxResult extioi_readw(void *opaque, hwaddr addr, uint64_t *data,
+                                unsigned size, MemTxAttrs attrs)
 {
     LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
     unsigned long offset = addr & 0xffff;
-    uint32_t index, cpu, ret = 0;
+    uint32_t index, cpu;
 
     switch (offset) {
     case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
         index = (offset - EXTIOI_NODETYPE_START) >> 2;
-        ret = s->nodetype[index];
+        *data = s->nodetype[index];
         break;
     case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
         index = (offset - EXTIOI_IPMAP_START) >> 2;
-        ret = s->ipmap[index];
+        *data = s->ipmap[index];
         break;
     case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
         index = (offset - EXTIOI_ENABLE_START) >> 2;
-        ret = s->enable[index];
+        *data = s->enable[index];
         break;
     case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
         index = (offset - EXTIOI_BOUNCE_START) >> 2;
-        ret = s->bounce[index];
+        *data = s->bounce[index];
         break;
     case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
         index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
         cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
-        ret = s->coreisr[cpu][index];
+        *data = s->coreisr[cpu][index];
         break;
     case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
         index = (offset - EXTIOI_COREMAP_START) >> 2;
-        ret = s->coremap[index];
+        *data = s->coremap[index];
         break;
     default:
         break;
     }
 
-    trace_loongarch_extioi_readw(addr, ret);
-    return ret;
+    trace_loongarch_extioi_readw(addr, *data);
+    return MEMTX_OK;
 }
 
 static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
@@ -127,8 +127,9 @@ static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
     }
 }
 
-static void extioi_writew(void *opaque, hwaddr addr,
-                          uint64_t val, unsigned size)
+static MemTxResult extioi_writew(void *opaque, hwaddr addr,
+                          uint64_t val, unsigned size,
+                          MemTxAttrs attrs)
 {
     LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
     int i, cpu, index, old_data, irq;
@@ -231,11 +232,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
     default:
         break;
     }
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps extioi_ops = {
-    .read = extioi_readw,
-    .write = extioi_writew,
+    .read_with_attrs = extioi_readw,
+    .write_with_attrs = extioi_writew,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
     .valid.min_access_size = 4,
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 0a90c1cdec..6fbc2045e6 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -306,6 +306,5 @@ loongarch_msi_set_irq(int irq_num) "set msi irq %d"
 
 # loongarch_extioi.c
 loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level %d"
-loongarch_extioi_readw(uint64_t addr, uint32_t val) "addr: 0x%"PRIx64 "val: 0x%x"
+loongarch_extioi_readw(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
 loongarch_extioi_writew(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
-
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
index 0e9c537dc7..dd34bb54e6 100644
--- a/target/loongarch/iocsr_helper.c
+++ b/target/loongarch/iocsr_helper.c
@@ -14,54 +14,56 @@
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-ldst.h"
 
+#define GET_MEMTXATTRS(cs) ((MemTxAttrs) {.requester_id = cs->cpu_index})
+
 uint64_t helper_iocsrrd_b(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldub(&env->address_space_iocsr, r_addr,
-                              MEMTXATTRS_UNSPECIFIED, NULL);
+                              GET_MEMTXATTRS(env_cpu(env)), NULL);
 }
 
 uint64_t helper_iocsrrd_h(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_lduw(&env->address_space_iocsr, r_addr,
-                              MEMTXATTRS_UNSPECIFIED, NULL);
+                              GET_MEMTXATTRS(env_cpu(env)), NULL);
 }
 
 uint64_t helper_iocsrrd_w(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldl(&env->address_space_iocsr, r_addr,
-                             MEMTXATTRS_UNSPECIFIED, NULL);
+                             GET_MEMTXATTRS(env_cpu(env)), NULL);
 }
 
 uint64_t helper_iocsrrd_d(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldq(&env->address_space_iocsr, r_addr,
-                             MEMTXATTRS_UNSPECIFIED, NULL);
+                             GET_MEMTXATTRS(env_cpu(env)), NULL);
 }
 
 void helper_iocsrwr_b(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stb(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, GET_MEMTXATTRS(env_cpu(env)), NULL);
 }
 
 void helper_iocsrwr_h(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stw(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, GET_MEMTXATTRS(env_cpu(env)), NULL);
 }
 
 void helper_iocsrwr_w(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stl(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, GET_MEMTXATTRS(env_cpu(env)), NULL);
 }
 
 void helper_iocsrwr_d(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stq(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, GET_MEMTXATTRS(env_cpu(env)), NULL);
 }
-- 
2.31.1


