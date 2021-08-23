Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF73F4557
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 08:54:47 +0200 (CEST)
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI3r4-0003jd-AZ
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 02:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3pd-0002ok-V9; Mon, 23 Aug 2021 02:53:17 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3pc-00034Q-Fx; Mon, 23 Aug 2021 02:53:17 -0400
Received: by mail-io1-xd2f.google.com with SMTP id a15so20506192iot.2;
 Sun, 22 Aug 2021 23:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uO2Mp78lySxPx+yK9SJCUMucZmEqrJNQe0KMLuRtxLk=;
 b=Lpmufmh5yEIn/y82poP9By+pOOUkw6RI4uHUpUKUpw4NHUqnWODG9UNeZs4541IQLz
 eQ4zuW4jTEA/MccMnCwpzv3tINKUpElgzVJaQDwzEV6T9oEpOXrMaideJEl9L9TPoT7y
 AgtRXNl3UVXTMxEvg/zkpqVYQNL9FSE+xivCPZVCM+y7I1ctfqBe0yPkjRs0QnCAITb5
 HZZfZZliKZRIrnRScYtXiV99IxW6a+SEhz8ZDaNhel6vPXO1zy60fkWrvW8ZZ68dRmUo
 ZAlwQRHmfL54HcQj3B/1OCBmSVAeP5Cftn2V/yotzfg4Cc30pnwrIvcdXkZwqH9nH2kF
 VqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uO2Mp78lySxPx+yK9SJCUMucZmEqrJNQe0KMLuRtxLk=;
 b=E7f65uNa1P1el8IGULPdZ3GqwofuScBrR6IIYOeMX39fMIRyWoyRD8BW2T25fPOq7m
 GyENwUTwI0a+N+Eq8W5686SK+UVgBvyL4BLgv7cmdoTdBEMn6oonziKd1FmsXd/slYrs
 y7p7xeKWFHL9SYvXGljbQm+yFGgjhzxr+gWb5aMnOsNp7gMOj7VnUbLsjNNgCP1PYGcV
 QxB0Yz55YLdqo7AhtZWq66zXpK8NDSihX0WJG3yZRKIE4K1UOrdBC39ow8MxWyeiPxhF
 FM4fVH1pqp+r5H7B2lJkbe7L0mz3V1CoL8awU7k8UHZCSj83ymSDhQmykmTsZW5Wax5C
 s7rA==
X-Gm-Message-State: AOAM531ufZxFAp7Y9/1y9arZG0XszJGZYI4xTLLa7iJYiDLnVSXhDAGc
 Gk/MRbSCBbslXkHLq+s2PNwrLfZ6V5+Vhu0003s=
X-Google-Smtp-Source: ABdhPJxes55yqoi+i1w7wEXrje5AHvkPYwM/O/hB7eXXgtLFrEMY3chijg83I6zjqp/prKXatcVZUAVqE/GGDkmC07E=
X-Received: by 2002:a05:6602:3c5:: with SMTP id g5mr920298iov.42.1629701594959; 
 Sun, 22 Aug 2021 23:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
 <CAKmqyKMzq-F=MYMA=_7MeLTodxY7Eo91Nta4nKuncvAZ=bQUOQ@mail.gmail.com>
 <CAEUhbmUscqN-8fe2BwJ3dRN63fJd5qVPQnnM+ifm5qjt1pPdhw@mail.gmail.com>
In-Reply-To: <CAEUhbmUscqN-8fe2BwJ3dRN63fJd5qVPQnnM+ifm5qjt1pPdhw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 16:52:48 +1000
Message-ID: <CAKmqyKN3WnF6iNTYOCJ9o71TurwUtu7yMD4MKpQfEbi8Hy2-qA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 2:53 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Aug 23, 2021 at 12:43 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Aug 23, 2021 at 12:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > At present when input clock is disabled, any character transmitted
> > > to tx fifo can still show on the serial line, which is wrong.
> > >
> > > Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > > ---
> > >
> > >  hw/char/cadence_uart.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > > index b4b5e8a3ee..154be34992 100644
> > > --- a/hw/char/cadence_uart.c
> > > +++ b/hw/char/cadence_uart.c
> > > @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
> > >  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
> > >                                 int size)
> > >  {
> > > +    /* ignore characters when unclocked or in reset */
> > > +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> > > +        return;
> > > +    }
> >
> > Should we log a guest error here?
> >
>
> Not sure. Based on my past experience of many hardware, if the input
> clock is disabled, accessing the whole register block might cause a
> bus fault. But I believe such bus fault is not modeled in QEMU.
>
> This change just mirrors the same check on the Rx side.

Ok:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Regards,
> Bin

