Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED6543243
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:13:25 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywR3-0002fV-1A
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8H-0001VV-3Y
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8F-0004NF-5J
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WH1b7JwKvFXpEwjGioUvxwtQ+UrFYj67gwLDXtD9Clc=;
 b=dGNIv9MMFRvxBy4i0D2wmiqqU5v6LvG7vtxOjSXvWceOEwg7vD9Av/J+TitguT7JUiOTek
 LP4dliuCctCpaTp6eZUq1VO6jS+iRxKNZDzwmRP2O12u/BWE3hg7C1lY1JbaML1gkWkNZR
 aQRoWpRlwLsYj/XOe/TPFQlhaALDQQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-XyBbkNnZMJK7q3panxqu5Q-1; Wed, 08 Jun 2022 09:53:57 -0400
X-MC-Unique: XyBbkNnZMJK7q3panxqu5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F014F803B22
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BBDCC28117;
 Wed,  8 Jun 2022 13:53:56 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 17/35] q35: acpi: drop not needed
 PCMachineClass::do_not_add_smb_acpi
Date: Wed,  8 Jun 2022 09:53:22 -0400
Message-Id: <20220608135340.3304695-18-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

by default we do not version ACPI AML as it's considered
a part of firmware. Drop do_not_add_smb_acpi that blocked
SMBUS AML description on 3.1 and older machine types without
providing justification.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.31.1


