Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1564C65F14D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTFk-0004VT-Ck; Thu, 05 Jan 2023 11:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDTFi-0004Um-IY; Thu, 05 Jan 2023 11:38:02 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDTFg-0000xW-Of; Thu, 05 Jan 2023 11:38:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id tz12so91328172ejc.9;
 Thu, 05 Jan 2023 08:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52y6ENOByb3ocLr1Jo5wgOY8nhqmURK9oqVQu5UfrJc=;
 b=oJ4LuC1RLFD66BinLJLM3lpl2klxo4hlu+X32t7/pd979DnrHPw6XR87wRLXILAL5T
 xqgli9U6ufL3fTl4sfyykGcFnWET6I9NrW7X/Etk7NXcNhCAYztetvKtwR7BPVpn1bTW
 tZLTsfZO149xrTxtYr+sI3GL+T+N+aBrI10sayeA1QOkW3gz9J6Z3Dq+Uj54DvidQMcU
 RyCNlyP0MkXIc7ITbaCEvYXdG5pzFHQPFd00+o4vQG+7Dvc2gP0YdaoxNTKGynQJRaG7
 7oRI4KKnED7rZYacamZohaf3cjQ3lZwsZ/ZUjuiyT6XKrtM7sImwzUHNXxr1s9XgcKmI
 nL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52y6ENOByb3ocLr1Jo5wgOY8nhqmURK9oqVQu5UfrJc=;
 b=tD3KJOs+am9a6bU73y8zJDhXcsldjAzxl32S0AShi7sUqbWDaKWWhgAovKofOlLrxS
 SjVzeGRRytxRQFPNKE4JU3IIlFDe2fLte3ji2wdDM2xEiV096JaKeALPHvvwonus7Pw3
 ejyUvuRYWAffN0Kmj7Igqr61X4C253AeljNx8/gUO3xB7qpPVkGdY+hUXY+5sUOnxaxD
 tOhnovBeyK5V3dCtFfUoRHDiMd9z7qcwI5UHTXWBu+dIWnjWkCzi+JWnP6heeGbmuCIj
 Ru7XVrcrrLIyHwAyA7FR7e22ejC2skSN0Wi17pe0/hVVyIPnW3XLmLKEVzV5PgkPPOFW
 Lo0Q==
X-Gm-Message-State: AFqh2koCxfNlzsmIqDow5TzTMEXSmG+TVarfpnfngmEDxHgirjkWlcMJ
 VZbMM520WHv0OZzcGk1mxDCKIzI9yDdk6w==
X-Google-Smtp-Source: AMrXdXuSJBwGiOjZPfZ6JkOZw6hnXraF8S8RtzgnUkEmvRXEyzdrLw6yL3vavNYEU6GXpCZs9XEjcg==
X-Received: by 2002:a17:907:c007:b0:7ad:f165:70c2 with SMTP id
 ss7-20020a170907c00700b007adf16570c2mr61461177ejc.27.1672936678635; 
 Thu, 05 Jan 2023 08:37:58 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200dd01067508562054.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:dd01:675:856:2054])
 by smtp.gmail.com with ESMTPSA id
 gf26-20020a170906e21a00b007c0b9500129sm16611974ejb.68.2023.01.05.08.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 08:37:58 -0800 (PST)
Date: Thu, 05 Jan 2023 16:37:55 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/pci-host: Use register definitions from PCI standard
In-Reply-To: <2489f6ef-997a-0cf5-fbdc-c05e4fb7c7fd@eik.bme.hu>
References: <20230105144142.51990-1-philmd@linaro.org>
 <2489f6ef-997a-0cf5-fbdc-c05e4fb7c7fd@eik.bme.hu>
Message-ID: <6005D109-EDE4-4451-A894-65432AFA9F10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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



Am 5=2E Januar 2023 16:02:48 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>On Thu, 5 Jan 2023, Philippe Mathieu-Daud=C3=A9 wrote:
>> No need to document magic values when the definition names
>> from "standard-headers/linux/pci_regs=2Eh" are self-explicit=2E
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> ---
>> hw/pci-host/grackle=2Ec  |  2 +-
>> hw/pci-host/raven=2Ec    |  6 +++---
>> hw/pci-host/uninorth=2Ec | 30 +++++++++++-------------------
>> 3 files changed, 15 insertions(+), 23 deletions(-)
>>=20
>> diff --git a/hw/pci-host/grackle=2Ec b/hw/pci-host/grackle=2Ec
>> index 95945ac0f4=2E=2E2a45cc13c3 100644
>> --- a/hw/pci-host/grackle=2Ec
>> +++ b/hw/pci-host/grackle=2Ec
>> @@ -91,7 +91,7 @@ static void grackle_init(Object *obj)
>>=20
>> static void grackle_pci_realize(PCIDevice *d, Error **errp)
>> {
>> -    d->config[0x09] =3D 0x01;
>> +    d->config[PCI_CLASS_PROG] =3D 0x01;
>> }
>>=20
>> static void grackle_pci_class_init(ObjectClass *klass, void *data)
>> diff --git a/hw/pci-host/raven=2Ec b/hw/pci-host/raven=2Ec
>> index 7a105e4a63=2E=2Ec47259a851 100644
>> --- a/hw/pci-host/raven=2Ec
>> +++ b/hw/pci-host/raven=2Ec
>> @@ -329,9 +329,9 @@ static void raven_realize(PCIDevice *d, Error **err=
p)
>>     char *filename;
>>     int bios_size =3D -1;
>>=20
>> -    d->config[0x0C] =3D 0x08; // cache_line_size
>> -    d->config[0x0D] =3D 0x10; // latency_timer
>> -    d->config[0x34] =3D 0x00; // capabilities_pointer
>> +    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>> +    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>> +    d->config[PCI_CAPABILITY_LIST] =3D 0x00;
>>=20
>>     memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_=
SIZE,
>>                                      &error_fatal);
>> diff --git a/hw/pci-host/uninorth=2Ec b/hw/pci-host/uninorth=2Ec
>> index 8396c91d59=2E=2E342baff12a 100644
>> --- a/hw/pci-host/uninorth=2Ec
>> +++ b/hw/pci-host/uninorth=2Ec
>> @@ -277,11 +277,11 @@ static void pci_unin_internal_init(Object *obj)
>> static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
>> {
>>     /* cache_line_size */
>> -    d->config[0x0C] =3D 0x08;
>> +    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>>     /* latency_timer */
>> -    d->config[0x0D] =3D 0x10;
>> +    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>>     /* capabilities_pointer */
>> -    d->config[0x34] =3D 0x00;
>> +    d->config[PCI_CAPABILITY_LIST] =3D 0x00;
>
>Did you mean to remove the comments here as well?

Removing the comments makes sense to me since they're redundant to the enu=
ms=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>>     /*
>>      * Set kMacRISCPCIAddressSelect (0x48) register to indicate PCI
>> @@ -296,30 +296,22 @@ static void unin_main_pci_host_realize(PCIDevice =
*d, Error **errp)
>>=20
>> static void unin_agp_pci_host_realize(PCIDevice *d, Error **errp)
>> {
>> -    /* cache_line_size */
>> -    d->config[0x0C] =3D 0x08;
>> -    /* latency_timer */
>> -    d->config[0x0D] =3D 0x10;
>> -    /* capabilities_pointer
>> -    d->config[0x34] =3D 0x80; */
>> +    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>> +    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>> +    /* d->config[PCI_CAPABILITY_LIST] =3D 0x80; */
>> }
>>=20
>> static void u3_agp_pci_host_realize(PCIDevice *d, Error **errp)
>> {
>> -    /* cache line size */
>> -    d->config[0x0C] =3D 0x08;
>> -    /* latency timer */
>> -    d->config[0x0D] =3D 0x10;
>> +    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>> +    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>> }
>>=20
>> static void unin_internal_pci_host_realize(PCIDevice *d, Error **errp)
>> {
>> -    /* cache_line_size */
>> -    d->config[0x0C] =3D 0x08;
>> -    /* latency_timer */
>> -    d->config[0x0D] =3D 0x10;
>> -    /* capabilities_pointer */
>> -    d->config[0x34] =3D 0x00;
>> +    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>> +    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>> +    d->config[PCI_CAPABILITY_LIST] =3D 0x00;
>> }
>>=20
>> static void unin_main_pci_host_class_init(ObjectClass *klass, void *dat=
a)
>> 

