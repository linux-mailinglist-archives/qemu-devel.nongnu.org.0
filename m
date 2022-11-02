Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C70616867
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:21:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGLf-0003kx-3D; Wed, 02 Nov 2022 12:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLL-0003GD-LM
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGL9-0003ei-Lv
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gag5gdQNNtInKGqXoAiltRUevA6HG18svJOyxzNtlVk=;
 b=McEHHObYofmNc4ezdHIk9LzEPACpcvvWcNqzzmRHv04dc5WuEcMC6PdrGgRmOXovuUoWlF
 IGIgLQyFweq1PaUXqTHrXu4xtILj9+TavzDzcxzNc1moPiEeokZqxJh8ej5+e8Sr+RrV3y
 l0/Zh0KOfo9ejxb90cZJdK2FifaHWJ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-0KOF9HETPCWi-nigxIW_BQ-1; Wed, 02 Nov 2022 12:11:40 -0400
X-MC-Unique: 0KOF9HETPCWi-nigxIW_BQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso4984321wrb.8
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gag5gdQNNtInKGqXoAiltRUevA6HG18svJOyxzNtlVk=;
 b=JDbJnf8u2k8m+19SMkkWiZiH1uz7lLR4OuMa2wPQII4ZFyLwEFMGhvQqP8m5aj04ta
 YnQttSEZqVEjDPPmL9mUEgUqGdYt9YGswZ/ppMsFzGRiPYB39yvjkDQyEg8lfF7+gbqo
 rympB97bd6aU2kXZtLlfdKM1MpzmjZgBML04GtdPRbGzqck6RdP2AEItmlI/XfRK4rNw
 TENJrMHPup5v1smGV1dqtKyHtcEcW4kCEZVMCOnCvIysNyINXgQz7ZWTcO2+17C/f5bf
 lJ3J+BBwFWYQSusGbR4LUCC6S/cMk0y9ctq8NNiXEwW5lfoRSxQSFO9EbqZ5jsKb5c7n
 GuuQ==
X-Gm-Message-State: ACrzQf096TVshMJKzi7WXk5nx/Wov8jHMekxYo/NE37nzmAyN/OPRFq+
 qddf3l4n0tPJ3fbyQtUDhNB7zDTLhFeuGZJcqpWswgOQlAlJ5sClr7TtSmx+dmLjiNV/4A5oMiF
 ie9l7PuwWaM41Db3rU3D8dh2xwN0IGWn1SanNvQ8NmdhDco7EnB+oho/QUAjL
X-Received: by 2002:adf:b646:0:b0:221:76eb:b3ba with SMTP id
 i6-20020adfb646000000b0022176ebb3bamr15452530wre.237.1667405499233; 
 Wed, 02 Nov 2022 09:11:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67s1VBSZvIfgaxzZQIyzsWGlaW45DDc7Yiqs+I7+zMrYy4/ejwq/yGKomN0LhsDBjBim0aHw==
X-Received: by 2002:adf:b646:0:b0:221:76eb:b3ba with SMTP id
 i6-20020adfb646000000b0022176ebb3bamr15452489wre.237.1667405498888; 
 Wed, 02 Nov 2022 09:11:38 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bp21-20020a5d5a95000000b002302dc43d77sm13426104wrb.115.2022.11.02.09.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:38 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 68/82] hw/i386/acpi-build: Resolve redundant attribute
Message-ID: <20221102160336.616599-69-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The is_piix4 attribute is set once in one location and read once in
another. Doing both in one location allows for removing the attribute
altogether.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221026133110.91828-3-shentey@gmail.com>
Message-Id: <20221028103419.93398-3-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1ebf14b899..73d8a59737 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -112,7 +112,6 @@ typedef struct AcpiPmInfo {
 } AcpiPmInfo;
 
 typedef struct AcpiMiscInfo {
-    bool is_piix4;
     bool has_hpet;
 #ifdef CONFIG_TPM
     TPMVersion tpm_version;
@@ -281,17 +280,6 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
 
 static void acpi_get_misc_info(AcpiMiscInfo *info)
 {
-    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
-    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
-    assert(!!piix != !!lpc);
-
-    if (piix) {
-        info->is_piix4 = true;
-    }
-    if (lpc) {
-        info->is_piix4 = false;
-    }
-
     info->has_hpet = hpet_find();
 #ifdef CONFIG_TPM
     info->tpm_version = tpm_get_version(tpm_find());
@@ -1334,6 +1322,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
            Range *pci_hole, Range *pci_hole64, MachineState *machine)
 {
+    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
+    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
     CrsRangeEntry *entry;
     Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
     CrsRangeSet crs_range_set;
@@ -1354,11 +1344,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
 
+    assert(!!piix != !!lpc);
+
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
     build_dbg_aml(dsdt);
-    if (misc->is_piix4) {
+    if (piix) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
@@ -1371,7 +1363,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_piix4_pci0_int(dsdt);
-    } else {
+    } else if (lpc) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-- 
MST


