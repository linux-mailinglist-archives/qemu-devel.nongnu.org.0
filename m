Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939D31B9F3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:07:49 +0100 (CET)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdbQ-0006tR-3m
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBdIz-0007Ce-SO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:48:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBdIx-0002Bq-Lf
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613393322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HGeGhlvYA5hdUzdsgHP3sPrDOJDKO3hZFuGyt0JuDM=;
 b=TAfQnebbgy3k7IEFZngELKtItFBJ7pxA5wdHc4DcKpCPmY3f5IrD5xXN3uAEfvWaMNA2dl
 aE2BN2uQuZfft56bEAQjg6d5oAnyI/aonobI/DXbYETzn/BshxAwJ2xy+fmHvGMhvhpRfq
 Ev8N3XYN4eClOr1NKbg7+CQ21yBW84g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-xfYozkt2ObmWmquVufJ4rQ-1; Mon, 15 Feb 2021 07:48:40 -0500
X-MC-Unique: xfYozkt2ObmWmquVufJ4rQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA4A80197C;
 Mon, 15 Feb 2021 12:48:38 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB0962461;
 Mon, 15 Feb 2021 12:48:34 +0000 (UTC)
Date: Mon, 15 Feb 2021 13:48:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH v3 07/10] hw/i386: declare ACPI mother board resource
 for MMCONFIG region
Message-ID: <20210215134832.5a32e851@redhat.com>
In-Reply-To: <20210212205157.GA7151@private.email.ne.jp>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
 <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
 <20210212164038.207e0f54@redhat.com>
 <20210212205157.GA7151@private.email.ne.jp>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 12:51:57 -0800
Isaku Yamahata <isaku.yamahata@gmail.com> wrote:

> On Fri, Feb 12, 2021 at 04:40:38PM +0100,
> Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> > On Wed, 10 Feb 2021 22:46:43 -0800
> > Isaku Yamahata <isaku.yamahata@intel.com> wrote:
> >  =20
> > > Declare PNP0C01 device to reserve MMCONFIG region to conform to the
> > > spec better and play nice with guest BIOSes/OSes.
> > >=20
> > > According to PCI Firmware Specification[0], MMCONFIG region must be
> > > reserved by declaring a motherboard resource. It's optional to reserv=
e
> > > the region in memory map by Int 15 E820h or EFIGetMemoryMap.
> > > Guest Linux checks if the MMCFG region is reserved by bios memory map
> > > or ACPI resource. If it's not reserved, Linux falls back to legacy PC=
I
> > > configuration access.
> > >=20
> > > TDVF [1] [2] doesn't reserve MMCONFIG the region in memory map.
> > > On the other hand OVMF reserves it in memory map without declaring a
> > > motherboard resource. With memory map reservation, linux guest uses
> > > MMCONFIG region. However it doesn't comply to PCI Firmware
> > > specification.
> > >=20
> > > [0] PCI Firmware specification Revision 3.2
> > >   4.1.2 MCFG Table Description table 4-2 NOTE 2
> > >   If the operating system does not natively comprehend reserving the
> > >   MMCFG region, The MMCFG region must e reserved by firmware. ...
> > >   For most systems, the mortheroard resource would appear at the root
> > >   of the ACPI namespace (under \_SB)...
> > >   The resource can optionally be returned in Int15 E820h or
> > >   EFIGetMemoryMap as reserved memory but must always be reported
> > >   through ACPI as a motherboard resource
> > >=20
> > > [1] TDX: Intel Trust Domain Extension
> > >     https://software.intel.com/content/www/us/en/develop/articles/int=
el-trust-domain-extensions.html
> > > [2] TDX Virtual Firmware
> > >     https://github.com/tianocore/edk2-staging/tree/TDVF
> > >=20
> > > The change to DSDT is as follows.
> > > @@ -68,32 +68,51 @@
> > >=20
> > >                      If ((CDW3 !=3D Local0))
> > >                      {
> > >                          CDW1 |=3D 0x10
> > >                      }
> > >=20
> > >                      CDW3 =3D Local0
> > >                  }
> > >                  Else
> > >                  {
> > >                      CDW1 |=3D 0x04
> > >                  }
> > >=20
> > >                  Return (Arg3)
> > >              }
> > >          }
> > > +
> > > +        Device (DRAC)
> > > +        {
> > > +            Name (_HID, "PNP0C01" /* System Board */)  // _HID: Hard=
ware ID
> > > +            Name (RBUF, ResourceTemplate ()
> > > +            {
> > > +                QWordMemory (ResourceProducer, PosDecode, MinFixed, =
MaxFixed, NonCacheable, ReadWrite,
> > > +                    0x0000000000000000, // Granularity
> > > +                    0x00000000B0000000, // Range Minimum
> > > +                    0x00000000BFFFFFFF, // Range Maximum
> > > +                    0x0000000000000000, // Translation Offset
> > > +                    0x0000000010000000, // Length
> > > +                    ,, , AddressRangeMemory, TypeStatic)
> > > +            })
> > > +            Method (_CRS, 0, Serialized)  // _CRS: Current Resource =
Settings
> > > +            {
> > > +                Return (RBUF) /* \_SB_.DRAC.RBUF */
> > > +            }
> > > +        }
> > >      }
> > >=20
> > >      Scope (_SB)
> > >      {
> > >          Device (HPET)
> > >          {
> > >              Name (_HID, EisaId ("PNP0103") /* HPET System Timer */) =
 // _HID: Hardware ID
> > >              Name (_UID, Zero)  // _UID: Unique ID
> > >              OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
> > >              Field (HPTM, DWordAcc, Lock, Preserve)
> > >              {
> > >                  VEND,   32,
> > >                  PRD,    32
> > >              }
> > >=20
> > >              Method (_STA, 0, NotSerialized)  // _STA: Status
> > >=20
> > > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > > ---
> > >  hw/i386/acpi-build.c | 46 ++++++++++++++++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 45 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 00cc119362..e369908b1a 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -1072,6 +1072,46 @@ static void build_q35_pci0_int(Aml *table)
> > >      aml_append(table, sb_scope);
> > >  }
> > > =20
> > > +static Aml *build_q35_dram_controller(void)
> > > +{
> > > +    AcpiMcfgInfo mcfg; =20
> > build_dsdt() already calls acpi_get_mcfg(),
> > I suggest to cache it there and pass to build_q35_dram_controller
> > as an argument. =20
>=20
> Sure.
>=20
>=20
> > > +    Aml *dev;
> > > +    Aml *rbuf;
> > > +    Aml *resource_template;
> > > +    Aml *rbuf_name;
> > > +    Aml *crs;
> > > +
> > > +    if (!acpi_get_mcfg(&mcfg)) {
> > > +        return NULL;
> > > +    }
> > > +
> > > +    /* DRAM controller */
> > > +    dev =3D aml_device("DRAC");
> > > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
> > > +
> > > +    resource_template =3D aml_resource_template();
> > > +    aml_append(resource_template,
> > > +               aml_qword_memory(AML_POS_DECODE,
> > > +                                AML_MIN_FIXED,
> > > +                                AML_MAX_FIXED,
> > > +                                AML_NON_CACHEABLE,
> > > +                                AML_READ_WRITE,
> > > +                                0x0000000000000000,
> > > +                                mcfg.base,
> > > +                                mcfg.base + mcfg.size - 1, =20
> > s/mcfg.base + mcfg.size - 1/mcfg.base/ =20
>=20
> AddressMaximum needs to be the highest address of the region.
> Not base address. By disassemble/assembl it, iasl complains as follows.
> Also there are similar examples in acpi-build.c.
I mostly clean up all places to use the same base address for min/max,
but probably something were left behind.

spec says:

acpi 6.3: 19.6.110 QWordMemory

AddressMaximum evaluates to a 64-bit integer that specifies the highest pos=
sible base address of the
Memory range. The value must have =E2=80=980=E2=80=99 in all bits where the=
 corresponding bit in AddressGranularity is
=E2=80=981=E2=80=99. For bridge devices which translate addresses, this is =
the address on the secondary bus. The 64-bit
field DescriptorName ._MAX is automatically created to refer to this portio=
n of the resource descriptor.

=20
>   iasl drm-1.dsl
>=20
>   Intel ACPI Component Architecture
>   ASL+ Optimizing Compiler/Disassembler version 20190509
>   Copyright (c) 2000 - 2019 Intel Corporation
>=20
>   drm-1.dsl     23:                     0x10000000, // Length =3D 256M
>   Error    6049 -                               ^ Length is larger than M=
in/Max window
>=20
>   ASL Input:     drm-1.dsl -    1000 bytes      6 keywords     37 source =
lines
>=20
>   Compilation failed. 1 Errors, 0 Warnings, 0 Remarks
>   No AML files were generated due to compiler error(s)
>=20
>=20
> > > +                                0x0000000000000000,
> > > +                                mcfg.size));
> > > +    rbuf =3D aml_name_decl("RBUF", resource_template);
> > > +    aml_append(dev, rbuf);
> > > +
> > > +    crs =3D aml_method("_CRS", 0, AML_SERIALIZED);
> > > +    rbuf_name =3D aml_name("RBUF");
> > > +    aml_append(crs, aml_return(rbuf_name));
> > > +    aml_append(dev, crs);
> > > +
> > > +    return dev;
> > > +}
> > > +
> > >  static void build_q35_isa_bridge(Aml *table)
> > >  {
> > >      Aml *dev;
> > > @@ -1212,7 +1252,7 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,
> > >             Range *pci_hole, Range *pci_hole64, MachineState *machine=
)
> > >  {
> > >      CrsRangeEntry *entry;
> > > -    Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
> > > +    Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs,=
 *drac; =20
> > maybe limit drac to
> >   if (misc->is_piix4) {=20
> >   ... } else {
> >      Aml *drac
> > scope =20
>=20
> ok.
>=20
>=20
> > >      CrsRangeSet crs_range_set;
> > >      PCMachineState *pcms =3D PC_MACHINE(machine);
> > >      PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(machine);
> > > @@ -1256,6 +1296,10 @@ build_dsdt(GArray *table_data, BIOSLinker *lin=
ker,
> > >          aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > >          aml_append(dev, build_q35_osc_method());
> > >          aml_append(sb_scope, dev);
> > > +        drac =3D build_q35_dram_controller();
> > > +        if (drac) {
> > > +            aml_append(sb_scope, drac);
> > > +        } =20
> > mmcfg isn't optional for q35, is it?
> > I'd simplify to:
> >     aml_append(sb_scope, build_q35_dram_controller(mmcfg_info));
> > or put all of it under condition if it's optional
> >    if(foo) aml_append(sb_scope, build_q35_dram_controller(mmcfg_info)) =
=20
>=20
> It's optional. If MCFG isn't setup after reset, PCIE_BASE_ADDR_UNMAPPED
> is returned.
ok


