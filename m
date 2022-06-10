Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B977F5460C3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:04:38 +0200 (CEST)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaZJ-0004PV-IB
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXm-0001m1-8b
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXk-0006MQ-HE
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mk7wcvmxLiyC1kUo6mYTYwgkOqmzZq4GWw1BDaiCecM=;
 b=MDsZhaUD+ZRhWJIdxgWvHP5jfvUHSpBoPvD3683ISW3Hl1fZnvs+rYl6AuWJau6OVZ5Urd
 gO4HOGzcJu61VmZRWRo4b2Lp8OgZiyvCJnejrbp4ivOjmxlKIqHpIjdrFweuMkYZmg20T8
 8jxERKtIt6PqZMJKUXhnzB4++6wMme4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-2rTXaEumN66JGcOI-k-rsA-1; Fri, 10 Jun 2022 03:58:43 -0400
X-MC-Unique: 2rTXaEumN66JGcOI-k-rsA-1
Received: by mail-wm1-f71.google.com with SMTP id
 u12-20020a05600c19cc00b0038ec265155fso938378wmq.6
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mk7wcvmxLiyC1kUo6mYTYwgkOqmzZq4GWw1BDaiCecM=;
 b=tVZ7dccaSy05j0YSPAM7gOqBGbMSc/5gQGsG6PRybZ6QJoEu21xtuyuUxR7KaWuCZs
 E6EiwsLOBu9JJo29XDyTuw4LU5CCNS7LtE3Kvjo/fW7eP8fWOQHtPwmkz8O13eoFjiQK
 OzoYVhVaaFBAsx81yJQmI2yk2S+ekyXqbX3UP1TpWhFPU3Wv+snfh3QlFF3CKdmzgvzw
 hCiwFd0o6QCGbZhbrBt1/7A7uWDa40KWx/tSQR3B8xJ+sHmJLBnzMfM9OWKnJs+Uupe2
 6KCX+2AW8+IwTLMaMLd40dvffbztNwaaStmGXQeLK2Y66JpIEVvhI4u4bu4fX1bKvvxV
 9SUw==
X-Gm-Message-State: AOAM531+njdxQIeJxmmae6nJDlYDhNQG7+bMvpbM+x5ZpYnCF9oQi0X9
 xqSRk41XT/F+nMp5Bus24vWB35kV8jFlDfulYlWjzz6wylDwN6ZYYEXyL4cPDKymT3y6vd0sgTv
 dyfgID78j8jKKl5jOcbmGlbYW5sA6YoSxD1KBve8/4E7ya0ZS38h9k3xq5hqK
X-Received: by 2002:adf:bc04:0:b0:211:800a:7788 with SMTP id
 s4-20020adfbc04000000b00211800a7788mr43296541wrg.46.1654847922014; 
 Fri, 10 Jun 2022 00:58:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQXZ8NSna+Vne7Z+oeLV8qjwjRI/3KJB4Dps3PzMx6gZXdIF1FSMiU2PwcwpqKMzZYJ2+fuQ==
X-Received: by 2002:adf:bc04:0:b0:211:800a:7788 with SMTP id
 s4-20020adfbc04000000b00211800a7788mr43296510wrg.46.1654847921695; 
 Fri, 10 Jun 2022 00:58:41 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 g12-20020a5d46cc000000b0020fff0ea0a3sm26075525wrs.116.2022.06.10.00.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:41 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PULL 33/54] acpi: tpm-tis: use AcpiDevAmlIfClass:build_dev_aml to
 provide device's AML
Message-ID: <20220610075631.367501-34-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

.. and clean up not longer needed conditionals in DSTD build code
tpm-tis AML will be fetched and included when ISA bridge will
build its own AML code (including attached devices).

Expected AML change:
    the device under separate _SB.PCI0.ISA scope is moved directly
    under Device(ISA) node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-34-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 34 ----------------------------------
 hw/tpm/tpm_tis_isa.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1204b6da05..0b65fc99cd 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1804,40 +1804,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
             build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
-
-#ifdef CONFIG_TPM
-            if (TPM_IS_TIS_ISA(tpm)) {
-                dev = aml_device("ISA.TPM");
-                if (misc->tpm_version == TPM_VERSION_2_0) {
-                    aml_append(dev, aml_name_decl("_HID",
-                                                  aml_string("MSFT0101")));
-                    aml_append(dev,
-                               aml_name_decl("_STR",
-                                             aml_string("TPM 2.0 Device")));
-                } else {
-                    aml_append(dev, aml_name_decl("_HID",
-                                                  aml_eisaid("PNP0C31")));
-                }
-                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-
-                aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
-                crs = aml_resource_template();
-                aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE,
-                           TPM_TIS_ADDR_SIZE, AML_READ_WRITE));
-                /*
-                    FIXME: TPM_TIS_IRQ=5 conflicts with PNP0C0F irqs,
-                    Rewrite to take IRQ from TPM device model and
-                    fix default IRQ value there to use some unused IRQ
-                 */
-                /* aml_append(crs, aml_irq_no_flags(TPM_TIS_IRQ)); */
-                aml_append(dev, aml_name_decl("_CRS", crs));
-
-                tpm_build_ppi_acpi(tpm, dev);
-
-                aml_append(scope, dev);
-            }
-#endif
-
             aml_append(sb_scope, scope);
         }
     }
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 3477afd735..91e3792248 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -30,6 +30,7 @@
 #include "tpm_prop.h"
 #include "tpm_tis.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 struct TPMStateISA {
     /*< private >*/
@@ -138,10 +139,39 @@ static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
     }
 }
 
+static void build_tpm_tis_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    Aml *dev, *crs;
+    TPMStateISA *isadev = TPM_TIS_ISA(adev);
+    TPMIf *ti = TPM_IF(isadev);
+
+    dev = aml_device("TPM");
+    if (tpm_tis_isa_get_tpm_version(ti) == TPM_VERSION_2_0) {
+        aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+        aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
+    } else {
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C31")));
+    }
+    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
+    crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE, TPM_TIS_ADDR_SIZE,
+                                      AML_READ_WRITE));
+    /*
+     * FIXME: TPM_TIS_IRQ=5 conflicts with PNP0C0F irqs,
+     * fix default TPM_TIS_IRQ value there to use some unused IRQ
+     */
+    /* aml_append(crs, aml_irq_no_flags(isadev->state.irq_num)); */
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    tpm_build_ppi_acpi(ti, dev);
+    aml_append(scope, dev);
+}
+
 static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     TPMIfClass *tc = TPM_IF_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     device_class_set_props(dc, tpm_tis_isa_properties);
     dc->vmsd  = &vmstate_tpm_tis_isa;
@@ -151,6 +181,7 @@ static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
     tc->request_completed = tpm_tis_isa_request_completed;
     tc->get_version = tpm_tis_isa_get_tpm_version;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    adevc->build_dev_aml = build_tpm_tis_isa_aml;
 }
 
 static const TypeInfo tpm_tis_isa_info = {
@@ -161,6 +192,7 @@ static const TypeInfo tpm_tis_isa_info = {
     .class_init  = tpm_tis_isa_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_TPM_IF },
+        { TYPE_ACPI_DEV_AML_IF },
         { }
     }
 };
-- 
MST


