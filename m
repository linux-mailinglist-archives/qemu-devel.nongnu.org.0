Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43470496275
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:57:55 +0100 (CET)
Received: from localhost ([::1]:59962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwIT-0002Yf-9w
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:57:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nAw7Z-0007e6-HT
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:46:37 -0500
Received: from [2a00:1450:4864:20::134] (port=44786
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nAw7X-0002l1-Db
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:46:37 -0500
Received: by mail-lf1-x134.google.com with SMTP id u14so3702211lfo.11
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hBam2gtyICQaQvHHZW2GR3O2UJomPg6ddEafl/3e0qc=;
 b=bKfifnBycET5M4hEYCAqwcYO0kVQh7EFSjYgb/ea2lK+PSFJhNOmkrPgahx75BtmSD
 nFBTva1U0GMSkN54N4MI/jp7jGtXAJf6Jg76LF/j9R0HsCmLOPZmqOFW1mbvoFLpDgvL
 bT3QrjL1viEuV0SF2/1yX7LODcYgnL+0ciRT1x3TU3EIrwhm+3y7PxepPv3j0jXjhrrl
 RWurd8tr973pFM9Ok7lv2OfbI7mlEEwuGVo/QvQRYQeyr8SejmmzxUE+h5SZMOmIPbux
 a0A25Iok7gI0Yt/+iLRJGH/ULoY0N/AvEEGqmCaFVsFmgIb0F4lVBMhF9g+IFECUaxFp
 iQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hBam2gtyICQaQvHHZW2GR3O2UJomPg6ddEafl/3e0qc=;
 b=w3kBj0ShSj1eh6KSKgqJdh95NNtzVE2Pqj5K8VEDQ653lJvJbJ+5Stu9ApOZr1tXWg
 8FW6Sa8S0wWI9wDSFUAG7r8RbvDhii4EzMjBS1kB9D7qo+McY9ntevQj7RxsnAVcp4Bz
 p+7ScZTx0dOZ4702Gi3wjP81MIyRbseq+ZZ8kKQ6OvAAn6o5CUeqLScgy2zg01cVZKk3
 7xbihnSgkysB5guDmB0VJYuy91iUx5HuiUrVBOTd9AZHzNu8W4fwOl4JAW9BZtEI76zf
 9wRDgaN0JsZkOOFfzUX/3ASaVXpMBVAsOq7OyYksA5WrG8HRC/I8KNlx72GJRTbI3RTM
 TLEA==
X-Gm-Message-State: AOAM533J8TbpNifadS5+Y9Q8vzvkvdoLC4gMR2rgRe/u9ggexq+OHcLz
 8bxgQiDNN8+oSSrYrYHL8Bc=
X-Google-Smtp-Source: ABdhPJyq62P4u6FupY2qZ9oMRV4+hAvBgaUEAA9Hf+atp4sXonMkcAJOHH1k1s5h3npHpFF6/kHcPg==
X-Received: by 2002:ac2:5a0b:: with SMTP id q11mr4053701lfn.394.1642779993588; 
 Fri, 21 Jan 2022 07:46:33 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 b39sm225226ljr.88.2022.01.21.07.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:46:33 -0800 (PST)
Date: Fri, 21 Jan 2022 16:46:31 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Luc Michel <luc@lmichel.fr>
Subject: Re: [PATCH v6 05/12] hw/dma: Add the DMA control interface
Message-ID: <20220121154631.GB19503@fralle-msi>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
 <20220114152841.1740-6-francisco.iglesias@xilinx.com>
 <20220118220142.mqtbrqht2de773zm@sekoia-pc.home.lmichel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118220142.mqtbrqht2de773zm@sekoia-pc.home.lmichel.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -1012
X-Spam_score: -101.3
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-101.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 alistair23@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Jan 18] Tue 23:01:42, Luc Michel wrote:
> Hi Francisco!
> 
> On 15:28 Fri 14 Jan     , Francisco Iglesias wrote:
> > An option on real hardware when embedding a DMA engine into a peripheral
> > is to make the peripheral control the engine through a custom DMA control
> > (hardware) interface between the two. Software drivers in this scenario
> > configure and trigger DMA operations through the controlling peripheral's
> > register API (for example, writing a specific bit in a register could
> > propagate down to a transfer start signal on the DMA control interface).
> > At the same time the status, results and interrupts for the transfer might
> > still be intended to be read and caught through the DMA engine's register
> > API (and signals).
> 
> I understand the goal you trying to achieve here. Having a generic
> interface between a peripheral and the internal DMA it's using for its
> memory transfers.
> 
> I wonder however how much this scenario can be generalized. I see that
> you have only one method in this interface, which is basically "perform
> a DMA transaction". Given the method's parameters, the peripheral can
> indicate what address/length it wants to read.
> 
> IIUC this is well suited to your case (the OSPI controller), because
> other DMA parameters are configured by other means (DMA or OSPI
> registers I guess).
> 
> But how much this will suite the next use case for this interface? Will
> the embedded DMA be configured the same way? Maybe the method will also
> require e.g., the destination buffer address?
> 
> My feeling is that this interface is quite ad-hoc for your case. It is
> either going to stay really simple as it is now, and won't necessarily
> fit the next similar use case, or is going to get pretty complicated to
> cover all cases. For an added value I'm not sure I can see because the
> pair "peripheral - DMA" seems tightly coupled to me. Do you foresee a
> case where you want to be able to e.g., instantiate DMA B instead of DMA
> A for the same controller?
> 
> I think you could have basically the same code by having a pointer to
> your XlnxCSUDMA object (instead of the iface) in the OSPI struct, and a
> function like xlnx_csu_dma_start_transfer declared in xlnx_csu_dma.h,
> having the same behaviour as dma_ctrl_if_read.
> 

Hi Luc,

> Maybe I'm wrong and you actually foresee cases where the genericity this
> interface gives is what you want? What do you think?

I see your point! Lets go with what you proposed above instead then! v7 will
have taken that direction!

Thank you again for reviewing!

Best regards,
Francisco Iglesias

> 
> Luc
> 
> > 
> > This patch adds a QEMU DMA control interface that can be used for
> > modelling above scenario. Through this new interface a peripheral model
> > embedding a DMA engine model will be able to directly initiate transfers
> > through the DMA. At the same time the transfer state, result and
> > completion signaling will be read and caught through the DMA engine
> > model's register API and signaling.
> > 
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > ---
> >  hw/dma/dma-ctrl-if.c         | 30 +++++++++++++++++++++++
> >  hw/dma/meson.build           |  1 +
> >  include/hw/dma/dma-ctrl-if.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 89 insertions(+)
> >  create mode 100644 hw/dma/dma-ctrl-if.c
> >  create mode 100644 include/hw/dma/dma-ctrl-if.h
> > 
> > diff --git a/hw/dma/dma-ctrl-if.c b/hw/dma/dma-ctrl-if.c
> > new file mode 100644
> > index 0000000000..895edac277
> > --- /dev/null
> > +++ b/hw/dma/dma-ctrl-if.c
> > @@ -0,0 +1,30 @@
> > +/*
> > + * DMA control interface.
> > + *
> > + * Copyright (c) 2021 Xilinx Inc.
> > + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +#include "qemu/osdep.h"
> > +#include "exec/hwaddr.h"
> > +#include "hw/dma/dma-ctrl-if.h"
> > +
> > +MemTxResult dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len)
> > +{
> > +    DmaCtrlIfClass *dcic =  DMA_CTRL_IF_GET_CLASS(dma);
> > +    return dcic->read(dma, addr, len);
> > +}
> > +
> > +static const TypeInfo dma_ctrl_if_info = {
> > +    .name          = TYPE_DMA_CTRL_IF,
> > +    .parent        = TYPE_INTERFACE,
> > +    .class_size = sizeof(DmaCtrlIfClass),
> > +};
> > +
> > +static void dma_ctrl_if_register_types(void)
> > +{
> > +    type_register_static(&dma_ctrl_if_info);
> > +}
> > +
> > +type_init(dma_ctrl_if_register_types)
> > diff --git a/hw/dma/meson.build b/hw/dma/meson.build
> > index f3f0661bc3..c43c067856 100644
> > --- a/hw/dma/meson.build
> > +++ b/hw/dma/meson.build
> > @@ -14,3 +14,4 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
> >  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
> >  softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
> > +common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('dma-ctrl-if.c'))
> > diff --git a/include/hw/dma/dma-ctrl-if.h b/include/hw/dma/dma-ctrl-if.h
> > new file mode 100644
> > index 0000000000..0662149e14
> > --- /dev/null
> > +++ b/include/hw/dma/dma-ctrl-if.h
> > @@ -0,0 +1,58 @@
> > +/*
> > + * DMA control interface.
> > + *
> > + * Copyright (c) 2021 Xilinx Inc.
> > + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +#ifndef HW_DMA_CTRL_IF_H
> > +#define HW_DMA_CTRL_IF_H
> > +
> > +#include "hw/hw.h"
> > +#include "exec/memory.h"
> > +#include "qom/object.h"
> > +
> > +#define TYPE_DMA_CTRL_IF "dma-ctrl-if"
> > +typedef struct DmaCtrlIfClass DmaCtrlIfClass;
> > +DECLARE_CLASS_CHECKERS(DmaCtrlIfClass, DMA_CTRL_IF,
> > +                       TYPE_DMA_CTRL_IF)
> > +
> > +#define DMA_CTRL_IF(obj) \
> > +     INTERFACE_CHECK(DmaCtrlIf, (obj), TYPE_DMA_CTRL_IF)
> > +
> > +typedef struct DmaCtrlIf {
> > +    Object Parent;
> > +} DmaCtrlIf;
> > +
> > +typedef struct DmaCtrlIfClass {
> > +    InterfaceClass parent;
> > +
> > +    /*
> > +     * read: Start a read transfer on the DMA engine implementing the DMA
> > +     * control interface
> > +     *
> > +     * @dma_ctrl: the DMA engine implementing this interface
> > +     * @addr: the address to read
> > +     * @len: the number of bytes to read at 'addr'
> > +     *
> > +     * @return a MemTxResult indicating whether the operation succeeded ('len'
> > +     * bytes were read) or failed.
> > +     */
> > +    MemTxResult (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
> > +} DmaCtrlIfClass;
> > +
> > +/*
> > + * Start a read transfer on a DMA engine implementing the DMA control
> > + * interface.
> > + *
> > + * @dma_ctrl: the DMA engine implementing this interface
> > + * @addr: the address to read
> > + * @len: the number of bytes to read at 'addr'
> > + *
> > + * @return a MemTxResult indicating whether the operation succeeded ('len'
> > + * bytes were read) or failed.
> > + */
> > +MemTxResult dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
> > +
> > +#endif /* HW_DMA_CTRL_IF_H */
> > -- 
> > 2.11.0
> > 
> > 
> 
> -- 

