Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480272AFB2D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 23:14:54 +0100 (CET)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcyOD-0002gO-2N
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 17:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcyMQ-00029S-HX
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 17:13:02 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:32952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcyMO-0001Wq-IP
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 17:13:02 -0500
Received: by mail-io1-xd42.google.com with SMTP id j12so3960162iow.0
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 14:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mPE5404eU4VmV1qU+wrJpRSlxG5J81A9EhpUDd+1wR8=;
 b=l5HyKAcOf615bSHcEoSUybOv7OKG1O3Bq7VMgZ8xPeBMevt3VOHqziRJG4Fe37DcQK
 3s3ZFaqwEymUhelBK4JlO4sZHXx4hftllc/lQ4OFoyYuYyaADpekc2WEhg6aUoK0e2Sr
 fld+/h0i8LYNRlYW0VZeeHaGEOsJdXfp+jU9F6yhMarcnP4XXJ7OEwLK2AsmNWLbN/pR
 7mQH+WMY6bYD3msCrOI1tbUArBmZFa8Lm46iyu2I3QWZtv7wfJAkUfUGfj04NoyBmHJY
 uik21Yh5Z7skurDi2VkKD2ltt26vYpjcytVBhy+kLKeU+12ftGtCJDfW/mMlXElVTAoG
 ms2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mPE5404eU4VmV1qU+wrJpRSlxG5J81A9EhpUDd+1wR8=;
 b=k2jzAeSPDuyuTiyKb6mvX5jcxnol9T74GOCoFAl5C0FyM/7AvzyZq2pDmiH0cyqmjV
 fYA2Dn8Mo0458epDznVzNVXyEgue9ymC4SoHjdU/lCYiu8/el4EbOTK2UDeTRm2veT+X
 2ozn2lclEgrtIaGea8Zd+ZbJf6NJOMBRCdD/lTtbvL4759ix7ShfozT2xSLXEtTOhMqK
 n3xRUFzbEOP44nFs91CjMX7C4KWAvjf9QKqPiKOtKfrShpH7khXNtl2kWmGJWGpaW6D1
 sJh6rR3asWSok7Nbo6xIChC9DiBLRt7RFUD/J+KClYXHxPIXLv+y+CJM5FYE2tREWjaF
 5UnQ==
X-Gm-Message-State: AOAM530ve/m/Vc2/PUJXMw88yx1ymGCJxUNY96cDN2eGfqmNoFyQa+1R
 6Ckj3qwRd2sliB+l8AeE8R8OU0F5WuJsgPO1GNU=
X-Google-Smtp-Source: ABdhPJzdaNgUlILuQ66qLVYcChFJZgpEQFBH7UhoYeipnuXUxsKMTWN157h9Q3o/OtTMmxKvffDl3G2zHgsc9MeV79Y=
X-Received: by 2002:a02:6c09:: with SMTP id w9mr10093320jab.135.1605132779247; 
 Wed, 11 Nov 2020 14:12:59 -0800 (PST)
MIME-Version: 1.0
References: <20201110131046.28426-1-vitaly.wool@konsulko.com>
In-Reply-To: <20201110131046.28426-1-vitaly.wool@konsulko.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Nov 2020 14:00:55 -0800
Message-ID: <CAKmqyKPoFihuAQkqq7JNE-XX5rPqjzQODDDCVQmNv6=3hTWrSw@mail.gmail.com>
Subject: Re: [PATCH] Microchip: add QSPI NOR flash
To: Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 6:50 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Add QSPI NOR flash definition for Microchip PolarFire SoC.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> --
> 2.20.1
>
>

