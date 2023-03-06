Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067EB6AD033
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIMg-00042n-NO; Mon, 06 Mar 2023 16:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZIMc-00042I-Sa; Mon, 06 Mar 2023 16:27:22 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZIMZ-0008S9-To; Mon, 06 Mar 2023 16:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IrV3w46kQJrgFDuf5pFy0xCxmf+MwWGs44GH0NtivTY=; b=MagJ9EUs3q1R4Iqg4/ohyWvw6L
 Un1rw/re675b8MF7ACbYFPXdAzjzGjuXkIihtRKxA03iju3JclIPK67JrDv9beyleRHxGazWk4g3k
 4Y+yNErvvmefedHpMe9KnTgEzKeIrOl4GSAu9wyrSwDGjuSf+rHfiJFfY0R6399fLPAk5PjJfJZ/6
 Cwd+pQjleT9ZiBwwtzE6qIyceAwRArO2v5xZyYe1rbYZj68EYqQbvDbdBgb5F3lGs2uMBoWqi1fbr
 J/NUPj0TNyV/dYOG3IcQjB199jcWJpeI6B9h2oW50XTShqHHl6lhQhIuB5B6EQ21oCXdf7tvjsdte
 ktqzL+ud5hnY5VyGSEbfm7/m++soFp0tMKz2sGQh+zGqMSQnjx7eWfULVJTbHRjypRbKWO8P43ldZ
 l2iJqbQL3ItbfweUJIr51LU6Wk9NPwljpdGsg/gLSpTde11/n+cxwCAPJ2nv/ep70HFCc2NwrFtbQ
 HgJOoFHCow3XZdFT1HTtoryeFoBp/Mx0txH+dFxhGBXYqoP5wIGTVmv4X2AShMAn9/PBd0R7uIhhN
 kxNrX+VLRHQiEUYC7jzoYuNUVk+o6rNPrg69iBYX6gTAFX6p9QOXjNSgmpLxA5masFTupBD1vSy9c
 0nS8XS7lihuDi0nP/tHJNhzi1LD4zmyQou5k0uTPU=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZILp-000CmM-TR; Mon, 06 Mar 2023 21:26:38 +0000
Message-ID: <b9400e40-b0da-c260-068b-4358933f933d@ilande.co.uk>
Date: Mon, 6 Mar 2023 21:27:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <42b740d38b810474948b303b0d325dc1aa054224.1678105081.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <42b740d38b810474948b303b0d325dc1aa054224.1678105081.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v8 4/6] hw/ppc/pegasos2: Fix PCI interrupt routing
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/03/2023 12:33, BALATON Zoltan wrote:

> According to the PegasosII schematics the PCI interrupt lines are
> connected to both the gpp pins of the Mv64361 north bridge and the
> PINT pins of the VT8231 south bridge so guests can get interrupts from
> either of these. So far we only had the MV64361 connections which
> worked for on board devices but for additional PCI devices (such as
> network or sound card added with -device) guest OSes expect interrupt
> from the ISA IRQ 9 where the firmware routes these PCI interrupts in
> VT8231 ISA bridge. After the previous patches we can now model this
> and also remove the board specific connection from mv64361. Also
> configure routing of these lines when using Virtual Open Firmware to
> match board firmware for guests that expect this.
> 
> This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Rene Engel <ReneEngel80@emailn.de>
> ---
>   hw/pci-host/mv64361.c |  4 ----
>   hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
>   2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
> index 298564f1f5..19e8031a3f 100644
> --- a/hw/pci-host/mv64361.c
> +++ b/hw/pci-host/mv64361.c
> @@ -873,10 +873,6 @@ static void mv64361_realize(DeviceState *dev, Error **errp)
>       }
>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
>       qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
> -    /* FIXME: PCI IRQ connections may be board specific */
> -    for (i = 0; i < PCI_NUM_PINS; i++) {
> -        s->pci[1].irq[i] = qdev_get_gpio_in_named(dev, "gpp", 12 + i);
> -    }
>   }
>   
>   static void mv64361_reset(DeviceState *dev)
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index b0ada9c963..ded5dc2dc9 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -73,6 +73,8 @@ struct Pegasos2MachineState {
>       MachineState parent_obj;
>       PowerPCCPU *cpu;
>       DeviceState *mv;
> +    qemu_irq mv_pirq[PCI_NUM_PINS];
> +    qemu_irq via_pirq[PCI_NUM_PINS];
>       Vof *vof;
>       void *fdt_blob;
>       uint64_t kernel_addr;
> @@ -95,6 +97,15 @@ static void pegasos2_cpu_reset(void *opaque)
>       }
>   }
>   
> +static void pegasos2_pci_irq(void *opaque, int n, int level)
> +{
> +    Pegasos2MachineState *pm = opaque;
> +
> +    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
> +    qemu_set_irq(pm->mv_pirq[n], level);
> +    qemu_set_irq(pm->via_pirq[n], level);
> +}
> +

Can you explain a bit more about how the PCI interrupt lines are connected to both 
the MV64361 and VT8231? The reason for asking is that I see a similar pattern in the 
bonito board, but there I can't see how those lines would be used because they can 
also raise a CPU interrupt, yet it is a different one compared to the 8259.

Given that we know from Bernhard's tests that the fuloong2e board works with 
pci_bus_irqs() included in via_isa_realize() which overwrites the bonito equivalent, 
I'm wondering if the mv_pirq array is actually needed at all and whether it may just 
be a debugging aid? Certainly it makes things simpler to just route everything to the 
VIA device.

>   static void pegasos2_init(MachineState *machine)
>   {
>       Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
> @@ -106,7 +117,7 @@ static void pegasos2_init(MachineState *machine)
>       I2CBus *i2c_bus;
>       const char *fwname = machine->firmware ?: PROM_FILENAME;
>       char *filename;
> -    int sz;
> +    int i, sz;
>       uint8_t *spd_data;
>   
>       /* init CPU */
> @@ -156,7 +167,11 @@ static void pegasos2_init(MachineState *machine)
>       /* Marvell Discovery II system controller */
>       pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
>                             qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT_INT)));
> +    for (i = 0; i < PCI_NUM_PINS; i++) {
> +        pm->mv_pirq[i] = qdev_get_gpio_in_named(pm->mv, "gpp", 12 + i);
> +    }
>       pci_bus = mv64361_get_pci_bus(pm->mv, 1);
> +    pci_bus_irqs(pci_bus, pegasos2_pci_irq, pm, PCI_NUM_PINS);

This doesn't make sense to me either, since the PCI bus IRQs should be owned by the 
device that contains the PCI bus and not the board.

>       /* VIA VT8231 South Bridge (multifunction PCI device) */
>       via = OBJECT(pci_new_multifunction(PCI_DEVFN(12, 0), true,
> @@ -164,6 +179,9 @@ static void pegasos2_init(MachineState *machine)
>       qdev_connect_gpio_out(DEVICE(via), 0,
>                             qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>       pci_realize_and_unref(PCI_DEVICE(via), pci_bus, &error_fatal);
> +    for (i = 0; i < PCI_NUM_PINS; i++) {
> +        pm->via_pirq[i] = qdev_get_gpio_in_named(DEVICE(via), "pirq", i);
> +    }
>   
>       object_property_add_alias(OBJECT(machine), "rtc-time",
>                                 object_resolve_path_component(via, "rtc"),
> @@ -269,6 +287,12 @@ static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
>                                 PCI_INTERRUPT_LINE, 2, 0x9);
>       pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>                                 0x50, 1, 0x2);
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
> +                              0x55, 1, 0x90);
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
> +                              0x56, 1, 0x99);
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
> +                              0x57, 1, 0x90);
>   
>       pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>                                 PCI_INTERRUPT_LINE, 2, 0x109);

This should be a separate commit because it's not part of the PCI interrupt routing 
as per my comment at https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg00193.html.


ATB,

Mark.

