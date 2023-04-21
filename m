Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB486EACDB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:28:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprkS-000583-DB; Fri, 21 Apr 2023 10:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprkE-00057d-Qw
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:28:15 -0400
Received: from esa2.hc2706-39.iphmx.com ([216.71.152.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprkC-000858-Eh
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:28:14 -0400
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 273949082
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RPvw563N85JQvk5N8PbD5W5zkn2cJEfYwER7XKvMYLTBsI5bpzVTz
 DMXCm6OPvrfYWukKt4nO4/g9x4AscTVyIQySlc4qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYwr414rZ8Ek05Kio4WtB1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1EAhkcJIJC6t0pDF9Vy
 98lcQonKSCq0rfeLLKTEoGAh+wmJcjveZoB4zRuk2CfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZNIL2Q+BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvDOCkF0pgOKF3Nz9eMypfcB2m0qhi
 02Z4Wj/JxM7HfGH1m/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4zR36KZspQqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXADokhYphAQaifIL
IronPort-HdrOrdr: A9a23:ykBY/avTsU3oP/ppa+BXBFwz7skDoNV00zEX/kB9WHVpmwKj5q
 STdZMgpGPJYVMqMk3I9urwXpVoLUmsl6KdpLNhRotKPzOWxVdAUrsSlLcKqgeIc0aOldK1l5
 0QCZSWYOeRMbEQt7ec3ODXKadE/PC3tIqFv6Px9UtMcC1dQ51czm5Ce3mm+45NKDWux6BVKH
 NR3KR6TkKbCAwqhw2AaRg4Y9Q=
X-Talos-CUID: 9a23:Vag432ElBJMUFmxQqmJN+hY+A89/YkaDwUnLHWyFUFxDD428HAo=
X-Talos-MUID: 9a23:uqpAAgYg/371huBTtS/PvDRBMctRzovxFkwLtJcnkuScKnkl
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 10:28:07 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ef626ad00fso27624876d6.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682087287; x=1684679287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JmkdJ51Ll9XGx3mRu+33XKvWn0LBDBFPl3/9eGqnhLs=;
 b=eRCecfsrVOArZI1r1I9uqPRkEKuKnSpfKQhpWaBZmRcNESSXgkyNkQIE76IJir34JR
 OypA4VbSFvbkeEgYV/GWFdAHJBcEnXNTfz8ThKm1ZnedX+TTIZ6qUwutxFDnU/FZPPgd
 IJ1GxBV7ggXc30sqgb74gAQwstwHjTEV0qcxwFMJov1lYBfyzaiwRpN5CU95048P2cAU
 jpFEDotrsD3OO6OAB0vVEa7u8KmsIPGMnU+gfn7m0tCdw7ohZ0M5ncOlUjr233NgXsjC
 DQQE7vZaZf1TtyF4hnDQgJlDemw5vGlRo1duMHpvCtaNdWWB0gng2e9Q0BUmaLL6cMaC
 B3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087287; x=1684679287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JmkdJ51Ll9XGx3mRu+33XKvWn0LBDBFPl3/9eGqnhLs=;
 b=WH136eTSNQxpkhmmy/dbofdS8a0r75uO7tjMamx9BFMiCTkgyBbDtCEllhT7rb5aSr
 MYy3FqXe8tS3T7UnSgwWZxyk90eAPzUadlqjomnSOWbGL2EVRWt3kJI+i124xg4BFwQQ
 gRnt78PXblNqVeMRe8aMoErGEGHYaj/Bso3VZAsUu+qdvTlr0GMK/8GgVCY88fGwuTkd
 tOCcpzEk0IG523Gi2WIjPBjfnP9aDGFvgjYjcKcgckSMNz1SeBtG1nYlbscR9TZYuF0B
 1WH65LbChkE9MEKPg+VgkXVMQVbWvJ0yna2OvP3wvei9G8PPxafALNN4bgQ+vBIj92k4
 1/aQ==
X-Gm-Message-State: AAQBX9dSLlXX0eCBzJoEMG5gSv6N+ovFBxECIQ44oEMJl9FBoj2O6AxC
 cA8YChL1WDmkarhCDVBL4bXWI5hYcTtT1NJK1URRNmpOHzp96NdbDRhK13Ux4dXDU2f5YBUmQnT
 2/XEKoyfkBpA34pdHOuPv7LZuBtQGQVEC7a5nNW9+Eus=
X-Received: by 2002:ad4:5de2:0:b0:5ee:e20b:5dc1 with SMTP id
 jn2-20020ad45de2000000b005eee20b5dc1mr6944300qvb.10.1682087286969; 
 Fri, 21 Apr 2023 07:28:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yp+4bys73g4Xw+bPAxSC8Y5zqbVZkDTbejsNvHp17pEa+yP12rAaMnS2YvTYeRE++S+NEwhg==
X-Received: by 2002:ad4:5de2:0:b0:5ee:e20b:5dc1 with SMTP id
 jn2-20020ad45de2000000b005eee20b5dc1mr6944253qvb.10.1682087286633; 
 Fri, 21 Apr 2023 07:28:06 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a0caa57000000b005e3bda8a5e0sm1218787qvb.6.2023.04.21.07.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:28:06 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v8 1/8] memory: prevent dma-reentracy issues
Date: Fri, 21 Apr 2023 10:27:29 -0400
Message-Id: <20230421142736.2817601-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421142736.2817601-1-alxndr@bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.152.49; envelope-from=alxndr@bu.edu;
 helo=esa2.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
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

Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
This flag is set/checked prior to calling a device's MemoryRegion
handlers, and set when device code initiates DMA.  The purpose of this
flag is to prevent two types of DMA-based reentrancy issues:

1.) mmio -> dma -> mmio case
2.) bh -> dma write -> mmio case

These issues have led to problems such as stack-exhaustion and
use-after-frees.

Summary of the problem from Peter Maydell:
https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
Resolves: CVE-2023-0330

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/exec/memory.h  |  2 ++
 include/hw/qdev-core.h |  7 +++++++
 softmmu/memory.c       | 14 ++++++++++++++
 softmmu/trace-events   |  1 +
 4 files changed, 24 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6fa0b071f0..6c0a5e68d3 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -767,6 +767,8 @@ struct MemoryRegion {
     bool is_iommu;
     RAMBlock *ram_block;
     Object *owner;
+    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
+    DeviceState *dev; 
 
     const MemoryRegionOps *ops;
     void *opaque;
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bd50ad5ee1..7623703943 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -162,6 +162,10 @@ struct NamedClockList {
     QLIST_ENTRY(NamedClockList) node;
 };
 
+typedef struct {
+    bool engaged_in_io;
+} MemReentrancyGuard;
+
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
@@ -194,6 +198,9 @@ struct DeviceState {
     int alias_required_for_version;
     ResettableState reset;
     GSList *unplug_blockers;
+
+    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
+    MemReentrancyGuard mem_reentrancy_guard;
 };
 
 struct DeviceListener {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 4699ba55ec..a11ee3e30d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -542,6 +542,16 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultaneous access to a device's IO Regions */
+    if (mr->dev && !mr->disable_reentrancy_guard &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+            return MEMTX_ACCESS_ERROR;
+        }
+        mr->dev->mem_reentrancy_guard.engaged_in_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -556,6 +566,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (mr->dev) {
+        mr->dev->mem_reentrancy_guard.engaged_in_io = false;
+    }
     return r;
 }
 
@@ -1170,6 +1183,7 @@ static void memory_region_do_init(MemoryRegion *mr,
     }
     mr->name = g_strdup(name);
     mr->owner = owner;
+    mr->dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
     mr->ram_block = NULL;
 
     if (name) {
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 22606dc27b..62d04ea9a7 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
 memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
 memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
-- 
2.39.0


