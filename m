Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17695E6818
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:09:14 +0200 (CEST)
Received: from localhost ([::1]:40048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOlF-0007Xo-VC
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNFB-0007lw-1h
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:32:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNF5-0007GP-5R
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:32:00 -0400
Received: by mail-ed1-x536.google.com with SMTP id f20so13864463edf.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7+fekaK3WUkEplRWbMNEUAb0Dlj1qS5b85lF6jkyb1Q=;
 b=XLs5tNP59UnAQ4WYpfwIZOlrTYMMt+vQYtPY6W5K+NdLcy+UPpFmy+TNqxhhg6Ubiq
 U2YOmnHLWhdPb/LK3JVWdVIVbcUVSv7O51e5pSQnD2uLpzRXIJhXR8E3KLB5NUGYkW3/
 YuI1UoCEEHRR+++u1Lz6nAsZGJy3KNxkVRxOib6u5lHI3N08VlD+Epvzar6mWrWyXkXR
 kJF+suVxDCupCJ9f/gdjsX1Y4QFyYHuYf8YgfCFXqMH+DdwDB95DcC2wUx/LzwTpESf/
 7ytBs6OFNxSVHCRug8d73dzJ1V3M8HqYH9sMBRBocTNTsRAaV3gJu8/4fgxDigfLtreP
 /D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7+fekaK3WUkEplRWbMNEUAb0Dlj1qS5b85lF6jkyb1Q=;
 b=4khn9miYGu9t05Uqr2XFklrgHtgr8VW3fDeK0x7Oeygu5ksODY4euWKbeKrP0GW/V3
 VByAoD0+dI6zbK98fa76VnroTNpUk8XmCpojBnvqSwS22rUugmAnx2gHoBsiZtqLMwLb
 vo4QUTytkMaXnIqKTsohezZjByZJYY9SDMmtvFVvi3SgQGKd6oyHCsYP3WPUT6DhtcJd
 H+V5IdwenfA6h2a/PXfFNXhQHMz66OCpIhHxXltMqe4PIWgLuNJXapHPO58Y0Ztki9rF
 52iQkjKfJ3PAQDl6emFaBZPGOhREuP2RQdzGKehpXTcqgkQK/neoYPKTQLi9KUWZpKfL
 U12A==
X-Gm-Message-State: ACrzQf1KkerdKyQuz08ft8Ne9uMVymjKaW9Vp/bYiXJ7Ib/CqhDa1zDp
 c7CiV/U1XfkEFGM5TNHyTMdmpbri4CMQ5abfx1/QMg==
X-Google-Smtp-Source: AMsMyM59xHNErj0r8ybC9dPmqO7cuR2//8r21R+ffqkw1kXrp/xz5t6+VhNbi0aGV0PLbZjimyxh7Gf3ZqrqlKCi6nU=
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr3602693edz.301.1663857111934; Thu, 22
 Sep 2022 07:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
 <20220910061252.2614-3-vikram.garhwal@amd.com>
In-Reply-To: <20220910061252.2614-3-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:31:39 +0100
Message-ID: <CAFEAcA84cJAsROqhZwdZ7S7jgB-n=LrwFNNGKAc7Nf-N7qU3dQ@mail.gmail.com>
Subject: Re: [QEMU][PATCH 3/5] xlnx-zynqmp: Connect Xilinx VERSAL CANFD
 controllers
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@amd.com, francisco.iglesias@amd.com, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Sept 2022 at 07:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> Connect CANFD0 and CANFD1 on the Versal-virt machine.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  hw/arm/xlnx-versal-virt.c    | 45 ++++++++++++++++++++++++++++++++++++
>  hw/arm/xlnx-versal.c         | 37 +++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h | 12 ++++++++++
>  3 files changed, 94 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 37fc9b919c..062e6f2a95 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -40,9 +40,11 @@ struct VersalVirt {
>          uint32_t clk_25Mhz;
>          uint32_t usb;
>          uint32_t dwc;
> +        uint32_t canfd[2];
>      } phandle;
>      struct arm_boot_info binfo;
>
> +    CanBusState *canbus[XLNX_VERSAL_NR_CANFD];
>      struct {
>          bool secure;
>      } cfg;
> @@ -235,6 +237,34 @@ static void fdt_add_uart_nodes(VersalVirt *s)
>      }
>  }
>
> +static void fdt_add_canfd_nodes(VersalVirt *s)
> +{
> +    uint64_t addrs[] = { MM_CANFD0, MM_CANFD1 };
> +    uint32_t size[] = {MM_CANFD0_SIZE, MM_CANFD1_SIZE};

Can you be consistent about how you format the spacing on this
kind of thing, please?


> +    unsigned int irqs[] = { VERSAL_CANFD0_IRQ_0, VERSAL_CANFD1_IRQ_0 };
> +    const char compat[] = "xlnx,versal-canfd";
> +    int i;
> +
> +    /* Create and connect CANFD0 and CANFD1 nodes to canbus0. */
> +    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
> +        char *name = g_strdup_printf("/canfd@%" PRIx64, addrs[i]);
> +        qemu_fdt_add_subnode(s->fdt, name);
> +        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo0", 0x40);
> +        qemu_fdt_setprop_cell(s->fdt, name, "enable-rx-fifo1", 0x1);
> +        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo1", 0x40);
> +
> +        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> +                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
> +                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> +                                     2, addrs[i], 2, size[i]);
> +        qemu_fdt_setprop(s->fdt, name, "compatible",
> +                         compat, sizeof(compat));

Where there is no embedded NUL byte in the compat string, you
can use qemu_fdt_setprop_string():
    qemu_fdt_setprop_string(s->fdt, name, "compatible", "xlnx,versal-canfd");

> +
> +        g_free(name);
> +    }
> +}
> +
>  static void fdt_add_fixed_link_nodes(VersalVirt *s, char *gemname,
>                                       uint32_t phandle)
>  {
> @@ -639,12 +669,17 @@ static void versal_virt_init(MachineState *machine)
>                              TYPE_XLNX_VERSAL);
>      object_property_set_link(OBJECT(&s->soc), "ddr", OBJECT(machine->ram),
>                               &error_abort);
> +    object_property_set_link(OBJECT(&s->soc), "canbus0", OBJECT(s->canbus[0]),
> +                             &error_abort);
> +    object_property_set_link(OBJECT(&s->soc), "canbus1", OBJECT(s->canbus[1]),
> +                             &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
>
>      fdt_create(s);
>      create_virtio_regions(s);
>      fdt_add_gem_nodes(s);
>      fdt_add_uart_nodes(s);
> +    fdt_add_canfd_nodes(s);
>      fdt_add_gic_nodes(s);
>      fdt_add_timer_nodes(s);
>      fdt_add_zdma_nodes(s);
> @@ -712,6 +747,16 @@ static void versal_virt_init(MachineState *machine)
>
>  static void versal_virt_machine_instance_init(Object *obj)
>  {
> +    VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(obj);
> +
> +    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
> +                             (Object **)&s->canbus[0],
> +                             object_property_allow_set_link,
> +                             0);
> +    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
> +                             (Object **)&s->canbus[1],
> +                             object_property_allow_set_link,
> +                             0);

What are these for ?

>  }
>
>  static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 57276e1506..452f433eb4 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -185,6 +185,38 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
>      }
>  }
>
> +static void versal_create_canfds(Versal *s, qemu_irq *pic)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.canfd); i++) {
> +        static const int irqs[] = { VERSAL_CANFD0_IRQ_0, VERSAL_CANFD1_IRQ_0};
> +        static const uint64_t addrs[] = { MM_CANFD0, MM_CANFD1 };
> +        char *name = g_strdup_printf("canfd%d", i);
> +        DeviceState *dev;
> +        MemoryRegion *mr;
> +
> +        object_initialize_child(OBJECT(s), name, &s->lpd.iou.canfd[i],
> +                                TYPE_XILINX_CANFD);
> +        dev = DEVICE(&s->lpd.iou.canfd[i]);

You never use dev directly as a DeviceState, so you might as well
make it a SysBusDevice and save some of the cast macros below.

> +
> +        object_property_set_int(OBJECT(&s->lpd.iou.canfd[i]), "ext_clk_freq",
> +                                XLNX_VERSAL_CANFD_REF_CLK , &error_abort);
> +
> +        object_property_set_link(OBJECT(dev), "canfdbus",
> +                                 OBJECT(s->lpd.iou.canbus[i]),
> +                                 &error_abort);
> +
> +        sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +        memory_region_add_subregion(&s->mr_ps, addrs[i], mr);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irqs[i]]);
> +        g_free(name);
> +    }
> +}

thanks
-- PMM

