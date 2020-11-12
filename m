Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6012AFFA5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 07:29:24 +0100 (CET)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd66l-0001Jv-41
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 01:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kd65S-0000hy-Ni
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 01:28:02 -0500
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kd65Q-00063v-SY
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 01:28:02 -0500
Received: by mail-yb1-xb43.google.com with SMTP id l14so181804ybq.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 22:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sEek4OI7aKU2myFJKAxZyzRi6UXAIyCDifmJP8upGlM=;
 b=JAvbd/o/oFmfnLqrQn4QNb3m0JeJEzx7OI5Wxjt5akQgUrOUHDv9vPE7rQQLNxE7jw
 gX4j2ERf4sHEs2p/2rRvU+cg68auhsKbRPOpgqOFFLxM51cpygO6RKveTD+CAKyBiyTn
 sOKOotMuWk6497JNvF3C4+xl9gQKW10zIL5VqcGtKL2WFDbnKvWcQuMHlmC2eghbjha4
 ya9fxOZrnYpV2UjEjzAnGovETa2VqEYm/WjD7zL9Ueaq94ivO5NeS1I/FedHJeeNM+o0
 xHhkfyltzHWXIKKDihXGcrqMXgSLeOjScrZYzD7SGPctpxE7dRUm63bUdASvq1d/Q57u
 FRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sEek4OI7aKU2myFJKAxZyzRi6UXAIyCDifmJP8upGlM=;
 b=R20seLtlWUq4U81ZgTITDfpZQXjauJ/KGviEdLxiTeAyNid68xW/IUWRsKZsZctBPN
 ixM9MhTOScPaDKeTOQSclzrg3xygGjdmfzKEVXT3n33QyXYmoL5ub78ugCZLs6k7CtES
 0tVR21OFx2UQVoSSTo32YgjLc/jREcwLK7b2hM9bJdmpGWchqN8wW9CeCd1b+Nor4HlT
 6dziYZUcq+qKSoZ2F5XXa640qlIQKut14lQSzJmJRD8FCUAzXe997a4iUI7jYmpt/Og9
 hCZR0O2TG7zrYN9V/VkCHEt3KXSRiTyqnlirFqkCL8ZdDzUfdCl7m8OZ2dXcq+e0N/Xt
 7pQg==
X-Gm-Message-State: AOAM533FyFI4Ono4qGEYoUlbGcOA/YGdhswbkfGOpMl55vVs++9rn4Uy
 qf5HEaq6vmL6VMArE1+bxqWv5omHU9IvMPvOHco=
X-Google-Smtp-Source: ABdhPJzeP4sXjOs3B9Ceu8wHckR2JIUnpNkzNKm59nPlmwoj41/nvTURTMwLRo/NlSM18DEGE+Tpjf6kGZnfwzsdBcU=
X-Received: by 2002:a25:7355:: with SMTP id o82mr31444132ybc.122.1605162479384; 
 Wed, 11 Nov 2020 22:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20201110131046.28426-1-vitaly.wool@konsulko.com>
In-Reply-To: <20201110131046.28426-1-vitaly.wool@konsulko.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 12 Nov 2020 14:27:48 +0800
Message-ID: <CAEUhbmU5yDcmub6mpsDECR+6+NMr_voHJLBrdsq7=qwZe7w_sw@mail.gmail.com>
Subject: Re: [PATCH] Microchip: add QSPI NOR flash
To: Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vitaly,

On Tue, Nov 10, 2020 at 10:48 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>

nits: please use the tag "hw/riscv: microchip_pfsoc"

> Add QSPI NOR flash definition for Microchip PolarFire SoC.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  hw/riscv/microchip_pfsoc.c         | 21 +++++++++++++++++++++
>  include/hw/riscv/microchip_pfsoc.h |  3 +++
>  2 files changed, 24 insertions(+)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 4627179cd3..d1f4a1fe6f 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -90,6 +90,8 @@ static const struct MemmapEntry {
>      [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
>      [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
>      [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
> +    [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,     0x1000 },
> +    [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,     0x1000 },

I believe this patch does not apply on qemu master. The latest codes
here have the I2C1 entry.

>      [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
>      [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
>      [MICROCHIP_PFSOC_GPIO0] =           { 0x20120000,     0x1000 },
> @@ -97,6 +99,7 @@ static const struct MemmapEntry {
>      [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,     0x1000 },
>      [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
>      [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
> +    [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
>      [MICROCHIP_PFSOC_IOSCB_CFG] =       { 0x37080000,     0x1000 },
>      [MICROCHIP_PFSOC_DRAM] =            { 0x80000000,        0x0 },
>  };
> @@ -147,6 +150,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *envm_data = g_new(MemoryRegion, 1);
> +    MemoryRegion *xip_mem = g_new(MemoryRegion, 1);

nits: suggest we use the "qspi_xip_mem" for the variable name

>      char *plic_hart_config;
>      size_t plic_hart_config_len;
>      NICInfo *nd;
> @@ -302,6 +306,15 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>          qdev_set_nic_properties(DEVICE(&s->gem1), nd);
>      }
>
> +    /* SPI */
> +    create_unimplemented_device("microchip.pfsoc.spi0",
> +        memmap[MICROCHIP_PFSOC_SPI0].base,
> +        memmap[MICROCHIP_PFSOC_SPI0].size);
> +
> +    create_unimplemented_device("microchip.pfsoc.spi1",
> +        memmap[MICROCHIP_PFSOC_SPI1].base,
> +        memmap[MICROCHIP_PFSOC_SPI1].size);

As I mentioned earlier, please put the above changes before the I2C1 code block.

> +
>      object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
>      object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
>      sysbus_realize(SYS_BUS_DEVICE(&s->gem0), errp);
> @@ -337,6 +350,14 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>                                  memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
>                                  envm_data);
>
> +    /* QSPI Flash */
> +    memory_region_init_rom(xip_mem, OBJECT(dev), "microchip.pfsoc.xip",

nits: "microchip.pfsoc.qspi_xip"

> +                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> +                           &error_fatal);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
> +                                xip_mem);
> +
>      /* IOSCBCFG */
>      create_unimplemented_device("microchip.pfsoc.ioscb.cfg",
>          memmap[MICROCHIP_PFSOC_IOSCB_CFG].base,
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index 8bfc7e1a85..28d6f389ec 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -87,6 +87,8 @@ enum {
>      MICROCHIP_PFSOC_MMUART2,
>      MICROCHIP_PFSOC_MMUART3,
>      MICROCHIP_PFSOC_MMUART4,
> +    MICROCHIP_PFSOC_SPI0,
> +    MICROCHIP_PFSOC_SPI1,
>      MICROCHIP_PFSOC_GEM0,
>      MICROCHIP_PFSOC_GEM1,
>      MICROCHIP_PFSOC_GPIO0,
> @@ -94,6 +96,7 @@ enum {
>      MICROCHIP_PFSOC_GPIO2,
>      MICROCHIP_PFSOC_ENVM_CFG,
>      MICROCHIP_PFSOC_ENVM_DATA,
> +    MICROCHIP_PFSOC_QSPI_XIP,
>      MICROCHIP_PFSOC_IOSCB_CFG,
>      MICROCHIP_PFSOC_DRAM,
>  };

Regards,
Bin

