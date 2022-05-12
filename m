Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1DF5252DB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:43:11 +0200 (CEST)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBuA-0004rG-Ak
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBp7-0000tQ-G4
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:37:57 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBp5-0005Ed-Kl
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:37:57 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id s30so10774973ybi.8
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oum9eX/zZiO+oz63So6Uw8CsRmiHe4zihiQhkGoJ2Gk=;
 b=Gd1eZTxr5lm7rSL5NDvocvJ6UnAOva7L6GpXcYXcEIz3Pgcg+wWxCNxSlIKgXriz8Z
 MaOW5vGNKk0BM+jN04qkC3lq5fWm8IJmPk7798jzfSsZFv248NE1YbHGfWSYNCiB8E+O
 YuIh47ZfQZz3QY8r0WoB1D/L5bsLEMtbGYyCc7j4V/PI4FoiL+Bg4T31QcXACMPWnIx0
 PhSE2DrlGcBxl/iHrN45Sxe66xprBT9of08m9EzEqpgbExMqzu7i7LuirFpk15biVEMJ
 lkRUcoNBTfuqcWqANtmLJhcWbuEr0wZsZZSQQI4vUfHyiyYwhVDk4Xq4PW5sIJSfHiMD
 rUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oum9eX/zZiO+oz63So6Uw8CsRmiHe4zihiQhkGoJ2Gk=;
 b=AEdVzmL+tSLzVcWIzEdsO7Vy1dDtKTWPu4kW9LYoY1LuF/O0yCBO9jlu22O3utpxHe
 I4jxOIq6v96L8Mm9nobvYYHp/bPiQpE0nX0pSPHoxWI92KTaXcyEZyY8TANb1RRDkAXm
 tpJN8ds7KYrE3tGDKMyyA97Abk1Q9z7slDX7rvKCu7jwwwT3zc0E1FC8wRuWF+uVRS5Y
 brEKGgSBLL2lWtZwVShoOH6lgACIYYNmamd14WR/3UOITxl4GllkG1AZ5dQ2FWIaMg6U
 u7CQomYI9oMxBuEw8C5n5Y0+Wzg3SV7SDwC0Yr1C7rXU+OYdNyFUZNRB3mSPfh3TGHEp
 23uw==
X-Gm-Message-State: AOAM5308nG8FP1msOwSsFkzO8eZAS/jKvcWDry2hqNfNum03hUXnyETW
 4BwAk2zTd15+gEydVWOW7pLe/9oC2fyhcvJ64XxBZQ==
X-Google-Smtp-Source: ABdhPJxOysTz1l31T9+VQuZUibXbI7DHHXGNlFVDfrYIgeIckRRNCSsT3VutTFHxCLuo1DFNG+JbejXYDf4D24d5rbk=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr693607ybu.39.1652373473954; Thu, 12 May
 2022 09:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
 <20220422003656.1648121-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220422003656.1648121-2-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 17:37:43 +0100
Message-ID: <CAFEAcA9i97-N8dwscyZ+dVotitSTptg_5-xoBTZ2JuRn3p5nig@mail.gmail.com>
Subject: Re: [PULL v2 01/31] hw/ssi: Add Ibex SPI device model
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 01:40, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Adds the SPI_HOST device model for ibex. The device specification is as per
> [1]. The model has been tested on opentitan with spi_host unit tests
> written for TockOS.
>
> [1] https://docs.opentitan.org/hw/ip/spi_host/doc/


Hi; Coverity points out a bug in this code (CID 1488107):

> +REG32(STATUS, 0x14)
> +    FIELD(STATUS, TXQD, 0, 8)
> +    FIELD(STATUS, RXQD, 18, 8)

RXQD isn't at the bottom of this register, so the R_STATUS_RXQD_MASK
define is a shifted-up mask...

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

...but here we don't shift div4_round_up(segment_len) up to the
right place before ORing it with the MASK, so Coverity points
out that the result is always zero.

> +    /* Set TXQD */
> +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXQD_MASK;
> +    s->regs[IBEX_SPI_HOST_STATUS] |= (fifo8_num_used(&s->tx_fifo) / 4)
> +                                    & R_STATUS_TXQD_MASK;

This has the same issue, but avoids it by luck because TXQD
does start at bit 0.

Since we're using the FIELD() macros, it would be clearer to
write all this to use FIELD_DP32() rather than manual
bit operations to clear the bits and then OR in the new ones.
(True here and also in what looks like several other places
through out the file, for deposit and extract operations.)

thanks
-- PMM

