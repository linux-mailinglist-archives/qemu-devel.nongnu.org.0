Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6FE470546
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:06:18 +0100 (CET)
Received: from localhost ([::1]:44370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mviPY-0000W0-LH
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:06:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mviM4-0007YW-2L
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:02:40 -0500
Received: from [2a00:1450:4864:20::42c] (port=37543
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mviM1-00077p-W9
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:02:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d9so15717428wrw.4
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 08:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QWdV6YP3+D0qnopkCpQ8PtuVN45xs3KQBsikpklS1Zc=;
 b=NgANQRvs26YvyYHAuog8up/m6KWpF6bvr9/hoeDXQ8KpMdcMtHJlk7csPxvbSrT+Sw
 zu5TOyVzlGylDqHx/If9KX7jb62+tc/SelF0VkzJI22PwCK8cuo/bJpCII+C0cydNJi1
 dKXrJsaP8THwxjq8LcRY5z6HHla6zPqOWhfsywBs6UkrbMw8YFz+Wr4FFL8xyV8wYm5q
 EGwrolpU74OoaMz6NCwRE7tygK/6iLsz88eHIk8UAMmKRfVe/dZDFizjrqCU7ZMxDkxe
 eHEVDu7kKlWxBxFEhG1O9n7WSe/+XT7VP+NdFuy/beOQkRhnOmvUl9dFqM0R6eRp5o7a
 0PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QWdV6YP3+D0qnopkCpQ8PtuVN45xs3KQBsikpklS1Zc=;
 b=VHrEGWZ4ZIUWhxbMUEDDm9NdrjRsKDj53pkwjJ3hzN8GGJwRIxu/Uwcgl0F4HSxPnD
 J3DWkWZDOZvRQ422BVw7NmZpAPdDru6b60yVUKv719VZl0wYpj2WJEJjFyEdZo/SB4i6
 UySL0B/b87tOBfdvaG8lYUsDqYx7b1V03JKJKcD0q62f27KYHQXSNS8LaqXT5zCOPOyu
 0OebDQtkQFNMMTVixVqT6RqAY5/PlC6KKksDQMU/YrKG+ANmXdETfiLBGEEBkVqb38/Q
 FfVGJJnArSCPbW6xSOY6EM95WnI9yxxSMWbX4rQH2eTliQoSpW5Ym3SfUfY8BVQU2xtv
 Cj1Q==
X-Gm-Message-State: AOAM530ZNH79afjXhXr1bw1837ZIPnXA9cT4yYJJ60SSXczlLNmkc6Lb
 7hnMSD4SHqVYV1FTIFht8ELyLNmTkegXlZTVTIbqpQ==
X-Google-Smtp-Source: ABdhPJzufE8f+NAhwq0dVhgQtBa2sXezn08j710X2Nc4oDwvTFjPm0kqqckjEVXTJeW1TFAX4YZGgYvwWmhsHjy3nWs=
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr14844530wrz.87.1639152154219; 
 Fri, 10 Dec 2021 08:02:34 -0800 (PST)
MIME-Version: 1.0
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-7-francisco.iglesias@xilinx.com>
In-Reply-To: <20211201154023.13931-7-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 16:02:22 +0000
Message-ID: <CAFEAcA8JrXkb-aLDDLh17wvtsJbo+G_VkVOoK89=xmX8keoegA@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] hw/ssi: Add a model of Xilinx Versal's OSPI
 flash memory controller
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On Wed, 1 Dec 2021 at 15:40, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Add a model of Xilinx Versal's OSPI flash memory controller.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>



> +#define SZ_512MBIT (512 * 1024 * 1024)
> +#define SZ_1GBIT   (1024 * 1024 * 1024)
> +#define SZ_2GBIT   (2ULL * SZ_1GBIT)
> +#define SZ_4GBIT   (4ULL * SZ_1GBIT)
> +
> +#define IS_IND_DMA_START(op) (op->done_bytes == 0)
> +/*
> + * Bit field size of R_INDIRECT_WRITE_XFER_CTRL_REG_NUM_IND_OPS_DONE_FLD
> + * is 2 bits, which can record max of 3 indac operations.
> + */
> +#define IND_OPS_DONE_MAX 3
> +
> +typedef enum {
> +    WREN = 0x6,
> +} FlashCMD;
> +
> +/* Type to avoid cpu endian byte swaps */
> +typedef union {
> +    uint64_t u64;
> +    uint8_t u8[8];
> +} OSPIRdData;

Don't hand-roll this kind of thing, please. (I'll suggest
code below in the places where you use this union.)

> +static unsigned int single_cs(XlnxVersalOspi *s)
> +{
> +    unsigned int field = ARRAY_FIELD_EX32(s->regs,
> +                                          CONFIG_REG, PERIPH_CS_LINES_FLD);
> +    int i;
> +
> +    /*
> +     * 4'bXXX0 -> 4'b1110
> +     * 4'bXX0X -> 4'b1101
> +     * 4'bX0XX -> 4'b1011

This chart is ambiguous, because 0b1100 matches both the
first two lines, for instance. The code implements
    0bXXX0 -> 0b1110
    0bXX01 -> 0b1101
    0bX011 -> 0b1011
etc

> +     * 4'b0XXX -> 4'b0111
> +     * 4'b1111 -> 4'b1111
> +     */
> +    for (i = 0; i < 4; i++) {
> +        if ((field & (1 << i)) == 0) {
> +            return (~(1 << i)) & 0xF;
> +        }
> +    }
> +    return 0;

The comment says that if the input is 0b1111 then the
output is also 0b1111, but unless I'm misreading the code we
will return 0 in that case. Which is correct ?

Assuming you want 0b1111 input to give 0b1111 output,
you can do this without the loop, like this:

     return (field | ~(field + 1)) & 0xf;

(which uses a variant on the "isolate the rightmost 0-bit"
trick from here:
https://emre.me/computer-science/bit-manipulation-tricks/ )

If you do it that way do add a comment, because it's a bit
obscure :-)




> +static void ospi_rx_fifo_pop_stig_rd_data(XlnxVersalOspi *s)
> +{
> +    int size = ospi_stig_rd_data_len(s);
> +    OSPIRdData res = {};
> +    int i;
> +
> +    size = MIN(fifo8_num_used(&s->rx_fifo), size);

I think I would assert(size <= 8) here; given the size of
the data field that ospi_stig_rd_data_len() reads from it
must be true, but it's not immediately obvious that this
function won't overrun the array so the assert() helps readers.

> +    for (i = 0; i < size; i++) {
> +        res.u8[i] = fifo8_pop(&s->rx_fifo);
> +    }
> +
> +    s->regs[R_FLASH_RD_DATA_LOWER_REG] = res.u64 & 0xFFFFFFFF;
> +    s->regs[R_FLASH_RD_DATA_UPPER_REG] = (res.u64 >> 32) & 0xFFFFFFFF;

This will give different values for these registers depending
on whether the host is big-endian or little-endian, because if
the bytes come out of the FIFO in the order 00 11 22 33 44 55 66 77
then on a BE host res.u64 is 0x0011223344556677 and so
LOWER_REG is 0x44556677, whereas on a LE host res.u64 is
0x7766554433221100 and LOWER_REG is 0x33221100.

Instead of the union:

  uint8_t bytes[8] = {};
  // pop into the bytes array
  s->regs[LOWER_REG] = ldl_le_p(bytes);
  s->regs[UPPER_REG] = ldl_le_p(bytes + 4);

I assume here that the desired behaviour is that if the
bytes come out of the FIFO in the order 00 11 22 33 44 55 66 77 then
LOWER_REG reads 0x33221100 and UPPER_REG 0x77665544.



> +    /* Write out tx_fifo in maximum page sz chunks */
> +    while (!ospi_ind_op_completed(op) && fifo8_num_used(&s->tx_sram) > 0) {
> +        next_b = ind_op_next_byte(op);
> +        end_b = next_b +  MIN(fifo8_num_used(&s->tx_sram), pagesz);
> +
> +        /* Dont cross page boundery */

"boundary"



> +static void ospi_stig_fill_membank(XlnxVersalOspi *s)
> +{
> +    int num_rd_bytes = ospi_stig_membank_rd_bytes(s);
> +    int idx = num_rd_bytes - 8; /* first of last 8 */
> +    uint32_t lower = 0;
> +    uint32_t upper = 0;
> +    int i;
> +
> +    for (i = 0; i < num_rd_bytes; i++) {
> +        s->stig_membank[i] = fifo8_pop(&s->rx_fifo);
> +    }
> +
> +    /* Fill in lower upper regs */
> +    for (i = 0; i < 4; i++) {
> +        lower |= ((uint32_t)s->stig_membank[idx++]) << 8 * i;
> +    }
> +
> +    for (i = 0; i < 4; i++) {
> +        upper |= ((uint32_t)s->stig_membank[idx++]) << 8 * i;
> +    }

You can replace these loops with
     lower = ldl_le_p(s->stig_membank[idx]);
     upper = ldl_le_p(s->stig_membank[idx + 4]);
     idx += 8;

> +    s->regs[R_FLASH_RD_DATA_LOWER_REG] = lower;
> +    s->regs[R_FLASH_RD_DATA_UPPER_REG] = upper;
> +}
> +



> +static uint64_t ospi_rx_sram_read(XlnxVersalOspi *s, unsigned int size)
> +{
> +    OSPIRdData ret = {};
> +    int i;
> +
> +    if (size < 4 && fifo8_num_used(&s->rx_sram) >= 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "OSPI only last read of internal "
> +                      "sram is allowed to be < 32 bits\n");
> +    }
> +
> +    size = MIN(fifo8_num_used(&s->rx_sram), size);
> +    for (i = 0; i < size; i++) {
> +        ret.u8[i] = fifo8_pop(&s->rx_sram);
> +    }
> +    return ret.u64;

Similarly to ospi_rx_fifo_pop_stig_rd_data(), you want to read
into a local uint8_t bytes[8] (and assert about size), but
here because we want a uint64_t rather than two uint32_t we can
   return ldq_le_p(bytes);

> +}
> +
> +static void ospi_tx_sram_write(XlnxVersalOspi *s, uint64_t value,
> +                               unsigned int size)
> +{
> +    int i;
> +    for (i = 0; i < size; i++) {
> +        fifo8_push(&s->tx_sram, value >> 8 * i);
> +    }
> +}
> +
> +static uint64_t ospi_do_dac_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    XlnxVersalOspi *s = XILINX_VERSAL_OSPI(opaque);
> +    OSPIRdData ret = {};
> +    int i;
> +
> +    /* Create first section of read cmd */
> +    ospi_tx_fifo_push_rd_op_addr(s, (uint32_t) addr);
> +
> +    /* Enable cs and transmit first part */
> +    ospi_dac_cs(s, addr);
> +    ospi_flush_txfifo(s);
> +
> +    fifo8_reset(&s->rx_fifo);
> +
> +    /* transmit second part (data) */
> +    for (i = 0; i < size; ++i) {
> +        fifo8_push(&s->tx_fifo, 0);
> +    }
> +    ospi_flush_txfifo(s);
> +
> +    /* fill in result */
> +    size = MIN(fifo8_num_used(&s->rx_fifo), size);
> +
> +    for (i = 0; i < size; i++) {
> +        ret.u8[i] = fifo8_pop(&s->rx_fifo);
> +    }
> +
> +    /* done */
> +    ospi_disable_cs(s);
> +
> +    return ret.u64;

Same as ospi_rx_sram_read().

> +}

> +/* Return dev-obj from reg-region created by register_init_block32 */
> +static XlnxVersalOspi *xilinx_ospi_of_mr(void *mr_accessor)
> +{
> +    RegisterInfoArray *reg_array = mr_accessor;
> +    Object *dev;
> +
> +    assert(reg_array != NULL);

You don't really need to assert() this kind of thing -- if it is
NULL then the code is going to crash immediately on the following
line anyway. assert()s are most useful for turning "weird misbehaviour"
and "something goes wrong a long way away from the point where we
could have detected it" bugs into "crash where it's clear what
the problem is" bugs.

> +
> +    dev = reg_array->mem.owner;
> +    assert(dev);
> +
> +    return XILINX_VERSAL_OSPI(dev);
> +}


This is another device that would benefit from a "QEMU interface"
comment describing the properties/gpios/etc.

> +#ifndef XILINX_VERSAL_OSPI_H
> +#define XILINX_VERSAL_OSPI_H
> +
> +#include "hw/register.h"
> +#include "hw/ssi/ssi.h"
> +#include "qemu/fifo32.h"
> +#include "hw/dma/dma-ctrl-if.h"
> +
> +#define TYPE_XILINX_VERSAL_OSPI "xlnx.versal-ospi"
> +
> +#define XILINX_VERSAL_OSPI(obj) \
> +     OBJECT_CHECK(XlnxVersalOspi, (obj), TYPE_XILINX_VERSAL_OSPI)

Same comment about macros as the other device.

> +
> +#define XILINX_VERSAL_OSPI_R_MAX (0xfc / 4 + 1)

thanks
-- PMM

