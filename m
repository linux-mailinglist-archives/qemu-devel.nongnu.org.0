Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CA63F13A0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 08:34:58 +0200 (CEST)
Received: from localhost ([::1]:57766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGbdi-00068s-0y
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 02:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbc5-0003g9-0l; Thu, 19 Aug 2021 02:33:17 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbc3-0001K6-9I; Thu, 19 Aug 2021 02:33:16 -0400
Received: by mail-io1-xd31.google.com with SMTP id d11so6251547ioo.9;
 Wed, 18 Aug 2021 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ssgLirzoqmiGO+jXtYOAlXHNVbgmhaBEXyHwDW6MJTk=;
 b=aeISrSCKlCIgywtme0ONP+qcRXyYVmTjWM9T38jFEoPmqSZNGLjIEjoiFEnF6YemV3
 GDGBEG34ivbkNEWw1y6f2UFSAOeenCsKZ70C8Wbpl1c2cLLp4Eklxkh2WdBoXSIlkwoW
 GW8LvDwRZN02k8Sf3+P3/s8g9OpdAMdi8u1EgPHaAyHf4vJAF5QXeQNRshAfo9MBwe3W
 PBo5VcphMddy1dET6sck53uBRH7pw5MftoUu/leiM0oq2FuE02vAOFNsbZQ7RXoN+Y+U
 9GFqs+j87anc0+TC5BLQlDJUN+glee6JaQuHNgQB/RUP+cCkEzqoq+diCpivtn68EWkn
 MNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ssgLirzoqmiGO+jXtYOAlXHNVbgmhaBEXyHwDW6MJTk=;
 b=G3RHuMZlwOeRXaV8mnD+mHOCqpqmAB+j6LvpbH8+YK3wDwblQRHk+M53FSQY9bkooO
 BRCw7BhfcDxulCf7+o2+orXg9aoq3FmoJLYn0421GEY3jQLtRtKwyNOH6WPdKWQIlAqg
 WFMEpCDhDMBCmDvpWlEJfFCVA3hMWGB5f4PoHsX9OMDQt87N+5an57tm9YP8exe8u4pX
 wfr57lhafvEpsexEmBcNHb3+xqwEWA+gHAUQCdwlSbu5eXRGvla9IdgAeM+7cG+v1sNz
 GOuXjQYEm4cnuKQecpEx4KNNYr0DB1jqohDcqy6NjMtPyG0/yBxqGKW3qDooBLQvMUcR
 l4MA==
X-Gm-Message-State: AOAM533fat3Nsua5cG1q0ne9u/a6e2Q/oEJA8LNUSAodRHxB7reFqm5o
 fmYeV5bj3GkaDnPhj0IFZYZ2/qLBY2c0b6sBtt0=
X-Google-Smtp-Source: ABdhPJzWdixmJMXxrb/2yW+TZtTYWv//YvESo0ChGhmmg7MXdxfrv1i3krBCH2Zz1ftl/6fa0Vt/1IIj546HX5Xz0So=
X-Received: by 2002:a02:c80e:: with SMTP id p14mr11826079jao.8.1629354793708; 
 Wed, 18 Aug 2021 23:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210819031525.653995-1-tong.ho@xilinx.com>
 <20210819031525.653995-3-tong.ho@xilinx.com>
In-Reply-To: <20210819031525.653995-3-tong.ho@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:32:47 +1000
Message-ID: <CAKmqyKOy_64vEeanV5Wk-XprF83QN3=k_ZBS8AJ+KbOgSGcgxA@mail.gmail.com>
Subject: Re: [Patch 2/2] hw/arm/xlnx-zynqmp: Add unimplemented APU mmio
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
Cc: Edgar Iglesias <edgar.iglesias@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 1:22 PM Tong Ho <tong.ho@xilinx.com> wrote:
>
> Add unimplemented APU mmio region to xlnx-zynqmp for booting
> bare-metal guests built with standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit
>
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c         | 32 ++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-zynqmp.h |  7 +++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 3597e8db4d..790df2b6f1 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -20,6 +20,7 @@
>  #include "qemu/module.h"
>  #include "hw/arm/xlnx-zynqmp.h"
>  #include "hw/intc/arm_gic_common.h"
> +#include "hw/misc/unimp.h"
>  #include "hw/boards.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/sysemu.h"
> @@ -56,6 +57,9 @@
>  #define DPDMA_ADDR          0xfd4c0000
>  #define DPDMA_IRQ           116
>
> +#define APU_ADDR            0xfd5c0000
> +#define APU_SIZE            0x100
> +
>  #define IPI_ADDR            0xFF300000
>  #define IPI_IRQ             64
>
> @@ -222,6 +226,32 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
>      qdev_realize(DEVICE(&s->rpu_cluster), NULL, &error_fatal);
>  }
>
> +static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
> +{
> +    static const struct UnimpInfo {
> +        const char *name;
> +        hwaddr base;
> +        hwaddr size;
> +    } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
> +        { .name = "apu", APU_ADDR, APU_SIZE },
> +    };
> +
> +    unsigned nr;
> +
> +    for (nr = 0; nr < ARRAY_SIZE(unimp_areas); nr++) {
> +        const struct UnimpInfo *info = &unimp_areas[nr];
> +        DeviceState *dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +        qdev_prop_set_string(dev, "name", info->name);
> +        qdev_prop_set_uint64(dev, "size", info->size);
> +        object_property_add_child(OBJECT(s), info->name, OBJECT(dev));
> +
> +        sysbus_realize_and_unref(sbd, &error_fatal);
> +        sysbus_mmio_map(sbd, 0, info->base);
> +    }
> +}
> +
>  static void xlnx_zynqmp_init(Object *obj)
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> @@ -616,6 +646,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
>
> +    xlnx_zynqmp_create_unimp_mmio(s);
> +
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
>          if (!object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
>                                        errp)) {
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index d3e2ef97f6..c84fe15996 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -79,6 +79,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
>                                    XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
>
> +/*
> + * Unimplemented mmio regions needed to boot some images.
> + */
> +#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
> +
>  struct XlnxZynqMPState {
>      /*< private >*/
>      DeviceState parent_obj;
> @@ -96,6 +101,8 @@ struct XlnxZynqMPState {
>      MemoryRegion *ddr_ram;
>      MemoryRegion ddr_ram_low, ddr_ram_high;
>
> +    MemoryRegion mr_unimp[XLNX_ZYNQMP_NUM_UNIMP_AREAS];
> +
>      CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
>      CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
>      XlnxZynqMPCANState can[XLNX_ZYNQMP_NUM_CAN];
> --
> 2.25.1
>
>

