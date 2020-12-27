Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6E2E3257
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 19:03:28 +0100 (CET)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktaO6-00055d-PG
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 13:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ktaLi-0004R8-7R; Sun, 27 Dec 2020 13:00:58 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:39338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ktaLg-0002Z9-2i; Sun, 27 Dec 2020 13:00:57 -0500
Received: by mail-ot1-x32b.google.com with SMTP id d8so7467714otq.6;
 Sun, 27 Dec 2020 10:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6VT8Btqnd8MclzMV3AxnNTYtKnKHspSSR+8y44hWJ6s=;
 b=qK6Kp490+ix44bIchx2VjCVOqad7mkSFzgZ3A5pjyyYaqm2zQF4hTcBVnsaHI29C1A
 Bv5heM/kICM2wVNTfte53uhmtmWYTZ56c8vr2/EplLR90VdCrnvGbpax8uXTSgh8fnly
 kAAUki+Jkb6vIP89OL1Hx1ch6/aRZ6LciM1+UuRHuC3+gXOrL+B6Wjau5/wmU4msPHNu
 SwBVgOEzV5DhvF2yzgrCdVCRdlDt38OsAAmRrVeJSYzz/jpfKr9mJQT0sa+tH1+BlA8H
 4vq41tXZSuw2cMtA+HuAGExd2fWC/2hTgFp4Mz+uokf6kBWwjRuzY6aXvcGvpDvC0Lzw
 IVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6VT8Btqnd8MclzMV3AxnNTYtKnKHspSSR+8y44hWJ6s=;
 b=scqvXwGBZYuLBAez1tb9j7GDaK9xrX6sKl7mzKbgniaKjUBkgHWZxeIQt62gawWo2b
 qi+f58vy9Pyb8gMom0tFQUVGyvPLlNV+KFwNYimHcTbPsa6rqkrlKwPviauTlI/vYKbs
 arEXuYGV1G5SuczgMAN9rqPOD0JQQXOzpZFJlnBrLL/PiTxC3MsGMWQXBi2jRzRNTayH
 FSEnUD8x/Nb49cHRyEkrn6ZSfDBXEcTMzFFPS+dFZfiTG+zkDZHdCNHeW+j5CB1SIbXZ
 vrau67acjdcM8Kcub7xKt/u7QLoi+byGsS6FIt4UpbAMbaJIdjwGp+ZZShz38enJVMUV
 Miiw==
X-Gm-Message-State: AOAM531mYu5K8NmxnzBa4ssSPNHoSO0E8vRKS2A23GPKVGC2LsdDiIgw
 XTD37cp+2FzFcNIXAarYAhY=
X-Google-Smtp-Source: ABdhPJzZwdT+ufxexdCXVAUrozIbsQOFuXFLXJkquBvDC5QCJPxmOnLYlFkxXs47Krm6KROdcN0BGQ==
X-Received: by 2002:a9d:6a97:: with SMTP id l23mr30840243otq.58.1609092054534; 
 Sun, 27 Dec 2020 10:00:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s24sm5365826oij.20.2020.12.27.10.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 10:00:53 -0800 (PST)
Subject: Re: [PATCH 3/3] sam460ex: Clean up irq mapping
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1608937677.git.balaton@eik.bme.hu>
 <7df2e39f5229780c2ebf05b2efe0d8ce12d0766a.1608937677.git.balaton@eik.bme.hu>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <52a86ee8-3e0a-b842-e4a8-b4d9e5bf7c41@roeck-us.net>
Date: Sun, 27 Dec 2020 10:00:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7df2e39f5229780c2ebf05b2efe0d8ce12d0766a.1608937677.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/25/20 3:07 PM, BALATON Zoltan wrote:
> Avoid mapping multiple interrupts to the same irq. Instead map them to
> the 4 PCI interrupts and use an or-gate in the board to connect them
> to the interrupt controller. This does not fix any known problem but
> does not seem to cause a new problem either and may be cleaner at least.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  hw/ppc/Kconfig       |  1 +
>  hw/ppc/ppc440_pcix.c | 28 ++++++++++++++--------------
>  hw/ppc/sam460ex.c    | 16 +++++++++++++---
>  3 files changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 5893f80909..fabdb1a96f 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -58,6 +58,7 @@ config SAM460EX
>      select PFLASH_CFI01
>      select IDE_SII3112
>      select M41T80
> +    select OR_IRQ
>      select PPC440
>      select SM501
>      select SMBUS_EEPROM
> diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
> index ee952314c8..504decbbc2 100644
> --- a/hw/ppc/ppc440_pcix.c
> +++ b/hw/ppc/ppc440_pcix.c
> @@ -57,8 +57,8 @@ struct PPC440PCIXState {
>      PCIDevice *dev;
>      struct PLBOutMap pom[PPC440_PCIX_NR_POMS];
>      struct PLBInMap pim[PPC440_PCIX_NR_PIMS];
> +    qemu_irq irq[PCI_NUM_PINS];
>      uint32_t sts;
> -    qemu_irq irq;
>      AddressSpace bm_as;
>      MemoryRegion bm;
>  
> @@ -415,24 +415,20 @@ static void ppc440_pcix_reset(DeviceState *dev)
>      s->sts = 0;
>  }
>  
> -/* All pins from each slot are tied to a single board IRQ.
> - * This may need further refactoring for other boards. */
>  static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)
>  {
> -    trace_ppc440_pcix_map_irq(pci_dev->devfn, irq_num, 0);
> -    return 0;
> +    int n = (irq_num + PCI_SLOT(pci_dev->devfn)) % PCI_NUM_PINS;
> +
> +    trace_ppc440_pcix_map_irq(pci_dev->devfn, irq_num, n);
> +    return n;
>  }
>  
>  static void ppc440_pcix_set_irq(void *opaque, int irq_num, int level)
>  {
> -    qemu_irq *pci_irq = opaque;
> +    qemu_irq *pci_irqs = opaque;
>  
>      trace_ppc440_pcix_set_irq(irq_num);
> -    if (irq_num < 0) {
> -        error_report("%s: PCI irq %d", __func__, irq_num);
> -        return;
> -    }
> -    qemu_set_irq(*pci_irq, level);
> +    qemu_set_irq(pci_irqs[irq_num], level);
>  }
>  
>  static AddressSpace *ppc440_pcix_set_iommu(PCIBus *b, void *opaque, int devfn)
> @@ -472,15 +468,19 @@ static void ppc440_pcix_realize(DeviceState *dev, Error **errp)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      PPC440PCIXState *s;
>      PCIHostState *h;
> +    int i;
>  
>      h = PCI_HOST_BRIDGE(dev);
>      s = PPC440_PCIX_HOST_BRIDGE(dev);
>  
> -    sysbus_init_irq(sbd, &s->irq);
> +    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
> +        sysbus_init_irq(sbd, &s->irq[i]);
> +    }
>      memory_region_init(&s->busmem, OBJECT(dev), "pci bus memory", UINT64_MAX);
>      h->bus = pci_register_root_bus(dev, NULL, ppc440_pcix_set_irq,
> -                         ppc440_pcix_map_irq, &s->irq, &s->busmem,
> -                         get_system_io(), PCI_DEVFN(0, 0), 1, TYPE_PCI_BUS);
> +                         ppc440_pcix_map_irq, s->irq, &s->busmem,
> +                         get_system_io(), PCI_DEVFN(0, 0), ARRAY_SIZE(s->irq),
> +                         TYPE_PCI_BUS);
>  
>      s->dev = pci_create_simple(h->bus, PCI_DEVFN(0, 0), "ppc4xx-host-bridge");
>  
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 14e6583eb0..59b19fbca1 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -33,6 +33,7 @@
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
>  #include "hw/sysbus.h"
> +#include "hw/or-irq.h"
>  #include "hw/char/serial.h"
>  #include "hw/i2c/ppc4xx_i2c.h"
>  #include "hw/i2c/smbus_eeprom.h"
> @@ -292,7 +293,7 @@ static void sam460ex_init(MachineState *machine)
>      SysBusDevice *sbdev;
>      struct boot_info *boot_info;
>      uint8_t *spd_data;
> -    int success;
> +    int i, success;
>  
>      cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>      env = &cpu->env;
> @@ -382,13 +383,22 @@ static void sam460ex_init(MachineState *machine)
>  
>      /* PCI bus */
>      ppc460ex_pcie_init(env);
> -    /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
> -    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, uic[1][0]);
> +    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, NULL);
>      pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
>      if (!pci_bus) {
>          error_report("couldn't create PCI controller!");
>          exit(1);
>      }
> +    /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
> +    sbdev = SYS_BUS_DEVICE(dev);
> +    dev = qdev_new(TYPE_OR_IRQ);
> +    object_property_set_int(OBJECT(dev), "num-lines", PCI_NUM_PINS,
> +                            &error_fatal);
> +    qdev_realize_and_unref(dev, NULL, &error_fatal);
> +    for (i = 0; i < PCI_NUM_PINS; i++) {
> +        sysbus_connect_irq(sbdev, i, qdev_get_gpio_in(dev, i));
> +    }
> +    qdev_connect_gpio_out(dev, 0, uic[1][0]);
>      memory_region_init_alias(isa, NULL, "isa_mmio", get_system_io(),
>                               0, 0x10000);
>      memory_region_add_subregion(get_system_memory(), 0xc08000000, isa);
> 


