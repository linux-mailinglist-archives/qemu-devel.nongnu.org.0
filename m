Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0C6141EF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 00:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opeRX-0006wo-7o; Mon, 31 Oct 2022 19:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opeRV-0006wY-JB; Mon, 31 Oct 2022 19:43:45 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opeRT-0004bC-AY; Mon, 31 Oct 2022 19:43:45 -0400
Received: by mail-ej1-x635.google.com with SMTP id sc25so33226196ejc.12;
 Mon, 31 Oct 2022 16:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6QoMYyVG1u2s5ej8vNUTXSxLZSymV3VORq+cT6XRhk=;
 b=fl1DfyNJ+JOmcGXrlDJFOslpyIirrSjWcOekVyyuEdtInWnNKzgmYFarPPEKYrC0D1
 rwrhls/J0Zm0HIEu/dkn59IsGEzLVIlbvp1RIiq2pD0hHCmyh0RF44SFMoRQgohidWCI
 Z8ErGf/jg/AVy9hhndoAHTSx8YzLZtLN2hbjPP8HKMRS3gMDUe5ggFpKMUc+eZFeYv8J
 Q3Gpj7zKEyLLj45teFjh+af35p0QdVjL3zvffYtzESUsOiSENwKsJVvmEE2KCnTXc8q+
 821oh5vVapvxz69BCOsWD1XGKRYrtdc2IPu+/xuno03/V45dBiJzTlICYvoIs3zPkQZB
 s09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6QoMYyVG1u2s5ej8vNUTXSxLZSymV3VORq+cT6XRhk=;
 b=EGjEc0W/AnAkc8Uplna8jrGv/jCGlY94PRRqdmBDxgIt6XzxvbHYmt2GXBtp4C7ghB
 Vt53cyBJAlFRXV7bG7+VRV0w8zIan8i5ut777EYyUaqQxlQXTTHUXujyLPSVs5KIXijk
 fCJjxUNqUNyyOoOde/NQfdTwRWSQqTdMBAZfsZgZZzarGrKGiLt320ZS65vN85vnkuWX
 TE21KXul9Gzp8ALWVRCq3B+H2EYXxHnXdggpRw/x25do+fO00w4Cs25J2pnZSKdt4hCQ
 EO2By4p6WuRKTtQ/+nVjHzctTGIF5cOMTnc1DQn7nau2p23UCeNZ06BgybSlUIBa5Okr
 wXIQ==
X-Gm-Message-State: ACrzQf3sqeOS7fVmWuNmuy+XT8/4tEla2VqNzYixSx+037nzWQeghoYR
 3J/jnFfY38y1Smg3de3uUOA=
X-Google-Smtp-Source: AMsMyM4+iksZLQJOr5+qre19TbkNLLeAp8K9yRAaQ27yJjw8bVtBvLxqGm9zrvrX/ntJULHLgiBcYQ==
X-Received: by 2002:a17:906:9b8e:b0:791:8f57:6845 with SMTP id
 dd14-20020a1709069b8e00b007918f576845mr15846402ejc.174.1667259820068; 
 Mon, 31 Oct 2022 16:43:40 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200c599d3f0ae19b198.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:c599:d3f0:ae19:b198])
 by smtp.gmail.com with ESMTPSA id
 ef13-20020a05640228cd00b0046146c730easm3738895edb.75.2022.10.31.16.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 16:43:39 -0700 (PDT)
Date: Mon, 31 Oct 2022 23:43:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/i386/acpi-build: Resolve redundant attribute
In-Reply-To: <20221031134045-mutt-send-email-mst@kernel.org>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-3-shentey@gmail.com> <20221031134529.5f7250ce@fedora>
 <20221031134045-mutt-send-email-mst@kernel.org>
Message-ID: <68B3719F-9D63-42F9-9742-53B977BCB7EC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Am 31=2E Oktober 2022 17:41:59 UTC schrieb "Michael S=2E Tsirkin" <mst@redh=
at=2Ecom>:
>On Mon, Oct 31, 2022 at 01:45:29PM +0100, Igor Mammedov wrote:
>> On Fri, 28 Oct 2022 12:34:18 +0200
>> Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>>=20
>> > The is_piix4 attribute is set once in one location and read once in
>> > another=2E Doing both in one location allows for removing the attribu=
te
>> > altogether=2E
>>=20
>> we also test for piix4 in acpi_get_pm_info(),
>> Perhaps we should move is_piix4 to AcpiPmInfo
>> and reuse it in build_dsdt()?
>> Also should use is_piix4 as argument to build_iqcr_method()
>> to make its call places self documenting=2E But that's another patch=2E
>
>Well I picked this up for pull req since i had to make
>a decision before freeze=2E  But sure, a cleanup like
>this might even be acceptable before rc1 I think=2E
>Bernhard?

In my pc-via branch which I have linked to in the cover letter I'm adding =
support for the VT82xx south bridges to the "pc" machine (currently hardcod=
ed, should be configurable in the future)=2E There I'm adding support for a=
 third pm controller in acpi_get_pm_info() [1]=2E So a boolean is_piix4 is =
not sufficient any longer=2E

Furthermore, build_dsdt() does have code which is specific to the north br=
idges=2E So
I think it makes sense to distinguish between the pm controllers and the n=
orth bridges=2E Otherwise one would make assumptions that certain north and=
 south bridges always go together, which gets into the way of experimenting=
 with (and possibly upstreaming support for) new south bridges in the "pc" =
machine=2E

I hope that I decently brought across my motivation=2E Let me know if you =
have any further questions=2E

Best regards,
Bernhard

[1] https://github=2Ecom/shentok/qemu/commit/4815ae28788ce249cc30d7a153180=
5c5988ffcf6

>
>>=20
>> > Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> > Message-Id: <20221026133110=2E91828-3-shentey@gmail=2Ecom>
>> > ---
>> >  hw/i386/acpi-build=2Ec | 20 ++++++--------------
>> >  1 file changed, 6 insertions(+), 14 deletions(-)
>> >=20
>> > diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>> > index 1ebf14b899=2E=2E73d8a59737 100644
>> > --- a/hw/i386/acpi-build=2Ec
>> > +++ b/hw/i386/acpi-build=2Ec
>> > @@ -112,7 +112,6 @@ typedef struct AcpiPmInfo {
>> >  } AcpiPmInfo;
>> > =20
>> >  typedef struct AcpiMiscInfo {
>> > -    bool is_piix4;
>> >      bool has_hpet;
>> >  #ifdef CONFIG_TPM
>> >      TPMVersion tpm_version;
>> > @@ -281,17 +280,6 @@ static void acpi_get_pm_info(MachineState *machi=
ne, AcpiPmInfo *pm)
>> > =20
>> >  static void acpi_get_misc_info(AcpiMiscInfo *info)
>> >  {
>> > -    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX4_PM);
>> > -    Object *lpc =3D object_resolve_type_unambiguous(TYPE_ICH9_LPC_DE=
VICE);
>> > -    assert(!!piix !=3D !!lpc);
>> > -
>> > -    if (piix) {
>> > -        info->is_piix4 =3D true;
>> > -    }
>> > -    if (lpc) {
>> > -        info->is_piix4 =3D false;
>> > -    }
>>=20
>> ack for this hunk
>>=20
>> >      info->has_hpet =3D hpet_find();
>> >  #ifdef CONFIG_TPM
>> >      info->tpm_version =3D tpm_get_version(tpm_find());
>> > @@ -1334,6 +1322,8 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,
>> >             AcpiPmInfo *pm, AcpiMiscInfo *misc,
>> >             Range *pci_hole, Range *pci_hole64, MachineState *machine=
)
>> >  {
>> > +    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX4_PM);
>> > +    Object *lpc =3D object_resolve_type_unambiguous(TYPE_ICH9_LPC_DE=
VICE);
>> >      CrsRangeEntry *entry;
>> >      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
>> >      CrsRangeSet crs_range_set;
>> > @@ -1354,11 +1344,13 @@ build_dsdt(GArray *table_data, BIOSLinker *li=
nker,
>> >      AcpiTable table =3D { =2Esig =3D "DSDT", =2Erev =3D 1, =2Eoem_id=
 =3D x86ms->oem_id,
>> >                          =2Eoem_table_id =3D x86ms->oem_table_id };
>> > =20
>> > +    assert(!!piix !=3D !!lpc);
>> > +
>> >      acpi_table_begin(&table, table_data);
>> >      dsdt =3D init_aml_allocator();
>> > =20
>> >      build_dbg_aml(dsdt);
>> > -    if (misc->is_piix4) {
>> > +    if (piix) {
>> >          sb_scope =3D aml_scope("_SB");
>> >          dev =3D aml_device("PCI0");
>> >          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03"))=
);
>> > @@ -1371,7 +1363,7 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,
>> >              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>> >          }
>> >          build_piix4_pci0_int(dsdt);
>> > -    } else {
>> > +    } else if (lpc) {
>> >          sb_scope =3D aml_scope("_SB");
>> >          dev =3D aml_device("PCI0");
>> >          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08"))=
);
>


