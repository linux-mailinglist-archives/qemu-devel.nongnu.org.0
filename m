Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21B952927E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:10:52 +0200 (CEST)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhzQ-0004W2-1i
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhh1-0005ow-Hl
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgz-0006T1-CU
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B9XmN4qJjSBmirqGlIXVptoWdY/5ww10cMkP1MhCpCw=;
 b=I6U/283KWarGHcqJxKn+eQfuyWOdtOk4Y8Sap/KmVr4WbUJm2quyUBF1fcO6g96CIQr5Qo
 NgTAFkn8YL7mDD3smAWCa8VIwynKgqB9EI6pqYb7gj/OluGC5WhBmyD3dPFMZ+AR+iCpzk
 k5ZSSI0so4fY8dtI3ohyG9Y7VDg2ktw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-eXXcoN51N6OEFUF2o9mysw-1; Mon, 16 May 2022 16:51:47 -0400
X-MC-Unique: eXXcoN51N6OEFUF2o9mysw-1
Received: by mail-ed1-f71.google.com with SMTP id
 ay24-20020a056402203800b0042a96a76ba5so4441859edb.20
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B9XmN4qJjSBmirqGlIXVptoWdY/5ww10cMkP1MhCpCw=;
 b=FcBuIW8/5quvt5YaZBHQ8J5E5Te+3oRuVhiOwmrFwp633XsCFd/D5OvQETURkmyp+7
 TTJrAH+tAWtlNOKlwrjDoiKUHrgEQIoTbxNk/SysZDGAvS/5ADIq7WWLlmxherDKHHui
 NPcK49dFMuZJRpsRFSlGlixDJm8tBllB6yWnIscBWbCUbygJhJaHRdMKLVB6iV9Yn3XM
 9HUzGEFxdMc4Vkf1DnLRPuR8YKuPEN+9YFTo7O7qRxTn5LdyU7OazXclaF1/pJcPdjcG
 pqGsYUzR0Ws6XJlH43lZxbqZjuOFArHzTTD2ZKtzITYowTTmV84LLwPraEmrslc51Bl0
 RC+g==
X-Gm-Message-State: AOAM530fTBTaj7Zgg0RXDdtiiCCa6LGqcwrqzhSklMq52njOaaS/vBrC
 cTri+PR0TkTKBuxuqR1rREzzEu87UEmOpWl/VE2WyYmXHR6g3u2wlyNw+9EK1AC2Hnyv9sjGYAI
 6P0/UeyEj2fasrdSI1Sp1D0gksYk/dVcncOcJjgLz/8dKPmb7BCBGP0teWLX8
X-Received: by 2002:a17:907:e91:b0:6f4:d1e7:417d with SMTP id
 ho17-20020a1709070e9100b006f4d1e7417dmr17132813ejc.123.1652734304418; 
 Mon, 16 May 2022 13:51:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIN1IDpmciPRB+g5rfXmBKPhb5kQuKVJBBnkUYTPhkocvsAeiKf/l0ieCXHYnK+EaLAwYfVA==
X-Received: by 2002:a17:907:e91:b0:6f4:d1e7:417d with SMTP id
 ho17-20020a1709070e9100b006f4d1e7417dmr17132779ejc.123.1652734304052; 
 Mon, 16 May 2022 13:51:44 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 dq21-20020a170907735500b006f3ef214e0csm165093ejc.114.2022.05.16.13.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:51:43 -0700 (PDT)
Date: Mon, 16 May 2022 16:51:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 26/86] acpi/cxl: Add _OSC implementation (9.14.2)
Message-ID: <20220516204913.542894-27-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 T_FILL_THIS_FORM_SHORT=0.01,
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

CXL 2.0 specification adds 2 new dwords to the existing _OSC definition
from PCIe. The new dwords are accessed with a new uuid. This
implementation supports what is in the specification.

iasl -d decodes the result of this patch as:

Name (SUPP, Zero)
Name (CTRL, Zero)
Name (SUPC, Zero)
Name (CTRC, Zero)
Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
{
    CreateDWordField (Arg3, Zero, CDW1)
    If (((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */) || (Arg0 == ToUUID ("68f2d50b-c469-4d8a-bd3d-941a103fd3fc") /* Unknown UUID */)))
    {
        CreateDWordField (Arg3, 0x04, CDW2)
        CreateDWordField (Arg3, 0x08, CDW3)
        Local0 = CDW3 /* \_SB_.PC0C._OSC.CDW3 */
        Local0 &= 0x1F
        If ((Arg1 != One))
        {
            CDW1 |= 0x08
        }

        If ((CDW3 != Local0))
        {
            CDW1 |= 0x10
        }

        SUPP = CDW2 /* \_SB_.PC0C._OSC.CDW2 */
        CTRL = CDW3 /* \_SB_.PC0C._OSC.CDW3 */
        CDW3 = Local0
        If ((Arg0 == ToUUID ("68f2d50b-c469-4d8a-bd3d-941a103fd3fc") /* Unknown UUID */))
        {
            CreateDWordField (Arg3, 0x0C, CDW4)
            CreateDWordField (Arg3, 0x10, CDW5)
            SUPC = CDW4 /* \_SB_.PC0C._OSC.CDW4 */
            CTRC = CDW5 /* \_SB_.PC0C._OSC.CDW5 */
            CDW5 |= One
        }

        Return (Arg3)
    }
    Else
    {
        CDW1 |= 0x04
        Return (Arg3)
    }

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-25-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/cxl.h |  23 ++++++++
 hw/acpi/cxl-stub.c    |  12 ++++
 hw/acpi/cxl.c         | 130 ++++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c  |  13 +++--
 hw/acpi/Kconfig       |   5 ++
 hw/acpi/meson.build   |   4 +-
 6 files changed, 182 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/acpi/cxl.h
 create mode 100644 hw/acpi/cxl-stub.c
 create mode 100644 hw/acpi/cxl.c

diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
new file mode 100644
index 0000000000..7b8f3b8a2e
--- /dev/null
+++ b/include/hw/acpi/cxl.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2020 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_ACPI_CXL_H
+#define HW_ACPI_CXL_H
+
+void build_cxl_osc_method(Aml *dev);
+
+#endif
diff --git a/hw/acpi/cxl-stub.c b/hw/acpi/cxl-stub.c
new file mode 100644
index 0000000000..15bc21076b
--- /dev/null
+++ b/hw/acpi/cxl-stub.c
@@ -0,0 +1,12 @@
+
+/*
+ * Stubs for ACPI platforms that don't support CXl
+ */
+#include "qemu/osdep.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/cxl.h"
+
+void build_cxl_osc_method(Aml *dev)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
new file mode 100644
index 0000000000..ca1f04f359
--- /dev/null
+++ b/hw/acpi/cxl.c
@@ -0,0 +1,130 @@
+/*
+ * CXL ACPI Implementation
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/cxl/cxl.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "hw/acpi/cxl.h"
+#include "qapi/error.h"
+#include "qemu/uuid.h"
+
+static Aml *__build_cxl_osc_method(void)
+{
+    Aml *method, *if_uuid, *else_uuid, *if_arg1_not_1, *if_cxl, *if_caps_masked;
+    Aml *a_ctrl = aml_local(0);
+    Aml *a_cdw1 = aml_name("CDW1");
+
+    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
+    /* CDW1 is used for the return value so is present whether or not a match occurs */
+    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
+
+    /*
+     * Generate shared section between:
+     * CXL 2.0 - 9.14.2.1.4 and
+     * PCI Firmware Specification 3.0
+     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
+     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
+     * identified by the Universal Unique IDentifier (UUID)
+     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
+     * The _OSC interface for a CXL Host bridge is
+     * identified by the UUID 68F2D50B-C469-4D8A-BD3D-941A103FD3FC
+     * A CXL Host bridge is compatible with a PCI host bridge so
+     * for the shared section match both.
+     */
+    if_uuid = aml_if(
+        aml_lor(aml_equal(aml_arg(0),
+                          aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")),
+                aml_equal(aml_arg(0),
+                          aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC"))));
+    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+
+    aml_append(if_uuid, aml_store(aml_name("CDW3"), a_ctrl));
+
+    /*
+     *
+     * Allows OS control for all 5 features:
+     * PCIeHotplug SHPCHotplug PME AER PCIeCapability
+     */
+    aml_append(if_uuid, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
+
+    /*
+     * Check _OSC revision.
+     * PCI Firmware specification 3.3 and CXL 2.0 both use revision 1
+     * Unknown Revision is CDW1 - BIT (3)
+     */
+    if_arg1_not_1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
+    aml_append(if_arg1_not_1, aml_or(a_cdw1, aml_int(0x08), a_cdw1));
+    aml_append(if_uuid, if_arg1_not_1);
+
+    if_caps_masked = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
+
+    /* Capability bits were masked */
+    aml_append(if_caps_masked, aml_or(a_cdw1, aml_int(0x10), a_cdw1));
+    aml_append(if_uuid, if_caps_masked);
+
+    aml_append(if_uuid, aml_store(aml_name("CDW2"), aml_name("SUPP")));
+    aml_append(if_uuid, aml_store(aml_name("CDW3"), aml_name("CTRL")));
+
+    /* Update DWORD3 (the return value) */
+    aml_append(if_uuid, aml_store(a_ctrl, aml_name("CDW3")));
+
+    /* CXL only section as per CXL 2.0 - 9.14.2.1.4 */
+    if_cxl = aml_if(aml_equal(
+        aml_arg(0), aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC")));
+    /* CXL support field */
+    aml_append(if_cxl, aml_create_dword_field(aml_arg(3), aml_int(12), "CDW4"));
+    /* CXL capabilities */
+    aml_append(if_cxl, aml_create_dword_field(aml_arg(3), aml_int(16), "CDW5"));
+    aml_append(if_cxl, aml_store(aml_name("CDW4"), aml_name("SUPC")));
+    aml_append(if_cxl, aml_store(aml_name("CDW5"), aml_name("CTRC")));
+
+    /* CXL 2.0 Port/Device Register access */
+    aml_append(if_cxl,
+               aml_or(aml_name("CDW5"), aml_int(0x1), aml_name("CDW5")));
+    aml_append(if_uuid, if_cxl);
+
+    aml_append(if_uuid, aml_return(aml_arg(3)));
+    aml_append(method, if_uuid);
+
+    /*
+     * If no UUID matched, return Unrecognized UUID via Arg3 DWord 1
+     * ACPI 6.4 - 6.2.11
+     * Unrecognised UUID - BIT(2)
+     */
+    else_uuid = aml_else();
+
+    aml_append(else_uuid,
+               aml_or(aml_name("CDW1"), aml_int(0x4), aml_name("CDW1")));
+    aml_append(else_uuid, aml_return(aml_arg(3)));
+    aml_append(method, else_uuid);
+
+    return method;
+}
+
+void build_cxl_osc_method(Aml *dev)
+{
+    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
+    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
+    aml_append(dev, aml_name_decl("SUPC", aml_int(0)));
+    aml_append(dev, aml_name_decl("CTRC", aml_int(0)));
+    aml_append(dev, __build_cxl_osc_method());
+}
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2d81b0f40c..59ede8b2e9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -67,6 +67,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
 #include "hw/acpi/pci.h"
+#include "hw/acpi/cxl.h"
 
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
@@ -1582,11 +1583,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             if (pci_bus_is_cxl(bus)) {
-                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+                struct Aml *pkg = aml_package(2);
 
-                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
-                aml_append(dev, build_q35_osc_method(true));
+                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
+                aml_append(pkg, aml_eisaid("PNP0A08"));
+                aml_append(pkg, aml_eisaid("PNP0A03"));
+                aml_append(dev, aml_name_decl("_CID", pkg));
+                aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+                aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
+                build_cxl_osc_method(dev);
             } else if (pci_bus_is_express(bus)) {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 19caebde6c..3703aca212 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -5,6 +5,7 @@ config ACPI_X86
     bool
     select ACPI
     select ACPI_NVDIMM
+    select ACPI_CXL
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
     select ACPI_HMAT
@@ -66,3 +67,7 @@ config ACPI_ERST
     bool
     default y
     depends on ACPI && PCI
+
+config ACPI_CXL
+    bool
+    depends on ACPI
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 8bea2e6933..cea2f5f93a 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -13,6 +13,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_MEMORY_HOTPLUG', if_false: files('acpi-mem-hotplu
 acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_true: files('nvdimm.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_false: files('acpi-nvdimm-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_CXL', if_true: files('cxl.c'), if_false: files('cxl-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
@@ -33,4 +34,5 @@ softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
                                                   'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
                                                   'acpi-mem-hotplug-stub.c', 'acpi-cpu-hotplug-stub.c',
-                                                  'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c'))
+                                                  'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c',
+                                                  'cxl-stub.c'))
-- 
MST


