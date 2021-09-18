Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D777D4107A9
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 18:57:30 +0200 (CEST)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRdeb-00066F-4d
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 12:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRdcr-0004hn-5S
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 12:55:41 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:39633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRdcp-0006HM-1c
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 12:55:40 -0400
Received: by mail-ot1-f50.google.com with SMTP id
 j11-20020a9d190b000000b00546fac94456so886390ota.6
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 09:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=reNh+puxhXZzFFoXd3unLSPvJv/eflJOrb8CaBk8Vbk=;
 b=qC33YKD5rEczMhiqBXLwcvVw2+YCKU2fb5yrBrtQYD56mxXfMFEqWK/stxblEkbmnT
 yaTeDLXmTCJshvJTP5JGLrVpEGLaTWvMr7AF8c7OD2AmbXLcA6Qjq+lKApiWfuNSBJXl
 FghIdcg9omshZnBVUL/KAx0/6rcSjdltR3OnMq/RSQ51EpBWterr9e2TsFBNDmkRhtTa
 RVyqsyFXHJlquTGJ+1eIcKPVNUGDPl+1AtmrFY2vMXDpVE98Lc4NZ9aejk9Lm91U/kPi
 0qtDioDszY0qrwdw+IZ0JvJcRxfGZtjnFR7KqYx5sUV6hnMig2/e8Gl+56qR+7r5KrPT
 foOw==
X-Gm-Message-State: AOAM531c1B0JpqJ3HCZGCWa97DCMvzeA7J1G4IaBz2XZPr/XL2cjD7Rl
 okXrxXiFXUexQ6dj/7gP9i4f6go5/0TQT1cwnTY=
X-Google-Smtp-Source: ABdhPJzk0seEQnVfIuq54YytniSK+sxySKO2qgDsdJCuc/3+BVllQMA6L+bENFxf2ur42tJk2diWM8jYgpg1vkV5dU4=
X-Received: by 2002:a9d:7156:: with SMTP id y22mr11668891otj.75.1631984136697; 
 Sat, 18 Sep 2021 09:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200910180938.584205-1-alistair.francis@wdc.com>
 <20200910180938.584205-8-alistair.francis@wdc.com>
In-Reply-To: <20200910180938.584205-8-alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 18 Sep 2021 18:55:25 +0200
Message-ID: <CAAdtpL7-twPXfLGud9+hQq074g-VWCxOt+drkW02xzHuzDs_pA@mail.gmail.com>
Subject: Re: [PULL 07/30] hw/char: Add Microchip PolarFire SoC MMUART emulation
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.210.50;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 10, 2020 at 8:29 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Microchip PolarFire SoC MMUART is ns16550 compatible, with some
> additional registers. Create a simple MMUART model built on top
> of the existing ns16550 model.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <1598924352-89526-6-git-send-email-bmeng.cn@gmail.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/char/mchp_pfsoc_mmuart.h | 61 ++++++++++++++++++++
>  hw/char/mchp_pfsoc_mmuart.c         | 86 +++++++++++++++++++++++++++++
>  MAINTAINERS                         |  2 +
>  hw/char/Kconfig                     |  3 +
>  hw/char/meson.build                 |  1 +
>  5 files changed, 153 insertions(+)
>  create mode 100644 include/hw/char/mchp_pfsoc_mmuart.h
>  create mode 100644 hw/char/mchp_pfsoc_mmuart.c
>
> diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_pfsoc_mmuart.h
> new file mode 100644
> index 0000000000..f61990215f
> --- /dev/null
> +++ b/include/hw/char/mchp_pfsoc_mmuart.h
> @@ -0,0 +1,61 @@
> +/*
> + * Microchip PolarFire SoC MMUART emulation
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_MCHP_PFSOC_MMUART_H
> +#define HW_MCHP_PFSOC_MMUART_H
> +
> +#include "hw/char/serial.h"
> +
> +#define MCHP_PFSOC_MMUART_REG_SIZE  52
> +
> +typedef struct MchpPfSoCMMUartState {
> +    MemoryRegion iomem;
> +    hwaddr base;
> +    qemu_irq irq;
> +
> +    SerialMM *serial;
> +
> +    uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
> +} MchpPfSoCMMUartState;
> +
> +/**
> + * mchp_pfsoc_mmuart_create - Create a Microchip PolarFire SoC MMUART
> + *
> + * This is a helper routine for board to create a MMUART device that is
> + * compatible with Microchip PolarFire SoC.
> + *
> + * @sysmem: system memory region to map
> + * @base: base address of the MMUART registers
> + * @irq: IRQ number of the MMUART device
> + * @chr: character device to associate to
> + *
> + * @return: a pointer to the device specific control structure
> + */
> +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> +    hwaddr base, qemu_irq irq, Chardev *chr);
> +
> +#endif /* HW_MCHP_PFSOC_MMUART_H */
> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> new file mode 100644
> index 0000000000..8a002b0a19
> --- /dev/null
> +++ b/hw/char/mchp_pfsoc_mmuart.c
> @@ -0,0 +1,86 @@
> +/*
> + * Microchip PolarFire SoC MMUART emulation
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "chardev/char.h"
> +#include "exec/address-spaces.h"
> +#include "hw/char/mchp_pfsoc_mmuart.h"
> +
> +static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    MchpPfSoCMMUartState *s = opaque;
> +
> +    if (addr >= MCHP_PFSOC_MMUART_REG_SIZE) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return 0;
> +    }
> +
> +    return s->reg[addr / sizeof(uint32_t)];
> +}
> +
> +static void mchp_pfsoc_mmuart_write(void *opaque, hwaddr addr,
> +                                    uint64_t value, unsigned size)
> +{
> +    MchpPfSoCMMUartState *s = opaque;
> +    uint32_t val32 = (uint32_t)value;
> +
> +    if (addr >= MCHP_PFSOC_MMUART_REG_SIZE) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%" HWADDR_PRIx
> +                      " v=0x%x\n", __func__, addr, val32);
> +        return;
> +    }
> +
> +    s->reg[addr / sizeof(uint32_t)] = val32;
> +}
> +
> +static const MemoryRegionOps mchp_pfsoc_mmuart_ops = {
> +    .read = mchp_pfsoc_mmuart_read,
> +    .write = mchp_pfsoc_mmuart_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> +    hwaddr base, qemu_irq irq, Chardev *chr)
> +{
> +    MchpPfSoCMMUartState *s;
> +
> +    s = g_new0(MchpPfSoCMMUartState, 1);

Please stop adding non-QOM devices, we try hard to get rid of them.

> +
> +    memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
> +                          "mchp.pfsoc.mmuart", 0x1000);
> +
> +    s->base = base;
> +    s->irq = irq;
> +
> +    s->serial = serial_mm_init(sysmem, base, 2, irq, 399193, chr,
> +                               DEVICE_LITTLE_ENDIAN);
> +
> +    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
> +
> +    return s;
> +}

