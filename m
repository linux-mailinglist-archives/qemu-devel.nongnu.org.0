Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9352FA1F
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 10:56:00 +0200 (CEST)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsKtz-0000GZ-OC
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 04:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKhd-0004Qa-OK; Sat, 21 May 2022 04:43:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKhb-00053X-RB; Sat, 21 May 2022 04:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wc3EJS6B/NJeu+zziQ1yBv0Hvri41Xqcgz7WCswFw04=; b=LeBq9C3XB/2nX93vLDohgzutMK
 eVeDpj8NJ9GUjsQZWONghmb3RV/Qll98mOSPhptRzNKssOO60dflTMoY2U+WBPjB3VlMjzAAWsk9R
 kSFmJcWd7HqkyC0tUovbEICDJOAySy0gGfd3Ha6RawcFvCCwil7HzfKNS6ntWKxPOWrk98ajHhn/K
 q++8yNN8MFDzCxNAxpYXRHPS93INoKV0ZDA713Ul/mZkVZ11sphUhuo7lD1p8z4irf3ZtpdR8Obqc
 SmwBQNvuVEmgnk2XqPfRgtRQuiHlpHcR3GuFgPDDylDVt0Y7XOFmEHkTPkD6hlWRXS16eU0apI3bj
 2WYehuzauYSjytq+cqOj0mxg62NkcRO6SKsYmX3HxU1bhWF+U1C/BiQO2Iw/ym0580foOmfms2+z/
 fV33ENfwIP28ykFtsl74XlRw5AzucXfJPTL0DBYEe5o8BSfyOt3dQW8+A4CV44BArfRW3f554G7Mw
 OMelKon2kp+Oka6UOpYZLLm4nEXrEPU53CkCxGuzIguQ6D8U65ux+htehGIH3liTgJiq3UQdMmwGB
 SA70lqXCL80o/4hn19+pV/3RhqnYKhAlrwK5aQxsQx1jDHtJ38Yu2TtGBY7SZHD8m8/m7e2XmKT5h
 6O7AnFn9fctKuBacV4jt/4wZzaGK3hMEe93v7/Eyc=;
Received: from host86-135-55-247.range86-135.btcentralplus.com
 ([86.135.55.247] helo=[192.168.50.176])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKgX-000AIS-2a; Sat, 21 May 2022 09:42:09 +0100
Message-ID: <aa93e92d-464b-366c-8724-7933db06f50c@ilande.co.uk>
Date: Sat, 21 May 2022 09:43:03 +0100
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
 <20220513175445.89616-7-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220513175445.89616-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.135.55.247
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 6/6] hw/isa/piix{3,4}: Inline and remove create() functions
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

> During the previous changesets the create() functions became trivial
> wrappers around more generic functions. Modernize the code.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c             |  6 +++++-
>   hw/isa/piix3.c                | 16 ----------------
>   hw/isa/piix4.c                | 10 ----------
>   hw/mips/malta.c               |  3 ++-
>   include/hw/southbridge/piix.h |  6 ++----
>   5 files changed, 9 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 47932448fd..82c7941958 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -196,6 +196,9 @@ static void pc_init1(MachineState *machine,
>   
>       if (pcmc->pci_enabled) {
>           PIIX3State *piix3;
> +        PCIDevice *pci_dev;
> +        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> +                                         : TYPE_PIIX3_DEVICE;
>   
>           pci_bus = i440fx_init(host_type,
>                                 pci_type,
> @@ -206,7 +209,8 @@ static void pc_init1(MachineState *machine,
>                                 pci_memory, ram_memory);
>           pcms->bus = pci_bus;
>   
> -        piix3 = piix3_create(pci_bus);
> +        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> +        piix3 = PIIX3_PCI_DEVICE(pci_dev);
>           piix3->pic = x86ms->gsi;
>           piix3_devfn = piix3->dev.devfn;
>           isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 6eacb22dd0..01c376b39a 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -36,9 +36,6 @@
>   
>   #define XEN_PIIX_NUM_PIRQS      128ULL
>   
> -#define TYPE_PIIX3_DEVICE "PIIX3"
> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> -
>   static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
>   {
>       qemu_set_irq(piix3->pic[pic_irq],
> @@ -402,16 +399,3 @@ static void piix3_register_types(void)
>   }
>   
>   type_init(piix3_register_types)
> -
> -PIIX3State *piix3_create(PCIBus *pci_bus)
> -{
> -    PIIX3State *piix3;
> -    PCIDevice *pci_dev;
> -    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> -                                     : TYPE_PIIX3_DEVICE;
> -
> -    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> -    piix3 = PIIX3_PCI_DEVICE(pci_dev);
> -
> -    return piix3;
> -}
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 852e5c4db1..a70063bc77 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -300,13 +300,3 @@ static void piix4_register_types(void)
>   }
>   
>   type_init(piix4_register_types)
> -
> -PCIDevice *piix4_create(PCIBus *pci_bus)
> -{
> -    PCIDevice *pci;
> -
> -    pci = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
> -                                          TYPE_PIIX4_PCI_DEVICE);
> -
> -    return pci;
> -}
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index d4bd3549d0..57b5eddc74 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1400,7 +1400,8 @@ void mips_malta_init(MachineState *machine)
>       empty_slot_init("GT64120", 0, 0x20000000);
>   
>       /* Southbridge */
> -    piix4 = piix4_create(pci_bus);
> +    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
> +                                            TYPE_PIIX4_PCI_DEVICE);
>       dev = DEVICE(piix4);
>       isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
>       smbus = piix4_pm_init(pci_bus, piix4->devfn + 3, 0x1100,
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index bea3b44551..2d55dbdef7 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -70,10 +70,8 @@ typedef struct PIIXState PIIX3State;
>   DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>                            TYPE_PIIX3_PCI_DEVICE)
>   
> +#define TYPE_PIIX3_DEVICE "PIIX3"
> +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"

I think it would make sense for the movement of these types to be included in patch 1 
in a single place.

> -PIIX3State *piix3_create(PCIBus *pci_bus);
> -
> -PCIDevice *piix4_create(PCIBus *pci_bus);
> -
>   #endif

Otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

