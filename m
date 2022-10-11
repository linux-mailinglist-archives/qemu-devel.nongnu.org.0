Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C50D5FB30B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:15:44 +0200 (CEST)
Received: from localhost ([::1]:40326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiF6l-00060b-5I
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oiDQJ-0008AG-14
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:27:47 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oiDQG-0002eu-2b
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:27:46 -0400
Received: by mail-il1-x134.google.com with SMTP id a17so6984917ilq.1
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOdlws63Xw27l3OBBm6UODo1357OkyolVq1NsXP4HtE=;
 b=3IhuRXyt0X8DijwES5N2bMkyYcVvbhSj57xvgT8fGRQs9mB0Nu7WPSBjoQK3TslePu
 ZRq7UHZyUyPwtAqBcXmomwIH1JH3RGEOwP8yyG/YiKQZGvvzdKN9memVEaXeti9uhsmX
 yMGFEGV+9fEDRDnOnBnKwEZLbTkIgUSruIXnytgfDDRF1zqk45IIpoFIS5XTLQlMc4S+
 aeVsxzJWpPLMPvUIdLSxUCNJDdWaV/hKd2vdgjKabMfkwLOpz2VR/4gA+5/6+H3sxiyk
 F93FmlBuYC7M4tXa+mB/6lwpstviHoQXIGJDnM7XkJ+C63V0wVqvFjf2vcjrwrDZO/m5
 t59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOdlws63Xw27l3OBBm6UODo1357OkyolVq1NsXP4HtE=;
 b=H6gF7UNCRCH5sLVgLgQteRcpCdyzvyhpJe3pwHxefAACvWoaRighLxEqYdpjc4F0sJ
 B90pRKKqTDjfifvkUkHWGOb8ltaoEiWrXEkrZlfkTzFvV4iUqMY7ePVmwCZdj1SRifDH
 2IaMUaqQFd6NGlYhg2iHqf382QzKMdcseGmTzSQonTpDwAcF0l4Jp2E0xn1ODUidY/0w
 dHQ3eqxCTGtAegUTltXcBO6SSVi1xXp9jV8UMrBNv+iWPznrwPYmRJmtPcFxpBfLzpC0
 5W1BM2d+j4+NxKjpBP4eXehw+IFxprABfYFA+kjophs+X/m5FKy/hdR+TNl86g1+LK7v
 t1/A==
X-Gm-Message-State: ACrzQf1UKzHjYIrpuS2Q0yQ+lY/3DP5gp7P+iVSZn3T89B0WuqrKJgED
 afNNKh5eeSw3Ky5/s8TycCCPFo5K8NkHoSvpQ1CqfA==
X-Google-Smtp-Source: AMsMyM4Cf3iPzfJZ2xaWs3g4NWoQ36j+UwXTZOGVYNhnC9/Q68qlMNdyFpfLxDHpQwopH4Opf633pfTpx4+Ei/78MkY=
X-Received: by 2002:a92:2601:0:b0:2fc:48be:e77a with SMTP id
 n1-20020a922601000000b002fc48bee77amr4477239ile.202.1665487658930; Tue, 11
 Oct 2022 04:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221010132300.96935-1-miguel.luis@oracle.com>
 <20221010132300.96935-3-miguel.luis@oracle.com>
 <CAARzgwxOxPqAGe76LS-ETpReGrCHvLQjHKvJUJ6AZCmCGMy6tg@mail.gmail.com>
 <6D761DCF-3713-4A16-8253-F2F1212B45C5@oracle.com>
In-Reply-To: <6D761DCF-3713-4A16-8253-F2F1212B45C5@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 11 Oct 2022 16:57:27 +0530
Message-ID: <CAARzgwxsyjkFua7=asn9CFj_+YvQ_GiUC1gWaLaBo_MBf64tcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] acpi: fadt: support revision 6.0 of the ACPI
 specification
To: Miguel Luis <miguel.luis@oracle.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "mst@redhat.com" <mst@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Oct 11, 2022 at 4:33 PM Miguel Luis <miguel.luis@oracle.com> wrote:
>
>
> > On 11 Oct 2022, at 05:02, Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Mon, Oct 10, 2022 at 6:53 PM Miguel Luis <miguel.luis@oracle.com> wr=
ote:
> >>
> >> Update the Fixed ACPI Description Table (FADT) to revision 6.0 of the =
ACPI
> >> specification adding the field "Hypervisor Vendor Identity" that was m=
issing.
> >>
> >> This field's description states the following: "64-bit identifier of h=
ypervisor
> >> vendor. All bytes in this field are considered part of the vendor iden=
tity.
> >> These identifiers are defined independently by the vendors themselves,
> >> usually following the name of the hypervisor product. Version informat=
ion
> >> should NOT be included in this field - this shall simply denote the ve=
ndor's
> >> name or identifier. Version information can be communicated through a
> >> supplemental vendor-specific hypervisor API. Firmware implementers wou=
ld
> >> place zero bytes into this field, denoting that no hypervisor is prese=
nt in
> >> the actual firmware."
> >>
> >> Hereupon, what should a valid identifier of an Hypervisor Vendor ID be=
 and
> >> where should QEMU provide that information?
> >>
> >> On the v1 [1] of this RFC there's the suggestion of having this inform=
ation
> >> in sync by the current acceleration name. This also seems to imply tha=
t QEMU,
> >> which generates the FADT table, and the FADT consumer need to be in sy=
nc with
> >> the values of this field.
> >>
> >> This version follows Ani Sinha's suggestion [2] of using "QEMU" for th=
e
> >> hypervisor vendor ID.
> >>
> >> [1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg00911=
.html
> >> [2]: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg00989=
.html
> >>
> >> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> >
> > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> >
>
> Thank you Ani. In the meanwhile, taking the description part of: =E2=80=
=9CFirmware
> implementers would place zero bytes into this field, denoting that no
> hypervisor is present in the actual firmware.", I reached to something al=
ong
> the lines below:

That line is meant for hardware vendors when shipping bioses with
physical HW. All VMs run with QEMU are run from a hypervisor
environment.

>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 42feb4d4d7..e719afe0cb 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2198,7 +2198,11 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, c=
onst AcpiFadtData *f,
>      }
>
>      /* Hypervisor Vendor Identity */
> -    build_append_padded_str(tbl, "QEMU", 8, '\0');
> +    if (f->hyp_is_present) {
> +        build_append_padded_str(tbl, "QEMU", 8, '\0');
> +    } else {
> +        build_append_int_noprefix(tbl, 0, 8);
> +    }
>
>      /* TODO: extra fields need to be added to support revisions above re=
v6 */
>      assert(f->rev =3D=3D 6);
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 72bb6f61a5..d238ce2b88 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -818,6 +818,7 @@ static void build_fadt_rev6(GArray *table_data, BIOSL=
inker *linker,
>          .minor_ver =3D 0,
>          .flags =3D 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
>          .xdsdt_tbl_offset =3D &dsdt_tbl_offset,
> +        .hyp_is_present =3D vms->virt && (kvm_enabled() || hvf_enabled()=
),
>      };
>
>      switch (vms->psci_conduit) {
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 2b42e4192b..2aff5304af 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -79,7 +79,7 @@ typedef struct AcpiFadtData {
>      uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
>      uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
>      uint8_t minor_ver;         /* FADT Minor Version */
> -
> +    bool hyp_is_present;
>      /*
>       * respective tables offsets within ACPI_BUILD_TABLE_FILE,
>       * NULL if table doesn't exist (in that case field's value
>
> Any thoughts on this?
>
> Thanks
> Miguel
>
> >> ---
> >> hw/acpi/aml-build.c      | 13 ++++++++++---
> >> hw/arm/virt-acpi-build.c | 10 +++++-----
> >> 2 files changed, 15 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >> index e6bfac95c7..42feb4d4d7 100644
> >> --- a/hw/acpi/aml-build.c
> >> +++ b/hw/acpi/aml-build.c
> >> @@ -2070,7 +2070,7 @@ void build_pptt(GArray *table_data, BIOSLinker *=
linker, MachineState *ms,
> >>     acpi_table_end(linker, &table);
> >> }
> >>
> >> -/* build rev1/rev3/rev5.1 FADT */
> >> +/* build rev1/rev3/rev5.1/rev6.0 FADT */
> >> void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f=
,
> >>                 const char *oem_id, const char *oem_table_id)
> >> {
> >> @@ -2193,8 +2193,15 @@ void build_fadt(GArray *tbl, BIOSLinker *linker=
, const AcpiFadtData *f,
> >>     /* SLEEP_STATUS_REG */
> >>     build_append_gas_from_struct(tbl, &f->sleep_sts);
> >>
> >> -    /* TODO: extra fields need to be added to support revisions above=
 rev5 */
> >> -    assert(f->rev =3D=3D 5);
> >> +    if (f->rev =3D=3D 5) {
> >> +        goto done;
> >> +    }
> >> +
> >> +    /* Hypervisor Vendor Identity */
> >> +    build_append_padded_str(tbl, "QEMU", 8, '\0');
> >> +
> >> +    /* TODO: extra fields need to be added to support revisions above=
 rev6 */
> >> +    assert(f->rev =3D=3D 6);
> >>
> >> done:
> >>     acpi_table_end(linker, &table);
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 9b3aee01bf..72bb6f61a5 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -809,13 +809,13 @@ build_madt(GArray *table_data, BIOSLinker *linke=
r, VirtMachineState *vms)
> >> }
> >>
> >> /* FADT */
> >> -static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
> >> +static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
> >>                             VirtMachineState *vms, unsigned dsdt_tbl_o=
ffset)
> >> {
> >> -    /* ACPI v5.1 */
> >> +    /* ACPI v6.0 */
> >>     AcpiFadtData fadt =3D {
> >> -        .rev =3D 5,
> >> -        .minor_ver =3D 1,
> >> +        .rev =3D 6,
> >> +        .minor_ver =3D 0,
> >>         .flags =3D 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
> >>         .xdsdt_tbl_offset =3D &dsdt_tbl_offset,
> >>     };
> >> @@ -945,7 +945,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBu=
ildTables *tables)
> >>
> >>     /* FADT MADT PPTT GTDT MCFG SPCR DBG2 pointed to by RSDT */
> >>     acpi_add_table(table_offsets, tables_blob);
> >> -    build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
> >> +    build_fadt_rev6(tables_blob, tables->linker, vms, dsdt);
> >>
> >>     acpi_add_table(table_offsets, tables_blob);
> >>     build_madt(tables_blob, tables->linker, vms);
> >> --
> >> 2.37.3
> >>
>

