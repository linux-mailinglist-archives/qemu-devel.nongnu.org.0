Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED2516E2D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 12:33:52 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlTNG-0006gv-J5
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 06:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nlTIu-0004si-JO; Mon, 02 May 2022 06:29:20 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nlTIp-0005yy-S4; Mon, 02 May 2022 06:29:20 -0400
Received: by mail-ed1-x531.google.com with SMTP id d6so16105549ede.8;
 Mon, 02 May 2022 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7NlZo8yu6bk3efxSxxyamlaKPvsQ2OKaJtxmXqavOQ=;
 b=AHzfauCdaIIn/RA8s/25ETZsPz41T/NMy6Gb8KRYXIGAzwK9YN1x33xC6ijX/qfNWB
 unNYwZ8KkJksucfPD8p1ou43Rz/u/iEsj7R/QLTjvuOTL3s6pcA7rDgtUvitd3WJVsFh
 jIvpgY3MT9ucjHYks+DDOiCC+4taKp8ByhGpzXofsfe0Qq9exPTGUECJo2+OPBxIRb2Z
 ohyeV5rWKKtEE/nljxgvBtFV4a12k1VoXw3i5Pl80fRhtc8pqVm9hp7+c08+AxV2EkBg
 biSdmXAkTCTHPp7o5NJyp06A/PTbw8S6OBpOhgry7DEU7RgbmmafJ3arkL42rVECuMJ8
 tw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7NlZo8yu6bk3efxSxxyamlaKPvsQ2OKaJtxmXqavOQ=;
 b=nsOfKWpgxNYQLMTZCyaeJ1T8GbtV21vTEFmA6tg6QTIV3z0wwMRfM6NXaRTKGejDh1
 348dFYkodArezXjsJpRU34ZKD5erkLAA9jApJzFNmows2OiSKmT2pVGoMnWztBYcQBy9
 lqg/yhs0XveZ8qXjTatTDnNfjU6yO4tbINHj0klE5gcGi52LJp53UjpAkZRZlTwT4w0k
 GNMsuQap18rtwJPk15tjMQSSS7mMYkhRseu0G1JYpCB9mvvKgBytINmIM1Xp79EQ0WwM
 /zBr9tYFMKmKVOMerHM0s+93ZsQ/rVnIGT1IDYUrJPgazeENQ/UQef4T4rUG+vj32Z3h
 mG7A==
X-Gm-Message-State: AOAM531+lpGrWXZmeoSp+HKZPWjKn5398VJS5cEGZwe2EQxILxoXtI00
 tqAqSBerUUvcrxhsZ+EXHNea0ycJkuP2k4xGdS8=
X-Google-Smtp-Source: ABdhPJw3ViHSAPM92nR9VAF8dtHHYdY+5ioKeKtJKJJVF6brrnhm0nM5STmNMBChdz6ePei8QHc35mamn4jpv5HlkVg=
X-Received: by 2002:a05:6402:2794:b0:424:a76:2b14 with SMTP id
 b20-20020a056402279400b004240a762b14mr12800138ede.226.1651487353433; Mon, 02
 May 2022 03:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220428154348.26380-1-frank.chang@sifive.com>
In-Reply-To: <20220428154348.26380-1-frank.chang@sifive.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 2 May 2022 12:29:02 +0200
Message-ID: <CAJy5ezp1wdCFzHN4KhTWq7vCcP5DBPjE=V9+kiu4-njpnZ76Mg@mail.gmail.com>
Subject: Re: [PATCH] hw/dma: Add Xilinx AXI CDMA
To: frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000000d720a05de04dd06"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jim Shu <jim.shu@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000d720a05de04dd06
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 5:43 PM <frank.chang@sifive.com> wrote:

> From: Frank Chang <frank.chang@sifive.com>
>
> Add Xilinx AXI CDMA model, which follows
> AXI Central Direct Memory Access v4.1 spec:
> https://docs.xilinx.com/v/u/en-US/pg034-axi-cdma
>
> Supports both Simple DMA and Scatter Gather modes.
>

Hi Frank,

Thanks for modeling this! I have a couple of questions.

Do you plan to submit a machine that uses this DMA?

The CDMA has a 32-bit AXI4-Lite port for register accesses (see page 6 and
8 in the spec you referenced), so axicdma_ops.impl.max should be 4 and you
shouldn't need the read/write q versions.

Best regards,
Edgar



>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/dma/meson.build              |   2 +-
>  hw/dma/xilinx_axicdma.c         | 792 ++++++++++++++++++++++++++++++++
>  include/hw/dma/xilinx_axicdma.h |  72 +++
>  3 files changed, 865 insertions(+), 1 deletion(-)
>  create mode 100644 hw/dma/xilinx_axicdma.c
>  create mode 100644 include/hw/dma/xilinx_axicdma.h
>
> diff --git a/hw/dma/meson.build b/hw/dma/meson.build
> index f3f0661bc3..85edf80b82 100644
> --- a/hw/dma/meson.build
> +++ b/hw/dma/meson.build
> @@ -3,7 +3,7 @@ softmmu_ss.add(when: 'CONFIG_PL080', if_true:
> files('pl080.c'))
>  softmmu_ss.add(when: 'CONFIG_PL330', if_true: files('pl330.c'))
>  softmmu_ss.add(when: 'CONFIG_I82374', if_true: files('i82374.c'))
>  softmmu_ss.add(when: 'CONFIG_I8257', if_true: files('i8257.c'))
> -softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true:
> files('xilinx_axidma.c'))
> +softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true:
> files('xilinx_axidma.c', 'xilinx_axicdma.c'))
>  softmmu_ss.add(when: 'CONFIG_ZYNQ_DEVCFG', if_true:
> files('xlnx-zynq-devcfg.c'))
>  softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
> diff --git a/hw/dma/xilinx_axicdma.c b/hw/dma/xilinx_axicdma.c
> new file mode 100644
> index 0000000000..50aec3ec45
> --- /dev/null
> +++ b/hw/dma/xilinx_axicdma.c
> @@ -0,0 +1,792 @@
> +/*
> + * QEMU model of Xilinx AXI-CDMA block.
> + *
> + * Copyright (c) 2022 Frank Chang <frank.chang@sifive.com>.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/hw.h"
> +#include "hw/irq.h"
> +#include "hw/ptimer.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/timer.h"
> +#include "qom/object.h"
> +#include "sysemu/dma.h"
> +#include "hw/dma/xilinx_axicdma.h"
> +
> +#define R_CDMACR                    0x00
> +#define R_CDMASR                    0x04
> +#define R_CURDESC                   0x08
> +#define R_CURDESC_MSB               0x0c
> +#define R_TAILDESC                  0x10
> +#define R_TAILDESC_MSB              0x14
> +#define R_SA                        0x18
> +#define R_SA_MSB                    0x1c
> +#define R_DA                        0x20
> +#define R_DA_MSB                    0x24
> +#define R_BTT                       0x28
> +
> +#define R_MAX                       0x30
> +
> +/* CDMACR */
> +#define CDMACR_TAIL_PNTR_EN         BIT(1)
> +#define CDMACR_RESET                BIT(2)
> +#define CDMACR_SGMODE               BIT(3)
> +#define CDMACR_KEY_HOLE_READ        BIT(4)
> +#define CDMACR_KEY_HOLE_WRITE       BIT(5)
> +#define CDMACR_CYCLIC_BD_ENABLE     BIT(6)
> +#define CDMACR_IOC_IRQ_EN           BIT(12)
> +#define CDMACR_DLY_IRQ_EN           BIT(13)
> +#define CDMACR_ERR_IRQ_EN           BIT(14)
> +
> +#define CDMACR_MASK                 0xffff707c
> +
> +/* TailPntrEn = 1,  IRQThreshold = 1. */
> +#define CDMACR_DEFAULT              0x10002
> +
> +/* CDMASR */
> +#define CDMASR_IDLE                 BIT(1)
> +#define CDMASR_SG_INCLUD            BIT(3)
> +#define CDMASR_DMA_INT_ERR          BIT(4)
> +#define CDMASR_DMA_SLV_ERR          BIT(5)
> +#define CDMASR_DMA_DEC_ERR          BIT(6)
> +#define CDMASR_SG_INT_ERR           BIT(8)
> +#define CDMASR_SG_SLV_ERR           BIT(9)
> +#define CDMASR_SG_DEC_ERR           BIT(10)
> +#define CDMASR_IOC_IRQ              BIT(12)
> +#define CDMASR_DLY_IRQ              BIT(13)
> +#define CDMASR_ERR_IRQ              BIT(14)
> +
> +#define CDMASR_IRQ_THRES_SHIFT      16
> +#define CDMASR_IRQ_THRES_WIDTH      8
> +#define CDMASR_IRQ_DELAY_SHIFT      24
> +#define CDMASR_IRQ_DELAY_WIDTH      8
> +
> +#define CDMASR_IRQ_MASK             (CDMASR_IOC_IRQ | \
> +                                     CDMASR_DLY_IRQ | \
> +                                     CDMASR_ERR_IRQ)
> +
> +/* Idle = 1, SGIncld = 1, IRQThresholdSts = 1. */
> +#define CDMASR_DEFAULT              0x1000a
> +
> +#define CURDESC_MASK                0xffffffc0
> +
> +#define TAILDESC_MASK               0xffffffc0
> +
> +#define BTT_MAX_SIZE                (1UL << 26)
> +#define BTT_MASK                    (BTT_MAX_SIZE - 1)
> +
> +/* SDesc - Status */
> +#define SDEC_STATUS_DMA_INT_ERR     BIT(28)
> +#define SDEC_STATUS_DMA_SLV_ERR     BIT(29)
> +#define SDEC_STATUS_DMA_DEC_ERR     BIT(30)
> +#define SDEC_STATUS_DMA_CMPLT       BIT(31)
> +
> +
> +static void axicdma_set_dma_err(XilinxAXICDMA *s, uint32_t err);
> +static void axicdma_set_sg_dma_err(XilinxAXICDMA *s, uint32_t err, hwaddr
> addr);
> +static void axicdma_set_sg_err(XilinxAXICDMA *s, uint32_t err);
> +
> +static void axicdma_update_irq(XilinxAXICDMA *s)
> +{
> +    uint32_t enable, pending;
> +
> +    enable = s->control & CDMASR_IRQ_MASK;
> +    pending = s->status & CDMASR_IRQ_MASK;
> +
> +    qemu_set_irq(s->irq, !!(enable & pending));
> +}
> +
> +static void axicdma_set_irq(XilinxAXICDMA *s, uint32_t irq, bool level)
> +{
> +    g_assert(irq == CDMASR_IOC_IRQ ||
> +             irq == CDMASR_DLY_IRQ ||
> +             irq == CDMASR_ERR_IRQ);
> +
> +    if (level) {
> +        s->status |= irq;
> +    } else {
> +        s->status &= ~irq;
> +    }
> +
> +    axicdma_update_irq(s);
> +}
> +
> +static void axicdma_reload_complete_cnt(XilinxAXICDMA *s)
> +{
> +    s->complete_cnt = extract32(s->control, CDMASR_IRQ_THRES_SHIFT,
> +                                CDMASR_IRQ_THRES_WIDTH);
> +}
> +
> +static void timer_hit(void *opaque)
> +{
> +    XilinxAXICDMA *s = XILINX_AXI_CDMA(opaque);
> +
> +    axicdma_set_irq(s, CDMASR_DLY_IRQ, true);
> +    axicdma_reload_complete_cnt(s);
> +}
> +
> +static bool sdesc_load(XilinxAXICDMA *s, hwaddr addr)
> +{
> +    SDesc *d = &s->sdesc;
> +    MemTxResult ret;
> +
> +    ret = address_space_read(s->as, addr, MEMTXATTRS_UNSPECIFIED,
> +                             d, sizeof(SDesc));
> +    if (ret != MEMTX_OK) {
> +        axicdma_set_sg_err(s, CDMASR_SG_DEC_ERR);
> +        return false;
> +    }
> +
> +    /* Convert from LE into host endianness. */
> +    d->nxtdesc = le64_to_cpu(d->nxtdesc);
> +    d->src = le64_to_cpu(d->src);
> +    d->dest = le64_to_cpu(d->dest);
> +    d->control = le32_to_cpu(d->control);
> +    d->status = le32_to_cpu(d->status);
> +
> +    return true;
> +}
> +
> +static bool sdesc_store(XilinxAXICDMA *s, hwaddr addr)
> +{
> +    SDesc *d = &s->sdesc;
> +    MemTxResult ret;
> +
> +    /* Convert from host endianness into LE. */
> +    d->nxtdesc = cpu_to_le64(d->nxtdesc);
> +    d->src = cpu_to_le64(d->src);
> +    d->dest = cpu_to_le64(d->dest);
> +    d->control = cpu_to_le32(d->control);
> +    d->status = cpu_to_le32(d->status);
> +
> +    ret = address_space_write(s->as, addr, MEMTXATTRS_UNSPECIFIED,
> +                              d, sizeof(SDesc));
> +    if (ret != MEMTX_OK) {
> +        axicdma_set_sg_err(s, CDMASR_SG_DEC_ERR);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void sdesc_complete(XilinxAXICDMA *s)
> +{
> +    uint32_t irq_delay = extract32(s->control, CDMASR_IRQ_DELAY_SHIFT,
> +                                   CDMASR_IRQ_DELAY_WIDTH);
> +
> +    if (irq_delay) {
> +        /* Restart the delayed timer. */
> +        ptimer_transaction_begin(s->ptimer);
> +        ptimer_stop(s->ptimer);
> +        ptimer_set_count(s->ptimer, irq_delay);
> +        ptimer_run(s->ptimer, 1);
> +        ptimer_transaction_commit(s->ptimer);
> +    }
> +
> +    s->complete_cnt--;
> +
> +    if (s->complete_cnt == 0) {
> +        /* Raise the IOC irq. */
> +        axicdma_set_irq(s, CDMASR_IOC_IRQ, true);
> +        axicdma_reload_complete_cnt(s);
> +    }
> +}
> +
> +static inline bool axicdma_sgmode(XilinxAXICDMA *s)
> +{
> +    return !!(s->control & CDMACR_SGMODE);
> +}
> +
> +static void axicdma_set_dma_err(XilinxAXICDMA *s, uint32_t err)
> +{
> +    g_assert(err == CDMASR_DMA_INT_ERR ||
> +             err == CDMASR_DMA_SLV_ERR ||
> +             err == CDMASR_DMA_DEC_ERR);
> +
> +    s->status |= err;
> +    axicdma_set_irq(s, CDMASR_ERR_IRQ, true);
> +}
> +
> +static void axicdma_set_sg_dma_err(XilinxAXICDMA *s, uint32_t err, hwaddr
> addr)
> +{
> +    g_assert(axicdma_sgmode(s));
> +
> +    axicdma_set_dma_err(s, err);
> +
> +    /*
> +     * There are 24-bit shift between
> +     * SDesc status bit and CDMACR.DMA_[INT|SLV|DEC]_ERR bit.
> +     */
> +    s->sdesc.status |= (err << 24);
> +    sdesc_store(s, addr);
> +}
> +
> +static void axicdma_set_sg_err(XilinxAXICDMA *s, uint32_t err)
> +{
> +    g_assert(err == CDMASR_SG_INT_ERR ||
> +             err == CDMASR_SG_SLV_ERR ||
> +             err == CDMASR_SG_DEC_ERR);
> +
> +    s->status |= err;
> +    axicdma_set_irq(s, CDMASR_ERR_IRQ, true);
> +}
> +
> +static bool axicdma_perform_dma(XilinxAXICDMA *s, hwaddr src, hwaddr dest,
> +                                uint32_t btt)
> +{
> +    uint32_t r_off = 0, w_off = 0;
> +    uint32_t len;
> +    MemTxResult ret;
> +
> +    while (btt > 0) {
> +        len = MIN(btt, CDMA_BUF_SIZE);
> +
> +        ret = dma_memory_read(s->as, src + r_off, s->buf + r_off, len,
> +                              MEMTXATTRS_UNSPECIFIED);
> +        if (ret != MEMTX_OK) {
> +            return false;
> +        }
> +
> +        ret = dma_memory_write(s->as, dest + w_off, s->buf + w_off, len,
> +                               MEMTXATTRS_UNSPECIFIED);
> +        if (ret != MEMTX_OK) {
> +            return false;
> +        }
> +
> +        btt -= len;
> +
> +        if (!(s->control & CDMACR_KEY_HOLE_READ)) {
> +            r_off += len;
> +        }
> +
> +        if (!(s->control & CDMACR_KEY_HOLE_WRITE)) {
> +            w_off += len;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +static void axicdma_run_simple(XilinxAXICDMA *s)
> +{
> +    if (!s->btt) {
> +        /* Value of zero BTT is not allowed. */
> +        axicdma_set_dma_err(s, CDMASR_DMA_INT_ERR);
> +        return;
> +    }
> +
> +    if (!axicdma_perform_dma(s, s->src, s->dest, s->btt)) {
> +        axicdma_set_dma_err(s, CDMASR_DMA_DEC_ERR);
> +        return;
> +    }
> +
> +    /* Generate IOC interrupt. */
> +    axicdma_set_irq(s, CDMASR_IOC_IRQ, true);
> +}
> +
> +static void axicdma_run_sgmode(XilinxAXICDMA *s)
> +{
> +    uint64_t pdesc;
> +    uint32_t btt;
> +
> +    while (1) {
> +        if (!sdesc_load(s, s->curdesc)) {
> +            break;
> +        }
> +
> +        if (s->sdesc.status & SDEC_STATUS_DMA_CMPLT) {
> +            axicdma_set_sg_err(s, CDMASR_SG_INT_ERR);
> +            break;
> +        }
> +
> +        btt = s->sdesc.control & BTT_MASK;
> +
> +        if (btt == 0) {
> +            /* Value of zero BTT is not allowed. */
> +            axicdma_set_sg_err(s, CDMASR_SG_INT_ERR);
> +            break;
> +        }
> +
> +        if (!axicdma_perform_dma(s, s->sdesc.src, s->sdesc.dest, btt)) {
> +            axicdma_set_sg_dma_err(s, CDMASR_DMA_DEC_ERR, s->curdesc);
> +            break;
> +        }
> +
> +        /* Update the descriptor. */
> +        s->sdesc.status |= SDEC_STATUS_DMA_CMPLT;
> +        sdesc_store(s, s->curdesc);
> +        sdesc_complete(s);
> +
> +        /* Advance current descriptor pointer. */
> +        pdesc = s->curdesc;
> +        s->curdesc = s->sdesc.nxtdesc;
> +
> +        if (!(s->control & CDMACR_CYCLIC_BD_ENABLE) &&
> +            pdesc == s->taildesc) {
> +            /* Reach the tail descriptor. */
> +            break;
> +        }
> +    }
> +
> +    /* Stop the delayed timer. */
> +    ptimer_transaction_begin(s->ptimer);
> +    ptimer_stop(s->ptimer);
> +    ptimer_transaction_commit(s->ptimer);
> +}
> +
> +static void axicdma_run(XilinxAXICDMA *s)
> +{
> +    bool sgmode = axicdma_sgmode(s);
> +
> +    /* Not idle. */
> +    s->status &= ~CDMASR_IDLE;
> +
> +    if (!sgmode) {
> +        axicdma_run_simple(s);
> +    } else {
> +        axicdma_run_sgmode(s);
> +    }
> +
> +    /* Idle. */
> +    s->status |= CDMASR_IDLE;
> +}
> +
> +static void axicdma_reset(XilinxAXICDMA *s)
> +{
> +    s->control = CDMACR_DEFAULT;
> +    s->status = CDMASR_DEFAULT;
> +    s->complete_cnt = 1;
> +    qemu_irq_lower(s->irq);
> +}
> +
> +static void axicdma_write_control(XilinxAXICDMA *s, uint32_t value)
> +{
> +    if (value & CDMACR_RESET) {
> +        axicdma_reset(s);
> +        return;
> +    }
> +
> +    /*
> +     * The minimum setting for the threshold is 0x01.
> +     * A write of 0x00 to CDMACR.IRQThreshold has no effect.
> +     */
> +    if (!extract32(value, CDMASR_IRQ_THRES_SHIFT,
> CDMASR_IRQ_THRES_WIDTH)) {
> +        value = deposit32(value, CDMASR_IRQ_THRES_SHIFT,
> CDMASR_IRQ_THRES_WIDTH,
> +                          s->control);
> +    }
> +
> +    /*
> +     * AXI CDMA is built with SG enabled,
> +     * tail pointer mode is always enabled.
> +     */
> +    s->control = (value & CDMACR_MASK) | CDMACR_TAIL_PNTR_EN;
> +
> +    if (!axicdma_sgmode(s)) {
> +        /*
> +         * CDMASR.Dly_Irq, CURDESC_PNTR, TAILDESC_PNTR are cleared
> +         * when not in SGMode.
> +         */
> +        s->status &= ~CDMASR_DLY_IRQ;
> +        s->curdesc = 0;
> +        s->taildesc = 0;
> +    }
> +
> +    axicdma_reload_complete_cnt(s);
> +}
> +
> +static uint32_t axicdma_read_status(XilinxAXICDMA *s)
> +{
> +    uint32_t value = s->status;
> +
> +    value = deposit32(value, CDMASR_IRQ_THRES_SHIFT,
> +                      CDMASR_IRQ_THRES_WIDTH, s->complete_cnt);
> +    value = deposit32(value, CDMASR_IRQ_DELAY_SHIFT,
> +                      CDMASR_IRQ_DELAY_WIDTH,
> ptimer_get_count(s->ptimer));
> +
> +    return value;
> +}
> +
> +static void axicdma_write_status(XilinxAXICDMA *s, uint32_t value)
> +{
> +    /* Write 1s to clear interrupts. */
> +    s->status &= ~(value & CDMASR_IRQ_MASK);
> +    axicdma_update_irq(s);
> +}
> +
> +static void axicdma_write_curdesc(XilinxAXICDMA *s, uint64_t value)
> +{
> +    /* Should be idle. */
> +    g_assert(s->status & CDMASR_IDLE);
> +
> +    if (!axicdma_sgmode(s)) {
> +        /* This register is cleared if SGMode = 0. */
> +        return;
> +    }
> +
> +    s->curdesc = value & CURDESC_MASK;
> +}
> +
> +static void axicdma_write_taildesc(XilinxAXICDMA *s, uint64_t value)
> +{
> +    /* Should be idle. */
> +    g_assert(s->status & CDMASR_IDLE);
> +
> +    if (!axicdma_sgmode(s)) {
> +        /* This register is cleared if SGMode = 0. */
> +        return;
> +    }
> +
> +    s->taildesc = value & TAILDESC_MASK;
> +
> +    /* Kick-off CDMA. */
> +    axicdma_run(s);
> +}
> +
> +static void axicdma_write_btt(XilinxAXICDMA *s, uint64_t value)
> +{
> +    s->btt = value & BTT_MASK;
> +
> +    if (!axicdma_sgmode(s)) {
> +        /* Kick-off CDMA. */
> +        axicdma_run(s);
> +    }
> +}
> +
> +static uint32_t axicdma_readl(void *opaque, hwaddr addr, unsigned size)
> +{
> +    XilinxAXICDMA *s = opaque;
> +    uint32_t value = 0;
> +
> +    if (s->addrwidth <= 32) {
> +        switch (addr) {
> +        case R_CURDESC_MSB:
> +        case R_TAILDESC_MSB:
> +        case R_SA_MSB:
> +        case R_DA_MSB:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Invalid 32-bit read to 0x%" HWADDR_PRIX
> "\n",
> +                          __func__, addr);
> +            return value;
> +        }
> +    }
> +
> +    switch (addr) {
> +    case R_CDMACR:
> +        value = s->control;
> +        break;
> +    case R_CDMASR:
> +        value = axicdma_read_status(s);
> +        break;
> +    case R_CURDESC:
> +        value = s->curdesc;
> +        break;
> +    case R_CURDESC_MSB:
> +        value = extract64(s->curdesc, 32, 32);
> +        break;
> +    case R_TAILDESC:
> +        value = s->taildesc;
> +        break;
> +    case R_TAILDESC_MSB:
> +        value = extract64(s->taildesc, 32, 32);
> +        break;
> +    case R_SA:
> +        value = s->src;
> +        break;
> +    case R_SA_MSB:
> +        value = extract64(s->src, 32, 32);
> +        break;
> +    case R_DA:
> +        value = s->dest;
> +        break;
> +    case R_DA_MSB:
> +        value = extract64(s->dest, 32, 32);
> +        break;
> +    case R_BTT:
> +        value = s->btt;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid 32-bit read to 0x%" HWADDR_PRIX "\n",
> +                      __func__, addr);
> +    }
> +
> +    return value;
> +}
> +
> +static uint32_t axicdma_readq(void *opaque, hwaddr addr, unsigned size)
> +{
> +    XilinxAXICDMA *s = opaque;
> +    uint64_t value = 0;
> +
> +    switch (addr) {
> +    case R_CDMACR:
> +        value = s->control;
> +        break;
> +    case R_CDMASR:
> +        value = axicdma_read_status(s);
> +        break;
> +    case R_CURDESC:
> +        value = s->curdesc;
> +        break;
> +    case R_TAILDESC:
> +        value = s->taildesc;
> +        break;
> +    case R_SA:
> +        value = s->src;
> +        break;
> +    case R_DA:
> +        value = s->dest;
> +        break;
> +    case R_BTT:
> +        value = s->btt;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid 64-bit read to 0x%" HWADDR_PRIX "\n",
> +                      __func__, addr);
> +    }
> +
> +    return value;
> +}
> +
> +static uint64_t axicdma_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    uint64_t value = 0;
> +
> +    switch (size) {
> +    case 4:
> +        value = axicdma_readl(opaque, addr, size);
> +        break;
> +    case 8:
> +        value = axicdma_readq(opaque, addr, size);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid read size %u to
> AXI-CDMA\n",
> +                      __func__, size);
> +    }
> +
> +    return value;
> +}
> +
> +static void axicdma_writel(void *opaque, hwaddr addr, uint32_t value,
> +                           unsigned size)
> +{
> +    XilinxAXICDMA *s = opaque;
> +
> +    if (s->addrwidth <= 32) {
> +        switch (addr) {
> +        case R_CURDESC_MSB:
> +        case R_TAILDESC_MSB:
> +        case R_SA_MSB:
> +        case R_DA_MSB:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Invalid 32-bit write to 0x%" HWADDR_PRIX
> "\n",
> +                          __func__, addr);
> +            return;
> +        }
> +    }
> +
> +    switch (addr) {
> +    case R_CDMACR:
> +        axicdma_write_control(s, value);
> +        break;
> +    case R_CDMASR:
> +        axicdma_write_status(s, value);
> +        break;
> +    case R_CURDESC:
> +        axicdma_write_curdesc(s, deposit64(s->curdesc, 0, 32, value));
> +        break;
> +    case R_CURDESC_MSB:
> +        axicdma_write_curdesc(s, deposit64(s->curdesc, 32, 32, value));
> +        break;
> +    case R_TAILDESC:
> +        axicdma_write_taildesc(s, deposit64(s->taildesc, 0, 32, value));
> +        break;
> +    case R_TAILDESC_MSB:
> +        axicdma_write_taildesc(s, deposit64(s->taildesc, 32, 32, value));
> +        break;
> +    case R_SA:
> +        s->src = deposit64(s->src, 0, 32, value);
> +        break;
> +    case R_SA_MSB:
> +        s->src = deposit64(s->src, 32, 32, value);
> +        break;
> +    case R_DA:
> +        s->dest = deposit64(s->dest, 0, 32, value);
> +        break;
> +    case R_DA_MSB:
> +        s->dest = deposit64(s->dest, 32, 32, value);
> +        break;
> +    case R_BTT:
> +        axicdma_write_btt(s, value);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid 32-bit write to 0x%" HWADDR_PRIX "\n",
> +                      __func__, addr);
> +    }
> +}
> +
> +static void axicdma_writeq(void *opaque, hwaddr addr, uint64_t value,
> +                           unsigned size)
> +{
> +    XilinxAXICDMA *s = opaque;
> +
> +    switch (addr) {
> +    case R_CDMACR:
> +        axicdma_write_control(s, value);
> +        break;
> +    case R_CDMASR:
> +        axicdma_write_status(s, value);
> +        break;
> +    case R_CURDESC:
> +        axicdma_write_curdesc(s, value);
> +        break;
> +    case R_TAILDESC:
> +        axicdma_write_taildesc(s, value);
> +        break;
> +    case R_SA:
> +        s->src = value;
> +        break;
> +    case R_DA:
> +        s->dest = value;
> +        break;
> +    case R_BTT:
> +        axicdma_write_btt(s, value);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid 64-bit write to 0x%" HWADDR_PRIX "\n",
> +                      __func__, addr);
> +    }
> +}
> +
> +static void axicdma_write(void *opaque, hwaddr addr,
> +                          uint64_t value, unsigned size)
> +{
> +    switch (size) {
> +    case 4:
> +        axicdma_writel(opaque, addr, value, size);
> +        break;
> +    case 8:
> +        axicdma_writeq(opaque, addr, value, size);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid write size %u to AXI-CDMA\n",
> +                      __func__, size);
> +    }
> +}
> +
> +static const MemoryRegionOps axicdma_ops = {
> +    .read = axicdma_read,
> +    .write = axicdma_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8
> +    },
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +};
> +
> +static void xilinx_axicdma_realize(DeviceState *dev, Error **errp)
> +{
> +    XilinxAXICDMA *s = XILINX_AXI_CDMA(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(dev), &axicdma_ops, s,
> +                          TYPE_XILINX_AXI_CDMA, R_MAX);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +    sysbus_init_irq(sbd, &s->irq);
> +
> +    if (!s->dma_mr || s->dma_mr == get_system_memory()) {
> +        /* Avoid creating new AddressSpace for system memory. */
> +        s->as = &address_space_memory;
> +    } else {
> +        s->as = g_new0(AddressSpace, 1);
> +        address_space_init(s->as, s->dma_mr,
> memory_region_name(s->dma_mr));
> +    }
> +
> +    s->ptimer = ptimer_init(timer_hit, s, PTIMER_POLICY_DEFAULT);
> +    ptimer_transaction_begin(s->ptimer);
> +    ptimer_set_freq(s->ptimer, s->freqhz);
> +    ptimer_transaction_commit(s->ptimer);
> +}
> +
> +static void xilinx_axicdma_unrealize(DeviceState *dev)
> +{
> +    XilinxAXICDMA *s = XILINX_AXI_CDMA(dev);
> +
> +    if (s->ptimer) {
> +        ptimer_free(s->ptimer);
> +    }
> +
> +    if (s->as && s->dma_mr != get_system_memory()) {
> +        g_free(s->as);
> +    }
> +}
> +
> +static Property axicdma_properties[] = {
> +    DEFINE_PROP_UINT32("freqhz", XilinxAXICDMA, freqhz, 50000000),
> +    DEFINE_PROP_INT32("addrwidth", XilinxAXICDMA, addrwidth, 64),
> +    DEFINE_PROP_LINK("dma", XilinxAXICDMA, dma_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void xilinx_axicdma_reset_enter(Object *obj, ResetType type)
> +{
> +    axicdma_reset(XILINX_AXI_CDMA(obj));
> +}
> +
> +static void axicdma_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    dc->realize = xilinx_axicdma_realize;
> +    dc->unrealize = xilinx_axicdma_unrealize;
> +    device_class_set_props(dc, axicdma_properties);
> +
> +    rc->phases.enter = xilinx_axicdma_reset_enter;
> +}
> +
> +static const TypeInfo axicdma_info = {
> +    .name          = TYPE_XILINX_AXI_CDMA,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(XilinxAXICDMA),
> +    .class_init    = axicdma_class_init,
> +};
> +
> +static void xilinx_axicdma_register_types(void)
> +{
> +    type_register_static(&axicdma_info);
> +}
> +
> +type_init(xilinx_axicdma_register_types)
> diff --git a/include/hw/dma/xilinx_axicdma.h
> b/include/hw/dma/xilinx_axicdma.h
> new file mode 100644
> index 0000000000..67b7cfce99
> --- /dev/null
> +++ b/include/hw/dma/xilinx_axicdma.h
> @@ -0,0 +1,72 @@
> +/*
> + * QEMU model of Xilinx AXI-CDMA block.
> + *
> + * Copyright (c) 2022 Frank Chang <frank.chang@sifive.com>.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN
> + * THE SOFTWARE.
> + */
> +
> +#include "exec/hwaddr.h"
> +#include "hw/ptimer.h"
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +#include "qemu/units.h"
> +
> +#define CDMA_BUF_SIZE   (64 * KiB)
> +
> +typedef struct XilinxAXICDMA XilinxAXICDMA;
> +
> +#define TYPE_XILINX_AXI_CDMA "xlnx.axi-cdma"
> +OBJECT_DECLARE_SIMPLE_TYPE(XilinxAXICDMA, XILINX_AXI_CDMA)
> +
> +/* Scatter Gather Transfer Descriptor */
> +typedef struct SDesc {
> +    uint64_t nxtdesc;
> +    hwaddr src;
> +    hwaddr dest;
> +    uint32_t control;
> +    uint32_t status;
> +} SDesc;
> +
> +struct XilinxAXICDMA {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +    AddressSpace *as;
> +    MemoryRegion *dma_mr;
> +
> +    /* Properties */
> +    uint32_t control;
> +    uint32_t status;
> +    uint64_t curdesc;
> +    uint64_t taildesc;
> +    hwaddr src;
> +    hwaddr dest;
> +    uint32_t btt;
> +
> +    uint32_t freqhz;
> +    int32_t addrwidth;
> +    ptimer_state *ptimer;
> +    SDesc sdesc;
> +    qemu_irq irq;
> +    uint16_t complete_cnt;
> +    char buf[CDMA_BUF_SIZE];
> +};
> --
> 2.35.1
>
>

--0000000000000d720a05de04dd06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Apr 28, 2022 at 5:43 PM &lt;<a hr=
ef=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" =
target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
Add Xilinx AXI CDMA model, which follows<br>
AXI Central Direct Memory Access v4.1 spec:<br>
<a href=3D"https://docs.xilinx.com/v/u/en-US/pg034-axi-cdma" rel=3D"norefer=
rer" target=3D"_blank">https://docs.xilinx.com/v/u/en-US/pg034-axi-cdma</a>=
<br>
<br>
Supports both Simple DMA and Scatter Gather modes.<br></blockquote><div><br=
></div><div>Hi Frank,</div><div><br></div><div>Thanks for modeling this! I =
have a couple of questions.</div><div><br></div><div>Do you plan to submit =
a machine that uses this DMA?</div><div><br></div><div>The CDMA has a 32-bi=
t AXI4-Lite port for register accesses (see page 6 and 8 in the spec you re=
ferenced), so axicdma_ops.impl.max should be 4 and you shouldn&#39;t need t=
he read/write q versions.</div><div><br></div><div>Best regards,</div><div>=
Edgar</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" ta=
rget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
Reviewed-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.com" target=3D"_b=
lank">jim.shu@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/dma/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/dma/xilinx_axicdma.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 792 ++++++=
++++++++++++++++++++++++++<br>
=C2=A0include/hw/dma/xilinx_axicdma.h |=C2=A0 72 +++<br>
=C2=A03 files changed, 865 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 hw/dma/xilinx_axicdma.c<br>
=C2=A0create mode 100644 include/hw/dma/xilinx_axicdma.h<br>
<br>
diff --git a/hw/dma/meson.build b/hw/dma/meson.build<br>
index f3f0661bc3..85edf80b82 100644<br>
--- a/hw/dma/meson.build<br>
+++ b/hw/dma/meson.build<br>
@@ -3,7 +3,7 @@ softmmu_ss.add(when: &#39;CONFIG_PL080&#39;, if_true: files=
(&#39;pl080.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_PL330&#39;, if_true: files(&#39;pl33=
0.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_I82374&#39;, if_true: files(&#39;i82=
374.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_I8257&#39;, if_true: files(&#39;i825=
7.c&#39;))<br>
-softmmu_ss.add(when: &#39;CONFIG_XILINX_AXI&#39;, if_true: files(&#39;xili=
nx_axidma.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_XILINX_AXI&#39;, if_true: files(&#39;xili=
nx_axidma.c&#39;, &#39;xilinx_axicdma.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ZYNQ_DEVCFG&#39;, if_true: files(&#3=
9;xlnx-zynq-devcfg.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ETRAXFS&#39;, if_true: files(&#39;et=
raxfs_dma.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_STP2000&#39;, if_true: files(&#39;sp=
arc32_dma.c&#39;))<br>
diff --git a/hw/dma/xilinx_axicdma.c b/hw/dma/xilinx_axicdma.c<br>
new file mode 100644<br>
index 0000000000..50aec3ec45<br>
--- /dev/null<br>
+++ b/hw/dma/xilinx_axicdma.c<br>
@@ -0,0 +1,792 @@<br>
+/*<br>
+ * QEMU model of Xilinx AXI-CDMA block.<br>
+ *<br>
+ * Copyright (c) 2022 Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive=
.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;.<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/hw.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/ptimer.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;sysemu/dma.h&quot;<br>
+#include &quot;hw/dma/xilinx_axicdma.h&quot;<br>
+<br>
+#define R_CDMACR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x00<br>
+#define R_CDMASR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x04<br>
+#define R_CURDESC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x08<br>
+#define R_CURDESC_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x0c<br>
+#define R_TAILDESC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x10<br>
+#define R_TAILDESC_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1=
4<br>
+#define R_SA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0x18<br>
+#define R_SA_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x1c<br>
+#define R_DA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0x20<br>
+#define R_DA_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x24<br>
+#define R_BTT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x28<br>
+<br>
+#define R_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x30<br>
+<br>
+/* CDMACR */<br>
+#define CDMACR_TAIL_PNTR_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(1)<br>
+#define CDMACR_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BIT(2)<br>
+#define CDMACR_SGMODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(3)<br>
+#define CDMACR_KEY_HOLE_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4)<br>
+#define CDMACR_KEY_HOLE_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(5)<br>
+#define CDMACR_CYCLIC_BD_ENABLE=C2=A0 =C2=A0 =C2=A0BIT(6)<br>
+#define CDMACR_IOC_IRQ_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(12)<=
br>
+#define CDMACR_DLY_IRQ_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(13)<=
br>
+#define CDMACR_ERR_IRQ_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(14)<=
br>
+<br>
+#define CDMACR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00xffff707c<br>
+<br>
+/* TailPntrEn =3D 1,=C2=A0 IRQThreshold =3D 1. */<br>
+#define CDMACR_DEFAULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1=
0002<br>
+<br>
+/* CDMASR */<br>
+#define CDMASR_IDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0BIT(1)<br>
+#define CDMASR_SG_INCLUD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(3)<b=
r>
+#define CDMASR_DMA_INT_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4)<br>
+#define CDMASR_DMA_SLV_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(5)<br>
+#define CDMASR_DMA_DEC_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(6)<br>
+#define CDMASR_SG_INT_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(8)<b=
r>
+#define CDMASR_SG_SLV_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(9)<b=
r>
+#define CDMASR_SG_DEC_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(10)<=
br>
+#define CDMASR_IOC_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT=
(12)<br>
+#define CDMASR_DLY_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT=
(13)<br>
+#define CDMASR_ERR_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT=
(14)<br>
+<br>
+#define CDMASR_IRQ_THRES_SHIFT=C2=A0 =C2=A0 =C2=A0 16<br>
+#define CDMASR_IRQ_THRES_WIDTH=C2=A0 =C2=A0 =C2=A0 8<br>
+#define CDMASR_IRQ_DELAY_SHIFT=C2=A0 =C2=A0 =C2=A0 24<br>
+#define CDMASR_IRQ_DELAY_WIDTH=C2=A0 =C2=A0 =C2=A0 8<br>
+<br>
+#define CDMASR_IRQ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(CD=
MASR_IOC_IRQ | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CDMASR_DLY_IRQ |=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CDMASR_ERR_IRQ)<=
br>
+<br>
+/* Idle =3D 1, SGIncld =3D 1, IRQThresholdSts =3D 1. */<br>
+#define CDMASR_DEFAULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1=
000a<br>
+<br>
+#define CURDESC_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0xffffffc0<br>
+<br>
+#define TAILDESC_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00xffffffc0<br>
+<br>
+#define BTT_MAX_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (1UL &lt;&lt; 26)<br>
+#define BTT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (BTT_MAX_SIZE - 1)<br>
+<br>
+/* SDesc - Status */<br>
+#define SDEC_STATUS_DMA_INT_ERR=C2=A0 =C2=A0 =C2=A0BIT(28)<br>
+#define SDEC_STATUS_DMA_SLV_ERR=C2=A0 =C2=A0 =C2=A0BIT(29)<br>
+#define SDEC_STATUS_DMA_DEC_ERR=C2=A0 =C2=A0 =C2=A0BIT(30)<br>
+#define SDEC_STATUS_DMA_CMPLT=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(31)<br>
+<br>
+<br>
+static void axicdma_set_dma_err(XilinxAXICDMA *s, uint32_t err);<br>
+static void axicdma_set_sg_dma_err(XilinxAXICDMA *s, uint32_t err, hwaddr =
addr);<br>
+static void axicdma_set_sg_err(XilinxAXICDMA *s, uint32_t err);<br>
+<br>
+static void axicdma_update_irq(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t enable, pending;<br>
+<br>
+=C2=A0 =C2=A0 enable =3D s-&gt;control &amp; CDMASR_IRQ_MASK;<br>
+=C2=A0 =C2=A0 pending =3D s-&gt;status &amp; CDMASR_IRQ_MASK;<br>
+<br>
+=C2=A0 =C2=A0 qemu_set_irq(s-&gt;irq, !!(enable &amp; pending));<br>
+}<br>
+<br>
+static void axicdma_set_irq(XilinxAXICDMA *s, uint32_t irq, bool level)<br=
>
+{<br>
+=C2=A0 =C2=A0 g_assert(irq =3D=3D CDMASR_IOC_IRQ ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D=3D CDMASR_DLY_IRQ =
||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D=3D CDMASR_ERR_IRQ)=
;<br>
+<br>
+=C2=A0 =C2=A0 if (level) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;status |=3D irq;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;status &amp;=3D ~irq;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 axicdma_update_irq(s);<br>
+}<br>
+<br>
+static void axicdma_reload_complete_cnt(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 s-&gt;complete_cnt =3D extract32(s-&gt;control, CDMASR_IRQ_T=
HRES_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CDMASR_IRQ_THRES_WIDTH);<br>
+}<br>
+<br>
+static void timer_hit(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 XilinxAXICDMA *s =3D XILINX_AXI_CDMA(opaque);<br>
+<br>
+=C2=A0 =C2=A0 axicdma_set_irq(s, CDMASR_DLY_IRQ, true);<br>
+=C2=A0 =C2=A0 axicdma_reload_complete_cnt(s);<br>
+}<br>
+<br>
+static bool sdesc_load(XilinxAXICDMA *s, hwaddr addr)<br>
+{<br>
+=C2=A0 =C2=A0 SDesc *d =3D &amp;s-&gt;sdesc;<br>
+=C2=A0 =C2=A0 MemTxResult ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D address_space_read(s-&gt;as, addr, MEMTXATTRS_UNSPEC=
IFIED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d, sizeof(SDesc));<br>
+=C2=A0 =C2=A0 if (ret !=3D MEMTX_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_set_sg_err(s, CDMASR_SG_DEC_ERR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Convert from LE into host endianness. */<br>
+=C2=A0 =C2=A0 d-&gt;nxtdesc =3D le64_to_cpu(d-&gt;nxtdesc);<br>
+=C2=A0 =C2=A0 d-&gt;src =3D le64_to_cpu(d-&gt;src);<br>
+=C2=A0 =C2=A0 d-&gt;dest =3D le64_to_cpu(d-&gt;dest);<br>
+=C2=A0 =C2=A0 d-&gt;control =3D le32_to_cpu(d-&gt;control);<br>
+=C2=A0 =C2=A0 d-&gt;status =3D le32_to_cpu(d-&gt;status);<br>
+<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static bool sdesc_store(XilinxAXICDMA *s, hwaddr addr)<br>
+{<br>
+=C2=A0 =C2=A0 SDesc *d =3D &amp;s-&gt;sdesc;<br>
+=C2=A0 =C2=A0 MemTxResult ret;<br>
+<br>
+=C2=A0 =C2=A0 /* Convert from host endianness into LE. */<br>
+=C2=A0 =C2=A0 d-&gt;nxtdesc =3D cpu_to_le64(d-&gt;nxtdesc);<br>
+=C2=A0 =C2=A0 d-&gt;src =3D cpu_to_le64(d-&gt;src);<br>
+=C2=A0 =C2=A0 d-&gt;dest =3D cpu_to_le64(d-&gt;dest);<br>
+=C2=A0 =C2=A0 d-&gt;control =3D cpu_to_le32(d-&gt;control);<br>
+=C2=A0 =C2=A0 d-&gt;status =3D cpu_to_le32(d-&gt;status);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D address_space_write(s-&gt;as, addr, MEMTXATTRS_UNSPE=
CIFIED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d, sizeof(SDesc));<br>
+=C2=A0 =C2=A0 if (ret !=3D MEMTX_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_set_sg_err(s, CDMASR_SG_DEC_ERR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static void sdesc_complete(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t irq_delay =3D extract32(s-&gt;control, CDMASR_IRQ_D=
ELAY_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CDMASR_IRQ_DELAY_WIDTH)=
;<br>
+<br>
+=C2=A0 =C2=A0 if (irq_delay) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Restart the delayed timer. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_transaction_begin(s-&gt;ptimer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_stop(s-&gt;ptimer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_set_count(s-&gt;ptimer, irq_delay);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_run(s-&gt;ptimer, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_transaction_commit(s-&gt;ptimer);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;complete_cnt--;<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;complete_cnt =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Raise the IOC irq. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_set_irq(s, CDMASR_IOC_IRQ, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_reload_complete_cnt(s);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static inline bool axicdma_sgmode(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 return !!(s-&gt;control &amp; CDMACR_SGMODE);<br>
+}<br>
+<br>
+static void axicdma_set_dma_err(XilinxAXICDMA *s, uint32_t err)<br>
+{<br>
+=C2=A0 =C2=A0 g_assert(err =3D=3D CDMASR_DMA_INT_ERR ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D=3D CDMASR_DMA_SLV_=
ERR ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D=3D CDMASR_DMA_DEC_=
ERR);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;status |=3D err;<br>
+=C2=A0 =C2=A0 axicdma_set_irq(s, CDMASR_ERR_IRQ, true);<br>
+}<br>
+<br>
+static void axicdma_set_sg_dma_err(XilinxAXICDMA *s, uint32_t err, hwaddr =
addr)<br>
+{<br>
+=C2=A0 =C2=A0 g_assert(axicdma_sgmode(s));<br>
+<br>
+=C2=A0 =C2=A0 axicdma_set_dma_err(s, err);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* There are 24-bit shift between<br>
+=C2=A0 =C2=A0 =C2=A0* SDesc status bit and CDMACR.DMA_[INT|SLV|DEC]_ERR bi=
t.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 s-&gt;sdesc.status |=3D (err &lt;&lt; 24);<br>
+=C2=A0 =C2=A0 sdesc_store(s, addr);<br>
+}<br>
+<br>
+static void axicdma_set_sg_err(XilinxAXICDMA *s, uint32_t err)<br>
+{<br>
+=C2=A0 =C2=A0 g_assert(err =3D=3D CDMASR_SG_INT_ERR ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D=3D CDMASR_SG_SLV_E=
RR ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D=3D CDMASR_SG_DEC_E=
RR);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;status |=3D err;<br>
+=C2=A0 =C2=A0 axicdma_set_irq(s, CDMASR_ERR_IRQ, true);<br>
+}<br>
+<br>
+static bool axicdma_perform_dma(XilinxAXICDMA *s, hwaddr src, hwaddr dest,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t btt)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t r_off =3D 0, w_off =3D 0;<br>
+=C2=A0 =C2=A0 uint32_t len;<br>
+=C2=A0 =C2=A0 MemTxResult ret;<br>
+<br>
+=C2=A0 =C2=A0 while (btt &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D MIN(btt, CDMA_BUF_SIZE);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dma_memory_read(s-&gt;as, src + r_off,=
 s-&gt;buf + r_off, len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MEMTXATTRS_UNSPECIFIED);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D MEMTX_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dma_memory_write(s-&gt;as, dest + w_of=
f, s-&gt;buf + w_off, len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEMTXATTRS_UNSPECIFIED);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D MEMTX_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btt -=3D len;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(s-&gt;control &amp; CDMACR_KEY_HOLE_READ=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r_off +=3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(s-&gt;control &amp; CDMACR_KEY_HOLE_WRIT=
E)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 w_off +=3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static void axicdma_run_simple(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 if (!s-&gt;btt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Value of zero BTT is not allowed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_set_dma_err(s, CDMASR_DMA_INT_ERR);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!axicdma_perform_dma(s, s-&gt;src, s-&gt;dest, s-&gt;btt=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_set_dma_err(s, CDMASR_DMA_DEC_ERR);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Generate IOC interrupt. */<br>
+=C2=A0 =C2=A0 axicdma_set_irq(s, CDMASR_IOC_IRQ, true);<br>
+}<br>
+<br>
+static void axicdma_run_sgmode(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t pdesc;<br>
+=C2=A0 =C2=A0 uint32_t btt;<br>
+<br>
+=C2=A0 =C2=A0 while (1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sdesc_load(s, s-&gt;curdesc)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;sdesc.status &amp; SDEC_STATUS_DMA_C=
MPLT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_set_sg_err(s, CDMASR_SG_=
INT_ERR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 btt =3D s-&gt;sdesc.control &amp; BTT_MASK;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (btt =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Value of zero BTT is not allo=
wed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_set_sg_err(s, CDMASR_SG_=
INT_ERR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!axicdma_perform_dma(s, s-&gt;sdesc.src, s=
-&gt;sdesc.dest, btt)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_set_sg_dma_err(s, CDMASR=
_DMA_DEC_ERR, s-&gt;curdesc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Update the descriptor. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sdesc.status |=3D SDEC_STATUS_DMA_CMPLT;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdesc_store(s, s-&gt;curdesc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdesc_complete(s);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Advance current descriptor pointer. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pdesc =3D s-&gt;curdesc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;curdesc =3D s-&gt;sdesc.nxtdesc;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(s-&gt;control &amp; CDMACR_CYCLIC_BD_ENA=
BLE) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdesc =3D=3D s-&gt;taildesc) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reach the tail descriptor. */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Stop the delayed timer. */<br>
+=C2=A0 =C2=A0 ptimer_transaction_begin(s-&gt;ptimer);<br>
+=C2=A0 =C2=A0 ptimer_stop(s-&gt;ptimer);<br>
+=C2=A0 =C2=A0 ptimer_transaction_commit(s-&gt;ptimer);<br>
+}<br>
+<br>
+static void axicdma_run(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 bool sgmode =3D axicdma_sgmode(s);<br>
+<br>
+=C2=A0 =C2=A0 /* Not idle. */<br>
+=C2=A0 =C2=A0 s-&gt;status &amp;=3D ~CDMASR_IDLE;<br>
+<br>
+=C2=A0 =C2=A0 if (!sgmode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_run_simple(s);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_run_sgmode(s);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Idle. */<br>
+=C2=A0 =C2=A0 s-&gt;status |=3D CDMASR_IDLE;<br>
+}<br>
+<br>
+static void axicdma_reset(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 s-&gt;control =3D CDMACR_DEFAULT;<br>
+=C2=A0 =C2=A0 s-&gt;status =3D CDMASR_DEFAULT;<br>
+=C2=A0 =C2=A0 s-&gt;complete_cnt =3D 1;<br>
+=C2=A0 =C2=A0 qemu_irq_lower(s-&gt;irq);<br>
+}<br>
+<br>
+static void axicdma_write_control(XilinxAXICDMA *s, uint32_t value)<br>
+{<br>
+=C2=A0 =C2=A0 if (value &amp; CDMACR_RESET) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_reset(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* The minimum setting for the threshold is 0x01.<br>
+=C2=A0 =C2=A0 =C2=A0* A write of 0x00 to CDMACR.IRQThreshold has no effect=
.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!extract32(value, CDMASR_IRQ_THRES_SHIFT, CDMASR_IRQ_THR=
ES_WIDTH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D deposit32(value, CDMASR_IRQ_THRES_SH=
IFT, CDMASR_IRQ_THRES_WIDTH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 s-&gt;control);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* AXI CDMA is built with SG enabled,<br>
+=C2=A0 =C2=A0 =C2=A0* tail pointer mode is always enabled.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 s-&gt;control =3D (value &amp; CDMACR_MASK) | CDMACR_TAIL_PN=
TR_EN;<br>
+<br>
+=C2=A0 =C2=A0 if (!axicdma_sgmode(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* CDMASR.Dly_Irq, CURDESC_PNTR, TAILDESC=
_PNTR are cleared<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* when not in SGMode.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;status &amp;=3D ~CDMASR_DLY_IRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;curdesc =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;taildesc =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 axicdma_reload_complete_cnt(s);<br>
+}<br>
+<br>
+static uint32_t axicdma_read_status(XilinxAXICDMA *s)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t value =3D s-&gt;status;<br>
+<br>
+=C2=A0 =C2=A0 value =3D deposit32(value, CDMASR_IRQ_THRES_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 CDMASR_IRQ_THRES_WIDTH, s-&gt;complete_cnt);<br>
+=C2=A0 =C2=A0 value =3D deposit32(value, CDMASR_IRQ_DELAY_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 CDMASR_IRQ_DELAY_WIDTH, ptimer_get_count(s-&gt;ptimer));<br>
+<br>
+=C2=A0 =C2=A0 return value;<br>
+}<br>
+<br>
+static void axicdma_write_status(XilinxAXICDMA *s, uint32_t value)<br>
+{<br>
+=C2=A0 =C2=A0 /* Write 1s to clear interrupts. */<br>
+=C2=A0 =C2=A0 s-&gt;status &amp;=3D ~(value &amp; CDMASR_IRQ_MASK);<br>
+=C2=A0 =C2=A0 axicdma_update_irq(s);<br>
+}<br>
+<br>
+static void axicdma_write_curdesc(XilinxAXICDMA *s, uint64_t value)<br>
+{<br>
+=C2=A0 =C2=A0 /* Should be idle. */<br>
+=C2=A0 =C2=A0 g_assert(s-&gt;status &amp; CDMASR_IDLE);<br>
+<br>
+=C2=A0 =C2=A0 if (!axicdma_sgmode(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This register is cleared if SGMode =3D 0. *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;curdesc =3D value &amp; CURDESC_MASK;<br>
+}<br>
+<br>
+static void axicdma_write_taildesc(XilinxAXICDMA *s, uint64_t value)<br>
+{<br>
+=C2=A0 =C2=A0 /* Should be idle. */<br>
+=C2=A0 =C2=A0 g_assert(s-&gt;status &amp; CDMASR_IDLE);<br>
+<br>
+=C2=A0 =C2=A0 if (!axicdma_sgmode(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This register is cleared if SGMode =3D 0. *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;taildesc =3D value &amp; TAILDESC_MASK;<br>
+<br>
+=C2=A0 =C2=A0 /* Kick-off CDMA. */<br>
+=C2=A0 =C2=A0 axicdma_run(s);<br>
+}<br>
+<br>
+static void axicdma_write_btt(XilinxAXICDMA *s, uint64_t value)<br>
+{<br>
+=C2=A0 =C2=A0 s-&gt;btt =3D value &amp; BTT_MASK;<br>
+<br>
+=C2=A0 =C2=A0 if (!axicdma_sgmode(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Kick-off CDMA. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_run(s);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint32_t axicdma_readl(void *opaque, hwaddr addr, unsigned size)<br=
>
+{<br>
+=C2=A0 =C2=A0 XilinxAXICDMA *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t value =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;addrwidth &lt;=3D 32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case R_CURDESC_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case R_TAILDESC_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case R_SA_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case R_DA_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%s: Invalid 32-bit read to 0x%&quot; HWADDR_PRIX &q=
uot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case R_CDMACR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;control;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CDMASR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D axicdma_read_status(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CURDESC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;curdesc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CURDESC_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D extract64(s-&gt;curdesc, 32, 32);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_TAILDESC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;taildesc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_TAILDESC_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D extract64(s-&gt;taildesc, 32, 32);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_SA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;src;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_SA_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D extract64(s-&gt;src, 32, 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_DA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;dest;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_DA_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D extract64(s-&gt;dest, 32, 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_BTT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;btt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: Invalid 32-bit read to 0x%&quot; HWADDR_PRIX &quot;\n&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, addr);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return value;<br>
+}<br>
+<br>
+static uint32_t axicdma_readq(void *opaque, hwaddr addr, unsigned size)<br=
>
+{<br>
+=C2=A0 =C2=A0 XilinxAXICDMA *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint64_t value =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case R_CDMACR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;control;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CDMASR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D axicdma_read_status(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CURDESC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;curdesc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_TAILDESC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;taildesc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_SA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;src;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_DA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;dest;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_BTT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;btt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: Invalid 64-bit read to 0x%&quot; HWADDR_PRIX &quot;\n&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, addr);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return value;<br>
+}<br>
+<br>
+static uint64_t axicdma_read(void *opaque, hwaddr addr, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t value =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 switch (size) {<br>
+=C2=A0 =C2=A0 case 4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D axicdma_readl(opaque, addr, size);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D axicdma_readq(opaque, addr, size);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: Inval=
id read size %u to AXI-CDMA\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, size);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return value;<br>
+}<br>
+<br>
+static void axicdma_writel(void *opaque, hwaddr addr, uint32_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 XilinxAXICDMA *s =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;addrwidth &lt;=3D 32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case R_CURDESC_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case R_TAILDESC_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case R_SA_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case R_DA_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%s: Invalid 32-bit write to 0x%&quot; HWADDR_PRIX &=
quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case R_CDMACR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_control(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CDMASR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_status(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CURDESC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_curdesc(s, deposit64(s-&gt;curde=
sc, 0, 32, value));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CURDESC_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_curdesc(s, deposit64(s-&gt;curde=
sc, 32, 32, value));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_TAILDESC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_taildesc(s, deposit64(s-&gt;tail=
desc, 0, 32, value));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_TAILDESC_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_taildesc(s, deposit64(s-&gt;tail=
desc, 32, 32, value));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_SA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;src =3D deposit64(s-&gt;src, 0, 32, valu=
e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_SA_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;src =3D deposit64(s-&gt;src, 32, 32, val=
ue);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_DA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;dest =3D deposit64(s-&gt;dest, 0, 32, va=
lue);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_DA_MSB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;dest =3D deposit64(s-&gt;dest, 32, 32, v=
alue);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_BTT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_btt(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: Invalid 32-bit write to 0x%&quot; HWADDR_PRIX &quot;\n&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, addr);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void axicdma_writeq(void *opaque, hwaddr addr, uint64_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 XilinxAXICDMA *s =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case R_CDMACR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_control(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CDMASR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_status(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_CURDESC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_curdesc(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_TAILDESC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_taildesc(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_SA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;src =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_DA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;dest =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case R_BTT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_write_btt(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: Invalid 64-bit write to 0x%&quot; HWADDR_PRIX &quot;\n&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, addr);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void axicdma_write(void *opaque, hwaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint64_t value, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 switch (size) {<br>
+=C2=A0 =C2=A0 case 4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_writel(opaque, addr, value, size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 axicdma_writeq(opaque, addr, value, size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: Invalid write size %u to AXI-CDMA\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, size);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps axicdma_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D axicdma_read,<br>
+=C2=A0 =C2=A0 .write =3D axicdma_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 8<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .impl =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 8,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static void xilinx_axicdma_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 XilinxAXICDMA *s =3D XILINX_AXI_CDMA(dev);<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;mmio, OBJECT(dev), &amp;axi=
cdma_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_XILINX_AXI_CDMA, R_MAX);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;mmio);<br>
+=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;irq);<br>
+<br>
+=C2=A0 =C2=A0 if (!s-&gt;dma_mr || s-&gt;dma_mr =3D=3D get_system_memory()=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Avoid creating new AddressSpace for system =
memory. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;as =3D &amp;address_space_memory;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;as =3D g_new0(AddressSpace, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 address_space_init(s-&gt;as, s-&gt;dma_mr, mem=
ory_region_name(s-&gt;dma_mr));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;ptimer =3D ptimer_init(timer_hit, s, PTIMER_POLICY_DEF=
AULT);<br>
+=C2=A0 =C2=A0 ptimer_transaction_begin(s-&gt;ptimer);<br>
+=C2=A0 =C2=A0 ptimer_set_freq(s-&gt;ptimer, s-&gt;freqhz);<br>
+=C2=A0 =C2=A0 ptimer_transaction_commit(s-&gt;ptimer);<br>
+}<br>
+<br>
+static void xilinx_axicdma_unrealize(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 XilinxAXICDMA *s =3D XILINX_AXI_CDMA(dev);<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;ptimer) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_free(s-&gt;ptimer);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;as &amp;&amp; s-&gt;dma_mr !=3D get_system_memory(=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;as);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static Property axicdma_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;freqhz&quot;, XilinxAXICDMA, freqhz=
, 50000000),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_INT32(&quot;addrwidth&quot;, XilinxAXICDMA, addr=
width, 64),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_LINK(&quot;dma&quot;, XilinxAXICDMA, dma_mr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0TYPE_MEMORY_REGION, MemoryRegion *),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void xilinx_axicdma_reset_enter(Object *obj, ResetType type)<br>
+{<br>
+=C2=A0 =C2=A0 axicdma_reset(XILINX_AXI_CDMA(obj));<br>
+}<br>
+<br>
+static void axicdma_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D xilinx_axicdma_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;unrealize =3D xilinx_axicdma_unrealize;<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, axicdma_properties);<br>
+<br>
+=C2=A0 =C2=A0 rc-&gt;phases.enter =3D xilinx_axicdma_reset_enter;<br>
+}<br>
+<br>
+static const TypeInfo axicdma_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_XILINX_AXI_=
CDMA,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(XilinxAXICDMA),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D axicdma_class_init,<br>
+};<br>
+<br>
+static void xilinx_axicdma_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;axicdma_info);<br>
+}<br>
+<br>
+type_init(xilinx_axicdma_register_types)<br>
diff --git a/include/hw/dma/xilinx_axicdma.h b/include/hw/dma/xilinx_axicdm=
a.h<br>
new file mode 100644<br>
index 0000000000..67b7cfce99<br>
--- /dev/null<br>
+++ b/include/hw/dma/xilinx_axicdma.h<br>
@@ -0,0 +1,72 @@<br>
+/*<br>
+ * QEMU model of Xilinx AXI-CDMA block.<br>
+ *<br>
+ * Copyright (c) 2022 Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive=
.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;.<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;exec/hwaddr.h&quot;<br>
+#include &quot;hw/ptimer.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
+<br>
+#define CDMA_BUF_SIZE=C2=A0 =C2=A0(64 * KiB)<br>
+<br>
+typedef struct XilinxAXICDMA XilinxAXICDMA;<br>
+<br>
+#define TYPE_XILINX_AXI_CDMA &quot;xlnx.axi-cdma&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxAXICDMA, XILINX_AXI_CDMA)<br>
+<br>
+/* Scatter Gather Transfer Descriptor */<br>
+typedef struct SDesc {<br>
+=C2=A0 =C2=A0 uint64_t nxtdesc;<br>
+=C2=A0 =C2=A0 hwaddr src;<br>
+=C2=A0 =C2=A0 hwaddr dest;<br>
+=C2=A0 =C2=A0 uint32_t control;<br>
+=C2=A0 =C2=A0 uint32_t status;<br>
+} SDesc;<br>
+<br>
+struct XilinxAXICDMA {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 MemoryRegion mmio;<br>
+=C2=A0 =C2=A0 AddressSpace *as;<br>
+=C2=A0 =C2=A0 MemoryRegion *dma_mr;<br>
+<br>
+=C2=A0 =C2=A0 /* Properties */<br>
+=C2=A0 =C2=A0 uint32_t control;<br>
+=C2=A0 =C2=A0 uint32_t status;<br>
+=C2=A0 =C2=A0 uint64_t curdesc;<br>
+=C2=A0 =C2=A0 uint64_t taildesc;<br>
+=C2=A0 =C2=A0 hwaddr src;<br>
+=C2=A0 =C2=A0 hwaddr dest;<br>
+=C2=A0 =C2=A0 uint32_t btt;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t freqhz;<br>
+=C2=A0 =C2=A0 int32_t addrwidth;<br>
+=C2=A0 =C2=A0 ptimer_state *ptimer;<br>
+=C2=A0 =C2=A0 SDesc sdesc;<br>
+=C2=A0 =C2=A0 qemu_irq irq;<br>
+=C2=A0 =C2=A0 uint16_t complete_cnt;<br>
+=C2=A0 =C2=A0 char buf[CDMA_BUF_SIZE];<br>
+};<br>
-- <br>
2.35.1<br>
<br>
</blockquote></div></div>

--0000000000000d720a05de04dd06--

