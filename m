Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297112F5518
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 00:08:28 +0100 (CET)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzpFb-0006cV-6I
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 18:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzpEX-0006Ch-A8
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:07:21 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzpEV-0004W8-By
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:07:20 -0500
Received: by mail-wm1-x32e.google.com with SMTP id y187so3102308wmd.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 15:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VqNyR4UsADqARN/VGuKrZJrj1mxu1/DlD6wIKQkCHGg=;
 b=G9SH23BUMLtwtfjXDwSFvMw3aRTZ9g+ONkgAnAgQlDTJdGBqa0aB/pOsqeie8K3GhE
 jqWxFxqIN/66CklNgOcbdIMZtYlH/rpg4aR5z6dHNyDfjtycAowLeXvvftprv/TRNwSA
 Rv8F1EcX2X1RsIYhAUfGKiZmFFHuLpCpHV/o3u9AB4VKywMngCZCaAPIblaK9fWcHO47
 Wfq1/FYOtqoiEitqR9LD1SCClp/AdxWxrvNG6+GHfN3iGBrRGuUXukSDPKJ3Y4uMUqlJ
 aVfoz+VA9wCUPNOumpTHtb2cUd20/fJ2jhJY3s7663Da41KPhDlakhGyp/IHqQ6LQOFX
 mbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VqNyR4UsADqARN/VGuKrZJrj1mxu1/DlD6wIKQkCHGg=;
 b=PZ78MMDQhLN/UGEgzpydzeZ2ghbffwU02PERV3MGeFl62A9wmpD1y9yfTqABvxygfv
 UUI5ABg7ASci11HWosLFXi27TSk1XWEFzUJewooJUuAz2OJEYwG8JjDRPPE8oitOjFsi
 bt9EAoRLDA89cDtEXToyHrA8LbbM/BUZzez776vEBJztZXdPiKutVEBg2LgMb42zVekJ
 YdkkkcYA/H5OaWYdnCmV0j7bYVPw63lzMWktG+eaVfvKkW9l+xPo2fhu2IFnsOzD0VcN
 IK1MSRh2/N2g2Tm7iDomrroxREbsaZHjryrodDGxrGkuSz9enTic/EgleDgoVliJdDiM
 ssGQ==
X-Gm-Message-State: AOAM531a1HybivEdiEM2qaVwXCvc+3nFtALLrf+uRxkB1WqEWdYWxN7Z
 dcDhRSFvQRsgKYB1xfcWOng=
X-Google-Smtp-Source: ABdhPJyk6LBke0w9PmAWZ6ixtEKxiiRoH1gf8Pq1IR+A/DiNGFd75YYZPC3JEYNCNKxeHkuJ3++8bw==
X-Received: by 2002:a1c:2c83:: with SMTP id s125mr1215221wms.161.1610579237778; 
 Wed, 13 Jan 2021 15:07:17 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r20sm4808500wmh.15.2021.01.13.15.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 15:07:16 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/intc: Add Loongson Inter Processor Interrupt
 controller
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210112033253.138140-1-jiaxun.yang@flygoat.com>
 <20210112033253.138140-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c7326247-a9b2-6c24-10ad-d8a0c49e2209@amsat.org>
Date: Thu, 14 Jan 2021 00:07:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112033253.138140-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jiaxun,

On 1/12/21 4:32 AM, Jiaxun Yang wrote:
> Loongson IPI controller is a MMIO based simple level triggered
> interrupt controller. It will trigger IRQ to it's upstream
> processor when set register is written.
> 
> It also has 8 32bit mailboxes to pass boot information to
> secondary processor.

Hmm the datasheet describe them as 4 64bit mailboxes (also
accessible in 32bit).

I have no problem modelling this device as 8x32 to simplify,
but the documentation should be accurate. Along with a comment
describing NUM_MBOX value.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/intc/Kconfig                |   3 +
>  hw/intc/loongson_ipi.c         | 146 +++++++++++++++++++++++++++++++++
>  hw/intc/meson.build            |   1 +
>  include/hw/intc/loongson_ipi.h |  20 +++++
>  4 files changed, 170 insertions(+)
>  create mode 100644 hw/intc/loongson_ipi.c
>  create mode 100644 include/hw/intc/loongson_ipi.h
> 
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
> diff --git a/hw/intc/loongson_ipi.c b/hw/intc/loongson_ipi.c
> new file mode 100644
> index 0000000000..7246f05f9e
> --- /dev/null
> +++ b/hw/intc/loongson_ipi.c
> @@ -0,0 +1,146 @@
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
> +
> +#define R_ISR       0
> +#define R_IEN       1
> +#define R_SET       2
> +#define R_CLR       3
> +/* No register between 0x10~0x20 */
> +#define R_MBOX0     8
> +#define NUM_MBOX    8
> +#define R_END       16

Can you use an enum please?

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
> +    case R_MBOX0 ... (R_END - 1):
> +        r = p->mbox[addr - R_MBOX0];
> +        break;

Logging here write-only registers (R_SET, R_CLR) as LOG_GUEST_ERROR
might result useful.

> +    default:
> +        break;
> +    }
> +
> +    qemu_log_mask(CPU_LOG_INT,
> +                  "%s: size=%d, addr=%"HWADDR_PRIx", val=%"PRIx64"\n",
> +                  __func__, size, addr, r);

CPU_LOG_INT is used for the architectural part (within GS464V).
For hardware we use trace events. Do you mind changing?

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
> +    qemu_log_mask(CPU_LOG_INT,
> +                  "%s: size=%d, addr=%"HWADDR_PRIx", val=%"PRIx32"\n",
> +                  __func__, size, addr, value);

Ditto.

> +
> +    qemu_set_irq(p->parent_irq, !!p->isr);
> +}
> +
> +static const MemoryRegionOps pic_ops = {
> +    .read = ipi_read,
> +    .write = ipi_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4
> +    }

64-bit access are valid. You probably want:

       .impl = {
           .min_access_size = 4,
           .max_access_size = 4
       },
       .valid = {
           .min_access_size = 4,
           .max_access_size = 8
       },

> +};
> +
> +static void loongson_ipi_init(Object *obj)
> +{
> +    struct loongson_ipi *p = LOONGSON_IPI(obj);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
> +
> +    memory_region_init_io(&p->mmio, obj, &pic_ops, p, "loongson.ipi",
> +                          R_END * 4);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
> +}
> +

You forgot the reset() method which clear the registers.

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
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 53cba11569..5257c5fb94 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -36,6 +36,7 @@ specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
>  specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_plic.c'))
>  specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
>  specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
> +specific_ss.add(when: 'CONFIG_LOONGSON_IPI', if_true: files('loongson_ipi.c'))
>  specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
>  specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
>  specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
> diff --git a/include/hw/intc/loongson_ipi.h b/include/hw/intc/loongson_ipi.h
> new file mode 100644
> index 0000000000..a535c467bf
> --- /dev/null
> +++ b/include/hw/intc/loongson_ipi.h

If possible use the scripts/git.orderfile to ease review.

Minor comments, but the patch is good!

Thanks,

Phil.

