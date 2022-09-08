Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18CD5B19D8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:23:07 +0200 (CEST)
Received: from localhost ([::1]:52486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEgc-0004Xc-UR
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEeO-0008Rv-SY; Thu, 08 Sep 2022 06:20:49 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEeN-0001eM-7A; Thu, 08 Sep 2022 06:20:48 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-127dca21a7dso15790335fac.12; 
 Thu, 08 Sep 2022 03:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=h7bdf5drrdp85f3l4lUgnwOeSEOSsiqyzuEly6Vr/pQ=;
 b=pNP0Hjm3KhiC87WWh5HkYAWzP4pnCSxT4E9d4yRe38Ci2DCkoS3MsnYofeYo2328nn
 4ta74j1XBn4qbidpc3CStKJqcsbvILys+DjguiIYplUaT7/Lu84Ssgwvv5s4ZmLNBl7n
 rWfCMEbWywsPta+xQMRqZpRphNNnCdwREG4WBNTVzs6q+4enyPnBRLHo2jwlWZaWyRTc
 6CHhvi859MU+tBGtTepJTpkw4SbQdmnzzrCNfJ+0xSz4q9a8ux5dPsRIYo6m0EGlEyXB
 hmqwQ52UCgEnH7Pb2i6zMIq0ss50xO88d7FEzmUaci8ETzs0DR+VpQZbvZRHsnt4ijKC
 SvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=h7bdf5drrdp85f3l4lUgnwOeSEOSsiqyzuEly6Vr/pQ=;
 b=F6Tg4AJVIYOD8hWLZO6XNm8oRiJuoZ9DrwRFYEuE9j3h+dIjsju9WNQ/DX5AhQ2yJw
 7CjurGFkeNF4gMNNlD4e8Kxd6Lt6ODqj9gG1iuuDGUNM8RiOMSBBQXGgtxMM0oJjh91j
 NCEF29qBiUT0mRu5VBPmG2zFed2TvkhE0PsI6bdTpF5yOalhQ0w6INpce4t9ieNfCr0z
 Q8jNDYZpUwBdW05X2Ctp37vI4l4KwLeI0UsEB2gAG/o8iT9MfcNMmGaerN4ag4xGgRDO
 uIe4M5VVThQrVn5xPwH/YQmTsS+HOjlz6fd2eAxHRjkGEkgpvYazHbAl6y1hCpvw3rLD
 g/4g==
X-Gm-Message-State: ACgBeo2W4x5iPgt/wut2NXFuHUPajTd7ommU7uYi5IouukrUghch8oxd
 U91ZFu6Io/EWvoFQtUPw7fM=
X-Google-Smtp-Source: AA6agR7X5WfKIYgU5mIUwiKd1/rOylQDsySRdLwal8rNGFDj1j3z7/WVTk6iWFABFNm3KqQk9D4ZCQ==
X-Received: by 2002:a05:6870:9a1b:b0:128:c95:efa2 with SMTP id
 fo27-20020a0568709a1b00b001280c95efa2mr1435129oab.6.1662632445221; 
 Thu, 08 Sep 2022 03:20:45 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 h6-20020a9d6406000000b00636f7059b27sm8174827otl.5.2022.09.08.03.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 03:20:44 -0700 (PDT)
Message-ID: <8983ab16-23a3-d22d-2f97-2f820c8c703b@gmail.com>
Date: Thu, 8 Sep 2022 07:20:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 08/13] hw/isa/vt82c686: Instantiate USB functions in
 host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-9-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901114127.53914-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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
> The USB functions can be enabled/disabled through the ISA function. Also
> its interrupt routing can be influenced there.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/isa/vt82c686.c   | 12 ++++++++++++
>   hw/mips/fuloong2e.c |  3 ---
>   hw/ppc/pegasos2.c   |  4 ----
>   3 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 63c1e3b8ce..f05fd9948a 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -23,6 +23,7 @@
>   #include "hw/intc/i8259.h"
>   #include "hw/irq.h"
>   #include "hw/dma/i8257.h"
> +#include "hw/usb/hcd-uhci.h"
>   #include "hw/timer/i8254.h"
>   #include "hw/rtc/mc146818rtc.h"
>   #include "migration/vmstate.h"
> @@ -546,6 +547,7 @@ struct ViaISAState {
>       qemu_irq *isa_irqs;
>       ViaSuperIOState via_sio;
>       PCIIDEState ide;
> +    UHCIState uhci[2];
>   };
>   
>   static const VMStateDescription vmstate_via = {
> @@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
>       ViaISAState *s = VIA_ISA(obj);
>   
>       object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
> +    object_initialize_child(obj, "uhci1", &s->uhci[0], TYPE_VT82C686B_USB_UHCI);
> +    object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
>   }
>   
>   static const TypeInfo via_isa_info = {
> @@ -629,6 +633,14 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>           return;
>       }
> +
> +    /* Functions 2-3: USB Ports */
> +    for (i = 0; i < ARRAY_SIZE(s->uhci); i++) {
> +        qdev_prop_set_int32(DEVICE(&s->uhci[i]), "addr", d->devfn + 2 + i);
> +        if (!qdev_realize(DEVICE(&s->uhci[i]), BUS(pci_bus), errp)) {
> +            return;
> +        }
> +    }
>   }
>   
>   /* TYPE_VT82C686B_ISA */
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 6b7370f2aa..dc92223b76 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -208,9 +208,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>       dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>       pci_ide_create_devs(dev);
>   
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), TYPE_VT82C686B_USB_UHCI);
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), TYPE_VT82C686B_USB_UHCI);
> -
>       dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
>       *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>   
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 70776558c9..85cca6f7a6 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -168,10 +168,6 @@ static void pegasos2_init(MachineState *machine)
>       dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>       pci_ide_create_devs(dev);
>   
> -    /* VT8231 function 2-3: USB Ports */
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), TYPE_VT82C686B_USB_UHCI);
> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), TYPE_VT82C686B_USB_UHCI);
> -
>       /* VT8231 function 4: Power Management Controller */
>       dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
>       i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));

