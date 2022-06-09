Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035B544FC0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:47:21 +0200 (CEST)
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJRR-0003jR-2I
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nzIgn-00069J-3y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:59:11 -0400
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205]:49005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nzIgj-0007Ox-IF
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:59:07 -0400
X-IronPort-RemoteIP: 209.85.222.197
X-IronPort-MID: 202756399
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kWG2Oqu9j2OGyhoIbG6Rpn/xSefnVMJcMUV32f8akzHdYApBsoF/q
 tZmKWmFOPyCajb2KYx2bYvj9xxQscKDndc1SgNuri9mEitG9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvT4
 YOq+KUzBXf+s9JKGjNMg068gE431BjCkGtwUosWPK0jUPf2zhH5PbpGTU2DByKQrrp8R4ZWc
 93+IISRpQs1yfuM5uSNyd4XemVSKlLb0JPnZnB+AsBOiTAbzsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTpRQNwDu7Xgd0fbCgGLj5cJvR7/ebudC3XXcy7lyUqclPpyvRqSVg1ZMgWo7coR25J8
 vMcJXYGaRXra+CemurqDLkxwJ55do+ybdx3VnJIlFk1Cd4vRYDFT7/i78Ie0Tst7ixLNayGP
 ZVEN2E+PXwsZTUXIX0yCrMAgN6rh1OmVRBejHS4+Ikotj27IAtZleKF3MDuUsWHQNgQkkuGq
 2bu+WP/DRcHctuFxlK4HmmEg+bOmWbiW9tXGuTpqbhlh1qcwmFVAxoTPbemncSEZoeFc4o3A
 yQpFuAG9MDeKGTDogHBYiCF
IronPort-HdrOrdr: A9a23:rJtuZ6AYuQheOLTlHel255DYdb4zR+YMi2TDGXoBLSC9Ffbo7f
 xG+c5w6faaskd2ZJhNo6HjBEDiewKmyXcK2/hpAV7KZmCP0xrKEGgL1+vfKlbbakrDH4BmpM
 JdWpk7IvHLSXZBsebGzD+RL+sAqeP3jZxARt2z856ud2xXgm1bgTuRcjzranGejTMoZKYEKA
 ==
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 09:59:00 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 bq11-20020a05620a468b00b006a71592a2abso3036029qkb.21
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cqz0qi+RyoM3hvQXOUwLmH8xeCdAe1SxfMxb5T1r5EM=;
 b=i1q0Ug6PrLWZVDqlCBD3i5SO1xUrpfx56+eoqCCUk4dcXizTAb0Fjw2uM7U6G23NX8
 I7KjEjH5JKhaGhtMEpz3yMrkgioWT0mz24stuxO4HYXFtmhkxKTIu7oeHFDnG5TB127q
 P7oBiBLyClmF4wit8W1WYePji1k0kSuNWcomcHG9DAic+l0NHWhZFNodgeZMl4oh6DHz
 7SJLTyAEBsC7OcMG/3xC0tk36Tci2E5pLMXoOv5KplFAQOm9YrRy4D4K3gh7VjyZuOnc
 yX/4ngUMAXJwEfBcV/Y+pCM3b6vUoc8MH8YvyGeB0kp53lQvQ40IqG5OhRBBwGbjXX3B
 SROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cqz0qi+RyoM3hvQXOUwLmH8xeCdAe1SxfMxb5T1r5EM=;
 b=tm35OLgZb8++klJK1mZH0m7Dy/sGiuvU5PqkbiHQS4K9y2mHdkY7WLbbdldvJZOrjF
 751Z4reJWELm5NPkyDg1NZzf15R1JWt4/rOvlQZzStrA+v6GG5G4bt7sO0i31FNAYXkq
 zOiyISX1JkzeozIYYAeplF4J8XSJz0/zLxL+qtSSgV+Xmq0jfBljR/NmoOwg/62/+EmY
 y2WEtl4U4F4Dll6UG0pWPiQRVUC9rEtoQTj/Lx408paefI2e2QCsqmFWkQU8LPSoIecu
 FROPlH3l5UTTmrCN94E6Sy9Lvk/HJRgCtSum+wXHc5lkpKj5ubMLYjVdq0ZZzxnakw7/
 ALZA==
X-Gm-Message-State: AOAM533z3Lx/yFcPVDEgk3wgTQUlfdK+vkUObEHUx4q/KjJLiGcFsUXv
 cwa4gJx4c9dhAJ45AehkoyzJ1MlppYyTLrD4SAidWrR2kyieCxoWgiPg0vUKfcke+9AdsyhGnM/
 Ho0WL9Pwawl9IgYhfmDgbu7FiP8XulA==
X-Received: by 2002:a05:622a:1208:b0:304:cb1c:8b0d with SMTP id
 y8-20020a05622a120800b00304cb1c8b0dmr32317196qtx.615.1654783138845; 
 Thu, 09 Jun 2022 06:58:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYT8xs5IDRD2mzikk+NF0mIgx6rHXeOnMcWGJAOaSuzGib34RSmu2SD/L4ZIcscXG56TJIUw==
X-Received: by 2002:a05:622a:1208:b0:304:cb1c:8b0d with SMTP id
 y8-20020a05622a120800b00304cb1c8b0dmr32317160qtx.615.1654783138521; 
 Thu, 09 Jun 2022 06:58:58 -0700 (PDT)
Received: from stormtrooper.vrmnet (pool-72-70-35-75.bstnma.fios.verizon.net.
 [72.70.35.75]) by smtp.gmail.com with ESMTPSA id
 e185-20020a3769c2000000b006a5d4f32e5dsm18763169qkc.128.2022.06.09.06.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 06:58:58 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2] memory: prevent dma-reentracy issues
Date: Thu,  9 Jun 2022 09:58:51 -0400
Message-Id: <20220609135851.42193-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/pci/pci.h   | 13 +++++++++++--
 include/hw/qdev-core.h |  3 +++
 softmmu/dma-helpers.c  | 12 ++++++++++++
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 5 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 44dacfa224..ab1ad0f7a8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                                      void *buf, dma_addr_t len,
                                      DMADirection dir, MemTxAttrs attrs)
 {
-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
-                         dir, attrs);
+    bool prior_engaged_state;
+    MemTxResult result;
+
+    prior_engaged_state = dev->qdev.engaged_in_io;
+
+    dev->qdev.engaged_in_io = true;
+    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
+                           dir, attrs);
+    dev->qdev.engaged_in_io = prior_engaged_state;
+
+    return result;
 }
 
 /**
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..6474dc51fa 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,9 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+
+    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
+    int engaged_in_io;
 };
 
 struct DeviceListener {
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7820fec54c..7a4f1fb9b3 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -288,8 +288,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
     uint8_t *ptr = buf;
     dma_addr_t xresidual;
     int sg_cur_index;
+    DeviceState *dev;
+    bool prior_engaged_state;
     MemTxResult res = MEMTX_OK;
 
+    dev = sg->dev;
+    if (dev) {
+        prior_engaged_state = dev->engaged_in_io;
+        dev->engaged_in_io = true;
+    }
+
     xresidual = sg->size;
     sg_cur_index = 0;
     len = MIN(len, xresidual);
@@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
         xresidual -= xfer;
     }
 
+    if (dev) {
+        dev->engaged_in_io = prior_engaged_state;
+    }
+
     if (residual) {
         *residual = xresidual;
     }
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7ba2048836..44a14bb4f5 100644
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
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+        if (dev->engaged_in_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+            return MEMTX_ERROR;
+        }
+        dev->engaged_in_io = true;
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
+        dev->engaged_in_io = false;
+    }
     return r;
 }
 
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887b3c..d7228316db 100644
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
2.33.0


