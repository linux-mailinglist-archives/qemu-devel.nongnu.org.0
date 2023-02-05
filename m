Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13168AE34
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWK7-0000KM-SJ; Sat, 04 Feb 2023 23:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWK5-0000Jj-FW
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:08:13 -0500
Received: from esa8.hc2706-39.iphmx.com ([216.71.140.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWK3-0002jb-1C
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:08:12 -0500
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 254465733
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d6ZY16Lh4oOS4/c1FE+Rb5clxSXFcZb7ZxGr2PjKsXjdYENS0TVRz
 2JKCjjXM6yIazD9LdF/bYvnoRkB75XTx4A2HAZorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9Twkj/rgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8rWo4ow/jb8kg35qyu4GhwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj6+t1Klg1GqI2xr00BmJvr
 cceDToIcynW0opawJrjIgVtrsEqLc2uJYBG/386lWmfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZBDL2A3NHwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTWPkFIsj+O2WDbTUoSWQ+4EpXSSm
 lzh8TzUI0AoLN6e+RPQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMt9O08rhTzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:ViXBL6//pcVJX08ldoluk+DoI+orL9Y04lQ7vn2ZLiY4TiX4ra
 +TdZEgviMc5wx+ZJhNo7G90cu7MBHhHO9OgbX5VI3KNGOKhILPFvAG0WKI+UyCJ8SRzJ866Y
 5QN4R4Fd3sHRxboK/BkXCF+g8bsb26GXaT9IDj80s=
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:08:06 -0500
Received: by mail-qk1-f200.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so5848018qkl.9
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vZ3mp35XAlxGvDT4NGszzpubWskmGO1xwXSkj57qxo=;
 b=kSDwDHw22fnzch1rPETXXOSFwdDJ/2YrGhS/Lxls8PB9tq0afK7MRITWtl8Jzwg2GJ
 AI9W1Km6P/Fc0Wl/FIGnO8krrhOJYS1FOVm3IbrTee9ocvl8vxvFObjiTdYGDDpqZhvr
 EM2xuRChcm5aqgkeY7gxK8kF7AnW57sobf+hPgtyQ/lG/58zLfiImeDqJb10CtNmAbfi
 laVdjVlVo1V2cqltXYYaVZ4T6UuEDb1nlhiHdxjTo5zNa8+gnTa566O4Fxib8fBoPmkX
 4lELa6IevEGAL8btDiS6+p3qx6FyHoFGFkx4nWNDf4HFHN3ndiG9KbjCxg1e7VrjGGJb
 E85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vZ3mp35XAlxGvDT4NGszzpubWskmGO1xwXSkj57qxo=;
 b=to1k/w4IH8WrIAArDGF9G3/guMjG2+Hznjm8gRT/Mn7W32iHDeh9eIADvHis+02at4
 zl55PpAvcQDec6q7iBCdd9rUGih0LJTrBQL2al+iovROvwxqTuPBUFFRIBRt5etIOPbi
 zr7ktfB16m7SKCcNqbGBf2IspH8+JxZZCWPh7P18e1nWWHvLPOOTPs/CibiVJfnNNWqx
 zZCTHOPLGgkVIDj57m9MkUDKoHCNdIjDZbfST5jWbv1hyhzYNESXIGoyG7/a3XQDN6aa
 BqPsEQqQ1X+B7XFN03JEm/PWHdTZZxKumX6LzQkZZF8uQVZzJo+F1ALA2WEVvpvWCeei
 DWTw==
X-Gm-Message-State: AO0yUKUR4mANXM8fnxbQy7prMrxXs/uPvq2UPYE/YS9TQT8VzMsD3Sr2
 pNN0Z8qTlXyeKWppT9eNGHOuN6XANqKR9rhkia6n2CWkQuiL1fL/WYJfrgaQTh8KRCPNOMd0cXx
 nvBGBBNQDAm0y9JZFhL1Mi8SHTaWjag==
X-Received: by 2002:a05:622a:100e:b0:3b0:11a1:3140 with SMTP id
 d14-20020a05622a100e00b003b011a13140mr25772731qte.43.1675570086069; 
 Sat, 04 Feb 2023 20:08:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+MGatfdHWgwCghVkgsI9RQYZfB9HNfJbkm6DIpDMoIACVb2192XjJRfXGzeSUWo69xv1hUng==
X-Received: by 2002:a05:622a:100e:b0:3b0:11a1:3140 with SMTP id
 d14-20020a05622a100e00b003b011a13140mr25772708qte.43.1675570085703; 
 Sat, 04 Feb 2023 20:08:05 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 w9-20020ac87189000000b003b9b41a32b7sm4619282qto.81.2023.02.04.20.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:08:05 -0800 (PST)
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
Subject: [PATCH v6 1/4] memory: prevent dma-reentracy issues
Date: Sat,  4 Feb 2023 23:07:34 -0500
Message-Id: <20230205040737.3567731-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205040737.3567731-1-alxndr@bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.196; envelope-from=alxndr@bu.edu;
 helo=esa8.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Acked-by: Peter Xu <peterx@redhat.com>
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
index 9d64efca26..eefeeae317 100644
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


