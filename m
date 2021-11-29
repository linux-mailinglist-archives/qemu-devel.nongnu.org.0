Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17081461CF8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:47:21 +0100 (CET)
Received: from localhost ([::1]:38788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkkJ-0008W3-Vg
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:47:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrkhy-0007Cv-Nv
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:44:54 -0500
Received: from [2a00:1450:4864:20::430] (port=47081
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrkhu-0005MV-NF
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:44:52 -0500
Received: by mail-wr1-x430.google.com with SMTP id u1so38535750wru.13
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3ySamt43mQgLRDFB8ytVt4xXVEmjEbtFv395zrjri0=;
 b=HSvbkXUwDos1mwQUv/LTRVKqcYoRjjybs3SgNth0vuuOLc5uf8OOfbhGm0Bw05T+8p
 iJ551iWeHqc8jibUYf8W/cO8DnhxP70MW/bkgspTmQsno/RadyDfGxwz6VhDwIVJGJut
 yJ8lE3wqMok/DBzwianktYdHW1BeF5PnVgeZlCaQHJvNowDYhNOHfZ6IS6VpKROR+Ryt
 i7Y5UaSfhOBEKDuwHCb1xTuF4U0ZHbdLQ9UZnVUz8PPViIaecKPA2nonvdO2PXMJ6Dt5
 e2QckTnfKxU/qFy58HBKv7/A32sCW3YVvw4mDn0DBFiJKksJ8Bsc9n/u4YyuLFto2ICd
 dyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3ySamt43mQgLRDFB8ytVt4xXVEmjEbtFv395zrjri0=;
 b=jXXgRiod/Y4Nf8Xx92moCa0IDWVqTBAYHpDr4TYt9val4GF02Su9Ts7Gzx80yP2p8B
 fXWFYpkVfolcyTXlf/tHZ33u9Qepe87MrIul3nR/psJsJ79wqHLk1GVnFShxJxU+M8Sa
 +AJkO3/egZJJyLnnhcTAAkN1z8sSOVYsiUIIW/RqE1MP7Vm47i2Gl/tldQe0dw2xmTow
 U4Ph2NiQ4jH/+VGM+2U3k4+yOvgQfpOTMG4zTo8OatyJnmkGbmexmZyhxMLNN6/snfOW
 DQeycVDNhiHonI26R3hklnz2maBIdfJm7p2ZP5+JlqViEODEqp5gVrb8Qffao+P/ZEk5
 UFDQ==
X-Gm-Message-State: AOAM5305e6fCrjyo0je2y6+QVVC3uEblzbb4WvMCRMFokgRaO0BheMIg
 /c28nk6mGL/LRVfLbZHuEaF/dA6/7OepvUOAaG/3iGHGnvw=
X-Google-Smtp-Source: ABdhPJwNbX+A8l9dcpudhJjJJ+41rsyytl2mKStpkPcLd05FrUBHYDqgcI1KzsH6burtacL2OBy2KOHUeyriu34IZmQ=
X-Received: by 2002:adf:ef42:: with SMTP id c2mr34634375wrp.528.1638207889063; 
 Mon, 29 Nov 2021 09:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
 <20211124101555.1410-5-francisco.iglesias@xilinx.com>
In-Reply-To: <20211124101555.1410-5-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 17:44:37 +0000
Message-ID: <CAFEAcA-=rEj586ogRYCDGBM-c+DSph3FMcMwFkF1RDm_kSRoKQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] hw/dma: Add the DMA control interface
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021 at 10:16, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Add an interface for controlling DMA models that are reused with other
> models. This allows a controlling model to start transfers through the
> DMA while reusing the DMA's handling of transfer state and completion
> signaling.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Could you give an expanded sketch of the design here, please?
What sort of objects would implement this new interface? Who
calls it? Should all new DMA engine devices consider implementing it?

If it's likely to be widely useful we should consider having
documentation under docs/devel for the API.

> ---
>  hw/dma/dma-ctrl.c         | 31 ++++++++++++++++++++
>  hw/dma/meson.build        |  1 +
>  include/hw/dma/dma-ctrl.h | 74 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 hw/dma/dma-ctrl.c
>  create mode 100644 include/hw/dma/dma-ctrl.h
>
> diff --git a/hw/dma/dma-ctrl.c b/hw/dma/dma-ctrl.c
> new file mode 100644
> index 0000000000..4a9b68dac1
> --- /dev/null
> +++ b/hw/dma/dma-ctrl.c
> @@ -0,0 +1,31 @@
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
> +#include "hw/dma/dma-ctrl.h"
> +
> +void dma_ctrl_read_with_notify(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> +                               DmaCtrlNotify *notify, bool start_dma)
> +{
> +    DmaCtrlClass *dcc =  DMA_CTRL_GET_CLASS(dma_ctrl);
> +    dcc->read(dma_ctrl, addr, len, notify, start_dma);
> +}
> +
> +static const TypeInfo dma_ctrl_info = {
> +    .name          = TYPE_DMA_CTRL,
> +    .parent        = TYPE_INTERFACE,
> +    .class_size = sizeof(DmaCtrlClass),
> +};
> +
> +static void dma_ctrl_register_types(void)
> +{
> +    type_register_static(&dma_ctrl_info);
> +}
> +
> +type_init(dma_ctrl_register_types)
> diff --git a/hw/dma/meson.build b/hw/dma/meson.build
> index f3f0661bc3..c0bc134046 100644
> --- a/hw/dma/meson.build
> +++ b/hw/dma/meson.build
> @@ -14,3 +14,4 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
> +common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('dma-ctrl.c'))
> diff --git a/include/hw/dma/dma-ctrl.h b/include/hw/dma/dma-ctrl.h
> new file mode 100644
> index 0000000000..498469395f
> --- /dev/null
> +++ b/include/hw/dma/dma-ctrl.h
> @@ -0,0 +1,74 @@
> +/*
> + * DMA control interface.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_DMA_CTRL_H
> +#define HW_DMA_CTRL_H
> +
> +#include "qemu-common.h"

Header files should not include qemu-common.h; the comment at the
top explains:

/*
 * This file is supposed to be included only by .c files. No header file should
 * depend on qemu-common.h, as this would easily lead to circular header
 * dependencies.
 *
 * If a header file uses a definition from qemu-common.h, that definition
 * must be moved to a separate header file, and the header that uses it
 * must include that header.
 */

> +#include "hw/hw.h"
> +#include "qom/object.h"
> +
> +#define TYPE_DMA_CTRL "dma-ctrl"
> +
> +#define DMA_CTRL_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(DmaCtrlClass, (klass), TYPE_DMA_CTRL)
> +#define DMA_CTRL_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(DmaCtrlClass, (obj), TYPE_DMA_CTRL)

Use the DECLARE_CLASS_CHECKERS macro rather than hand-writing these.

> +#define DMA_CTRL(obj) \
> +     INTERFACE_CHECK(DmaCtrl, (obj), TYPE_DMA_CTRL)
> +
> +typedef void (*dmactrl_notify_fn)(void *opaque);
> +
> +typedef struct DmaCtrlNotify {
> +    void *opaque;
> +    dmactrl_notify_fn cb;
> +} DmaCtrlNotify;
> +
> +typedef struct DmaCtrl {
> +    Object Parent;
> +} DmaCtrl;
> +
> +typedef struct DmaCtrlClass {

Can you include either "If" or "Interface" in the class/struct names
of interfaces, please? (We have examples of both, eg ArmLinuxBootIf
and IDAUInterface.) I think it makes it clearer that this is an interface
and not a real object.

> +    InterfaceClass parent;
> +
> +    /*
> +     * read: Start a read transfer on the DMA implementing the DMA control
> +     * interface
> +     *
> +     * @dma_ctrl: the DMA implementing this interface
> +     * @addr: the address to read
> +     * @len: the amount of bytes to read at 'addr'
> +     * @notify: the structure containg a callback to call and opaque pointer
> +     * to pass the callback when the transfer has been completed
> +     * @start_dma: true for starting the DMA transfer and false for just
> +     * refilling and proceding an already started transfer
> +     */
> +    void (*read)(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> +                 DmaCtrlNotify *notify, bool start_dma);
> +} DmaCtrlClass;
> +
> +/*
> + * Start a read transfer on a DMA implementing the DMA control interface.
> + * The DMA will notify the caller that 'len' bytes have been read at 'addr'
> + * through the callback in the DmaCtrlNotify structure. For allowing refilling
> + * an already started transfer the DMA notifies the caller before considering
> + * the transfer done (e.g. before setting done flags, generating IRQs and
> + * modifying other relevant internal device state).
> + *
> + * @dma_ctrl: the DMA implementing this interface
> + * @addr: the address to read
> + * @len: the amount of bytes to read at 'addr'
> + * @notify: the structure containing a callback to call and opaque pointer
> + * to pass the callback when the transfer has been completed
> + * @start_dma: true for starting the DMA transfer and false for just
> + * refilling and proceding an already started transfer
> + */
> +void dma_ctrl_read_with_notify(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> +                   DmaCtrlNotify *notify, bool start_dma);
> +
> +#endif /* HW_DMA_CTRL_H */
> --
> 2.11.0

thanks
-- PMM

