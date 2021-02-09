Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F1C31533A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:55:08 +0100 (CET)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VLy-0006Y2-1H
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9VKI-0005fw-VH
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:53:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9VKF-000689-8j
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612885993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rstFwjHenJwWObjlbqiwIoWs31oY1X6eTj6vVT9lLOQ=;
 b=dC9pGAAv1ExG0GwmY1ifFEASlzGGhdG7T/BV253lvS/0GCRK1CL2kcTsRB1dhMCklh+D25
 n6pKqY5vEL3F16CKTjGclY9KZ1uRojZRueXZPPQWgJbo6dI9ligHC+Df3KjwdLHd7Zee8O
 qr5i5oJ8NcqQ4tVy25RjihgUNsEEIxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-fIYYh7I2OYyPJP-w21-eMg-1; Tue, 09 Feb 2021 10:52:58 -0500
X-MC-Unique: fIYYh7I2OYyPJP-w21-eMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E319835E2D;
 Tue,  9 Feb 2021 15:52:57 +0000 (UTC)
Received: from localhost (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B7DB6267D;
 Tue,  9 Feb 2021 15:52:43 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:52:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v2 6/9] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210209165241.5ba1a953@redhat.com>
In-Reply-To: <ff52a5969a6666235745d7e067f5fb500a8c70fb.1612821109.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <ff52a5969a6666235745d7e067f5fb500a8c70fb.1612821109.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Feb 2021 13:57:25 -0800
isaku.yamahata@gmail.com wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Declare PNP0C01 device to reserve MMCONFIG region to conform to the
> spec better and play nice with guest BIOSes/OSes.
> 
> According to PCI Firmware Specification, MMCONFIG region must be
> reserved by declaring a motherboard resource.
could you point to concrete spec version/chapter where it stated.
(should be part of commit message)

> It's optional to reserve
> the region in memory map by Int 15 E820h or EFIGetMemoryMap.

> If guest BIOS doesn't reserve the region in memory map without the
> reservation by mother board resource, guest linux abandons to use
> MMCFG.
can parse this, can you rephrase and avoid double negation, please?

> TDVF [0] [1] doesn't reserve MMCONFIG the region in memory map.
> On the other hand OVMF reserves it in memory map without declaring a
> motherboard resource. With memory map reservation, linux guest uses
> MMCONFIG region. However it doesn't comply to PCI Firmware
> specification.
> 
> [0] TDX: Intel Trust Domain Extension
>     https://software.intel.com/content/www/us/en/develop/articles/intel-trust-domain-extensions.html
> [1] TDX Virtual Firmware
>     https://github.com/tianocore/edk2-staging/tree/TDVF
> 
> The change to DSDT is as follows.
> @@ -68,32 +68,90 @@
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
> +            OperationRegion (DRR0, PCI_Config, 0x60, 0x08)
> +            Field (DRR0, DWordAcc, NoLock, Preserve)
> +            {
> +                PEBL,   32,
> +                PEBH,   32
> +            }
> +
> +            Name (RBUF, ResourceTemplate ()
> +            {
> +                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
> +                    0x0000000000000000, // Granularity
> +                    0x0000000000000000, // Range Minimum
> +                    0x0000000000000000, // Range Maximum
> +                    0x0000000000000000, // Translation Offset
> +                    0x0000000000000000, // Length
> +                    ,, _Y00, AddressRangeMemory, TypeStatic)
> +            })
> +            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
> +            {
> +                CreateDWordField (RBUF, \_SB.DRAC._Y00._MIN, MINL)  // _MIN: Minimum Base Address
> +                CreateDWordField (RBUF, 0x12, MINH)
> +                CreateDWordField (RBUF, \_SB.DRAC._Y00._MAX, MAXL)  // _MAX: Maximum Base Address
> +                CreateDWordField (RBUF, 0x1A, MAXH)
> +                CreateQWordField (RBUF, \_SB.DRAC._Y00._LEN, _LEN)  // _LEN: Length
> +                Local0 = PEBL /* \_SB_.DRAC.PEBL */
> +                Local1 = (Local0 & One)
> +                Local2 = (Local0 & 0x06)
> +                Local3 = (Local0 & 0xFFFFFFF8)
> +                Local4 = PEBH /* \_SB_.DRAC.PEBH */
> +                If ((Local1 == One))
> +                {
> +                    MINL = Local3
> +                    MINH = Local4
> +                    MAXL = Local3
> +                    MAXH = Local4
> +                    If ((Local2 == Zero))
> +                    {
> +                        _LEN = 0x10000000
> +                    }
> +
> +                    If ((Local2 == 0x02))
> +                    {
> +                        _LEN = 0x08000000
> +                    }
> +
> +                    If ((Local2 == 0x04))
> +                    {
> +                        _LEN = 0x04000000
> +                    }
> +                }
> +
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
> Acked-by: Jiewen Yao <Jiewen.yao@intel.com>
> ---
>  hw/i386/acpi-build.c | 172 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 172 insertions(+)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index c2f11d95d8..bcb1f65c1d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1066,6 +1066,177 @@ static void build_q35_pci0_int(Aml *table)
>      aml_append(table, sb_scope);
>  }
>  
> +static Aml *build_q35_dram_controller(void)
> +{
> +    /*
> +     * DSDT is created with revision 1 which means 32bit integer.
version 1, is kept for Windows XP sake which is EOLed long ago,
and it even will boot with v2 as long as AML doesn't contain non v1
terms or those are hidden behind dynamic method which are not evaluated.
Perhaps we should bump dsdt revision to v2.
And anyways with this patch XP probably will trip over, if it tries to parse
64bit CRS, but we probably don't care about XP on q35.

> +     * When the method of _CRS is called to determine MMCONFIG region,
> +     * only port io is allowed to access PCI configuration space.
> +     * It means qword access isn't allowed.
> +     *
> +     * Device(DRAC)
> +     * {
> +     *     Name(_HID, EisaId("PNP0C01"))
> +     *     OperationRegion(DRR0, PCI_Config, 0x0000000000000060, 0x8)
> +     *     Field(DRR0, DWordAcc, Lock, Preserve)
> +     *     {
> +     *         PEBL, 4,
> +     *         PEBH, 4
> +     *     }

why are you trying to fetch it dynamically?
what prevents you from getting MMCONFIG address in QEMU when building
ACPI tables and encode _CRS statically at that time?


> +     *     Name(RBUF, ResourceTemplate()
> +     *     {
> +     *         QWordMemory(ResourceConsumer,
> +     *                     PosDecode,
> +     *                     MinFixed,
> +     *                     MaxFixed,
> +     *                     NonCacheable,
> +     *                     ReadWrite,
> +     *                     0x0000000000000000, // Granularity
> +     *                     0x0000000000000000, // Range Minimum
> +     *                     0x0000000000000000, // Range Maxium
> +     *                     0x0000000000000000, // Translation Offset,
> +     *                     0x0000000000000000, // Length,
> +     *                     ,,
> +     *                     _MCF,
> +     *                     AddressRangeMemory,
> +     *                     TypeStatic
> +     *                     )
> +     *     })
> +     *     Method(_CRS, 0x0, NotSerialized)
> +     *     {
> +     *         CreateDWordField(RBUF, DRAC._MCF._MIN, MINL)
> +     *         CreateDWordField(RBUF, DRAC._MCF._MIN + 4, MINH)
> +     *         CreateDWordField(RBUF, DRAC._MCF._MAX, MAXL)
> +     *         CreateDWordField(RBUF, DRAC._MCF._MAX + 4, MAXH)
> +     *         CreateQWordField(RBUF, DRAC._MCF._LEN, _LEN)
> +     *
> +     *         Local0 = PEBL
> +     *         Local1 = Local0 & 0x1  // PCIEXBAR PCIEBAREN
> +     *         Local2 = Local0 & 0x6  // PCIEXBAR LENGTH
> +     *         Local3 = Local0 & ~0x7 // PCIEXBAR base address low 32bit
> +     *         Local4 = PEBH          // PCIEXBAR base address high 32bit
> +     *         If (Local1 == 1) {
> +     *             MINL = Local3
> +     *             MINH = Local4
> +     *             MAXL = Local3
> +     *             MAXH = Local4
> +     *
> +     *             If (Local2 == 0) {
> +     *                 _LEN = 256 * 1024 * 1024
> +     *             }
> +     *             If (Local2 == 0x2) {
> +     *                 _LEN = 128 * 1024 * 1024
> +     *             }
> +     *             If (Local2 == 0x4) {
> +     *                 _LEN = 64 * 1024 * 1024
> +     *             }
> +     *         }
> +     *         return (RBUF)
> +     *     }
> +     * }
> +     */
> +
> +    Aml *dev;
> +    Aml *field;
> +    Aml *rbuf;
> +    Aml *resource_template;
> +    Aml *crs;
> +
> +    /* DRAM controller */
> +    dev = aml_device("DRAC");
> +
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
> +    /* 5.1.6 PCIEXBAR: Bus 0:Device 0:Function 0:offset 0x60 */
> +    aml_append(dev, aml_operation_region("DRR0", AML_PCI_CONFIG,
> +                                         aml_int(0x0000000000000060), 0x8));
> +    field = aml_field("DRR0", AML_DWORD_ACC, AML_NOLOCK, AML_PRESERVE);
> +    aml_append(field, aml_named_field("PEBL", 32));
> +    aml_append(field, aml_named_field("PEBH", 32));
> +    aml_append(dev, field);
> +
> +    resource_template = aml_resource_template();
> +    aml_append(resource_template, aml_qword_memory(AML_POS_DECODE,
> +                                                   AML_MIN_FIXED,
> +                                                   AML_MAX_FIXED,
> +                                                   AML_NON_CACHEABLE,
> +                                                   AML_READ_WRITE,
> +                                                   0x0000000000000000,
> +                                                   0x0000000000000000,
> +                                                   0x0000000000000000,
> +                                                   0x0000000000000000,
> +                                                   0x0000000000000000));
> +    rbuf = aml_name_decl("RBUF", resource_template);
> +    aml_append(dev, rbuf);
> +
> +    crs = aml_method("_CRS", 0, AML_SERIALIZED);
> +    {
> +        Aml *rbuf_name;
> +        Aml *local0;
> +        Aml *local1;
> +        Aml *local2;
> +        Aml *local3;
> +        Aml *local4;
> +        Aml *ifc;
> +
> +        rbuf_name = aml_name("RBUF");
> +        aml_append(crs, aml_create_dword_field(rbuf_name,
> +                                               aml_int(14), "MINL"));
> +        aml_append(crs, aml_create_dword_field(rbuf_name,
> +                                               aml_int(14 + 4), "MINH"));
> +        aml_append(crs, aml_create_dword_field(rbuf_name,
> +                                               aml_int(22), "MAXL"));
> +        aml_append(crs, aml_create_dword_field(rbuf_name,
> +                                               aml_int(22 + 4), "MAXH"));
> +        aml_append(crs, aml_create_qword_field(rbuf_name,
> +                                               aml_int(38), "_LEN"));
> +
> +        local0 = aml_local(0);
> +        aml_append(crs, aml_store(aml_name("PEBL"), local0));
> +        local1 = aml_local(1);
> +        aml_append(crs, aml_and(local0, aml_int(0x1), local1));
> +        local2 = aml_local(2);
> +        aml_append(crs, aml_and(local0, aml_int(0x6), local2));
> +        local3 = aml_local(3);
> +        aml_append(crs, aml_and(local0, aml_int((uint32_t)~0x7), local3));
> +        local4 = aml_local(4);
> +        aml_append(crs, aml_store(aml_name("PEBH"), local4));
> +
> +        ifc = aml_if(aml_equal(local1, aml_int(0x1)));
> +        {
> +            Aml *_len;
> +            Aml *ifc0;
> +            Aml *ifc2;
> +            Aml *ifc4;
> +
> +            aml_append(ifc, aml_store(local3, aml_name("MINL")));
> +            aml_append(ifc, aml_store(local4, aml_name("MINH")));
> +            aml_append(ifc, aml_store(local3, aml_name("MAXL")));
> +            aml_append(ifc, aml_store(local4, aml_name("MAXH")));
> +
> +            _len = aml_name("_LEN");
> +            ifc0 = aml_if(aml_equal(local2, aml_int(0x0)));
> +            aml_append(ifc0,
> +                       aml_store(aml_int(256 * 1024 * 1024), _len));
> +            aml_append(ifc, ifc0);
> +
> +            ifc2 = aml_if(aml_equal(local2, aml_int(0x2)));
> +            aml_append(ifc2,
> +                       aml_store(aml_int(128 * 1024 * 1024), _len));
> +            aml_append(ifc, ifc2);
> +
> +            ifc4 = aml_if(aml_equal(local2, aml_int(0x4)));
> +            aml_append(ifc4,
> +                       aml_store(aml_int(64 * 1024 * 1024), _len));
> +            aml_append(ifc, ifc4);
> +        }
> +        aml_append(crs, ifc);
> +        aml_append(crs, aml_return(rbuf_name));
> +    }
> +    aml_append(dev, crs);
> +
> +    return dev;
> +}
> +
>  static void build_q35_isa_bridge(Aml *table)
>  {
>      Aml *dev;
> @@ -1250,6 +1421,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>          aml_append(dev, build_q35_osc_method());
>          aml_append(sb_scope, dev);
> +        aml_append(sb_scope, build_q35_dram_controller());
>  
>          if (pm->smi_on_cpuhp) {
>              /* reserve SMI block resources, IO ports 0xB2, 0xB3 */


