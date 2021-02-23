Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6CA322E79
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:13:27 +0100 (CET)
Received: from localhost ([::1]:48694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaJN-0006on-N7
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaFB-0002qK-Fi
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaF8-0005rS-PE
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fxm1hlZ2PuTMxQprkqYrwHIEiC9hf+P1GMEbTuMEdZ0=;
 b=J2GFlonoeecS0Q5opn40VOG4VkZFO57qVxZdPPk/TDbMkCF/c42QxCtVzaXjKlKBzDCgai
 9K7zlCeiViw8gXw1Z4EHe8bRc0pBd4riDwleZglDL/nzbPbVPMcUe2U1GlnjZi0Ksm/dbr
 96YfZdnKfIVI1voXXcXBs26X8ca+5rI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-2RleMa8dMDKn5CUU_xsHXw-1; Tue, 23 Feb 2021 11:04:20 -0500
X-MC-Unique: 2RleMa8dMDKn5CUU_xsHXw-1
Received: by mail-wm1-f72.google.com with SMTP id r21so821034wmq.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fxm1hlZ2PuTMxQprkqYrwHIEiC9hf+P1GMEbTuMEdZ0=;
 b=huGiT1+2OM1k91ea6tJQO8Jh7WKK5pWF0n1krANvGEeeMW3VFGG8bheFeR1U6neZiZ
 pL6iT4Vm2yOvZrAVWny8hnh7TKjVN4sgjqPdXqs/9tbBqUHREf+5Ky1AJ6zk3hDFDMTb
 WL+VAfXdDHUQMJQQW6cUiaH99humqX3Ar6Hbg9gAyCVYmdWx5P2JgGL2nWn3onMPI/Yg
 ka2RNdWG/p+9zMPgbQqwD5/vUE+lHSZVsahgqJRPd49wdrEua5BrqtA3l3Uuf4h+ohZD
 D0K9KI5zFdwM7rlVYR3bcz3CfVV4DfDMFKNK41hDIQ3tSNa2AiE1K4epyCd8cv1D3m9f
 iX4A==
X-Gm-Message-State: AOAM531XmeKssK2m+/XNQjyx89nWppcHm34NBmf01CEBoN+HpfRXrrfe
 GcojvyPjaV/yIXuaDG/mp6zI1A7nLj9ToO2jB7LmTL8UNQOyE5y4MDLRE6T+bPrG4TBMJ+jahGd
 xyoEiZunLXaqQy/a0iPL+ZjdFt/3bljeajuppQ7uaYDjsOnyRpaUwYc1WaOfo
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr25990839wrf.424.1614096257306; 
 Tue, 23 Feb 2021 08:04:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyc3nD5iIdwFiIo0TnFcYJqo3PDubwEY4Bg3S+113+HqZ6RUZiR634GMulkcSEBUWzh/xKejw==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr25990816wrf.424.1614096257096; 
 Tue, 23 Feb 2021 08:04:17 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id y1sm32548008wrr.41.2021.02.23.08.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:04:16 -0800 (PST)
Date: Tue, 23 Feb 2021 11:04:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/17] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210223160144.1507082-15-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Declare PNP0C01 device to reserve MMCONFIG region to conform to the
spec better and play nice with guest BIOSes/OSes.

According to PCI Firmware Specification[0], MMCONFIG region must be
reserved by declaring a motherboard resource. It's optional to reserve
the region in memory map by Int 15 E820h or EFIGetMemoryMap.
Guest Linux checks if the MMCFG region is reserved by bios memory map
or ACPI resource. If it's not reserved, Linux falls back to legacy PCI
configuration access.

TDVF [1] [2] doesn't reserve MMCONFIG the region in memory map.
On the other hand OVMF reserves it in memory map without declaring a
motherboard resource. With memory map reservation, linux guest uses
MMCONFIG region. However it doesn't comply to PCI Firmware
specification.

[0] PCI Firmware specification Revision 3.2
  4.1.2 MCFG Table Description table 4-2 NOTE 2
  If the operating system does not natively comprehend reserving the
  MMCFG region, The MMCFG region must e reserved by firmware. ...
  For most systems, the mortheroard resource would appear at the root
  of the ACPI namespace (under \_SB)...
  The resource can optionally be returned in Int15 E820h or
  EFIGetMemoryMap as reserved memory but must always be reported
  through ACPI as a motherboard resource

[1] TDX: Intel Trust Domain Extension
    https://software.intel.com/content/www/us/en/develop/articles/intel-trust-domain-extensions.html
[2] TDX Virtual Firmware
    https://github.com/tianocore/edk2-staging/tree/TDVF

The change to DSDT is as follows.
@@ -68,32 +68,47 @@

                     If ((CDW3 != Local0))
                     {
                         CDW1 |= 0x10
                     }

                     CDW3 = Local0
                 }
                 Else
                 {
                     CDW1 |= 0x04
                 }

                 Return (Arg3)
             }
         }
+
+        Device (DRAC)
+        {
+            Name (_HID, "PNP0C01" /* System Board */)  // _HID: Hardware ID
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
+                    0x00000000,         // Granularity
+                    0xB0000000,         // Range Minimum
+                    0xBFFFFFFF,         // Range Maximum
+                    0x00000000,         // Translation Offset
+                    0x10000000,         // Length
+                    ,, , AddressRangeMemory, TypeStatic)
+            })
+        }
     }

     Scope (_SB)
     {
         Device (HPET)
         {
             Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
             Name (_UID, Zero)  // _UID: Unique ID
             OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
             Field (HPTM, DWordAcc, Lock, Preserve)
             {
                 VEND,   32,
                 PRD,    32
             }

             Method (_STA, 0, NotSerialized)  // _STA: Status

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <6f686b45ce7bc43048c56dbb46e72e1fe51927e6.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 46 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 49aef4ebd1..96497475d1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1072,6 +1072,46 @@ static void build_q35_pci0_int(Aml *table)
     aml_append(table, sb_scope);
 }
 
+static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
+{
+    Aml *dev;
+    Aml *resource_template;
+
+    /* DRAM controller */
+    dev = aml_device("DRAC");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
+
+    resource_template = aml_resource_template();
+    if (mcfg->base + mcfg->size - 1 >= (1ULL << 32)) {
+        aml_append(resource_template,
+                   aml_qword_memory(AML_POS_DECODE,
+                                    AML_MIN_FIXED,
+                                    AML_MAX_FIXED,
+                                    AML_NON_CACHEABLE,
+                                    AML_READ_WRITE,
+                                    0x0000000000000000,
+                                    mcfg->base,
+                                    mcfg->base + mcfg->size - 1,
+                                    0x0000000000000000,
+                                    mcfg->size));
+    } else {
+        aml_append(resource_template,
+                   aml_dword_memory(AML_POS_DECODE,
+                                    AML_MIN_FIXED,
+                                    AML_MAX_FIXED,
+                                    AML_NON_CACHEABLE,
+                                    AML_READ_WRITE,
+                                    0x0000000000000000,
+                                    mcfg->base,
+                                    mcfg->base + mcfg->size - 1,
+                                    0x0000000000000000,
+                                    mcfg->size));
+    }
+    aml_append(dev, aml_name_decl("_CRS", resource_template));
+
+    return dev;
+}
+
 static void build_q35_isa_bridge(Aml *table)
 {
     Aml *dev;
@@ -1218,6 +1258,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
     AcpiMcfgInfo mcfg;
+    bool mcfg_valid = !!acpi_get_mcfg(&mcfg);
     uint32_t nr_mem = machine->ram_slots;
     int root_bus_limit = 0xFF;
     PCIBus *bus = NULL;
@@ -1256,6 +1297,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_UID", aml_int(0)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
+        if (mcfg_valid) {
+            aml_append(sb_scope, build_q35_dram_controller(&mcfg));
+        }
 
         if (pm->smi_on_cpuhp) {
             /* reserve SMI block resources, IO ports 0xB2, 0xB3 */
@@ -1386,7 +1430,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
      * the PCI0._CRS.  Add mmconfig to the set so it will be excluded
      * too.
      */
-    if (acpi_get_mcfg(&mcfg)) {
+    if (mcfg_valid) {
         crs_range_insert(crs_range_set.mem_ranges,
                          mcfg.base, mcfg.base + mcfg.size - 1);
     }
-- 
MST


