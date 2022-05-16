Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7A528317
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:23:51 +0200 (CEST)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYpK-0006qj-RV
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6p-0007Ob-AY
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6n-0005PI-Ep
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S2qvH2iwGRbR0l3WdxvqsX8jcbdTaa6VQl5+Rxg2li4=;
 b=dhrnhcE02Y8EI/ZHnAC8mkRn3/6dpcOwIkac2oSnk5SG7W7KdgQpI3H1CeQqaTU/5Al1xV
 RzTg38zKZGbMmcLbFqViV2a1quKKBo6eduBsVEEtVa9UHbMiFyq7utT+7TrPbCZDTS+M0J
 /aDeOxLcgM/kI2FMhVS25h46vYvScPE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-sN9YbVZxPkyHKaiXXh1rQw-1; Mon, 16 May 2022 06:37:44 -0400
X-MC-Unique: sN9YbVZxPkyHKaiXXh1rQw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so6562284wmb.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S2qvH2iwGRbR0l3WdxvqsX8jcbdTaa6VQl5+Rxg2li4=;
 b=LdLtK2owKuPyJFuAoQnvAgQ+IUaUCAnQv7SkzKYyuZjyeNDWGYBn0vIya8tyd3SnEp
 Nznl8niwlTQq1JcIxlO9K6x4m6VKraLGdIXv2wBtnPIYs2nnftAuTa9gsWVaTcGp3Msd
 l8BpYUMbyp3PrV995nHXcQnWpAD7/B8xqP6tVHOWwXKmHa9Xhk6AkXAYmzJ0DD7MIMwC
 PHyJcQZDLudP+0+mroGZ3POB1uFZdWLBYdCJPWquTjFf7WSXj9Grpii2Ai6jPGswVfRw
 wLXj/JsjCz1+P5emYEpRnVPrDKkWlCiRYeBu5kPymYmKocnY5voL1pCPyn5QMU13dto3
 HAGw==
X-Gm-Message-State: AOAM531qPuGTuGCDey/83/Usg5y6w25Fa2BNUuiGsEfpZ7PnMpKII3PE
 T3jc2J8nvNf0iARhRSipLyOecJN+UwRbqJxG9rsuy0eVviJR6fdUOFVOkVBmWJgVWUwjU17oTbg
 jFFF6sNu3qNs0sg17eHK2uErXczYbPDy5NOCIjyfp0ptsgnbfQzlENqM1VTIk
X-Received: by 2002:a05:6000:2cf:b0:20d:c9f:63d0 with SMTP id
 o15-20020a05600002cf00b0020d0c9f63d0mr1925565wry.45.1652697462795; 
 Mon, 16 May 2022 03:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJC3yVpKcBbxZApc51E1HpVixQ5w4WYigf0uky5mvWKL/K7wjdRuwj/7d8rQ3K88XMZaRKkg==
X-Received: by 2002:a05:6000:2cf:b0:20d:c9f:63d0 with SMTP id
 o15-20020a05600002cf00b0020d0c9f63d0mr1925538wry.45.1652697462447; 
 Mon, 16 May 2022 03:37:42 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 r14-20020adfa14e000000b0020c5253d8cesm9193105wrr.26.2022.05.16.03.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:42 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 35/91] cxl/cxl-host: Add memops for CFMWS region.
Message-ID: <20220516095448.507876-36-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

These memops perform interleave decoding, walking down the
CXL topology from CFMWS described host interleave
decoder via CXL host bridge HDM decoders, through the CXL
root ports and finally call CXL type 3 specific read and write
functions.

Note that, whilst functional the current implementation does
not support:
* switches
* multiple HDM decoders at a given level.
* unaligned accesses across the interleave boundaries

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Message-Id: <20220429144110.25167-34-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h    |   2 +
 hw/cxl/cxl-host-stubs.c |   2 +
 hw/cxl/cxl-host.c       | 128 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index dce38124db..21d28ca110 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -56,4 +56,6 @@ void cxl_fixed_memory_window_config(MachineState *ms,
                                     Error **errp);
 void cxl_fixed_memory_window_link_targets(Error **errp);
 
+extern const MemoryRegionOps cfmws_ops;
+
 #endif
diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index f8fd278d5d..24465a52ab 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -12,3 +12,5 @@ void cxl_fixed_memory_window_config(MachineState *ms,
                                     Error **errp) {};
 
 void cxl_fixed_memory_window_link_targets(Error **errp) {};
+
+const MemoryRegionOps cfmws_ops;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index ec5a75cbf5..469b3c4ced 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -15,6 +15,10 @@
 
 #include "qapi/qapi-visit-machine.h"
 #include "hw/cxl/cxl.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_port.h"
 
 void cxl_fixed_memory_window_config(MachineState *ms,
                                     CXLFixedMemoryWindowOptions *object,
@@ -92,3 +96,127 @@ void cxl_fixed_memory_window_link_targets(Error **errp)
         }
     }
 }
+
+/* TODO: support, multiple hdm decoders */
+static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
+                                uint8_t *target)
+{
+    uint32_t ctrl;
+    uint32_t ig_enc;
+    uint32_t iw_enc;
+    uint32_t target_reg;
+    uint32_t target_idx;
+
+    ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
+    if (!FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
+        return false;
+    }
+
+    ig_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IG);
+    iw_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IW);
+    target_idx = (addr / cxl_decode_ig(ig_enc)) % (1 << iw_enc);
+
+    if (target_idx > 4) {
+        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
+        target_reg >>= target_idx * 8;
+    } else {
+        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
+        target_reg >>= (target_idx - 4) * 8;
+    }
+    *target = target_reg & 0xff;
+
+    return true;
+}
+
+static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
+{
+    CXLComponentState *hb_cstate;
+    PCIHostState *hb;
+    int rb_index;
+    uint32_t *cache_mem;
+    uint8_t target;
+    bool target_found;
+    PCIDevice *rp, *d;
+
+    /* Address is relative to memory region. Convert to HPA */
+    addr += fw->base;
+
+    rb_index = (addr / cxl_decode_ig(fw->enc_int_gran)) % fw->num_targets;
+    hb = PCI_HOST_BRIDGE(fw->target_hbs[rb_index]->cxl.cxl_host_bridge);
+    if (!hb || !hb->bus || !pci_bus_is_cxl(hb->bus)) {
+        return NULL;
+    }
+
+    hb_cstate = cxl_get_hb_cstate(hb);
+    if (!hb_cstate) {
+        return NULL;
+    }
+
+    cache_mem = hb_cstate->crb.cache_mem_registers;
+
+    target_found = cxl_hdm_find_target(cache_mem, addr, &target);
+    if (!target_found) {
+        return NULL;
+    }
+
+    rp = pcie_find_port_by_pn(hb->bus, target);
+    if (!rp) {
+        return NULL;
+    }
+
+    d = pci_bridge_get_sec_bus(PCI_BRIDGE(rp))->devices[0];
+
+    if (!d || !object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3)) {
+        return NULL;
+    }
+
+    return d;
+}
+
+static MemTxResult cxl_read_cfmws(void *opaque, hwaddr addr, uint64_t *data,
+                                  unsigned size, MemTxAttrs attrs)
+{
+    CXLFixedWindow *fw = opaque;
+    PCIDevice *d;
+
+    d = cxl_cfmws_find_device(fw, addr);
+    if (d == NULL) {
+        *data = 0;
+        /* Reads to invalid address return poison */
+        return MEMTX_ERROR;
+    }
+
+    return cxl_type3_read(d, addr + fw->base, data, size, attrs);
+}
+
+static MemTxResult cxl_write_cfmws(void *opaque, hwaddr addr,
+                                   uint64_t data, unsigned size,
+                                   MemTxAttrs attrs)
+{
+    CXLFixedWindow *fw = opaque;
+    PCIDevice *d;
+
+    d = cxl_cfmws_find_device(fw, addr);
+    if (d == NULL) {
+        /* Writes to invalid address are silent */
+        return MEMTX_OK;
+    }
+
+    return cxl_type3_write(d, addr + fw->base, data, size, attrs);
+}
+
+const MemoryRegionOps cfmws_ops = {
+    .read_with_attrs = cxl_read_cfmws,
+    .write_with_attrs = cxl_write_cfmws,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+};
-- 
MST


