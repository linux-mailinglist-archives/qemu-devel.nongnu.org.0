Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88B85B19D7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:22:56 +0200 (CEST)
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEgR-0003v2-Kv
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEdv-0007l8-SO; Thu, 08 Sep 2022 06:20:20 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEdt-0001Wz-3o; Thu, 08 Sep 2022 06:20:19 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso12043941otp.7; 
 Thu, 08 Sep 2022 03:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=scaLDtzfRnBJEbX3M+9ROhBhPKEXhl/R0d7QfvgotxM=;
 b=hsDClWr3WUxy4gSEiGmrXsjBBWV0zCLjdGsp9PpJpGEHpr2tuMdczi3WfHoQr56lVj
 82IeiEx0PzSHlSc2l8G3wfIrTIbu51MiGabvQDs7amnfnFnx6CpSQunlcsULvcc12L2x
 7gLDmGSpaJIndqvBnsNJqk12hxhGVQ/ycOspvOSo+uh00i6agYYtt5YaJBzMH30w2lx0
 R8xcnYfXgOjPHJo3pWECWKuegfjzuYYTct2aFCZVuFVR30qrfZT6UCEeDSiOlsyDg0Cy
 WI6vTKvEpwT5oUZGoPwQKhKfGKtEqtZrdcdWWEhtT9U+nbs0yp7jGgzcVylTQ6uEIiAT
 hpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=scaLDtzfRnBJEbX3M+9ROhBhPKEXhl/R0d7QfvgotxM=;
 b=iDsHUhvp97hN8z8FKi53QvuKcCCSK6jqctfv+KisOs5jsHG6tQH4JJMtQLS5aCYm9H
 baY3jfxkUW/S4qtdPlAUMnrIG3mWnwTniyzjYn+2iu33zE9U6+1JlMquEgIPUSzkVcLE
 TMpN3lqTgBfkLAoyx3XkmqYdkfZ3DSRU7z6WzN36voQPC9tHMTXqaBxHOMUL7vKApKpM
 fXLatILZI8UrKvz85Ww8ACGMj1GkCCwG1vi8mGfodXnD+l6PxD/TnslxAy5uO2zKIl/q
 4b2M2kqPLXNcLcjR03tsY5hAFe2VaE8GTLTKXKz4rvNKsPm+NFe73++JMeP2ORndl8qA
 w3Rg==
X-Gm-Message-State: ACgBeo2GcfuFtaJNe9Fep3kRhfL6tnM/ZDqGVQhdBwpGb0aZuu0TkaY4
 2ToXYW2zOZe9XrFOjXIafF4=
X-Google-Smtp-Source: AA6agR6CDTe6picPgUQWbREhqxmiv1XaBDu9BFkvvVbrn3rBoSq7I9rlGjR4g9od/75WCgO2phGsVw==
X-Received: by 2002:a9d:6b94:0:b0:639:1a3:31dc with SMTP id
 b20-20020a9d6b94000000b0063901a331dcmr3091587otq.333.1662632413048; 
 Thu, 08 Sep 2022 03:20:13 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 t128-20020a4a5486000000b0044b0465bd07sm5914093ooa.20.2022.09.08.03.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 03:20:12 -0700 (PDT)
Message-ID: <e5139810-345e-ccee-3601-bfb43e5743cb@gmail.com>
Date: Thu, 8 Sep 2022 07:20:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 05/13] hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-6-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901114127.53914-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
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
> Establishes consistency with other (VIA) devices.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ide/via.c              | 2 +-
>   hw/mips/fuloong2e.c       | 2 +-
>   hw/ppc/pegasos2.c         | 2 +-
>   include/hw/isa/vt82c686.h | 1 +
>   4 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 82def819c4..e1a429405d 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -230,7 +230,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
>   }
>   
>   static const TypeInfo via_ide_info = {
> -    .name          = "via-ide",
> +    .name          = TYPE_VIA_IDE,
>       .parent        = TYPE_PCI_IDE,
>       .class_init    = via_ide_class_init,
>   };
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 5ee546f5f6..44225fbe33 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -205,7 +205,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>                                             TYPE_VT82C686B_ISA);
>       qdev_connect_gpio_out(DEVICE(dev), 0, intc);
>   
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> +    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), TYPE_VIA_IDE);
>       pci_ide_create_devs(dev);
>   
>       pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 61f4263953..8039775f80 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -166,7 +166,7 @@ static void pegasos2_init(MachineState *machine)
>                             qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>   
>       /* VT8231 function 1: IDE Controller */
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
> +    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), TYPE_VIA_IDE);
>       pci_ide_create_devs(dev);
>   
>       /* VT8231 function 2-3: USB Ports */
> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
> index 56ac141be3..87aca3e5bb 100644
> --- a/include/hw/isa/vt82c686.h
> +++ b/include/hw/isa/vt82c686.h
> @@ -8,6 +8,7 @@
>   #define TYPE_VT8231_ISA "vt8231-isa"
>   #define TYPE_VT8231_PM "vt8231-pm"
>   #define TYPE_VIA_AC97 "via-ac97"
> +#define TYPE_VIA_IDE "via-ide"
>   #define TYPE_VIA_MC97 "via-mc97"
>   
>   void via_isa_set_irq(PCIDevice *d, int n, int level);

