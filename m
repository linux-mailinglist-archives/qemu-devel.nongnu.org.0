Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EE46247EE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 18:09:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otB1i-0003n1-I5; Thu, 10 Nov 2022 12:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otB1f-0003l1-QY
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:07:39 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otB1Y-0003xB-2V
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:07:39 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso2089615pjc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1nsn+QTK380Oixk16wL+YNtdjOo3v4Y5uc6G8fog2UE=;
 b=UTbiCaNC0aGDjw7HeAC48TWMjaD1bpzJkUPNk8LISWUPOygQFLcygSoW7jJfyYQRSm
 DEy3TBd1L12YcF6ZWgirnvpQhBu709Cd3cSf8Yee+/b5Tzm+mUdmEucjOxyjVthBFpiX
 ggPWAO8PvxptEeizwHz6khDes0GLUiUQzAb6aEkRs3gGR16E0RtJFctPGqhRHOu+2UNI
 TUK+GsyhM4KeGFKqVBlCjyv/1oc7fRrsE2DLJRe62WSxlnkiWuWLyFuTM2RwNPHG5Tcm
 /jDkCaK6Ct8i6Ja7vY7r8FJEZ5Z4iQu+y0p9NYJU+8f7lOp4GTwBwWHTFC7SBv7z2h3t
 3ETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1nsn+QTK380Oixk16wL+YNtdjOo3v4Y5uc6G8fog2UE=;
 b=BI6kJu06mRcl2toHvvh4Bk08ruKlSlqtmyJ+jPBAypLWpoahFYMvsHaRaJHSU8h+Wr
 YNyfi8Ypt+duApsFM+1ROFG0RagIEpgiXbduXctD1xY+vIR1teww3DIwFBhRrqxRo4qT
 hZRKACE6V++vz7IIBkgcTRN8o+0Zct7t27oa7RUCeJ7ScpkOZ0jM6Su/OVc/tuCcXccd
 3SISQ7bCC4GMtchuOq0lcrKSSnJAZ4ogoQJuuRTKoeKwqCIGMiLXrRqrqxuJ5hMof+ad
 wnuS+Oy+6xyjv8NF3xUri4fvH1RzizS0gacS22iQxgKrWdnU/uXMavoXQfVhIZJNs0Mi
 cpZw==
X-Gm-Message-State: ACrzQf3zbQZ7/cS15zo8pNnGas+n1loLEO8n6pKViaUeGm+qE4HiCwW5
 bMuEXh1GmUQWSKwqpeNikKTX6+ThzmdF7GmjHBz77g==
X-Google-Smtp-Source: AMsMyM7M/BvGrf1aQrSVnMjxoUTKWiYy645M1Zs278/cbdH6B5MoZE+nJHcZaZKClQq9DS2uqpRyX5/Q9lPZQQbTpcc=
X-Received: by 2002:a17:90a:70c5:b0:205:edfd:13f7 with SMTP id
 a5-20020a17090a70c500b00205edfd13f7mr1498459pjm.19.1668100049128; Thu, 10 Nov
 2022 09:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20221022054746.28217-1-vikram.garhwal@amd.com>
 <20221022054746.28217-3-vikram.garhwal@amd.com>
In-Reply-To: <20221022054746.28217-3-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 17:07:16 +0000
Message-ID: <CAFEAcA-=KSomBUYKz_fwyePmQUs6YUTn03C_uJKpUF93vcWzAQ@mail.gmail.com>
Subject: Re: [QEMU][PATCH v2 2/5] hw/net/can: Introduce Xilinx Versal CANFD
 controller
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com, edgar.iglesias@amd.com, 
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 22 Oct 2022 at 06:48, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> The Xilinx Versal CANFD controller is developed based on SocketCAN, QEMU CAN bus
> implementation. Bus connection and socketCAN connection for each CAN module
> can be set through command lines.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  hw/net/can/meson.build             |    1 +
>  hw/net/can/trace-events            |    7 +
>  hw/net/can/xlnx-versal-canfd.c     | 2160 ++++++++++++++++++++++++++++
>  include/hw/net/xlnx-versal-canfd.h |   91 ++
>  4 files changed, 2259 insertions(+)
>  create mode 100644 hw/net/can/xlnx-versal-canfd.c
>  create mode 100644 include/hw/net/xlnx-versal-canfd.h
>
> diff --git a/hw/net/can/meson.build b/hw/net/can/meson.build
> index 8fabbd9ee6..8d85201cb0 100644
> --- a/hw/net/can/meson.build
> +++ b/hw/net/can/meson.build
> @@ -5,3 +5,4 @@ softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_mioe3680_pci.c'))
>  softmmu_ss.add(when: 'CONFIG_CAN_CTUCANFD', if_true: files('ctucan_core.c'))
>  softmmu_ss.add(when: 'CONFIG_CAN_CTUCANFD_PCI', if_true: files('ctucan_pci.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-can.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-canfd.c'))
> diff --git a/hw/net/can/trace-events b/hw/net/can/trace-events
> index 8346a98ab5..de64ac1b31 100644
> --- a/hw/net/can/trace-events
> +++ b/hw/net/can/trace-events
> @@ -7,3 +7,10 @@ xlnx_can_filter_mask_pre_write(uint8_t filter_num, uint32_t value) "Filter%d MAS
>  xlnx_can_tx_data(uint32_t id, uint8_t dlc, uint8_t db0, uint8_t db1, uint8_t db2, uint8_t db3, uint8_t db4, uint8_t db5, uint8_t db6, uint8_t db7) "Frame: ID: 0x%08x DLC: 0x%02x DATA: 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x"
>  xlnx_can_rx_data(uint32_t id, uint32_t dlc, uint8_t db0, uint8_t db1, uint8_t db2, uint8_t db3, uint8_t db4, uint8_t db5, uint8_t db6, uint8_t db7) "Frame: ID: 0x%08x DLC: 0x%02x DATA: 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x"
>  xlnx_can_rx_discard(uint32_t status) "Controller is not enabled for bus communication. Status Register: 0x%08x"
> +
> +# xlnx-versal-canfd.c
> +xlnx_canfd_update_irq(char *path, uint32_t isr, uint32_t ier, uint32_t irq) "%s: ISR: 0x%08x IER: 0x%08x IRQ: 0x%08x"
> +xlnx_canfd_rx_fifo_filter_reject(char *path, uint32_t id, uint8_t dlc) "%s: Frame: ID: 0x%08x DLC: 0x%02x"
> +xlnx_canfd_rx_data(char *path, uint32_t id, uint8_t dlc, uint8_t flags) "%s: Frame: ID: 0x%08x DLC: 0x%02x CANFD Flag: 0x%02x"
> +xlnx_canfd_tx_data(char *path, uint32_t id, uint8_t dlc, uint8_t flgas) "%s: Frame: ID: 0x%08x DLC: 0x%02x CANFD Flag: 0x%02x"
> +xlnx_canfd_reset(char *path, uint32_t val) "%s: Resetting controller with value = 0x%08x"
> diff --git a/hw/net/can/xlnx-versal-canfd.c b/hw/net/can/xlnx-versal-canfd.c
> new file mode 100644
> index 0000000000..592c61fcf3
> --- /dev/null
> +++ b/hw/net/can/xlnx-versal-canfd.c
> @@ -0,0 +1,2160 @@
> +/*
> + * QEMU model of the Xilinx Versal CANFD device.
> + *
> + * This implementation is based on the following datasheet:
> + * https://docs.xilinx.com/v/u/2.0-English/pg223-canfd
> + *
> + * Copyright (c) 2022 AMD Inc.
> + *
> + * Written-by: Vikram Garhwal<vikram.garhwal@amd.com>
> + *
> + * Based on QEMU CANFD Device emulation implemented by Jin Yang, Deniz Eren and
> + * Pavel Pisa
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
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +#include "hw/register.h"
> +#include "qapi/error.h"
> +#include "qemu/bitops.h"
> +#include "qemu/log.h"
> +#include "qemu/cutils.h"
> +#include "qemu/event_notifier.h"
> +#include "hw/qdev-properties.h"
> +#include "qom/object_interfaces.h"
> +#include "migration/vmstate.h"
> +#include "hw/net/xlnx-versal-canfd.h"
> +#include "trace.h"
> +
> +/* This is done to avoid the build issues on Windows machines. The ERROR field
> + * of INTERRUPT_STATUS_REGISTER collides with a macro in the Windows build
> + * environment.
> + */

QEMU coding style wants the initial "/*" on a line of its own.

> +#undef ERROR


> +static void canfd_update_irq(XlnxVersalCANFDState *s)
> +{
> +    unsigned int irq = s->regs[R_INTERRUPT_STATUS_REGISTER] &
> +                        s->regs[R_INTERRUPT_ENABLE_REGISTER];
> +
> +    /* RX watermark interrupts. */
> +    if (ARRAY_FIELD_EX32(s->regs, RX_FIFO_STATUS_REGISTER, FL) >
> +        ARRAY_FIELD_EX32(s->regs, RX_FIFO_WATERMARK_REGISTER, RXFWM)) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFWMFLL, 1);
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, RX_FIFO_STATUS_REGISTER, FL_1) >
> +        ARRAY_FIELD_EX32(s->regs, RX_FIFO_WATERMARK_REGISTER, RXFWM_1)) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFWMFLL_1, 1);
> +    }
> +
> +    /* TX watermark interrupt. */
> +    if (ARRAY_FIELD_EX32(s->regs, TX_EVENT_FIFO_STATUS_REGISTER, TXE_FL) >
> +        ARRAY_FIELD_EX32(s->regs, TX_EVENT_FIFO_WATERMARK_REGISTER, TXE_FWM)) {
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXEWMFLL, 1);
> +    }
> +
> +    g_autofree char *path = object_get_canonical_path(OBJECT(s));

Don't declare variables in the middle of blocks, please.

> +
> +    trace_xlnx_canfd_update_irq(path, s->regs[R_INTERRUPT_STATUS_REGISTER],
> +                                s->regs[R_INTERRUPT_ENABLE_REGISTER], irq);
> +
> +    qemu_set_irq(s->irq_canfd_int, irq);
> +}

> +static void update_status_register_mode_bits(XlnxVersalCANFDState *s)
> +{
> +    bool sleep_status = ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP);
> +    bool sleep_mode = ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SLEEP);
> +    /* Wake up interrupt bit. */
> +    bool wakeup_irq_val = (sleep_mode == 0) && sleep_status;
> +    /* Sleep interrupt bit. */
> +    bool sleep_irq_val = sleep_mode && (sleep_status == 0);

Don't compare bools against zero.
   wakeup_irq_val = !sleep_mode && sleep_status;
etc.


> +
> +    /* Clear previous core mode status bits. */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, LBACK, 0);
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SLEEP, 0);
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SNOOP, 0);
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, NORMAL, 0);
> +
> +    /* set current mode bit and generate irqs accordingly. */
> +    if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, LBACK)) {
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, LBACK, 1);
> +    } else if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SLEEP)) {
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SLEEP, 1);
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, SLP,
> +                         sleep_irq_val);
> +    } else if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SNOOP)) {
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SNOOP, 1);
> +    } else {
> +        /* If all bits are zero, XlnxVersalCANFDState is set in normal mode. */
> +        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, NORMAL, 1);
> +        /* Set wakeup interrupt bit. */
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, WKUP,
> +                         wakeup_irq_val);
> +    }
> +
> +    /* Put the CANFD in error active state. */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, ESTAT, 1);
> +
> +    canfd_update_irq(s);
> +}

> +static void regs2frame(XlnxVersalCANFDState *s, qemu_can_frame *frame,
> +                       uint32_t reg_num)
> +{
> +    uint32_t i = 0;
> +    uint32_t j = 0;
> +    uint32_t val = 0;
> +    uint32_t dlc_reg_val = s->regs[reg_num + 1];

It's very unclear to me whether the reg_num here is guaranteed to be
in the right range so that neither this deference nor the ones below
where we're filling frame->data will overrun the array -- the code that
calculates reg_num at the callsite is pretty complicated.

If the guest can misprogram the device so it's out of range we should
detect and handle that. If it really can't happen we should assert here
that reg_num is in range.

> +    uint32_t dlc_value = FIELD_EX32(dlc_reg_val, TB0_DLC_REGISTER, DLC);
> +
> +    frame->can_id = s->regs[reg_num];
> +
> +    if (FIELD_EX32(dlc_reg_val, TB0_DLC_REGISTER, FDF)) {
> +        /*
> +         * CANFD frame.
> +         * Converting dlc(0 to 15) 4 Byte data to plain length(i.e. 0 to 64)
> +         * 1 Byte data. This is done to make it work with SocketCAN.
> +         * On actual CANFD frame, this value can't be more than 0xF.
> +         * Conversion table for DLC to plain length:
> +         *
> +         *  DLC                        Plain Length
> +         *  0 - 8                      0 - 8
> +         *  9                          9 - 12
> +         *  10                         13 - 16
> +         *  11                         17 - 20
> +         *  12                         21 - 24
> +         *  13                         25 - 32
> +         *  14                         33 - 48
> +         *  15                         49 - 64
> +         */
> +
> +        frame->flags = QEMU_CAN_FRMF_TYPE_FD;
> +
> +        if (dlc_value < 8) {
> +            frame->can_dlc = dlc_value;
> +        } else {

I think it's worth having
   assert((dlc_value - 8) < ARRAY_SIZE(canfd_dlc_array));
here (should always be true as the FDF field is 4 bits).

> +            frame->can_dlc = canfd_dlc_array[dlc_value - 8];
> +        }
> +
> +        for (i = 0; i < 4 ; i++) {

Stray space before semicolon.

> +            val = 8 * i;
> +
> +            for (j = 0; j < frame->can_dlc / 4; j++) {
> +                frame->data[i + 4 * j] = ((s->regs[reg_num + 2 + j] >> val) &
> +                                           0xFF);

Using extract32() is usually a better idea than manual shift-and-mask
(but see below).
Asserting that this doesn't overrun the array would be a good idea.

Why do we fill in the array by first putting in all the low bytes,
then the second bytes, and so on (so we write data[0], [4], [8], ...
then [1], [5], [9], ... then [2], [6], ... and finally [3], [7], ...)
rather than just filling the array from the beginning forwards ?

I think something like
  for (j = 0; j < frame->can_dlc / 4; j++) {
       stl_le_p(frame->data + j, s->regs[reg_num + 2 + j]);
  }
does the same thing you're doing with this pair of loops, but
in a less complicated way.

If can_dlc is less than 8, the code (either your version or my
version) doesn't fill in frame->data[] for the partial word,
eg if can_dlc is 7 we fill in data[0..3] but not [4..6]. Is
that intended behaviour ?

> +            }
> +        }
> +    } else {
> +        /*
> +         * FD Format bit not set that means it is a CAN Frame.
> +         * Conversion table for classic CAN:
> +         *
> +         *  DLC                        Plain Length
> +         *  0 - 7                      0 - 7
> +         *  8 - 15                     8
> +         */
> +
> +        if (dlc_value > 8) {
> +            frame->can_dlc = dlc_value;
> +            dlc_value = 8;
> +            qemu_log_mask(LOG_GUEST_ERROR, "Maximum DLC value for Classic CAN"
> +                          "  frame can be 8. Only 8 byte data will be sent.\n");

"is", not "can be".

> +        } else {
> +            frame->can_dlc = dlc_value;
> +        }
> +
> +        for (i = 0; i < 4 ; i++) {
> +            val = 8 * i;
> +
> +            for (j = 0; j < dlc_value; j++) {
> +                frame->data[i + 4 * j] = ((s->regs[reg_num + 2 + j] >> val) &
> +                                           0xFF);
> +            }
> +        }

Same remarks as above, plus you can arrange this so the "fill in
the frame data" code is only written once, rather than duplicated
in both halves of the if statement.

> +    }
> +}
> +
> +static void process_cancellation_requests(XlnxVersalCANFDState *s)
> +{
> +    int i;
> +    uint32_t val = s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER];
> +    uint32_t cancel_val = s->regs[R_TX_BUFFER_CANCEL_REQUEST_REGISTER];
> +
> +    for (i = 0; i < 32; i++) {
> +
> +        if ((val & 0x1) && (cancel_val & 0x1)) {
> +            s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER] &= ~(1 << i);
> +            s->regs[R_TX_BUFFER_CANCEL_REQUEST_REGISTER] &= ~(1 << i);
> +
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXCRS, 1);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Data Tx going on for requested"
> +                          " cancellation bit\n");

This is going to log for every zero bit in the cancel request
register, which I suspect is not the right behaviour. Looking at
the data sheet I don't think that the message is right anyway --
ifthe RR bit is 0 that means the data tx has completed, not that
it is still ongoing.

> +        }
> +
> +        val >>= 1;
> +        cancel_val >>= 1;
> +    }

You don't need to do this with a loop, it's purely bitwise:

  uint32_t clear_mask = val & cancel_val;

  s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER] &= ~clear_mask;
  s->regs[R_TX_BUFFER_CANCEL_REQUEST_REGISTER] &= ~clear_mask;

achieves the same effect as the code you have.

But the datasheet says that writes of 1 to the cancel request register
bits are ignored if the TRR bit is 0, so I suspect that in fact you
just want to zero the whole cancel request register, not merely the
bits where you successfully cleared the ready request register bit.

> +    canfd_update_irq(s);
> +}
> +
> +static void store_rx_sequential(XlnxVersalCANFDState *s,
> +                                const qemu_can_frame *frame,
> +                                uint32_t fill_level, uint32_t read_index,
> +                                uint32_t store_location, uint8_t rx_fifo,
> +                                bool rx_fifo_id, uint8_t filter_index)
> +{
> +    int i;
> +    bool is_canfd_frame;
> +    uint8_t dlc = 0;
> +    uint32_t dlc_reg_val = 0;
> +    uint32_t data_reg_val = 0;
> +
> +    /* Getting RX0/1 fill level */
> +    if ((fill_level) > rx_fifo - 1) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: RX%d Buffer is full. Discarding the"
> +                      "message\n", path, rx_fifo_id);

There will be a missing space in the output between "the" and "message" here.
(You should check your other qemu_log_mask() calls in case they have
the same bug.

> +
> +        /* Set the corresponding RF buffer overflow interrupt. */
> +        if (rx_fifo_id == 0) {
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW, 1);
> +        } else {
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW_1, 1);
> +        }
> +    } else {
> +        uint16_t rx_timestamp = CANFD_TIMER_MAX -
> +                                    ptimer_get_count(s->canfd_timer);
> +
> +        if (rx_timestamp == 0xFFFF) {
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TSCNT_OFLW, 1);
> +        } else {
> +            ARRAY_FIELD_DP32(s->regs, TIMESTAMP_REGISTER, TIMESTAMP_CNT,
> +                             rx_timestamp);
> +        }
> +
> +        if (rx_fifo_id == 0) {
> +            ARRAY_FIELD_DP32(s->regs, RX_FIFO_STATUS_REGISTER, FL,
> +                             fill_level + 1);
> +        } else {
> +            ARRAY_FIELD_DP32(s->regs, RX_FIFO_STATUS_REGISTER, FL_1,
> +                             fill_level + 1);
> +        }

As above, if you're going to be storing into the register array based
on the result of a complicated calculation of what register index to
use, you should assert() that we're not out of bounds.

> +        s->regs[store_location] = frame->can_id;
> +
> +        if (frame->flags == QEMU_CAN_FRMF_TYPE_FD) {
> +            is_canfd_frame = true;
> +
> +            for (i = 0; i < ARRAY_SIZE(canfd_dlc_array); i++) {
> +                if (canfd_dlc_array[i] == frame->can_dlc) {
> +                    dlc = 8 + i;
> +                }
> +
> +            dlc_reg_val = FIELD_DP32(0, RB_DLC_REGISTER, DLC, dlc);
> +            }
> +        } else {
> +            is_canfd_frame = false;
> +            if (frame->can_dlc > 8) {
> +                dlc = 8;
> +            } else {
> +                dlc = frame->can_dlc;
> +            }
> +
> +            dlc_reg_val = FIELD_DP32(0, RB_DLC_REGISTER, DLC, frame->can_dlc);
> +        }
> +
> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, FDF, is_canfd_frame);
> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, TIMESTAMP, rx_timestamp);
> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, MATCHED_FILTER_INDEX,
> +                                  filter_index);
> +        s->regs[store_location + 1] = dlc_reg_val;
> +
> +        for (i = 0; i <= dlc; i++) {
> +            data_reg_val = FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES3,
> +                                      frame->data[4 * i]);
> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES2,
> +                                       frame->data[4 * i + 1]);
> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES1,
> +                                       frame->data[4 * i + 2]);
> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES0,
> +                                       frame->data[4 * i + 3]);

You can do this less awkwardly using ldl_le_p().

Something looks weird here, though -- why do we read byte 0 of the buffer
into the BYTES3 field, byte 1 into BYTES2, and so on ?

> +            s->regs[store_location + i + 2] = data_reg_val;
> +        }
> +        /* set the interrupt as RXOK. */
> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
> +    }
> +}
> +
> +static void update_rx_sequential(XlnxVersalCANFDState *s,
> +                                 const qemu_can_frame *frame)
> +{
> +    bool filter_pass = false;
> +    uint8_t filter_index = 0;
> +    int i;
> +    int filter_partition = ARRAY_FIELD_EX32(s->regs,
> +                                            RX_FIFO_WATERMARK_REGISTER, RXFP);
> +    uint32_t store_location;
> +    uint32_t fill_level;
> +    uint32_t read_index;
> +
> +    /*
> +     * If all UAF bits are set to 0, then received messages are not stored
> +     * in the RX buffers.
> +     */
> +    if (!s->regs[R_ACCEPTANCE_FILTER_CONTROL_REGISTER]) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "No acceptance filter is set. Received"
> +                      " messages will not be stored.\n");
> +    } else {
> +        uint32_t acceptance_filter_status =
> +                                s->regs[R_ACCEPTANCE_FILTER_CONTROL_REGISTER];
> +
> +        for (i = 0; i < 32; i++) {
> +            if (acceptance_filter_status & 0x1) {
> +                uint32_t msg_id_masked = s->regs[R_AFMR_REGISTER + 2 * i] &
> +                                         frame->can_id;
> +                uint32_t afir_id_masked = s->regs[R_AFIR_REGISTER + 2 * i] &
> +                                          s->regs[R_AFMR_REGISTER + 2 * i];
> +                uint16_t std_msg_id_masked = FIELD_EX32(msg_id_masked,
> +                                                        AFIR_REGISTER, AIID);
> +                uint16_t std_afir_id_masked = FIELD_EX32(afir_id_masked,
> +                                                         AFIR_REGISTER, AIID);
> +                uint32_t ext_msg_id_masked = FIELD_EX32(msg_id_masked,
> +                                                        AFIR_REGISTER,
> +                                                        AIID_EXT);
> +                uint32_t ext_afir_id_masked = FIELD_EX32(afir_id_masked,
> +                                                         AFIR_REGISTER,
> +                                                         AIID_EXT);
> +                bool ext_ide = FIELD_EX32(s->regs[R_AFMR_REGISTER + 2 * i],
> +                                          AFMR_REGISTER, AMIDE);
> +
> +                if (std_msg_id_masked == std_afir_id_masked) {
> +                    if (ext_ide) {
> +                        /* Extended message ID message. */
> +                        if (ext_msg_id_masked == ext_afir_id_masked) {
> +                            filter_pass = true;
> +                            filter_index = i;
> +
> +                            break;
> +                        }
> +                    } else {
> +                        /* Standard message ID. */
> +                        filter_pass = true;
> +                        filter_index = i;
> +
> +                        break;
> +                    }
> +                }
> +            }
> +            acceptance_filter_status >>= 1;
> +        }
> +    }
> +
> +    if (!filter_pass) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        trace_xlnx_canfd_rx_fifo_filter_reject(path, frame->can_id,
> +                                               frame->can_dlc);
> +    } else {
> +        if (filter_index <= filter_partition) {
> +            fill_level = ARRAY_FIELD_EX32(s->regs, RX_FIFO_STATUS_REGISTER, FL);
> +            read_index = ARRAY_FIELD_EX32(s->regs, RX_FIFO_STATUS_REGISTER, RI);
> +            uint8_t store_index = read_index + fill_level;
> +
> +            if (read_index == s->cfg.rx0_fifo - 1) {
> +                /*
> +                 * When ri is s->cfg.rx0_fifo - 1 i.e. max, it goes cyclic that
> +                 * means we reset the ri to 0x0.
> +                 */
> +                read_index = 0;
> +                ARRAY_FIELD_DP32(s->regs, RX_FIFO_STATUS_REGISTER, RI,
> +                                 read_index);
> +            }
> +
> +            if (store_index > s->cfg.rx0_fifo - 1) {
> +                store_index -= s->cfg.rx0_fifo - 1;
> +            }
> +
> +            store_location = R_RB_ID_REGISTER +
> +                          (store_index * NUM_REGS_PER_MSG_SPACE);
> +
> +            store_rx_sequential(s, frame, fill_level, read_index,
> +                                store_location, s->cfg.rx0_fifo, 0,
> +                                filter_index);
> +        } else {
> +            /* RX 1 fill level message */
> +            fill_level = ARRAY_FIELD_EX32(s->regs, RX_FIFO_STATUS_REGISTER,
> +                                          FL_1);
> +            read_index = ARRAY_FIELD_EX32(s->regs, RX_FIFO_STATUS_REGISTER,
> +                                          RI_1);
> +            uint8_t store_index = read_index + fill_level;
> +
> +            if (read_index == s->cfg.rx1_fifo - 1) {
> +                /*
> +                 * When ri is s->cfg.rx1_fifo - 1 i.e. max, it goes cyclic that
> +                 * means we reset the ri to 0x0.
> +                 */
> +                read_index = 0;
> +                ARRAY_FIELD_DP32(s->regs, RX_FIFO_STATUS_REGISTER, RI_1,
> +                                 read_index);
> +            }
> +
> +            if (store_index > s->cfg.rx1_fifo - 1) {
> +                store_index -= s->cfg.rx1_fifo - 1;
> +            }
> +
> +            store_location = R_RB_ID_REGISTER_1 +
> +                          (store_index * NUM_REGS_PER_MSG_SPACE);
> +
> +            store_rx_sequential(s, frame, fill_level, read_index,
> +                                store_location, s->cfg.rx1_fifo, 1,
> +                                filter_index);
> +        }
> +
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));

Another declartion in the middle of a block.


> +        trace_xlnx_canfd_rx_data(path, frame->can_id, frame->can_dlc,
> +                                 frame->flags);
> +        canfd_update_irq(s);
> +    }
> +}
> +
> +static bool tx_ready_check(XlnxVersalCANFDState *s)
> +{
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, SRST)) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to transfer data while"
> +                      " XlnxVersalCANFDState is in reset mode\n", path);
> +
> +        return false;
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN) == 0) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to transfer data while"
> +                      " XlnxVersalCANFDState is in configuration mode."
> +                      " Reset the core so operations can start fresh\n",
> +                      path);
> +        return false;
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SNOOP)) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to transfer data while"
> +                      " XlnxVersalCANFDState is in SNOOP MODE\n",
> +                      path);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void tx_fifo_stamp(XlnxVersalCANFDState *s, uint32_t tb0_regid)
> +{
> +    /*
> +     * If EFC bit in DLC message is set. This means we will store the

", this means"


> +     * event of this transmitted message with time stamp.
> +     */
> +    uint32_t dlc_reg_val = 0;
> +
> +    if (FIELD_EX32(s->regs[tb0_regid + 1], TB0_DLC_REGISTER, EFC)) {
> +        uint8_t dlc_val = FIELD_EX32(s->regs[tb0_regid + 1], TB0_DLC_REGISTER,
> +                                     DLC);
> +        bool fdf_val = FIELD_EX32(s->regs[tb0_regid + 1], TB0_DLC_REGISTER,
> +                                  FDF);
> +        bool brs_val = FIELD_EX32(s->regs[tb0_regid + 1], TB0_DLC_REGISTER,
> +                                  BRS);
> +        uint8_t mm_val = FIELD_EX32(s->regs[tb0_regid + 1], TB0_DLC_REGISTER,
> +                                    MM);
> +        uint8_t fill_level = ARRAY_FIELD_EX32(s->regs,
> +                                              TX_EVENT_FIFO_STATUS_REGISTER,
> +                                              TXE_FL);
> +        uint8_t read_index = ARRAY_FIELD_EX32(s->regs,
> +                                              TX_EVENT_FIFO_STATUS_REGISTER,
> +                                              TXE_RI);
> +        uint8_t store_index = fill_level + read_index;
> +
> +        if ((fill_level) > s->cfg.tx_fifo - 1) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "TX Event Buffer is full."
> +                          " Discarding the message\n");
> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXEOFLW, 1);
> +        } else {
> +            if (read_index == s->cfg.tx_fifo - 1) {
> +                /*
> +                 * When ri is s->cfg.tx_fifo - 1 i.e. max, it goes cyclic that
> +                 * means we reset the ri to 0x0.
> +                 */
> +                read_index = 0;
> +                ARRAY_FIELD_DP32(s->regs, TX_EVENT_FIFO_STATUS_REGISTER, TXE_RI,
> +                                 read_index);
> +            }
> +
> +            if (store_index > s->cfg.tx_fifo - 1) {
> +                store_index -= s->cfg.tx_fifo - 1;
> +            }
> +
> +            uint32_t tx_event_reg0_id = R_TXE_FIFO_TB_ID_REGISTER +
> +                                        (store_index * 2);
> +
> +            /* Store message ID in TX event register*/

Missing space before "*/".

Bounds check assertions useful here again.

> +            s->regs[tx_event_reg0_id] = s->regs[tb0_regid];
> +
> +            uint16_t tx_timestamp = CANFD_TIMER_MAX -
> +                                            ptimer_get_count(s->canfd_timer);
> +
> +            /* Store DLC with time stamp in DLC regs. */
> +            dlc_reg_val = FIELD_DP32(0, TXE_FIFO_TB_DLC_REGISTER, DLC, dlc_val);
> +            dlc_reg_val |= FIELD_DP32(0, TXE_FIFO_TB_DLC_REGISTER, FDF,
> +                                      fdf_val);
> +            dlc_reg_val |= FIELD_DP32(0, TXE_FIFO_TB_DLC_REGISTER, BRS,
> +                                      brs_val);
> +            dlc_reg_val |= FIELD_DP32(0, TXE_FIFO_TB_DLC_REGISTER, ET, 0x3);
> +            dlc_reg_val |= FIELD_DP32(0, TXE_FIFO_TB_DLC_REGISTER, MM, mm_val);
> +            dlc_reg_val |= FIELD_DP32(0, TXE_FIFO_TB_DLC_REGISTER, TIMESTAMP,
> +                                      tx_timestamp);
> +            s->regs[tx_event_reg0_id + 1] = dlc_reg_val;
> +
> +            ARRAY_FIELD_DP32(s->regs, TX_EVENT_FIFO_STATUS_REGISTER, TXE_FL,
> +                             fill_level + 1);
> +        }
> +    }
> +}
> +
> +static void add_id(txid_list **start, uint32_t can_id, uint32_t reg_num)
> +{
> +    txid_list *temp = (txid_list *)malloc(sizeof(txid_list));

Don't use malloc(). Also, don't use a hand-coded linked list.
glib has various data structures that are more sensible than this.
You probably want a GArray for these lists of tx ids.

> +
> +    if (temp == NULL) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Couldn't allocate memory\n",
> +                      __func__);
> +        return;
> +    }
> +
> +    temp->can_id = can_id;
> +    temp->reg_num = reg_num;
> +    temp->next = *start;
> +
> +    *start = temp;
> +}
> +
> +static void swap_ids(txid_list *first, txid_list *second)
> +{
> +    uint32_t temp_can_id = first->can_id;
> +    uint32_t temp_reg_num = first->reg_num;
> +
> +    first->can_id = second->can_id;
> +    first->reg_num = second->reg_num;
> +    second->can_id = temp_can_id;
> +    second->reg_num = temp_reg_num;
> +}
> +
> +/* Sort the data to sent in ascending order. */
> +static void sort_by_id(XlnxVersalCANFDState *s, txid_list **start)
> +{
> +    uint8_t i = 0;
> +    bool swapped = true;
> +
> +    uint32_t reg_num = 0;
> +    uint32_t reg_ready = s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER];
> +
> +    /* First find the messages which are ready for transaction. */
> +    for (i = 0; i < s->cfg.tx_fifo; i++) {
> +        if (reg_ready) {
> +            reg_num = R_TB_ID_REGISTER + (NUM_REGS_PER_MSG_SPACE * i);
> +            add_id(start, s->regs[reg_num], reg_num);
> +        }
> +
> +        reg_ready >>= 1;
> +        s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER] &= ~(1 << i);
> +        s->regs[R_TX_BUFFER_CANCEL_REQUEST_REGISTER] &= ~(1 << i);
> +    }
> +
> +    /* If no data or only one tx data, no need to sort the ids. */
> +    if (*start == NULL || (*start)->next == NULL) {
> +        return;
> +    }
> +
> +    txid_list *temp_a, *temp_b = NULL;
> +
> +    while (swapped) {
> +        swapped = false;
> +        temp_a = *start;
> +
> +        while (temp_a->next != temp_b) {
> +            if (temp_a->can_id > temp_a->next->can_id) {
> +                swap_ids(temp_a, temp_a->next);
> +                swapped = true;
> +            } else if (temp_a->can_id == temp_a->next->can_id) {
> +                /*
> +                 * If two IDs are same we sort them by their index. Lowest index
> +                 * will be transmitted first.
> +                 */
> +                if (temp_a->reg_num > temp_a->next->reg_num) {
> +                    swap_ids(temp_a, temp_a->next);
> +                    swapped = true;
> +                }
> +            }
> +
> +            temp_a = temp_a->next;
> +        }
> +
> +        temp_b = temp_a;
> +    }

Don't implement your own sort routine either. GArrays have a g_array_sort()
which you can pass a suitable comparison function to.

> +}
> +

> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Acceptance filter %dnot enabled\n",
> +                      path, filter_offset + 1);

Missing space before "%d" ?

> +    }
> +
> +    return s->regs[reg_idx];
> +}

> +static uint64_t canfd_trr_reg_prew(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxVersalCANFDState *s = XILINX_CANFD(reg->opaque);
> +
> +    if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SNOOP)) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller is in SNOOP mode."
> +                      "tx_ready_register will stay in reset mode\n", path);

Another missing space here.

> +        return 0;
> +    } else {
> +        return val64;
> +    }
> +}
> +


> +static bool can_xilinx_canfd_receive(CanBusClientState *client)
> +{
> +    XlnxVersalCANFDState *s = container_of(client, XlnxVersalCANFDState,
> +                                           bus_client);
> +
> +    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, SRST)) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller is in reset state.\n",
> +                      path);
> +        return false;
> +    } else if ((ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) == 0) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller is disabled."
> +                      " All incoming messages will be discarded\n", path);

Are these really guest errors? Typically if there's data available but
the device can't receive it because the guest hasn't set it up yet,
that's fine, it just sits in the backend waiting for the guest to
turn on the device.

> +        return false;
> +    } else {
> +        return true;
> +    }
> +}
> +
> +static ssize_t canfd_xilinx_receive(CanBusClientState *client,
> +                                    const qemu_can_frame *buf,
> +                                    size_t buf_size)
> +{
> +    XlnxVersalCANFDState *s = container_of(client, XlnxVersalCANFDState,
> +                                           bus_client);
> +    const qemu_can_frame *frame = buf;
> +
> +    /* Update the status register that we are receiving message*/

Missing space again.

> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, BBSY, 1);
> +
> +    if (buf_size <= 0) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Error in the data received.\n",
> +                      path);
> +        return 0;
> +    }
> +
> +    if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, LBACK)) {
> +        /*
> +         * XlnxVersalCANFDState will not participate in normal bus communication
> +         * and does not receive any messages transmitted by other CAN nodes.
> +         */
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller  is in loopback mode."
> +                      " It will not receive data.\n", path);
> +    } else if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SNOOP)) {
> +        /* Snoop Mode: Just keep the data. no response back. */
> +        update_rx_sequential(s, frame);
> +    } else {
> +        if ((ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP))) {
> +            /*
> +             * XlnxVersalCANFDState is in sleep mode. Any data on bus will bring
> +             * it to the wake up state.
> +             */
> +            canfd_exit_sleep_mode(s);
> +        }
> +
> +        update_rx_sequential(s, frame);
> +    }
> +
> +    /* Message processing done. Update the status back to !busy */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, BBSY, 0);
> +    return 1;
> +}
> +
> +static CanBusClientInfo canfd_xilinx_bus_client_info = {
> +    .can_receive = can_xilinx_canfd_receive,
> +    .receive = canfd_xilinx_receive,
> +};


> +    /* Allocate a new timer. */
> +    s->canfd_timer = ptimer_init(xlnx_versal_canfd_ptimer_cb, s,
> +                                 PTIMER_POLICY_LEGACY);

Don't use PTIMER_POLICY_LEGACY in new code. There's a big
comment in include/hw/ptimer.h explaining the policy value flags.
You should look at the behaviour you want and set the appropriate
flags -- the "legacy" behaviour is never right because it's just
"various bugs kept for backwards compatibility in existing devices".

> +
> +    ptimer_transaction_begin(s->canfd_timer);
> +
> +    ptimer_set_freq(s->canfd_timer, s->cfg.ext_clk_freq);
> +    ptimer_set_limit(s->canfd_timer, CANFD_TIMER_MAX, 1);
> +    ptimer_run(s->canfd_timer, 0);
> +    ptimer_transaction_commit(s->canfd_timer);
> +}

thanks
-- PMM

