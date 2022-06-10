Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17777545EC1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:22:25 +0200 (CEST)
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZuS-0003Pn-33
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWp-0007et-G8
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWo-0006Gj-0F
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=elXeHLdFU6qNWf0ObjOjZw2aP+XfpSSnsKrXOEKW7ZU=;
 b=giQxgK99SyxH2d3ILW8GlrbAnwhweXSrKNCTavGWVi/j2c1dN4dXS/80h/efZae3n3dakO
 HQeFdRi4VXd8uE+6+IxlyY9aEMED5wzBtaDVWJw94e/GfIn0QhGcItiOYfZOIMlLUTKUZ9
 oyPdVsU5SuwgDdHKwJYtxkY5E/ym7aw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-4zFKAB-8O7esUTtqRSeJAQ-1; Fri, 10 Jun 2022 03:57:56 -0400
X-MC-Unique: 4zFKAB-8O7esUTtqRSeJAQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so947131wmb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=elXeHLdFU6qNWf0ObjOjZw2aP+XfpSSnsKrXOEKW7ZU=;
 b=OefhGtZcGSFXDLA6A1CwpO2Aw9mX+Hp8Y7rtEimAWFSzg56ex0Lxrk3GyV76e6pyVM
 lCpcqA549WdMXd6X4R09q3uv2cpAY+NGzONrYlGTtUpKrIANbxpaHqiduUcIz94KUYd9
 CtyDzo1Ev45ptRxreefbmDfx9Amlpds1YxGj4eyejowzuMpkdwKnpVIRpYuraRLsukfQ
 cIXWIUMEzHqNv//NAvlxVf33C0/DKw6W57zGyLdfKI4OLSWewveoWiAAheNNxyOyhMtV
 IH32wVdkZbWOQLBH9INzkMgZs2atKM7ADTBpX3K4nKfqe2GLTpvn6NT+dpnGrIo7xVHf
 4Btg==
X-Gm-Message-State: AOAM530yN9YOHhbbY5cwqGvcsPJ/XRv70XP9i2puBHM4SXGGQ3Vomd4W
 EN6givrYLSqawhFUgDfnnjNZ9ZqVPfvxEYKC95Y/82TZNLHgXDXV81M/rEVt01S2wGO0wkJhx/8
 8v7kXZIQ8W5FC+OT5UvhFrzQ0QlnbJmVAaB22K/tsxZmeDhh2xIUGyvp8H90o
X-Received: by 2002:a7b:c1cf:0:b0:39c:4460:cfa8 with SMTP id
 a15-20020a7bc1cf000000b0039c4460cfa8mr7348552wmj.21.1654847874915; 
 Fri, 10 Jun 2022 00:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUD5IaHiCl3DF+c3vNqFiioUGF2n2SpXLyjNbnukWse+bxnRMrx5eyj8qJbGEI/j7Hr0SEjQ==
X-Received: by 2002:a7b:c1cf:0:b0:39c:4460:cfa8 with SMTP id
 a15-20020a7bc1cf000000b0039c4460cfa8mr7348526wmj.21.1654847874645; 
 Fri, 10 Jun 2022 00:57:54 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 b11-20020a5d4d8b000000b0020c7ec0fdf4sm31174293wru.117.2022.06.10.00.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:54 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 17/54] q35: acpi: drop not needed
 PCMachineClass::do_not_add_smb_acpi
Message-ID: <20220610075631.367501-18-mst@redhat.com>
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

by default we do not version ACPI AML as it's considered
a part of firmware. Drop do_not_add_smb_acpi that blocked
SMBUS AML description on 3.1 and older machine types without
providing justification.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-18-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h | 1 -
 hw/i386/acpi-build.c | 2 +-
 hw/i386/pc_piix.c    | 1 -
 hw/i386/pc_q35.c     | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index ffcac5121e..dee38cfac4 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -104,7 +104,6 @@ struct PCMachineClass {
     bool rsdp_in_ram;
     int legacy_acpi_table_size;
     unsigned acpi_data_size;
-    bool do_not_add_smb_acpi;
     int pci_root_uid;
 
     /* SMBIOS compat: */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 5b963cca32..d943354999 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1530,7 +1530,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_q35_pci0_int(dsdt);
-        if (pcms->smbus && !pcmc->do_not_add_smb_acpi) {
+        if (pcms->smbus) {
             build_smb0(dsdt, ICH9_SMB_DEV, ICH9_SMB_FUNC);
         }
     }
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 578e537b35..7f777f7aed 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -564,7 +564,6 @@ static void pc_i440fx_3_1_machine_options(MachineClass *m)
 
     pc_i440fx_4_0_machine_options(m);
     m->is_default = false;
-    pcmc->do_not_add_smb_acpi = true;
     m->smbus_no_migration_support = true;
     m->alias = NULL;
     pcmc->pvh_enabled = false;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 42eb8b9707..f96cbd04e2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -514,7 +514,6 @@ static void pc_q35_3_1_machine_options(MachineClass *m)
 
     pc_q35_4_0_machine_options(m);
     m->default_kernel_irqchip_split = false;
-    pcmc->do_not_add_smb_acpi = true;
     m->smbus_no_migration_support = true;
     m->alias = NULL;
     pcmc->pvh_enabled = false;
-- 
MST


