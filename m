Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F621EC194
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 20:04:11 +0200 (CEST)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgBGj-0007gV-RA
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 14:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jgBFt-0007Bd-FM; Tue, 02 Jun 2020 14:03:17 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:33161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jgBFs-0003MK-74; Tue, 02 Jun 2020 14:03:17 -0400
Received: by mail-io1-xd41.google.com with SMTP id k18so11850838ion.0;
 Tue, 02 Jun 2020 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tot7BqAZgE26wisKNZH8IiM145nTTs7/T+hwQ7OlKjE=;
 b=rqeEW7pc9xcjTf1gLFxidKjq06VJj0Ds3D+Y+Qk+tLHMQrtHn0IbQxl32sgr5G4JVU
 1Wb40DE/oggs0nG2+tnxy6fwAHA4JXniQXJAbeVoyuOmbpxTYOhARzTnInwlaPz6KSM0
 IRNDulMffiLOl/2/3Eh7IFTSxzkQJ+v1xlMIBVU8QBndXcCjtxipbnyzG8f2dYnN0X7r
 JyZ29EmUcKcZ33JfZ8F11dhVLXVkXMrocNCPYgnfl2f/bz325LIRD07cl69aJxOpRJIy
 D1jjAsnvrvMYrv4OUtlV1woOJnKqsMOXYNCPgtZEGzwAWsdIXkVRIs7dJEzLsRAT1F/x
 C/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tot7BqAZgE26wisKNZH8IiM145nTTs7/T+hwQ7OlKjE=;
 b=FiLI4vwk9gvgyU4LBhiXAJ7Q2p05ui0LQNIzsh9ZQRceDGYKQoWljcYLnErX756Yji
 Zqt6QRoJl74MPeKSjHVGByI1DARBWK9SOYwau3QJwnRBE43zHKBPQfDaHVUEZqK3uuFB
 2iZJSJdxtoQa7VyIbuzOSjUU9EnjrJIeetetQPENcl8vRyfKukUwTJzA9CN4OuqCr1Lm
 L7fgQ78q0lawCJHYRNxu7C3f0AaWIH7Y4GSKd04niE9neRJsSHLLmyZ+eXjj9pEokrSw
 gbrLYv8AX2oR63TZg1Y6iT7d2WqnKek0v9rrXMeqjpObnq/aGMzBihm9ikhubPnR73rf
 SwYQ==
X-Gm-Message-State: AOAM533QJZFPL0eWu8SFeA/G0UIqasUzGTNb3tSqN946pj7T1gobuK/E
 Y7ky2LAno59wb235VYU85Wk1QyoIU9y/mD0qABg=
X-Google-Smtp-Source: ABdhPJxHEkWNFo1ROa44jo8Qwo2YrTPcqDCtdJdWDKukGul7jF6rmmEmZMVUwV4fIp+DO+n/WJva72EohPGu1FSEqn0=
X-Received: by 2002:a6b:6a13:: with SMTP id x19mr458540iog.175.1591120994848; 
 Tue, 02 Jun 2020 11:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590704015.git.alistair.francis@wdc.com>
 <73cce2d0edd0d41ba15df403a2096bfa70bf0565.1590704015.git.alistair.francis@wdc.com>
 <cc1a1671-b926-bb31-1ed2-d2920f0faf38@c-sky.com>
 <c9f16143-4e9b-a3a8-ffd3-12d43fd2e343@c-sky.com>
In-Reply-To: <c9f16143-4e9b-a3a8-ffd3-12d43fd2e343@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jun 2020 10:54:05 -0700
Message-ID: <CAKmqyKM6rigjbDoFh0bfq8gJXJ=+H+onh=DXjCzhAijMCvR16Q@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] hw/char: Initial commit of Ibex UART
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 2, 2020 at 5:28 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Hi Alistair,
>
> There are still some questions I don't understand.
>
> 1. Is the baud rate  or fifo a necessary feature to simulate?
> As you can see, qemu_chr_fe_write will send the byte as soon as possible.
> When you want to transmit a byte through WDATA,  you can call
> qemu_chr_fe_write directly.

So qemu_chr_fe_write() will send the data straight away. This doesn't
match what teh hardware does though. So by modelling a FIFO and a
delay in sending we can better match the hardware.

>
> 2.  The baud rate calculation method is not strictly right.
> I think when a byte write to FIFO,  char_tx_time * 8 is the correct time
> to send the byte instead of
> char_tx_time * 4.

Do you mind explaining why 8 is correct instead of 4?

>
> 3.  Why add a watch here?

This is based on the Cadence UART implementation in QEMU (which does
the same thing). This will trigger a callback when we can write more
data or when the backend has hung up.

Alistair

> > +        s->uart_status |= UART_STATUS_TXEMPTY;
> > +        s->uart_intr_state |= INTR_STATE_TX_EMPTY;
> > +        s->uart_intr_state &= ~INTR_STATE_TX_WATERMARK;
> > +        ibex_uart_update_irqs(s);
> > +        return FALSE;
> > +    }
> > +
> > +    ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_level);
> > +
> > +    if (ret >= 0) {
> > +        s->tx_level -= ret;
> > +        memmove(s->tx_fifo, s->tx_fifo + ret, s->tx_level);
> > +    }
> > +
> > +    if (s->tx_level) {
> > +        guint r = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
> > +                                        ibex_uart_xmit, s);
> > +        if (!r) {
> > +            s->tx_level = 0;
> > +            return FALSE;
> > +        }
> > +    }
> > +
>
> Zhiwei
>
>

