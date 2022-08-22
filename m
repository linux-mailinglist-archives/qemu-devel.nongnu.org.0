Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4EC59BC52
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:09:55 +0200 (CEST)
Received: from localhost ([::1]:48072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3RR-0002tL-TC
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3N0-0005W2-4O
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:30 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3My-0006qB-Fj
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:17 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso9913613pjd.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3gh90/+u0Z6cm+rADmaizDlRTz/nGsOSoHW4n0LHC8M=;
 b=Qo9lPJNI6eiWvBnxY1VsdXX3b8rPATHXZoCKOAtCcE7zmg4IFXrYYyicNx4B2xI38r
 VyNYFWRFcLU/WlyHL5KMpiBFN9fldL+t2JmvDIBWReo03NvfbbfzV11TzlnT/Rm+3+cA
 /7SJDruViAr0gEOAGATAx7LRZTOcB9DJamx4JcYS1BW2a/w3bCoUrG3P5aVIOvmMBYfR
 6jsr+CuF9Em0CbEzgUe7NuRX0BeCmVaxnk3JKpu9Ck4tE04Fkvh47WBDiu+7bYRbRags
 qQ8+hTB5jzmYZcWHN5NYYTGTz4/jvdJWmHiRKTqqZtpxrTI2YQdRi3k+4qTz/ENH9SwH
 IsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3gh90/+u0Z6cm+rADmaizDlRTz/nGsOSoHW4n0LHC8M=;
 b=RgiFCfX0TcVakDMTi2Vo80sbEHoCj5XR+3/lszWTpGXtKvQ3NqBfe9417V99/ZkyIz
 up2AEcBRHhxK7MeUwsv0CLxO9FL8JBl2X8HjshR2rXBlGyhdIJBT55KN1C//wcKcay6t
 JoqFnlijHnesCQ0DT1/nhBwVXGyKgN/GEqhppZ3Tv21YElsfzJmkFO1/BMML4X8PEOH+
 RYY7gC1KgJKUjQsW3vmrr3vVUDUnnv81sSVrnVO0suikbMxB3zyvRH0594X5MTJA1vUU
 OUwam7Bo5qT5kAeZHx+7cpCe+QRnUYYXxA4Cb2tfpX50HELMaBvIGrmPXuRUeU8EiGJD
 WzpQ==
X-Gm-Message-State: ACgBeo3G9e2c2pPTl1c3Vuyi8bTw/THJqVups4Mh6Z9QCft8O1zqZeVA
 NQSfFILCSruyCur1okK2tVndFP7Tyg3EoQ==
X-Google-Smtp-Source: AA6agR5gm6gnTJpK/tzMwg8Q2la+TtTkS/wX/q5IoWrJNji3Dk2wwK5wKky+DCf9Wf4u4L6U4to+wA==
X-Received: by 2002:a17:903:2c7:b0:16c:ebf6:db22 with SMTP id
 s7-20020a17090302c700b0016cebf6db22mr19164211plk.16.1661159114725; 
 Mon, 22 Aug 2022 02:05:14 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 n34-20020a635c62000000b0041c3ab14ca1sm7015428pgm.0.2022.08.22.02.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:05:14 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 ybendito@redhat.com
Subject: [PATCH] hw/acpi: set ATS capability explicitly per pcie root port
Date: Mon, 22 Aug 2022 14:34:35 +0530
Message-Id: <20220822090438.426748-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822090438.426748-1-ani@anisinha.ca>
References: <20220822090438.426748-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently the bit 0 of the flags field of Root Port ATS capability reporting
structure sub-table under the DMAR table is set to 1. This indicates ALL_PORTS,
thus enabling ATS capability for all pcie roots without the ability to turn off
ATS for some ports and leaving ATS on for others.

This change clears the bit 0 of the flags field of the above structure and
explicitly adds scopes for every pcie root port in the structure so that ATS
is enabled for all of them. In future, we might add new attribite to the root
ports so that we can selectively enable ATS for some and leave ATS off for
others.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/acpi-build.c | 74 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0355bd3dda..9c5a555536 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -60,6 +60,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci/pcie_port.h"
 #include "hw/pci-host/q35.h"
 #include "hw/i386/x86-iommu.h"
 
@@ -2118,6 +2119,60 @@ dmar_host_bridges(Object *obj, void *opaque)
     return 0;
 }
 
+/*
+ * Insert DMAR scope for PCIE root ports
+ */
+static void
+insert_pcie_root_port_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    const size_t device_scope_size = 6 + 2;
+                                   /* device scope structure + 1 path entry */
+    GArray *scope_blob = opaque;
+
+    /*
+     * We are only interested in PCIE root ports. We can extend
+     * this to check for specific properties of PCIE root ports and based
+     * on that remove some ports from having ATS capability.
+     */
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PORT)) {
+        return;
+    }
+
+    /* Dmar Scope Type: 0x02 for all PCIE root ports */
+    build_append_int_noprefix(scope_blob, 0x02, 1);
+
+    /* length */
+    build_append_int_noprefix(scope_blob, device_scope_size, 1);
+    /* reserved */
+    build_append_int_noprefix(scope_blob, 0, 2);
+    /* enumeration_id */
+    build_append_int_noprefix(scope_blob, 0, 1);
+    /* bus */
+    build_append_int_noprefix(scope_blob, pci_bus_num(bus), 1);
+    /* device */
+    build_append_int_noprefix(scope_blob, PCI_SLOT(dev->devfn), 1);
+    /* function */
+    build_append_int_noprefix(scope_blob, PCI_FUNC(dev->devfn), 1);
+}
+
+/* For a given PCI host bridge, walk and insert DMAR scope */
+static int
+dmar_pcie_root_ports(Object *obj, void *opaque)
+{
+    GArray *scope_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            pci_for_each_device_under_bus(bus, insert_pcie_root_port_scope,
+                                          scope_blob);
+        }
+    }
+
+    return 0;
+}
+
 /*
  * Intel ® Virtualization Technology for Directed I/O
  * Architecture Specification. Revision 3.3
@@ -2190,11 +2245,26 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
 
     if (iommu->dt_supported) {
         /* 8.5 Root Port ATS Capability Reporting Structure */
+        /*
+         * A PCI bus walk, for each PCIE root port.
+         * Since we did not enable ALL_PORTS bit in the flags above, we
+         * need to add the scope for each pcie root port explicitly
+         * that are attached to bus0 with iommu enabled.
+         */
+        scope_blob = g_array_new(false, true, 1);
+        object_child_foreach_recursive(object_get_root(),
+                                       dmar_pcie_root_ports, scope_blob);
+
         build_append_int_noprefix(table_data, 2, 2); /* Type */
-        build_append_int_noprefix(table_data, 8, 2); /* Length */
-        build_append_int_noprefix(table_data, 1 /* ALL_PORTS */, 1); /* Flags */
+        build_append_int_noprefix(table_data,
+                                  8 + scope_blob->len, 2); /* Length */
+        build_append_int_noprefix(table_data, 0, 1); /* Flags */
         build_append_int_noprefix(table_data, 0, 1); /* Reserved */
         build_append_int_noprefix(table_data, 0, 2); /* Segment Number */
+
+        /* now add the scope to the sub-table */
+        g_array_append_vals(table_data, scope_blob->data, scope_blob->len);
+        g_array_free(scope_blob, true);
     }
 
     acpi_table_end(linker, &table);
-- 
2.25.1


