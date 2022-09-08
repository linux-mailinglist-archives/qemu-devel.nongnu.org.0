Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67565B19D6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:22:56 +0200 (CEST)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEgR-0003vX-St
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEe2-0007lu-Ea; Thu, 08 Sep 2022 06:20:26 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:43997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEe0-0001XU-4H; Thu, 08 Sep 2022 06:20:26 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so12040425oth.10; 
 Thu, 08 Sep 2022 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3P7XOlexNe1Ak3k+wbpo53Ib/Bg+RrIqOr5xWK9wKA0=;
 b=eHzyPPGywD9JAp3pbEf7SiFxRPMV2/UEB3jqsUVO8AdTXl5rg4giHtt+yFAuyYQZW6
 PcdmqCOs4igeiZ4TGLW2VmENC6X4qf/URRJifrw35y5de7etXOJX867gD4HrHR+IkJkS
 mTIN6lhlGQcQ3AonUfVIs7uFxG458Y4UtcEisbdEvO6UxHyF3qZOAkiNzd7R7CnZJofj
 x7h9sMgura7vZj+Q+obPvfxYlyFgpUthU3e52IUYCaoTwNaJM476ZFpgkx7NVbL8amvX
 MOkxYTl/EB0C2h/IhazIU/poaUEDa4LI7R23WeF7BYCmrqv3rhMyKCFK/mUu8FTcSD+q
 ZPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3P7XOlexNe1Ak3k+wbpo53Ib/Bg+RrIqOr5xWK9wKA0=;
 b=YN+6MQpskZ37eraefL18XVr1euCqH0AQ5wBQM8tTlprK3tuT9x2nZzXXxmesBZFKTd
 JbO1G0ax+nS8SYlQz4FdJTOtyEjNMMjLARTVMzdOQFJiLU2sQNRoJHrMMv7jYpHNhv3M
 wuL6+7ItZ7vINBC5C4kEpXb/sIN3yn9yhpVpCtqY8IuZK3+73Ylk/yTyDy7jpKRxSvRi
 e86IvYqYPfWgJ57Ubz4KWsrn3OVmk89SgiFxakSJHn7GIM7eHFTjtvNM69NfpMGWVmB4
 DFamhdI1Q7V57JPNqpPiKYOPpHZg3QLWsg0dS9e4HKIUtcHQF+1zpuvbTH9uAgBXZoo6
 qzqA==
X-Gm-Message-State: ACgBeo1H67d1fc7zVBdFiuKKJC+RKVj/vN/lmc1fzNZ9ABc/WUa2Dtae
 i14FMSrrWAP/Hmuq1/Q+FmY=
X-Google-Smtp-Source: AA6agR7eO5oM57epDKBoExZymI/NzjIFWSTibSR72uw+5nQX+eZl4yjXu8KnV+Tpg0YwI72YJiXopQ==
X-Received: by 2002:a05:6830:418a:b0:639:683b:82c7 with SMTP id
 r10-20020a056830418a00b00639683b82c7mr3153561otu.187.1662632422441; 
 Thu, 08 Sep 2022 03:20:22 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 t16-20020a056870601000b0011d23ed5365sm9316414oaa.43.2022.09.08.03.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 03:20:21 -0700 (PDT)
Message-ID: <02a310ba-09b7-bad7-ba09-971d870cca1b@gmail.com>
Date: Thu, 8 Sep 2022 07:20:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 06/13] hw/isa/vt82c686: Instantiate IDE function in
 host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-7-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901114127.53914-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
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
> The IDE function is closely tied to the ISA function (e.g. the IDE
> interrupt routing happens there), so it makes sense that the IDE
> function is instantiated within the south bridge itself.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   configs/devices/mips64el-softmmu/default.mak |  1 -
>   hw/isa/Kconfig                               |  1 +
>   hw/isa/vt82c686.c                            | 17 +++++++++++++++++
>   hw/mips/fuloong2e.c                          |  8 ++++----
>   hw/ppc/Kconfig                               |  1 -
>   hw/ppc/pegasos2.c                            |  9 ++++-----
>   6 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
> index c610749ac1..d5188f7ea5 100644
> --- a/configs/devices/mips64el-softmmu/default.mak
> +++ b/configs/devices/mips64el-softmmu/default.mak
> @@ -1,7 +1,6 @@
>   # Default configuration for mips64el-softmmu
>   
>   include ../mips-softmmu/common.mak
> -CONFIG_IDE_VIA=y
>   CONFIG_FULOONG=y
>   CONFIG_LOONGSON3V=y
>   CONFIG_ATI_VGA=y
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index d42143a991..20de7e9294 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -53,6 +53,7 @@ config VT82C686
>       select I8254
>       select I8257
>       select I8259
> +    select IDE_VIA
>       select MC146818RTC
>       select PARALLEL
>   
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 37e37b3855..63c1e3b8ce 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -17,6 +17,7 @@
>   #include "hw/isa/vt82c686.h"
>   #include "hw/pci/pci.h"
>   #include "hw/qdev-properties.h"
> +#include "hw/ide/pci.h"
>   #include "hw/isa/isa.h"
>   #include "hw/isa/superio.h"
>   #include "hw/intc/i8259.h"
> @@ -544,6 +545,7 @@ struct ViaISAState {
>       qemu_irq cpu_intr;
>       qemu_irq *isa_irqs;
>       ViaSuperIOState via_sio;
> +    PCIIDEState ide;
>   };
>   
>   static const VMStateDescription vmstate_via = {
> @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via = {
>       }
>   };
>   
> +static void via_isa_init(Object *obj)
> +{
> +    ViaISAState *s = VIA_ISA(obj);
> +
> +    object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
> +}
> +
>   static const TypeInfo via_isa_info = {
>       .name          = TYPE_VIA_ISA,
>       .parent        = TYPE_PCI_DEVICE,
>       .instance_size = sizeof(ViaISAState),
> +    .instance_init = via_isa_init,
>       .abstract      = true,
>       .interfaces    = (InterfaceInfo[]) {
>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> @@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>   {
>       ViaISAState *s = VIA_ISA(d);
>       DeviceState *dev = DEVICE(d);
> +    PCIBus *pci_bus = pci_get_bus(d);
>       qemu_irq *isa_irq;
>       ISABus *isa_bus;
>       int i;
> @@ -612,6 +623,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
>           return;
>       }
> +
> +    /* Function 1: IDE */
> +    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
> +    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
> +        return;
> +    }
>   }
>   
>   /* TYPE_VT82C686B_ISA */
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 44225fbe33..32605901e7 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -199,13 +199,13 @@ static void main_cpu_reset(void *opaque)
>   static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>                                          I2CBus **i2c_bus)
>   {
> -    PCIDevice *dev;
> +    PCIDevice *dev, *via;
>   
> -    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
> +    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
>                                             TYPE_VT82C686B_ISA);
> -    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
> +    qdev_connect_gpio_out(DEVICE(via), 0, intc);
>   
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), TYPE_VIA_IDE);
> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>       pci_ide_create_devs(dev);
>   
>       pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 400511c6b7..18565e966b 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -74,7 +74,6 @@ config PEGASOS2
>       bool
>       select MV64361
>       select VT82C686
> -    select IDE_VIA
>       select SMBUS_EEPROM
>       select VOF
>   # This should come with VT82C686
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 8039775f80..8bc528a560 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -102,7 +102,7 @@ static void pegasos2_init(MachineState *machine)
>       CPUPPCState *env;
>       MemoryRegion *rom = g_new(MemoryRegion, 1);
>       PCIBus *pci_bus;
> -    PCIDevice *dev;
> +    PCIDevice *dev, *via;
>       I2CBus *i2c_bus;
>       const char *fwname = machine->firmware ?: PROM_FILENAME;
>       char *filename;
> @@ -160,13 +160,12 @@ static void pegasos2_init(MachineState *machine)
>   
>       /* VIA VT8231 South Bridge (multifunction PCI device) */
>       /* VT8231 function 0: PCI-to-ISA Bridge */
> -    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
> +    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
>                                             TYPE_VT8231_ISA);
> -    qdev_connect_gpio_out(DEVICE(dev), 0,
> +    qdev_connect_gpio_out(DEVICE(via), 0,
>                             qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>   
> -    /* VT8231 function 1: IDE Controller */
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), TYPE_VIA_IDE);
> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>       pci_ide_create_devs(dev);
>   
>       /* VT8231 function 2-3: USB Ports */

