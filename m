Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B06A203F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 18:05:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVbUW-00049h-9M; Fri, 24 Feb 2023 12:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVbUT-00048h-Lu; Fri, 24 Feb 2023 12:04:13 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVbUS-0007kI-0S; Fri, 24 Feb 2023 12:04:13 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 cc12-20020a05683061cc00b00693daa9016fso4064otb.2; 
 Fri, 24 Feb 2023 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CD7zK1FBhKQKh6T1C+LUvBIjFfVtWfijPTxQZhCfqAU=;
 b=Y5QoAR++RGhsWY6+9EkWh+79IG+hIFRmWTyEfWG+bQzm8Dah5XLwvohLDmGAzRFIni
 aEaGkvz6ncVYb8IfiEtRMVB1IG5wgSEI+Su7Ks1LE6E63emiGc68FKUaPkzKyU/LRwpW
 nkhH8yesQgus5zOB+aXWJi9J4EY8awrA1DMtpeh6H0gjar+XBjR1MBtg3SMKK2efbOKh
 2g8u1ppmJytpq+zgTsMVDWDd8U/iV8D8NgizUqPzNIS/ew9IH00+wcE0auH3HaLseOCp
 KR7yHw3iSST3783xZUteGNqtxm90KzTDrHpBaqhIzQr/EtIgByCTuhJinFq256Bmi2Q0
 60XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CD7zK1FBhKQKh6T1C+LUvBIjFfVtWfijPTxQZhCfqAU=;
 b=Di/RPdTjX3OvnciXZMR8AmmIfflDBBq9YskV6I8HZg4w/ynTDuwajbtCECFIVWQRlU
 5pE7nYi4T6Kusv3lQLjQAZbqKwbpRqVw0T4FRgYdZ4ROsgJ2iDveOMTFhqMbgInlKYIy
 2jV9rtvYZk+VbgM0sKQxvwb3TGVLOr1KNx+BR0uu1Lx0yEJcYMGQveq3kXN3y5rs33jn
 K1nF8sCudQkinS/nG2fyPRpYsKQ+QFhuwQZhmrQ4swANEv4MGKSzsGIi9wFGnrHsSNNP
 UBZKajqiGo0emsESZJwi1RoAPXVz67TqzQB92B7+kJzRNljrZlA018iUpywJk6otrZ5T
 CaGA==
X-Gm-Message-State: AO0yUKUPQSus2CciTJXp0FcazK2GNgOzJ0vcgtDt6bwJioZia4uKmgN6
 vXjBsQV85OGxU5HL5zewrNM=
X-Google-Smtp-Source: AK7set8Mo5YZG1RcJ4YKzIqvZnxTIZSrwIU0DEfxIdSmShLStJb0zPj6CI1+4AnoQPIqPYUPub64jQ==
X-Received: by 2002:a05:6830:3498:b0:693:ce9d:5111 with SMTP id
 c24-20020a056830349800b00693ce9d5111mr5201183otu.9.1677258250438; 
 Fri, 24 Feb 2023 09:04:10 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a9d51c2000000b006864816ecd9sm4859135oth.59.2023.02.24.09.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 09:04:09 -0800 (PST)
Message-ID: <9b070e09-6479-62b7-6cd6-8acbae164047@gmail.com>
Date: Fri, 24 Feb 2023 14:04:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/5] hw/ppc/pegasos2: Fix PCI interrupt routing
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 philmd@redhat.com
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 2/21/23 15:44, BALATON Zoltan wrote:
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
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/mv64361.c |  4 ----
>   hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
>   2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
> index f43f33fbd9..3d9132f989 100644
> --- a/hw/pci-host/mv64361.c
> +++ b/hw/pci-host/mv64361.c
> @@ -874,10 +874,6 @@ static void mv64361_realize(DeviceState *dev, Error **errp)
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
> index a9563f4fb2..4e1476673b 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -74,6 +74,8 @@ struct Pegasos2MachineState {
>       MachineState parent_obj;
>       PowerPCCPU *cpu;
>       DeviceState *mv;
> +    qemu_irq mv_pirq[PCI_NUM_PINS];
> +    qemu_irq via_pirq[PCI_NUM_PINS];
>       Vof *vof;
>       void *fdt_blob;
>       uint64_t kernel_addr;
> @@ -96,6 +98,15 @@ static void pegasos2_cpu_reset(void *opaque)
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
>   static void pegasos2_init(MachineState *machine)
>   {
>       Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
> @@ -107,7 +118,7 @@ static void pegasos2_init(MachineState *machine)
>       I2CBus *i2c_bus;
>       const char *fwname = machine->firmware ?: PROM_FILENAME;
>       char *filename;
> -    int sz;
> +    int i, sz;
>       uint8_t *spd_data;
>   
>       /* init CPU */
> @@ -157,11 +168,18 @@ static void pegasos2_init(MachineState *machine)
>       /* Marvell Discovery II system controller */
>       pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
>                             qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT_INT)));
> +    for (i = 0; i < PCI_NUM_PINS; i++) {
> +        pm->mv_pirq[i] = qdev_get_gpio_in_named(pm->mv, "gpp", 12 + i);
> +    }
>       pci_bus = mv64361_get_pci_bus(pm->mv, 1);
> +    pci_bus_irqs(pci_bus, pegasos2_pci_irq, pm, PCI_NUM_PINS);
>   
>       /* VIA VT8231 South Bridge (multifunction PCI device) */
>       via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
>                                                    true, TYPE_VT8231_ISA));
> +    for (i = 0; i < PCI_NUM_PINS; i++) {
> +        pm->via_pirq[i] = qdev_get_gpio_in_named(DEVICE(via), "pirq", i);
> +    }
>       object_property_add_alias(OBJECT(machine), "rtc-time",
>                                 object_resolve_path_component(via, "rtc"),
>                                 "date");
> @@ -268,6 +286,12 @@ static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
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

