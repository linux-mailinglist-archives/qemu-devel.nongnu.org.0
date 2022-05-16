Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C680529287
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:18:20 +0200 (CEST)
Received: from localhost ([::1]:35706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqi6d-0007Xm-7a
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgb-0005TJ-5L
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgZ-0006PJ-EF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1se6nj6A5g2mHHtyEvXra4lCuIm3npIDYA6T8K1TMmM=;
 b=gGzG6cuZuuQG4bM8xR3XlxuxBcfvgC77KSgaCzp9T5Z/nk3/bRlUna7eJkN05NWyfOB0lY
 tpesWKnqwk6pqhw6hYZhQYvb4jb7UgT+l/C4kNxxky6IBCFDSgkSVTSDbtMjHzjHyOViDi
 XG4MkyIJmzCQCcJoH7ltkhkbYtizezg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-LoK3ij66N5OhAa1CSKR3Fw-1; Mon, 16 May 2022 16:51:22 -0400
X-MC-Unique: LoK3ij66N5OhAa1CSKR3Fw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr42-20020a1709073faa00b006f4dc7f0be1so6332697ejc.22
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1se6nj6A5g2mHHtyEvXra4lCuIm3npIDYA6T8K1TMmM=;
 b=0sUq3Bxc+GFWCLFcHkKEqvf12pwAVOgYy6PoNPWAK86/J5sOj7kglPSMS2kok1TyMs
 AetN/NRioQU55UkBVZvou1Jd+bkefke45Ps6TMF7szoi19VZmwQNKbwmaSMVgEahXLAR
 l8uR7B0ppaelOMii0Ss9zfMzemfVvSycKvbptNt3lpx4+oRbJVnfgbLyk4IN9boWIXNT
 /+nFVraN7tLOIYWHguEUg42dorzsg6gV7Mrf8X4s04VurK9W2R+kYQE5lK0qgvNaITVS
 hOO+Rz5U0iTs/v1saNyr69pB8ptc6lyXB6CXoczsTKqtsxu+cd4qg6xQaQFGmoiLjla7
 PlDQ==
X-Gm-Message-State: AOAM532mJWYTwspVUHm6gNauB3WEejxvZez8khZwGygLNBiZn5cfUmFJ
 GlKsMP5yr5j67WrrScoVe2JViMliPBWdFOLhGSB+0IN27fTIxnpNbGl8vKOEETGCpTS0fDK7e7r
 /v4dvzNvE4YxpDp/aqJeOn7ED7iTlYCCFpDChWoayDym07JUXIgfaz1BqT2MK
X-Received: by 2002:a17:907:1b0c:b0:6fe:25bf:b3e5 with SMTP id
 mp12-20020a1709071b0c00b006fe25bfb3e5mr9054619ejc.689.1652734280319; 
 Mon, 16 May 2022 13:51:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHDX8wJKHJzzKF8V+XZWeELGzTmpk29Ae2jpx71yKAGphScAPadaDNWNVO7L8i3d6IsyWQ6g==
X-Received: by 2002:a17:907:1b0c:b0:6fe:25bf:b3e5 with SMTP id
 mp12-20020a1709071b0c00b006fe25bfb3e5mr9054601ejc.689.1652734280026; 
 Mon, 16 May 2022 13:51:20 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 r6-20020aa7d146000000b0042ab9da73e6sm1328041edo.94.2022.05.16.13.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:51:19 -0700 (PDT)
Date: Mon, 16 May 2022 16:51:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 20/86] hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
Message-ID: <20220516204913.542894-21-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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

From: Ben Widawsky <ben.widawsky@intel.com>

A device's volatile and persistent memory are known Host Defined Memory
(HDM) regions. The mechanism by which the device is programmed to claim
the addresses associated with those regions is through dedicated logic
known as the HDM decoder. In order to allow the OS to properly program
the HDMs, the HDM decoders must be modeled.

There are two ways the HDM decoders can be implemented, the legacy
mechanism is through the PCIe DVSEC programming from CXL 1.1 (8.1.3.8),
and MMIO is found in 8.2.5.12 of the spec. For now, 8.1.3.8 is not
implemented.

Much of CXL device logic is implemented in cxl-utils. The HDM decoder
however is implemented directly by the device implementation.
Whilst the implementation currently does no validity checks on the
encoder set up, future work will add sanity checking specific to
the type of cxl component.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-19-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/mem/cxl_type3.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 290c088dd6..318b6f9fbc 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -52,6 +52,48 @@ static void build_dvsecs(CXLType3Dev *ct3d)
                                GPF_DEVICE_DVSEC_REVID, dvsec);
 }
 
+static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
+{
+    ComponentRegisters *cregs = &ct3d->cxl_cstate.crb;
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+
+    assert(which == 0);
+
+    /* TODO: Sanity checks that the decoder is possible */
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
+
+    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
+}
+
+static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    CXLComponentState *cxl_cstate = opaque;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    CXLType3Dev *ct3d = container_of(cxl_cstate, CXLType3Dev, cxl_cstate);
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+    bool should_commit = false;
+    int which_hdm = -1;
+
+    assert(size == 4);
+    g_assert(offset < CXL2_COMPONENT_CM_REGION_SIZE);
+
+    switch (offset) {
+    case A_CXL_HDM_DECODER0_CTRL:
+        should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
+        which_hdm = 0;
+        break;
+    default:
+        break;
+    }
+
+    stl_le_p((uint8_t *)cache_mem + offset, value);
+    if (should_commit) {
+        hdm_decoder_commit(ct3d, which_hdm);
+    }
+}
+
 static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
 {
     MemoryRegion *mr;
@@ -95,6 +137,9 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ct3d->cxl_cstate.pdev = pci_dev;
     build_dvsecs(ct3d);
 
+    regs->special_ops = g_new0(MemoryRegionOps, 1);
+    regs->special_ops->write = ct3d_reg_write;
+
     cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
                                       TYPE_CXL_TYPE3);
 
@@ -109,6 +154,15 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      &ct3d->cxl_dstate.device_registers);
 }
 
+static void ct3_exit(PCIDevice *pci_dev)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
+    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
+    ComponentRegisters *regs = &cxl_cstate->crb;
+
+    g_free(regs->special_ops);
+}
+
 static void ct3d_reset(DeviceState *dev)
 {
     CXLType3Dev *ct3d = CXL_TYPE3(dev);
@@ -131,6 +185,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
 
     pc->realize = ct3_realize;
+    pc->exit = ct3_exit;
     pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
     pc->vendor_id = PCI_VENDOR_ID_INTEL;
     pc->device_id = 0xd93; /* LVF for now */
-- 
MST


