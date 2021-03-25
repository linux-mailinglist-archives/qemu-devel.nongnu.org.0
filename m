Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF6349CCA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 00:18:46 +0100 (CET)
Received: from localhost ([::1]:48072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPZFV-0008KI-85
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 19:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPZEP-0007tY-HJ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 19:17:37 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPZEN-00056U-UG
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 19:17:37 -0400
Received: by mail-oi1-f182.google.com with SMTP id f9so3890338oiw.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 16:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfXk7fFuc7+s3WRCfXU3aIjR5/zkevEuE5YSFLtZd4k=;
 b=pDgHh/JG+YlCdcG05yK+5iKzQbtMZEa03F0lACjsgWL1f3b0GA3RrcQxI7tT7jjnZJ
 XZNJS4DQr3QHxfYNBPoYheon6sg4iwCj8FI+JlM0bTcoo9iC43GgHVqHaObOXlThf7eh
 0mqnywlLQ/yonjzmXjnWFoZCwFM5hq05zH9Yv0q06VbL9S0IDsO5R+oikDD88KZTDPmA
 FL6Holg8TPOVg8o4qAbpCEHfRi1ALhwdiSESEoDQ2bqcc4ScFmrBYJ/CFdUenLHJs81W
 wKqBDRWHCGrX0OOzpk2Zh0SLOi8BbqmdFp31BYLT5cXoLjbwMjfj81eAPjKIJeawTZSS
 +9Hg==
X-Gm-Message-State: AOAM53156kimCRkPvsAc1Hc2z8gCaxAatJcnJ542SpoOVE1ujXhS84W9
 jeyDUQg9LNCDX3IOOp7FYIKXq8mpGxyHv/RR6LQ=
X-Google-Smtp-Source: ABdhPJzY0MS2zWnH7gMyYbXfGZ5GlVHLCcP7UZkRSJ3msSqrunG2v3LiijQjmjYt5LPTM+bX2kgvUfK3IJZTIB7h3wQ=
X-Received: by 2002:aca:bb06:: with SMTP id l6mr7631438oif.121.1616714254757; 
 Thu, 25 Mar 2021 16:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180130044621.10464-1-richard.henderson@linaro.org>
 <20180130044621.10464-2-richard.henderson@linaro.org>
In-Reply-To: <20180130044621.10464-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 26 Mar 2021 00:17:23 +0100
Message-ID: <CAAdtpL5Uvvrkucyh=8+dveMeQsR4hHhynUCoF3AKT+g3mPaY0Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL v5 39/43] hw/hppa: Implement DINO system board
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.182;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Helge, Richard,

On Tue, Jan 30, 2018 at 5:48 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Helge Deller <deller@gmx.de>
>
> Now that we have the prerequisites in target/hppa/,
> implement the hardware for a PA7100LC.
>
> This also enables build for hppa-softmmu.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> [rth: Since it is all new code, squashed all branch development
> withing hw/hppa/ to a single patch.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  Makefile.objs                    |   1 +
>  hw/hppa/hppa_hardware.h          |  40 +++
>  hw/hppa/hppa_sys.h               |  24 ++
>  hw/hppa/dino.c                   | 518 +++++++++++++++++++++++++++++++++++++++
>  hw/hppa/machine.c                | 247 ++++++++++++++++++-
>  hw/hppa/pci.c                    |  90 +++++++
>  default-configs/hppa-softmmu.mak |  14 ++
>  hw/hppa/Makefile.objs            |   2 +-
>  hw/hppa/trace-events             |   4 +
>  9 files changed, 938 insertions(+), 2 deletions(-)
>  create mode 100644 hw/hppa/hppa_hardware.h
>  create mode 100644 hw/hppa/hppa_sys.h
>  create mode 100644 hw/hppa/dino.c
>  create mode 100644 hw/hppa/pci.c
>  create mode 100644 default-configs/hppa-softmmu.mak
>  create mode 100644 hw/hppa/trace-events

> +PCIBus *dino_init(MemoryRegion *addr_space,
> +                  qemu_irq *p_rtc_irq, qemu_irq *p_ser_irq)
> +{
> +    DeviceState *dev;
> +    DinoState *s;
> +    PCIBus *b;
> +    int i;
> +
> +    dev = qdev_create(NULL, TYPE_DINO_PCI_HOST_BRIDGE);
> +    s = DINO_PCI_HOST_BRIDGE(dev);
> +
> +    /* Dino PCI access from main memory.  */
> +    memory_region_init_io(&s->this_mem, OBJECT(s), &dino_chip_ops,
> +                          s, "dino", 4096);
> +    memory_region_add_subregion(addr_space, DINO_HPA, &s->this_mem);
> +
> +    /* Dino PCI config. */
> +    memory_region_init_io(&s->parent_obj.conf_mem, OBJECT(&s->parent_obj),
> +                          &pci_host_conf_be_ops, dev, "pci-conf-idx", 4);
> +    memory_region_init_io(&s->parent_obj.data_mem, OBJECT(&s->parent_obj),
> +                          &dino_config_data_ops, dev, "pci-conf-data", 4);
> +    memory_region_add_subregion(&s->this_mem, DINO_PCI_CONFIG_ADDR,
> +                                &s->parent_obj.conf_mem);
> +    memory_region_add_subregion(&s->this_mem, DINO_CONFIG_DATA,
> +                                &s->parent_obj.data_mem);
> +
> +    /* Dino PCI bus memory.  */
> +    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 1ull << 32);
> +
> +    b = pci_register_root_bus(dev, "pci", dino_set_irq, dino_pci_map_irq, s,
> +                              &s->pci_mem, get_system_io(),
> +                              PCI_DEVFN(0, 0), 32, TYPE_PCI_BUS);
> +    s->parent_obj.bus = b;
> +    qdev_init_nofail(dev);
> +
> +    /* Set up windows into PCI bus memory.  */
> +    for (i = 1; i < 31; i++) {
> +        uint32_t addr = 0xf0000000 + i * DINO_MEM_CHUNK_SIZE;
> +        char *name = g_strdup_printf("PCI Outbound Window %d", i);
> +        memory_region_init_alias(&s->pci_mem_alias[i], OBJECT(s),
> +                                 name, &s->pci_mem, addr,
> +                                 DINO_MEM_CHUNK_SIZE);

Where are these aliases mapped?

> +    }
> +
> +    /* Set up PCI view of memory: Bus master address space.  */
> +    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 1ull << 32);
> +    memory_region_init_alias(&s->bm_ram_alias, OBJECT(s),
> +                             "bm-system", addr_space, 0,
> +                             0xf0000000 + DINO_MEM_CHUNK_SIZE);
> +    memory_region_init_alias(&s->bm_pci_alias, OBJECT(s),
> +                             "bm-pci", &s->pci_mem,
> +                             0xf0000000 + DINO_MEM_CHUNK_SIZE,
> +                             31 * DINO_MEM_CHUNK_SIZE);
> +    memory_region_add_subregion(&s->bm, 0,
> +                                &s->bm_ram_alias);
> +    memory_region_add_subregion(&s->bm,
> +                                0xf0000000 + DINO_MEM_CHUNK_SIZE,
> +                                &s->bm_pci_alias);
> +    address_space_init(&s->bm_as, &s->bm, "pci-bm");
> +    pci_setup_iommu(b, dino_pcihost_set_iommu, s);
> +
> +    *p_rtc_irq = qemu_allocate_irq(dino_set_timer_irq, s, 0);
> +    *p_ser_irq = qemu_allocate_irq(dino_set_serial_irq, s, 0);
> +
> +    return b;
> +}

