Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC7424906F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 23:58:22 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k89cb-0005LU-W9
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 17:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1k89ZY-0001D4-NB
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 17:55:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34770
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1k89ZW-0007ft-V0
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 17:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597787710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zz2tH4BT/ZCHpEwxA/sq/JDVNa6IRW375UQRDz8+Dvo=;
 b=bc2kdDXVBCpZB/VLr9CAlpnoF8Hj5P20EKWBaa+xa08SpcxrCZTa7DyGAPW+8Yb8OLkpa9
 ILPDDyJbm5HIxN0IfBRu/Vk5Jg+v2YUe89Gk5m3hZjOHRjQxd2BW3DcxdoAyp589rQzEWA
 4l7G5jwH9HSdVIEPa2ymW2+0fkniiYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-wxT4Rjt0M-2F0NtlekFJlw-1; Tue, 18 Aug 2020 17:55:08 -0400
X-MC-Unique: wxT4Rjt0M-2F0NtlekFJlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99815100746F;
 Tue, 18 Aug 2020 21:55:07 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.43.2.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 417751014171;
 Tue, 18 Aug 2020 21:55:06 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/4] hw/i386/acpi-build: Turn off support of PCIe
 native hot-plug and SHPC in _OSC
Date: Tue, 18 Aug 2020 23:52:26 +0200
Message-Id: <20200818215227.181654-4-jusual@redhat.com>
In-Reply-To: <20200818215227.181654-1-jusual@redhat.com>
References: <20200818215227.181654-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jusual@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 16:56:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Other methods may be used if the system is capable of this and the _OSC bit
is set. Disable them explicitly to force ACPI PCI hot-plug use. The older
versions will still use PCIe native.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/i386/acpi-build.h | 11 +++++++++++
 hw/i386/acpi-build.c | 21 +++++++++++++++------
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 74df5fc612..6f94312c39 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -5,6 +5,17 @@
 
 extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
 
+/* PCI Firmware Specification 3.2, Table 4-5 */
+typedef enum {
+    ACPI_OSC_NATIVE_HP_EN = 0,
+    ACPI_OSC_SHPC_EN = 1,
+    ACPI_OSC_PME_EN = 2,
+    ACPI_OSC_AER_EN = 3,
+    ACPI_OSC_PCIE_CAP_EN = 4,
+    ACPI_OSC_LTR_EN = 5,
+    ACPI_OSC_ALLONES_INVALID = 6,
+} AcpiOSCField;
+
 void acpi_setup(void);
 
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f3cd52bd06..c5f4802b8c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1411,7 +1411,7 @@ static void build_i386_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     aml_append(table, scope);
 }
 
-static Aml *build_q35_osc_method(void)
+static Aml *build_q35_osc_method(AcpiPmInfo *pm)
 {
     Aml *if_ctx;
     Aml *if_ctx2;
@@ -1419,6 +1419,7 @@ static Aml *build_q35_osc_method(void)
     Aml *method;
     Aml *a_cwd1 = aml_name("CDW1");
     Aml *a_ctrl = aml_local(0);
+    unsigned osc_ctrl;
 
     method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
     aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
@@ -1430,11 +1431,19 @@ static Aml *build_q35_osc_method(void)
 
     aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
 
+    /* Always allow native PME, AER (depend on PCIE Capability Control) */
+    osc_ctrl = BIT(ACPI_OSC_PME_EN) | BIT(ACPI_OSC_AER_EN) |
+               BIT(ACPI_OSC_PCIE_CAP_EN);
+
     /*
-     * Always allow native PME, AER (no dependencies)
-     * Allow SHPC (PCI bridges can have SHPC controller)
+     * Guests seem to generally prefer native hot-plug control.
+     * Enable it only when we do not use ACPI hot-plug.
      */
-    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
+    if (!pm->pcihp_bridge_en) {
+        osc_ctrl |= BIT(ACPI_OSC_NATIVE_HP_EN) | BIT(ACPI_OSC_SHPC_EN);
+    }
+
+    aml_append(if_ctx, aml_and(a_ctrl, aml_int(osc_ctrl), a_ctrl));
 
     if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
     /* Unknown revision */
@@ -1514,7 +1523,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-        aml_append(dev, build_q35_osc_method());
+        aml_append(dev, build_q35_osc_method(pm));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1590,7 +1599,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             if (pci_bus_is_express(bus)) {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-                aml_append(dev, build_q35_osc_method());
+                aml_append(dev, build_q35_osc_method(pm));
             } else {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             }
-- 
2.25.4


