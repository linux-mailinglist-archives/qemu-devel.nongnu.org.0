Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2864ED9B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:10:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CLw-0008FH-7k; Fri, 16 Dec 2022 10:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6CLn-0008C5-Rq; Fri, 16 Dec 2022 10:10:19 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6CLk-0005DO-Je; Fri, 16 Dec 2022 10:10:14 -0500
Received: by mail-ej1-x62e.google.com with SMTP id x22so6771903ejs.11;
 Fri, 16 Dec 2022 07:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNVkcFL1T50NqqZmp1BJpZ/FkJxR1qwFv0QdSdOJsHs=;
 b=jK1ihxjKlthcu5Kee4Rg/J4WLGA1XLCJ6RjByOL77oGjvkgKT+9iHiRw1TbxMrMOBn
 NRFDnnxzssf8Xui2lzqFzCVtasmO9OvhjbCvOFkXN2RK5Q+lLEaWr8VIKlGrEFo6FCgb
 WQxVNkT75vEXxSEycXaUUPu8UGWIa605lCg86rElLQE6/2R5ObPZ5z/n40y3ghiaj/dQ
 bbx3A9bj11IDu7Oq8Q1ehdDRUjRrM4DZdBIDtczAupu4UZvMDHt1vhfU/0HaHsQSbEUK
 7wZqUYiZ3GMSga7qqELe2TL8SeTVMBAg10UFPjpOogBRnv1TQV1aEWIEOrNOzRo1mCng
 m/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNVkcFL1T50NqqZmp1BJpZ/FkJxR1qwFv0QdSdOJsHs=;
 b=U140eU6ZM8QOmi2Rws6rNw66dXRY1dg4avBWkw1YPYHviXZQxBTEorTBofW3QolWWk
 MIt3/GOCKUkbrzW8JgsWlm5vwdTEAFslsy13FecRHkfT8NFR4aDxA2hRB83G2AOXU+c6
 c8ioLLx99exapuug0i1W259k7XXf9fW11wxo9VmYmbUifohvzFHuvhdpw2bqvKy5lQhE
 p2QWsrII8FRV41IhBR+gTVO2x+q5PAeApskLY22VqqiyqKh5tckqHQorYDTERyKarh+j
 6Kz2GN6+/q7bbkuQ3k5bGqZXfMON0wt21cl/857z/acOUUB5S2NgBFYtRTLQdkYEvbS5
 Pu3Q==
X-Gm-Message-State: ANoB5pl7BdGMLolbhSz2AOexb/hBpNXRk73kKpn4MDc1TVLsBCuSJiMh
 R6bc/bOuWhxHHVgzhWdF+sk=
X-Google-Smtp-Source: AA0mqf4jGLdKNjwMQxjuNWiF94+q2g4ZLVH0jAZ1HbxVqKyrXajQEbFPuPk8jjOjfEjGvYQTvXQkrQ==
X-Received: by 2002:a17:906:f247:b0:7c1:7669:629 with SMTP id
 gy7-20020a170906f24700b007c176690629mr17218899ejb.49.1671203410180; 
 Fri, 16 Dec 2022 07:10:10 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-138-012.78.55.pool.telefonica.de.
 [78.55.138.12]) by smtp.gmail.com with ESMTPSA id
 g17-20020a17090604d100b007c0f5d6f754sm941451eja.79.2022.12.16.07.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 07:10:09 -0800 (PST)
Date: Fri, 16 Dec 2022 15:10:00 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/7=5D_hw/acpi/Kconfig=3A_Do_not_needle?=
 =?US-ASCII?Q?ssly_build_TYPE=5FPIIX4=5FPM_in_non-PC/Malta_machines?=
In-Reply-To: <af5b497b-c0ff-0d08-d37b-6eeea23b3e3d@eik.bme.hu>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-4-shentey@gmail.com>
 <af5b497b-c0ff-0d08-d37b-6eeea23b3e3d@eik.bme.hu>
Message-ID: <DED1A578-48EA-40E8-8A85-83C7B84280DA@gmail.com>
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



Am 16=2E Dezember 2022 14:44:33 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>On Fri, 16 Dec 2022, Bernhard Beschow wrote:
>> TYPE_PIIX4_PM is only used in machines where PIIX chipsets are used
>> which is currently PC and Malta=2E There is no point building it for th=
e
>> other ACPI_X86 machines=2E
>>=20
>> Note that this also removes unneeded ACPI_PIIX4 from PEGASOS2=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>Reviewed-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>
>Isn't 440fx using PIIX3 whereas Malta uses PIIX4?

Correct=2E

> If so there may be still some inconsistency in the naming of this config=
 option (should it be ACPI_PIIX maybe?)

I440fx does indeed use the PIIX4 PM controller, often referred to as a "Fr=
ankenstein" device here on the list=2E That's why I'm currently consolidati=
ng the PIIX south bridges -- to make PIIX4 bridge usable in i440fx machine=
=2E

Best regards,
Bernhard

> but it should not be needed for pegasos2 in any case=2E
>
>Regards,
>BALATON Zoltan
>
>> ---
>> hw/acpi/Kconfig | 1 -
>> hw/i386/Kconfig | 1 +
>> 2 files changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
>> index 704cbc6236=2E=2Eb7006e18c8 100644
>> --- a/hw/acpi/Kconfig
>> +++ b/hw/acpi/Kconfig
>> @@ -9,7 +9,6 @@ config ACPI_X86
>>     select ACPI_CPU_HOTPLUG
>>     select ACPI_MEMORY_HOTPLUG
>>     select ACPI_HMAT
>> -    select ACPI_PIIX4
>>     select ACPI_PCIHP
>>     select ACPI_ERST
>>=20
>> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
>> index d22ac4a4b9=2E=2E3a92566701 100644
>> --- a/hw/i386/Kconfig
>> +++ b/hw/i386/Kconfig
>> @@ -69,6 +69,7 @@ config I440FX
>>     imply E1000_PCI
>>     imply VMPORT
>>     imply VMMOUSE
>> +    select ACPI_PIIX4
>>     select PC_PCI
>>     select PC_ACPI
>>     select ACPI_SMBUS
>>=20

