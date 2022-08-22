Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F5E59BC66
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:12:32 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3Ty-000889-Et
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3N8-0005W9-Tk
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:30 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:47012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3N4-0006sl-5y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:24 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso10571995pjo.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Uq7rnkz9r0R8TaOt9qWOib8IZqgaXtBX++KjATGxClI=;
 b=wHuDOgNfPvPqwYwOK3VgjK8WEMDO+JvApGMnLSVsB3CknYQbHKMNWrZS4cQZx3DqUA
 bzdToblmpM6rf9bALQOKXe5OIL8DFKzWsydNzsZsTs1XgReldt30P4pZSAgUt7Afn+/9
 mdolXMkv2sXGmayxcFLyKRkj2BRoJw8398YXN965Zt6vje7rLqiKaWGRnPcs+cOzMbnh
 BC+EWOgsHyEXnF8QczV/r3iVL1Kpb5ugJ/wAhfV+0vAAyX+LLuqpuihCfPxjqpyh5Ywp
 UTHCBViPF6R6Qfbw9zboeb7lfErv+BKdIhtZXommJf32RUHqPVpFh9m7kOjhyDjsgaXO
 5MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Uq7rnkz9r0R8TaOt9qWOib8IZqgaXtBX++KjATGxClI=;
 b=7mrLtnit764Qhja00l3Gp8cTh1wmtInSWyvqUQLxNtBDNpgFvVv5SfCZGZNfEjRW0b
 TNLNGL9Jb5zoCfSHwVOlyBqabPA4su2r2Nxfsuo9ozIOZUFU+6M1LEQD8h2PEVkQtow7
 v7cyxpnH8PJyyypat7Z9aOyIxSDwSEjGzqbIarUEzuUSRhw7uj7JRf6Y/Bp0NJeaTKJs
 lUuhwZOx32hOeallUaEj3rZtIo0+ncZ8GcAND4FCEPzfSKAzdcdXDbM6gf2r7qEsTWyy
 sLawB41z6mF6d/JiLtlsRpEt3Fu6l50WzcHSMi5KzvFZ9Du5/OxZXsraoK+e7XXjENbg
 IYFA==
X-Gm-Message-State: ACgBeo1d37vONq8GywObeZoZTkVvAvBhfxomohAkIoX4IqgiM3Mz3lAc
 J292Zb/5oEFddvgFBAlywLjCoeteq6TSbw==
X-Google-Smtp-Source: AA6agR7WAXg7UHjILh8UQkSYm6OfmeHWMx3NTFoCBoieF0weqF3/nTgcIkhFi3fnar6HrVY8rBmH8w==
X-Received: by 2002:a17:90a:ce05:b0:1fb:226c:d6b2 with SMTP id
 f5-20020a17090ace0500b001fb226cd6b2mr5857769pju.124.1661159120536; 
 Mon, 22 Aug 2022 02:05:20 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 n34-20020a635c62000000b0041c3ab14ca1sm7015428pgm.0.2022.08.22.02.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:05:20 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 ybendito@redhat.com
Subject: [PATCH 2/4] hw/acpi: set ATS capability explicitly per pcie root port
Date: Mon, 22 Aug 2022 14:34:36 +0530
Message-Id: <20220822090438.426748-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822090438.426748-1-ani@anisinha.ca>
References: <20220822090438.426748-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
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
Suggested-by: Michael Tsirkin <mst@redhat.com>
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


