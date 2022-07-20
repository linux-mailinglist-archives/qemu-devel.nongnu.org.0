Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5485157B06C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 07:39:29 +0200 (CEST)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE2Qi-0007fZ-0p
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 01:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oE2Lb-0003mx-Nt
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 01:34:11 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oE2LZ-0001Fk-Hl
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 01:34:11 -0400
Received: by mail-pj1-x102a.google.com with SMTP id a15so16787493pjs.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 22:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q3oxHjFsJq59yExp+vfvKd9OvZ0/oHWlWFdCIlYG54U=;
 b=W4mgtbLGyA6RaNpC6zvhJCWeSznkgcsSTL9KD0wMbiKa0wH4M6kHA8Ghxpq6Q1Y0wq
 YVN9NHNI9NrbJHstnRWghmWEwuS3ZLTtdjYIhWgSnOHzOC43SGJ27u97WfbHd13YeSIJ
 w/Pg/urPcDFwycXxcsdib8gW4BIjhZRkdF4JTQLWcUK5+55TLSQQdwxYh18lpuDHB8U5
 s/r66/EyNHc8ZHiCaDc9HRa8rN+1mq7N8anaA/k+Jf+ad0Ap0X6Qb+Mc53p1+Mfn6Rlz
 rhJLw7DWZsZFTwLzb6oIEZEATt5xzLAdIqcYJHhQ4G3vpRL7/TzsTPq4hDI5Ab2crZAK
 elqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q3oxHjFsJq59yExp+vfvKd9OvZ0/oHWlWFdCIlYG54U=;
 b=HnHyfEYa6ervyzMx1a1l/SH5r2oA+WyguCgdSzHEIwtGI6K9/Ww9kx6Y+yv0zxVqbw
 jtiGeb68EDrEim2FvjhNRYyoXw+aMHj+yZP8G150t4p6Y0Yqmw1Q0h6YA3aZj029KaId
 HN3R93C0sFj3G9wKufrpzwyaul8XgfNp0MFZKH3DENk8q/veRgWS8zWxecy5dRMfJg1o
 ObSTYtYZRZdfO3lHaTY+oPY93pXc2M3cnZZ9ffaeII7dIYcvc8u/AQKaaRz2dLaIc9FD
 2+sb6Qxi8cXey9wMy2qIZ08q8SawVgmpCwQocneyc30oJtWcA3UuF2+QCuB/pXbrYKAn
 gIUQ==
X-Gm-Message-State: AJIora+pMmIoGfOpv+AIAizLKdOt9RXyVsRG1/1PgTpMDl8l/rBouRrW
 fnONC2ImK4tYA5Wb8mpX9qwbSqGjL+C7oT9/6vY=
X-Google-Smtp-Source: AGRyM1u+ETvdDu/zHgHvTc4CsNariXyyYWFP0bvC9K6TvKELNlgVd2p58cKAuTYu5QQmY+839D6nNpkboXIraSON1Q8=
X-Received: by 2002:a17:902:e5d1:b0:16b:ece4:79e6 with SMTP id
 u17-20020a170902e5d100b0016bece479e6mr37336857plf.83.1658295248133; Tue, 19
 Jul 2022 22:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
 <20220422003656.1648121-2-alistair.francis@opensource.wdc.com>
 <CAFEAcA9i97-N8dwscyZ+dVotitSTptg_5-xoBTZ2JuRn3p5nig@mail.gmail.com>
In-Reply-To: <CAFEAcA9i97-N8dwscyZ+dVotitSTptg_5-xoBTZ2JuRn3p5nig@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Jul 2022 15:33:41 +1000
Message-ID: <CAKmqyKMbj-105F+VqqD52Z6xP7Tw77rC10PxsJ=o8cL274b-eQ@mail.gmail.com>
Subject: Re: [PULL v2 01/31] hw/ssi: Add Ibex SPI device model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, May 13, 2022 at 2:37 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 22 Apr 2022 at 01:40, Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> >
> > Adds the SPI_HOST device model for ibex. The device specification is as per
> > [1]. The model has been tested on opentitan with spi_host unit tests
> > written for TockOS.
> >
> > [1] https://docs.opentitan.org/hw/ip/spi_host/doc/
>
>
> Hi; Coverity points out a bug in this code (CID 1488107):
>
> > +REG32(STATUS, 0x14)
> > +    FIELD(STATUS, TXQD, 0, 8)
> > +    FIELD(STATUS, RXQD, 18, 8)
>
> RXQD isn't at the bottom of this register, so the R_STATUS_RXQD_MASK
> define is a shifted-up mask...
>
> > +static void ibex_spi_host_transfer(IbexSPIHostState *s)
> > +{
> > +    uint32_t rx, tx;
> > +    /* Get num of one byte transfers */
> > +    uint8_t segment_len = ((s->regs[IBEX_SPI_HOST_COMMAND] & R_COMMAND_LEN_MASK)
> > +                          >> R_COMMAND_LEN_SHIFT);
> > +    while (segment_len > 0) {
> > +        if (fifo8_is_empty(&s->tx_fifo)) {
> > +            /* Assert Stall */
> > +            s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_TXSTALL_MASK;
> > +            break;
> > +        } else if (fifo8_is_full(&s->rx_fifo)) {
> > +            /* Assert Stall */
> > +            s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXSTALL_MASK;
> > +            break;
> > +        } else {
> > +            tx = fifo8_pop(&s->tx_fifo);
> > +        }
> > +
> > +        rx = ssi_transfer(s->ssi, tx);
> > +
> > +        trace_ibex_spi_host_transfer(tx, rx);
> > +
> > +        if (!fifo8_is_full(&s->rx_fifo)) {
> > +            fifo8_push(&s->rx_fifo, rx);
> > +        } else {
> > +            /* Assert RXFULL */
> > +            s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXFULL_MASK;
> > +        }
> > +        --segment_len;
> > +    }
> > +
> > +    /* Assert Ready */
> > +    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_READY_MASK;
> > +    /* Set RXQD */
> > +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXQD_MASK;
> > +    s->regs[IBEX_SPI_HOST_STATUS] |= (R_STATUS_RXQD_MASK
> > +                                    & div4_round_up(segment_len));
>
> ...but here we don't shift div4_round_up(segment_len) up to the
> right place before ORing it with the MASK, so Coverity points
> out that the result is always zero.
>
> > +    /* Set TXQD */
> > +    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXQD_MASK;
> > +    s->regs[IBEX_SPI_HOST_STATUS] |= (fifo8_num_used(&s->tx_fifo) / 4)
> > +                                    & R_STATUS_TXQD_MASK;
>
> This has the same issue, but avoids it by luck because TXQD
> does start at bit 0.
>
> Since we're using the FIELD() macros, it would be clearer to
> write all this to use FIELD_DP32() rather than manual
> bit operations to clear the bits and then OR in the new ones.
> (True here and also in what looks like several other places
> through out the file, for deposit and extract operations.)

Thanks Peter,

Wilfred is looking into it and should be sending patches soon.

Alistair

>
> thanks
> -- PMM

