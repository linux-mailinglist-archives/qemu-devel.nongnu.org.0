Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2028B19B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 11:30:45 +0200 (CEST)
Received: from localhost ([::1]:54654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRuAG-0003Q8-I0
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 05:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRu9M-0002qj-Ec; Mon, 12 Oct 2020 05:29:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49306
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRu9K-0007Na-UP; Mon, 12 Oct 2020 05:29:48 -0400
Received: from host86-158-109-18.range86-158.btcentralplus.com
 ([86.158.109.18] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRu9G-00046R-FB; Mon, 12 Oct 2020 10:29:45 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201012071906.3301481-1-f4bug@amsat.org>
 <20201012071906.3301481-3-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c65a4bef-2897-2641-eed5-7f38a2e27858@ilande.co.uk>
Date: Mon, 12 Oct 2020 10:29:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012071906.3301481-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.18
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/4] hw/pci-host/prep: Remove legacy PReP machine
 temporary workaround
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2020 08:19, Philippe Mathieu-Daudé wrote:

> The legacy PReP machine has been removed in commit b2ce76a0730
> ("hw/ppc/prep: Remove the deprecated "prep" machine and the
> OpenHackware BIOS"). This temporary workaround is no more
> required, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci-host/prep.c | 32 +++++++++++---------------------
>  1 file changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 80dfb67da43..064593d1e52 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -75,7 +75,6 @@ struct PRePPCIState {
>      RavenPCIState pci_dev;
>  
>      int contiguous_map;
> -    bool is_legacy_prep;
>  };
>  
>  #define BIOS_SIZE (1 * MiB)
> @@ -229,24 +228,18 @@ static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
>      MemoryRegion *address_space_mem = get_system_memory();
>      int i;
>  
> -    if (s->is_legacy_prep) {
> -        for (i = 0; i < PCI_NUM_PINS; i++) {
> -            sysbus_init_irq(dev, &s->pci_irqs[i]);
> -        }
> -    } else {
> -        /*
> -         * According to PReP specification section 6.1.6 "System Interrupt
> -         * Assignments", all PCI interrupts are routed via IRQ 15
> -         */
> -        s->or_irq = OR_IRQ(object_new(TYPE_OR_IRQ));
> -        object_property_set_int(OBJECT(s->or_irq), "num-lines", PCI_NUM_PINS,
> -                                &error_fatal);
> -        qdev_realize(DEVICE(s->or_irq), NULL, &error_fatal);
> -        sysbus_init_irq(dev, &s->or_irq->out_irq);
> +    /*
> +     * According to PReP specification section 6.1.6 "System Interrupt
> +     * Assignments", all PCI interrupts are routed via IRQ 15.
> +     */
> +    s->or_irq = OR_IRQ(object_new(TYPE_OR_IRQ));
> +    object_property_set_int(OBJECT(s->or_irq), "num-lines", PCI_NUM_PINS,
> +                            &error_fatal);
> +    qdev_realize(DEVICE(s->or_irq), NULL, &error_fatal);
> +    sysbus_init_irq(dev, &s->or_irq->out_irq);
>  
> -        for (i = 0; i < PCI_NUM_PINS; i++) {
> -            s->pci_irqs[i] = qdev_get_gpio_in(DEVICE(s->or_irq), i);
> -        }
> +    for (i = 0; i < PCI_NUM_PINS; i++) {
> +        s->pci_irqs[i] = qdev_get_gpio_in(DEVICE(s->or_irq), i);
>      }
>  
>      qdev_init_gpio_in(d, raven_change_gpio, 1);
> @@ -403,9 +396,6 @@ static Property raven_pcihost_properties[] = {
>      DEFINE_PROP_UINT32("elf-machine", PREPPCIState, pci_dev.elf_machine,
>                         EM_NONE),
>      DEFINE_PROP_STRING("bios-name", PREPPCIState, pci_dev.bios_name),
> -    /* Temporary workaround until legacy prep machine is removed */
> -    DEFINE_PROP_BOOL("is-legacy-prep", PREPPCIState, is_legacy_prep,
> -                     false),
>      DEFINE_PROP_END_OF_LIST()
>  };

Yes indeed, this workaround is certainly no longer needed.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

