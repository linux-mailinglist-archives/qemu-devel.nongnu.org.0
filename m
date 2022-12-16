Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1047064EDBB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:20:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CUI-0006Ny-DL; Fri, 16 Dec 2022 10:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6CTd-0006HF-5k; Fri, 16 Dec 2022 10:18:42 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6CTb-0007KW-2n; Fri, 16 Dec 2022 10:18:20 -0500
Received: by mail-ej1-x62e.google.com with SMTP id m18so6911034eji.5;
 Fri, 16 Dec 2022 07:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZD+9041HTnKLAqKWdAhfJqN3f/KIi+0PBygbsmCMeWk=;
 b=kaaUmWwXjZkbuC7tXzNf4E2SgoADXDrTk3WFJIbENoeN7cvqPiII7fmmjQxDwPjL1V
 On3wVzf4Zyq10KmPviKA1Lbl3dP8Bh6nxO3XB1BK5NeXcoyKl4lTdp5dmBGEwDScT/Jz
 b6J9R8VphHvdPbPX1GYspcFEaPciMicxuI+9u1KiN52iJ5FbghSuv+KZeflIenstmNwz
 qSbRtoPUrrHackL2Ltoz1iDPvj4AcUk6tiZpzyei0ELfiF98AEhg8tUuERpg0Ooni2Mh
 g7EA5ZcSgyANuDWHTG1pZ18kwgMXBKeFLBaKtOjoJHMG9mvfmz5l4cbgZ6QPW+w18bZn
 dtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZD+9041HTnKLAqKWdAhfJqN3f/KIi+0PBygbsmCMeWk=;
 b=E2F9lFKmvFG+6PsJr53vhPog/786yYRutT8pav+DTkYtkm6QhvtSDecMiQ9ZaxptXq
 Eq1F6KQGBLepb2lqc08jvcs+Pp3XMBjhlTAduSbwbh+q/mMLSroEo7HQQARBZpEA63AI
 p5RbxLqhGHLFQ4RnBh4qPosi0hWrYX61Owq1NU+ny06Kse3exHkG458YbJ+C7t+5kZg1
 Lix2hAUxDtuVuT0Y/6KaC9gMkXpqMyHYiWbnIupXhIFGnhnwgoK9tOuhcmpKQ6eYpe6k
 VRoZ/9oFR4AFEWseunr7DQ8fRq7zYuHdADSqZxD1q0QVLjGpJTlsginArDrPWVfP4c48
 R75A==
X-Gm-Message-State: ANoB5pk/quhrUIxNkw6mtXdusAmcbcHZH93blqRS1YVtzuGAk6b4SgEp
 i8PvjPeJ17QNTJDD8TGjwpI=
X-Google-Smtp-Source: AA0mqf7HtN0+FVhZb+FIdEhmAKWbSDxGjM7rV9wTfDbjiqkkVwb9DeQlR83hQZ0DxF4UYNwKMUiNtA==
X-Received: by 2002:a17:907:9018:b0:7c0:e988:4157 with SMTP id
 ay24-20020a170907901800b007c0e9884157mr22686649ejc.40.1671203893933; 
 Fri, 16 Dec 2022 07:18:13 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-138-012.78.55.pool.telefonica.de.
 [78.55.138.12]) by smtp.gmail.com with ESMTPSA id
 r19-20020a170906281300b007b790c18264sm937679ejc.159.2022.12.16.07.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 07:18:13 -0800 (PST)
Date: Fri, 16 Dec 2022 15:18:06 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_6/7=5D_i386=2C_mips=3A_Resolv?=
 =?US-ASCII?Q?e_redundant_ACPI_and_APM_dependencies?=
In-Reply-To: <773f556a-5fee-b4c7-93af-3cf1b607858a@eik.bme.hu>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-7-shentey@gmail.com>
 <773f556a-5fee-b4c7-93af-3cf1b607858a@eik.bme.hu>
Message-ID: <1856CA06-FA2C-4A5C-A5DA-6355CE9EED6B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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



Am 16=2E Dezember 2022 14:48:05 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>On Fri, 16 Dec 2022, Bernhard Beschow wrote:
>> Now that all ACPI controllers select the ACPI and APM dependencies
>> themselves, these explicit dependencies became redundant=2E Remove them=
=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> configs/devices/mips-softmmu/common=2Emak | 3 ---
>> hw/i386/Kconfig                         | 2 --
>> 2 files changed, 5 deletions(-)
>>=20
>> diff --git a/configs/devices/mips-softmmu/common=2Emak b/configs/device=
s/mips-softmmu/common=2Emak
>> index 416161f833=2E=2E88aff94625 100644
>> --- a/configs/devices/mips-softmmu/common=2Emak
>> +++ b/configs/devices/mips-softmmu/common=2Emak
>> @@ -17,9 +17,7 @@ CONFIG_I8254=3Dy
>> CONFIG_PCSPK=3Dy
>> CONFIG_PCKBD=3Dy
>> CONFIG_FDC=3Dy
>> -CONFIG_ACPI=3Dy
>> CONFIG_ACPI_PIIX4=3Dy
>> -CONFIG_APM=3Dy
>> CONFIG_I8257=3Dy
>> CONFIG_PIIX4=3Dy
>> CONFIG_IDE_ISA=3Dy
>> @@ -32,6 +30,5 @@ CONFIG_MIPS_ITU=3Dy
>> CONFIG_MALTA=3Dy
>> CONFIG_PCNET_PCI=3Dy
>> CONFIG_MIPSSIM=3Dy
>> -CONFIG_ACPI_SMBUS=3Dy
>> CONFIG_SMBUS_EEPROM=3Dy
>> CONFIG_TEST_DEVICES=3Dy
>> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
>> index 3a92566701=2E=2Ec4fb5b49bd 100644
>> --- a/hw/i386/Kconfig
>> +++ b/hw/i386/Kconfig
>> @@ -51,7 +51,6 @@ config PC_PCI
>>     bool
>>     select APIC
>>     select IOAPIC
>> -    select APM
>>     select PC
>>=20
>> config PC_ACPI
>> @@ -72,7 +71,6 @@ config I440FX
>>     select ACPI_PIIX4
>>     select PC_PCI
>>     select PC_ACPI
>> -    select ACPI_SMBUS
>>     select PCI_I440FX
>>     select PIIX3
>>     select IDE_PIIX
>>=20
>
>Is select APM now redundant in VT82686 too?

No it's not, quite the opposite indeed: APM is provided by the VT82686 sou=
th bridge, so it needs to select it=2E See also patches 2 and 4 of this ser=
ies for futher explanation=2E

The idea of this patch is to remove the redundant selections from the boar=
ds=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan

