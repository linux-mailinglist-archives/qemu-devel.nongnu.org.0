Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601BA67FE91
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 12:29:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM5rb-000062-PS; Sun, 29 Jan 2023 06:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pM5rZ-0008Vf-RB; Sun, 29 Jan 2023 06:28:45 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pM5rY-0007ig-2y; Sun, 29 Jan 2023 06:28:45 -0500
Received: by mail-ej1-x62d.google.com with SMTP id dr8so2983141ejc.12;
 Sun, 29 Jan 2023 03:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6zS27J37N2UUmxweePAIef88yb41ylNyxj2Tvro/HA8=;
 b=LhEpHZnfMN9wtWyXGmVdcJc6ucQqr/xwYfxOSATNnqx8WmoCWSKrnGQ40teVnfM5nB
 BVo9vFNaTXl5az3tzpVgarF7p8TC3gn2gGFjz1FmfHr1MAF/I+h2EfE06Byx+ikLg7yi
 vv/Lrx3w8uXOrYls0DBggxLbHjfnX7pqbH5h6U5W5b/JOKr3EHadbgh89VinYkTZqDkT
 fxoSg8fXmkcVij4BdNtbimJrHasZtMg4KYbNQyUyjcReNNkhcgVSZm0JgB+kmAxP50pP
 014N0rQx/qiRtegzkW3eaVm9Fq6BkDeWkhSftu4k0eyBcepuuNU5t1oJeiy3pIKn0Y//
 GR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6zS27J37N2UUmxweePAIef88yb41ylNyxj2Tvro/HA8=;
 b=IcxbgXSAjMma/QD8adJXHhcNQzwCLZs4bsgezmZsVhxgRzn/AWohLQ7frrlcVRzuwk
 iAj3XYp85DH9/T3sUG3i76fJMtGKgQruYXOkK/Spx5XSPmv2SKb4BiwGA3AXwmgnsBJE
 7yGXpuIDbu1C/Jby15wLQ+Gejo6Qdv+l1TFx+EJ7VGSPoJMXy8F4qZCOe8uu6mpOYD5I
 1cxb3gD0248D+497y6UYik18OKQsoSDKaHqqKdFLj4uHHL+as0dCDlY5F1Mhr4EYVH+0
 ZnF2K7Ru72AbEh3M5ICs8GG1zPyBWtdO/N5G7EWxlixNM0+CY2MTFA8JUWYE7lJL3Czy
 pUaw==
X-Gm-Message-State: AO0yUKU7njvcqZCCZVbCxLhgB60pXYNcJKWrRMqW7H3ialcZ8sMNBC6n
 79yUaSz6oTvu5Eo+YsylfVU=
X-Google-Smtp-Source: AK7set/5CLka6uGOYmSjmoODWEahFE6F3BqdlcCveZtsFFWcRSp77UDwfqTCrttVnz3OUpL6B/haBg==
X-Received: by 2002:a17:906:168a:b0:87d:f3e2:7f4d with SMTP id
 s10-20020a170906168a00b0087df3e27f4dmr7727138ejd.25.1674991721703; 
 Sun, 29 Jan 2023 03:28:41 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf1ccd00f0485d6be37e2312.dip0.t-ipconnect.de.
 [2003:fa:af1c:cd00:f048:5d6b:e37e:2312])
 by smtp.gmail.com with ESMTPSA id
 kx8-20020a170907774800b0087221268e49sm279400ejc.186.2023.01.29.03.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 03:28:41 -0800 (PST)
Date: Sun, 29 Jan 2023 11:28:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_6/7=5D_hw/i386/pc=5F=7Bq35=2C_piix=7D?=
 =?US-ASCII?Q?=3A_Minimize_usage_of_get=5Fsystem=5Fmemory=28=29?=
In-Reply-To: <6858e30b-cd88-0ba3-e64e-0657786f8c55@eik.bme.hu>
References: <20230127164718.98156-1-shentey@gmail.com>
 <20230127164718.98156-7-shentey@gmail.com>
 <6858e30b-cd88-0ba3-e64e-0657786f8c55@eik.bme.hu>
Message-ID: <C4665294-4BAA-42E4-842D-807993762B30@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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



Am 27=2E Januar 2023 19:30:21 UTC schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Fri, 27 Jan 2023, Bernhard Beschow wrote:
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>Why? I'd rather replace locals with direct call to function as it's not e=
xpensive (just returns a global) and adding a local name to it is not much =
shorter so why do that?

The function has the assumption baked in to return a global which I'd like=
 to factor out into a single variable assignment=2E This allows for easier =
experimentation with alternatives to global variables=2E

Moreover, extrating to a single variable mirrors how similar things are do=
ne in the pc and q35 machines=2E

Best regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>> ---
>> hw/i386/pc_piix=2Ec | 2 +-
>> hw/i386/pc_q35=2Ec  | 7 ++++---
>> 2 files changed, 5 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>> index ee9d9a4175=2E=2E5bde4533cc 100644
>> --- a/hw/i386/pc_piix=2Ec
>> +++ b/hw/i386/pc_piix=2Ec
>> @@ -241,7 +241,7 @@ static void pc_init1(MachineState *machine,
>>         isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa=2E0"=
));
>>     } else {
>>         pci_bus =3D NULL;
>> -        isa_bus =3D isa_bus_new(NULL, get_system_memory(), system_io,
>> +        isa_bus =3D isa_bus_new(NULL, system_memory, system_io,
>>                               &error_abort);
>>         i8257_dma_init(isa_bus, 0);
>>         pcms->hpet_enabled =3D false;
>> diff --git a/hw/i386/pc_q35=2Ec b/hw/i386/pc_q35=2Ec
>> index a97846ab9b=2E=2Eb97979bebb 100644
>> --- a/hw/i386/pc_q35=2Ec
>> +++ b/hw/i386/pc_q35=2Ec
>> @@ -124,6 +124,7 @@ static void pc_q35_init(MachineState *machine)
>>     DeviceState *lpc_dev;
>>     BusState *idebus[MAX_SATA_PORTS];
>>     ISADevice *rtc_state;
>> +    MemoryRegion *system_memory =3D get_system_memory();
>>     MemoryRegion *system_io =3D get_system_io();
>>     MemoryRegion *pci_memory;
>>     MemoryRegion *rom_memory;
>> @@ -191,7 +192,7 @@ static void pc_q35_init(MachineState *machine)
>>         rom_memory =3D pci_memory;
>>     } else {
>>         pci_memory =3D NULL;
>> -        rom_memory =3D get_system_memory();
>> +        rom_memory =3D system_memory;
>>     }
>>=20
>>     pc_guest_info_init(pcms);
>> @@ -214,7 +215,7 @@ static void pc_q35_init(MachineState *machine)
>>     }
>>=20
>>     /* allocate ram and load rom/bios */
>> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>> +    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
>>                    pci_hole64_size);
>>=20
>>     object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
>> @@ -223,7 +224,7 @@ static void pc_q35_init(MachineState *machine)
>>     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_PCI_MEM,
>>                              OBJECT(pci_memory), NULL);
>>     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_SYSTEM_MEM,
>> -                             OBJECT(get_system_memory()), NULL);
>> +                             OBJECT(system_memory), NULL);
>>     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_IO_MEM,
>>                              OBJECT(system_io), NULL);
>>     object_property_set_int(OBJECT(phb), PCI_HOST_BELOW_4G_MEM_SIZE,
>>=20

