Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482B3F2BF3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 14:21:25 +0200 (CEST)
Received: from localhost ([::1]:34382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH3WW-0008Ve-9O
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 08:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mH3VA-0007Ai-Kp; Fri, 20 Aug 2021 08:20:01 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mH3V8-0000oP-Oh; Fri, 20 Aug 2021 08:20:00 -0400
Received: by mail-lf1-x135.google.com with SMTP id i28so20258577lfl.2;
 Fri, 20 Aug 2021 05:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0itNYqJ2Q0uWrdq/RayvPXpYryzhYcISQPjA8Twijzc=;
 b=ArQIaZvw7FSwCMULXMe/JmJPpenaRbKtUbXcPUWnXRs12v3GkbgQ569gnWLUC16jsb
 lmu1yXLNGC7f+ZGf+sLGeOHLpnvpT1QJj9dbDV0QaezpRlNQnRy91OdkQ3Oje4qC2xYw
 qlJDEI8UlDI6nqaOlE99T3EJqZXFb8EXtcN+h3wuUPZFJzufurSsURBr+N+EvuudANd0
 fE8sUK9l4EcEr7blCWvqQEPoEDH7ZMUNupH/bFzoM9c8ThmNmb5qT1695x03B6Xjisu8
 tTuDOpl31kbV6k8s+hf6CENEoe4L9LwKsOvAwpdiTAMu3QQTCkCyXjFvdoQ5qypUqYkg
 0A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0itNYqJ2Q0uWrdq/RayvPXpYryzhYcISQPjA8Twijzc=;
 b=H+dJWy9CQ7sfxYZCE3Zxato3vgiVNVa+hvcJXFntUYvMLcvxUJ53QGTs5rWtwnDzIl
 1mI+ddqC3zT0Hl5073bRpTkWzRS+T9dyqMzFYPc74hNWODEcMf1zRQcmoqAyLVIY4oWs
 rMYoQ5I3S7iZSvHBmjCC/J7ZMBZpy5DSN2Wv4J8KhwSmqBcCjblbfoTxpb7tNE3ZJgKz
 z3QqmNuylzprbRmfC5XxBobnFtYMZNrhmiqlFrddwd86BnzGi3oBVB78rT6oA546r+w9
 rmQLR1bYoffE+48lGs7tA84lPMXGKHL3ussYgRn8xztYbgEWdgxRloNxTU5odMFUynGx
 q5dw==
X-Gm-Message-State: AOAM531hHEjq7p090Bhl17ShZV3YLgl4QNjKe9zNYNTnTb7IEzTXqv1u
 uhSSTstU8BI6RJ1jOMVJAFw=
X-Google-Smtp-Source: ABdhPJydQzzTqcRZ4InsD63mVZ8YfZfpMtsv3jSuGXOx4gmjzHsdtgrN1NkkU4D/1VAy4NbLyI6pOw==
X-Received: by 2002:ac2:5dd7:: with SMTP id x23mr14156278lfq.142.1629461995909; 
 Fri, 20 Aug 2021 05:19:55 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id r3sm620377lfc.114.2021.08.20.05.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 05:19:55 -0700 (PDT)
Date: Fri, 20 Aug 2021 14:19:55 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [Patch 2/2] hw/arm/xlnx-zynqmp: Add unimplemented APU mmio
Message-ID: <20210820121955.GI3586016@toto>
References: <20210819031525.653995-1-tong.ho@xilinx.com>
 <20210819031525.653995-3-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819031525.653995-3-tong.ho@xilinx.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alistair@alistair23.me
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 08:15:25PM -0700, Tong Ho wrote:
> Add unimplemented APU mmio region to xlnx-zynqmp for booting
> bare-metal guests built with standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit
> 
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>
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

Nitpick, I'd probably drop this blank line and spell out the unsigned int below.

Also, we might want consider asserting that every array member has been
initialized. Eg assert(info->name) in the loop below. Unless perhaps something
already bails out in those cases (e.g sysbus_realize_and_unref()).

In either case:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


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

