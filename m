Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE18611758
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:17:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooS1K-0005LX-IW; Fri, 28 Oct 2022 12:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooS13-0005HZ-0V; Fri, 28 Oct 2022 12:15:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooS0z-0007Pd-OF; Fri, 28 Oct 2022 12:15:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id k8so7243516wrh.1;
 Fri, 28 Oct 2022 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9hq9o6NxFEyg2gpljDDY2TxXkQ6qvo5TmUtxPOEhWo=;
 b=D7gnQY2a1S4Z2hAEFhnDbtm4BEnmZF9MQ6F6q7SYHDqCOVAFlMpWvQ3CK6HeXbzE70
 T0Ccq2cN0yS1+BFy8jbe/7gRipNsGtaycP+IRXdL9AOsWs0eiSIgkV7QH2mRZzNnc6MX
 501xoT9b9mV+wxzzOiR1zJvHIbx17BfLrXg0OMscg77zf3PEJsJn7O0Ijr18pgUUPhCq
 a3oC2kom22gfZY6/SSTIS1bODyXBOiEk3RRN718oPKQVTKdQf1ky9Yfywg1r+ONwA3m0
 2R7ukXeRmAJSQraVV/mbTE6x1xJG/ASa4gujiT0BAY7GyByQM0vg8wB2FXYp0+P0NI36
 QedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9hq9o6NxFEyg2gpljDDY2TxXkQ6qvo5TmUtxPOEhWo=;
 b=wQrg7YR0IHJ5l/C3qFZN+cewb8Nh9QRRn/SukR9PiE877d2zuQcOukcxvLns9A3IfO
 zlsm7FP9KOMbOfikFxsp/WaYDb8BWaUMJABygg4btyZGr8KYTp6cc3gM6YW+xg4knVFO
 J6k94HPN3y1J8iSLV/u46rs+LlJcLVzxKplojuUbIYioPckuR9VelDYTN1xuBuRvDFwr
 ZOVMsmjBNHVPRGMrOgty6qJkzue8lZ9VekLDTA0NKR1WBpYxlDXOX2iL6zq7igD0zo85
 slgjIASN3aPc9RQOnBkvCggr9GLYJKUb/tCeUhM1cHItx1jnxxV3ATdKIpr3wPvGkhhZ
 zNLA==
X-Gm-Message-State: ACrzQf3DbkQblI5HLjSMidnmoZkVW2pgIbLA5ug+UP4j8RaUJQ91zFL9
 y4otY2qNiT4sbGyQJONteLY=
X-Google-Smtp-Source: AMsMyM7M0C5lr+VBbRCJb640hcEkiqHTECVDOFy47xxPGp8ySfAWSo33i5o2fHDiFRSUGQLsC0cGvw==
X-Received: by 2002:a5d:4143:0:b0:236:4b40:bbd1 with SMTP id
 c3-20020a5d4143000000b002364b40bbd1mr99403wrq.26.1666973722944; 
 Fri, 28 Oct 2022 09:15:22 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200bd2f89c083d9cbe6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:bd2f:89c0:83d9:cbe6])
 by smtp.gmail.com with ESMTPSA id
 a9-20020adffb89000000b0022cc0a2cbecsm3993633wrr.15.2022.10.28.09.15.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Oct 2022 09:15:21 -0700 (PDT)
Date: Fri, 28 Oct 2022 16:15:18 +0000
From: B <shentey@gmail.com>
To: Ani Sinha <ani@anisinha.ca>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/3=5D_hw/i386/acpi-build=3A_?=
 =?US-ASCII?Q?Resolve_north_rather_than_south_bridges?=
In-Reply-To: <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
 <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
Message-ID: <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 28=2E Oktober 2022 10:58:07 UTC schrieb Ani Sinha <ani@anisinha=2Eca>:
>On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail=2Ecom> wr=
ote:
>>
>> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX=2E Now that=
 more
>> AML generation has been moved into the south bridges and since the
>> machines define themselves primarily through their north bridges, let's
>> switch to resolving the north bridges for AML generation instead=2E Thi=
s
>> also allows for easier experimentation with different south bridges in
>> the "pc" machine, e=2Eg=2E with PIIX4 and VT82xx=2E
>
>Unfortunately this patch does not apply on the latest master=2E Also the
>code seems to be off=2E Can you rebase and rework the patch?

I've rebased onto Igor's series to avoid merge conflicts, that's why it do=
esn't apply onto master=2E It applies fine there [1]=2E

The first two patches of this series apply fine on both branches, so could=
 possibly be pulled already if Igor's series doesn't make it for 7=2E2=2E

Best regards,
Bernhard

[1] https://github=2Ecom/patchew-project/qemu/commits/patchew/202210281034=
19=2E93398-1-shentey%40gmail=2Ecom
>
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/i386/acpi-build=2Ec | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>> index 73d8a59737=2E=2Ed9eaa5fc4d 100644
>> --- a/hw/i386/acpi-build=2Ec
>> +++ b/hw/i386/acpi-build=2Ec
>> @@ -60,6 +60,7 @@
>>  #include "hw/i386/fw_cfg=2Eh"
>>  #include "hw/i386/ich9=2Eh"
>>  #include "hw/pci/pci_bus=2Eh"
>> +#include "hw/pci-host/i440fx=2Eh"
>>  #include "hw/pci-host/q35=2Eh"
>>  #include "hw/i386/x86-iommu=2Eh"
>>
>> @@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
>>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
>>  {
>> -    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX4_PM);
>> -    Object *lpc =3D object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVI=
CE);
>> +    Object *i440fx =3D object_resolve_type_unambiguous(TYPE_I440FX_PCI=
_HOST_BRIDGE);
>> +    Object *q35 =3D object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVI=
CE);
>>      CrsRangeEntry *entry;
>>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
>>      CrsRangeSet crs_range_set;
>> @@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,
>>      AcpiTable table =3D { =2Esig =3D "DSDT", =2Erev =3D 1, =2Eoem_id =
=3D x86ms->oem_id,
>>                          =2Eoem_table_id =3D x86ms->oem_table_id };
>>
>> -    assert(!!piix !=3D !!lpc);
>> +    assert(!!i440fx !=3D !!q35);
>>
>>      acpi_table_begin(&table, table_data);
>>      dsdt =3D init_aml_allocator();
>>
>>      build_dbg_aml(dsdt);
>> -    if (piix) {
>> +    if (i440fx) {
>>          sb_scope =3D aml_scope("_SB");
>>          dev =3D aml_device("PCI0");
>>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
>> @@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>>          }
>>          build_piix4_pci0_int(dsdt);
>> -    } else if (lpc) {
>> +    } else if (q35) {
>>          sb_scope =3D aml_scope("_SB");
>>          dev =3D aml_device("PCI0");
>>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
>> --
>> 2=2E38=2E1
>>

