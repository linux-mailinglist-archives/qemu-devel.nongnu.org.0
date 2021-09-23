Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216A41584E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 08:37:16 +0200 (CEST)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTIM6-0007dK-S2
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 02:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTIK0-0006e2-FN
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 02:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTIJu-0005BA-BO
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 02:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632378896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0bSB+xMgWivWP2UX4tHNgRavqMmYAf8h4LNVewhthY=;
 b=ZF70v0CDPOrpkHn9jk3Ln2BF1B1reneeHrz/B/c7CHTpPHKMRjNjFdeEhbkT2ugshijtR4
 VjlpwAZGfIMksAIWYpQCpTrJ0iWUn9rIa7wUYZioj+oXr7oYEFfjxKh2URt5Sv2AASNIWr
 WTQbFyxGUy2OzrPcDjgu1cPlUz/UuKw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-_NGrpudsNdac6Hf4Mpr1pA-1; Thu, 23 Sep 2021 02:34:54 -0400
X-MC-Unique: _NGrpudsNdac6Hf4Mpr1pA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w24-20020a056402071800b003cfc05329f8so5759054edx.19
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 23:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dp1d23OL/Ht8NoZ6Dt112rUooSt1yKeXStQGejAhUc=;
 b=pavuiJMFLnvplp5u1vH41xxjiGJ+PfHS1e0WiHBU7ECaxVp6ttVkZq6fVTvhffUG42
 axtAEOS3evHq07L7mNzjol+bUVhHoN6n1cmDPsstDNSAgps/EowQAA/COGkWX9y54r44
 jhttM9jQ0gknHmVB/4UCzLMCX1oIS6XGWrTpR4GLSUrWTrbGR84GJVVgb+X9IOj0aPy7
 ySu99LdIrGBx1tHGOU7utcbr0RTG4ljjkTPOZ7hJTsEBqha17rZkXAeeh2NeB2jytjxR
 2epQcSVmICmaN1mqnW53ZiSEZDs7L+Hg+a+Y8Lm2RV1qoyy6S5IR53Gb56buCd08IDZZ
 MWKA==
X-Gm-Message-State: AOAM531/XtFwFVl15cEezClWnfTOn1Gh83hDGE49b7Laa34k/YCUPIbU
 XKUAflqaKQldk2RzhoLCEe2El3fmJV5tyn4JDKfsKfLiPbI3CIczMQEo+q2nenTD3HKqd5ky0Ob
 GwKAS3CF35iWelmA=
X-Received: by 2002:a05:6402:21e6:: with SMTP id
 ce6mr3578693edb.153.1632378892621; 
 Wed, 22 Sep 2021 23:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrKW/WmS95YYjC1MEtZSgZtwM05fcqKqXzvo2tBvFZRWMI48wTSUkisAszzwITCRhKMDXg4Q==
X-Received: by 2002:a05:6402:21e6:: with SMTP id
 ce6mr3578673edb.153.1632378892242; 
 Wed, 22 Sep 2021 23:34:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f19sm2678158edv.91.2021.09.22.23.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 23:34:51 -0700 (PDT)
Date: Thu, 23 Sep 2021 08:34:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v3 24/35] acpi: x86: madt: use
 build_append_int_noprefix() API to compose MADT table
Message-ID: <20210923083450.61817bf3@redhat.com>
In-Reply-To: <b0f2aac1-f5ba-b709-0cd3-4af259cf2e81@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-25-imammedo@redhat.com>
 <0cfb534a-afb4-ff3e-2359-6906eaf16d8a@redhat.com>
 <20210922173034.0909b671@redhat.com>
 <b0f2aac1-f5ba-b709-0cd3-4af259cf2e81@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 17:37:40 +0200
Eric Auger <eauger@redhat.com> wrote:

> Hi,
> On 9/22/21 5:30 PM, Igor Mammedov wrote:
> > On Wed, 22 Sep 2021 12:20:54 +0200
> > Eric Auger <eauger@redhat.com> wrote:
> >  =20
> >> On 9/7/21 4:48 PM, Igor Mammedov wrote: =20
> >>> Drop usage of packed structures and explicit endian conversions
> >>> when building MADT table for arm/x86 and use endian agnostic
> >>> build_append_int_noprefix() API to build it.
> >>>
> >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>> ---
> >>> CC: marcel.apfelbaum@gmail.com
> >>> CC: eauger@redhat.com
> >>> ---
> >>>  include/hw/acpi/acpi-defs.h |  64 ------------------
> >>>  hw/i386/acpi-common.c       | 127 ++++++++++++++++++----------------=
--
> >>>  2 files changed, 65 insertions(+), 126 deletions(-)
> >>>
> >>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.=
h
> >>> index af4fa412a5..3f174ba208 100644
> >>> --- a/include/hw/acpi/acpi-defs.h
> >>> +++ b/include/hw/acpi/acpi-defs.h
> >>> @@ -165,17 +165,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDe=
scriptorRev1;
> >>> =20
> >>>  /* Values for Type in APIC sub-headers */
> >>> =20
> >>> -#define ACPI_APIC_PROCESSOR          0
> >>> -#define ACPI_APIC_IO                 1
> >>> -#define ACPI_APIC_XRUPT_OVERRIDE     2
> >>> -#define ACPI_APIC_NMI                3
> >>> -#define ACPI_APIC_LOCAL_NMI          4
> >>> -#define ACPI_APIC_ADDRESS_OVERRIDE   5
> >>> -#define ACPI_APIC_IO_SAPIC           6
> >>> -#define ACPI_APIC_LOCAL_SAPIC        7
> >>> -#define ACPI_APIC_XRUPT_SOURCE       8
> >>> -#define ACPI_APIC_LOCAL_X2APIC       9
> >>> -#define ACPI_APIC_LOCAL_X2APIC_NMI      10
> >>>  #define ACPI_APIC_GENERIC_CPU_INTERFACE 11
> >>>  #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
> >>>  #define ACPI_APIC_GENERIC_MSI_FRAME     13
> >>> @@ -192,59 +181,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDe=
scriptorRev1;
> >>> =20
> >>>  /* Sub-structures for MADT */
> >>> =20
> >>> -struct AcpiMadtProcessorApic {
> >>> -    ACPI_SUB_HEADER_DEF
> >>> -    uint8_t  processor_id;           /* ACPI processor id */
> >>> -    uint8_t  local_apic_id;          /* Processor's local APIC id */
> >>> -    uint32_t flags;
> >>> -} QEMU_PACKED;
> >>> -typedef struct AcpiMadtProcessorApic AcpiMadtProcessorApic;
> >>> -
> >>> -struct AcpiMadtIoApic {
> >>> -    ACPI_SUB_HEADER_DEF
> >>> -    uint8_t  io_apic_id;             /* I/O APIC ID */
> >>> -    uint8_t  reserved;               /* Reserved - must be zero */
> >>> -    uint32_t address;                /* APIC physical address */
> >>> -    uint32_t interrupt;              /* Global system interrupt wher=
e INTI
> >>> -                                 * lines start */
> >>> -} QEMU_PACKED;
> >>> -typedef struct AcpiMadtIoApic AcpiMadtIoApic;
> >>> -
> >>> -struct AcpiMadtIntsrcovr {
> >>> -    ACPI_SUB_HEADER_DEF
> >>> -    uint8_t  bus;
> >>> -    uint8_t  source;
> >>> -    uint32_t gsi;
> >>> -    uint16_t flags;
> >>> -} QEMU_PACKED;
> >>> -typedef struct AcpiMadtIntsrcovr AcpiMadtIntsrcovr;
> >>> -
> >>> -struct AcpiMadtLocalNmi {
> >>> -    ACPI_SUB_HEADER_DEF
> >>> -    uint8_t  processor_id;           /* ACPI processor id */
> >>> -    uint16_t flags;                  /* MPS INTI flags */
> >>> -    uint8_t  lint;                   /* Local APIC LINT# */
> >>> -} QEMU_PACKED;
> >>> -typedef struct AcpiMadtLocalNmi AcpiMadtLocalNmi;
> >>> -
> >>> -struct AcpiMadtProcessorX2Apic {
> >>> -    ACPI_SUB_HEADER_DEF
> >>> -    uint16_t reserved;
> >>> -    uint32_t x2apic_id;              /* Processor's local x2APIC ID =
*/
> >>> -    uint32_t flags;
> >>> -    uint32_t uid;                    /* Processor object _UID */
> >>> -} QEMU_PACKED;
> >>> -typedef struct AcpiMadtProcessorX2Apic AcpiMadtProcessorX2Apic;
> >>> -
> >>> -struct AcpiMadtLocalX2ApicNmi {
> >>> -    ACPI_SUB_HEADER_DEF
> >>> -    uint16_t flags;                  /* MPS INTI flags */
> >>> -    uint32_t uid;                    /* Processor object _UID */
> >>> -    uint8_t  lint;                   /* Local APIC LINT# */
> >>> -    uint8_t  reserved[3];            /* Local APIC LINT# */
> >>> -} QEMU_PACKED;
> >>> -typedef struct AcpiMadtLocalX2ApicNmi AcpiMadtLocalX2ApicNmi;
> >>> -
> >>>  struct AcpiMadtGenericCpuInterface {
> >>>      ACPI_SUB_HEADER_DEF
> >>>      uint16_t reserved;
> >>> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> >>> index 7983a13a93..aa7b5c357e 100644
> >>> --- a/hw/i386/acpi-common.c
> >>> +++ b/hw/i386/acpi-common.c
> >>> @@ -38,7 +38,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> >>>                         bool force_enabled)
> >>>  {
> >>>      uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
> >>> -    uint32_t flags =3D apic_ids->cpus[uid].cpu !=3D NULL || force_en=
abled ? 1 : 0;
> >>> +    /* Flags =E2=80=93 Local APIC Flags */   =20
> >> nit: move that comment at the place of the build_append_int_noprefix =
=20
> >=20
> > that place(s) already has comment in expected format, here is just remi=
nder
> > about what is initialized here.
> >  =20
> >>> +    uint32_t flags =3D apic_ids->cpus[uid].cpu !=3D NULL || force_en=
abled ?
> >>> +                     1 /* Enabled */ : 0;
> >>> =20
> >>>      /* ACPI spec says that LAPIC entry for non present
> >>>       * CPU may be omitted from MADT or it must be marked
> >>> @@ -47,24 +49,47 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int ui=
d,
> >>>       * should be put in MADT but kept disabled.
> >>>       */
> >>>      if (apic_id < 255) {
> >>> -        AcpiMadtProcessorApic *apic =3D acpi_data_push(entry, sizeof=
 *apic);
> >>> -
> >>> -        apic->type =3D ACPI_APIC_PROCESSOR;
> >>> -        apic->length =3D sizeof(*apic);
> >>> -        apic->processor_id =3D uid;
> >>> -        apic->local_apic_id =3D apic_id;
> >>> -        apic->flags =3D cpu_to_le32(flags);
> >>> +        /* Rev 1.0b, Table 5-13 Processor Local APIC Structure */
> >>> +        build_append_int_noprefix(entry, 0, 1);       /* Type */
> >>> +        build_append_int_noprefix(entry, 8, 1);       /* Length */
> >>> +        build_append_int_noprefix(entry, uid, 1);     /* ACPI Proces=
sor ID */   =20
> >> nit s/ID/UID =20
> >=20
> > it's ID in 1.0b
> >  =20
> >>> +        build_append_int_noprefix(entry, apic_id, 1); /* APIC ID */
> >>> +        build_append_int_noprefix(entry, flags, 4); /* Flags */
> >>>      } else {
> >>> -        AcpiMadtProcessorX2Apic *apic =3D acpi_data_push(entry, size=
of *apic);
> >>> -
> >>> -        apic->type =3D ACPI_APIC_LOCAL_X2APIC;
> >>> -        apic->length =3D sizeof(*apic);
> >>> -        apic->uid =3D cpu_to_le32(uid);
> >>> -        apic->x2apic_id =3D cpu_to_le32(apic_id);
> >>> -        apic->flags =3D cpu_to_le32(flags);
> >>> +        /* Rev 4.0, 5.2.12.12 Processor Local x2APIC Structure */
> >>> +        build_append_int_noprefix(entry, 9, 1);       /* Type */
> >>> +        build_append_int_noprefix(entry, 16, 1);      /* Length */
> >>> +        build_append_int_noprefix(entry, 0, 2);       /* Reserved */
> >>> +        build_append_int_noprefix(entry, apic_id, 4); /* X2APIC ID *=
/
> >>> +        build_append_int_noprefix(entry, flags, 4);   /* Flags */
> >>> +        build_append_int_noprefix(entry, uid, 4);     /* ACPI Proces=
sor UID */
> >>>      }
> >>>  }
> >>> =20
> >>> +static void build_ioapic(GArray *entry, uint8_t id, uint32_t addr, u=
int32_t irq)
> >>> +{
> >>> +    /* Rev 1.0b, 5.2.8.2 IO APIC */
> >>> +    build_append_int_noprefix(entry, 1, 1);    /* Type */
> >>> +    build_append_int_noprefix(entry, 12, 1);   /* Length */
> >>> +    build_append_int_noprefix(entry, id, 1);   /* IO APIC ID */
> >>> +    build_append_int_noprefix(entry, 0, 1);    /* Reserved */
> >>> +    build_append_int_noprefix(entry, addr, 4); /* IO APIC Address */
> >>> +    build_append_int_noprefix(entry, irq, 4);  /* System Vector Base=
 */
> >>> +}
> >>> +
> >>> +static void
> >>> +build_xrupt_override(GArray *entry, uint8_t src, uint32_t gsi, uint1=
6_t flags)
> >>> +{
> >>> +    /* Rev 1.0b, 5.2.8.3.1 Interrupt Source Overrides */
> >>> +    build_append_int_noprefix(entry, 2, 1);  /* Type */
> >>> +    build_append_int_noprefix(entry, 10, 1); /* Length */
> >>> +    build_append_int_noprefix(entry, 0, 1);  /* Bus */
> >>> +    build_append_int_noprefix(entry, src, 1);  /* Source */
> >>> +    /* Global System Interrupt Vector */
> >>> +    build_append_int_noprefix(entry, gsi, 4);
> >>> +    build_append_int_noprefix(entry, flags, 2);  /* Flags */
> >>> +}
> >>> +
> >>>  /*
> >>>   * ACPI spec, Revision 1.0b
> >>>   * 5.2.8 Multiple APIC Description Table
> >>> @@ -73,14 +98,11 @@ void acpi_build_madt(GArray *table_data, BIOSLink=
er *linker,
> >>>                       X86MachineState *x86ms, AcpiDeviceIf *adev,
> >>>                       const char *oem_id, const char *oem_table_id)
> >>>  {
> >>> +    int i;
> >>> +    bool x2apic_mode =3D false;
> >>>      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
> >>>      const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACH=
INE(x86ms));
> >>>      AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
> >>> -    bool x2apic_mode =3D false;
> >>> -
> >>> -    AcpiMadtIoApic *io_apic;
> >>> -    AcpiMadtIntsrcovr *intsrcovr;
> >>> -    int i;
> >>>      AcpiTable table =3D { .sig =3D "APIC", .rev =3D 1, .oem_id =3D o=
em_id,
> >>>                          .oem_table_id =3D oem_table_id };
> >>> =20
> >>> @@ -96,30 +118,14 @@ void acpi_build_madt(GArray *table_data, BIOSLin=
ker *linker,
> >>>          }
> >>>      }
> >>> =20
> >>> -    io_apic =3D acpi_data_push(table_data, sizeof *io_apic);
> >>> -    io_apic->type =3D ACPI_APIC_IO;
> >>> -    io_apic->length =3D sizeof(*io_apic);
> >>> -    io_apic->io_apic_id =3D ACPI_BUILD_IOAPIC_ID;
> >>> -    io_apic->address =3D cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
> >>> -    io_apic->interrupt =3D cpu_to_le32(0);
> >>> -
> >>> +    build_ioapic(table_data, ACPI_BUILD_IOAPIC_ID, IO_APIC_DEFAULT_A=
DDRESS, 0);
> >>>      if (x86ms->ioapic2) {
> >>> -        AcpiMadtIoApic *io_apic2;
> >>> -        io_apic2 =3D acpi_data_push(table_data, sizeof *io_apic);
> >>> -        io_apic2->type =3D ACPI_APIC_IO;
> >>> -        io_apic2->length =3D sizeof(*io_apic);
> >>> -        io_apic2->io_apic_id =3D ACPI_BUILD_IOAPIC_ID + 1;
> >>> -        io_apic2->address =3D cpu_to_le32(IO_APIC_SECONDARY_ADDRESS)=
;
> >>> -        io_apic2->interrupt =3D cpu_to_le32(IO_APIC_SECONDARY_IRQBAS=
E);
> >>> +        build_ioapic(table_data, ACPI_BUILD_IOAPIC_ID + 1,
> >>> +                     IO_APIC_SECONDARY_ADDRESS, IO_APIC_SECONDARY_IR=
QBASE);
> >>>      }
> >>> =20
> >>>      if (x86ms->apic_xrupt_override) {
> >>> -        intsrcovr =3D acpi_data_push(table_data, sizeof *intsrcovr);
> >>> -        intsrcovr->type   =3D ACPI_APIC_XRUPT_OVERRIDE;
> >>> -        intsrcovr->length =3D sizeof(*intsrcovr);
> >>> -        intsrcovr->source =3D 0;
> >>> -        intsrcovr->gsi    =3D cpu_to_le32(2);
> >>> -        intsrcovr->flags  =3D cpu_to_le16(0); /* conforms to bus spe=
cifications */
> >>> +        build_xrupt_override(table_data, 0, 2, 0);   =20
> >  =20
> >> lost /* conforms to bus specifications */ comment for the flag during
> >> the battle/ Don't know if it is useful though =20
> >=20
> >  =20
> >>>      }
> >>> =20
> >>>      for (i =3D 1; i < 16; i++) {
> >>> @@ -127,32 +133,29 @@ void acpi_build_madt(GArray *table_data, BIOSLi=
nker *linker,
> >>>              /* No need for a INT source override structure. */
> >>>              continue;
> >>>          }
> >>> -        intsrcovr =3D acpi_data_push(table_data, sizeof *intsrcovr);
> >>> -        intsrcovr->type   =3D ACPI_APIC_XRUPT_OVERRIDE;
> >>> -        intsrcovr->length =3D sizeof(*intsrcovr);
> >>> -        intsrcovr->source =3D i;
> >>> -        intsrcovr->gsi    =3D cpu_to_le32(i);
> >>> -        intsrcovr->flags  =3D cpu_to_le16(0xd); /* active high, leve=
l triggered */
> >>> +        build_xrupt_override(table_data, i, i, 0xd);   =20
> >> Lost for the flag /* active high, level triggered */ =20
> >>>      }
> >>> =20
> >>>      if (x2apic_mode) {
> >>> -        AcpiMadtLocalX2ApicNmi *local_nmi;
> >>> -
> >>> -        local_nmi =3D acpi_data_push(table_data, sizeof *local_nmi);
> >>> -        local_nmi->type   =3D ACPI_APIC_LOCAL_X2APIC_NMI;
> >>> -        local_nmi->length =3D sizeof(*local_nmi);
> >>> -        local_nmi->uid    =3D 0xFFFFFFFF; /* all processors */
> >>> -        local_nmi->flags  =3D cpu_to_le16(0);
> >>> -        local_nmi->lint   =3D 1; /* ACPI_LINT1 */
> >>> +        /* Rev 4.0, 5.2.12.13 Local x2APIC NMI Structure*/
> >>> +        build_append_int_noprefix(table_data, 0xA, 1); /* Type */
> >>> +        build_append_int_noprefix(table_data, 12, 1);  /* Length */
> >>> +        build_append_int_noprefix(table_data, 0, 2);   /* Flags */
> >>> +        /* ACPI Processor UID */
> >>> +        build_append_int_noprefix(table_data, 0xFFFFFFFF /* all proc=
essors */,
> >>> +                                  4);
> >>> +        /* Local x2APIC INTI# */   =20
> >> Local x2APIC LINT# =20
> >>> +        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1)=
;
> >>> +        build_append_int_noprefix(table_data, 0, 3);   =20
> >> /* reserved */ =20
> >>>      } else {
> >>> -        AcpiMadtLocalNmi *local_nmi;
> >>> -
> >>> -        local_nmi =3D acpi_data_push(table_data, sizeof *local_nmi);
> >>> -        local_nmi->type         =3D ACPI_APIC_LOCAL_NMI;
> >>> -        local_nmi->length       =3D sizeof(*local_nmi);
> >>> -        local_nmi->processor_id =3D 0xff; /* all processors */
> >>> -        local_nmi->flags        =3D cpu_to_le16(0);
> >>> -        local_nmi->lint         =3D 1; /* ACPI_LINT1 */
> >>> +        /* Rev 1.0b, 5.2.8.3.3 Local APIC NMI */
> >>> +        build_append_int_noprefix(table_data, 4, 1);  /* Type */
> >>> +        build_append_int_noprefix(table_data, 6, 1);  /* Length */
> >>> +        /* ACPI Processor ID */
> >>> +        build_append_int_noprefix(table_data, 0xff /* all processors=
 */, 1);   =20
> >> 0xFF =20
> >  =20
> >>> +        build_append_int_noprefix(table_data, 0, 2);  /* Flags */
> >>> +        /* Local APIC INTI# */   =20
> >> Local APIC LINT# =20
> >=20
> > it's "Local APIC INTI#" in 1.0b =20
> OK sorry for the noise. Maybe we should add this link somewhere
> https://uefi.org/acpi/specs
>=20
> I may have looked at some other references when reviewing.

problems with the links is that they are usually go stale
(good or rather bad example of that is so called Microsoft 'specs' html doc=
s,
ex: early revisions of SRAT)

That's why we put in put in comment spec name and revision which
is usually sufficient to reliably find a spec in question,
regardless of where it's hosted at the moment.


>=20
> Thanks
>=20
> Eric
> >  =20
> >>> +        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1)=
;
> >>>      }
> >>> =20
> >>>      acpi_table_end(linker, &table);
> >>>    =20
> >=20
> > the rest is fixed up
> >  =20
> >> Besides
> >> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> Eric
> >> =20
> >  =20
>=20


