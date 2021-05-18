Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F85388063
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:18:06 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5ED-0006Ij-F4
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj5CM-0004wB-01
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj5CJ-0005Hd-Th
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621365367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1so16hSBoMdaQGnReatj/RuXXcVcpAsce7gLugKMfPU=;
 b=eUfj5ZHNHrvSZOzDAnYS/hJgoR+CkR3fbISvegN4V3Sc9BZfBfrfFXpRfpyCsC9DVRdOjt
 BWHc9u41XuerIlHbWeNLQLWl5AUBsHMg9xDbdSWE9BeuQ3f7Sc8xf5PzRME+XU5T5JpaXR
 vhuLHBI97KEFDm/+HHzyoj2V3VTnPtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-O7vMh-lLMy2Onnz40D5vSw-1; Tue, 18 May 2021 15:16:05 -0400
X-MC-Unique: O7vMh-lLMy2Onnz40D5vSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 042F68015DB;
 Tue, 18 May 2021 19:16:04 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7282E5D703;
 Tue, 18 May 2021 19:16:02 +0000 (UTC)
Subject: Re: [PATCH v2 5/6] hw/ide/via: Connect IDE function output IRQs to
 the ISA function input
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210511041848.2743312-1-f4bug@amsat.org>
 <20210511041848.2743312-6-f4bug@amsat.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <04badf91-43f7-4a6f-9a7d-8b3df2ae1cf3@redhat.com>
Date: Tue, 18 May 2021 15:16:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511041848.2743312-6-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 12:18 AM, Philippe Mathieu-Daudé wrote:
> To avoid abusing isa_get_irq(NULL) using a hidden ISA bridge
> under the hood, let the IDE function expose 2 output IRQs,
> and connect them to the ISA function inputs when creating
> the south bridge chipset model in vt82c686b_southbridge_init.
> 

Seems reasonable on the surface. How do I test this? How did you test it?

--js

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ide/via.c        | 19 +++++++++++++++++--
>   hw/mips/fuloong2e.c |  9 ++++++++-
>   2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 6c667a92130..7887bf181e6 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -33,6 +33,17 @@
>   #include "hw/ide/pci.h"
>   #include "trace.h"
>   
> +#define TYPE_VIA_IDE "via-ide"
> +OBJECT_DECLARE_SIMPLE_TYPE(VIAIDEState, VIA_IDE)
> +
> +struct VIAIDEState {
> +    /* <private> */
> +    PCIIDEState parent_obj;
> +    /* <public> */
> +
> +    qemu_irq irq[2];
> +};
> +
>   static uint64_t bmdma_read(void *opaque, hwaddr addr,
>                              unsigned size)
>   {
> @@ -105,6 +116,7 @@ static void bmdma_setup_bar(PCIIDEState *d)
>   static void via_ide_set_irq(void *opaque, int n, int level)
>   {
>       PCIDevice *d = PCI_DEVICE(opaque);
> +    VIAIDEState *s = VIA_IDE(d);
>   
>       if (level) {
>           d->config[0x70 + n * 8] |= 0x80;
> @@ -112,7 +124,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
>           d->config[0x70 + n * 8] &= ~0x80;
>       }
>   
> -    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
> +    qemu_set_irq(s->irq[n], level);
>   }
>   
>   static void via_ide_reset(DeviceState *dev)
> @@ -159,6 +171,7 @@ static void via_ide_reset(DeviceState *dev)
>   
>   static void via_ide_realize(PCIDevice *dev, Error **errp)
>   {
> +    VIAIDEState *s = VIA_IDE(dev);
>       PCIIDEState *d = PCI_IDE(dev);
>       DeviceState *ds = DEVICE(dev);
>       uint8_t *pci_conf = dev->config;
> @@ -188,6 +201,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>       bmdma_setup_bar(d);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>   
> +    qdev_init_gpio_out_named(ds, s->irq, "ide-irq", ARRAY_SIZE(s->irq));
>       qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
>       for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
>           ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, MAX_IDE_DEVS);
> @@ -227,8 +241,9 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
>   }
>   
>   static const TypeInfo via_ide_info = {
> -    .name          = "via-ide",
> +    .name          = TYPE_VIA_IDE,
>       .parent        = TYPE_PCI_IDE,
> +    .instance_size = sizeof(VIAIDEState),
>       .class_init    = via_ide_class_init,
>   };
>   
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 3e7a7e4389d..17b5e41cc7d 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -201,12 +201,19 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>                                          I2CBus **i2c_bus)
>   {
>       PCIDevice *dev;
> +    DeviceState *isa;
>   
>       dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
>                                             TYPE_VT82C686B_ISA);
> -    qdev_connect_gpio_out_named(DEVICE(dev), "intr", 0, intc);
> +    isa = DEVICE(dev);
> +    qdev_connect_gpio_out_named(isa, "intr", 0, intc);
>   
>       dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> +    for (unsigned i = 0; i < 2; i++) {
> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", i,
> +                                    qdev_get_gpio_in_named(isa,
> +                                                           "isa-irq", 14 + i));
> +    }
>       pci_ide_create_devs(dev);
>   
>       pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> 


