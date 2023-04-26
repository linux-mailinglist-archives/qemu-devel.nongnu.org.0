Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E37D6EF228
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:37:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcVH-0006eZ-JS; Wed, 26 Apr 2023 06:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcVF-0006e2-SI; Wed, 26 Apr 2023 06:36:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcVE-0002Ni-3V; Wed, 26 Apr 2023 06:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcSDnkxTbm1NB3yqQeFsuudF9K0dKFwL+B2jUcip6RA=; b=Oeg9ExiZU/KTOD1JxdPizwwnO8
 /HRk+p9QL5CPrD6JKKwQQfHcmw/7gRDzIMHp9UMTCYJFHLXOcNuFnqPyqxlMgn5FlmTnW8y4Ng0mQ
 c1r4EM9CFhAKxWljDy8rNpxXp0BuZcGr/020QHFFS65JCfWJHBruU10mpFVt5Ts8e8xskzzz3GCsH
 9ZkR/nzZQ31c4jRXpG4PJ+c5MUEHlVDEtJCCwFmYUAOhEJBFINH0yun4rUhnzmNubaeRRrcj/7WmR
 58qdesqJbvcrNNK2ccdhmcSeFlVI7TF14uGal35b8DZzhI0wp7ZTcIGhtJAFmytt6iHpsCIVQn3gh
 +iwWHHH3pLVe/bC515OlRyL/iFP/D8AwI3nTUwCz7+qsWM55OrkBY3Ylac2nKLDpQawS3JSUy4JDv
 W96+y5mQKxxE/F4V4ubzi/x3iKkUl+qYXG385PZNSH77aHzNe+eDrrkr+cXw++uJI50qwHVTzUqTc
 CoICqbEo8AMkEUnLjThVUmkL2BmE43p08N8hCFKx54K6VhqgazIbySPWz8AUnd6oF2mdF0CqrfmQl
 rpNcBPOq9wWHCdD6K3URfw90umcI+OccFoEHg1G9EgCkqN9LZD13ADFWvOg+p9h55so7nacLhRPU9
 vQWYYcFcFw+e91CQNa5+o0VsDuDTRGR2oLOL5fVIs=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcU5-0001Xi-BY; Wed, 26 Apr 2023 11:34:53 +0100
Message-ID: <c5c6b9af-57de-f631-5282-a645f64aa5ef@ilande.co.uk>
Date: Wed, 26 Apr 2023 11:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org, qemu-block@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-2-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 01/18] hw/ide/piix: Expose output IRQ as properties for
 late object population
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

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ide/piix.c         | 14 ++++++++++++--
>   include/hw/ide/piix.h |  4 ++++
>   2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 41d60921e3..a36dac8469 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -121,6 +121,13 @@ static void piix_ide_reset(DeviceState *dev)
>       pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>   }
>   
> +static void piix_ide_initfn(Object *obj)
> +{
> +    PCIIDEState *dev = PCI_IDE(obj);
> +
> +    qdev_init_gpio_out_named(DEVICE(obj), dev->isa_irq, "ide-irq", 2);
> +}
> +
>   static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>   {
>       static const struct {
> @@ -133,6 +140,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>       };
>       int ret;
>   
> +    qemu_irq irq_out = d->isa_irq[i] ? : isa_get_irq(NULL, port_info[i].isairq);
>       ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>       ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
>                             port_info[i].iobase2);
> @@ -141,7 +149,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>                            object_get_typename(OBJECT(d)), i);
>           return false;
>       }
> -    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
> +    ide_bus_init_output_irq(&d->bus[i], irq_out);
>   
>       bmdma_init(&d->bus[i], &d->bmdma[i], d);
>       d->bmdma[i].bus = &d->bus[i];
> @@ -162,7 +170,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>   
>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>   
> -    for (unsigned i = 0; i < 2; i++) {
> +    for (unsigned i = 0; i < ARRAY_SIZE(d->isa_irq); i++) {
>           if (!pci_piix_init_bus(d, i, errp)) {
>               return;
>           }
> @@ -199,6 +207,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
>   static const TypeInfo piix3_ide_info = {
>       .name          = TYPE_PIIX3_IDE,
>       .parent        = TYPE_PCI_IDE,
> +    .instance_init = piix_ide_initfn,
>       .class_init    = piix3_ide_class_init,
>   };
>   
> @@ -221,6 +230,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>   static const TypeInfo piix4_ide_info = {
>       .name          = TYPE_PIIX4_IDE,
>       .parent        = TYPE_PCI_IDE,
> +    .instance_init = piix_ide_initfn,
>       .class_init    = piix4_ide_class_init,
>   };
>   
> diff --git a/include/hw/ide/piix.h b/include/hw/ide/piix.h
> index ef3ef3d62d..533d24d408 100644
> --- a/include/hw/ide/piix.h
> +++ b/include/hw/ide/piix.h
> @@ -1,6 +1,10 @@
>   #ifndef HW_IDE_PIIX_H
>   #define HW_IDE_PIIX_H
>   
> +/*
> + * QEMU interface:
> + *  + named GPIO outputs "ide-irq": asserted by each IDE channel
> + */
>   #define TYPE_PIIX3_IDE "piix3-ide"
>   #define TYPE_PIIX4_IDE "piix4-ide"

Comparing this with Bernhard's latest series, Bernhard's patch at 
https://patchew.org/QEMU/20230422150728.176512-1-shentey@gmail.com/20230422150728.176512-2-shentey@gmail.com/ 
(with a small change) is the version we should use, since legacy IRQs are a feature 
of all PCI IDE controllers and not just the PIIX controllers.

If we do it this way then it is possible for all PCI IDE controllers to share the 
same logic for BDMA and legacy/native mode switching moving forward: if a PCI IDE 
controller doesn't implement legacy IRQ routing then the board can leave the IRQs 
disconnected.


ATB,

Mark.

