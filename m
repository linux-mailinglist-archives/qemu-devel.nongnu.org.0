Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84D6EF58F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:35:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfHl-0003XH-7U; Wed, 26 Apr 2023 09:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfHi-0003VM-L8; Wed, 26 Apr 2023 09:34:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfHg-0005Si-Mq; Wed, 26 Apr 2023 09:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/0OFy/r3xjU3v19Xq3yXsSXBoQEzOQDS0dmCGck/Cpc=; b=V7ws1mPIBmyCzWnwN4yjvhQgSw
 11mrPMmLq5HnerKXr1vHRGv48YncBz0P9g7lVHOZj509ZCFoj/3Dk+qxD6zOo9nZ0jogUvGJOgTeE
 L8lV5bK3sM8f3tA6HFVAot8QtUzjZBTqxynTMq6PJqR/WgHNAVPb1GpipgMaYWdsnmVQevVaz7u7p
 PqtXxuuDurQyTYHklmjWCt+eEBpEhuzvIFBQBUIA5iQVYQpuqEKhmDTdXFhNjhgvEfYmEiFDNvTqY
 f3GYjQwXDbfKhIjvgaIk9izysjQbbdIxMurn/GVJ409b9Nhh40j3SOF/C47LCLssA+cgzyPmRo5oz
 NQ9Uqngyo2UBrPEOSasOOhQjnD272Zdd19JZxeQe5PYf1otXvzhwV3RVknAEry4g4MiutAwopU507
 ayDpazhdVX6kBT6Z/I40Z2RoGQLYv1UhpFWuU3y5I8TgvvuPtKKNhLG33WrVIw5A1TJyu0xaNMYwu
 +nBi5yzpiFwCElcKGuTL9diwxMVs6BgBMKUkyIBJc7xFzOBepJpApqgSQelCV+MVAeIimnhtTkn5b
 8TU0Qx+h0rWn3dTQrUFQq64axzzRnTXgp4yqA5/QyPjHvEAVBOjUxXTjrL+8w0HsW933dEO9MoCu9
 KirrjPyIp5xjWIVnIaG6QAzlhVHTbH9NKx2Im8q84=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfGd-0002qH-Nb; Wed, 26 Apr 2023 14:33:11 +0100
Message-ID: <0bbfbda2-27b8-9433-1d6b-c1dd35c777f3@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-18-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 17/18] hw/isa/piix: Unify QOM type name of PIIX ISA
 function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> Mechanical change doing:
> 
>    $ sed -i -e 's/PIIX4_PCI_DEVICE/PIIX4_ISA/g' $(git grep -l PIIX4_PCI_DEVICE)
>    $ sed -i -e 's/PIIX3_XEN_DEVICE/PIIX3_ISA_XEN/g' $(git grep -l PIIX3_XEN_DEVICE)
>    $ sed -i -e 's/PIIX3_DEVICE/PIIX3_ISA/g' $(git grep -l PIIX3_DEVICE)
>    $ sed -i -e 's/PIIX3_PCI_DEVICE/PIIX_ISA/g' $(git grep -l PIIX3_PCI_DEVICE)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/pc_piix.c             |  5 ++---
>   hw/isa/piix3.c                | 20 ++++++++++----------
>   hw/isa/piix4.c                | 10 +++++-----
>   hw/mips/malta.c               |  2 +-
>   include/hw/southbridge/piix.h | 10 +++++-----
>   5 files changed, 23 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 1e90b9ff0d..c887b27009 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -221,8 +221,7 @@ static void pc_init1(MachineState *machine,
>       if (pcmc->pci_enabled) {
>           PIIX3State *piix3;
>           PCIDevice *pci_dev;
> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> -                                         : TYPE_PIIX3_DEVICE;
> +        const char *type = xen_enabled() ? TYPE_PIIX3_ISA_XEN : TYPE_PIIX3_ISA;
>   
>           pci_bus = i440fx_init(pci_type,
>                                 i440fx_host,
> @@ -236,7 +235,7 @@ static void pc_init1(MachineState *machine,
>           pcms->bus = pci_bus;
>   
>           pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> +        piix3 = PIIX3_ISA(pci_dev);
>           piix3->pic = x86ms->gsi;
>           piix3_devfn = piix3->dev.devfn;
>           isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 0ee94a2313..38e0c269ae 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -112,7 +112,7 @@ static void piix3_write_config(PCIDevice *dev,
>   {
>       pci_default_write_config(dev, address, val, len);
>       if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
> -        PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
> +        PIIX3State *piix3 = PIIX3_ISA(dev);
>           int pic_irq;
>   
>           pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
> @@ -145,7 +145,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
>   
>   static void piix3_reset(DeviceState *dev)
>   {
> -    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
> +    PIIX3State *d = PIIX3_ISA(dev);
>       uint8_t *pci_conf = d->dev.config;
>   
>       pci_conf[0x04] = 0x07; /* master, memory and I/O */
> @@ -286,7 +286,7 @@ static const MemoryRegionOps rcr_ops = {
>   
>   static void pci_piix3_realize(PCIDevice *dev, Error **errp)
>   {
> -    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
> +    PIIX3State *d = PIIX3_ISA(dev);
>       ISABus *isa_bus;
>   
>       isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
> @@ -349,7 +349,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
>   static void piix3_realize(PCIDevice *dev, Error **errp)
>   {
>       ERRP_GUARD();
> -    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
> +    PIIX3State *piix3 = PIIX3_ISA(dev);
>       PCIBus *pci_bus = pci_get_bus(dev);
>   
>       pci_piix3_realize(dev, errp);
> @@ -372,7 +372,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
>   static void piix3_xen_realize(PCIDevice *dev, Error **errp)
>   {
>       ERRP_GUARD();
> -    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
> +    PIIX3State *piix3 = PIIX3_ISA(dev);
>       PCIBus *pci_bus = pci_get_bus(dev);
>   
>       pci_piix3_realize(dev, errp);
> @@ -399,7 +399,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
>   
>   static const TypeInfo piix_isa_types[] = {
>       {
> -        .name           = TYPE_PIIX3_PCI_DEVICE,
> +        .name           = TYPE_PIIX_ISA,
>           .parent         = TYPE_PCI_DEVICE,
>           .instance_size  = sizeof(PIIX3State),
>           .class_init     = pci_piix3_class_init,
> @@ -410,12 +410,12 @@ static const TypeInfo piix_isa_types[] = {
>               { },
>           },
>       }, {
> -        .name           = TYPE_PIIX3_DEVICE,
> -        .parent         = TYPE_PIIX3_PCI_DEVICE,
> +        .name           = TYPE_PIIX3_ISA,
> +        .parent         = TYPE_PIIX_ISA,
>           .class_init     = piix3_class_init,
>       }, {
> -        .name           = TYPE_PIIX3_XEN_DEVICE,
> -        .parent         = TYPE_PIIX3_PCI_DEVICE,
> +        .name           = TYPE_PIIX3_ISA_XEN,
> +        .parent         = TYPE_PIIX_ISA,
>           .class_init     = piix3_xen_class_init,
>       }
>   };
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 702b458a3e..90e19a4c37 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -56,7 +56,7 @@ struct PIIX4State {
>       uint8_t rcr;
>   };
>   
> -OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
> +OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_ISA)
>   
>   static void piix4_set_irq(void *opaque, int irq_num, int level)
>   {
> @@ -81,7 +81,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>   
>   static void piix4_isa_reset(DeviceState *dev)
>   {
> -    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
> +    PIIX4State *d = PIIX4_ISA(dev);
>       uint8_t *pci_conf = d->dev.config;
>   
>       pci_conf[0x04] = 0x07; // master, memory and I/O
> @@ -186,7 +186,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
>   
>   static void piix4_realize(PCIDevice *dev, Error **errp)
>   {
> -    PIIX4State *s = PIIX4_PCI_DEVICE(dev);
> +    PIIX4State *s = PIIX4_ISA(dev);
>       PCIBus *pci_bus = pci_get_bus(dev);
>       ISABus *isa_bus;
>       qemu_irq *i8259_out_irq;
> @@ -253,7 +253,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>   
>   static void piix4_init(Object *obj)
>   {
> -    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
> +    PIIX4State *s = PIIX4_ISA(obj);
>   
>       object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>       object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
> @@ -285,7 +285,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
>   }
>   
>   static const TypeInfo piix4_info = {
> -    .name          = TYPE_PIIX4_PCI_DEVICE,
> +    .name          = TYPE_PIIX4_ISA,
>       .parent        = TYPE_PCI_DEVICE,
>       .instance_size = sizeof(PIIX4State),
>       .instance_init = piix4_init,
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index ec172b111a..5aefeba581 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1255,7 +1255,7 @@ void mips_malta_init(MachineState *machine)
>   
>       /* Southbridge */
>       piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
> -                                            TYPE_PIIX4_PCI_DEVICE);
> +                                            TYPE_PIIX4_ISA);
>       isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
>   
>       dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index a58bf13a41..71a82ef266 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -58,11 +58,11 @@ struct PIIX3State {
>       MemoryRegion rcr_mem;
>   };
>   
> -#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
> -#define TYPE_PIIX3_DEVICE "PIIX3"
> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> -#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> +#define TYPE_PIIX_ISA       "pci-piix3"
> +#define TYPE_PIIX3_ISA      "PIIX3"
> +#define TYPE_PIIX3_ISA_XEN  "PIIX3-xen"
> +#define TYPE_PIIX4_ISA      "piix4-isa"
>   
> -OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_PCI_DEVICE)
> +OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_ISA)
>   
>   #endif

I think this patch makes things more confusing: here you've got a type with a parent 
of PCI_DEVICE which is then using a PIIX3_ISA QOM macro. I'd prefer to leave this, or 
rename it to something that better represents what it is i.e. PIIX3_PCI_ISA_BRIDGE.


ATB,

Mark.

