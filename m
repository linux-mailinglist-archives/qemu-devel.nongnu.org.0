Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF62D4C227E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 04:42:18 +0100 (CET)
Received: from localhost ([::1]:41382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN51F-0002Sn-DY
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 22:42:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nN4zl-0001mG-9a; Wed, 23 Feb 2022 22:40:45 -0500
Received: from [2607:f8b0:4864:20::12c] (port=34625
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nN4zf-0005FV-N4; Wed, 23 Feb 2022 22:40:42 -0500
Received: by mail-il1-x12c.google.com with SMTP id f2so804125ilq.1;
 Wed, 23 Feb 2022 19:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d8s0otxEOwbalmV6ZWrwKF44+F90kVH8OqOKcpj1vxE=;
 b=kpp66mwgbaGOybXSeP1W8L1VoqtuUbqHfVoAmAGZew+/HzqyKyVOLJHDG+MeQowrce
 fMVzdAbRFDlVYyLAtPiGe7SEa0WE4SNZfneqzNCkPshjxe2vx0poIdkkQ0wx3u8qurrx
 94TZcue2OUDqNXhY9oGO6W+bCJgMBXjRVedPipD1sEU3BzPqA4SIlV4z0og1x7+7RGz5
 oGDNB9Eo0JEou9dprQyYAhwDPzNiMkrNFqnpJmY1PUmRBou/LIR/nLtgh8Lm5go8szBD
 GANvcBinykJepRQnouK5F265hoSmj1rELNXY9uCrRnmic71NI6fsODrdH742seYFv8yE
 3QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d8s0otxEOwbalmV6ZWrwKF44+F90kVH8OqOKcpj1vxE=;
 b=6A5M7SnkTABugMJBWKZdCowxq+GN/xz6Z1ijlG0/YEBx5T3aSt28Im5uGYopoZkgFt
 qEnuqpT2IuEeGwBGddL+VPMnbfQwZxOrUrvpCkyFx0Dq0w2IohPHQ/gCgGCxeSui+/7t
 C+w2mT6VFCbAhiyGgAaJjt/RMhuWazyWZbIUddZ4+di3aHJj4veHzw27jBb+DTYrtjrj
 hKaleSH759RA6f5FwlQ2WkjWOrYsPw5ziCvr89Gs4rpZxYGHoogXVhVAm3nLCh76hWZn
 +ElUXL5vbI/tPn2DNjYzaFRR0hM1ujUI4phdXbROkllvJMeOKhj1I2fyxUP7OhDuyxbK
 cqww==
X-Gm-Message-State: AOAM531EhlhFpA6UavQHLTI9DbJ74GAcEPo2z40py4/q2mJgD310kO3M
 TtgeAqyLYKCXkm6Sm+OONPBovIGpDDmliGs/UQc=
X-Google-Smtp-Source: ABdhPJx88+hJWpF/K2hBpx+fJgv4EKaBMtu/KMwFWdmIpEJY75blWijLd5YRHuHugZhl34G5xKUNTi7PMkIOwBobwOY=
X-Received: by 2002:a05:6e02:1e0b:b0:2be:e272:e5b9 with SMTP id
 g11-20020a056e021e0b00b002bee272e5b9mr658196ila.310.1645674037949; Wed, 23
 Feb 2022 19:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20220222214443.4081039-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220222214443.4081039-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Feb 2022 13:40:10 +1000
Message-ID: <CAKmqyKOLJd1=vOZZzPHQ=DVU1XA0kXengVL3AKvvApAwZ82rqw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] hw/ssi: Add Ibex SPI device model
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, wilfred.mallawa@wdc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 7:45 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Adds the SPI_HOST device model for ibex. The device specification is as per
> [1]. The model has been tested on opentitan with spi_host unit tests
> written for TockOS.
>
> [1] https://docs.opentitan.org/hw/ip/spi_host/doc/
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/ssi/ibex_spi_host.c         | 629 +++++++++++++++++++++++++++++++++
>  hw/ssi/meson.build             |   1 +
>  hw/ssi/trace-events            |   7 +
>  include/hw/ssi/ibex_spi_host.h |  91 +++++
>  4 files changed, 728 insertions(+)
>  create mode 100644 hw/ssi/ibex_spi_host.c
>  create mode 100644 include/hw/ssi/ibex_spi_host.h
>
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> new file mode 100644
> index 0000000000..7343eb0f61
> --- /dev/null
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -0,0 +1,629 @@
> +
> +/*
> + * QEMU model of the Ibex SPI Controller
> + * SPEC Reference: https://docs.opentitan.org/hw/ip/spi_host/doc/
> + *
> + * Copyright (C) 2022 Western Digital
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
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "hw/ssi/ibex_spi_host.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +REG32(INTR_STATE, 0x00)
> +    FIELD(INTR_STATE, ERROR, 0, 1)
> +    FIELD(INTR_STATE, SPI_EVENT, 1, 1)
> +REG32(INTR_ENABLE, 0x04)
> +    FIELD(INTR_ENABLE, ERROR, 0, 1)
> +    FIELD(INTR_ENABLE, SPI_EVENT, 1, 1)
> +REG32(INTR_TEST, 0x08)
> +    FIELD(INTR_TEST, ERROR, 0, 1)
> +    FIELD(INTR_TEST, SPI_EVENT, 1, 1)
> +REG32(ALERT_TEST, 0x0c)
> +    FIELD(ALERT_TEST, FETAL_TEST, 0, 1)
> +REG32(CONTROL, 0x10)
> +    FIELD(CONTROL, RX_WATERMARK, 0, 8)
> +    FIELD(CONTROL, TX_WATERMARK, 1, 8)
> +    FIELD(CONTROL, OUTPUT_EN, 29, 1)
> +    FIELD(CONTROL, SW_RST, 30, 1)
> +    FIELD(CONTROL, SPIEN, 31, 1)
> +REG32(STATUS, 0x14)
> +    FIELD(STATUS, TXQD, 0, 8)
> +    FIELD(STATUS, RXQD, 18, 8)
> +    FIELD(STATUS, CMDQD, 16, 3)
> +    FIELD(STATUS, RXWM, 20, 1)
> +    FIELD(STATUS, BYTEORDER, 22, 1)
> +    FIELD(STATUS, RXSTALL, 23, 1)
> +    FIELD(STATUS, RXEMPTY, 24, 1)
> +    FIELD(STATUS, RXFULL, 25, 1)
> +    FIELD(STATUS, TXWM, 26, 1)
> +    FIELD(STATUS, TXSTALL, 27, 1)
> +    FIELD(STATUS, TXEMPTY, 28, 1)
> +    FIELD(STATUS, TXFULL, 29, 1)
> +    FIELD(STATUS, ACTIVE, 30, 1)
> +    FIELD(STATUS, READY, 31, 1)
> +REG32(CONFIGOPTS, 0x18)
> +    FIELD(CONFIGOPTS, CLKDIV_0, 0, 16)
> +    FIELD(CONFIGOPTS, CSNIDLE_0, 16, 4)
> +    FIELD(CONFIGOPTS, CSNTRAIL_0, 20, 4)
> +    FIELD(CONFIGOPTS, CSNLEAD_0, 24, 4)
> +    FIELD(CONFIGOPTS, FULLCYC_0, 29, 1)
> +    FIELD(CONFIGOPTS, CPHA_0, 30, 1)
> +    FIELD(CONFIGOPTS, CPOL_0, 31, 1)
> +REG32(CSID, 0x1c)
> +    FIELD(CSID, CSID, 0, 32)
> +REG32(COMMAND, 0x20)
> +    FIELD(COMMAND, LEN, 0, 8)
> +    FIELD(COMMAND, CSAAT, 9, 1)
> +    FIELD(COMMAND, SPEED, 10, 2)
> +    FIELD(COMMAND, DIRECTION, 12, 2)
> +REG32(ERROR_ENABLE, 0x2c)
> +    FIELD(ERROR_ENABLE, CMDBUSY, 0, 1)
> +    FIELD(ERROR_ENABLE, OVERFLOW, 1, 1)
> +    FIELD(ERROR_ENABLE, UNDERFLOW, 2, 1)
> +    FIELD(ERROR_ENABLE, CMDINVAL, 3, 1)
> +    FIELD(ERROR_ENABLE, CSIDINVAL, 4, 1)
> +REG32(ERROR_STATUS, 0x30)
> +    FIELD(ERROR_STATUS, CMDBUSY, 0, 1)
> +    FIELD(ERROR_STATUS, OVERFLOW, 1, 1)
> +    FIELD(ERROR_STATUS, UNDERFLOW, 2, 1)
> +    FIELD(ERROR_STATUS, CMDINVAL, 3, 1)
> +    FIELD(ERROR_STATUS, CSIDINVAL, 4, 1)
> +    FIELD(ERROR_STATUS, ACCESSINVAL, 5, 1)
> +REG32(EVENT_ENABLE, 0x30)
> +    FIELD(EVENT_ENABLE, RXFULL, 0, 1)
> +    FIELD(EVENT_ENABLE, TXEMPTY, 1, 1)
> +    FIELD(EVENT_ENABLE, RXWM, 2, 1)
> +    FIELD(EVENT_ENABLE, TXWM, 3, 1)
> +    FIELD(EVENT_ENABLE, READY, 4, 1)
> +    FIELD(EVENT_ENABLE, IDLE, 5, 1)
> +
> +/*
> + * Used to track the init status, for replicating hw `feature`
> + * TXDATA ghost write word at init.
> + */
> +static bool init_status;

This should be part of IbexSPIHostState

> +
> +#ifndef IBEX_SPI_HOST_ERR_DEBUG
> +#define IBEX_SPI_HOST_ERR_DEBUG 0
> +#endif

This is unused, just remove it

> +
> +static inline uint8_t div4_round_up(uint8_t dividend)
> +{
> +    return (dividend + 3) / 4;
> +}
> +
> +static void ibex_spi_rxfifo_reset(IbexSPIHostState *s)
> +{
> +    /* Empty the RX FIFO and assert RXEMPTY */
> +    fifo8_reset(&s->rx_fifo);
> +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXFULL_MASK;
> +    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXEMPTY_MASK;
> +}
> +
> +static void ibex_spi_txfifo_reset(IbexSPIHostState *s)
> +{
> +    /* Empty the TX FIFO and assert TXEMPTY */
> +    fifo8_reset(&s->tx_fifo);
> +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXFULL_MASK;
> +    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_TXEMPTY_MASK;
> +}
> +
> +static void ibex_spi_host_reset(DeviceState *dev)
> +{
> +    trace_ibex_spi_host_reset("Resetting Ibex SPI");

I'd put this below

> +    IbexSPIHostState *s = IBEX_SPI_HOST(dev);

this line

> +
> +    /* SPI Host Register Reset */
> +    s->regs[IBEX_SPI_HOST_INTR_STATE]   = 0x00;
> +    s->regs[IBEX_SPI_HOST_INTR_ENABLE]  = 0x00;
> +    s->regs[IBEX_SPI_HOST_INTR_TEST]    = 0x00;
> +    s->regs[IBEX_SPI_HOST_ALERT_TEST]   = 0x00;
> +    s->regs[IBEX_SPI_HOST_CONTROL]      = 0x7f;
> +    s->regs[IBEX_SPI_HOST_STATUS]       = 0x00;
> +    s->regs[IBEX_SPI_HOST_CONFIGOPTS]   = 0x00;
> +    s->regs[IBEX_SPI_HOST_CSID]         = 0x00;
> +    s->regs[IBEX_SPI_HOST_COMMAND]      = 0x00;
> +    /* RX/TX Modelled by FIFO */
> +    s->regs[IBEX_SPI_HOST_RXDATA]       = 0x00;
> +    s->regs[IBEX_SPI_HOST_TXDATA]       = 0x00;
> +
> +    s->regs[IBEX_SPI_HOST_ERROR_ENABLE] = 0x1F;
> +    s->regs[IBEX_SPI_HOST_ERROR_STATUS] = 0x00;
> +    s->regs[IBEX_SPI_HOST_EVENT_ENABLE] = 0x00;
> +
> +    ibex_spi_rxfifo_reset(s);
> +    ibex_spi_txfifo_reset(s);
> +
> +    return;
> +}
> +
> +/*
> + * Check if we need to trigger an interrupt.
> + * The two interrupts lines (host_err and event) can
> + * be enabled seperately in 'IBEX_SPI_HOST_INTR_ENABLE'.

s/seperately/separately/g

PS: That just means replace the first word with the second, see
https://vimhelp.org/change.txt.html#%3Asubstitute

> + *
> + * Interrupts are triggered based on the ones
> + * enabled in the `IBEX_SPI_HOST_EVENT_ENABLE` and `IBEX_SPI_HOST_ERROR_ENABLE`.
> + */
> +static void ibex_spi_host_irq(IbexSPIHostState *s)
> +{
> +    bool error_en = s->regs[IBEX_SPI_HOST_INTR_ENABLE]
> +                    & R_INTR_ENABLE_ERROR_MASK;
> +    bool event_en = s->regs[IBEX_SPI_HOST_INTR_ENABLE]
> +                    & R_INTR_ENABLE_SPI_EVENT_MASK;
> +    bool err_pending = s->regs[IBEX_SPI_HOST_INTR_STATE]
> +                        & R_INTR_STATE_ERROR_MASK;
> +    bool status_pending = s->regs[IBEX_SPI_HOST_INTR_STATE]
> +                        & R_INTR_STATE_SPI_EVENT_MASK;
> +    int err_irq = 0, event_irq = 0;
> +
> +    /* Error IRQ enabled and Error IRQ Cleared*/
> +    if (error_en && !err_pending) {
> +        /* Event enabled, Interrupt Test Error */
> +        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
> +            err_irq = 1;
> +        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> +                    &  R_ERROR_ENABLE_CMDBUSY_MASK) &&
> +                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> +                    & R_ERROR_STATUS_CMDBUSY_MASK) {
> +            /* Wrote to COMMAND when not READY */
> +            err_irq = 1;
> +        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> +                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
> +                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> +                    & R_ERROR_STATUS_CMDINVAL_MASK) {
> +            /* Invalid command segment */
> +            err_irq = 1;
> +        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> +                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
> +                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> +                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
> +            /* Invalid value for CSID */
> +            err_irq = 1;
> +        }
> +        if (err_irq) {
> +            s->regs[IBEX_SPI_HOST_INTR_STATE] |= R_INTR_STATE_ERROR_MASK;
> +        }
> +        qemu_set_irq(s->host_err, err_irq);
> +    }
> +
> +    /* Event IRQ Enabled and Event IRQ Cleared */
> +    if (event_en && !status_pending) {
> +        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_SPI_EVENT_MASK) {
> +            /* Event enabled, Interrupt Test Event */
> +            event_irq = 1;
> +        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> +                    & R_EVENT_ENABLE_READY_MASK) &&
> +                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK)) {
> +            /* SPI Host ready for next command */
> +            event_irq = 1;
> +        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> +                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
> +                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_TXEMPTY_MASK)) {
> +            /* SPI TXEMPTY, TXFIFO drained */
> +            event_irq = 1;
> +        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> +                    & R_EVENT_ENABLE_RXFULL_MASK) &&
> +                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_RXFULL_MASK)) {
> +            /* SPI RXFULL, RXFIFO  full */
> +            event_irq = 1;
> +        }
> +        if (event_irq) {
> +            s->regs[IBEX_SPI_HOST_INTR_STATE] |= R_INTR_STATE_SPI_EVENT_MASK;
> +        }
> +        qemu_set_irq(s->event, event_irq);
> +    }
> +}
> +
> +static void ibex_spi_host_transfer(IbexSPIHostState *s)
> +{
> +    uint32_t rx, tx;
> +    /* Get num of one byte transfers */
> +    uint8_t segment_len = ((s->regs[IBEX_SPI_HOST_COMMAND] & R_COMMAND_LEN_MASK)
> +                          >> R_COMMAND_LEN_SHIFT);
> +    while (segment_len > 0) {
> +        if (fifo8_is_empty(&s->tx_fifo)) {
> +            /* Assert Stall */
> +            s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_TXSTALL_MASK;
> +            break;
> +        } else if (fifo8_is_full(&s->rx_fifo)) {
> +            /* Assert Stall */
> +            s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXSTALL_MASK;
> +            break;
> +        } else {
> +            tx = fifo8_pop(&s->tx_fifo);
> +        }
> +
> +        rx = ssi_transfer(s->ssi, tx);
> +
> +        trace_ibex_spi_host_transfer(tx, rx);
> +
> +        if (!fifo8_is_full(&s->rx_fifo)) {
> +            fifo8_push(&s->rx_fifo, rx);
> +        } else {
> +            /* Assert RXFULL */
> +            s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXFULL_MASK;
> +        }
> +        --segment_len;
> +    }
> +
> +    /* Assert Ready */
> +    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_READY_MASK;
> +    /* Set RXQD */
> +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXQD_MASK;
> +    s->regs[IBEX_SPI_HOST_STATUS] |= (R_STATUS_RXQD_MASK
> +                                    & div4_round_up(segment_len));
> +    /* Set TXQD */
> +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXQD_MASK;
> +    s->regs[IBEX_SPI_HOST_STATUS] |= (fifo8_num_used(&s->tx_fifo) / 4)
> +                                    & R_STATUS_TXQD_MASK;
> +    /* Clear TXFULL */
> +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXFULL_MASK;
> +    /* Assert TXEMPTY and drop remaining bytes that exceed segment_len */
> +    ibex_spi_txfifo_reset(s);
> +    /* Reset RXEMPTY */
> +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXEMPTY_MASK;
> +
> +    ibex_spi_host_irq(s);
> +}
> +
> +static uint64_t ibex_spi_host_read(void *opaque, hwaddr addr,
> +                                     unsigned int size)
> +{
> +    IbexSPIHostState *s = opaque;
> +    uint32_t rc = 0;
> +    uint8_t rx_byte = 0;
> +
> +    trace_ibex_spi_host_read(addr, size);
> +
> +    if (s == NULL) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Null device state");
> +    }

You can remove this. If s was ever actually NULL this function would
still segfault

> +    /* Match reg index */
> +    addr = addr >> 2;
> +    switch (addr) {
> +    /* Skipping any W/O registers */
> +    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
> +    case IBEX_SPI_HOST_CONTROL...IBEX_SPI_HOST_STATUS:
> +        rc = s->regs[addr];
> +        break;
> +    case IBEX_SPI_HOST_CSID:
> +        rc = s->regs[addr];
> +        break;
> +    case IBEX_SPI_HOST_CONFIGOPTS:
> +        rc = s->config_opts[s->regs[IBEX_SPI_HOST_CSID]];
> +        break;
> +    case IBEX_SPI_HOST_TXDATA:
> +        rc = s->regs[addr];
> +        break;
> +    case IBEX_SPI_HOST_RXDATA:
> +        /* Clear RXFULL */
> +        s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXFULL_MASK;
> +
> +        if (fifo8_is_empty(&s->rx_fifo)) {
> +            /* Assert RXEMPTY, no IRQ */
> +            s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXEMPTY_MASK;
> +            s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=
> +                                                R_ERROR_STATUS_UNDERFLOW_MASK;
> +            return rc;
> +        }

I don't think you need this check, the for loop has the same check
(although it doesn't set R_ERROR_STATUS_UNDERFLOW_MASK)

> +
> +        for (int i = 0; i < 4; ++i) {
> +            if (fifo8_is_empty(&s->rx_fifo)) {
> +                /* Assert RXEMPTY, no IRQ */
> +                s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXEMPTY_MASK;
> +                return rc;
> +            }
> +            rx_byte = fifo8_pop(&s->rx_fifo);
> +            rc |= rx_byte << (i * 8);
> +        }
> +        break;
> +    case IBEX_SPI_HOST_ERROR_ENABLE...IBEX_SPI_HOST_EVENT_ENABLE:
> +        rc = s->regs[addr];
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "Bad offset 0x%" HWADDR_PRIx "\n",
> +                      addr << 2);
> +    }
> +    return rc;
> +}
> +
> +
> +static void ibex_spi_host_write(void *opaque, hwaddr addr,
> +                                uint64_t val64, unsigned int size)
> +{
> +    IbexSPIHostState *s = opaque;
> +    uint32_t val32 = val64;
> +    uint32_t shift_mask = 0xff;
> +    uint8_t txqd_len;
> +
> +    trace_ibex_spi_host_write(addr, size, val64);
> +
> +    if (s == NULL) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Null device state");
> +    }

Same here

> +    /* Match reg index */
> +    addr = addr >> 2;
> +
> +    switch (addr) {
> +    /* Skipping any R/O registers */
> +    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
> +        s->regs[addr] = val32;
> +        break;
> +    case IBEX_SPI_HOST_INTR_TEST:
> +        s->regs[addr] = val32;
> +        ibex_spi_host_irq(s);
> +        break;
> +    case IBEX_SPI_HOST_ALERT_TEST:
> +        s->regs[addr] = val32;
> +        qemu_log_mask(LOG_UNIMP,
> +                        "%s: SPI_ALERT_TEST is not supported\n", __func__);
> +        break;
> +    case IBEX_SPI_HOST_CONTROL:
> +        s->regs[addr] = val32;
> +
> +        if (val32 & R_CONTROL_SW_RST_MASK)  {
> +            ibex_spi_host_reset((DeviceState *)s);
> +            /* Clear active if any */
> +            s->regs[IBEX_SPI_HOST_STATUS] &=  ~R_STATUS_ACTIVE_MASK;
> +        }
> +
> +        if (val32 & R_CONTROL_OUTPUT_EN_MASK)  {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: CONTROL_OUTPUT_EN is not supported\n", __func__);
> +        }
> +        break;
> +    case IBEX_SPI_HOST_CONFIGOPTS:
> +        /* Update the respective config-opts register based on CSIDth index */
> +        s->config_opts[s->regs[IBEX_SPI_HOST_CSID]] = val32;
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: CONFIGOPTS Hardware settings not supported\n",
> +                         __func__);
> +        break;
> +    case IBEX_SPI_HOST_CSID:
> +        if (val32 >= s->num_cs) {
> +            /* CSID exceeds max num_cs */
> +            s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=
> +                                                R_ERROR_STATUS_CSIDINVAL_MASK;
> +            ibex_spi_host_irq(s);
> +            return;
> +        }
> +        s->regs[addr] = val32;
> +        break;
> +    case IBEX_SPI_HOST_COMMAND:
> +        s->regs[addr] = val32;
> +
> +        /* STALL, IP not enabled */
> +        if (!(s->regs[IBEX_SPI_HOST_CONTROL] & R_CONTROL_SPIEN_MASK)) {
> +            return;
> +        }
> +
> +        /* SPI not ready, IRQ Error */
> +        if (!(s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK)) {
> +            s->regs[IBEX_SPI_HOST_ERROR_STATUS] |= R_ERROR_STATUS_CMDBUSY_MASK;
> +            ibex_spi_host_irq(s);
> +            return;
> +        }
> +        /* Assert Not Ready */
> +        s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_READY_MASK;
> +
> +        if (((val32 & R_COMMAND_DIRECTION_MASK) >> R_COMMAND_DIRECTION_SHIFT)
> +            != BIDIRECTIONAL_TRANSFER) {
> +                qemu_log_mask(LOG_UNIMP,
> +                          "%s: Rx Only/Tx Only are not supported\n", __func__);
> +        }
> +
> +        if (val32 & R_COMMAND_CSAAT_MASK)  {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: CSAAT is not supported\n", __func__);
> +        }
> +        if (val32 & R_COMMAND_SPEED_MASK)  {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: SPEED is not supported\n", __func__);
> +        }
> +
> +        /* Set Transfer Callback */
> +        timer_mod(s->fifo_trigger_handle,
> +                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +                    (TX_INTERRUPT_TRIGGER_DELAY_NS));
> +
> +        break;
> +    case IBEX_SPI_HOST_TXDATA:
> +        /*
> +         * This is a hardware `feature` where
> +         * the first word written TXDATA after init is omitted entirely
> +         */
> +        if (init_status) {
> +            init_status = false;
> +            return;
> +        }
> +
> +        for (int i = 0; i < 4; ++i) {
> +            /* Attempting to write when TXFULL */
> +            if (fifo8_is_full(&s->tx_fifo)) {
> +                /* Assert RXEMPTY, no IRQ */
> +                s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_TXFULL_MASK;
> +                s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=
> +                                                 R_ERROR_STATUS_OVERFLOW_MASK;
> +                ibex_spi_host_irq(s);
> +                return;
> +            }
> +            /* Byte ordering is set by the IP */
> +            if ((s->regs[IBEX_SPI_HOST_STATUS] &
> +                R_STATUS_BYTEORDER_MASK) == 0) {
> +                /* LE: LSB transmitted first (default for ibex processor) */
> +                shift_mask = 0xff << (i * 8);
> +            } else {
> +                /* BE: MSB transmitted first */
> +                qemu_log_mask(LOG_UNIMP,
> +                             "%s: Big endian is not supported\n", __func__);
> +            }
> +
> +            fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i * 8));
> +        }
> +
> +        /* Reset TXEMPTY */
> +        s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXEMPTY_MASK;
> +        /* Update TXQD */
> +        txqd_len = (s->regs[IBEX_SPI_HOST_STATUS] &
> +                    R_STATUS_TXQD_MASK) >> R_STATUS_TXQD_SHIFT;
> +        /* Partial bytes (size < 4) are padded, in words. */
> +        txqd_len += 1;
> +        s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXQD_MASK;
> +        s->regs[IBEX_SPI_HOST_STATUS] |= txqd_len;
> +        /* Assert Ready */
> +        s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_READY_MASK;
> +        break;
> +    case IBEX_SPI_HOST_ERROR_ENABLE:
> +        s->regs[addr] = val32;
> +
> +        if (val32 & R_ERROR_ENABLE_CMDINVAL_MASK)  {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: Segment Length is not supported\n", __func__);
> +        }
> +        break;
> +    case IBEX_SPI_HOST_ERROR_STATUS:
> +    /*
> +     *  Indicates that any errors that have occurred.
> +     *  When an error occurs, the corresponding bit must be cleared
> +     *  here before issuing any further commands
> +     */
> +        s->regs[addr] = val32;
> +        break;
> +    case IBEX_SPI_HOST_EVENT_ENABLE:
> +    /* Controls which classes of SPI events raise an interrupt. */
> +        s->regs[addr] = val32;
> +
> +        if (val32 & R_EVENT_ENABLE_RXWM_MASK)  {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: RXWM is not supported\n", __func__);
> +        }
> +        if (val32 & R_EVENT_ENABLE_TXWM_MASK)  {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: TXWM is not supported\n", __func__);
> +        }
> +
> +        if (val32 & R_EVENT_ENABLE_IDLE_MASK)  {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: IDLE is not supported\n", __func__);
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "Bad offset 0x%" HWADDR_PRIx "\n",
> +                      addr << 2);
> +    }
> +}
> +
> +static const MemoryRegionOps ibex_spi_ops = {
> +    .read = ibex_spi_host_read,
> +    .write = ibex_spi_host_write,
> +    /* Ibex default LE */
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static Property ibex_spi_properties[] = {
> +    DEFINE_PROP_UINT8("num_cs", IbexSPIHostState, num_cs, 1),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static const VMStateDescription vmstate_ibex = {
> +    .name = TYPE_IBEX_SPI_HOST,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_TIMER_PTR(fifo_trigger_handle, IbexSPIHostState),

You should have all members of IbexSPIHostState listed here

Alistair

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void fifo_trigger_update(void *opaque)
> +{
> +    IbexSPIHostState *s = opaque;
> +    ibex_spi_host_transfer(s);
> +}
> +
> +static void ibex_spi_host_realize(DeviceState *dev, Error **errp)
> +{
> +    IbexSPIHostState *s = IBEX_SPI_HOST(dev);
> +    int i;
> +
> +    s->ssi = ssi_create_bus(dev, "ssi");
> +    s->cs_lines = g_new0(qemu_irq, s->num_cs);
> +
> +    for (i = 0; i < s->num_cs; ++i) {
> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
> +    }
> +
> +    /* Setup CONFIGOPTS Multi-register */
> +    s->config_opts = malloc(sizeof(uint32_t) * s->num_cs);
> +
> +    /* Setup FIFO Interrupt Timer */
> +    s->fifo_trigger_handle = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                          fifo_trigger_update, s);
> +
> +    /* FIFO sizes as per OT Spec */
> +    fifo8_create(&s->tx_fifo, IBEX_SPI_HOST_TXFIFO_LEN);
> +    fifo8_create(&s->rx_fifo, IBEX_SPI_HOST_RXFIFO_LEN);
> +}
> +
> +static void ibex_spi_host_init(Object *obj)
> +{
> +    IbexSPIHostState *s = IBEX_SPI_HOST(obj);
> +
> +    init_status = true;
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->host_err);
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->event);
> +
> +    memory_region_init_io(&s->mmio, obj, &ibex_spi_ops, s,
> +                          TYPE_IBEX_SPI_HOST, 0x1000);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +}
> +
> +static void ibex_spi_host_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->realize = ibex_spi_host_realize;
> +    dc->reset = ibex_spi_host_reset;
> +    dc->vmsd = &vmstate_ibex;
> +    device_class_set_props(dc, ibex_spi_properties);
> +}
> +
> +static const TypeInfo ibex_spi_host_info = {
> +    .name          = TYPE_IBEX_SPI_HOST,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(IbexSPIHostState),
> +    .instance_init = ibex_spi_host_init,
> +    .class_init    = ibex_spi_host_class_init,
> +};
> +
> +static void ibex_spi_host_register_types(void)
> +{
> +    type_register_static(&ibex_spi_host_info);
> +}
> +
> +type_init(ibex_spi_host_register_types)
> diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
> index 0ded9cd092..702aa5e4df 100644
> --- a/hw/ssi/meson.build
> +++ b/hw/ssi/meson.build
> @@ -10,3 +10,4 @@ softmmu_ss.add(when: 'CONFIG_XILINX_SPIPS', if_true: files('xilinx_spips.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-ospi.c'))
>  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_spi.c'))
>  softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_spi.c'))
> +softmmu_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
> diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> index 612d3d6087..c707d4aaba 100644
> --- a/hw/ssi/trace-events
> +++ b/hw/ssi/trace-events
> @@ -20,3 +20,10 @@ npcm7xx_fiu_ctrl_read(const char *id, uint64_t addr, uint32_t data) "%s offset:
>  npcm7xx_fiu_ctrl_write(const char *id, uint64_t addr, uint32_t data) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
>  npcm7xx_fiu_flash_read(const char *id, int cs, uint64_t addr, unsigned int size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: 0x%" PRIx64
>  npcm7xx_fiu_flash_write(const char *id, unsigned cs, uint64_t addr, unsigned int size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: 0x%" PRIx64
> +
> +# ibex_spi_host.c
> +
> +ibex_spi_host_reset(const char *msg) "%s"
> +ibex_spi_host_transfer(uint32_t tx_data, uint32_t rx_data) "tx_data: 0x%" PRIx32 " rx_data: @0x%" PRIx32
> +ibex_spi_host_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
> +ibex_spi_host_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size %u:"
> diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_host.h
> new file mode 100644
> index 0000000000..78d24fc89e
> --- /dev/null
> +++ b/include/hw/ssi/ibex_spi_host.h
> @@ -0,0 +1,91 @@
> +
> +/*
> + * QEMU model of the Ibex SPI Controller
> + * SPEC Reference: https://docs.opentitan.org/hw/ip/spi_host/doc/
> + *
> + * Copyright (C) 2022 Western Digital
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
> +#ifndef IBEX_SPI_HOST_H
> +#define IBEX_SPI_HOST_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/hw.h"
> +#include "hw/ssi/ssi.h"
> +#include "qemu/fifo8.h"
> +#include "qom/object.h"
> +#include "hw/registerfields.h"
> +#include "qemu/timer.h"
> +
> +#define TYPE_IBEX_SPI_HOST "ibex-spi"
> +#define IBEX_SPI_HOST(obj) \
> +    OBJECT_CHECK(IbexSPIHostState, (obj), TYPE_IBEX_SPI_HOST)
> +
> +/* SPI Registers */
> +#define IBEX_SPI_HOST_INTR_STATE         (0x00 / 4)  /* rw */
> +#define IBEX_SPI_HOST_INTR_ENABLE        (0x04 / 4)  /* rw */
> +#define IBEX_SPI_HOST_INTR_TEST          (0x08 / 4)  /* wo */
> +#define IBEX_SPI_HOST_ALERT_TEST         (0x0c / 4)  /* wo */
> +#define IBEX_SPI_HOST_CONTROL            (0x10 / 4)  /* rw */
> +#define IBEX_SPI_HOST_STATUS             (0x14 / 4)  /* ro */
> +#define IBEX_SPI_HOST_CONFIGOPTS         (0x18 / 4)  /* rw */
> +#define IBEX_SPI_HOST_CSID               (0x1c / 4)  /* rw */
> +#define IBEX_SPI_HOST_COMMAND            (0x20 / 4)  /* wo */
> +/* RX/TX Modelled by FIFO */
> +#define IBEX_SPI_HOST_RXDATA             (0x24 / 4)
> +#define IBEX_SPI_HOST_TXDATA             (0x28 / 4)
> +
> +#define IBEX_SPI_HOST_ERROR_ENABLE       (0x2c / 4)  /* rw */
> +#define IBEX_SPI_HOST_ERROR_STATUS       (0x30 / 4)  /* rw */
> +#define IBEX_SPI_HOST_EVENT_ENABLE       (0x34 / 4)  /* rw */
> +
> +/* FIFO Len in Bytes */
> +#define IBEX_SPI_HOST_TXFIFO_LEN         288
> +#define IBEX_SPI_HOST_RXFIFO_LEN         256
> +
> +/*  Max Register (Based on addr) */
> +#define IBEX_SPI_HOST_MAX_REGS           (IBEX_SPI_HOST_EVENT_ENABLE + 1)
> +
> +/* MISC */
> +#define TX_INTERRUPT_TRIGGER_DELAY_NS    100
> +#define BIDIRECTIONAL_TRANSFER           3
> +
> +typedef struct {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion mmio;
> +    uint32_t regs[IBEX_SPI_HOST_MAX_REGS];
> +    /* Multi-reg that sets config opts per CS */
> +    uint32_t *config_opts;
> +    Fifo8 rx_fifo;
> +    Fifo8 tx_fifo;
> +    QEMUTimer *fifo_trigger_handle;
> +
> +    qemu_irq event;
> +    qemu_irq host_err;
> +    uint8_t num_cs;
> +    qemu_irq *cs_lines;
> +    SSIBus *ssi;
> +} IbexSPIHostState;
> +
> +#endif
> --
> 2.35.1
>

