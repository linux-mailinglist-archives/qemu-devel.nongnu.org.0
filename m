Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0F2B1377
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 01:48:19 +0100 (CET)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNGE-00049D-Am
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 19:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kdNFU-0003ix-CB
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 19:47:32 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:38300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kdNFS-0008Ty-6q
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 19:47:32 -0500
Received: by mail-il1-x141.google.com with SMTP id e17so7029980ili.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 16:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogOARmn/PCGlHIfBJJNaFV7x3+XMoixdQwjG2Is8vvo=;
 b=LgQGS226MInI1z5MLjYqUiDLLgqoMFxAIbsp+c29iM/L6bO0OwB6XzoNdJPe+XX7eY
 KfP/wpSvcYfEkIBystOaYnp0WFw2rjgPceaLTcHM3bDDNXUq8B8OaJPv8JdfNa95uatT
 g3Nr6BBQNGgfQGDEs8jkA5dUhaLgTwlv5+0QGiYvj6Mu4aeZsQYm5lKoGNz+cIEROgVA
 O8hyswuT4u4r/a8iv0fn9lRNQhg9V+K8KU0GhqHKShE3ITM8ogZP38vLZRXWBAIXRl94
 j3F4h4msjNceLjG5gI+b5tAbMAa6fLbQV3h8C9kjJSmZDpuUrbD0VYa4Yc9nCCKZ9WXE
 Bdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogOARmn/PCGlHIfBJJNaFV7x3+XMoixdQwjG2Is8vvo=;
 b=NrF4lAHaECth4d3bpCAvSloyFHemTvEKvvpFi9/wzI8KDXtbVRLiPsuonyMSKy5yHT
 3lCuUGphbCwIdPvbTqwWnXxqsAzyzRf5wHGWXryLa4Rm8LcsVLeMFZ0rf32wALOUk7/q
 rwcNliFO7VNDxjhgQoP8J8JYyO148HZmaKJmXmDtL161yBi6bX1c73sF93k4dwE/KNsl
 413JcJDkwhnQoMzGMEiUlb+yGv5Rdu/kM7mQvrkHYi5W87689oOLj5DbEZOJOKkYS8vF
 fv7ru2zWCwbH79yJQepJsczBUq/qUcui+o8vbuFbqZtesZkOBpYEsWSJVDzUyetDNcGq
 13Bw==
X-Gm-Message-State: AOAM530/+yfwULgVRXd5l6PmtohyKiEXCG04+V6EBKu0XoM2JNrmNQPy
 Cq6xzj5V4cm7W77hM9mGZOvR/3jE6QeTeAowA94=
X-Google-Smtp-Source: ABdhPJxp1YlY+YQ6sQbh9UT2rGrdQdhlpFqm6G3uBujFvAfVvpkM3LJ0UpUcazx1uBYkhmtAz3jxhGgOjmGL4o/5q7w=
X-Received: by 2002:a05:6e02:c:: with SMTP id
 h12mr1896943ilr.177.1605228449117; 
 Thu, 12 Nov 2020 16:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20201112074950.33283-1-vitaly.wool@konsulko.com>
In-Reply-To: <20201112074950.33283-1-vitaly.wool@konsulko.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Nov 2020 16:35:25 -0800
Message-ID: <CAKmqyKNaFyiroRUk8V2a9+boUG1SSbxWaA_Dm2q7jfFKBqeong@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: microchip_pfsoc: add QSPI NOR flash
To: Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 11:51 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Add QSPI NOR flash definition for Microchip PolarFire SoC.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/microchip_pfsoc.c         | 21 +++++++++++++++++++++
>  include/hw/riscv/microchip_pfsoc.h |  3 +++
>  2 files changed, 24 insertions(+)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 37ac46a1af..e952b49e8c 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -113,6 +113,8 @@ static const struct MemmapEntry {
>      [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
>      [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
>      [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
> +    [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,     0x1000 },
> +    [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,     0x1000 },
>      [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,     0x1000 },
>      [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
>      [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
> @@ -121,6 +123,7 @@ static const struct MemmapEntry {
>      [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,     0x1000 },
>      [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
>      [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
> +    [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
>      [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
>      [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
>      [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
> @@ -185,6 +188,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *envm_data = g_new(MemoryRegion, 1);
> +    MemoryRegion *qspi_xip_mem = g_new(MemoryRegion, 1);
>      char *plic_hart_config;
>      size_t plic_hart_config_len;
>      NICInfo *nd;
> @@ -344,6 +348,14 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>          qdev_get_gpio_in(DEVICE(s->plic), MICROCHIP_PFSOC_MMUART4_IRQ),
>          serial_hd(4));
>
> +    /* SPI */
> +    create_unimplemented_device("microchip.pfsoc.spi0",
> +        memmap[MICROCHIP_PFSOC_SPI0].base,
> +        memmap[MICROCHIP_PFSOC_SPI0].size);
> +    create_unimplemented_device("microchip.pfsoc.spi1",
> +        memmap[MICROCHIP_PFSOC_SPI1].base,
> +        memmap[MICROCHIP_PFSOC_SPI1].size);
> +
>      /* I2C1 */
>      create_unimplemented_device("microchip.pfsoc.i2c1",
>          memmap[MICROCHIP_PFSOC_I2C1].base,
> @@ -401,6 +413,15 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_realize(SYS_BUS_DEVICE(&s->ioscb), errp);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
>                      memmap[MICROCHIP_PFSOC_IOSCB].base);
> +
> +    /* QSPI Flash */
> +    memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
> +                           "microchip.pfsoc.qspi_xip",
> +                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> +                           &error_fatal);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
> +                                qspi_xip_mem);
>  }
>
>  static void microchip_pfsoc_soc_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index 51d44637db..d0c666aae0 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -97,6 +97,8 @@ enum {
>      MICROCHIP_PFSOC_MMUART2,
>      MICROCHIP_PFSOC_MMUART3,
>      MICROCHIP_PFSOC_MMUART4,
> +    MICROCHIP_PFSOC_SPI0,
> +    MICROCHIP_PFSOC_SPI1,
>      MICROCHIP_PFSOC_I2C1,
>      MICROCHIP_PFSOC_GEM0,
>      MICROCHIP_PFSOC_GEM1,
> @@ -105,6 +107,7 @@ enum {
>      MICROCHIP_PFSOC_GPIO2,
>      MICROCHIP_PFSOC_ENVM_CFG,
>      MICROCHIP_PFSOC_ENVM_DATA,
> +    MICROCHIP_PFSOC_QSPI_XIP,
>      MICROCHIP_PFSOC_IOSCB,
>      MICROCHIP_PFSOC_DRAM_LO,
>      MICROCHIP_PFSOC_DRAM_LO_ALIAS,
> --
> 2.20.1
>
>

