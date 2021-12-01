Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197354651EF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:43:55 +0100 (CET)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRlx-0005Ks-MZ
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1msRii-0003C6-J2
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:32 -0500
Received: from [2a00:1450:4864:20::22f] (port=41775
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1msRif-0008I4-6D
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:32 -0500
Received: by mail-lj1-x22f.google.com with SMTP id d11so48966181ljg.8
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 07:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9/vj/6dC6MdS0PoIUYxVSDftGsftYM/+3CN3L2issUY=;
 b=l2kG22A1hEiH6DC8fUBk3fWC3v0FudV2N6kPE2N52yNJ8pycYaeOS6VPmypt5KCort
 AhgC7JMBmNTHl2r4VkzCfUg1c0Pe+5/mazxX7Y4soQDRahJ8ZAiwMKL0BehEdaFfTUP5
 9xfqIawDIUgecEg8tzCvZkbbm4vmbG+tLpSCeFUqbstIWGj9U5x4Rxq8mAsqe7cPT9sG
 nkDpRYFKKdtCtQLbjG+Iwv5fr2u3BAh8EsETnCz7spKTBv6qvtTSYz6qINiqCo86080O
 7al4l97trPARWg17Aly1Y572CuS2h3Dnt41yXxM616ZUvxhuSupenzBQTheSfLiAVqRF
 LYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9/vj/6dC6MdS0PoIUYxVSDftGsftYM/+3CN3L2issUY=;
 b=drBlbwhBbAKTjHuTHqEae0lA1kPVZinInXOWWn+2GiODII29nn9Oe5MIumNrqwFgk3
 r9jf2UyBv/pDL2Xa5Mptctm/TzkoTrg8VI4jzEveGg3NW3jAkcGR4mD4f56FUUkZQAGO
 joCkvZGb8ptP0Dus87kGfsCpcIm8K/A4DhlM8Bli29+krX8IRWi/dXuN2okEzO/uVKoZ
 tMjfHgAXuy/+RRtVBZLJbP29S9lSOfMX040/0nbxjRftLIAR5X2qo0HgYuG5HS0cy2i2
 4RkzRDVXCimekzZKsrF7GWIbDr4geiBLJlp1pZTthyVIIoaoUGfliV7bBAZt2qBOyg+d
 GBnA==
X-Gm-Message-State: AOAM5301ru6K9zAjdxUZjBdC1bUfEDvSx4BjBB4bDmtnmavVOUe5LGB2
 HaAI0WmanqGMzKuQTC8P46Y=
X-Google-Smtp-Source: ABdhPJzEL0j7dKtCOGYtb0ff0YGHl4VGPneiqxw9bPAHBDGmA+t3e3/ow1T5/e3faoEUcoo3FJX/2A==
X-Received: by 2002:a2e:5712:: with SMTP id l18mr6063535ljb.268.1638373214638; 
 Wed, 01 Dec 2021 07:40:14 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 o17sm19106lfn.50.2021.12.01.07.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:40:14 -0800 (PST)
Date: Wed, 1 Dec 2021 16:40:12 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 04/10] hw/dma: Add the DMA control interface
Message-ID: <20211201154012.GA17765@fralle-msi>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
 <20211124101555.1410-5-francisco.iglesias@xilinx.com>
 <CAFEAcA-=rEj586ogRYCDGBM-c+DSph3FMcMwFkF1RDm_kSRoKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-=rEj586ogRYCDGBM-c+DSph3FMcMwFkF1RDm_kSRoKQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22f.google.com
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
Cc: edgar.iglesias@xilinx.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2021 Nov 29] Mon 17:44:37, Peter Maydell wrote:
> On Wed, 24 Nov 2021 at 10:16, Francisco Iglesias
> <francisco.iglesias@xilinx.com> wrote:
> >
> > Add an interface for controlling DMA models that are reused with other
> > models. This allows a controlling model to start transfers through the
> > DMA while reusing the DMA's handling of transfer state and completion
> > signaling.
> >
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 
> Could you give an expanded sketch of the design here, please?
> What sort of objects would implement this new interface? Who
> calls it? Should all new DMA engine devices consider implementing it?
> 
> If it's likely to be widely useful we should consider having
> documentation under docs/devel for the API.

Hi Peter,

Thank you very much for reviewing! I think (and hope) that I got all the
updates in the (next version) v4!

About the questions above, I added a patch in v4 with documentation under
docs/devel that hopefully helps clarifying the picture (I've pasted the
begining below aswell for easy access!). The short answer is that the
interface is useful when DMA engines are embedded and part of other
models that also expect to be able to directly initiate transfers (through
the embedded DMA engine), transfers that on HW would have been initiated
through a custom HW DMA control interface.

Thank you again!

Best regards,
Francisco


--- [From new docs/devel/dma-ctrl-if.rst in v4] ---

DMA control interface
=====================

About the DMA control interface
-------------------------------

DMA engines embedded in peripherals can end up being controlled in
different ways on real hardware. One possible way is to allow software
drivers to access the DMA engine's register API and to allow the drivers
to configure and control DMA transfers through the API. A model of a DMA
engine in QEMU that is embedded and (re)used in this manner does not need
to implement the DMA control interface.

Another option on real hardware is to allow the peripheral embedding the
DMA engine to control the engine through a custom hardware DMA control
interface between the two. Software drivers in this scenario configure and
trigger DMA operations through the controlling peripheral's register API
(for example could writing a specific bit in a register propagate down to
a transfer start signal on the DMA control interface). At the same time
the status, result and interrupts for the transfer might still be intended
to be read and catched through the DMA engine's register API (and
signals).

::

    Hardware example
                   +------------+
                   |            |
                   | Peripheral |
                   |            |
                   +------------+
                        /\
                        ||   DMA control IF (custom)
                        \/
                   +------------+
                   | Peripheral |
                   |    DMA     |
                   +------------+

Figure 1. A peripheral controlling it's embedded DMA engine through a
custom DMA control interface

Above scenario can be modelled in QEMU by implementing this DMA control
interface in the DMA engine model. This will allow a peripheral embedding
the DMA engine to initiate DMA transfers through the engine using the
interface. At the same time the status, result and interrupts for the
transfer can be read and catched through the DMA engine's register API and
signals. An example implementation and usage of the DMA control interface
can be found in the Xilinx CSU DMA model and Xilinx Versal's OSPI model.

::

    Memory address
    (register API)
      0xf1010000   +---------+
                   |         |
                   | Versal  |
                   |  OSPI   |
                   |         |
                   +---------+
                       /\
                       ||  DMA control IF
                       \/
      0xf1011000   +---------+
                   |         |
                   | CSU DMA |
                   |  (src)  |
                   |         |
                   +---------+

Figure 2. Xilinx Versal's OSPI controls and initiates transfers on it's
CSU source DMA through a DMA control interface

> 
> > ---
> >  hw/dma/dma-ctrl.c         | 31 ++++++++++++++++++++
> >  hw/dma/meson.build        |  1 +
> >  include/hw/dma/dma-ctrl.h | 74 +++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 106 insertions(+)
> >  create mode 100644 hw/dma/dma-ctrl.c
> >  create mode 100644 include/hw/dma/dma-ctrl.h
> >
> > diff --git a/hw/dma/dma-ctrl.c b/hw/dma/dma-ctrl.c
> > new file mode 100644
> > index 0000000000..4a9b68dac1
> > --- /dev/null
> > +++ b/hw/dma/dma-ctrl.c
> > @@ -0,0 +1,31 @@
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
> > +#include "hw/dma/dma-ctrl.h"
> > +
> > +void dma_ctrl_read_with_notify(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> > +                               DmaCtrlNotify *notify, bool start_dma)
> > +{
> > +    DmaCtrlClass *dcc =  DMA_CTRL_GET_CLASS(dma_ctrl);
> > +    dcc->read(dma_ctrl, addr, len, notify, start_dma);
> > +}
> > +
> > +static const TypeInfo dma_ctrl_info = {
> > +    .name          = TYPE_DMA_CTRL,
> > +    .parent        = TYPE_INTERFACE,
> > +    .class_size = sizeof(DmaCtrlClass),
> > +};
> > +
> > +static void dma_ctrl_register_types(void)
> > +{
> > +    type_register_static(&dma_ctrl_info);
> > +}
> > +
> > +type_init(dma_ctrl_register_types)
> > diff --git a/hw/dma/meson.build b/hw/dma/meson.build
> > index f3f0661bc3..c0bc134046 100644
> > --- a/hw/dma/meson.build
> > +++ b/hw/dma/meson.build
> > @@ -14,3 +14,4 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
> >  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
> >  softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
> > +common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('dma-ctrl.c'))
> > diff --git a/include/hw/dma/dma-ctrl.h b/include/hw/dma/dma-ctrl.h
> > new file mode 100644
> > index 0000000000..498469395f
> > --- /dev/null
> > +++ b/include/hw/dma/dma-ctrl.h
> > @@ -0,0 +1,74 @@
> > +/*
> > + * DMA control interface.
> > + *
> > + * Copyright (c) 2021 Xilinx Inc.
> > + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +#ifndef HW_DMA_CTRL_H
> > +#define HW_DMA_CTRL_H
> > +
> > +#include "qemu-common.h"
> 
> Header files should not include qemu-common.h; the comment at the
> top explains:
> 
> /*
>  * This file is supposed to be included only by .c files. No header file should
>  * depend on qemu-common.h, as this would easily lead to circular header
>  * dependencies.
>  *
>  * If a header file uses a definition from qemu-common.h, that definition
>  * must be moved to a separate header file, and the header that uses it
>  * must include that header.
>  */
> 
> > +#include "hw/hw.h"
> > +#include "qom/object.h"
> > +
> > +#define TYPE_DMA_CTRL "dma-ctrl"
> > +
> > +#define DMA_CTRL_CLASS(klass) \
> > +     OBJECT_CLASS_CHECK(DmaCtrlClass, (klass), TYPE_DMA_CTRL)
> > +#define DMA_CTRL_GET_CLASS(obj) \
> > +    OBJECT_GET_CLASS(DmaCtrlClass, (obj), TYPE_DMA_CTRL)
> 
> Use the DECLARE_CLASS_CHECKERS macro rather than hand-writing these.
> 
> > +#define DMA_CTRL(obj) \
> > +     INTERFACE_CHECK(DmaCtrl, (obj), TYPE_DMA_CTRL)
> > +
> > +typedef void (*dmactrl_notify_fn)(void *opaque);
> > +
> > +typedef struct DmaCtrlNotify {
> > +    void *opaque;
> > +    dmactrl_notify_fn cb;
> > +} DmaCtrlNotify;
> > +
> > +typedef struct DmaCtrl {
> > +    Object Parent;
> > +} DmaCtrl;
> > +
> > +typedef struct DmaCtrlClass {
> 
> Can you include either "If" or "Interface" in the class/struct names
> of interfaces, please? (We have examples of both, eg ArmLinuxBootIf
> and IDAUInterface.) I think it makes it clearer that this is an interface
> and not a real object.
> 
> > +    InterfaceClass parent;
> > +
> > +    /*
> > +     * read: Start a read transfer on the DMA implementing the DMA control
> > +     * interface
> > +     *
> > +     * @dma_ctrl: the DMA implementing this interface
> > +     * @addr: the address to read
> > +     * @len: the amount of bytes to read at 'addr'
> > +     * @notify: the structure containg a callback to call and opaque pointer
> > +     * to pass the callback when the transfer has been completed
> > +     * @start_dma: true for starting the DMA transfer and false for just
> > +     * refilling and proceding an already started transfer
> > +     */
> > +    void (*read)(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> > +                 DmaCtrlNotify *notify, bool start_dma);
> > +} DmaCtrlClass;
> > +
> > +/*
> > + * Start a read transfer on a DMA implementing the DMA control interface.
> > + * The DMA will notify the caller that 'len' bytes have been read at 'addr'
> > + * through the callback in the DmaCtrlNotify structure. For allowing refilling
> > + * an already started transfer the DMA notifies the caller before considering
> > + * the transfer done (e.g. before setting done flags, generating IRQs and
> > + * modifying other relevant internal device state).
> > + *
> > + * @dma_ctrl: the DMA implementing this interface
> > + * @addr: the address to read
> > + * @len: the amount of bytes to read at 'addr'
> > + * @notify: the structure containing a callback to call and opaque pointer
> > + * to pass the callback when the transfer has been completed
> > + * @start_dma: true for starting the DMA transfer and false for just
> > + * refilling and proceding an already started transfer
> > + */
> > +void dma_ctrl_read_with_notify(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> > +                   DmaCtrlNotify *notify, bool start_dma);
> > +
> > +#endif /* HW_DMA_CTRL_H */
> > --
> > 2.11.0
> 
> thanks
> -- PMM

