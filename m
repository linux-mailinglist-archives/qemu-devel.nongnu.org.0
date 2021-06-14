Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E293A6FDB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:12:32 +0200 (CEST)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsswf-0003yb-Be
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuB-0001DX-Lu
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssu6-0002qO-Iy
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40vzgrQVAoTrypUvftjd8gyH06NkxRrNl5FBl3A4XCw=;
 b=ChoRbvTw9u2argTjh7r1C4a8yxdqZ4Lmfj1cY1QwissBA6+i01D3WdL/JgnitjvbCfGunB
 WdkHTQziFvJhDiy4rYxV21WlRFDkEG35ckxjNrbBtaC3KITiTs3sMudCHq3kLrzrXZZObC
 rD472ybm/FSfiMJg0aC5t8eHvgUqmx8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-xruvtWnZPf-8asRLiLHtMQ-1; Mon, 14 Jun 2021 16:09:48 -0400
X-MC-Unique: xruvtWnZPf-8asRLiLHtMQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 g14-20020a5d698e0000b0290117735bd4d3so7437870wru.13
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=40vzgrQVAoTrypUvftjd8gyH06NkxRrNl5FBl3A4XCw=;
 b=HoLpoyDtcs+4Y6i5fschnQSCCYtJY9m54y0hgKLxwt+5KyEk7ckxOdyuTUIlY75BCF
 Al9gAg276H8t2I5BI+DrtNdJLnb3p3JFjOKTg1+NICc0tiL5TPyANLR6qd5FxE9TZqzl
 6JkYXdjkgXs/1qq6GhlfdqmhiVZcGJm5LzXuczbfOnQs/m24N9GU/wb5UduSA8m0SdOw
 lGbE1gHiUXnvb8ygO6EtYjz/rBd7DH2qQgVnPB06WQHdfnHc9r+jAdSmX5smOB4rjyjm
 WD4ZHIPt2XZLonv9S9xm4BtveBtvSpu89MGMtYrLwONy8NgWDvVwG6IvQNMtKrgDvyis
 BcMQ==
X-Gm-Message-State: AOAM532Lq5ouXhfrJzr1lnOS525YGjJ6UJ+T23JyYQzPQI84CdWBoTTt
 7mMbXRRXwvjBti4DJHn5B3Osj7BhWnQ3stnpr7EujIf+MXyQefsLcECqqwK8GjHhsdXQm+vTgr3
 8Q+B8o2GBBPGGZ+Q9nqWuDaPv19gN6YevxZoFUcq5/Y9zlRlhiC7R73Lcer4zvV0d
X-Received: by 2002:a05:600c:5112:: with SMTP id
 o18mr17697365wms.15.1623701386798; 
 Mon, 14 Jun 2021 13:09:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx73L90UH77xCEhpE85hSS1DheGNL00NdYYVBu3XttGgizFFeM7Sf2ru0z39vRAsn/ON3i+4g==
X-Received: by 2002:a05:600c:5112:: with SMTP id
 o18mr17697335wms.15.1623701386557; 
 Mon, 14 Jun 2021 13:09:46 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r1sm3338409wmh.32.2021.06.14.13.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:09:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] i386: Eliminate all TPM related code if CONFIG_TPM is
 not set
Date: Mon, 14 Jun 2021 22:09:36 +0200
Message-Id: <20210614200940.2056770-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614200940.2056770-1-philmd@redhat.com>
References: <20210614200940.2056770-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614191335.1968807-2-stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 20 ++++++++++++++++++++
 stubs/tpm.c          |  4 ----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 80bee00da66..796ffc6f5c4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -107,7 +107,9 @@ typedef struct AcpiPmInfo {
 typedef struct AcpiMiscInfo {
     bool is_piix4;
     bool has_hpet;
+#ifdef CONFIG_TPM
     TPMVersion tpm_version;
+#endif
     const unsigned char *dsdt_code;
     unsigned dsdt_size;
     uint16_t pvpanic_port;
@@ -286,7 +288,9 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
     }
 
     info->has_hpet = hpet_find();
+#ifdef CONFIG_TPM
     info->tpm_version = tpm_get_version(tpm_find());
+#endif
     info->pvpanic_port = pvpanic_port();
     info->applesmc_io_base = applesmc_port();
 }
@@ -1371,7 +1375,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     uint32_t nr_mem = machine->ram_slots;
     int root_bus_limit = 0xFF;
     PCIBus *bus = NULL;
+#ifdef CONFIG_TPM
     TPMIf *tpm = tpm_find();
+#endif
     int i;
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
 
@@ -1604,10 +1610,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
     }
 
+#ifdef CONFIG_TPM
     if (TPM_IS_TIS_ISA(tpm_find())) {
         aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE,
                    TPM_TIS_ADDR_SIZE, AML_READ_WRITE));
     }
+#endif
     aml_append(scope, aml_name_decl("_CRS", crs));
 
     /* reserve GPE0 block resources */
@@ -1753,6 +1761,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             /* Scan all PCI buses. Generate tables to support hotplug. */
             build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
 
+#ifdef CONFIG_TPM
             if (TPM_IS_TIS_ISA(tpm)) {
                 if (misc->tpm_version == TPM_VERSION_2_0) {
                     dev = aml_device("TPM");
@@ -1780,11 +1789,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
                 aml_append(scope, dev);
             }
+#endif
 
             aml_append(sb_scope, scope);
         }
     }
 
+#ifdef CONFIG_TPM
     if (TPM_IS_CRB(tpm)) {
         dev = aml_device("TPM");
         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
@@ -1799,6 +1810,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(sb_scope, dev);
     }
+#endif
 
     aml_append(dsdt, sb_scope);
 
@@ -1828,6 +1840,7 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
                  "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
 }
 
+#ifdef CONFIG_TPM
 static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                const char *oem_id, const char *oem_table_id)
@@ -1854,6 +1867,7 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                  (void *)(table_data->data + tcpa_start),
                  "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
 }
+#endif
 
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
@@ -2403,6 +2417,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         build_hpet(tables_blob, tables->linker, x86ms->oem_id,
                    x86ms->oem_table_id);
     }
+#ifdef CONFIG_TPM
     if (misc.tpm_version != TPM_VERSION_UNSPEC) {
         if (misc.tpm_version == TPM_VERSION_1_2) {
             acpi_add_table(table_offsets, tables_blob);
@@ -2414,6 +2429,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                        x86ms->oem_id, x86ms->oem_table_id);
         }
     }
+#endif
     if (pcms->numa_nodes) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, machine);
@@ -2605,8 +2621,10 @@ void acpi_setup(void)
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
     Object *vmgenid_dev;
+#ifdef CONFIG_TPM
     TPMIf *tpm;
     static FwCfgTPMConfig tpm_config;
+#endif
 
     if (!x86ms->fw_cfg) {
         ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
@@ -2638,6 +2656,7 @@ void acpi_setup(void)
         acpi_add_rom_blob(acpi_build_update, build_state,
                           tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE);
 
+#ifdef CONFIG_TPM
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
 
@@ -2651,6 +2670,7 @@ void acpi_setup(void)
         fw_cfg_add_file(x86ms->fw_cfg, "etc/tpm/config",
                         &tpm_config, sizeof tpm_config);
     }
+#endif
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
diff --git a/stubs/tpm.c b/stubs/tpm.c
index 9bded191d9d..22014595a06 100644
--- a/stubs/tpm.c
+++ b/stubs/tpm.c
@@ -33,7 +33,3 @@ TpmModelList *qmp_query_tpm_models(Error **errp)
 {
     return NULL;
 }
-
-void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev)
-{
-}
-- 
2.31.1


