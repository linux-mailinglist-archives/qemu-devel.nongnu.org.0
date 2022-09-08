Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245325B19F1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:28:58 +0200 (CEST)
Received: from localhost ([::1]:48648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEmG-0005EV-U2
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEeq-0000iN-MR; Thu, 08 Sep 2022 06:21:17 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:34629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEep-0001gY-15; Thu, 08 Sep 2022 06:21:16 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1280590722dso9617423fac.1; 
 Thu, 08 Sep 2022 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=bJ974pjYXY7tbFc7hYg8CICUACEtMKfgiWM4F8IHZ08=;
 b=NwBGgI27ThBwYlZzirELVEoA6V6oX0dSI0IsiWRSbwbLakWYIpfRwj/0wkFtmQqiA7
 wg+fKCDbDu7xZx8ll9tKxPJG6ZmqCKms3o7TBfj8pPpTt7aGPuZdC4XTSHGdaEruDzHZ
 RF5U/piws/ys+E59roWjJrHwgw1kA3JKRcYLcDlvolu9bKNQtj8V7gkuYmYlNCcD6AwL
 wC9rKlc2wojLeSE+Z9RcW3vcc19GJe5tm1IpaL9W9LiIBavR1bRF8LARp+g6YkA7PMYD
 0qeuYFAbpxsyDTlZVnxoyvEaWnvn4hbMX/1V8Ammhb3D/XGpOKAj3ouncv+BUpNpIOyq
 5sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bJ974pjYXY7tbFc7hYg8CICUACEtMKfgiWM4F8IHZ08=;
 b=dLc+fS1KgpcLYmKj/qJFmjqJ5x8YlRpgZPd3qO0Wn0teY8WCa5M4/tArzmXkWrWhoj
 fh4cPpN8w+lPdvIRNiBjuabsY/bM46Dbn8520/kdF2vv7grw3sgLX3QG3WP7rIjxLcRw
 Xo4AIB6brYBlQNTYGjRK10p4mnA06nC1M8mmsCcnaffo40zOFzdEvM+9OVPRCnoDL88F
 ZIYqLahTJCHKlVMrWLMVNFT74UDBGcriAhmjuLmUokqlk0e9EnioI7cLkw0g3JDjmgvK
 lVRKgTlFUijXarcAmQ9IVYUS4qcYbOZmeo0VcerUbItXxuH/wD2hykfN/TqzY/Yr5vtF
 G7ww==
X-Gm-Message-State: ACgBeo16QVnCluHJenUhqJ22tLF26KnXDpPV275P0lN0ubzufK2zLzh3
 KbYmi0wz8H+QuQttTyS97NE=
X-Google-Smtp-Source: AA6agR4zBuwG9uBTbZjdzdxS6QJYiCsQKhyI1RWu9mOqEv+g/DxAyeSXrOTjTWbzsoYGPbba28u61w==
X-Received: by 2002:a05:6870:5b85:b0:11c:1d6f:2c82 with SMTP id
 em5-20020a0568705b8500b0011c1d6f2c82mr1433907oab.14.1662632473253; 
 Thu, 08 Sep 2022 03:21:13 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 u18-20020a056870441200b00127a6357bd5sm4271788oah.49.2022.09.08.03.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 03:21:12 -0700 (PDT)
Message-ID: <09da2de2-072f-629f-aac9-c9392516df3c@gmail.com>
Date: Thu, 8 Sep 2022 07:21:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 10/13] hw/isa/vt82c686: Instantiate AC97 and MC97
 functions in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-11-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901114127.53914-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.199,
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



On 9/1/22 08:41, Bernhard Beschow wrote:
> The AC97 function's wakeup status is wired to the PM function and both
> the AC97 and MC97 interrupt routing is determined by the ISA function.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/isa/vt82c686.c   | 16 ++++++++++++++++
>   hw/mips/fuloong2e.c |  4 ----
>   hw/ppc/pegasos2.c   |  5 -----
>   3 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index d048607079..91686e9570 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -553,6 +553,8 @@ struct ViaISAState {
>       PCIIDEState ide;
>       UHCIState uhci[2];
>       ViaPMState pm;
> +    PCIDevice ac97;
> +    PCIDevice mc97;
>   };
>   
>   static const VMStateDescription vmstate_via = {
> @@ -572,6 +574,8 @@ static void via_isa_init(Object *obj)
>       object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
>       object_initialize_child(obj, "uhci1", &s->uhci[0], TYPE_VT82C686B_USB_UHCI);
>       object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
> +    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
> +    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
>   }
>   
>   static const TypeInfo via_isa_info = {
> @@ -652,6 +656,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>           return;
>       }
> +
> +    /* Function 5: AC97 Audio */
> +    qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
> +    if (!qdev_realize(DEVICE(&s->ac97), BUS(pci_bus), errp)) {
> +        return;
> +    }
> +
> +    /* Function 6: MC97 Modem */
> +    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
> +    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
> +        return;
> +    }
>   }
>   
>   /* TYPE_VT82C686B_ISA */
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 377108d313..2d8723ab74 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -210,10 +210,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>   
>       dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
>       *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
> -
> -    /* Audio support */
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
>   }
>   
>   /* Network support */
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index e32944ee2b..09fdb7557f 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -159,7 +159,6 @@ static void pegasos2_init(MachineState *machine)
>       pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>   
>       /* VIA VT8231 South Bridge (multifunction PCI device) */
> -    /* VT8231 function 0: PCI-to-ISA Bridge */
>       via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
>                                             TYPE_VT8231_ISA);
>       qdev_connect_gpio_out(DEVICE(via), 0,
> @@ -173,10 +172,6 @@ static void pegasos2_init(MachineState *machine)
>       spd_data = spd_data_generate(DDR, machine->ram_size);
>       smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
>   
> -    /* VT8231 function 5-6: AC97 Audio & Modem */
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
> -
>       /* other PC hardware */
>       pci_vga_init(pci_bus);
>   

