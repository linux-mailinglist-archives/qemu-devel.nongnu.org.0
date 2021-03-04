Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998332CED0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 09:53:32 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHjjf-0008AC-32
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 03:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lHjfX-0006lS-L6; Thu, 04 Mar 2021 03:49:16 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:47334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lHjfN-00037x-Ls; Thu, 04 Mar 2021 03:49:15 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id DEA7F20775;
 Thu,  4 Mar 2021 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1614847738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASxrS9NnD7zq+fjOtJQjKKkOA597vaK+aX1+w+2tfLA=;
 b=xG08+jOvU8SF7Z7tV19R9fYiRLvs2aIZEnQWI/NqE/iUKaZZ8Lg+MCvXaz2oZD0VWTDToL
 C/h5UhII6Sutv0/25PmT3vyKSnSqyX3CO9830+ijBmQET08hFCoNKGQNTsTNcGCCi+Npo3
 89z5koAaSILbicdfizktICstvmJE6oo=
Subject: Re: [PATCH v1 1/2] hw/misc: versal: Add a model of the XRAM controller
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
 <20210302110955.1810487-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <022738cb-4e87-8d38-aae6-46de5f54afb6@greensocs.com>
Date: Thu, 4 Mar 2021 09:49:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302110955.1810487-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 joe.komlodi@xilinx.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 12:09 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add a model of the Xilinx Versal Accelerator RAM (XRAM).
> This is mainly a stub to make firmware happy. The size of
> the RAMs can be probed. The interrupt mask logic is
> modelled but none of the interrups will ever be raised
> unless injected.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>   include/hw/misc/xlnx-versal-xramc.h | 102 +++++++++++
>   hw/misc/xlnx-versal-xramc.c         | 253 ++++++++++++++++++++++++++++
>   hw/misc/meson.build                 |   1 +
>   3 files changed, 356 insertions(+)
>   create mode 100644 include/hw/misc/xlnx-versal-xramc.h
>   create mode 100644 hw/misc/xlnx-versal-xramc.c
> 
> diff --git a/include/hw/misc/xlnx-versal-xramc.h b/include/hw/misc/xlnx-versal-xramc.h
> new file mode 100644
> index 0000000000..68163cf330
> --- /dev/null
> +++ b/include/hw/misc/xlnx-versal-xramc.h
> @@ -0,0 +1,102 @@
> +/*
> + * QEMU model of the Xilinx XRAM Controller.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> + */
> +
> +#ifndef XLNX_VERSAL_XRAMC_H
> +#define XLNX_VERSAL_XRAMC_H
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +#include "qemu/bitops.h"
> +#include "qemu/log.h"
> +#include "migration/vmstate.h"
> +#include "hw/irq.h"
> +
> +#define TYPE_XLNX_XRAM_CTRL "xlnx.versal-xramc"
> +
> +#define XLNX_XRAM_CTRL(obj) \
> +     OBJECT_CHECK(XlnxXramCtrl, (obj), TYPE_XLNX_XRAM_CTRL)
> +
> +REG32(XRAM_ERR_CTRL, 0x0)
> +    FIELD(XRAM_ERR_CTRL, UE_RES, 3, 1)
> +    FIELD(XRAM_ERR_CTRL, PWR_ERR_RES, 2, 1)
> +    FIELD(XRAM_ERR_CTRL, PZ_ERR_RES, 1, 1)
> +    FIELD(XRAM_ERR_CTRL, APB_ERR_RES, 0, 1)
> +REG32(XRAM_ISR, 0x4)
> +    FIELD(XRAM_ISR, INV_APB, 0, 1)
> +REG32(XRAM_IMR, 0x8)
> +    FIELD(XRAM_IMR, INV_APB, 0, 1)
> +REG32(XRAM_IEN, 0xc)
> +    FIELD(XRAM_IEN, INV_APB, 0, 1)
> +REG32(XRAM_IDS, 0x10)
> +    FIELD(XRAM_IDS, INV_APB, 0, 1)
> +REG32(XRAM_ECC_CNTL, 0x14)
> +    FIELD(XRAM_ECC_CNTL, FI_MODE, 2, 1)
> +    FIELD(XRAM_ECC_CNTL, DET_ONLY, 1, 1)
> +    FIELD(XRAM_ECC_CNTL, ECC_ON_OFF, 0, 1)
> +REG32(XRAM_CLR_EXE, 0x18)
> +    FIELD(XRAM_CLR_EXE, MON_7, 7, 1)
> +    FIELD(XRAM_CLR_EXE, MON_6, 6, 1)
> +    FIELD(XRAM_CLR_EXE, MON_5, 5, 1)
> +    FIELD(XRAM_CLR_EXE, MON_4, 4, 1)
> +    FIELD(XRAM_CLR_EXE, MON_3, 3, 1)
> +    FIELD(XRAM_CLR_EXE, MON_2, 2, 1)
> +    FIELD(XRAM_CLR_EXE, MON_1, 1, 1)
> +    FIELD(XRAM_CLR_EXE, MON_0, 0, 1)
> +REG32(XRAM_CE_FFA, 0x1c)
> +    FIELD(XRAM_CE_FFA, ADDR, 0, 20)
> +REG32(XRAM_CE_FFD0, 0x20)
> +REG32(XRAM_CE_FFD1, 0x24)
> +REG32(XRAM_CE_FFD2, 0x28)
> +REG32(XRAM_CE_FFD3, 0x2c)
> +REG32(XRAM_CE_FFE, 0x30)
> +    FIELD(XRAM_CE_FFE, SYNDROME, 0, 16)
> +REG32(XRAM_UE_FFA, 0x34)
> +    FIELD(XRAM_UE_FFA, ADDR, 0, 20)
> +REG32(XRAM_UE_FFD0, 0x38)
> +REG32(XRAM_UE_FFD1, 0x3c)
> +REG32(XRAM_UE_FFD2, 0x40)
> +REG32(XRAM_UE_FFD3, 0x44)
> +REG32(XRAM_UE_FFE, 0x48)
> +    FIELD(XRAM_UE_FFE, SYNDROME, 0, 16)
> +REG32(XRAM_FI_D0, 0x4c)
> +REG32(XRAM_FI_D1, 0x50)
> +REG32(XRAM_FI_D2, 0x54)
> +REG32(XRAM_FI_D3, 0x58)
> +REG32(XRAM_FI_SY, 0x5c)
> +    FIELD(XRAM_FI_SY, DATA, 0, 16)
> +REG32(XRAM_RMW_UE_FFA, 0x70)
> +    FIELD(XRAM_RMW_UE_FFA, ADDR, 0, 20)
> +REG32(XRAM_FI_CNTR, 0x74)
> +    FIELD(XRAM_FI_CNTR, COUNT, 0, 24)
> +REG32(XRAM_IMP, 0x80)
> +    FIELD(XRAM_IMP, SIZE, 0, 4)
> +REG32(XRAM_PRDY_DBG, 0x84)
> +    FIELD(XRAM_PRDY_DBG, ISLAND3, 12, 4)
> +    FIELD(XRAM_PRDY_DBG, ISLAND2, 8, 4)
> +    FIELD(XRAM_PRDY_DBG, ISLAND1, 4, 4)
> +    FIELD(XRAM_PRDY_DBG, ISLAND0, 0, 4)
> +REG32(XRAM_SAFETY_CHK, 0xff8)
> +
> +#define XRAM_CTRL_R_MAX (R_XRAM_SAFETY_CHK + 1)
> +
> +typedef struct XlnxXramCtrl {
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +    MemoryRegion ram;
> +    qemu_irq irq;
> +
> +    struct {
> +        uint64_t size;
> +        unsigned int encoded_size;
> +    } cfg;
> +
> +    uint32_t regs[XRAM_CTRL_R_MAX];
> +    RegisterInfo regs_info[XRAM_CTRL_R_MAX];
> +} XlnxXramCtrl;
> +#endif
> diff --git a/hw/misc/xlnx-versal-xramc.c b/hw/misc/xlnx-versal-xramc.c
> new file mode 100644
> index 0000000000..c7f449fefa
> --- /dev/null
> +++ b/hw/misc/xlnx-versal-xramc.c
> @@ -0,0 +1,253 @@
> +/*
> + * QEMU model of the Xilinx XRAM Controller.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/bitops.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/irq.h"
> +#include "hw/misc/xlnx-versal-xramc.h"
> +
> +#ifndef XLNX_XRAM_CTRL_ERR_DEBUG
> +#define XLNX_XRAM_CTRL_ERR_DEBUG 0
> +#endif
> +
> +static void xram_update_irq(XlnxXramCtrl *s)
> +{
> +    bool pending = s->regs[R_XRAM_ISR] & ~s->regs[R_XRAM_IMR];
> +    qemu_set_irq(s->irq, pending);
> +}
> +
> +static void xram_isr_postw(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(reg->opaque);
> +    xram_update_irq(s);
> +}
> +
> +static uint64_t xram_ien_prew(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(reg->opaque);
> +    uint32_t val = val64;
> +
> +    s->regs[R_XRAM_IMR] &= ~val;
> +    xram_update_irq(s);
> +    return 0;
> +}
> +
> +static uint64_t xram_ids_prew(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(reg->opaque);
> +    uint32_t val = val64;
> +
> +    s->regs[R_XRAM_IMR] |= val;
> +    xram_update_irq(s);
> +    return 0;
> +}
> +
> +static const RegisterAccessInfo xram_ctrl_regs_info[] = {
> +    {   .name = "XRAM_ERR_CTRL",  .addr = A_XRAM_ERR_CTRL,
> +        .reset = 0xf,
> +        .rsvd = 0xfffffff0,
> +    },{ .name = "XRAM_ISR",  .addr = A_XRAM_ISR,
> +        .rsvd = 0xfffff800,
> +        .w1c = 0x7ff,
> +        .post_write = xram_isr_postw,
> +    },{ .name = "XRAM_IMR",  .addr = A_XRAM_IMR,
> +        .reset = 0x7ff,
> +        .rsvd = 0xfffff800,
> +        .ro = 0x7ff,
> +    },{ .name = "XRAM_IEN",  .addr = A_XRAM_IEN,
> +        .rsvd = 0xfffff800,
> +        .pre_write = xram_ien_prew,
> +    },{ .name = "XRAM_IDS",  .addr = A_XRAM_IDS,
> +        .rsvd = 0xfffff800,
> +        .pre_write = xram_ids_prew,
> +    },{ .name = "XRAM_ECC_CNTL",  .addr = A_XRAM_ECC_CNTL,
> +        .rsvd = 0xfffffff8,
> +    },{ .name = "XRAM_CLR_EXE",  .addr = A_XRAM_CLR_EXE,
> +        .rsvd = 0xffffff00,
> +    },{ .name = "XRAM_CE_FFA",  .addr = A_XRAM_CE_FFA,
> +        .rsvd = 0xfff00000,
> +        .ro = 0xfffff,
> +    },{ .name = "XRAM_CE_FFD0",  .addr = A_XRAM_CE_FFD0,
> +        .ro = 0xffffffff,
> +    },{ .name = "XRAM_CE_FFD1",  .addr = A_XRAM_CE_FFD1,
> +        .ro = 0xffffffff,
> +    },{ .name = "XRAM_CE_FFD2",  .addr = A_XRAM_CE_FFD2,
> +        .ro = 0xffffffff,
> +    },{ .name = "XRAM_CE_FFD3",  .addr = A_XRAM_CE_FFD3,
> +        .ro = 0xffffffff,
> +    },{ .name = "XRAM_CE_FFE",  .addr = A_XRAM_CE_FFE,
> +        .rsvd = 0xffff0000,
> +        .ro = 0xffff,
> +    },{ .name = "XRAM_UE_FFA",  .addr = A_XRAM_UE_FFA,
> +        .rsvd = 0xfff00000,
> +        .ro = 0xfffff,
> +    },{ .name = "XRAM_UE_FFD0",  .addr = A_XRAM_UE_FFD0,
> +        .ro = 0xffffffff,
> +    },{ .name = "XRAM_UE_FFD1",  .addr = A_XRAM_UE_FFD1,
> +        .ro = 0xffffffff,
> +    },{ .name = "XRAM_UE_FFD2",  .addr = A_XRAM_UE_FFD2,
> +        .ro = 0xffffffff,
> +    },{ .name = "XRAM_UE_FFD3",  .addr = A_XRAM_UE_FFD3,
> +        .ro = 0xffffffff,
> +    },{ .name = "XRAM_UE_FFE",  .addr = A_XRAM_UE_FFE,
> +        .rsvd = 0xffff0000,
> +        .ro = 0xffff,
> +    },{ .name = "XRAM_FI_D0",  .addr = A_XRAM_FI_D0,
> +    },{ .name = "XRAM_FI_D1",  .addr = A_XRAM_FI_D1,
> +    },{ .name = "XRAM_FI_D2",  .addr = A_XRAM_FI_D2,
> +    },{ .name = "XRAM_FI_D3",  .addr = A_XRAM_FI_D3,
> +    },{ .name = "XRAM_FI_SY",  .addr = A_XRAM_FI_SY,
> +        .rsvd = 0xffff0000,
> +    },{ .name = "XRAM_RMW_UE_FFA",  .addr = A_XRAM_RMW_UE_FFA,
> +        .rsvd = 0xfff00000,
> +        .ro = 0xfffff,
> +    },{ .name = "XRAM_FI_CNTR",  .addr = A_XRAM_FI_CNTR,
> +        .rsvd = 0xff000000,
> +    },{ .name = "XRAM_IMP",  .addr = A_XRAM_IMP,
> +        .reset = 0x4,
> +        .rsvd = 0xfffffff0,
> +        .ro = 0xf,
> +    },{ .name = "XRAM_PRDY_DBG",  .addr = A_XRAM_PRDY_DBG,
> +        .reset = 0xffff,
> +        .rsvd = 0xffff0000,
> +        .ro = 0xffff,
> +    },{ .name = "XRAM_SAFETY_CHK",  .addr = A_XRAM_SAFETY_CHK,
> +    }
> +};
> +
> +static void xram_ctrl_reset_enter(Object *obj, ResetType type)
> +{
> +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
> +    unsigned int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
> +        register_reset(&s->regs_info[i]);
> +    }
> +
> +    ARRAY_FIELD_DP32(s->regs, XRAM_IMP, SIZE, s->cfg.encoded_size);
> +}
> +
> +static void xram_ctrl_reset_hold(Object *obj)
> +{
> +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
> +
> +    xram_update_irq(s);
> +}
> +
> +static const MemoryRegionOps xram_ctrl_ops = {
> +    .read = register_read_memory,
> +    .write = register_write_memory,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void xram_ctrl_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(dev);
> +
> +    switch (s->cfg.size) {
> +    case 64 * KiB:
> +        s->cfg.encoded_size = 0;
> +        break;
> +    case 128 * KiB:
> +        s->cfg.encoded_size = 1;
> +        break;
> +    case 256 * KiB:
> +        s->cfg.encoded_size = 2;
> +        break;
> +    case 512 * KiB:
> +        s->cfg.encoded_size = 3;
> +        break;
> +    case 1 * MiB:
> +        s->cfg.encoded_size = 4;
> +        break;
> +    default:
> +        error_setg(errp, "Unsupported XRAM size %" PRId64, s->cfg.size);
> +        return;
> +    }
> +
> +    memory_region_init_ram(&s->ram, OBJECT(s),
> +                           object_get_canonical_path_component(OBJECT(s)),
> +                           s->cfg.size, &error_fatal);
> +    sysbus_init_mmio(sbd, &s->ram);
> +}
> +
> +static void xram_ctrl_init(Object *obj)
> +{
> +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    RegisterInfoArray *reg_array;
> +
> +    memory_region_init(&s->iomem, obj, TYPE_XLNX_XRAM_CTRL,
> +                       XRAM_CTRL_R_MAX * 4);
> +    reg_array =
> +        register_init_block32(DEVICE(obj), xram_ctrl_regs_info,
> +                              ARRAY_SIZE(xram_ctrl_regs_info),
> +                              s->regs_info, s->regs,
> +                              &xram_ctrl_ops,
> +                              XLNX_XRAM_CTRL_ERR_DEBUG,
> +                              XRAM_CTRL_R_MAX * 4);
> +    memory_region_add_subregion(&s->iomem,
> +                                0x0,
> +                                &reg_array->mem);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +}
> +
> +static const VMStateDescription vmstate_xram_ctrl = {
> +    .name = TYPE_XLNX_XRAM_CTRL,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, XlnxXramCtrl, XRAM_CTRL_R_MAX),
> +        VMSTATE_END_OF_LIST(),
> +    }
> +};
> +
> +static Property xram_ctrl_properties[] = {
> +    DEFINE_PROP_UINT64("size", XlnxXramCtrl, cfg.size, 1 * MiB),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void xram_ctrl_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = xram_ctrl_realize;
> +    dc->vmsd = &vmstate_xram_ctrl;
> +    device_class_set_props(dc, xram_ctrl_properties);
> +
> +    rc->phases.enter = xram_ctrl_reset_enter;
> +    rc->phases.hold = xram_ctrl_reset_hold;
> +}
> +
> +static const TypeInfo xram_ctrl_info = {
> +    .name          = TYPE_XLNX_XRAM_CTRL,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(XlnxXramCtrl),
> +    .class_init    = xram_ctrl_class_init,
> +    .instance_init = xram_ctrl_init,
> +};
> +
> +static void xram_ctrl_register_types(void)
> +{
> +    type_register_static(&xram_ctrl_info);
> +}
> +
> +type_init(xram_ctrl_register_types)
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 629283957f..fbc4789249 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -85,6 +85,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
>   ))
>   softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
>   softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c', 'zynq-xadc.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-xramc.c'))
>   softmmu_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: files('stm32f2xx_syscfg.c'))
>   softmmu_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_syscfg.c'))
>   softmmu_ss.add(when: 'CONFIG_STM32F4XX_EXTI', if_true: files('stm32f4xx_exti.c'))
> 

