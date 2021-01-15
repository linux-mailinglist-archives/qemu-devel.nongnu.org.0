Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E32F714E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:59:44 +0100 (CET)
Received: from localhost ([::1]:35362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0GH1-0000Uu-FQ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GEL-0006y4-70
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:56:57 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GEI-0004kW-9b
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:56:56 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DH6ly6rFSz7Gw8;
 Fri, 15 Jan 2021 11:55:42 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 11:56:36 +0800
Subject: [PATCH v2 2/5] softmmu: braces {} are needed for if statement
From: chaihaoyu <chaihaoyu1@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Message-ID: <ccc5bed3-0614-da43-8260-8b3a341bbb2a@huawei.com>
Date: Fri, 15 Jan 2021 11:56:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=chaihaoyu1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error messages found by checkpatch.pl:
braces {} are needed for if statement

Signed-off-by: Haoyu Chai <chaihaoyu1@huawei.com>

---
 softmmu/cpus.c         |  6 ++++--
 softmmu/dma-helpers.c  |  3 ++-
 softmmu/memory.c       |  3 ++-
 softmmu/physmem.c      | 15 ++++++++++-----
 softmmu/qdev-monitor.c | 12 ++++++++----
 5 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 1dc20b9dc3..0d16855543 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -744,8 +744,9 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,

     while (size != 0) {
         l = sizeof(buf);
-        if (l > size)
+        if (l > size) {
             l = size;
+        }
         if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
             error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId64
                              " specified", orig_addr, orig_size);
@@ -778,8 +779,9 @@ void qmp_pmemsave(int64_t addr, int64_t size, const char *filename,

     while (size != 0) {
         l = sizeof(buf);
-        if (l > size)
+        if (l > size) {
             l = size;
+        }
         cpu_physical_memory_read(addr, buf, l);
         if (fwrite(buf, 1, l, f) != l) {
             error_setg(errp, QERR_IO_ERROR);
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 29001b5459..ccea3a7750 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -165,8 +165,9 @@ static void dma_blk_cb(void *opaque, int ret)
                 }
             }
         }
-        if (!mem)
+        if (!mem) {
             break;
+        }
         qemu_iovec_add(&dbs->iov, mem, cur_len);
         dbs->sg_cur_byte += cur_len;
         if (dbs->sg_cur_byte == dbs->sg->sg[dbs->sg_cur_index].len) {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 2d346b9de4..0ff81def99 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -671,8 +671,9 @@ void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque)
     assert(cb);

     FOR_EACH_FLAT_RANGE(fr, fv) {
-        if (cb(fr->addr.start, fr->addr.size, fr->mr, opaque))
+        if (cb(fr->addr.start, fr->addr.size, fr->mr, opaque)) {
             break;
+        }
     }
 }

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6301f4f0a5..43e37660c7 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -797,8 +797,9 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
         tlb_flush(cpu);
     }

-    if (watchpoint)
+    if (watchpoint) {
         *watchpoint = wp;
+    }
     return 0;
 }

@@ -1210,8 +1211,9 @@ void flatview_add_to_dispatch(FlatView *fv, MemoryRegionSection *section)

 void qemu_flush_coalesced_mmio_buffer(void)
 {
-    if (kvm_enabled())
+    if (kvm_enabled()) {
         kvm_flush_coalesced_mmio_buffer();
+    }
 }

 void qemu_mutex_lock_ramlist(void)
@@ -2495,8 +2497,9 @@ static int subpage_register(subpage_t *mmio, uint32_t start, uint32_t end,
 {
     int idx, eidx;

-    if (start >= TARGET_PAGE_SIZE || end >= TARGET_PAGE_SIZE)
+    if (start >= TARGET_PAGE_SIZE || end >= TARGET_PAGE_SIZE) {
         return -1;
+    }
     idx = SUBPAGE_IDX(start);
     eidx = SUBPAGE_IDX(end);
 #if defined(DEBUG_SUBPAGE)
@@ -3410,11 +3413,13 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         phys_addr = cpu_get_phys_page_attrs_debug(cpu, page, &attrs);
         asidx = cpu_asidx_from_attrs(cpu, attrs);
         /* if no physical page mapped, return an error */
-        if (phys_addr == -1)
+        if (phys_addr == -1) {
             return -1;
+        }
         l = (page + TARGET_PAGE_SIZE) - addr;
-        if (l > len)
+        if (l > len) {
             l = len;
+        }
         phys_addr += (addr & ~TARGET_PAGE_MASK);
         if (is_write) {
             res = address_space_write_rom(cpu->cpu_ases[asidx].as, phys_addr,
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a681d6a4e8..8642b2a208 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -182,10 +182,12 @@ static int set_property(void *opaque, const char *name, const char *value,
 {
     Object *obj = opaque;

-    if (strcmp(name, "driver") == 0)
+    if (strcmp(name, "driver") == 0) {
         return 0;
-    if (strcmp(name, "bus") == 0)
+    }
+    if (strcmp(name, "bus") == 0) {
         return 0;
+    }

     if (!object_property_parse(obj, name, value, errp)) {
         return -1;
@@ -683,8 +685,9 @@ static void qbus_print(Monitor *mon, BusState *bus, int indent);
 static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
                              int indent)
 {
-    if (!props)
+    if (!props) {
         return;
+    }
     for (; props->name; props++) {
         char *value;
         char *legacy_name = g_strdup_printf("legacy-%s", props->name);
@@ -769,8 +772,9 @@ static void qbus_print(Monitor *mon, BusState *bus, int indent)

 void hmp_info_qtree(Monitor *mon, const QDict *qdict)
 {
-    if (sysbus_get_default())
+    if (sysbus_get_default()) {
         qbus_print(mon, sysbus_get_default(), 0);
+    }
 }

 void hmp_info_qdm(Monitor *mon, const QDict *qdict)
-- 
2.29.1.59.gf9b6481aed


