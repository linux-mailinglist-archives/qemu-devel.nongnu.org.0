Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F872F7102
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:32:41 +0100 (CET)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Fqr-0002G2-1E
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1l0Fo2-0000oU-1d
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:29:46 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1l0Fnz-0001Rs-IL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:29:45 -0500
Received: by mail-io1-xd2b.google.com with SMTP id o6so15573419iob.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vTg5XIEa4QeiPR4ZfaI1WcYrbmhHRCA65ExSp5eNi1A=;
 b=mNdWhQxA8r1w/CSi9l7vq33r+VF5E2aGBTJ8WOtcPna/tYroPPP2b9ZVfqFirsh01u
 fwikxMSW7oyDoPPA5hS/x8I4umLd7VZtogGt2nl/htwU5n6iHuOLg4hqCfKVjKbKBCvX
 GpprpZ6UcoNUue3Mb9koXKCnmQTFdz7Ta/R3/oWk2U195auPUqCGmwBfmbZHo01o7yfi
 AbbuZT3jIODcJWpy7baHpgbXPgIF5cHNxwJmZtmTsP16H3l4Q+uRkiWWUXW9ruS0MgkP
 xTjcL9jgDsvwRFgcfmAZv+drIZoVJNK/zMmsLKpLM0aIxvw11AWbpNglNNQXnbkECx5Q
 FtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTg5XIEa4QeiPR4ZfaI1WcYrbmhHRCA65ExSp5eNi1A=;
 b=MEys0CWcoCATm5jaayUFmA3+y5UfN1YtqsrsR6UqKCTZelC3eSkEy1OPGVK6Blztg8
 Egdry8qs984D4Ue+cHtAwGyUBFNrgpjv5HLpccsJPi+SxdMXbPSwGZN+KfMNlpuCAegg
 mbRezJu+sfLzkClJq1jcFGknrdVqtGlCT/toNm5dxaID/OtGQe45MDZTBGiyhSVlzc82
 yJdlmZRwoCdZGW1fLLf829cQtn1k7ggI1MIp1EuEC4ff7lX/SbBut+y2i4agXX0e1z/6
 DWKAJm4hpqLBZ7hP68KNYYVe/idMlCPVDPfKK6mqhN42aG6J0Z/FRvCfGvQ4noieTCxO
 ptIw==
X-Gm-Message-State: AOAM5312GgTmRSrZJFhP2XoeKN6fB7/F8lyk7bHvV1jEhGlUbfxb6OmJ
 BPe5aKohT7MyfQcRk8aLrjW6SUaFQC46QDyoiidaxQ==
X-Google-Smtp-Source: ABdhPJxgBGDbQAM3tNlExTfhJCcoatt89ck+2NLTWubsn7kHtcc+bDHdK0zWZBt6f9ybxeGQG7baEM1ZVaWIwfqdiyc=
X-Received: by 2002:a92:9a42:: with SMTP id t63mr9290569ili.176.1610681382114; 
 Thu, 14 Jan 2021 19:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
In-Reply-To: <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
Date: Thu, 14 Jan 2021 19:29:27 -0800
Message-ID: <CAFQmdRYgc-Gs9JUtfzGtrpEdEm439mkyWfkcX3izvfRFuEpYgw@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=hskinnemoen@google.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>

Hi Bin,

On Thu, Jan 14, 2021 at 6:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Francisco,
>
> On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> <frasse.iglesias@gmail.com> wrote:
> >
> > Hi Bin,
> >
> > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > The m25p80 model uses s->needed_bytes to indicate how many follow-up
> > > bytes are expected to be received after it receives a command. For
> > > example, depending on the address mode, either 3-byte address or
> > > 4-byte address is needed.
> > >
> > > For fast read family commands, some dummy cycles are required after
> > > sending the address bytes, and the dummy cycles need to be counted
> > > in s->needed_bytes. This is where the mess began.
> > >
> > > As the variable name (needed_bytes) indicates, the unit is in byte.
> > > It is not in bit, or cycle. However for some reason the model has
> > > been using the number of dummy cycles for s->needed_bytes. The right
> > > approach is to convert the number of dummy cycles to bytes based on
> > > the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
> > > I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).
> >
> > While not being the original implementor I must assume that above solution was
> > considered but not chosen by the developers due to it is inaccuracy (it
> > wouldn't be possible to model exacly 6 dummy cycles, only a multiple of 8,
> > meaning that if the controller is wrongly programmed to generate 7 the error
> > wouldn't be caught and the controller will still be considered "correct"). Now
> > that we have this detail in the implementation I'm in favor of keeping it, this
> > also because the detail is already in use for catching exactly above error.
> >
>
> I found no clue from the commit message that my proposed solution here
> was ever considered, otherwise all SPI controller models supporting
> software generation should have been found out seriously broken long
> time ago!
>
> The issue you pointed out that we require the total number of dummy
> bits should be multiple of 8 is true, that's why I added the
> unimplemented log message in this series (patch 2/3/4) to warn users
> if this expectation is not met. However this will not cause any issue
> when running U-Boot or Linux, because both spi-nor drivers expect the
> same assumption as we do here.
>
> See U-Boot spi_nor_read_data() and Linux spi_nor_spimem_read_data(),
> there is a logic to calculate the dummy bytes needed for fast read
> command:
>
>     /* convert the dummy cycles to the number of bytes */
>     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>
> Note the default dummy cycles configuration for all flashes I have
> looked into as of today, meets the multiple of 8 assumption. On some
> flashes the dummy cycle number is configurable, and if it's been
> configured to be an odd value, it would not work on U-Boot/Linux in
> the first place.
>
> > >
> > > Things get complicated when interacting with different SPI or QSPI
> > > flash controllers. There are major two cases:
> > >
> > > - Dummy bytes prepared by drivers, and wrote to the controller fifo.
> > >   For such case, driver will calculate the correct number of dummy
> > >   bytes and write them into the tx fifo. Fixing the m25p80 model will
> > >   fix flashes working with such controllers.
> >
> > Above can be fixed while still keeping the detailed dummy cycle implementation
> > inside m25p80. Perhaps one of the following could be looked into: configurating
> > the amount, letting the spi ctrl fetch the amount from m25p80 or by inheriting
> > some functionality handling this in the SPI controller. Or a mixture of above.
>
> Please send patches to explain this in detail how this is going to
> work. I am open to all possible solutions.
>
> >
> > > - Dummy bytes not prepared by drivers. Drivers just tell the hardware
> > >   the dummy cycle configuration via some registers, and hardware will
> > >   automatically generate dummy cycles for us. Fixing the m25p80 model
> > >   is not enough, and we will need to fix the SPI/QSPI models for such
> > >   controllers.
> > >
> > > This series fixes the mess in the m25p80 from the flash side first,
> >
> > Considering the problems solved by the solution in tree I find m25p80 pretty
> > clean, at least I don't see any clearly better way for accurately modeling the
> > dummy clock cycles. Counting bits instead of bytes would for example still
> > force the controllers to mark which bits to count (when transmitting one dummy
> > byte from a txfifo on four lines (Quad command) it generates 2 dummy clock
> > cycles since it takes two cycles to transfer 8 bits).
> >
>
> SPI is a bit based protocol, not bytes. If you insist on bit modeling
> with the dummy cycles then you should also suggest we change all
> cycles (including command/addr/dummy/data phases) to be modeled with
> bits. That way we can accurately emulate everything, for example one
> potential problem like transferring 9 bit in the data phase.

I agree with this. There's really nothing special about dummy cycles.
Making them special makes it super painful to implement SPI controller
emulation because you have to anticipate when ssi_transfer changes
semantics from byte-at-a-time to bit-at-a-time. I doubt all the SPI
controllers in the tree gets it right all the time.

> However modeling everything with bit is super inefficient. My view is
> that we should avoid trying to support uncommon use cases (like not
> multiple of 8 for dummy bits) in QEMU.

Perhaps ssi_transfer could take an additional bits parameter? That
should make it possible to transfer any number of bits up to 32, while
keeping the common case simple on both sides. And it would work for
any SPI transfer, not just dummy cycles.

Havard

