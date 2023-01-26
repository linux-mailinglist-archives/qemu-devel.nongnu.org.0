Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF867C43F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:26:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKum9-0007JC-5f; Thu, 26 Jan 2023 00:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKum5-0007Iy-5l
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:26:13 -0500
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKum3-0000nB-3V
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:26:12 -0500
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 253905856
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NNQpdqsD3WAkIIy495TnONhGzufnVOtcMUV32f8akzHdYApBsoF/q
 tZmKWmCOfqMNzDwLt51aY/lpklTvsDUnIRlHARrrCoyRSgQ9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gVkO6gS1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqUB3+pTB2pKy
 8YfdhASMBmDuribmY+CH7wEasQLdKEHPasas3BkiCjHVLMoH8GFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk2RJUMeUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQrjeO8aIeFJ4LiqcN9v0yA4
 UTLpifDWz5EBt6g6RW5ok7yv7qa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx37VLyC9ejDlu3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:HBQ6vaGSChPQ8wIMpLqE+ceALOsnbusQ8zAXPidKJSC9E/b0qy
 nAppQmPHPP6Qr5O0tLpTnoAsDpKk80k6QFg7X5Eo3NYOCMghrMEGgN1/qA/9SZIULDytI=
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2023 00:26:08 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 nk14-20020a056214350e00b0053472f03fedso509556qvb.17
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 21:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykJeQRTFAEO+rqm5i63fQBnRe0PX7SJNCz89jYNpgLY=;
 b=Kr3O4RRVtqcXLaqpW1A30Hd7GFoV30fH5ITA3n0oWZSGvdbJZ6sPavY5541aSK7Tl0
 Zr6hzx8jEvMjis6xApS+Uy65C3K+87+ZjT/ZVEiLKt7Tsu+n7FqA2f38F800LWvCeJY/
 7qk8eXQVyYEC/mrGwApNSsRxytZZuakyBTfx9ndeWvd3zX6F5D9qExw2nEvFMjLXEuyT
 EMGXIfC2jBJs0zlOx4EoGJTkVGsvcmSue24jyuqmQCvvdIpGQY9q2rMbmQq88xvMngdq
 qmzL2w+fKHva7PUnzJwx35bbgI22P28TrFOsMuMFE/FtCoM6sUTLqgulmYsqtviUMEBG
 Zx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykJeQRTFAEO+rqm5i63fQBnRe0PX7SJNCz89jYNpgLY=;
 b=maLWtLOR7ghi4Ac1VbSz3ZUCVyQ/0dF7wsl6xLMDyAf430/pluz5np62iX8rDVKhWe
 RtwSEINxbRbtKnPvQvXUTpvOWn1c16GuLtqF+I6MnBDVEZYD01l5K1v1U/vcq1atPpmO
 TOuR3ylk866LomzVp0pt+J1Nr6wmK6FgQerFKtMyGx6O0+cUuk3Vvr/wCvzUIGKhq5RD
 sHoYkWgsH0nRYkcS+Qd0dMuqhJWyTEpNIbRegICx5kXkUF3/PwTRmwSAPaYdz9BGnFE1
 +nKCmY3qhNKAeTcNlzb3FdwDCnHx6MlMOOTKdST0UC+wGj5W13NLkTp6yMT8dqDfV5A6
 /qXw==
X-Gm-Message-State: AFqh2krjcVXAhNWzer6sDSfBQ1dYEjl/PHwUiYdLPm22GfPZLB5gQj7T
 oXGV8Wfvnjce32USBe0EG1N7iYjuQe/245QdiMsAugkv7a8FAyYFULl4VACNsEycbCX2Mjg9RvI
 I7qi7oWZGsWvPpE6OlgSf6hvVVqYSmw==
X-Received: by 2002:ac8:4d9b:0:b0:3b6:31f2:da0c with SMTP id
 a27-20020ac84d9b000000b003b631f2da0cmr46013053qtw.15.1674710767566; 
 Wed, 25 Jan 2023 21:26:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskae1/2vnhCR6sraM29Azr3jQ9SGQt8uq15DYldqjFsQZzJ1izr9PRVmHtmnYZOKad87iP/A==
X-Received: by 2002:ac8:4d9b:0:b0:3b6:31f2:da0c with SMTP id
 a27-20020ac84d9b000000b003b631f2da0cmr46013022qtw.15.1674710767302; 
 Wed, 25 Jan 2023 21:26:07 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 m21-20020aed27d5000000b003b62fcd6d50sm165066qtg.28.2023.01.25.21.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 21:26:06 -0800 (PST)
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
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v5 1/4] memory: prevent dma-reentracy issues
Date: Thu, 26 Jan 2023 00:25:55 -0500
Message-Id: <20230126052558.572634-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126052558.572634-1-alxndr@bu.edu>
References: <20230126052558.572634-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/qdev-core.h |  7 +++++++
 softmmu/memory.c       | 17 +++++++++++++++++
 softmmu/trace-events   |  1 +
 3 files changed, 25 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 35fddb19a6..8858195262 100644
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
index e05332d07f..daffb48493 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -533,6 +533,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
+    DeviceState *dev = NULL;
     MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
@@ -542,6 +543,19 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultanous access to a device's IO Regions */
+    if (mr->owner &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+        if (dev) {
+            if (dev->mem_reentrancy_guard.engaged_in_io) {
+                trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+                return MEMTX_ERROR;
+            }
+            dev->mem_reentrancy_guard.engaged_in_io = true;
+        }
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -556,6 +570,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
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
2.39.0


