Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9653706F
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 11:26:21 +0200 (CEST)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvFBk-0008F3-J5
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 05:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvF9W-0007JZ-N4; Sun, 29 May 2022 05:24:02 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvF9U-0007Xp-Qz; Sun, 29 May 2022 05:24:02 -0400
Received: by mail-qt1-x82d.google.com with SMTP id x20so745848qtp.8;
 Sun, 29 May 2022 02:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LeZjegPpxBU1CAsvtgY5ioMBBpk3XQPFNC43WQPXVRQ=;
 b=hwNNuYkDHI1TPXuCRJF2GveJRsD81o6BLs7GOXp7sZ00m/QKhQXBHafAyaYbpUMgLD
 dBzmeYq3jyqhb4Mmc1zRoKoBFBYNO4ditmrtAuuqCf1y9/OzttvQzLUa/SK/25JtJ+uR
 nAyVVQf60JFo0FeE1/Es/OuTfuScIY9AcYaNI4X61T8kZcf8m30CooA9LwwsJvOiIe+4
 coa0HV7clT7rsOGdXkttnv/k4e3uxFdZoTaZZbW9nYXYxDhggYM42ZX1aYyrjY9/mpFw
 8I89kWiXkgYYcKvmgKObl/hWCu4SakhWzciDYQaGr36SDzU8/XT4twMlbd3kT89+7qi2
 5QNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LeZjegPpxBU1CAsvtgY5ioMBBpk3XQPFNC43WQPXVRQ=;
 b=5zxvkirHXqwCzbnrZckfbQ8TcErzwSs82R6vhL/Ik4rT38kEumISKP+dxEay2LWEwK
 cgXMVp+8RZkQqdZIVhUkdWW9sPWbmELdRXKF4ZogZbnIdsj12T5DZXk1LBWY17HdqcOi
 1tcex8v+azBxlFeKdHZBW9EDgTEQIN/Ufy0ZVWvhn7au+kqMXzgvkCkKXfvXz+If/Rrx
 1PGwClTLwEGoqSeeDytcEwQoZe6o4QKBb/4X6UHxRhYgNWKboZ0+/jQo6fiM++qkkkh2
 q/Yh7JtHgcjyzQY0KbhNX8EI55HRXb9rMbliZVcLA3TIgWGUbTwfZmAo85M5y5OmUxEy
 r5PQ==
X-Gm-Message-State: AOAM531u1JFXjqsPCG0AcZ2xInqUeXcY3ur50y7W+tHR01h+j1AZA/Fp
 de6TUnlz6EO6aS01+5RO03tuiYd0ucNdOdKb4NgE4SENevrbRw==
X-Google-Smtp-Source: ABdhPJw42w/g0QQ5uJMdnK339D3EX3BNJp+Wz8Nut03rOma9tmHL49aAYOO8WGtOD10m9svEITbUKVedrj5Wuos6HSk=
X-Received: by 2002:ac8:7d89:0:b0:2fc:1be0:6fc0 with SMTP id
 c9-20020ac87d89000000b002fc1be06fc0mr14351729qtd.482.1653816239319; Sun, 29
 May 2022 02:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220522212431.14598-1-shentey@gmail.com>
 <20220522212431.14598-2-shentey@gmail.com>
 <e1654d8d-53c4-d01c-1288-f74fa4fdfcfd@eik.bme.hu>
In-Reply-To: <e1654d8d-53c4-d01c-1288-f74fa4fdfcfd@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 29 May 2022 11:23:35 +0200
Message-ID: <CAG4p6K4Kfek2PgH7-=CDqfKLGFddU=5YYmnqpaM-0rhTrFqe7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] include/hw/southbridge/piix: Aggregate all PIIX
 soughbridge type names
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=shentey@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 22. Mai 2022 22:32:06 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>On Sun, 22 May 2022, Bernhard Beschow wrote:
>> TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
>> ones, too.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> hw/isa/piix3.c                | 3 ---
>> include/hw/isa/isa.h          | 2 --
>> include/hw/southbridge/piix.h | 4 ++++
>> 3 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
>> index dab901c9ad..d96ce2b788 100644
>> --- a/hw/isa/piix3.c
>> +++ b/hw/isa/piix3.c
>> @@ -35,9 +35,6 @@
>>
>> #define XEN_PIIX_NUM_PIRQS      128ULL
>>
>> -#define TYPE_PIIX3_DEVICE "PIIX3"
>> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>> -
>> static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
>> {
>>     qemu_set_irq(piix3->pic[pic_irq],
>> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
>> index 034d706ba1..e9fa2f5cea 100644
>> --- a/include/hw/isa/isa.h
>> +++ b/include/hw/isa/isa.h
>> @@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevice =
*d)
>>     return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
>> }
>>
>> -#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>> -
>> #endif
>> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix=
.h
>> index f63f83e5c6..4d17400dfd 100644
>> --- a/include/hw/southbridge/piix.h
>> +++ b/include/hw/southbridge/piix.h
>> @@ -70,6 +70,10 @@ typedef struct PIIXState PIIX3State;
>> DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>>                          TYPE_PIIX3_PCI_DEVICE)
>>
>> +#define TYPE_PIIX3_DEVICE "PIIX3"
>> +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>> +#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>
>This naming seems to go back to 9b74b190d6c so it's not directly related t=
o this series but there seems to be a bit of a confusion here that I wonder=
 could be cleaned up now. We have:
>
>#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
>and
>#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>
>and both of these have mismatched #define and device name. These are not u=
ser creatable so so the device names don't appear anywhere (except maybe in=
 info qtree output) but this could still be confusing as normally type defi=
nes should match device names. If these are the ISA bridges then maybe piix=
?-isa is a good name so maybe we should have
>
>#define TYPE_PIIX3_ISA "piix3-isa"
>#defint TYPE_PIIX4_ISA "piix4-isa"
>
>(then also matching e.g. "via-isa") but I'm not sure changing "pci-piix3" =
to "piix3-isa" could break anything (I don't expect changing the defines th=
emselces could cause any problem).
>
>It's just something I've noticed and brought up for consideration but I ha=
ve no strong opinion on it so up to you what you do with it.

Hi Zoltan,

yeah, I noticed the naming when moving the defines. I couldn't come up
with better names which were worth the effort because I can imagine
where the names are coming from. I also didn't want to go down the
rabbithole of backwards compatibility (which is a topic I haven't
covered yet). I think that *-isa is too narrow a name for the
container device since it bridges a couple of buses to PCI, but other
than that I don't have strong opinions about the names.

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> +
>> PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
>>
>> DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **sm=
bus);
>>

