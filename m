Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260232BE5D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:50:38 +0100 (CET)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHaKD-0002cV-BC
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHaIz-00028W-Rt; Wed, 03 Mar 2021 17:49:21 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:33120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHaIx-00033Q-L1; Wed, 03 Mar 2021 17:49:21 -0500
Received: by mail-io1-xd2b.google.com with SMTP id n132so15780862iod.0;
 Wed, 03 Mar 2021 14:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZuWWhk2yUEowfOpfQgbiLKZ9GBl01FZYbqsLQW0ImM=;
 b=FLGhvrJ2St2T3ad96RVzEdqIpLlGdh86F0XvHRoHwOkcDWdQbnBdQmfH9xc8SFrSQ2
 5EyYBBIfmEWIcpp32BUnV7dgZuKut9x5LYuMCJbGvovdVN7vNIKPFtotGBcRqybOzR2k
 SymWjR81QXY69UYqqs99vkCKi5zRXkfeb9uNPmVe+whTlF37mvayOKNpCu84330Np6hT
 OfKNUI4wsDN26XtQeInLB2bfXGGfM1HZkx5wRR7OuXgb2N61VLqGw5k5E+Z7BOA8H/PI
 J4pDnp29XpBJ1ZfiXZ6dD3hK3pvujV5LlDQ0sRZLBr9M2Lig0Dfk12JOK4EwMboo38xr
 0Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZuWWhk2yUEowfOpfQgbiLKZ9GBl01FZYbqsLQW0ImM=;
 b=CU6xIOcKNUczp6UWQPhkSIRheNd3v0kOBFmo7r/xKYYMjH24UPbS3pjSnt0LFGihxT
 OxS7qxlGxxtR4BRJgHPGHtGUr0wA4NW9D2R5K3kvbp8+a4anokRADiaxido99xHQmNrX
 Q9fr6tJqWtKdl4SvDWVSCr+jdCTBb80iSJIkttbUYNXJpz3t5dZZ4F7Scnda7muf0UNt
 EQ5OAU8K5W4N4BFVhhLiJt2Pprp6GtwlAAY06tpoYvvCmtPMAZ3I53Hyk7fluSQjJLJi
 AiaMyDqzO4TNX8/P9PT/uBepFaxnp3YkqHDDyhb0CsPEUVT4ct01iN+vU/IVyOHEL8a8
 7kMA==
X-Gm-Message-State: AOAM531HTlBB0Aw3ENgVRpZD1rsF5x1XdfeLtbUZjn3gouNeuL5qFOLJ
 elEmMHpBL28lye3JuH4ab+KTCnOuF6a0ZiG/+sQ=
X-Google-Smtp-Source: ABdhPJypFtR778tULMtFA6bVsJ5JRbpR5K35YGN1c+/I8nzmV2zX+r1XGiiWcHDjApWM1chjaSaETT3wmBIKH9iZ2sY=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr1237575jap.26.1614811758091; 
 Wed, 03 Mar 2021 14:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
 <20210302110955.1810487-2-edgar.iglesias@gmail.com>
In-Reply-To: <20210302110955.1810487-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Mar 2021 17:47:59 -0500
Message-ID: <CAKmqyKP01fXg6wPSnvomYOX8=AEh_w9oVLpmiu8uj6KkKxpUaA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] hw/misc: versal: Add a model of the XRAM controller
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, joe.komlodi@xilinx.com,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 francisco.iglesias@xilinx.com, KONRAD Frederic <frederic.konrad@adacore.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 2, 2021 at 6:12 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a model of the Xilinx Versal Accelerator RAM (XRAM).
> This is mainly a stub to make firmware happy. The size of
> the RAMs can be probed. The interrupt mask logic is
> modelled but none of the interrups will ever be raised
> unless injected.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/misc/xlnx-versal-xramc.h | 102 +++++++++++
>  hw/misc/xlnx-versal-xramc.c         | 253 ++++++++++++++++++++++++++++
>  hw/misc/meson.build                 |   1 +
>  3 files changed, 356 insertions(+)
>  create mode 100644 include/hw/misc/xlnx-versal-xramc.h
>  create mode 100644 hw/misc/xlnx-versal-xramc.c
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
>  ))
>  softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
>  softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c', 'zynq-xadc.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-xramc.c'))
>  softmmu_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: files('stm32f2xx_syscfg.c'))
>  softmmu_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_syscfg.c'))
>  softmmu_ss.add(when: 'CONFIG_STM32F4XX_EXTI', if_true: files('stm32f4xx_exti.c'))
> --
> 2.25.1
>
>

