Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192BD21ED6E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 11:57:52 +0200 (CEST)
Received: from localhost ([::1]:43632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvHh9-0003Ec-5E
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 05:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvHcV-0003dj-Fc
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 05:53:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvHcT-0003zI-EH
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 05:53:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id j4so20514221wrp.10
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 02:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uk7KvFXR8IFo8iPAcAdUbVxFh/eRiYGwB3cx2SHFrtg=;
 b=KqsuWz4RyeSYbtwvg0OG3DF295WbB6/LGoKjwHgM5y4Dbb4KXfermhPulkR85iT40r
 7vTdIgNuSMndtw0jhAemT1DMgCTosejAEbzH9hXXQyqOw7tydcGq3++rr5BW7eSXfDzQ
 NuLOJWu7SnmDnas1WpKLGCzb6qEWrlrIKLXY4GWprSDd4t8bTn3kv/nVitw0no8mK9L/
 Kyo+Kj+qRIhsSv5rh4NW7oQUIaSSzez5yADYcd2ZCoalKMvPmAmjoT95yMb2TImf5JaS
 rCAsoX9VkDS744rKtY6876XXOiwN8UDk0/xA3lE4AZ9dr1EtNerFH5ov8TzNEmAKQIBL
 zpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uk7KvFXR8IFo8iPAcAdUbVxFh/eRiYGwB3cx2SHFrtg=;
 b=kGnRFJsxqdTFPZu7KKcBuI/WPb0q2s4PhHP8FOxBsQjmmlIsUZgJ4EHAkQbigsPO9E
 IxWpUJaReuQ1LovHuJhIcL7QKQlLyUmWu0CTqZfYEKy7TrG5HfXLIc1s3XFzR1ep4JkF
 0PE7JGKFCtVHSUfb58VqLG8xLOyUetAYPoe8Q89Q+zn9fDh2DP0R1cCvtYrLLhmpgC1I
 r9e9XsBSwE0KYQCPjKV/NxuYV1I5nP45p9lTt+3HSm7/DcX1GxP3revrbnDaXpVOa5/E
 gKqZ+PALNn3dr1muTHuyzqwfHtodG8+D3eDtPIaiWXP8M9hxsiiOperCUD823a0IaE0h
 YJzA==
X-Gm-Message-State: AOAM530OLoPx1cy/ktX/zzx/3WTsYrBHEkSgYSVd+DQwg4AL0lp3x+VK
 IV1pyFOdpGggwaokoKj7GrA9oQ==
X-Google-Smtp-Source: ABdhPJzP5bEngVVMhGrelnP9R/dTQu2/74jzna/6rD3R5ZvFgI352tR6wQumWNQe8Yx2h4JFQfWOUw==
X-Received: by 2002:adf:e811:: with SMTP id o17mr4423390wrm.53.1594720379981; 
 Tue, 14 Jul 2020 02:52:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u23sm30487957wru.94.2020.07.14.02.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 02:52:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D6C51FF96;
 Tue, 14 Jul 2020 10:52:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 8/9] cputlb: ensure we save the IOTLB data in case of reset
Date: Tue, 14 Jul 2020 10:52:46 +0100
Message-Id: <20200714095247.19573-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200714095247.19573-1-alex.bennee@linaro.org>
References: <20200714095247.19573-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any write to a device might cause a re-arrangement of memory
triggering a TLB flush and potential re-size of the TLB invalidating
previous entries. This would cause users of qemu_plugin_get_hwaddr()
to see the warning:

  invalid use of qemu_plugin_get_hwaddr

because of the failed tlb_lookup which should always succeed. To
prevent this we save the IOTLB data in case it is later needed by a
plugin doing a lookup.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200713200415.26214-7-alex.bennee@linaro.org>

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5542577d2b..8f145733ce 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -259,6 +259,18 @@ struct CPUWatchpoint {
     QTAILQ_ENTRY(CPUWatchpoint) entry;
 };
 
+#ifdef CONFIG_PLUGIN
+/*
+ * For plugins we sometime need to save the resolved iotlb data before
+ * the memory regions get moved around  by io_writex.
+ */
+typedef struct SavedIOTLB {
+    hwaddr addr;
+    MemoryRegionSection *section;
+    hwaddr mr_offset;
+} SavedIOTLB;
+#endif
+
 struct KVMState;
 struct kvm_run;
 
@@ -417,7 +429,11 @@ struct CPUState {
 
     DECLARE_BITMAP(plugin_mask, QEMU_PLUGIN_EV_MAX);
 
+#ifdef CONFIG_PLUGIN
     GArray *plugin_mem_cbs;
+    /* saved iotlb data from io_writex */
+    SavedIOTLB saved_iotlb;
+#endif
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 15f5047bf1..427027a970 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -116,6 +116,7 @@ typedef struct QObject QObject;
 typedef struct QString QString;
 typedef struct RAMBlock RAMBlock;
 typedef struct Range Range;
+typedef struct SavedIOTLB SavedIOTLB;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
 typedef struct VirtIODevice VirtIODevice;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 1e815357c7..d370aedb47 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1073,6 +1073,24 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     return val;
 }
 
+/*
+ * Save a potentially trashed IOTLB entry for later lookup by plugin.
+ *
+ * We also need to track the thread storage address because the RCU
+ * cleanup that runs when we leave the critical region (the current
+ * execution) is actually in a different thread.
+ */
+static void save_iotlb_data(CPUState *cs, hwaddr addr,
+                            MemoryRegionSection *section, hwaddr mr_offset)
+{
+#ifdef CONFIG_PLUGIN
+    SavedIOTLB *saved = &cs->saved_iotlb;
+    saved->addr = addr;
+    saved->section = section;
+    saved->mr_offset = mr_offset;
+#endif
+}
+
 static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                       int mmu_idx, uint64_t val, target_ulong addr,
                       uintptr_t retaddr, MemOp op)
@@ -1092,6 +1110,12 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     }
     cpu->mem_io_pc = retaddr;
 
+    /*
+     * The memory_region_dispatch may trigger a flush/resize
+     * so for plugins we save the iotlb_data just in case.
+     */
+    save_iotlb_data(cpu, iotlbentry->addr, section, mr_offset);
+
     if (mr->global_locking && !qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
         locked = true;
@@ -1381,8 +1405,11 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
  * in the softmmu lookup code (or helper). We don't handle re-fills or
  * checking the victim table. This is purely informational.
  *
- * This should never fail as the memory access being instrumented
- * should have just filled the TLB.
+ * This almost never fails as the memory access being instrumented
+ * should have just filled the TLB. The one corner case is io_writex
+ * which can cause TLB flushes and potential resizing of the TLBs
+ * loosing the information we need. In those cases we need to recover
+ * data from a copy of the io_tlb entry.
  */
 
 bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
@@ -1406,8 +1433,13 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
             data->v.ram.hostaddr = addr + tlbe->addend;
         }
         return true;
+    } else {
+        SavedIOTLB *saved = &cpu->saved_iotlb;
+        data->is_io = true;
+        data->v.io.section = saved->section;
+        data->v.io.offset = saved->mr_offset;
+        return true;
     }
-    return false;
 }
 
 #endif
-- 
2.20.1


