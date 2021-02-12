Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948231A1F2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:44:53 +0100 (CET)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAacm-0004QA-Bc
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAaZ9-0007QO-Q4
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:41:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAaYt-0003FS-5F
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613144450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSiNPcrVrh11h86HGp2g3ak/867Q4vUoPBqMR1ydx4w=;
 b=EbWzkIw/XDb0bOYEs/JQXaA4KFJ4CSt7XVEkz55xgiyp4dh9+Cf947UKHrIfOwW5zw/mRE
 Nott55NYnz9RC+qbu/7t/XGWHqJM9ziOiN1u7CrbPy23wGFE4MeCqRomli1sjDGEsXwh8E
 F9nDn62nYA9py+EDazAsE/YUBA6de3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-1gID8DVKOKu04PWSGv0WPw-1; Fri, 12 Feb 2021 10:40:47 -0500
X-MC-Unique: 1gID8DVKOKu04PWSGv0WPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB59801962;
 Fri, 12 Feb 2021 15:40:46 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 420965D6AB;
 Fri, 12 Feb 2021 15:40:40 +0000 (UTC)
Date: Fri, 12 Feb 2021 16:40:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Subject: Re: [PATCH v3 07/10] hw/i386: declare ACPI mother board resource
 for MMCONFIG region
Message-ID: <20210212164038.207e0f54@redhat.com>
In-Reply-To: <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
 <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 22:46:43 -0800
Isaku Yamahata <isaku.yamahata@intel.com> wrote:

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
> @@ -68,32 +68,51 @@
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
> +            Name (RBUF, ResourceTemplate ()
> +            {
> +                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
> +                    0x0000000000000000, // Granularity
> +                    0x00000000B0000000, // Range Minimum
> +                    0x00000000BFFFFFFF, // Range Maximum
> +                    0x0000000000000000, // Translation Offset
> +                    0x0000000010000000, // Length
> +                    ,, , AddressRangeMemory, TypeStatic)
> +            })
> +            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
> +            {
> +                Return (RBUF) /* \_SB_.DRAC.RBUF */
> +            }
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
> ---
>  hw/i386/acpi-build.c | 46 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 00cc119362..e369908b1a 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1072,6 +1072,46 @@ static void build_q35_pci0_int(Aml *table)
>      aml_append(table, sb_scope);
>  }
>  
> +static Aml *build_q35_dram_controller(void)
> +{
> +    AcpiMcfgInfo mcfg;
build_dsdt() already calls acpi_get_mcfg(),
I suggest to cache it there and pass to build_q35_dram_controller
as an argument.

> +    Aml *dev;
> +    Aml *rbuf;
> +    Aml *resource_template;
> +    Aml *rbuf_name;
> +    Aml *crs;
> +
> +    if (!acpi_get_mcfg(&mcfg)) {
> +        return NULL;
> +    }
> +
> +    /* DRAM controller */
> +    dev = aml_device("DRAC");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
> +
> +    resource_template = aml_resource_template();
> +    aml_append(resource_template,
> +               aml_qword_memory(AML_POS_DECODE,
> +                                AML_MIN_FIXED,
> +                                AML_MAX_FIXED,
> +                                AML_NON_CACHEABLE,
> +                                AML_READ_WRITE,
> +                                0x0000000000000000,
> +                                mcfg.base,
> +                                mcfg.base + mcfg.size - 1,
s/mcfg.base + mcfg.size - 1/mcfg.base/

> +                                0x0000000000000000,
> +                                mcfg.size));
> +    rbuf = aml_name_decl("RBUF", resource_template);
> +    aml_append(dev, rbuf);
> +
> +    crs = aml_method("_CRS", 0, AML_SERIALIZED);
> +    rbuf_name = aml_name("RBUF");
> +    aml_append(crs, aml_return(rbuf_name));
> +    aml_append(dev, crs);
> +
> +    return dev;
> +}
> +
>  static void build_q35_isa_bridge(Aml *table)
>  {
>      Aml *dev;
> @@ -1212,7 +1252,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
>  {
>      CrsRangeEntry *entry;
> -    Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
> +    Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs, *drac;
maybe limit drac to
  if (misc->is_piix4) { 
  ... } else {
     Aml *drac
scope

>      CrsRangeSet crs_range_set;
>      PCMachineState *pcms = PC_MACHINE(machine);
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
> @@ -1256,6 +1296,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>          aml_append(dev, build_q35_osc_method());
>          aml_append(sb_scope, dev);
> +        drac = build_q35_dram_controller();
> +        if (drac) {
> +            aml_append(sb_scope, drac);
> +        }
mmcfg isn't optional for q35, is it?
I'd simplify to:
    aml_append(sb_scope, build_q35_dram_controller(mmcfg_info));
or put all of it under condition if it's optional
   if(foo) aml_append(sb_scope, build_q35_dram_controller(mmcfg_info))
 
>          if (pm->smi_on_cpuhp) {
>              /* reserve SMI block resources, IO ports 0xB2, 0xB3 */


