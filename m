Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348B1528A38
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:24:18 +0200 (CEST)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdW5-0007jQ-Al
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccM-0004EM-Oj
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccL-0006H6-0q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V77u6QEgIHkKnnBG8fB4h2ixx5SAfP1FlerF5HIUxIM=;
 b=Xc6yYINwx/Q3xiSUYPJEZlaw/NXrmNarMcQFCNPKa6oBoiAs3IKFi1Mxtwfg6MGQXVmUWb
 53lQxY94ePjivkZP3J9y/m0ECw8Yeevjq88e37YESNlIBs5xX2ndIqs1TA8W3dTXCf3ZGf
 g2ZuO9LbQnsnL9yBu6Ua9FEYbA7RzE4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-RM6pjHJaOAmVSN44Ujy6Rg-1; Mon, 16 May 2022 11:26:36 -0400
X-MC-Unique: RM6pjHJaOAmVSN44Ujy6Rg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC9EA9483E3;
 Mon, 16 May 2022 15:26:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C51E9492C14;
 Mon, 16 May 2022 15:26:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 17/35] q35: acpi: drop not needed
 PCMachineClass::do_not_add_smb_acpi
Date: Mon, 16 May 2022 11:25:52 -0400
Message-Id: <20220516152610.1963435-18-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

by default we do not version ACPI AML as it's considered
a part of firmware. Drop do_not_add_smb_acpi that blocked
SMBUS AML description on 3.1 and older machine types without
providing justification.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
we can keep this bit if anyone can prove/report adverse effect
on VM.
---
 include/hw/i386/pc.h | 1 -
 hw/i386/acpi-build.c | 2 +-
 hw/i386/pc_piix.c    | 1 -
 hw/i386/pc_q35.c     | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index aff8add155..da2ebfc33a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -106,7 +106,6 @@ struct PCMachineClass {
     bool rsdp_in_ram;
     int legacy_acpi_table_size;
     unsigned acpi_data_size;
-    bool do_not_add_smb_acpi;
     int pci_root_uid;
 
     /* SMBIOS compat: */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ca5cab87ba..250a7c07af 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1510,7 +1510,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_q35_pci0_int(dsdt);
-        if (pcms->smbus && !pcmc->do_not_add_smb_acpi) {
+        if (pcms->smbus) {
             build_smb0(dsdt, ICH9_SMB_DEV, ICH9_SMB_FUNC);
         }
     }
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f843dd906f..d4b37b4652 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -562,7 +562,6 @@ static void pc_i440fx_3_1_machine_options(MachineClass *m)
 
     pc_i440fx_4_0_machine_options(m);
     m->is_default = false;
-    pcmc->do_not_add_smb_acpi = true;
     m->smbus_no_migration_support = true;
     m->alias = NULL;
     pcmc->pvh_enabled = false;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 302288342a..ad3f519f77 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -512,7 +512,6 @@ static void pc_q35_3_1_machine_options(MachineClass *m)
 
     pc_q35_4_0_machine_options(m);
     m->default_kernel_irqchip_split = false;
-    pcmc->do_not_add_smb_acpi = true;
     m->smbus_no_migration_support = true;
     m->alias = NULL;
     pcmc->pvh_enabled = false;
-- 
2.31.1


