Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC579B75
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 23:48:49 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsDVg-0007jH-Tn
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 17:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33661)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hsDUn-0006vf-Dq
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hsDUk-0003Kc-Qk
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:47:52 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:32930)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hsDUk-0003Ju-ER
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:47:50 -0400
Received: by mail-wr1-x442.google.com with SMTP id n9so63546602wru.0
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 14:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pTcqJxuHRzx/IgdDui6F+TGTCaaxU5b/6/alrJ5LvsA=;
 b=NI4nBOH1ZEgLkBba/65dOnP1/cB7YQvb0jTF7M1jWFhCKEORkpeDm3RDgEyGIRcJRQ
 N3OWvju2Z0VUV5ARROVmoxvPBAwnyTB9LZvdgY9vwCELk19y/HoG0u7u5z2e2ZEWty2G
 apRib53aBc5zVDguuBON2dDARx5iiFhowG23iwBgTD2nVGYnOIA8BnJ7mR3+g5GoGBs2
 Is+fuWIX5VtEW0Lf+JtwaXop9FUgBijE4PzNM5/XrIefMrVtokhjC4cGIxzfRQXxeBXL
 7hmVtHZCiXnTxrJTjayJhY8gFMYhhHlyADiCXrRluYpzcWszdX+58f0XYHq1VS0nsW3L
 6uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pTcqJxuHRzx/IgdDui6F+TGTCaaxU5b/6/alrJ5LvsA=;
 b=sfa9kbb9JYodkJ1vjxYb0DnC3qwhb2lmF3QOCLbwbAbPHxvMnkmbAuImwfxneIkHh2
 PP+6zQDyjh4hGNDxGH/F1w+XnuAQzJ9Zk+TFd5EYoJxvaJRiaUyAkQTlpy+CW/uHiaWs
 4eRACK3vyrOcepGrJBt05ArClnwInlMXQ4Y9W87nQ06of0IMorqeqBZ3lSvrSl5IAKBX
 HCd4C92a5r9xfHFWXumM6sS4PtG3wVEAPDIQjQahD6Ps2+/MBVro61DW6m1ftoEwzDT6
 cUtJOJhQfa2e2KtSzXrx3LQG22nwGb4i/LRvjXjJenVf1FB7EesS0+5y2JWkYErOcpIi
 frMQ==
X-Gm-Message-State: APjAAAWX6nlbvx3k1AOw/Nqb1McjurmXpPgsWsGiPWFyHToVPLCVQ9aZ
 9G+EsYE91meJArwB1MXCpvLqvlOVMjc=
X-Google-Smtp-Source: APXvYqwNKYtYxcZcrppFnJalR/XTwvHD03cFu1jMbQcUk2e6nM3pFVsR+/aaiCcO+tvpS8FUoQ4frQ==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr38450719wrn.244.1564436868808; 
 Mon, 29 Jul 2019 14:47:48 -0700 (PDT)
Received: from donizetti.lan ([2001:b07:6468:f312:29d3:6123:6d5f:2c04])
 by smtp.gmail.com with ESMTPSA id s3sm62983238wmh.27.2019.07.29.14.47.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 14:47:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 23:47:17 +0200
Message-Id: <20190729214717.6616-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190729214717.6616-1-pbonzini@redhat.com>
References: <20190729214717.6616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH] memory: introduce
 memory_global_after_dirty_log_sync
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
Cc: peter.maydell@linaro.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a race between TCG and accesses to the dirty log:

      vCPU thread                  reader thread
      -----------------------      -----------------------
      TLB check -> slow path
        notdirty_mem_write
          write to RAM
          set dirty flag
                                   clear dirty flag
      TLB check -> fast path
                                   read memory
        write to RAM

Fortunately, in order to fix it, no change is required to the
vCPU thread.  However, the reader thread must delay the read after
the vCPU thread has finished the write.  This can be approximated
conservatively by run_on_cpu, which waits for the end of the current
translation block.

A similar technique is used by KVM, which has to do a synchronous TLB
flush after doing a test-and-clear of the dirty-page flags.

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 exec.c                | 31 +++++++++++++++++++++++++++++++
 include/exec/memory.h | 12 ++++++++++++
 memory.c              | 10 +++++++++-
 migration/ram.c       |  1 +
 4 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 3e78de3b8f..ae68f72da4 100644
--- a/exec.c
+++ b/exec.c
@@ -198,6 +198,7 @@ typedef struct subpage_t {
 
 static void io_mem_init(void);
 static void memory_map_init(void);
+static void tcg_log_global_after_sync(MemoryListener *listener);
 static void tcg_commit(MemoryListener *listener);
 
 static MemoryRegion io_mem_watch;
@@ -906,6 +907,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     newas->cpu = cpu;
     newas->as = as;
     if (tcg_enabled()) {
+        newas->tcg_as_listener.log_global_after_sync = tcg_log_global_after_sync;
         newas->tcg_as_listener.commit = tcg_commit;
         memory_listener_register(&newas->tcg_as_listener, as);
     }
@@ -3143,6 +3145,35 @@ void address_space_dispatch_free(AddressSpaceDispatch *d)
     g_free(d);
 }
 
+static void do_nothing(CPUState *cpu, run_on_cpu_data d)
+{
+}
+
+static void tcg_log_global_after_sync(MemoryListener *listener)
+{
+    CPUAddressSpace *cpuas;
+
+    /* Wait for the CPU to end the current TB.  This avoids the following
+     * incorrect race:
+     *
+     *      vCPU                         migration
+     *      ----------------------       -------------------------
+     *      TLB check -> slow path
+     *        notdirty_mem_write
+     *          write to RAM
+     *          mark dirty
+     *                                   clear dirty flag
+     *      TLB check -> fast path
+     *                                   read memory
+     *        write to RAM
+     *
+     * by pushing the migration thread's memory read after the vCPU thread has
+     * written the memory.
+     */
+    cpuas = container_of(listener, CPUAddressSpace, tcg_as_listener);
+    run_on_cpu(cpuas->cpu, do_nothing, RUN_ON_CPU_NULL);
+}
+
 static void tcg_commit(MemoryListener *listener)
 {
     CPUAddressSpace *cpuas;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bb0961ddb9..b6bcf31b0a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -419,6 +419,7 @@ struct MemoryListener {
     void (*log_clear)(MemoryListener *listener, MemoryRegionSection *section);
     void (*log_global_start)(MemoryListener *listener);
     void (*log_global_stop)(MemoryListener *listener);
+    void (*log_global_after_sync)(MemoryListener *listener);
     void (*eventfd_add)(MemoryListener *listener, MemoryRegionSection *section,
                         bool match_data, uint64_t data, EventNotifier *e);
     void (*eventfd_del)(MemoryListener *listener, MemoryRegionSection *section,
@@ -1681,6 +1682,17 @@ MemoryRegionSection memory_region_find(MemoryRegion *mr,
  */
 void memory_global_dirty_log_sync(void);
 
+/**
+ * memory_global_dirty_log_sync: synchronize the dirty log for all memory
+ *
+ * Synchronizes the vCPUs with a thread that is reading the dirty bitmap.
+ * This function must be called after the dirty log bitmap is cleared, and
+ * before dirty guest memory pages are read.  If you are using
+ * #DirtyBitmapSnapshot, memory_region_snapshot_and_clear_dirty() takes
+ * care of doing this.
+ */
+void memory_global_after_dirty_log_sync(void);
+
 /**
  * memory_region_transaction_begin: Start a transaction.
  *
diff --git a/memory.c b/memory.c
index e42d63a3a0..edd0c13c38 100644
--- a/memory.c
+++ b/memory.c
@@ -2127,9 +2127,12 @@ DirtyBitmapSnapshot *memory_region_snapshot_and_clear_dirty(MemoryRegion *mr,
                                                             hwaddr size,
                                                             unsigned client)
 {
+    DirtyBitmapSnapshot *snapshot;
     assert(mr->ram_block);
     memory_region_sync_dirty_bitmap(mr);
-    return cpu_physical_memory_snapshot_and_clear_dirty(mr, addr, size, client);
+    snapshot = cpu_physical_memory_snapshot_and_clear_dirty(mr, addr, size, client);
+    memory_global_after_dirty_log_sync();
+    return snapshot;
 }
 
 bool memory_region_snapshot_get_dirty(MemoryRegion *mr, DirtyBitmapSnapshot *snap,
@@ -2620,6 +2623,11 @@ void memory_global_dirty_log_sync(void)
     memory_region_sync_dirty_bitmap(NULL);
 }
 
+void memory_global_after_dirty_log_sync(void)
+{
+    MEMORY_LISTENER_CALL_GLOBAL(log_global_after_sync, Forward);
+}
+
 static VMChangeStateEntry *vmstate_change;
 
 void memory_global_dirty_log_start(void)
diff --git a/migration/ram.c b/migration/ram.c
index 2b0774c2bf..b9d6a3921d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1801,6 +1801,7 @@ static void migration_bitmap_sync(RAMState *rs)
     rcu_read_unlock();
     qemu_mutex_unlock(&rs->bitmap_mutex);
 
+    memory_global_after_dirty_log_sync();
     trace_migration_bitmap_sync_end(rs->num_dirty_pages_period);
 
     end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
-- 
2.21.0


