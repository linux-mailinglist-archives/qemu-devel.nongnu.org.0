Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08B36EDD20
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:49:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMp-0007Ny-Np; Tue, 25 Apr 2023 03:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMn-0007Fw-HJ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMl-0006lE-ML
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7X86YUKsr6DaUP9RJPAougsaucvvbmX812GyuJi0kM=;
 b=gbcIxVgZWHXosipeOyL3fhF2tO+Y6QXyCa+n+3+O3rVVtVcey4daSCRoWCo5lzwSlkVQqN
 BavxFElXjLcNyP3iT7jeGVwMoFLFSHKQas02NLv895+3BMs6tEcUeC8mSoChZrUQLWuP3e
 3Sx2OCWlMqxy8TxID+wLTYMiRng3TDY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-gKkS6dKZP8yiVutB25p1Tg-1; Tue, 25 Apr 2023 03:45:33 -0400
X-MC-Unique: gKkS6dKZP8yiVutB25p1Tg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2ffee43dac5so1939023f8f.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408731; x=1685000731;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r7X86YUKsr6DaUP9RJPAougsaucvvbmX812GyuJi0kM=;
 b=he4Z+k0wmDXb/UVLk67cRWXJmTP8vwt8zkpTLDGTWdgR3OhqC/pC2qkvWlIxhcaQSz
 buiPiPTgsY431LpcdQ/xMuPCa0jc7clt8E9niuxsYYlKd5uVa1o7hFPhHo6EuC+qRIVS
 xFbv2j9tKztrVurjKWriDrmaQbINHbrpENEq/3y6VG1eXxBPyolcrPjMoj093WjT0sR/
 jYC6AQT66tbPc0f7+nonyHik7LEfFOsYTJWjjWxzHmEDhpaQ3yuP/DiQc7V8upgtM1Ao
 KP0MPJnkS+ZqbNbauxxg6P/jIzqG8+ZmGe2Exh+0RpNUYEea+MtH+Qa0rPldhcc1GT4G
 NZhw==
X-Gm-Message-State: AAQBX9e5sMTfM+fu43gWS0ZIRfJfqG84E4luQiJdsVsQcCrntvrfXH9h
 1L18Twa1bSYTSVMrZVZO4jhXDwBZBqGkIFi8/CA8oo8IFEgltox+PYPYy/uXHGHHFaPLX7MdPZF
 LmzLMu2cjdpTQ6dxKy57ApxAePjQxiFjrCvEEMLrbJpNfKS1QNXaYMu9Q8emBBm/c+E0U
X-Received: by 2002:a5d:570b:0:b0:2fb:11ec:f2a1 with SMTP id
 a11-20020a5d570b000000b002fb11ecf2a1mr10403978wrv.20.1682408731216; 
 Tue, 25 Apr 2023 00:45:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350aHPkXsfzEDL6zb1tTFCSUGxqe6I5zOFivn0m3yNrPF4oN4okBmw7vGNLOOJnYi5NERagbJIg==
X-Received: by 2002:a5d:570b:0:b0:2fb:11ec:f2a1 with SMTP id
 a11-20020a5d570b000000b002fb11ecf2a1mr10403957wrv.20.1682408730883; 
 Tue, 25 Apr 2023 00:45:30 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 b9-20020adfee89000000b002f777345d21sm12391227wro.95.2023.04.25.00.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:30 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 12/31] hw/i386/amd_iommu: Move capab_offset from AMDVIState to
 AMDVIPCIState
Message-ID: <ae097d8fbd405011afc5c35c7f95a90066a97262.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The 'PCI capability offset' is a *PCI* notion. Since AMDVIPCIState
inherits PCIDevice and hold PCI-related fields, move capab_offset
from AMDVIState to AMDVIPCIState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230313153031.86107-5-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.h  |  2 +-
 hw/i386/acpi-build.c |  2 +-
 hw/i386/amd_iommu.c  | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 5eccaad790..1c0cb54bd4 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -308,6 +308,7 @@ typedef struct AMDVIAddressSpace AMDVIAddressSpace;
 /* functions to steal PCI config space */
 typedef struct AMDVIPCIState {
     PCIDevice dev;               /* The PCI device itself        */
+    uint32_t capab_offset;       /* capability offset pointer    */
 } AMDVIPCIState;
 
 struct AMDVIState {
@@ -315,7 +316,6 @@ struct AMDVIState {
     AMDVIPCIState pci;          /* IOMMU PCI device             */
 
     uint32_t version;
-    uint32_t capab_offset;       /* capability offset pointer    */
 
     uint64_t mmio_addr;
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a27bc33956..7f211e1f48 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2399,7 +2399,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
                               object_property_get_int(OBJECT(&s->pci), "addr",
                                                       &error_abort), 2);
     /* Capability offset */
-    build_append_int_noprefix(table_data, s->capab_offset, 2);
+    build_append_int_noprefix(table_data, s->pci.capab_offset, 2);
     /* IOMMU base address */
     build_append_int_noprefix(table_data, s->mmio.addr, 8);
     /* PCI Segment Group */
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 19f57e6318..9f6622e11f 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1516,15 +1516,15 @@ static void amdvi_init(AMDVIState *s)
     pci_config_set_class(s->pci.dev.config, 0x0806);
 
     /* reset AMDVI specific capabilities, all r/o */
-    pci_set_long(s->pci.dev.config + s->capab_offset, AMDVI_CAPAB_FEATURES);
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_BAR_LOW,
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset, AMDVI_CAPAB_FEATURES);
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_BAR_LOW,
                  AMDVI_BASE_ADDR & ~(0xffff0000));
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_BAR_HIGH,
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_BAR_HIGH,
                 (AMDVI_BASE_ADDR & ~(0xffff)) >> 16);
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_RANGE,
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_RANGE,
                  0xff000000);
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_MISC, 0);
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_MISC,
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_MISC, 0);
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_MISC,
             AMDVI_MAX_PH_ADDR | AMDVI_MAX_GVA_ADDR | AMDVI_MAX_VA_ADDR);
 }
 
@@ -1557,7 +1557,7 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     if (ret < 0) {
         return;
     }
-    s->capab_offset = ret;
+    s->pci.capab_offset = ret;
 
     ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
                              AMDVI_CAPAB_REG_SIZE, errp);
-- 
MST


