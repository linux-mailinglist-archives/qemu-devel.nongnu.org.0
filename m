Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16787692366
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:34:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWM2-0007BC-7W; Fri, 10 Feb 2023 11:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pQWM0-0007B0-5p; Fri, 10 Feb 2023 11:34:28 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pQWLy-0007mG-6y; Fri, 10 Feb 2023 11:34:27 -0500
Received: by mail-ed1-x535.google.com with SMTP id u21so5194924edv.3;
 Fri, 10 Feb 2023 08:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87DAfGcWqDEvlHCgVdzWpXiSq7yAcRnA601QZEZg064=;
 b=YS8Qt6GWuJ0vmt7aPdE7syE/Xcvi9H0dKG/azTtgSOUeNr31XNbFGmsBbVefqWtwOC
 VaEcTT03x0/W6DHWus1piNsjdCuw+ZYEzsKq2FvWKyjwbz352mg2o+FshODg73VMnUEe
 rijTMbONUNufD5hRHi9WcE8g+6MvkiYPqsVSM7JrI099ldyICLJoMHPD8VIgBvL1QuNj
 ZA7zazi4Bu66vNLse7ZuJpa8XwLa5qV87drdj8wqW8JFWqtHBbJMsWJYkRDbvhLoAHlr
 6UzZh61x8anbSvEVgTBB7mIEU8eFoHSCtctNqVS3sV/8UgiF27l/lBhZ7zLNpXj9H7uo
 5Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87DAfGcWqDEvlHCgVdzWpXiSq7yAcRnA601QZEZg064=;
 b=niC7PFK55TtVrtGhjeRmPbJMXp7Zhj46CP/B+u5pVyS88GPeJd9ktD22K2rxTbI9L4
 LzVGHnkegzh/WRYKnPKg4eJxIPUvAGIvZL2eaJ8EI+CSIkhuNyECmS/BJeKi/+IytYju
 gjVVZh71H2jJ6sDrUHkF/zJH+cOmHZroIsTDdRCiQcXEDMtdJa+igPYSIoYCvh5/lAKm
 EO3iDGZbzqKEBfU8CEgaJXIuEMjWetmwNcx/BA1o0IwO4JiJ+9yykrPdJsjqe/KZ1l0Q
 pnwL6hGg89o2f4xgAEUwxQhX6ioZjUFhGU+pl53NhHtcj1OkJIcf5fvcAyULPB3IxptT
 hz3w==
X-Gm-Message-State: AO0yUKXJbAAd71HPbdDVKwo6q+dkiOT/4WKbFnUwtPJilSXluHKreK0S
 vCwTSnPggpG1p6HUDL9nQ+4=
X-Google-Smtp-Source: AK7set+4/xVebBbl1If/we297zcs/+O4GOwMtxUNpCIelN6MJOce2WG3B99xi1ClSriJYCJLv0ijJA==
X-Received: by 2002:a50:d49b:0:b0:4ab:15fb:8632 with SMTP id
 s27-20020a50d49b000000b004ab15fb8632mr9375193edi.29.1676046864166; 
 Fri, 10 Feb 2023 08:34:24 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-141-225.77.191.pool.telefonica.de.
 [77.191.141.225]) by smtp.gmail.com with ESMTPSA id
 m3-20020a50d7c3000000b0049e1f167956sm2473006edj.9.2023.02.10.08.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 08:34:23 -0800 (PST)
Date: Fri, 10 Feb 2023 16:34:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 5/7] hw/ide/piix: Use generic ide_init_ioport()
In-Reply-To: <CAG4p6K4qnDXjM+7=B1iRjUNX1astmg0Pofco+aOOPWkJG2ajFQ@mail.gmail.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-6-philmd@linaro.org>
 <CAG4p6K4qnDXjM+7=B1iRjUNX1astmg0Pofco+aOOPWkJG2ajFQ@mail.gmail.com>
Message-ID: <965A25A6-D963-4F0A-82AD-7EBD9B487F96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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



Am 9=2E Februar 2023 09:04:49 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>On Wed, Feb 8, 2023 at 1:08 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
=2Eorg>
>wrote:
>
>> TYPE_PIIX3_IDE is a PCI function inheriting from QOM
>> TYPE_PCI_DEVICE=2E To be able to call the ISA specific
>> ide_init_ioport_isa(), we call this function passing
>> a NULL ISADevice argument=2E Remove this hack by calling
>> the recently added generic ide_init_ioport(), which
>> doesn't expect any ISADevice=2E
>>
>> Inspired-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> ---
>>  hw/ide/piix=2Ec | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>> index a587541bb2=2E=2E1cd4389611 100644
>> --- a/hw/ide/piix=2Ec
>> +++ b/hw/ide/piix=2Ec
>> @@ -136,15 +136,13 @@ static int pci_piix_init_ports(PCIIDEState *d)
>>          {0x1f0, 0x3f6, 14},
>>          {0x170, 0x376, 15},
>>      };
>> -    int i, ret;
>> +    int i;
>>
>>      for (i =3D 0; i < 2; i++) {
>>          ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>> -        ret =3D ide_init_ioport_isa(&d->bus[i], NULL,
>> -                                  port_info[i]=2Eiobase,
>> port_info[i]=2Eiobase2);
>> -        if (ret) {
>> -            return ret;
>> -        }
>> +        ide_init_ioport(&d->bus[i], OBJECT(d),
>> +                        pci_address_space_io(PCI_DEVICE(d)),
>> +                        port_info[i]=2Eiobase, port_info[i]=2Eiobase2)=
;
>>          ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i]=2Eisairq)=
);

Let me elaborete a bit on what I mean by the patch essentially circumventi=
ng the crash fix:

The reason for the crash with the x-remote machine is now caused by isa_ge=
t_irq() which also uses the isabus global behind the scenes=2E So piix-ide =
needs to be changed in two places to avoid the global usage and hence the c=
rash=2E

In his crash fix [1], Thomas was lucky: First, ide_init_ioport() didn't re=
turn a value before, so adding one didn't cause changes in other device mod=
els=2E Second, ide_init_ioport() is the first call here to access the globa=
l, so it could be used to protect the call to isa_get_irq()=2E Note that is=
a_get_irq() couldn't be changed in a similar way without affecting all its =
call sites=2E

Fixing ide_init_ioport() to not access the global is certainly a step in t=
he right direction, but this means that ide_init_ioport() is now unable to =
protect the isa_get_irq() call=2E Since isa_get_irq() can't conveniently pr=
otect itself, we either need to avoid it or need another way to achieve tha=
t=2E That's why in my series GPIOs are used for internal devices and  isa_g=
et_irq() plus fishing out the ISA bus for user-created ones=2E

Fishing out the ISA bus is still a hack IMO, for two reasons: First, IIUC,=
 QOM'ified devices shall only care about its children while looking up one'=
s parent bus violates this rule=2E Second, using the global machine pointer=
 to scan for the ISA bus just trades one global for another=2E That's why I=
'm only doing this for user-created instances=2E If we deprecated user-crea=
ted piix IDE devices we could eventually get rid of this hack=2E

Best regards,
Bernhard

[1] https://lore=2Ekernel=2Eorg/qemu-devel/20210416125256=2E2039734-1-thut=
h@redhat=2Ecom/ "hw/ide: Fix crash when plugging a piix3-ide device into th=
e x-remote machine"

>>
>>          bmdma_init(&d->bus[i], &d->bmdma[i], d);
>> --
>> 2=2E38=2E1
>>
>> This patch essentially circumvents the mitigations introduced by
>https://lore=2Ekernel=2Eorg/qemu-devel/20210416125256=2E2039734-1-thuth@r=
edhat=2Ecom/
>"hw/ide: Fix crash when plugging a piix3-ide device into the x-remote
>machine": `qemu-system-x86_64 -M x-remote -device piix3-ide` now crashes=
=2E
>This has been considered in
>https://lore=2Ekernel=2Eorg/qemu-devel/20230126211740=2E66874-1-shentey@g=
mail=2Ecom/
>-- see cover letter there=2E TBH it's not entirely clear to me why we nee=
d
>two competing series here at all=2E
>
>Best regards,
>Bernhard

