Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D710474D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 01:11:59 +0100 (CET)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXa4k-0002BJ-K7
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 19:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iXa2N-0008Q8-2Q
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:09:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iXa2K-0005kO-JO
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:09:30 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40268)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iXa2K-0005k8-F3
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:09:28 -0500
Received: by mail-oi1-x242.google.com with SMTP id d22so1538515oic.7
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 16:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UyIEBMa6z9micWDikfTpKjg+QEwcylKwntebI6UKvLE=;
 b=grzm5RiApYJFWFKJHH7UXMZZ96U+atMUoaAx5W9pW3lppJAzHKtmdmuJpgZ/1aS3Gg
 /N3/Gpa0Wb+pg0w0rkWvZI8mpaJy0xlsw4gtpw8kZYUN0zPvN0jDXTMMKBNwblt5Il3m
 Mz0xSGL8GdWOZeG8/rd4uKbQ7EJEgZPq2qK7GsLw7W4uLX7AZfc3WoIFC8mYPWHNgE61
 NwPtTX2xQDN2qqaGnLeXUVLVYcH6pTc/ZQiiST04emWE/KbkQ0TazrkrzhfnrfrCfc96
 kaIiP3dg30osWS4N+deXydCCZVQwF/4FyIidtjT9b3e0wMA3SJgc2XwmuC8qNgB7bbSb
 I0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UyIEBMa6z9micWDikfTpKjg+QEwcylKwntebI6UKvLE=;
 b=dDH554YRox1TdxG1NdRRmCzkj7pnGIK9NnThJB4CCBgcKbiKudubG1ObE6w11QwhDW
 RKVTPZ5QwQzDX01g3f3vyjhxHIDfTUq//K7oz1TIQgsY73ay/tIQ6W6D8wVBYCxM1e1v
 VQDFWX6bHDWlGLhM+kO8LPaXnh0V1rHf4/RojzN2JY5M/eEKkyTqG29lxLmvzTF8R4R5
 fRRvn8v1eLZkGn2s4bND/hXMRJEJ7S8Qz6OMSgFb8TbdF0+KjqE2gcE9tRJlrzoQerEa
 5oWcLbG2zAYIsj5bEIRanpkbvUfEE32o/pBwqj6c0PyNjZ0L8tKqKBa8gnPnREk2Av/E
 IXyQ==
X-Gm-Message-State: APjAAAVLkFyxzdzRO4THrngHPD3KezVh+l0R8EvTQ2J2zcmAmlpSVDUI
 8cEZCmYL//Q1Vv9MWyQ5unZsuKryYdlH7Q==
X-Google-Smtp-Source: APXvYqxrzvRfdNo/+ct3BsAjNHOag24AiC9UMlSXBuEGLcZKHOe1PEkTY5P+kQTmfNWXoyr2KiodnA==
X-Received: by 2002:aca:f4c6:: with SMTP id s189mr5247504oih.63.1574294967317; 
 Wed, 20 Nov 2019 16:09:27 -0800 (PST)
Received: from moi-limbo-9350.arm.com
 (host86-181-127-240.range86-181.btcentralplus.com. [86.181.127.240])
 by smtp.gmail.com with ESMTPSA id z17sm351439otk.40.2019.11.20.16.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 16:09:26 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] Memory: Enable writeback for given memory region
Date: Thu, 21 Nov 2019 00:08:41 +0000
Message-Id: <20191121000843.24844-3-beata.michalska@linaro.org>
In-Reply-To: <20191121000843.24844-1-beata.michalska@linaro.org>
References: <20191121000843.24844-1-beata.michalska@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, richard.henderson@linaro.org,
 dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an option to trigger memory writeback to sync given memory region
with the corresponding backing store, case one is available.
This extends the support for persistent memory, allowing syncing on-demand.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
---
 exec.c                  | 36 ++++++++++++++++++++++++++++++++++++
 include/exec/memory.h   |  6 ++++++
 include/exec/ram_addr.h |  8 ++++++++
 include/qemu/cutils.h   |  1 +
 memory.c                | 12 ++++++++++++
 util/cutils.c           | 38 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 101 insertions(+)

diff --git a/exec.c b/exec.c
index ffdb518..a34c348 100644
--- a/exec.c
+++ b/exec.c
@@ -65,6 +65,8 @@
 #include "exec/ram_addr.h"
 #include "exec/log.h"
 
+#include "qemu/pmem.h"
+
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -2156,6 +2158,40 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
     return 0;
 }
 
+/*
+ * Trigger sync on the given ram block for range [start, start + length]
+ * with the backing store if one is available.
+ * Otherwise no-op.
+ * @Note: this is supposed to be a synchronous op.
+ */
+void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length)
+{
+    void *addr = ramblock_ptr(block, start);
+
+    /* The requested range should fit in within the block range */
+    g_assert((start + length) <= block->used_length);
+
+#ifdef CONFIG_LIBPMEM
+    /* The lack of support for pmem should not block the sync */
+    if (ramblock_is_pmem(block)) {
+        pmem_persist(addr, length);
+        return;
+    }
+#endif
+    if (block->fd >= 0) {
+        /**
+         * Case there is no support for PMEM or the memory has not been
+         * specified as persistent (or is not one) - use the msync.
+         * Less optimal but still achieves the same goal
+         */
+        if (qemu_msync(addr, length, block->fd)) {
+            warn_report("%s: failed to sync memory range: start: "
+                    RAM_ADDR_FMT " length: " RAM_ADDR_FMT,
+                    __func__, start, length);
+        }
+    }
+}
+
 /* Called with ram_list.mutex held */
 static void dirty_memory_extend(ram_addr_t old_ram_size,
                                 ram_addr_t new_ram_size)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index e499dc2..27a84e0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1265,6 +1265,12 @@ void *memory_region_get_ram_ptr(MemoryRegion *mr);
  */
 void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize,
                               Error **errp);
+/**
+ * memory_region_do_writeback: Trigger writeback for selected address range
+ * [addr, addr + size]
+ *
+ */
+void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size);
 
 /**
  * memory_region_set_log: Turn dirty logging on or off for a region.
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index bed0554..5adebb0 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -174,6 +174,14 @@ void qemu_ram_free(RAMBlock *block);
 
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
 
+void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length);
+
+/* Clear whole block of mem */
+static inline void qemu_ram_block_writeback(RAMBlock *block)
+{
+    qemu_ram_writeback(block, 0, block->used_length);
+}
+
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index b54c847..eb59852 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -130,6 +130,7 @@ const char *qemu_strchrnul(const char *s, int c);
 #endif
 time_t mktimegm(struct tm *tm);
 int qemu_fdatasync(int fd);
+int qemu_msync(void *addr, size_t length, int fd);
 int fcntl_setfl(int fd, int flag);
 int qemu_parse_fd(const char *param);
 int qemu_strtoi(const char *nptr, const char **endptr, int base,
diff --git a/memory.c b/memory.c
index 06484c2..0228cad 100644
--- a/memory.c
+++ b/memory.c
@@ -2207,6 +2207,18 @@ void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize, Error **errp
     qemu_ram_resize(mr->ram_block, newsize, errp);
 }
 
+
+void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size)
+{
+    /*
+     * Might be extended case needed to cover
+     * different types of memory regions
+     */
+    if (mr->ram_block && mr->dirty_log_mask) {
+        qemu_ram_writeback(mr->ram_block, addr, size);
+    }
+}
+
 /*
  * Call proper memory listeners about the change on the newly
  * added/removed CoalescedMemoryRange.
diff --git a/util/cutils.c b/util/cutils.c
index fd591ca..c76ed88 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -164,6 +164,44 @@ int qemu_fdatasync(int fd)
 #endif
 }
 
+/**
+ * Sync changes made to the memory mapped file back to the backing
+ * storage. For POSIX compliant systems this will fallback
+ * to regular msync call. Otherwise it will trigger whole file sync
+ * (including the metadata case there is no support to skip that otherwise)
+ *
+ * @addr   - start of the memory area to be synced
+ * @length - length of the are to be synced
+ * @fd     - file descriptor for the file to be synced
+ *           (mandatory only for POSIX non-compliant systems)
+ */
+int qemu_msync(void *addr, size_t length, int fd)
+{
+#ifdef CONFIG_POSIX
+    size_t align_mask = ~(qemu_real_host_page_size - 1);
+
+    /**
+     * There are no strict reqs as per the length of mapping
+     * to be synced. Still the length needs to follow the address
+     * alignment changes. Additionally - round the size to the multiple
+     * of PAGE_SIZE
+     */
+    length += ((uintptr_t)addr & (qemu_real_host_page_size - 1));
+    length = (length + ~align_mask) & align_mask;
+
+    addr = (void *)((uintptr_t)addr & align_mask);
+
+    return msync(addr, length, MS_SYNC);
+#else /* CONFIG_POSIX */
+    /**
+     * Perform the sync based on the file descriptor
+     * The sync range will most probably be wider than the one
+     * requested - but it will still get the job done
+     */
+    return qemu_fdatasync(fd);
+#endif /* CONFIG_POSIX */
+}
+
 #ifndef _WIN32
 /* Sets a specific flag */
 int fcntl_setfl(int fd, int flag)
-- 
2.7.4


