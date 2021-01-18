Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E62F97C0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:14:57 +0100 (CET)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1K4G-0006RL-B5
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1l1K2Q-0005V5-7x
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:13:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1l1K2N-0000vw-VO
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:13:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64237224DF
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610935978;
 bh=bnIFVS3mreLjKZD5G/Ru8zbXhvIQ4ixaA0WiS02aq2Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=opuzNOawubHXmQSDfOgj+x7A80hjLW8tVVUPmwX6rh1Bmu70qiBLMd4RlETHk8zCK
 fvmF4ClFiM8SqeT/w26wcX6a4CMUfIHDnpM6s8gLLN8bWW9f757dvlM+x6P48v0HE/
 jUINa4TvEsOv9CyKx7BSWkDxDMlNssgsUta4UMXeMldMLkv7J+5KON+N2uueuATnXi
 /XFeAZlGMW/D3/wriNM/0VSqXkFRFupAfoipSxmdpKO5aw/tmA9OXqs45iBRHH6kSg
 l9cCXwjFa+ZLzWhlL58gXB0jL3/NCOripbAdYKdGyJfksexKBw6+z4mZotjYWX4UJ/
 tYKybJun4seGQ==
Received: by mail-io1-f44.google.com with SMTP id e22so6308425iog.6
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 18:12:58 -0800 (PST)
X-Gm-Message-State: AOAM530brwIW30k8Ps0qifQG5LbWArKfNL3Y9X7PA0BzmSzGSzdBPG4p
 4goVGTBacCiFdErRWnqagmvRfa8fMpry/m4gmd8=
X-Google-Smtp-Source: ABdhPJwBblPDu6HFF6Evg/2u/pJhPiYyUek2TcgB/r0WOcYPJJ720P7r1aTOsjcJkqq4eyUSQEfe/B1sExDKnZSn6ac=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr15632654ioq.13.1610935977826; 
 Sun, 17 Jan 2021 18:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20210118011706.22639-1-jiaxun.yang@flygoat.com>
 <20210118011706.22639-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20210118011706.22639-2-jiaxun.yang@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 18 Jan 2021 10:12:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4SqGgxPMA06sr8YVcB_-0E+jQYmab6AECS1PmXh25rig@mail.gmail.com>
Message-ID: <CAAhV-H4SqGgxPMA06sr8YVcB_-0E+jQYmab6AECS1PmXh25rig@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/intc: Add Loongson Inter Processor Interrupt
 controller
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Jiaxun,

On Mon, Jan 18, 2021 at 9:17 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Loongson IPI controller is a MMIO based simple level triggered
> interrupt controller. It will trigger IRQ to it's upstream
> processor when set register is written.
>
> It also has 4 64bit mailboxes to pass boot information to
> secondary processor.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  include/hw/intc/loongson_ipi.h |  20 ++++
>  hw/intc/loongson_ipi.c         | 174 +++++++++++++++++++++++++++++++++
>  hw/intc/Kconfig                |   3 +
>  hw/intc/meson.build            |   1 +
>  hw/intc/trace-events           |   4 +
>  5 files changed, 202 insertions(+)
>  create mode 100644 include/hw/intc/loongson_ipi.h
>  create mode 100644 hw/intc/loongson_ipi.c
>
> diff --git a/include/hw/intc/loongson_ipi.h b/include/hw/intc/loongson_ipi.h
> new file mode 100644
> index 0000000000..a535c467bf
> --- /dev/null
> +++ b/include/hw/intc/loongson_ipi.h
> @@ -0,0 +1,20 @@
> +/*
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License.  See the file "COPYING" in the main directory of this archive
> + * for more details.
> + *
> + * Copyright (c) 2020-2021 Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *
> + */
> +
> +#ifndef LOONGSON_IPI_H
> +#define LOONGSON_IPI_H
> +
> +#include "qemu/units.h"
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_LOONGSON_IPI "loongson.ipi"
> +#define LOONGSON_IPI(obj) OBJECT_CHECK(struct loongson_ipi, (obj), TYPE_LOONGSON_IPI)
> +
> +#endif /* LOONGSON_IPI_H */
> diff --git a/hw/intc/loongson_ipi.c b/hw/intc/loongson_ipi.c
> new file mode 100644
> index 0000000000..cce1da8fb9
> --- /dev/null
> +++ b/hw/intc/loongson_ipi.c
> @@ -0,0 +1,174 @@
> +/*
> + * QEMU Loongson Inter Processor Interrupt Controller
> + *
> + * Copyright (c) 2020-2021 Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/intc/loongson_ipi.h"
> +#include "sysemu/reset.h"
> +#include "trace.h"
> +
> +/*
> + * Mailboxes are actually 4 64bit registers but we treat it as 8 32bit
> + * to simplify implementation.
> + */
> +#define NUM_MBOX  8
> +
> +enum {
> +    R_ISR = 0,
> +    R_IEN = 1,
> +    R_SET = 2,
> +    R_CLR = 3,
> +    /* No register at 0x10~0x20 */
> +    R_MBOX0 = 8,
> +    R_END = R_MBOX0 + NUM_MBOX
> +};
> +
> +struct loongson_ipi {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +    qemu_irq parent_irq;
> +
> +    uint32_t isr;
> +    uint32_t ien;
> +    uint32_t mbox[NUM_MBOX];
> +};
> +
> +static uint64_t
> +ipi_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    struct loongson_ipi *p = opaque;
> +    uint64_t r = 0;
> +
> +    addr >>= 2;
> +    switch (addr) {
> +    case R_ISR:
> +        r = p->isr;
> +        break;
> +    case R_IEN:
> +        r = p->ien;
> +        break;
> +    case R_SET:
> +    case R_CLR:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Reading write only reg: 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        break;
> +    case R_MBOX0 ... (R_END - 1):
> +        r = p->mbox[addr - R_MBOX0];
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    trace_loongson_ipi_read(addr, r);
> +
> +    return r;
> +}
> +
> +static void
> +ipi_write(void *opaque, hwaddr addr,
> +          uint64_t val64, unsigned int size)
> +{
> +    struct loongson_ipi *p = opaque;
> +    uint32_t value = val64;
> +
> +    addr >>= 2;
> +    switch (addr) {
> +    case R_ISR:
> +        /* Do nothing */
> +        break;
> +    case R_IEN:
> +        p->ien = value;
> +        break;
> +    case R_SET:
> +        p->isr |= value;
> +        break;
> +    case R_CLR:
> +        p->isr &= ~value;
> +        break;
> +    case R_MBOX0 ... (R_END - 1):
> +        p->mbox[addr - R_MBOX0] = value;
> +        break;
> +    default:
> +        break;
> +    }
> +    p->isr &= p->ien;
> +
> +    trace_loongson_ipi_write(addr, value);
> +
> +    qemu_set_irq(p->parent_irq, !!p->isr);
> +}
> +
> +static void ipi_reset(void *opaque)
> +{
> +    int i;
> +    struct loongson_ipi *p = opaque;
> +
> +    p->ien = 0;
> +    p->isr = 0;
> +    for (i = 0; i < NUM_MBOX; i++) {
> +        p->mbox[i] = 0;
> +    }
> +}
> +
> +static const MemoryRegionOps pic_mmio_ops = {
> +    .read = ipi_read,
> +    .write = ipi_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4
> +    },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8
> +    },
> +};
> +
> +static void loongson_ipi_init(Object *obj)
> +{
> +    struct loongson_ipi *p = LOONGSON_IPI(obj);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
> +
> +    memory_region_init_io(&p->mmio, obj, &pic_mmio_ops, p,
> +                          "loongson.ipi", R_END * 4);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
> +    qemu_register_reset(ipi_reset, p);
> +}
> +
> +static const TypeInfo loongson_ipi_info = {
> +    .name          = TYPE_LOONGSON_IPI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(struct loongson_ipi),
> +    .instance_init = loongson_ipi_init,
> +};
> +
> +static void loongson_ipi_register_types(void)
> +{
> +    type_register_static(&loongson_ipi_info);
> +}
> +
> +type_init(loongson_ipi_register_types)
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index c18d11142a..0e15102662 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -59,6 +59,9 @@ config RX_ICU
>  config LOONGSON_LIOINTC
>      bool
>
> +config LOONGSON_IPI
> +    bool
> +
>  config SIFIVE_CLINT
>      bool
>
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 53cba11569..5257c5fb94 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -36,6 +36,7 @@ specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
>  specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_plic.c'))
>  specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
>  specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
> +specific_ss.add(when: 'CONFIG_LOONGSON_IPI', if_true: files('loongson_ipi.c'))
Maybe sort by alpha-betical is better (put IPI before LIOINTC)?

Huacai
>  specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
>  specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
>  specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 8ed397a0d5..e43e318be0 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -60,6 +60,10 @@ lm32_pic_set_ip(uint32_t ip) "ip 0x%08x"
>  lm32_pic_get_im(uint32_t im) "im 0x%08x"
>  lm32_pic_get_ip(uint32_t ip) "ip 0x%08x"
>
> +# loongson_ipi.c
> +loongson_ipi_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
> +loongson_ipi_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
> +
>  # xics.c
>  xics_icp_check_ipi(int server, uint8_t mfrr) "CPU %d can take IPI mfrr=0x%x"
>  xics_icp_accept(uint32_t old_xirr, uint32_t new_xirr) "icp_accept: XIRR 0x%"PRIx32"->0x%"PRIx32
> --
> 2.30.0
>

