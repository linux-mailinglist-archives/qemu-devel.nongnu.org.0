Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C15B381C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 14:48:27 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWdQn-0000Ac-7I
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 08:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oWdMP-0005p8-Ty; Fri, 09 Sep 2022 08:43:53 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oWdMN-0000TF-53; Fri, 09 Sep 2022 08:43:52 -0400
Received: by mail-ed1-x52a.google.com with SMTP id e18so2336853edj.3;
 Fri, 09 Sep 2022 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Msyh/fQszRzPuE0ABukkfHCybQuD1CU52QIzjaePNlQ=;
 b=cJASt8NR1zZe/+VdN/EboFWueXAAZPVuBLrifOfrTkpKTWoOHXkEEUauLgBUZYaLmT
 HrhI7YWODXN6yTTtFzA1k8JQ3IPB/m4On13LbrJb7fj3Mdn51yik6rA55ald55qKDvcF
 Ok85ovk9WPFsc5Xbt1D75m4VJY8+Pz2kdNgDSE3dhMTiPIigDXqj+NFh6hSlGe1fQhce
 j3ywAB0uzDX2EkxYxDw2XbUflwmRETCIBXPHzK4Ks0MgI1UQDNxLSgrU+1Xrmdr7XMxg
 8GSXarXitifUf4ypGg0/BD8EkFrPj/9gQtZ7dhUEfK6z8i++hQjHIBGMj8tefbuGHk5C
 +RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Msyh/fQszRzPuE0ABukkfHCybQuD1CU52QIzjaePNlQ=;
 b=6hNkAsL2KzQ0Iyb/bzzD1jVbPyrbPl8vtZn7NOivt5uF0Is8vyKm5xy+IpilDeTDDy
 TrXldjmk3a9KXq2Ii0Oy5ZkgLAKbNd40c8XNT8iq7omuk/sj8P1byYezM4+kf1iZQHVN
 7hZqGlYzIE6vqgjiDoO1Umpr4zqFjocga7CYfxEn2BQUq9D89rpJJVuWUW9MHgRDVeDo
 w1wnW4CTJkRgrqdqOfE3QTGqo+D6jN7nRzJ2j9jicDu7T3DZJcWlITXkfkEdEa7FTczH
 Hy678KEv7Cb+DtdN069lFXXE9tS4hTHLk1HZsIugMT8oEP+wDa8DkimFCRJv9pVA9aKO
 OjXQ==
X-Gm-Message-State: ACgBeo1TSbYQfEgq+drP/9Jf2fIn58aFqSdvYZ5i6xiFqtfoX8OeTEqc
 /mACZ0BQXNopJHTedUOEySo=
X-Google-Smtp-Source: AA6agR5UC1gTrV9/SRXN/Kd3JfMdHWXaVA1INUX5IHChHLr3NMoAp38aA+oRwoQk6fWCeijbT9m9yg==
X-Received: by 2002:a05:6402:40d1:b0:44f:e974:f981 with SMTP id
 z17-20020a05640240d100b0044fe974f981mr7420704edb.222.1662727429310; 
 Fri, 09 Sep 2022 05:43:49 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-180-255.77.183.pool.telefonica.de.
 [77.183.180.255]) by smtp.gmail.com with ESMTPSA id
 f3-20020a50ee83000000b0043cc66d7accsm310829edr.36.2022.09.09.05.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 05:43:48 -0700 (PDT)
Date: Fri, 09 Sep 2022 12:43:44 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_10/10=5D_hw/isa/vt82c686=3A_?=
 =?US-ASCII?Q?Create_rtc-time_alias_in_boards_instead?=
In-Reply-To: <113d22be-283c-ebe5-8db3-e622447c7bf5@amsat.org>
References: <20220830190048.67448-1-shentey@gmail.com>
 <20220830190048.67448-11-shentey@gmail.com>
 <113d22be-283c-ebe5-8db3-e622447c7bf5@amsat.org>
Message-ID: <FD51AC07-9610-45BD-842A-41C87B872432@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

Am 30=2E August 2022 21:46:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4=
bug@amsat=2Eorg>:
>On 30/8/22 21:00, Bernhard Beschow wrote:
>> According to good QOM practice, an object should only deal with objects
>> of its own sub tree=2E Having devices create an alias on the machine
>> object doesn't respect this good practice=2E To resolve this, create th=
e
>> alias in the machine's code=2E
>
>IIUC, this is only true for Pegasos II, not (yet) for the Fuloong 2E=2E
>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/isa/vt82c686=2Ec   | 2 --
>>   hw/mips/fuloong2e=2Ec | 4 ++++
>>   hw/ppc/pegasos2=2Ec   | 4 ++++
>>   3 files changed, 8 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index 0ef9446374=2E=2Ea23ffbb3ff 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -631,8 +631,6 @@ static void via_isa_realize(PCIDevice *d, Error **e=
rrp)
>>       if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>           return;
>>       }
>> -    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&=
s->rtc),
>> -                              "date");
>>       isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc=2Eisairq);
>>         for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
>> diff --git a/hw/mips/fuloong2e=2Ec b/hw/mips/fuloong2e=2Ec
>> index 2d8723ab74=2E=2E0f4cfe1188 100644
>> --- a/hw/mips/fuloong2e=2Ec
>> +++ b/hw/mips/fuloong2e=2Ec
>> @@ -203,6 +203,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci=
_bus, int slot, qemu_irq intc,
>>         via =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot=
, 0), true,
>>                                             TYPE_VT82C686B_ISA);
>> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
>> +                              object_resolve_path_component(OBJECT(via=
),
>> +                                                            "rtc"),
>> +                              "date");
>>       qdev_connect_gpio_out(DEVICE(via), 0, intc);
>>         dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "=
ide"));
>> diff --git a/hw/ppc/pegasos2=2Ec b/hw/ppc/pegasos2=2Ec
>> index 09fdb7557f=2E=2Ef50e1d8b3f 100644
>> --- a/hw/ppc/pegasos2=2Ec
>> +++ b/hw/ppc/pegasos2=2Ec
>> @@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
>>       /* VIA VT8231 South Bridge (multifunction PCI device) */
>>       via =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0)=
, true,
>>                                             TYPE_VT8231_ISA);
>> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
>
>We already have a 'machine' pointer=2E

Fixed in v5=2E

>
>> +                              object_resolve_path_component(OBJECT(via=
),
>> +                                                            "rtc"),
>> +                              "date");
>>       qdev_connect_gpio_out(DEVICE(via), 0,
>>                             qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>>  =20
>


