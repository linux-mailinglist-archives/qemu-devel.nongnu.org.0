Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C052FA08
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 10:35:40 +0200 (CEST)
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsKaJ-0006fR-7j
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 04:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKU4-00056e-RQ; Sat, 21 May 2022 04:29:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKU1-0002yD-Mm; Sat, 21 May 2022 04:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pWFBM1TqPi8uwZUT8cwQPrhDipKObIjtqYk/taSH3DA=; b=qM/TTepzFyEUR6JlqiQFXC/Uw6
 H0XtyRpFN56J1vrvu0sF7u6qeRDV96nnf4+UnEkGPP5FYqkrydYd0lkvSDd74QdSwwwXUU+de5G9B
 p1kZCBJ50MQx03GW8wgq0SozuCQ8yLO1lrVqGOyAa2C2FdUCSuFqAU0P8Q1BdOpJv2atgOmY3ebWw
 Xx1HVxWNyP4OkS7sw4L2GdsTJSi97004608PEIMLA7uwfE6C1w2Sz9CQ/PVe+DkTtBOheTh0rcRWN
 dZBeBaapsVAjT7Viwmb6DghhMnxjda1dvDFOI/2WmDm+/67S9or3h3Fuj+oQa+aqfSYpix6/IBrUu
 schPpibdRNk183JcNPu4zWIpHKA2VkTu1cOFQSUOS4pvTedl6opJ+lSqxY9cuzm+7DUvhPCzehadf
 XGHuyscZwTWM5On6wzU6FkalHT8yXBm7m5yqPQA9PcksmGsbG8/guhK9ZvoPhCrzCfX9hXp2El0F8
 mPfxy+TBXlm3dCy5WutF68GB+6KcAFUsR82EwOi1OT6OgVwx2H1lsnh7YHmvpSZvysHZMu76108aY
 Z85FF3OclSUehEVOirsfJ1+yXpXRjVJVRtLujG27auJz/z70oQPtG323zWTmDm+VDRqwHwMwJNv/o
 vqasNN9207goTYc//iv3YpnGLWBVxfrQcpBdkRwHc=;
Received: from host86-135-55-247.range86-135.btcentralplus.com
 ([86.135.55.247] helo=[192.168.50.176])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKSs-000ABm-Iv; Sat, 21 May 2022 09:28:02 +0100
Message-ID: <6ea93f67-b58a-c709-616d-15da4cc2acfc@ilande.co.uk>
Date: Sat, 21 May 2022 09:28:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20220513175445.89616-1-shentey@gmail.com>
 <20220513175445.89616-5-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220513175445.89616-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.135.55.247
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 4/6] hw/isa/piix{3, 4}: Factor out ISABus retrieval from
 create() functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/2022 18:54, Bernhard Beschow wrote:

> Modernizes the code and even saves a few lines.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c             | 3 ++-
>   hw/isa/piix3.c                | 3 +--
>   hw/isa/piix4.c                | 6 +-----
>   hw/mips/malta.c               | 3 ++-
>   include/hw/southbridge/piix.h | 4 ++--
>   5 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index f843dd906f..47932448fd 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -206,9 +206,10 @@ static void pc_init1(MachineState *machine,
>                                 pci_memory, ram_memory);
>           pcms->bus = pci_bus;
>   
> -        piix3 = piix3_create(pci_bus, &isa_bus);
> +        piix3 = piix3_create(pci_bus);
>           piix3->pic = x86ms->gsi;
>           piix3_devfn = piix3->dev.devfn;
> +        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
>       } else {
>           pci_bus = NULL;
>           i440fx_state = NULL;
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index d15117a7c7..6eacb22dd0 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -403,7 +403,7 @@ static void piix3_register_types(void)
>   
>   type_init(piix3_register_types)
>   
> -PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
> +PIIX3State *piix3_create(PCIBus *pci_bus)
>   {
>       PIIX3State *piix3;
>       PCIDevice *pci_dev;
> @@ -412,7 +412,6 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
>   
>       pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
>       piix3 = PIIX3_PCI_DEVICE(pci_dev);
> -    *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
>   
>       return piix3;
>   }
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 134d23aea7..4968c69da9 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -301,7 +301,7 @@ static void piix4_register_types(void)
>   
>   type_init(piix4_register_types)
>   
> -DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
> +DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
>   {
>       PCIDevice *pci;
>       DeviceState *dev;
> @@ -311,10 +311,6 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>                                             TYPE_PIIX4_PCI_DEVICE);
>       dev = DEVICE(pci);
>   
> -    if (isa_bus) {
> -        *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> -    }
> -
>       if (smbus) {
>           *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
>                                  qdev_get_gpio_in_named(dev, "isa", 9),
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 9ffdc5b8f1..e446b25ad0 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1399,7 +1399,8 @@ void mips_malta_init(MachineState *machine)
>       empty_slot_init("GT64120", 0, 0x20000000);
>   
>       /* Southbridge */
> -    dev = piix4_create(pci_bus, &isa_bus, &smbus);
> +    dev = piix4_create(pci_bus, &smbus);
> +    isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
>   
>       /* Interrupt controller */
>       qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index a304fc6041..b768109f30 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -72,8 +72,8 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>   
>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>   
> -PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
> +PIIX3State *piix3_create(PCIBus *pci_bus);
>   
> -DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
> +DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
>   
>   #endif

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

