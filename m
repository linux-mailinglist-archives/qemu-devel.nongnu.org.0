Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0056545E07
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:01:18 +0200 (CEST)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZa1-0001hR-Gh
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZW9-0006EX-TU
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZW8-0006BE-91
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gDvKZYSn1i5sLA5v+UQUqZsPgY/wWGLuWICs9bpjlPE=;
 b=M6aEOgC6i2IW+v1waZZRlSG06SvKMbtJJGirLwSnAg119exERr2a5+n5fj767hqTH8CBQA
 FZPEqkHkOUI5KSGHs0A5pfz2A18IedfSkIkgpbZi0gQEBJ2FuQESSB3lHyhfwMOxNYB+r1
 9825rjC3mgub4epO3+twCIWk0hkv86g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-Ot177_faPkGNnFUiZTVuXQ-1; Fri, 10 Jun 2022 03:57:14 -0400
X-MC-Unique: Ot177_faPkGNnFUiZTVuXQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d9-20020adfe849000000b00213375a746aso5462266wrn.18
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gDvKZYSn1i5sLA5v+UQUqZsPgY/wWGLuWICs9bpjlPE=;
 b=AiOGFWP44GyxIg4d+RIfRP+Y7EM3l9Fx4vIUx/ehwO5dxklUc2iZSAJgqbMBl0qaDG
 XlHEFsja1aWDx51kHOeqiAAoJAPv3KYXQYZb1J3/1gEcIQtamHhSzbOhK65CuLzIy0ep
 16uOxMQaHrP0/FPqOJ4jLmxNgqy7VfJTjl+EQBZxd7UAabcwZpcbL8DAswKKuKbHiHS/
 x/B1/hqS3dADjVHuLwGQ1AiajiCuwNs7pu/ThzII5LQHbxrGPJtp5k3mEQORyEKuNNmj
 IdRYSu6GP6xTADvZOejNscCBuT15Q+eW0p0QdXOdX5tYPcEfeNg+omKQwZ9VHLcp0am6
 i9rQ==
X-Gm-Message-State: AOAM533lAuLjndm8gFz6BrXI+Iul8Ia14h/6HsSfZaxlN2Co9hMpJMgw
 MeY0E8+uAu2JEqoB5nQgYBOvZKPq5pH5KRo5Yx0TnDc220FCeog+Va79FtRHqP45w/2J6Whe5GW
 U+GRQtNuceZqVc+B0h7ucWjQp3wYrCvRxG1b4cTi6I7w6zDsMmxxJVoKh1Vke
X-Received: by 2002:a05:600c:a4c:b0:39c:6517:1136 with SMTP id
 c12-20020a05600c0a4c00b0039c65171136mr7615407wmq.12.1654847832993; 
 Fri, 10 Jun 2022 00:57:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw78w7JNCTYr72DKpM//Ez718ny/OJ8J1A2iPLLbpLYwz6DLdkvuKr0oGDHw0FEct0yApQOYw==
X-Received: by 2002:a05:600c:a4c:b0:39c:6517:1136 with SMTP id
 c12-20020a05600c0a4c00b0039c65171136mr7615364wmq.12.1654847832699; 
 Fri, 10 Jun 2022 00:57:12 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 i19-20020a7bc953000000b0039c1396b495sm2059605wml.9.2022.06.10.00.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:12 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org
Subject: [PULL 03/54] acpi: fdc-isa: replace ISADeviceClass::build_aml with
 AcpiDevAmlIfClass:build_dev_aml
Message-ID: <20220610075631.367501-4-mst@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/fdc-isa.c   | 16 ++++++++++------
 hw/i386/acpi-build.c |  1 -
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index fa20450747..fee1ca68a8 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -32,7 +32,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -214,9 +214,9 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0)
     return val;
 }
 
-static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
+static void build_fdc_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    FDCtrlISABus *isa = ISA_FDC(isadev);
+    FDCtrlISABus *isa = ISA_FDC(adev);
     Aml *dev;
     Aml *crs;
     int i;
@@ -241,7 +241,7 @@ static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
     aml_append(dev, aml_name_decl("_CRS", crs));
 
     for (i = 0; i < MIN(MAX_FD, ACPI_FDE_MAX_FD); i++) {
-        FloppyDriveType type = isa_fdc_get_drive_type(isadev, i);
+        FloppyDriveType type = isa_fdc_get_drive_type(ISA_DEVICE(adev), i);
 
         if (type < FLOPPY_DRIVE_TYPE_NONE) {
             fde_buf[i] = cpu_to_le32(1);  /* drive present */
@@ -283,14 +283,14 @@ static Property isa_fdc_properties[] = {
 static void isabus_fdc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->desc = "virtual floppy controller";
     dc->realize = isabus_fdc_realize;
     dc->fw_name = "fdc";
     dc->reset = fdctrl_external_reset_isa;
     dc->vmsd = &vmstate_isa_fdc;
-    isa->build_aml = fdc_isa_build_aml;
+    adevc->build_dev_aml = build_fdc_aml;
     device_class_set_props(dc, isa_fdc_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
@@ -313,6 +313,10 @@ static const TypeInfo isa_fdc_info = {
     .instance_size = sizeof(FDCtrlISABus),
     .class_init    = isabus_fdc_class_init,
     .instance_init = isabus_fdc_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void isa_fdc_register_types(void)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c125939ed6..1449832aa9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -40,7 +40,6 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
 #include "hw/input/i8042.h"
-#include "hw/block/fdc.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
-- 
MST


