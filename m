Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3525B2F7E62
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:39:16 +0100 (CET)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QFv-0004cG-6f
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0PYy-0003Cm-FQ; Fri, 15 Jan 2021 08:54:54 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0PYu-0000BM-Ki; Fri, 15 Jan 2021 08:54:52 -0500
Received: by mail-yb1-xb30.google.com with SMTP id r63so5088760ybf.5;
 Fri, 15 Jan 2021 05:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ixNEZN1pFQbixJvXzSJWe23RlLp2otnpJ4+txpnch/o=;
 b=F1Iq4pDKrn3IOwon2r2rmwNT32Sw1mjR67TxXwpbZfAz1GSeZ7RI+JxQnW8Ji3yOpx
 9OJo5MGZnBjesiU1amQHo+4jMf4Ny0xo/F/kvnbB0whGtsnQ4YOjP+A+j5XdeIdliQCn
 gspjLruVKlPfgWgo60211Bur9mykT2lv/GVxLjr+u7zAm3c/UnJWEOrGiwvRlXmZ83YU
 7Uqi/q2HROjfivDavAjmQRRnbZarrkt2eOeYDSyYuiCGnubSIV/OE7eWTVrf1OWLlKSa
 x856/kQPYrkG1SLTJzQNt8o83p8vvHuIyHOGBVK50/v7Ewb1msxJVS/6qAI7GuogdcrH
 zZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ixNEZN1pFQbixJvXzSJWe23RlLp2otnpJ4+txpnch/o=;
 b=pDllgeoKufoKcLsCJy5Kjw6HY7Io5aHwWSqlXzVrC5aq1B+ZfC0xKPMMmJBd2fdl7e
 fwgq+Mr8Aik0BPwr+JIboDdTsirA1F4kRw/MgcGCG3sYnL5yXtfjr29iC1S70RfJS+4J
 VLOA+/80lsQS2SuPJjMFJdRhpCrgL7cK1NfnehQMxIEP93kz1V6m+MK1UPLK01f011AF
 6LMazjoT8jfGRdVtm7qIiZSO9de8aOybn6aBwI94wDls8k626opp7C2DJ1lLuAaGD79b
 yiEJO6Yv2TcSY3THZFfP1EiNcFat9RwKDMYSJD5B9fLxBHpOjSLCv4TY0Vci9vs8uDEB
 W0rg==
X-Gm-Message-State: AOAM531pGZk02hyvZgFQA9fDCG6sXpQC1QKcMD23g+qjLFPJDL/5oQz4
 4O3Rjd8jYY/+E8Qm0kj8EIl7oU6uFhCQuesWNGY=
X-Google-Smtp-Source: ABdhPJwJl9gl7UUtMNtIqIwkwP4MuugcTobNwEkOmATZgTk9ak+ImMVdV49SKs49FugTitD9Ixjd1zwslxllmuaJmp0=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr18907535ybs.122.1610718886727; 
 Fri, 15 Jan 2021 05:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
 <CAFQmdRYgc-Gs9JUtfzGtrpEdEm439mkyWfkcX3izvfRFuEpYgw@mail.gmail.com>
In-Reply-To: <CAFQmdRYgc-Gs9JUtfzGtrpEdEm439mkyWfkcX3izvfRFuEpYgw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Jan 2021 21:54:34 +0800
Message-ID: <CAEUhbmWp59Bu35Ga0U5TiZF4c0vDriFB4sebZc-k8ANRNRjybw@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Havard,

On Fri, Jan 15, 2021 at 11:29 AM Havard Skinnemoen
<hskinnemoen@google.com> wrote:
>
> Hi Bin,
>
> On Thu, Jan 14, 2021 at 6:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Francisco,
> >
> > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hi Bin,
> > >
> > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > The m25p80 model uses s->needed_bytes to indicate how many follow-up
> > > > bytes are expected to be received after it receives a command. For
> > > > example, depending on the address mode, either 3-byte address or
> > > > 4-byte address is needed.
> > > >
> > > > For fast read family commands, some dummy cycles are required after
> > > > sending the address bytes, and the dummy cycles need to be counted
> > > > in s->needed_bytes. This is where the mess began.
> > > >
> > > > As the variable name (needed_bytes) indicates, the unit is in byte.
> > > > It is not in bit, or cycle. However for some reason the model has
> > > > been using the number of dummy cycles for s->needed_bytes. The right
> > > > approach is to convert the number of dummy cycles to bytes based on
> > > > the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
> > > > I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).
> > >
> > > While not being the original implementor I must assume that above solution was
> > > considered but not chosen by the developers due to it is inaccuracy (it
> > > wouldn't be possible to model exacly 6 dummy cycles, only a multiple of 8,
> > > meaning that if the controller is wrongly programmed to generate 7 the error
> > > wouldn't be caught and the controller will still be considered "correct"). Now
> > > that we have this detail in the implementation I'm in favor of keeping it, this
> > > also because the detail is already in use for catching exactly above error.
> > >
> >
> > I found no clue from the commit message that my proposed solution here
> > was ever considered, otherwise all SPI controller models supporting
> > software generation should have been found out seriously broken long
> > time ago!
> >
> > The issue you pointed out that we require the total number of dummy
> > bits should be multiple of 8 is true, that's why I added the
> > unimplemented log message in this series (patch 2/3/4) to warn users
> > if this expectation is not met. However this will not cause any issue
> > when running U-Boot or Linux, because both spi-nor drivers expect the
> > same assumption as we do here.
> >
> > See U-Boot spi_nor_read_data() and Linux spi_nor_spimem_read_data(),
> > there is a logic to calculate the dummy bytes needed for fast read
> > command:
> >
> >     /* convert the dummy cycles to the number of bytes */
> >     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> >
> > Note the default dummy cycles configuration for all flashes I have
> > looked into as of today, meets the multiple of 8 assumption. On some
> > flashes the dummy cycle number is configurable, and if it's been
> > configured to be an odd value, it would not work on U-Boot/Linux in
> > the first place.
> >
> > > >
> > > > Things get complicated when interacting with different SPI or QSPI
> > > > flash controllers. There are major two cases:
> > > >
> > > > - Dummy bytes prepared by drivers, and wrote to the controller fifo.
> > > >   For such case, driver will calculate the correct number of dummy
> > > >   bytes and write them into the tx fifo. Fixing the m25p80 model will
> > > >   fix flashes working with such controllers.
> > >
> > > Above can be fixed while still keeping the detailed dummy cycle implementation
> > > inside m25p80. Perhaps one of the following could be looked into: configurating
> > > the amount, letting the spi ctrl fetch the amount from m25p80 or by inheriting
> > > some functionality handling this in the SPI controller. Or a mixture of above.
> >
> > Please send patches to explain this in detail how this is going to
> > work. I am open to all possible solutions.
> >
> > >
> > > > - Dummy bytes not prepared by drivers. Drivers just tell the hardware
> > > >   the dummy cycle configuration via some registers, and hardware will
> > > >   automatically generate dummy cycles for us. Fixing the m25p80 model
> > > >   is not enough, and we will need to fix the SPI/QSPI models for such
> > > >   controllers.
> > > >
> > > > This series fixes the mess in the m25p80 from the flash side first,
> > >
> > > Considering the problems solved by the solution in tree I find m25p80 pretty
> > > clean, at least I don't see any clearly better way for accurately modeling the
> > > dummy clock cycles. Counting bits instead of bytes would for example still
> > > force the controllers to mark which bits to count (when transmitting one dummy
> > > byte from a txfifo on four lines (Quad command) it generates 2 dummy clock
> > > cycles since it takes two cycles to transfer 8 bits).
> > >
> >
> > SPI is a bit based protocol, not bytes. If you insist on bit modeling
> > with the dummy cycles then you should also suggest we change all
> > cycles (including command/addr/dummy/data phases) to be modeled with
> > bits. That way we can accurately emulate everything, for example one
> > potential problem like transferring 9 bit in the data phase.
>
> I agree with this. There's really nothing special about dummy cycles.
> Making them special makes it super painful to implement SPI controller
> emulation because you have to anticipate when ssi_transfer changes
> semantics from byte-at-a-time to bit-at-a-time. I doubt all the SPI
> controllers in the tree gets it right all the time.
>

Yep, it's not just painful for SPI controllers, and for the case 1 SPI
controller it's impossible to snoop the data to distinguish when the
dummy cycles begin.

> > However modeling everything with bit is super inefficient. My view is
> > that we should avoid trying to support uncommon use cases (like not
> > multiple of 8 for dummy bits) in QEMU.
>
> Perhaps ssi_transfer could take an additional bits parameter? That
> should make it possible to transfer any number of bits up to 32, while
> keeping the common case simple on both sides. And it would work for
> any SPI transfer, not just dummy cycles.

This sounds like a good tradeoff from the emulator perspective. But I
am not sure we should do this to solve the dummy cycle mess given all
the default dummy cycle configurations so far match the multiple of 8
assumption.

Regards,
Bin

