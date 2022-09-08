Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484CC5B19DD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:24:51 +0200 (CEST)
Received: from localhost ([::1]:44090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEiI-0007q7-Gm
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEeg-0000ND-Q0; Thu, 08 Sep 2022 06:21:06 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEee-0001f0-RX; Thu, 08 Sep 2022 06:21:06 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-127f5411b9cso11734054fac.4; 
 Thu, 08 Sep 2022 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+/2E66vIj29u+5B11tpkBQ6XDsCy6xFs7brDaj4DWdY=;
 b=Wb8wDTe5emebyZiuGVkr4pkvW9AELOoV4A3i2TTQWj9L4Li5HmLW4JOSf4/rq4L0+i
 v0DX+aiEyQugOKioMbP5/lrThuvJZ0hqYBsiWhUP7hHbnsRYvbhbVjYLbZHSpDvFL3lx
 6DLB856vlMhXLuHQJdCehVGRb2umGXoEZgfRNuh27l08mrvpB6dv8PVEQpu2BAJFaN00
 BPG5YlC2G64dI1o61H6lGF781+A0m6go0PUWolMOo1itLl9yVdTYB1kshTQS7K4CNkpf
 v8O0EFjFPt4mWkaZTjXOOfBdIkaeNK7BpJ5rrD3Q3lQNvAXofdVVPWG/SbCyGOsdzHka
 3pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+/2E66vIj29u+5B11tpkBQ6XDsCy6xFs7brDaj4DWdY=;
 b=jpx0ywu4HVH8eGtfNSpFlEcRqJxgHS2H+FTsWmd+h7C0VE0CfZr5TRrvnV+ReMio5u
 rdOR7vVPm4cQLO6E7pr5RShkehvV6B64X5yb+fj1rxq7hndSsqmxIrIPYjvPhD2JOpzn
 A2kTBRTWWIQbzHkfMVf8EpetdZAHhAMH6L0EMLH2fuIQoN8QUhLf3mZEWZjJerm9JNkV
 AKcYSqWMlp/mwazgXZmIZgkwjfb8K/9zWbyPK2P9T7QJgUWQotieDqL5mAx4uoGbMyzo
 5Uafq3r4+27oKmAz97FvOXFlhQ9kNnwfsST1/XJ8XTFMdD6Rq8h1Ne/SuXT7OuFjBuR8
 lQ0g==
X-Gm-Message-State: ACgBeo2OmGVn4HZNbRtMRn9kwCcKiYmRvIc01Lt/W9ru9B+Z10WxRPMD
 Os0/S1JRy2VZeqQDzS1bBUOZ7KebqgmSTQ==
X-Google-Smtp-Source: AA6agR7HdqqdoV1YL+yedD0XLrLE1PZ9mahTjpY0vew1pSMKu6Xp3NyrNWpeF6NIMZ1jtYVlOSf4Tg==
X-Received: by 2002:a05:6808:169e:b0:34d:2d89:6b97 with SMTP id
 bb30-20020a056808169e00b0034d2d896b97mr667956oib.72.1662632463253; 
 Thu, 08 Sep 2022 03:21:03 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 y25-20020a9d4619000000b006389650374dsm8202312ote.54.2022.09.08.03.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 03:21:02 -0700 (PDT)
Message-ID: <78b12f69-8c92-c4cf-ce94-312ba98d5278@gmail.com>
Date: Thu, 8 Sep 2022 07:20:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 09/13] hw/isa/vt82c686: Instantiate PM function in host
 device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-10-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901114127.53914-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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
> The PM controller has activity bits which monitor activity of other
> built-in devices in the host device.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/isa/vt82c686.c         | 13 +++++++++++++
>   hw/mips/fuloong2e.c       |  2 +-
>   hw/ppc/pegasos2.c         |  3 +--
>   include/hw/isa/vt82c686.h |  2 --
>   4 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index f05fd9948a..d048607079 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -250,6 +250,8 @@ static const ViaPMInitInfo vt82c686b_pm_init_info = {
>       .device_id = PCI_DEVICE_ID_VIA_82C686B_PM,
>   };
>   
> +#define TYPE_VT82C686B_PM "vt82c686b-pm"
> +
>   static const TypeInfo vt82c686b_pm_info = {
>       .name          = TYPE_VT82C686B_PM,
>       .parent        = TYPE_VIA_PM,
> @@ -261,6 +263,8 @@ static const ViaPMInitInfo vt8231_pm_init_info = {
>       .device_id = PCI_DEVICE_ID_VIA_8231_PM,
>   };
>   
> +#define TYPE_VT8231_PM "vt8231-pm"
> +
>   static const TypeInfo vt8231_pm_info = {
>       .name          = TYPE_VT8231_PM,
>       .parent        = TYPE_VIA_PM,
> @@ -548,6 +552,7 @@ struct ViaISAState {
>       ViaSuperIOState via_sio;
>       PCIIDEState ide;
>       UHCIState uhci[2];
> +    ViaPMState pm;
>   };
>   
>   static const VMStateDescription vmstate_via = {
> @@ -641,6 +646,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>               return;
>           }
>       }
> +
> +    /* Function 4: Power Management */
> +    qdev_prop_set_int32(DEVICE(&s->pm), "addr", d->devfn + 4);
> +    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
> +        return;
> +    }
>   }
>   
>   /* TYPE_VT82C686B_ISA */
> @@ -683,6 +694,7 @@ static void vt82c686b_init(Object *obj)
>       ViaISAState *s = VIA_ISA(obj);
>   
>       object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
> +    object_initialize_child(obj, "pm", &s->pm, TYPE_VT82C686B_PM);
>   }
>   
>   static void vt82c686b_class_init(ObjectClass *klass, void *data)
> @@ -746,6 +758,7 @@ static void vt8231_init(Object *obj)
>       ViaISAState *s = VIA_ISA(obj);
>   
>       object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERIO);
> +    object_initialize_child(obj, "pm", &s->pm, TYPE_VT8231_PM);
>   }
>   
>   static void vt8231_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index dc92223b76..377108d313 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -208,7 +208,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>       dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>       pci_ide_create_devs(dev);
>   
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
>       *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>   
>       /* Audio support */
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 85cca6f7a6..e32944ee2b 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -168,8 +168,7 @@ static void pegasos2_init(MachineState *machine)
>       dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>       pci_ide_create_devs(dev);
>   
> -    /* VT8231 function 4: Power Management Controller */
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
>       i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>       spd_data = spd_data_generate(DDR, machine->ram_size);
>       smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
> index e6f6dd4d43..eaa07881c5 100644
> --- a/include/hw/isa/vt82c686.h
> +++ b/include/hw/isa/vt82c686.h
> @@ -4,10 +4,8 @@
>   #include "hw/pci/pci.h"
>   
>   #define TYPE_VT82C686B_ISA "vt82c686b-isa"
> -#define TYPE_VT82C686B_PM "vt82c686b-pm"
>   #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
>   #define TYPE_VT8231_ISA "vt8231-isa"
> -#define TYPE_VT8231_PM "vt8231-pm"
>   #define TYPE_VIA_AC97 "via-ac97"
>   #define TYPE_VIA_IDE "via-ide"
>   #define TYPE_VIA_MC97 "via-mc97"

