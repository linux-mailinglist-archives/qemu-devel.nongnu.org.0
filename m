Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFAC322C3C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:29:34 +0100 (CET)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYgv-00057U-Ka
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEYfo-0003qg-5V
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:28:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEYfm-0001pr-72
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614090501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rhfEJwcbwKGlYfL6nuLnR+dZL+P+qS9iOWHwe+paXs=;
 b=Ai1fFgPca4o/NtyWMLn8Ni/nb46g5K+wYWEktf8nrm72lN3akjjg0KC/3TQtz97uutFECs
 gq88csSov2L4fX96AOgqVvFXp4wVIMXKKode4Kd+Wa06ALP0uIdb4ko5JkAFjkhP9++RFQ
 JmT3MfRWsCfhwdRt/hTYm8fbCjmUkFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-XYdSYSW0OQWAknevNFGe9Q-1; Tue, 23 Feb 2021 09:27:46 -0500
X-MC-Unique: XYdSYSW0OQWAknevNFGe9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BA77186DD37;
 Tue, 23 Feb 2021 14:26:28 +0000 (UTC)
Received: from localhost (unknown [10.40.208.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD6DF6F131;
 Tue, 23 Feb 2021 14:26:21 +0000 (UTC)
Date: Tue, 23 Feb 2021 15:26:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v5 07/10] hw/i386: declare ACPI mother board resource
 for MMCONFIG region
Message-ID: <20210223152620.2189f7f5@redhat.com>
In-Reply-To: <6f686b45ce7bc43048c56dbb46e72e1fe51927e6.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
 <6f686b45ce7bc43048c56dbb46e72e1fe51927e6.1613615732.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: isaku.yamahata@intel.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Feb 2021 21:51:15 -0800
isaku.yamahata@gmail.com wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Declare PNP0C01 device to reserve MMCONFIG region to conform to the
> spec better and play nice with guest BIOSes/OSes.
> 
> According to PCI Firmware Specification[0], MMCONFIG region must be
> reserved by declaring a motherboard resource. It's optional to reserve
> the region in memory map by Int 15 E820h or EFIGetMemoryMap.
> Guest Linux checks if the MMCFG region is reserved by bios memory map
> or ACPI resource. If it's not reserved, Linux falls back to legacy PCI
> configuration access.
> 
> TDVF [1] [2] doesn't reserve MMCONFIG the region in memory map.
> On the other hand OVMF reserves it in memory map without declaring a
> motherboard resource. With memory map reservation, linux guest uses
> MMCONFIG region. However it doesn't comply to PCI Firmware
> specification.
> 
> [0] PCI Firmware specification Revision 3.2
>   4.1.2 MCFG Table Description table 4-2 NOTE 2
>   If the operating system does not natively comprehend reserving the
>   MMCFG region, The MMCFG region must e reserved by firmware. ...
>   For most systems, the mortheroard resource would appear at the root
>   of the ACPI namespace (under \_SB)...
>   The resource can optionally be returned in Int15 E820h or
>   EFIGetMemoryMap as reserved memory but must always be reported
>   through ACPI as a motherboard resource
> 
> [1] TDX: Intel Trust Domain Extension
>     https://software.intel.com/content/www/us/en/develop/articles/intel-trust-domain-extensions.html
> [2] TDX Virtual Firmware
>     https://github.com/tianocore/edk2-staging/tree/TDVF
> 
> The change to DSDT is as follows.
> @@ -68,32 +68,47 @@
> 
>                      If ((CDW3 != Local0))
>                      {
>                          CDW1 |= 0x10
>                      }
> 
>                      CDW3 = Local0
>                  }
>                  Else
>                  {
>                      CDW1 |= 0x04
>                  }
> 
>                  Return (Arg3)
>              }
>          }
> +
> +        Device (DRAC)
> +        {
> +            Name (_HID, "PNP0C01" /* System Board */)  // _HID: Hardware ID
> +            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> +            {
> +                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
> +                    0x00000000,         // Granularity
> +                    0xB0000000,         // Range Minimum
> +                    0xBFFFFFFF,         // Range Maximum
> +                    0x00000000,         // Translation Offset
> +                    0x10000000,         // Length
> +                    ,, , AddressRangeMemory, TypeStatic)
> +            })
> +        }
>      }
> 
>      Scope (_SB)
>      {
>          Device (HPET)
>          {
>              Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
>              Name (_UID, Zero)  // _UID: Unique ID
>              OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
>              Field (HPTM, DWordAcc, Lock, Preserve)
>              {
>                  VEND,   32,
>                  PRD,    32
>              }
> 
>              Method (_STA, 0, NotSerialized)  // _STA: Status
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 46 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 49aef4ebd1..96497475d1 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1072,6 +1072,46 @@ static void build_q35_pci0_int(Aml *table)
>      aml_append(table, sb_scope);
>  }
>  
> +static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
> +{
> +    Aml *dev;
> +    Aml *resource_template;
> +
> +    /* DRAM controller */
> +    dev = aml_device("DRAC");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
> +
> +    resource_template = aml_resource_template();
> +    if (mcfg->base + mcfg->size - 1 >= (1ULL << 32)) {
> +        aml_append(resource_template,
> +                   aml_qword_memory(AML_POS_DECODE,
> +                                    AML_MIN_FIXED,
> +                                    AML_MAX_FIXED,
> +                                    AML_NON_CACHEABLE,
> +                                    AML_READ_WRITE,
> +                                    0x0000000000000000,
> +                                    mcfg->base,
> +                                    mcfg->base + mcfg->size - 1,
> +                                    0x0000000000000000,
> +                                    mcfg->size));
> +    } else {
> +        aml_append(resource_template,
> +                   aml_dword_memory(AML_POS_DECODE,
> +                                    AML_MIN_FIXED,
> +                                    AML_MAX_FIXED,
> +                                    AML_NON_CACHEABLE,
> +                                    AML_READ_WRITE,
> +                                    0x0000000000000000,
> +                                    mcfg->base,
> +                                    mcfg->base + mcfg->size - 1,
> +                                    0x0000000000000000,
> +                                    mcfg->size));
> +    }
> +    aml_append(dev, aml_name_decl("_CRS", resource_template));
> +
> +    return dev;
> +}
> +
>  static void build_q35_isa_bridge(Aml *table)
>  {
>      Aml *dev;
> @@ -1218,6 +1258,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
>      X86MachineState *x86ms = X86_MACHINE(machine);
>      AcpiMcfgInfo mcfg;
> +    bool mcfg_valid = !!acpi_get_mcfg(&mcfg);
>      uint32_t nr_mem = machine->ram_slots;
>      int root_bus_limit = 0xFF;
>      PCIBus *bus = NULL;
> @@ -1256,6 +1297,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>          aml_append(dev, build_q35_osc_method());
>          aml_append(sb_scope, dev);
> +        if (mcfg_valid) {
> +            aml_append(sb_scope, build_q35_dram_controller(&mcfg));
> +        }
>  
>          if (pm->smi_on_cpuhp) {
>              /* reserve SMI block resources, IO ports 0xB2, 0xB3 */
> @@ -1386,7 +1430,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>       * the PCI0._CRS.  Add mmconfig to the set so it will be excluded
>       * too.
>       */
> -    if (acpi_get_mcfg(&mcfg)) {
> +    if (mcfg_valid) {
>          crs_range_insert(crs_range_set.mem_ranges,
>                           mcfg.base, mcfg.base + mcfg.size - 1);
>      }


