Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61471611ACA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:19:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUrA-0001gO-8z; Fri, 28 Oct 2022 15:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr7-0001fu-2k
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:25 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr4-00031W-PF
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:24 -0400
X-IronPort-RemoteIP: 209.85.166.71
X-IronPort-MID: 234531092
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GN0obKvH8XStF/lKIjxazFDYX+fnVOdcMUV32f8akzHdYApBsoF/q
 tZmKTjVb/aDN2H9KYogady+9ExSvZOHzNc1Gwdrrnw0ES5D9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlI5gdWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJEZsZqtJ3OFeO2AN5
 aATLW81UT7SwP3jldpXSsE07igiBMziPYdau3Y5iD+GVLApRpfMR6iM7thdtNsyrpoWTLCOO
 oxAN2QpM02ojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKIkFEqieC8arI5fPSKTOt1m1iCv
 lmewDmiWhExa82+xiSKpyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m8vqvF3+hPyCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBeJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:Gxdydqh52ewpYKugGA7q2djujHBQXuwji2hC6mlwRA09TyX+ra
 yTdZUguiMc7Qx7ZJhOo7690cW7IE80jKQFhbX5X43SPzUOyVHJEGgK1+KLqVDd8kvFh4tgPM
 xbAspD4bPLfCFHpPe/zA6kE8sxhPmrmZrY/ds2Fk0dKj2CvZsQiTtENg==
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 15:17:16 -0400
Received: by mail-io1-f71.google.com with SMTP id
 a6-20020a056602208600b006bff2e56943so4979619ioa.11
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgfRpfP6VLgnjp69pRpP49HK9NoPSMvm+MPLV3BTs1g=;
 b=l9yLlxHZgGcOfagwyR24EdYFf0ry8dC2w5a4cCUD39A8OKPqmugwtkbSaTAaZDWUCL
 yhwBbvbXjF1hrePUmQ3AFcevI2/8qRmg4vJDjPruj/z5M/fY4y5Wbl8TS5DX4hZvjnxa
 gUeGyAXcPmp+rR6Z80yoCibKs3J2K2Jo5hJu6dEFHR/EaBvl26xGYnxkYMxcyhJlP4sD
 kz+HLoQVw5ame6mOTZsjFRj00Sl/wR+vUEIcgNCUy2wRVcU8+JdKuuZpPhx3hhif29C7
 rtEfocCsaBRDSZ3nKETrJfwRXbtw+7e9SzZku/SH/pU2GXUXnFu54rcrUoitRv8nMV7O
 e3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgfRpfP6VLgnjp69pRpP49HK9NoPSMvm+MPLV3BTs1g=;
 b=npxDjVXLHAfcC/U+MPIrdAyy8yK9+lyAtvG8FOJneFN21vnJWlA1Sr6ZWm2heKWrjD
 nLh71/yLwCN+8ApMp5/68DhaJybQGOqI23smHls3BIApuIyRuZ+rl/X57xRsmjt58jDX
 pYiP2MWs6zm9tJZCHzDRKHmWWNbM3NRjOJfhlYld1oGxmfELBXSUOfwxxXaDuvvpcysB
 RFTWwMZ0kFes52mz8VZ9b4C/aKVq5lHAE9TBPwWzvji4I5KsN9t057agWVFIHsKp0QHa
 4Z0wVO8OtoAVZp87lqDEx6F+yAC3Uyd4b4qlMmdEV3GpyMwDp3+HTGDf4s7p0YkbrBYf
 2tnw==
X-Gm-Message-State: ACrzQf3py3btrhyh2nT7P4xCE2rATyMVG21LQZ9D7bUXolzQYLJ3MkG6
 Gx/J3RH4av0kM8NqgTBwi2bonAMm6pU4o/FiM8qqL+y6gKUZv7E8xC4Nk+47RX0AvoLZW0VHuQz
 o5u+VNrgeaTmcpEAYXVodBVZwh8zULw==
X-Received: by 2002:a05:6602:26d2:b0:6a3:f044:a942 with SMTP id
 g18-20020a05660226d200b006a3f044a942mr528744ioo.50.1666984635452; 
 Fri, 28 Oct 2022 12:17:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4NEq4mgrxteIQyAOsG5zQLpgDSmxjuSf88TBvXeut7O1tbLwMSmITnuW4QdpN+OulCyEZv4g==
X-Received: by 2002:a05:6602:26d2:b0:6a3:f044:a942 with SMTP id
 g18-20020a05660226d200b006a3f044a942mr528715ioo.50.1666984635165; 
 Fri, 28 Oct 2022 12:17:15 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056e021c0500b002fff117027dsm1878505ilh.13.2022.10.28.12.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:17:14 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v3 1/7] memory: associate DMA accesses with the initiator
 Device
Date: Fri, 28 Oct 2022 15:16:42 -0400
Message-Id: <20221028191648.964076-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add transitionary DMA APIs which associate accesses with the device
initiating them. The modified APIs maintain a "MemReentrancyGuard" in
the DeviceState, which is used to prevent DMA re-entrancy issues.
The MemReentrancyGuard is set/checked when entering IO handlers and when
initiating a DMA access.

1.) mmio -> dma -> mmio case
2.) bh -> dma write -> mmio case

These issues have led to problems such as stack-exhaustion and
use-after-frees.

Summary of the problem from Peter Maydell:
https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/qdev-core.h |  2 ++
 include/sysemu/dma.h   | 41 +++++++++++++++++++++++++++++++++++++++++
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 4 files changed, 59 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 785dd5a56e..ab78d211af 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -8,6 +8,7 @@
 #include "qom/object.h"
 #include "hw/hotplug.h"
 #include "hw/resettable.h"
+#include "sysemu/dma.h"
 
 enum {
     DEV_NVECTORS_UNSPECIFIED = -1,
@@ -194,6 +195,7 @@ struct DeviceState {
     int alias_required_for_version;
     ResettableState reset;
     GSList *unplug_blockers;
+    MemReentrancyGuard mem_reentrancy_guard;
 };
 
 struct DeviceListener {
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index a1ac5bc1b5..879b666bbb 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -15,6 +15,10 @@
 #include "block/block.h"
 #include "block/accounting.h"
 
+typedef struct {
+    bool engaged_in_io;
+} MemReentrancyGuard;
+
 typedef enum {
     DMA_DIRECTION_TO_DEVICE = 0,
     DMA_DIRECTION_FROM_DEVICE = 1,
@@ -321,4 +325,41 @@ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
 uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end,
                                int max_addr_bits);
 
+#define REENTRANCY_GUARD(func, ret_type, dev, ...) \
+    ({\
+     ret_type retval;\
+     MemReentrancyGuard prior_guard_state = dev->mem_reentrancy_guard;\
+     dev->mem_reentrancy_guard.engaged_in_io = 1;\
+     retval = func(__VA_ARGS__);\
+     dev->mem_reentrancy_guard = prior_guard_state;\
+     retval;\
+     })
+#define REENTRANCY_GUARD_NORET(func, dev, ...) \
+    ({\
+     MemReentrancyGuard prior_guard_state = dev->mem_reentrancy_guard;\
+     dev->mem_reentrancy_guard.engaged_in_io = 1;\
+     func(__VA_ARGS__);\
+     dev->mem_reentrancy_guard = prior_guard_state;\
+     })
+#define dma_memory_rw_guarded(dev, ...) \
+    REENTRANCY_GUARD(dma_memory_rw, MemTxResult, dev, __VA_ARGS__)
+#define dma_memory_read_guarded(dev, ...) \
+    REENTRANCY_GUARD(dma_memory_read, MemTxResult, dev, __VA_ARGS__)
+#define dma_memory_write_guarded(dev, ...) \
+    REENTRANCY_GUARD(dma_memory_write, MemTxResult, dev, __VA_ARGS__)
+#define dma_memory_set_guarded(dev, ...) \
+    REENTRANCY_GUARD(dma_memory_set, MemTxResult, dev, __VA_ARGS__)
+#define dma_memory_map_guarded(dev, ...) \
+    REENTRANCY_GUARD(dma_memory_map, void*, dev, __VA_ARGS__)
+#define dma_memory_unmap_guarded(dev, ...) \
+    REENTRANCY_GUARD_NORET(dma_memory_unmap, dev, __VA_ARGS__)
+#define ldub_dma_guarded(dev, ...) \
+    REENTRANCY_GUARD(ldub_dma, MemTxResult, dev, __VA_ARGS__)
+#define stb_dma_guarded(dev, ...) \
+    REENTRANCY_GUARD(stb_dma, MemTxResult, dev, __VA_ARGS__)
+#define dma_buf_read_guarded(dev, ...) \
+    REENTRANCY_GUARD(dma_buf_read, MemTxResult, dev, __VA_ARGS__)
+#define dma_buf_write_guarded(dev, ...) \
+    REENTRANCY_GUARD(dma_buf_read, MemTxResult, dev, __VA_ARGS__)
+
 #endif
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7ba2048836..c44dc75149 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
+    DeviceState *dev = NULL;
     MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
@@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultanous access to a device's IO Regions */
+    if (mr->owner &&
+            !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+        if (dev->mem_reentrancy_guard.engaged_in_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+            return MEMTX_ERROR;
+        }
+        dev->mem_reentrancy_guard.engaged_in_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (dev) {
+        dev->mem_reentrancy_guard.engaged_in_io = false;
+    }
     return r;
 }
 
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
2.27.0


