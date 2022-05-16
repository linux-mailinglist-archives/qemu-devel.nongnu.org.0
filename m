Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6AF5282CE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:06:32 +0200 (CEST)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYYZ-0003vg-IN
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6N-0006wE-6U
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6J-0005Mt-EK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B9XmN4qJjSBmirqGlIXVptoWdY/5ww10cMkP1MhCpCw=;
 b=R6EJpx0MSAFPmtN79TM0YgVgsajGxP61HAgx3VuI8ggnicXCvJ7F+Qt47ijVFJHgxovhg6
 ycGLBqTPfq2+xtPrC9MOGOq82omgltgLoECoFS3awncLV1U/Nuq8UPhS+XULFzG2/HDieQ
 2RMPLs55FFdqRO/k7ETgHKTPsbZILQk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-Gt2hGHbwMwq1KRZGUgZcNA-1; Mon, 16 May 2022 06:37:11 -0400
X-MC-Unique: Gt2hGHbwMwq1KRZGUgZcNA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s8-20020adfecc8000000b0020d080b6fddso367984wro.20
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B9XmN4qJjSBmirqGlIXVptoWdY/5ww10cMkP1MhCpCw=;
 b=QoTJi00+R17YZ2KnKWjvK5TPRu7yyjKxjIG2Jy1AgTnKlpHTgWazBkurBlcRRdiMGY
 lM7BoYaXxgg0SwxW9LBz/ejHqyLtsczsZymTYDtI5ca7/d0r08Ml1P5f5Uii6u/6dkbX
 32QaZMcPs01jAZy9WvAwlLe8/7YYwaSTZnKKl3cQxDM87N6mhK+a3oIpCi/VCM0YUeD8
 H2MM2cWKacCY2H9vY0yO4i9AO9HXeSSJA5y6xvZ9EOpNEj50T1CDCuIdjINGfftQSgc1
 BsO6sUgtrXtay8KfsmxALB0vDi3SjEc0E54VBZFeZkTEB+HO4j617TaF3ZMpLTkvpFDw
 XINA==
X-Gm-Message-State: AOAM533ten6JeEEm1nLQnlR2nkmUqOftHtBOJeUVUdyJiqJicnMMd4xP
 FgsqvEXFpwzrWNio3z9k38lR0iy39mZn+4hIBLalhLIMXeqA92ES47A8O6nwp1BfIjuWMBU8Xgr
 7bcAubty+iGJPhZCd/L1qqk4AxiE+6BZKVDEGR3JsdRj33kJ0toQomnlTlDaR
X-Received: by 2002:a05:600c:500d:b0:394:62d1:b3fa with SMTP id
 n13-20020a05600c500d00b0039462d1b3famr26340479wmr.194.1652697429682; 
 Mon, 16 May 2022 03:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi2n4437P5uPC8uoVLZCVw3NGyuqDWVZO30rZLvoz8LHqg9QtwL8myEQflewprq7q7jEC9kQ==
X-Received: by 2002:a05:600c:500d:b0:394:62d1:b3fa with SMTP id
 n13-20020a05600c500d00b0039462d1b3famr26340445wmr.194.1652697429360; 
 Mon, 16 May 2022 03:37:09 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 x14-20020a1c7c0e000000b003942a244f3fsm12485551wmc.24.2022.05.16.03.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:08 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:05 -0400
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
Subject: [PULL 26/91] acpi/cxl: Add _OSC implementation (9.14.2)
Message-ID: <20220516095448.507876-27-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


