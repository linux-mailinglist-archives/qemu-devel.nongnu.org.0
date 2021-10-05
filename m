Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBB9422E2C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:41:30 +0200 (CEST)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnVR-0000La-AY
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuv-0001uJ-2X
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuq-0006iK-51
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALs3jGGOQlHPAzn+Qwvy3twsZGp1E3tRIkmyfM0wCks=;
 b=dGd0Yj03/larKYKKGSlWaExTJpkD3JK63plicfYgrr+liDJpYVXGQIJIK5rWCjnlEddxG3
 2JS0lJLLXOownIPSs/b2zYH8sTp19A6emAvycEfLp0Ums/7xfGij6ZVzPD1IgSBUYDMgtW
 MsLIQSkoqTTRjQo6iFzLXpKSUI99HPc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-F-VkFqMrPEaFMupD3Ph6Sw-1; Tue, 05 Oct 2021 12:03:37 -0400
X-MC-Unique: F-VkFqMrPEaFMupD3Ph6Sw-1
Received: by mail-wr1-f70.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so195195wrr.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ALs3jGGOQlHPAzn+Qwvy3twsZGp1E3tRIkmyfM0wCks=;
 b=qWNd9h5zNyE6ZksRSbdFqO8h0ZWDlca+idTJRCj3UgCPjiRlyBDOaTpIS4NIJSlLls
 f0DEPx0NMNMTHO9fl7F5yk3Lrea6sxyefkuZ30U9w6aPIhAsY7tfuKbSk02Hfb4Di/1D
 vB95CTEJbFl1PaNmVh/+D9m/+WyWFWT5n56vGhfPj2MSFkJosLsPk5C7TRfTzQEDE8SQ
 kDtY60YWV7G4+EcnbYB8YP+lOkz3ZDU5Clt6Gsq9MRGxRNne+oGYdNXzE39H/NItJUch
 QeuojjB5xuTNL7NaTKkCVh6+aEoWjhmyPz9o3McvLwJ+AiOiJX54mNzqtCNEJHIiAcM7
 gx5w==
X-Gm-Message-State: AOAM531NILXiHVgLjxt1le7q0Lxpc7ivqkO2099+jRr6MV4CamZdLws0
 zcGrxHTJ9IZxpkXcUyQ+PkYlqwA1ePq4unfWBz8X+GKcqAjTLvtP+bM7znMhEQL5QtPMAD/eMgd
 gdYs3G+rSBZLZGwEENkJwSyBi3cY4riqN1jG+jr2LTeCkPYwl+WOR+bmDavc0
X-Received: by 2002:a05:600c:1553:: with SMTP id
 f19mr4382213wmg.66.1633449815863; 
 Tue, 05 Oct 2021 09:03:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy28zU+S4Owa4IGmD5UpyyO5TkHmvOeXzUhMyCZjjkOGwqo/TRk1Tn8Abg2/94LEBl7wRcnag==
X-Received: by 2002:a05:600c:1553:: with SMTP id
 f19mr4382162wmg.66.1633449815519; 
 Tue, 05 Oct 2021 09:03:35 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id c7sm3145881wmq.13.2021.10.05.09.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:34 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/57] acpi: x86: set enabled when composing _MAT entries
Message-ID: <20211005155946.513818-38-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Instead of composing disabled _MAT entry and then later on
patching it to enabled for hotpluggbale CPUs in DSDT,
set it to enabled at the time _MAT entry is built.

It will allow to drop usage of packed structures in
following patches when build_madt() is switched to use
build_append_int_noprefix() API.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-24-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi_dev_interface.h |  3 ++-
 include/hw/i386/pc.h                 |  6 +++---
 hw/acpi/acpi-x86-stub.c              |  3 ++-
 hw/acpi/cpu.c                        | 17 ++---------------
 hw/i386/acpi-common.c                | 18 ++++++------------
 5 files changed, 15 insertions(+), 32 deletions(-)

diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 769ff55c7e..ea6056ab92 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -53,6 +53,7 @@ struct AcpiDeviceIfClass {
     void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
     void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
     void (*madt_cpu)(AcpiDeviceIf *adev, int uid,
-                     const CPUArchIdList *apic_ids, GArray *entry);
+                     const CPUArchIdList *apic_ids, GArray *entry,
+                     bool force_enabled);
 };
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 5748d7c55f..11426e26dc 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -190,10 +190,10 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len);
 void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 
-
-/* acpi-build.c */
+/* hw/i386/acpi-common.c */
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry);
+                       const CPUArchIdList *apic_ids, GArray *entry,
+                       bool force_enabled);
 
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
index e9e46c5c5f..3df1e090f4 100644
--- a/hw/acpi/acpi-x86-stub.c
+++ b/hw/acpi/acpi-x86-stub.c
@@ -3,7 +3,8 @@
 #include "hw/i386/acpi-build.h"
 
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry)
+                       const CPUArchIdList *apic_ids, GArray *entry,
+                       bool force_enabled)
 {
 }
 
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index f82e9512fd..b20903ea30 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -669,21 +669,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
             /* build _MAT object */
             assert(adevc && adevc->madt_cpu);
-            adevc->madt_cpu(adev, i, arch_ids, madt_buf);
-            switch (madt_buf->data[0]) {
-            case ACPI_APIC_PROCESSOR: {
-                AcpiMadtProcessorApic *apic = (void *)madt_buf->data;
-                apic->flags = cpu_to_le32(1);
-                break;
-            }
-            case ACPI_APIC_LOCAL_X2APIC: {
-                AcpiMadtProcessorX2Apic *apic = (void *)madt_buf->data;
-                apic->flags = cpu_to_le32(1);
-                break;
-            }
-            default:
-                assert(0);
-            }
+            adevc->madt_cpu(adev, i, arch_ids, madt_buf,
+                            true); /* set enabled flag */
             aml_append(dev, aml_name_decl("_MAT",
                 aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
             g_array_free(madt_buf, true);
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index a0cde1d874..7983a13a93 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -34,9 +34,11 @@
 #include "acpi-common.h"
 
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry)
+                       const CPUArchIdList *apic_ids, GArray *entry,
+                       bool force_enabled)
 {
     uint32_t apic_id = apic_ids->cpus[uid].arch_id;
+    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ? 1 : 0;
 
     /* ACPI spec says that LAPIC entry for non present
      * CPU may be omitted from MADT or it must be marked
@@ -51,11 +53,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
         apic->length = sizeof(*apic);
         apic->processor_id = uid;
         apic->local_apic_id = apic_id;
-        if (apic_ids->cpus[uid].cpu != NULL) {
-            apic->flags = cpu_to_le32(1);
-        } else {
-            apic->flags = cpu_to_le32(0);
-        }
+        apic->flags = cpu_to_le32(flags);
     } else {
         AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
 
@@ -63,11 +61,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
         apic->length = sizeof(*apic);
         apic->uid = cpu_to_le32(uid);
         apic->x2apic_id = cpu_to_le32(apic_id);
-        if (apic_ids->cpus[uid].cpu != NULL) {
-            apic->flags = cpu_to_le32(1);
-        } else {
-            apic->flags = cpu_to_le32(0);
-        }
+        apic->flags = cpu_to_le32(flags);
     }
 }
 
@@ -96,7 +90,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
     for (i = 0; i < apic_ids->len; i++) {
-        adevc->madt_cpu(adev, i, apic_ids, table_data);
+        adevc->madt_cpu(adev, i, apic_ids, table_data, false);
         if (apic_ids->cpus[i].arch_id > 254) {
             x2apic_mode = true;
         }
-- 
MST


