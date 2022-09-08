Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB85B19DC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:24:31 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEhz-00079f-3c
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEeD-000836-Bm; Thu, 08 Sep 2022 06:20:37 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:42582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEeB-0001cP-Nq; Thu, 08 Sep 2022 06:20:37 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-127d10b4f19so17315647fac.9; 
 Thu, 08 Sep 2022 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=57AATduUyAYeyX5iXycbtMfF1g87+8KRjjvm7tzDu6U=;
 b=nccVBSwnVXn0qwaSzZFVcfPcWcYeGAxN6Ir673kB3doBvCxpXvPssh2ZB38b9EKWa0
 FSb9mZXYcxM8ActTfAiUXU4Y+vwf2CXrz3AZjnz9vymNiYSBGdGztfZT7X9vu/lzscY7
 K5MN4Udz1QA1HpKi36vACfvmJffH8MeH6AKErSeOEClaThNNflotWxwVLa8/2LUOYg6h
 a6Crrol6jNmZmXVDBHy1VTLzHA9+J1lQNQstoQT/r6CLSdYmB32t41F+aYN2dhvQkdfd
 RfgOHniqu5krdQ5EORl+FMeNgrKXorso4ktg7X2NrvF4C5gH9IQMQ/KahaBOhjRNo10+
 fCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=57AATduUyAYeyX5iXycbtMfF1g87+8KRjjvm7tzDu6U=;
 b=joY1KMQhnIUi7lCaLplku1tTHTjPE2CzBK0iG98KeOX622UCxi0r+nVwmsK6z7acl1
 lc+ciyfiF41PElz0puLmOOaRBBgJz4+whniTnMqNnxd3I+bsub6SezmFUgGv77FvbiJr
 3TuXFqzs20T5JQqyWqYXpSY/hyRYjAuTYBeyPKoITCQbXRihvv01Js50Ih+SHlF3Gwcv
 MGVNoQ+mutsx+wdBsUtgAEgSMwgINKriChFmkjHgStBZSQoe3fK2je8FeE1buQ+dP5/L
 ioOCg3gfsogwThkzODPhDHQmW3ke/jH3Lgq64KABCBOgGdISjPzmQS9uGAanmuz+YMZe
 EyaA==
X-Gm-Message-State: ACgBeo0WkPumukk7qRRYD051U+VN6Da2NBBIiYFf1Ge5Jpk5/tg+VuZp
 drhAK7mEPl5zAuNGyNV/WwA=
X-Google-Smtp-Source: AA6agR7xKR/TS6Vla5DRI2mznLfUAMyaOfi0WV7MrZM+4iUVT0l0E//IeQ/YXuejWCOfBDujVeSs+w==
X-Received: by 2002:a05:6870:5488:b0:127:7a3d:bf27 with SMTP id
 f8-20020a056870548800b001277a3dbf27mr1549441oan.101.1662632433835; 
 Thu, 08 Sep 2022 03:20:33 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 p66-20020aca4245000000b003451c927e0dsm7353106oia.38.2022.09.08.03.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 03:20:33 -0700 (PDT)
Message-ID: <e2265fae-300f-d186-79ed-75387a0d3a20@gmail.com>
Date: Thu, 8 Sep 2022 07:20:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 07/13] hw/isa/vt82c686: Introduce
 TYPE_VT82C686B_USB_UHCI define
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-8-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901114127.53914-8-shentey@gmail.com>
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
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/mips/fuloong2e.c        | 4 ++--
>   hw/ppc/pegasos2.c          | 4 ++--
>   hw/usb/vt82c686-uhci-pci.c | 4 ++--
>   include/hw/isa/vt82c686.h  | 1 +
>   4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 32605901e7..6b7370f2aa 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -208,8 +208,8 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>       dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>       pci_ide_create_devs(dev);
>   
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
> +    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), TYPE_VT82C686B_USB_UHCI);
> +    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), TYPE_VT82C686B_USB_UHCI);
>   
>       dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
>       *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 8bc528a560..70776558c9 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -169,8 +169,8 @@ static void pegasos2_init(MachineState *machine)
>       pci_ide_create_devs(dev);
>   
>       /* VT8231 function 2-3: USB Ports */
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
> +    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), TYPE_VT82C686B_USB_UHCI);
> +    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), TYPE_VT82C686B_USB_UHCI);
>   
>       /* VT8231 function 4: Power Management Controller */
>       dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
> index 0bf2b72ff0..46a901f56f 100644
> --- a/hw/usb/vt82c686-uhci-pci.c
> +++ b/hw/usb/vt82c686-uhci-pci.c
> @@ -31,7 +31,7 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>   
>   static UHCIInfo uhci_info[] = {
>       {
> -        .name      = "vt82c686b-usb-uhci",
> +        .name      = TYPE_VT82C686B_USB_UHCI,
>           .vendor_id = PCI_VENDOR_ID_VIA,
>           .device_id = PCI_DEVICE_ID_VIA_UHCI,
>           .revision  = 0x01,
> @@ -45,7 +45,7 @@ static UHCIInfo uhci_info[] = {
>   
>   static const TypeInfo vt82c686b_usb_uhci_type_info = {
>       .parent         = TYPE_UHCI,
> -    .name           = "vt82c686b-usb-uhci",
> +    .name           = TYPE_VT82C686B_USB_UHCI,
>       .class_init     = uhci_data_class_init,
>       .class_data     = uhci_info,
>   };
> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
> index 87aca3e5bb..e6f6dd4d43 100644
> --- a/include/hw/isa/vt82c686.h
> +++ b/include/hw/isa/vt82c686.h
> @@ -5,6 +5,7 @@
>   
>   #define TYPE_VT82C686B_ISA "vt82c686b-isa"
>   #define TYPE_VT82C686B_PM "vt82c686b-pm"
> +#define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
>   #define TYPE_VT8231_ISA "vt8231-isa"
>   #define TYPE_VT8231_PM "vt8231-pm"
>   #define TYPE_VIA_AC97 "via-ac97"

