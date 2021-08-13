Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51223EAE2D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 03:36:06 +0200 (CEST)
Received: from localhost ([::1]:41564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEM7B-0006Gu-TJ
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 21:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM65-0005IG-Mv; Thu, 12 Aug 2021 21:34:57 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:42859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM64-0008Ph-0b; Thu, 12 Aug 2021 21:34:57 -0400
Received: by mail-io1-xd29.google.com with SMTP id h1so11073811iol.9;
 Thu, 12 Aug 2021 18:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EJmv3S30EOm1qtzX1OtTUWki3Tj89f7gmC7nTY4pp4w=;
 b=Sbbs3BMojrVxCqU5u7ZPWrwf6c74P8mxyLLDtZe/6hOYq9HPLFB0p8XvSrtSz9AA6c
 I2gu55ILaNvDr7cO7gfj42SctniBXddCSuxYiDsW8rZdNz8AKGH3RvnMhnXWHUn8RjpA
 /+z42JjpF44FTKgR087lPx24LR03zPjEJS1Z0o4yYQnIFGPJUAeonLIxYgIn5Lff32tR
 0tuL2W14XxXph6ThDrrLxf6GyzqwzHJKQNgzB56WD01nK2DB1KL1Fxd61QdjyQdEejDy
 Ywtc0xuRvMHd0GuaFW+LeH2xcilPcwfWX2nkaBD4hUa3x3vH+j9sX5qvaJJfMo8R9lKI
 efSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EJmv3S30EOm1qtzX1OtTUWki3Tj89f7gmC7nTY4pp4w=;
 b=EyHwz5SP+MLOmC8xfYLWK60p2gh97sdBF/Aba25yhvxUIRJR8BhAx5NIng5pmY6WIX
 oF50AnXF9w+IpcZLGmBUMtQSbqmewCmNAqRlyNmPiGGT2cyVsYDLJVGXR/GVZkfGdnvp
 j0phrRIpHbsM+epyW8jn1Pz7IxC/DSeo2Z8QfTPGr+VtYt/RS79R8bTqhLVG9q6MfCEG
 cngEYrMfuwyQywnKDW46RztTDEjRAGMhHVqdyL8j8lkI8ttBUViiRZgnJtCvPIl+TOg7
 EdXrAWM43NuWr5YkrIa0kdN5YC27zh8iKBhniuw1NnCoUyyOXULbHc4ibrhPlPQWpMra
 7SUg==
X-Gm-Message-State: AOAM533TeDFCNyVHztQVj6ey/z4Kp1wj+jr7JPDvlVYgkvDpEIRtbx99
 41Pyq4uGECAIcotUpO3DOASNY53t2ue+ldoS9wQ=
X-Google-Smtp-Source: ABdhPJzLecIUVywsV1fi5SZ20FAOS+4h8U8LeyD9WpWzvuBfnUijJqscvaBF+mNHY76OKQNWKUU+SqXm8YiWk7tEHZQ=
X-Received: by 2002:a6b:e702:: with SMTP id b2mr27284ioh.118.1628818494597;
 Thu, 12 Aug 2021 18:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-11-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-11-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:34:28 +1000
Message-ID: <CAKmqyKMxH1p7fHvy6c1BBths3Gx_=T+tARfn5kMHK76ugs6Jhg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 10/25] hw/arm: Don't allocate separate
 MemoryRegions in stm32 SoC realize
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 7:37 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the realize methods of the stm32f100 and stm32f205 SoC objects, we
> call g_new() to create new MemoryRegion objjects for the sram, flash,
> and flash_alias.  This is unnecessary (and leaves open the
> possibility of leaking the allocations if we exit from realize with
> an error).  Make these MemoryRegions member fields of the device
> state struct instead, as stm32f405 already does.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/stm32f100_soc.h |  4 ++++
>  include/hw/arm/stm32f205_soc.h |  4 ++++
>  hw/arm/stm32f100_soc.c         | 17 +++++++----------
>  hw/arm/stm32f205_soc.c         | 17 +++++++----------
>  4 files changed, 22 insertions(+), 20 deletions(-)
>
> diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
> index 71bffcf4fd5..b7d71c6c634 100644
> --- a/include/hw/arm/stm32f100_soc.h
> +++ b/include/hw/arm/stm32f100_soc.h
> @@ -52,6 +52,10 @@ struct STM32F100State {
>
>      STM32F2XXUsartState usart[STM_NUM_USARTS];
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
> +
> +    MemoryRegion sram;
> +    MemoryRegion flash;
> +    MemoryRegion flash_alias;
>  };
>
>  #endif
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
> index 985ff63aa9e..75251494917 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -63,6 +63,10 @@ struct STM32F205State {
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
>
>      qemu_or_irq *adc_irqs;
> +
> +    MemoryRegion sram;
> +    MemoryRegion flash;
> +    MemoryRegion flash_alias;
>  };
>
>  #endif
> diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
> index 0c4a5c66451..0be92b2c475 100644
> --- a/hw/arm/stm32f100_soc.c
> +++ b/hw/arm/stm32f100_soc.c
> @@ -67,25 +67,22 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
>      int i;
>
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *sram = g_new(MemoryRegion, 1);
> -    MemoryRegion *flash = g_new(MemoryRegion, 1);
> -    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
>
>      /*
>       * Init flash region
>       * Flash starts at 0x08000000 and then is aliased to boot memory at 0x0
>       */
> -    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F100.flash",
> +    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F100.flash",
>                             FLASH_SIZE, &error_fatal);
> -    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
> -                             "STM32F100.flash.alias", flash, 0, FLASH_SIZE);
> -    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
> -    memory_region_add_subregion(system_memory, 0, flash_alias);
> +    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> +                             "STM32F100.flash.alias", &s->flash, 0, FLASH_SIZE);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
> +    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
>
>      /* Init SRAM region */
> -    memory_region_init_ram(sram, NULL, "STM32F100.sram", SRAM_SIZE,
> +    memory_region_init_ram(&s->sram, NULL, "STM32F100.sram", SRAM_SIZE,
>                             &error_fatal);
> -    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
>
>      /* Init ARMv7m */
>      armv7m = DEVICE(&s->armv7m);
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 9cd41bf56da..0bd215aebd7 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -84,21 +84,18 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      int i;
>
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *sram = g_new(MemoryRegion, 1);
> -    MemoryRegion *flash = g_new(MemoryRegion, 1);
> -    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
>
> -    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F205.flash",
> +    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
>                             FLASH_SIZE, &error_fatal);
> -    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
> -                             "STM32F205.flash.alias", flash, 0, FLASH_SIZE);
> +    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> +                             "STM32F205.flash.alias", &s->flash, 0, FLASH_SIZE);
>
> -    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
> -    memory_region_add_subregion(system_memory, 0, flash_alias);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
> +    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
>
> -    memory_region_init_ram(sram, NULL, "STM32F205.sram", SRAM_SIZE,
> +    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
>                             &error_fatal);
> -    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
>
>      armv7m = DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
> --
> 2.20.1
>
>

