Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A467FF51
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 14:16:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM7WV-0003aI-GU; Sun, 29 Jan 2023 08:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pM7WT-0003Za-EZ; Sun, 29 Jan 2023 08:15:05 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pM7WR-0007wF-72; Sun, 29 Jan 2023 08:15:04 -0500
Received: by mail-ej1-x62c.google.com with SMTP id mc11so2470805ejb.10;
 Sun, 29 Jan 2023 05:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLc//4Gi1/ulrIDEfSFgAfZ0uGdnWJyIdCzLXqwmkUo=;
 b=Pt5NTRVltfpk2KRDt6rdG/3gtbDT2hk8ThSIChlmx3pU9hIlhA0WWdQghxidC1o5nL
 UqkuOOoDnQSKv4DZITP95jkhng9xiACND/pT9rajGZMeQIbQeeDXktnm1FDFXS0Z20EM
 d8pdIrXWRoxVq4Ln9V8liooNkmnLNV9+piXPWsOUpuMF2K4bxa+h+V2jCTqpaTZisR3b
 smRXSA0s+pbBVboxdM11n6QC0zTjJJCSRJcJBOaxRIGZlH5FylcUtxGxuK1pdkaaR3q7
 jFg8n2wTf2oc6hm0Df/Y0zZlYuQCWjXMUEh4WrPF9Gr7PGUiRRZXqXI4281ssV6x2GJB
 mQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BLc//4Gi1/ulrIDEfSFgAfZ0uGdnWJyIdCzLXqwmkUo=;
 b=d3NEGeZdYP07Vv5prQUkIhkvxqmbzt0LGT2H77Fh1J5f3GzDhcw73zQ2DBbBdpWIlK
 USwd5j8fjKgWtyvKuuicY9/y9NTK8JFVqpVX4UhUxVurvUiLBVSsifE9vKXWFPDiC3he
 kh171AYCdTkuFEOoiO9mYfQu4rxQ/Ptw98MmEZZ9ircllUqGkkYovppT2RqzuEPSqNmp
 cdgFoztI5oLMwA4QbCo74zhWMQPaxCEYRRukFVs83kR0jLtjAcp302x70smlUNJSbzyn
 WIRgYPs1XB0DOYlx/lQ14S8JbGUSQsqQI3MuSZOzexITpA5WxFEA2bRfQI/HtlbcvAn6
 I4yw==
X-Gm-Message-State: AO0yUKXDgBBo8pwXo33tG9AIZeXGu1TePAyfVZ/8htwRMflbBbao2kOy
 ksowELWHt0GZkracNN4ehkU=
X-Google-Smtp-Source: AK7set83/XGvV57xN/8HwfZZPCD+zhtubvQNNHctCZAR4j1VAsRhpTRFIsqp0yhmKM0z8lb6Aubdpg==
X-Received: by 2002:a17:907:3e13:b0:881:4d98:fe2e with SMTP id
 hp19-20020a1709073e1300b008814d98fe2emr7996809ejc.29.1674998100914; 
 Sun, 29 Jan 2023 05:15:00 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf1ccd00f0485d6be37e2312.dip0.t-ipconnect.de.
 [2003:fa:af1c:cd00:f048:5d6b:e37e:2312])
 by smtp.gmail.com with ESMTPSA id
 sh39-20020a1709076ea700b007b4bc423b41sm5297415ejc.190.2023.01.29.05.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 05:15:00 -0800 (PST)
Date: Sun, 29 Jan 2023 13:14:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH 4/7] hw/i386/pc_q35: Resolve redundant q35_host variable
In-Reply-To: <0f328d9e-787c-bf8f-4f7f-caacca70a250@eik.bme.hu>
References: <20230127164718.98156-1-shentey@gmail.com>
 <20230127164718.98156-5-shentey@gmail.com>
 <0f328d9e-787c-bf8f-4f7f-caacca70a250@eik.bme.hu>
Message-ID: <7F5DBDBA-42A7-4EEC-B5CC-6D96B75231FF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 27=2E Januar 2023 19:22:49 UTC schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Fri, 27 Jan 2023, Bernhard Beschow wrote:
>> The variable is redundant to "phb" and is never used by its real type=
=2E
>
>Also replace qdev_get_machine() with reference already passed to init fun=
ction=2E (Maybe worth mentioning in commit message even if too small change=
 for a separate patch=2E)

Indeed, this can easily be missed=2E A separate patch allows for clean jus=
tification=2E

>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/i386/pc_q35=2Ec | 22 ++++++++++------------
>> 1 file changed, 10 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/hw/i386/pc_q35=2Ec b/hw/i386/pc_q35=2Ec
>> index 83c57c6eb1=2E=2Edc94ce1081 100644
>> --- a/hw/i386/pc_q35=2Ec
>> +++ b/hw/i386/pc_q35=2Ec
>> @@ -118,7 +118,6 @@ static void pc_q35_init(MachineState *machine)
>>     PCMachineState *pcms =3D PC_MACHINE(machine);
>>     PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
>>     X86MachineState *x86ms =3D X86_MACHINE(machine);
>> -    Q35PCIHost *q35_host;
>>     PCIHostState *phb;
>
>The phb variable itself is only used once to get the bus from it and it's=
 mostly cast to Object * so maybe store it in a variable of that type to re=
move most of the casts and IMO you can also remove PCIHostState *phb and ju=
st use:
>
>host_bus =3D PCI_HOST_BRIDGE(phost)->bus;

Maybe one could also fish out the PCI bus using qdev_get_child_bus() like =
we do in pc_piix for the ISA bus already=2E Hm=2E=2E=2E

Best regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>>     PCIBus *host_bus;
>>     PCIDevice *lpc;
>> @@ -206,10 +205,10 @@ static void pc_q35_init(MachineState *machine)
>>     }
>>=20
>>     /* create pci host bus */
>> -    q35_host =3D Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>> +    phb =3D PCI_HOST_BRIDGE(qdev_new(TYPE_Q35_HOST_DEVICE));
>>=20
>>     if (pcmc->pci_enabled) {
>> -        pci_hole64_size =3D object_property_get_uint(OBJECT(q35_host),
>> +        pci_hole64_size =3D object_property_get_uint(OBJECT(phb),
>>                                                    PCI_HOST_PROP_PCI_HO=
LE64_SIZE,
>>                                                    &error_abort);
>>     }
>> @@ -218,22 +217,21 @@ static void pc_q35_init(MachineState *machine)
>>     pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>>                    pci_hole64_size);
>>=20
>> -    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_ho=
st));
>> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>> +    object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
>> +    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_RAM_MEM,
>>                              OBJECT(ram_memory), NULL);
>> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
>> +    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_PCI_MEM,
>>                              OBJECT(pci_memory), NULL);
>> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_ME=
M,
>> +    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_SYSTEM_MEM,
>>                              OBJECT(get_system_memory()), NULL);
>> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
>> +    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_IO_MEM,
>>                              OBJECT(system_io), NULL);
>> -    object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SI=
ZE,
>> +    object_property_set_int(OBJECT(phb), PCI_HOST_BELOW_4G_MEM_SIZE,
>>                             x86ms->below_4g_mem_size, NULL);
>> -    object_property_set_int(OBJECT(q35_host), PCI_HOST_ABOVE_4G_MEM_SI=
ZE,
>> +    object_property_set_int(OBJECT(phb), PCI_HOST_ABOVE_4G_MEM_SIZE,
>>                             x86ms->above_4g_mem_size, NULL);
>>     /* pci */
>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(q35_host), &error_fatal);
>> -    phb =3D PCI_HOST_BRIDGE(q35_host);
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
>>     host_bus =3D phb->bus;
>>     /* create ISA bus */
>>     lpc =3D pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LP=
C_DEV,
>>=20

