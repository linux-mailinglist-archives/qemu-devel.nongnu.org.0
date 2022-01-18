Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8679493054
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 23:10:47 +0100 (CET)
Received: from localhost ([::1]:38244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9wgg-0000RS-AZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 17:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n9wY3-0008GK-CH
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 17:01:51 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n9wXx-000880-RM
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 17:01:51 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id D6930C60912;
 Tue, 18 Jan 2022 23:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1642543302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pimYEGTY3kRjpsZv9XUTTZZWJv14rfUt8a4JYMse5ak=;
 b=NaJjunrQOjHdwvMGV2CAhBQGOV0y0MypcISA42JEkiwautY/Ob4vm2PfOKsv5snpYLSIgO
 AEZyoROy3qjg031LBS361d3cu0wq1HHNVf6nVhMHF56V16I/2dySBoos7+tlAuP6f4gG6A
 tIEy+FlD6DlfTb9a4yowGXbBsRaqwmyV0eGu7t6I+L9uKBA3LDOcBJ3+WZljYZAbNMInN8
 QSVdEatldYzAlr/mPs/B82YWnYuRZUTNRuToUfkGcMHutglnj4DSWxOkLZ6KVWHdI4WhoI
 tolEdvZQ2fKuWC+4qs5b42ZVfN0N+b/BrnkAsQ9I/V+c5F7PMYSqvLzViUpZ+Q==
Date: Tue, 18 Jan 2022 23:01:42 +0100
From: Luc Michel <luc@lmichel.fr>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v6 05/12] hw/dma: Add the DMA control interface
Message-ID: <20220118220142.mqtbrqht2de773zm@sekoia-pc.home.lmichel.fr>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
 <20220114152841.1740-6-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114152841.1740-6-francisco.iglesias@xilinx.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 alistair23@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco!

On 15:28 Fri 14 Jan     , Francisco Iglesias wrote:
> An option on real hardware when embedding a DMA engine into a peripheral
> is to make the peripheral control the engine through a custom DMA control
> (hardware) interface between the two. Software drivers in this scenario
> configure and trigger DMA operations through the controlling peripheral's
> register API (for example, writing a specific bit in a register could
> propagate down to a transfer start signal on the DMA control interface).
> At the same time the status, results and interrupts for the transfer might
> still be intended to be read and caught through the DMA engine's register
> API (and signals).

I understand the goal you trying to achieve here. Having a generic
interface between a peripheral and the internal DMA it's using for its
memory transfers.

I wonder however how much this scenario can be generalized. I see that
you have only one method in this interface, which is basically "perform
a DMA transaction". Given the method's parameters, the peripheral can
indicate what address/length it wants to read.

IIUC this is well suited to your case (the OSPI controller), because
other DMA parameters are configured by other means (DMA or OSPI
registers I guess).

But how much this will suite the next use case for this interface? Will
the embedded DMA be configured the same way? Maybe the method will also
require e.g., the destination buffer address?

My feeling is that this interface is quite ad-hoc for your case. It is
either going to stay really simple as it is now, and won't necessarily
fit the next similar use case, or is going to get pretty complicated to
cover all cases. For an added value I'm not sure I can see because the
pair "peripheral - DMA" seems tightly coupled to me. Do you foresee a
case where you want to be able to e.g., instantiate DMA B instead of DMA
A for the same controller?

I think you could have basically the same code by having a pointer to
your XlnxCSUDMA object (instead of the iface) in the OSPI struct, and a
function like xlnx_csu_dma_start_transfer declared in xlnx_csu_dma.h,
having the same behaviour as dma_ctrl_if_read.

Maybe I'm wrong and you actually foresee cases where the genericity this
interface gives is what you want? What do you think?

Luc

> 
> This patch adds a QEMU DMA control interface that can be used for
> modelling above scenario. Through this new interface a peripheral model
> embedding a DMA engine model will be able to directly initiate transfers
> through the DMA. At the same time the transfer state, result and
> completion signaling will be read and caught through the DMA engine
> model's register API and signaling.
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/dma/dma-ctrl-if.c         | 30 +++++++++++++++++++++++
>  hw/dma/meson.build           |  1 +
>  include/hw/dma/dma-ctrl-if.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 hw/dma/dma-ctrl-if.c
>  create mode 100644 include/hw/dma/dma-ctrl-if.h
> 
> diff --git a/hw/dma/dma-ctrl-if.c b/hw/dma/dma-ctrl-if.c
> new file mode 100644
> index 0000000000..895edac277
> --- /dev/null
> +++ b/hw/dma/dma-ctrl-if.c
> @@ -0,0 +1,30 @@
> +/*
> + * DMA control interface.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +#include "hw/dma/dma-ctrl-if.h"
> +
> +MemTxResult dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len)
> +{
> +    DmaCtrlIfClass *dcic =  DMA_CTRL_IF_GET_CLASS(dma);
> +    return dcic->read(dma, addr, len);
> +}
> +
> +static const TypeInfo dma_ctrl_if_info = {
> +    .name          = TYPE_DMA_CTRL_IF,
> +    .parent        = TYPE_INTERFACE,
> +    .class_size = sizeof(DmaCtrlIfClass),
> +};
> +
> +static void dma_ctrl_if_register_types(void)
> +{
> +    type_register_static(&dma_ctrl_if_info);
> +}
> +
> +type_init(dma_ctrl_if_register_types)
> diff --git a/hw/dma/meson.build b/hw/dma/meson.build
> index f3f0661bc3..c43c067856 100644
> --- a/hw/dma/meson.build
> +++ b/hw/dma/meson.build
> @@ -14,3 +14,4 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
> +common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('dma-ctrl-if.c'))
> diff --git a/include/hw/dma/dma-ctrl-if.h b/include/hw/dma/dma-ctrl-if.h
> new file mode 100644
> index 0000000000..0662149e14
> --- /dev/null
> +++ b/include/hw/dma/dma-ctrl-if.h
> @@ -0,0 +1,58 @@
> +/*
> + * DMA control interface.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_DMA_CTRL_IF_H
> +#define HW_DMA_CTRL_IF_H
> +
> +#include "hw/hw.h"
> +#include "exec/memory.h"
> +#include "qom/object.h"
> +
> +#define TYPE_DMA_CTRL_IF "dma-ctrl-if"
> +typedef struct DmaCtrlIfClass DmaCtrlIfClass;
> +DECLARE_CLASS_CHECKERS(DmaCtrlIfClass, DMA_CTRL_IF,
> +                       TYPE_DMA_CTRL_IF)
> +
> +#define DMA_CTRL_IF(obj) \
> +     INTERFACE_CHECK(DmaCtrlIf, (obj), TYPE_DMA_CTRL_IF)
> +
> +typedef struct DmaCtrlIf {
> +    Object Parent;
> +} DmaCtrlIf;
> +
> +typedef struct DmaCtrlIfClass {
> +    InterfaceClass parent;
> +
> +    /*
> +     * read: Start a read transfer on the DMA engine implementing the DMA
> +     * control interface
> +     *
> +     * @dma_ctrl: the DMA engine implementing this interface
> +     * @addr: the address to read
> +     * @len: the number of bytes to read at 'addr'
> +     *
> +     * @return a MemTxResult indicating whether the operation succeeded ('len'
> +     * bytes were read) or failed.
> +     */
> +    MemTxResult (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
> +} DmaCtrlIfClass;
> +
> +/*
> + * Start a read transfer on a DMA engine implementing the DMA control
> + * interface.
> + *
> + * @dma_ctrl: the DMA engine implementing this interface
> + * @addr: the address to read
> + * @len: the number of bytes to read at 'addr'
> + *
> + * @return a MemTxResult indicating whether the operation succeeded ('len'
> + * bytes were read) or failed.
> + */
> +MemTxResult dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
> +
> +#endif /* HW_DMA_CTRL_IF_H */
> -- 
> 2.11.0
> 
> 

-- 

