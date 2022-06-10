Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDFA546080
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:52:06 +0200 (CEST)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaNB-0003Yh-1t
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZY8-00025l-VB
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZY6-0006Pn-IM
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G4auDEbzNLl1MzZt76eehS9c+16DhBQgGfHApQUoen0=;
 b=WJFhN8YH0kX13uIyn70rZMW/Kb4vUyfwbdAnD9f9M0xUbIUE5Gi/wPVYPMb56MWar6eL7R
 74nSy2A7KcnCFIJXBKwFd5CcfPXh7eoJDrrNwJOlMhjgfn8VZjvYWUDikDJuR0vxjZJv7g
 7dKQ2Omuv3h5/w7swirHxKn7E6rO3P4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-WYfoQdiVMUW97c3z4_on_Q-1; Fri, 10 Jun 2022 03:59:11 -0400
X-MC-Unique: WYfoQdiVMUW97c3z4_on_Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 ay4-20020a5d6f04000000b002183e363f9bso3820524wrb.22
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G4auDEbzNLl1MzZt76eehS9c+16DhBQgGfHApQUoen0=;
 b=O4byXBK50fkwad8h/8ffVUvFIPpnget6St3clTASE5Oqns2Usq1hWp96LM6DMst7An
 evoBHPBFbIZMBuwX45iIih3Qd9Sj09uZEr9/lGOigHvXzFFrQdJs16FaFaW5jzfI410H
 +QCQCOAscrJ6sp5aKtY89qhKBdHgRoHx6PRG1t9LQlkxp56RowZVk9rm6aUGSAOUdioI
 DHMoTwzEMIhyOFlQ9M9NvJu7CTpNP36izOF9vWcNYPzo1dPAIqOCaWD9+hgga2nwtw+6
 5G3hGYhja/1DAONtmf2KssLP++TXPb0GZ1d33ir3+vksg5ST6xE5bOKhVMbkxAqlqbfv
 wL+g==
X-Gm-Message-State: AOAM533ZhtcL56WeAEsQR0WOeEIQVNdGTYQUcR3TgzmD/NNfvni5+Ffz
 pckdLUCHjX3tfaZDkGtbfjo0wxaRPQE+fm7ZJ2qyIqmtA4YcPnEynq36mZ05V70uls0g9A7i7Lf
 CzodlT73yRmVsjmJiYmclzM2da0+ZA4iUJnV99riZeU7/mcObuvwQHeh4X71e
X-Received: by 2002:adf:e2cb:0:b0:20c:c1bb:9fcb with SMTP id
 d11-20020adfe2cb000000b0020cc1bb9fcbmr43925509wrj.35.1654847949669; 
 Fri, 10 Jun 2022 00:59:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKbFXJR1a5MWJit6J5Uw74QaqXruR3FHn8lBgHM7/DIl+3A6X6xVl3+DVZlFtZzFJK3aD+dw==
X-Received: by 2002:adf:e2cb:0:b0:20c:c1bb:9fcb with SMTP id
 d11-20020adfe2cb000000b0020cc1bb9fcbmr43925476wrj.35.1654847949314; 
 Fri, 10 Jun 2022 00:59:09 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b0039c6ce32a2dsm2151359wmq.33.2022.06.10.00.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:08 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 42/54] hw/cxl: Move the CXLState from MachineState to machine
 type specific state.
Message-ID: <20220610075631.367501-43-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This removes the last of the CXL code from the MachineState where it
is visible to all Machines to only those that support CXL (currently i386/pc)
As i386/pc always support CXL now, stop allocating the state independently.

Note the pxb register hookup code runs even if cxl=off in order to detect
pxb_cxl host bridges and fail to start if any are present as they won't
have the control registers available.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
Message-Id: <20220608145440.26106-8-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/boards.h  |  1 -
 include/hw/i386/pc.h |  2 ++
 hw/core/machine.c    |  6 ------
 hw/i386/acpi-build.c |  6 +++---
 hw/i386/pc.c         | 33 ++++++++++++++++-----------------
 5 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index dd9fc56df2..031f5f884d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -360,7 +360,6 @@ struct MachineState {
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
     struct NVDIMMState *nvdimms_state;
-    struct CXLState *cxl_devices_state;
     struct NumaState *numa_state;
     CXLFixedMemoryWindowOptionsList *cfmws_list;
 };
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index dee38cfac4..003a86b721 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "hw/i386/sgx-epc.h"
 #include "hw/firmware/smbios.h"
+#include "hw/cxl/cxl.h"
 
 #define HPET_INTCAP "hpet-intcap"
 
@@ -55,6 +56,7 @@ typedef struct PCMachineState {
     hwaddr memhp_io_base;
 
     SGXEPCState sgx_epc;
+    CXLState cxl_devices_state;
 } PCMachineState;
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2e589d99e9..a673302cce 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -33,7 +33,6 @@
 #include "sysemu/qtest.h"
 #include "hw/pci/pci.h"
 #include "hw/mem/nvdimm.h"
-#include "hw/cxl/cxl.h"
 #include "migration/global_state.h"
 #include "migration/vmstate.h"
 #include "exec/confidential-guest-support.h"
@@ -1075,10 +1074,6 @@ static void machine_initfn(Object *obj)
                                         "Valid values are cpu, mem-ctrl");
     }
 
-    if (mc->cxl_supported) {
-        ms->cxl_devices_state = g_new0(CXLState, 1);
-    }
-
     if (mc->cpu_index_to_instance_props && mc->get_default_cpu_node_id) {
         ms->numa_state = g_new0(NumaState, 1);
         object_property_add_bool(obj, "hmat",
@@ -1116,7 +1111,6 @@ static void machine_finalize(Object *obj)
     g_free(ms->device_memory);
     g_free(ms->nvdimms_state);
     g_free(ms->numa_state);
-    g_free(ms->cxl_devices_state);
 }
 
 bool machine_usb(MachineState *machine)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 663c34b9d1..73d0bf5937 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1631,7 +1631,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
             /* Handle the ranges for the PXB expanders */
             if (pci_bus_is_cxl(bus)) {
-                MemoryRegion *mr = &machine->cxl_devices_state->host_mr;
+                MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
                 uint64_t base = mr->addr;
 
                 cxl_present = true;
@@ -2614,9 +2614,9 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                           machine->nvdimms_state, machine->ram_slots,
                           x86ms->oem_id, x86ms->oem_table_id);
     }
-    if (machine->cxl_devices_state->is_enabled) {
+    if (pcms->cxl_devices_state.is_enabled) {
         cxl_build_cedt(table_offsets, tables_blob, tables->linker,
-                       x86ms->oem_id, x86ms->oem_table_id, machine->cxl_devices_state);
+                       x86ms->oem_id, x86ms->oem_table_id, &pcms->cxl_devices_state);
     }
 
     acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9f48d02739..a0c0d69698 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -733,12 +733,12 @@ void pc_machine_done(Notifier *notifier, void *data)
     PCMachineState *pcms = container_of(notifier,
                                         PCMachineState, machine_done);
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    MachineState *ms = MACHINE(pcms);
 
-    if (ms->cxl_devices_state) {
-        cxl_hook_up_pxb_registers(pcms->bus, ms->cxl_devices_state,
-                                  &error_fatal);
-        cxl_fmws_link_targets(ms->cxl_devices_state, &error_fatal);
+    cxl_hook_up_pxb_registers(pcms->bus, &pcms->cxl_devices_state,
+                              &error_fatal);
+
+    if (pcms->cxl_devices_state.is_enabled) {
+        cxl_fmws_link_targets(&pcms->cxl_devices_state, &error_fatal);
     }
 
     /* set the number of CPUs */
@@ -908,8 +908,8 @@ void pc_memory_init(PCMachineState *pcms,
                                     &machine->device_memory->mr);
     }
 
-    if (machine->cxl_devices_state->is_enabled) {
-        MemoryRegion *mr = &machine->cxl_devices_state->host_mr;
+    if (pcms->cxl_devices_state.is_enabled) {
+        MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
         hwaddr cxl_size = MiB;
 
         if (pcmc->has_reserved_memory && machine->device_memory->base) {
@@ -927,12 +927,12 @@ void pc_memory_init(PCMachineState *pcms,
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
         cxl_resv_end = cxl_base + cxl_size;
-        if (machine->cxl_devices_state->fixed_windows) {
+        if (pcms->cxl_devices_state.fixed_windows) {
             hwaddr cxl_fmw_base;
             GList *it;
 
             cxl_fmw_base = ROUND_UP(cxl_base + cxl_size, 256 * MiB);
-            for (it = machine->cxl_devices_state->fixed_windows; it; it = it->next) {
+            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
                 CXLFixedWindow *fw = it->data;
 
                 fw->base = cxl_fmw_base;
@@ -974,7 +974,7 @@ void pc_memory_init(PCMachineState *pcms,
             res_mem_end += memory_region_size(&machine->device_memory->mr);
         }
 
-        if (machine->cxl_devices_state->is_enabled) {
+        if (pcms->cxl_devices_state.is_enabled) {
             res_mem_end = cxl_resv_end;
         }
         *val = cpu_to_le64(ROUND_UP(res_mem_end, 1 * GiB));
@@ -1010,12 +1010,12 @@ uint64_t pc_pci_hole64_start(void)
     X86MachineState *x86ms = X86_MACHINE(pcms);
     uint64_t hole64_start = 0;
 
-    if (ms->cxl_devices_state->host_mr.addr) {
-        hole64_start = ms->cxl_devices_state->host_mr.addr +
-            memory_region_size(&ms->cxl_devices_state->host_mr);
-        if (ms->cxl_devices_state->fixed_windows) {
+    if (pcms->cxl_devices_state.host_mr.addr) {
+        hole64_start = pcms->cxl_devices_state.host_mr.addr +
+            memory_region_size(&pcms->cxl_devices_state.host_mr);
+        if (pcms->cxl_devices_state.fixed_windows) {
             GList *it;
-            for (it = ms->cxl_devices_state->fixed_windows; it; it = it->next) {
+            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
                 CXLFixedWindow *fw = it->data;
                 hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
             }
@@ -1691,7 +1691,6 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
 static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
-    MachineState *ms = MACHINE(obj);
 
 #ifdef CONFIG_VMPORT
     pcms->vmport = ON_OFF_AUTO_AUTO;
@@ -1716,7 +1715,7 @@ static void pc_machine_initfn(Object *obj)
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
     object_property_add_alias(OBJECT(pcms), "pcspk-audiodev",
                               OBJECT(pcms->pcspk), "audiodev");
-    cxl_machine_init(obj, ms->cxl_devices_state);
+    cxl_machine_init(obj, &pcms->cxl_devices_state);
 }
 
 static void pc_machine_reset(MachineState *machine)
-- 
MST


