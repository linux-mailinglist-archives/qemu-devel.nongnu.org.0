Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559621F5874
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:57:28 +0200 (CEST)
Received: from localhost ([::1]:37248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj36V-0006Ga-8T
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jj34X-0003ca-3Y
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:55:25 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51246)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jj34V-0005A0-Qq
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:55:24 -0400
Received: by mail-wm1-x342.google.com with SMTP id u13so2305130wml.1
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AKpSZsmxSDhJv+3Nh7RyP1/bV6hfWgn2W9oECqWqZTw=;
 b=ntxZaEryANx8smIzth6QaiD+zYPVcmqkRDEek3x85P0KKlD9el60DpgeYa81EvMsrt
 /YjlN8jnJG+nthU1BYgoBTG6uCloAcFS0NhNaXKQPBlHtET8LZGSX7v9S3P/YpBJJRbO
 7cv/SPYELjLv0jwOgv9VLDUTkjs4UvQIMI6b0fFc6xAIzf0S/384I9UhQskg+7xvuNac
 mEZiR92hBMStF/OPES1FP2pP70nVVBb1tXXnG2i1kQC1uiS2opcoKI+fFCXSFNZZMEN9
 vPdsPrqTUzx+tcuoEmn8uVm1MpvfXLCS/6xnK38PXU+9qnDpIGSHbc5688YPGdjUGrab
 +bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AKpSZsmxSDhJv+3Nh7RyP1/bV6hfWgn2W9oECqWqZTw=;
 b=Km+z47fmekcWX1gI1UEB18ybw8VdPx3V7A5gkzWiYE+oMScyiKGS85+UwGNtEspfQ6
 GlnhsqVCYcBSnain+DjnX+m7Do0/dce/b5tOccYd+/mq7ohtoEwXFPoWCvXPKK27tvBq
 btaim8ZZJ2PElz7lvIQQ/PKEli8k5dnEQBjn10cwIxTLdIJupj8Q6QCzkD4hP0vmvPg7
 GgdCqbt4S95XCg3huu89cqwB3xZTN1bHXBBTjGD44YADD6jSolBi2/14G7sCr4pfOgG7
 mEEMYN6NVBTYfN2ouVynycjn5p6mT0jSI2S7A9yyTXPbLuwnOAJ3WHEbKVe6+QwPZZhA
 DcJw==
X-Gm-Message-State: AOAM533wk9JDVsswFsH7tlnETrPsQo3F7iLDztCYvCz6n/Ra89Q/nwXt
 uMtKyD8iJCNgwOAq4zITgh6A/g==
X-Google-Smtp-Source: ABdhPJzM+80i48OlN4jn6JWv874ZtEC0hbBYihU4fwCl9JD2kjjXPPbE19Nx8PzRrN8q8BPQqOc+Gw==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr3795348wmk.171.1591804514008; 
 Wed, 10 Jun 2020 08:55:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w17sm276703wra.71.2020.06.10.08.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 08:55:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 352511FF8F;
 Wed, 10 Jun 2020 16:55:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] cputlb: ensure we save the IOTLB data in case of reset
Date: Wed, 10 Jun 2020 16:55:06 +0100
Message-Id: <20200610155509.12850-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200610155509.12850-1-alex.bennee@linaro.org>
References: <20200610155509.12850-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 robhenry@microsoft.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, peter.puhov@linaro.org,
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

---
v2
  - save the entry instead of re-running the tlb_fill.

squash! cputlb: ensure we save the IOTLB entry in case of reset
---
 accel/tcg/cputlb.c | 63 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index eb2cf9de5e6..9bf9e479c7c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1058,6 +1058,47 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     return val;
 }
 
+#ifdef CONFIG_PLUGIN
+
+typedef struct SavedIOTLB {
+    struct rcu_head rcu;
+    struct SavedIOTLB **save_loc;
+    MemoryRegionSection *section;
+    hwaddr mr_offset;
+} SavedIOTLB;
+
+static void clean_saved_entry(SavedIOTLB *s)
+{
+    atomic_rcu_set(s->save_loc, NULL);
+    g_free(s);
+}
+
+static __thread SavedIOTLB *saved_for_plugin;
+
+/*
+ * Save a potentially trashed IOTLB entry for later lookup by plugin.
+ *
+ * We also need to track the thread storage address because the RCU
+ * cleanup that runs when we leave the critical region (the current
+ * execution) is actually in a different thread.
+ */
+static void save_iotlb_data(MemoryRegionSection *section, hwaddr mr_offset)
+{
+    SavedIOTLB *s = g_new(SavedIOTLB, 1);
+    s->save_loc = &saved_for_plugin;
+    s->section = section;
+    s->mr_offset = mr_offset;
+    atomic_rcu_set(&saved_for_plugin, s);
+    call_rcu(s, clean_saved_entry, rcu);
+}
+
+#else
+static void save_iotlb_data(MemoryRegionSection *section, hwaddr mr_offset)
+{
+    /* do nothing */
+}
+#endif
+
 static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                       int mmu_idx, uint64_t val, target_ulong addr,
                       uintptr_t retaddr, MemOp op)
@@ -1077,6 +1118,12 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     }
     cpu->mem_io_pc = retaddr;
 
+    /*
+     * The memory_region_dispatch may trigger a flush/resize
+     * so for plugins we save the iotlb_data just in case.
+     */
+    save_iotlb_data(section, mr_offset);
+
     if (mr->global_locking && !qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
         locked = true;
@@ -1091,6 +1138,7 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                                MMU_DATA_STORE, mmu_idx, iotlbentry->attrs, r,
                                retaddr);
     }
+
     if (locked) {
         qemu_mutex_unlock_iothread();
     }
@@ -1366,8 +1414,11 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
  * in the softmmu lookup code (or helper). We don't handle re-fills or
  * checking the victim table. This is purely informational.
  *
- * This should never fail as the memory access being instrumented
- * should have just filled the TLB.
+ * This almost never fails as the memory access being instrumented
+ * should have just filled the TLB. The one corner case is io_writex
+ * which can cause TLB flushes and potential resizing of the TLBs
+ * loosing the information we need. In those cases we need to recover
+ * data from a thread local copy of the io_tlb entry.
  */
 
 bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
@@ -1391,6 +1442,14 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
             data->v.ram.hostaddr = addr + tlbe->addend;
         }
         return true;
+    } else {
+        SavedIOTLB *saved = atomic_rcu_read(&saved_for_plugin);
+        if (saved) {
+            data->is_io = true;
+            data->v.io.section = saved->section;
+            data->v.io.offset = saved->mr_offset;
+            return true;
+        }
     }
     return false;
 }
-- 
2.20.1


