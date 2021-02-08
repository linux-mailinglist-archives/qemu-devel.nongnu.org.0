Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBD731419E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:23:42 +0100 (CET)
Received: from localhost ([::1]:37540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9E0T-0003jm-8d
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l98Ub-0001ez-Nr; Mon, 08 Feb 2021 10:30:25 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l98UQ-0004Ym-8N; Mon, 08 Feb 2021 10:30:25 -0500
Received: by mail-ed1-x536.google.com with SMTP id s11so18653112edd.5;
 Mon, 08 Feb 2021 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cxpA+bzgjkPSk7FKS1RSb4hiBCX0z02ifTciNXaPzqA=;
 b=DQgAaHLWDhRY56NMekgs2Yq/Md9F1fLYZyMCdC2u3vnFOvtq5Kw4ArwYD60HZvpkKS
 uEklZjmS118oWekSH5j/uGsqjO2TFqaYCT+1FRskRw9D5u7amUUi4n7ir4Tgb03TnUL2
 R2br5pGjZeFbenKoIoin58ksSm0nkd+SOkbfQE9+AI0lxN3Wvw2dem27WPz0BPnkwFmB
 kqBh5QlQ+73QzFerW1fp38N1VkoOTO2BO+3GzjAyAIe3E12Cl0Wb5Xn7lx2AiQgj3dBD
 mduGjsW5nwtpt/a+QQ/eLyHdaXeLffp0iBaMYlcGAmObIykmvIwypClkBMRcINtafgaK
 JsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cxpA+bzgjkPSk7FKS1RSb4hiBCX0z02ifTciNXaPzqA=;
 b=hevXyJNWadF6j83e+vuKcyzDhvSIFwzCv+VivYt7tfgtru5oHNvad45s573jl2+1rm
 2MzjUFOKwfb8UeERlhm2RK768SA7WPir/fgHJmei1HzhnFja/extfxiNNxEQMv05kIZY
 jUpFfoANbxsJImHW5Bs4xS/Z3Rb1YC7eEXDOX2SxattgHItLsacjcMEqscjTa6T5x7m9
 KYaxRhrgTr6tae2srmIYiIRhyT4A6JohXBNADqJpumF7RaPobTdv9Uxv2jqWRUfYXa//
 Uaqy1Zmm4aMcIfX88rx0fk64qhajTXhRtPB4EQqnWweW8X51iQ4mbZspp5bfk0A2NmQz
 F3sQ==
X-Gm-Message-State: AOAM530OPqgSA1N4oYsNKDpfAg5NgkEFvSp5QU9MdajNSYZooWjf9hu0
 U/7e915W8oWWjwyO2pct67V3gNHbD7NJKiRyx+U=
X-Google-Smtp-Source: ABdhPJweKro80L9UQqAkIhAz+Q6Iy50wXmGyBGVpXEDy+DsWm0yLtfP/WekvQJebLS3CdkVl30+7F5dCwmff333EHPc=
X-Received: by 2002:aa7:c407:: with SMTP id j7mr17448439edq.28.1612798211757; 
 Mon, 08 Feb 2021 07:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
 <20210115122627.GB29923@fralle-msi>
 <CAEUhbmVYgP063iqY0c10y9zKBmx00Z6vr3BO3RjoRo-CXQpYDw@mail.gmail.com>
 <20210118100557.GA11373@fralle-msi>
 <CAEUhbmWT50o8OV_QAimhs5itWq3pFd6CTKup6PFpvSs2KYpf2w@mail.gmail.com>
 <20210119130113.GA28306@fralle-msi>
 <CAEUhbmUBAgF4D__jsfbE7yGd++5ZH3YOutTiOBOot52sNCV-eg@mail.gmail.com>
 <20210121085006.GA10391@fralle-msi>
 <CAEUhbmUh54vqXmtkjnTzk7Y6U+oZEbw-O3ode+CdKbfZ0Qs+9Q@mail.gmail.com>
 <20210121141844.GC10391@fralle-msi>
 <CAEUhbmWT9QPa-EFRdQme2L9hiUJSYWZWfmzQTShQN86WMW93ew@mail.gmail.com>
In-Reply-To: <CAEUhbmWT9QPa-EFRdQme2L9hiUJSYWZWfmzQTShQN86WMW93ew@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 8 Feb 2021 16:30:00 +0100
Message-ID: <CAJy5ezp8+AeiOUoicGMz=GspoeUT2i0bAi3FrCEoEhuGkf1JxQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000819b2105bad4d8fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000819b2105bad4d8fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 8, 2021 at 3:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Thu, Jan 21, 2021 at 10:18 PM Francisco Iglesias
> <frasse.iglesias@gmail.com> wrote:
> >
> > Hi Bin,
> >
> > On [2021 Jan 21] Thu 16:59:51, Bin Meng wrote:
> > > Hi Francisco,
> > >
> > > On Thu, Jan 21, 2021 at 4:50 PM Francisco Iglesias
> > > <frasse.iglesias@gmail.com> wrote:
> > > >
> > > > Dear Bin,
> > > >
> > > > On [2021 Jan 20] Wed 22:20:25, Bin Meng wrote:
> > > > > Hi Francisco,
> > > > >
> > > > > On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias
> > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > >
> > > > > > Hi Bin,
> > > > > >
> > > > > > On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:
> > > > > > > Hi Francisco,
> > > > > > >
> > > > > > > On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
> > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Hi Bin,
> > > > > > > >
> > > > > > > > On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
> > > > > > > > > Hi Francisco,
> > > > > > > > >
> > > > > > > > > On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
> > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi Bin,
> > > > > > > > > >
> > > > > > > > > > On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> > > > > > > > > > > Hi Francisco,
> > > > > > > > > > >
> > > > > > > > > > > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > >
> > > > > > > > > > > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > > > >
> > > > > > > > > > > > > The m25p80 model uses s->needed_bytes to indicate
> how many follow-up
> > > > > > > > > > > > > bytes are expected to be received after it
> receives a command. For
> > > > > > > > > > > > > example, depending on the address mode, either
> 3-byte address or
> > > > > > > > > > > > > 4-byte address is needed.
> > > > > > > > > > > > >
> > > > > > > > > > > > > For fast read family commands, some dummy cycles
> are required after
> > > > > > > > > > > > > sending the address bytes, and the dummy cycles
> need to be counted
> > > > > > > > > > > > > in s->needed_bytes. This is where the mess began.
> > > > > > > > > > > > >
> > > > > > > > > > > > > As the variable name (needed_bytes) indicates, th=
e
> unit is in byte.
> > > > > > > > > > > > > It is not in bit, or cycle. However for some
> reason the model has
> > > > > > > > > > > > > been using the number of dummy cycles for
> s->needed_bytes. The right
> > > > > > > > > > > > > approach is to convert the number of dummy cycles
> to bytes based on
> > > > > > > > > > > > > the SPI protocol, for example, 6 dummy cycles for
> the Fast Read Quad
> > > > > > > > > > > > > I/O (EBh) should be converted to 3 bytes per the
> formula (6 * 4 / 8).
> > > > > > > > > > > >
> > > > > > > > > > > > While not being the original implementor I must
> assume that above solution was
> > > > > > > > > > > > considered but not chosen by the developers due to
> it is inaccuracy (it
> > > > > > > > > > > > wouldn't be possible to model exacly 6 dummy cycles=
,
> only a multiple of 8,
> > > > > > > > > > > > meaning that if the controller is wrongly programme=
d
> to generate 7 the error
> > > > > > > > > > > > wouldn't be caught and the controller will still be
> considered "correct"). Now
> > > > > > > > > > > > that we have this detail in the implementation I'm
> in favor of keeping it, this
> > > > > > > > > > > > also because the detail is already in use for
> catching exactly above error.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > I found no clue from the commit message that my
> proposed solution here
> > > > > > > > > > > was ever considered, otherwise all SPI controller
> models supporting
> > > > > > > > > > > software generation should have been found out
> seriously broken long
> > > > > > > > > > > time ago!
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > The controllers you are referring to might lack support
> for commands requiring
> > > > > > > > > > dummy clock cycles but I really hope they work with the
> other commands? If so I
> > > > > > > > >
> > > > > > > > > I am not sure why you view dummy clock cycles as somethin=
g
> special
> > > > > > > > > that needs some special support from the SPI controller.
> For the case
> > > > > > > > > 1 controller, it's nothing special from the controller
> perspective,
> > > > > > > > > just like sending out a command, or address bytes, or
> data. The
> > > > > > > > > controller just shifts data bit by bit from its tx fifo
> and that's it.
> > > > > > > > > In the Xilinx GQSPI controller case, the dummy cycles can
> either be
> > > > > > > > > sent via a regular data (the case 1 controller) in the tx
> fifo, or
> > > > > > > > > automatically generated (case 2 controller) by the
> hardware.
> > > > > > > >
> > > > > > > > Ok, I'll try to explain my view point a little differently.
> For that we also
> > > > > > > > need to keep in mind that QEMU models HW, and any binary
> that runs on a HW
> > > > > > > > board supported in QEMU should ideally run on that board
> inside QEMU aswell
> > > > > > > > (this can be a bare metal application equaly well as a
> modified u-boot/Linux
> > > > > > > > using SPI commands with a non multiple of 8 number of dummy
> clock cycles).
> > > > > > > >
> > > > > > > > Once functionality has been introduced into QEMU it is not
> easy to know which
> > > > > > > > intentional or untentional features provided by the
> functionality are being
> > > > > > > > used by users. One of the (perhaps not well known) features
> I'm aware of that
> > > > > > > > is in use and is provided by the accurate dummy clock cycle
> modeling inside
> > > > > > > > m25p80 is the be ability to test drivers accurately
> regarding the dummy clock
> > > > > > > > cycles (even when using commands with a non-multiple of 8
> number of dummy clock
> > > > > > > > cycles), but there might be others aswell. So by removing
> this functionality
> > > > > > > > above use case will brake, this since those test will not b=
e
> reliable.
> > > > > > > > Furthermore, since users tend to be creative it is not
> possible to know if
> > > > > > > > there are other use cases that will be affected. This means
> that in case [1]
> > > > > > > > needs to be followed the safe path is to add functionality
> instead of removing.
> > > > > > > > Luckily it also easier in this case, see below.
> > > > > > >
> > > > > > > I understand there might be users other than U-Boot/Linux tha=
t
> use an
> > > > > > > odd number of dummy bits (not multiple of 8). If your concern
> was
> > > > > > > about model behavior changes, sure I can update
> > > > > > > qemu/docs/system/deprecated.rst to mention that some flashes
> in the
> > > > > > > m25p80 model now implement dummy cycles as bytes.
> > > > > >
> > > > > > Yes, something like that. My concern is that since this
> functionality has been
> > > > > > in tree for while, users have found known or unknown features
> that got
> > > > > > introduced by it. By removing the functionality (and the
> known/uknown features)
> > > > > > we are riscing to brake our user's use cases (currently I'm
> aware of one
> > > > > > feature/use case but it is not unlikely that there are more).
> [1] states that
> > > > > > "In general features are intended to be supported indefinitely
> once introduced
> > > > > > into QEMU", to me that makes very much sense because the
> opposite would mean
> > > > > > that we were not reliable. So in case [1] needs to be honored i=
t
> looks to be
> > > > > > safer to add functionality instead of removing (and riscing the
> removal of use
> > > > > > cases/features). Luckily I still believe in this case that it
> will be easier to
> > > > > > go forward (even if I also agree on what you are saying below
> about what I
> > > > > > proposed).
> > > > > >
> > > > >
> > > > > Even if the implementation is buggy and we need to keep the buggy
> > > > > implementation forever? I think that's why
> > > > > qemu/docs/system/deprecated.rst was created for deprecating such
> > > > > feature.
> > > >
> > > > With the RFC I posted all commands in m25p80 are working for both
> the case 1
> > > > controller (using a txfifo) and the case 2 controller (no txfifo, a=
s
> GQSPI).
> > > > Because of this, I, with all respect, will have to disagree that
> this is buggy.
> > >
> > > Well, the existing m25p80 implementation that uses dummy cycle
> > > accuracy for those flashes prevents all SPI controllers that use tx
> > > fifo to work with those flashes. Hence it is buggy.
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > don't think it is fair to call them 'seriously broken'
> (and else we should
> > > > > > > > > > probably let the maintainers know about it). Most likel=
y
> the lack of support
> > > > > > > > >
> > > > > > > > > I called it "seriously broken" because current
> implementation only
> > > > > > > > > considered one type of SPI controllers while completely
> ignoring the
> > > > > > > > > other type.
> > > > > > > >
> > > > > > > > If we change view and see this from the perspective of
> m25p80, it models the
> > > > > > > > commands a certain way and provides an API that the SPI
> controllers need to
> > > > > > > > implement for interacting with it. It is true that there ar=
e
> SPI controllers
> > > > > > > > referred to above that do not support the portion of that
> API that corresponds
> > > > > > > > to commands with dummy clock cycles, but I don't think it i=
s
> true that this is
> > > > > > > > broken since there is also one SPI controller that has a
> working implementation
> > > > > > > > of m25p80's full API also when transfering through a tx fif=
o
> (use case 1). But
> > > > > > > > as mentioned above, by doing a minor extension and
> improvement to m25p80's API
> > > > > > > > and allow for toggling the accuracy from dummy clock cycles
> to dummy bytes [1]
> > > > > > > > will still be honored as in the same time making it possibl=
e
> to have full
> > > > > > > > support for the API in the SPI controllers that currently d=
o
> not (please reread
> > > > > > > > the proposal in my previous reply that attempts to do this)=
.
> I myself see this
> > > > > > > > as win/win situation, also because no controller should nee=
d
> modifications.
> > > > > > > >
> > > > > > >
> > > > > > > I am afraid your proposal does not work. Your proposed new
> device
> > > > > > > property 'model_dummy_bytes' to select to convert the accurat=
e
> dummy
> > > > > > > clock cycle count to dummy bytes inside m25p80, is hard to
> justify as
> > > > > > > a property to the flash itself, as the behavior is tightly
> coupled to
> > > > > > > how the SPI controller works.
> > > > > >
> > > > > > I agree on above. I decided though that instead of posting
> sample code in here
> > > > > > I'll post an RFC with hopefully an improved proposal. I'll cc
> you. About below,
> > > > > > Xilinx ZynqMP GQSPI should not need any modication in a first
> step.
> > > > > >
> > > > >
> > > > > Wait, (see below)
> > > > >
> > > > > > >
> > > > > > > Please take a look at the Xilinx GQSPI controller, which
> supports both
> > > > > > > use cases, that the dummy cycles can be transferred via tx
> fifo, or
> > > > > > > generated by the controller automatically. Please read the
> example
> > > > > > > given in:
> > > > > > >
> > > > > > >     table 24=E2=80=9022, an example of Generic FIFO Contents =
for Quad
> I/O Read
> > > > > > > Command (EBh)
> > > > > > >
> > > > > > > in
> https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultr=
ascale-trm.pdf
> > > > > > >
> > > > > > > If you choose to set the m25p80 device property
> 'model_dummy_bytes' to
> > > > > > > true when working with the Xilinx GQSPI controller, you are
> bound to
> > > > > > > only allow guest software to use tx fifo to transfer the dumm=
y
> cycles,
> > > > > > > and this is wrong.
> > > > > > >
> > > > >
> > > > > You missed this part. I looked at your RFC, and as I mentioned
> above
> > > > > your proposal cannot support the complicated controller like Xili=
nx
> > > > > GQSPI. Please read the example of table 24-22. With your RFC, you
> > > > > mandate guest software's GQSPI driver to only use hardware dummy
> cycle
> > > > > generation, which is wrong.
> > > > >
> > > >
> > > > First, thank you very much for looking into the RFC series, very mu=
ch
> > > > appreciated. Secondly, about above, the GQSPI model in QEMU
> transfers from 2
> > > > locations in the file, in 1 location the transfer referred to above
> is done, in
> > > > another location the transfer through the txfifo is done. The
> location where
> > > > transfer referred to above is done will not need any modifications
> (and will
> > > > thus work equally well as it does currently).
> > >
> > > Please explain this a little bit. How does your RFC series handle
> > > cases as described in table 24-22, where the 6 dummy cycles are split
> > > into 2 transfers, with one transfer using tx fifo, and the other one
> > > using hardware dummy cycle generation?
> >
> > Sorry, I missunderstod. You are right, that won't work.
>
> +Edgar E. Iglesias
>
> So it looks by far the only way to implement dummy cycles correctly to
> work with all SPI controller models is what I proposed here in this
> patch series.
>
> Maintainers are quite silent, so I would like to hear your thoughts.
>
> @Alistair Francis @Philippe Mathieu-Daud=C3=A9 @Peter Maydell would you
> please share your thoughts since you are the one who reviewed the
> existing dummy implementation (based on commits history)
>
>
Francisco really knows this stuff better than me....
I would tend to agree that it's unfortunate to model things in cycles, if
we could abstract things at a higher level that would be nice. Without
breaking existing use-cases.
Francisco, is it impossible to bring up the abstraction level to bytes and
keep existing use-cases?

We have a bunch of test-cases, We'll publish some of them in source code,
others we can't publish since they use proprietary SW we're not allowed to
publish at all, but we can run tests and Ack if things work.

Best regards,
Edgar

--000000000000819b2105bad4d8fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 8, 2021 at 3:42 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan =
21, 2021 at 10:18 PM Francisco Iglesias<br>
&lt;<a href=3D"mailto:frasse.iglesias@gmail.com" target=3D"_blank">frasse.i=
glesias@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Bin,<br>
&gt;<br>
&gt; On [2021 Jan 21] Thu 16:59:51, Bin Meng wrote:<br>
&gt; &gt; Hi Francisco,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jan 21, 2021 at 4:50 PM Francisco Iglesias<br>
&gt; &gt; &lt;<a href=3D"mailto:frasse.iglesias@gmail.com" target=3D"_blank=
">frasse.iglesias@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Dear Bin,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On [2021 Jan 20] Wed 22:20:25, Bin Meng wrote:<br>
&gt; &gt; &gt; &gt; Hi Francisco,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:frasse.iglesias@gmail.com" target=
=3D"_blank">frasse.iglesias@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hi Bin,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Francisco,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, Jan 18, 2021 at 6:06 PM Francisco Igl=
esias<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:frasse.iglesias@gmail.c=
om" target=3D"_blank">frasse.iglesias@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Bin,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On [2021 Jan 15] Fri 22:38:18, Bin Meng =
wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Francisco,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Fri, Jan 15, 2021 at 8:26 PM Fra=
ncisco Iglesias<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:frasse.iglesi=
as@gmail.com" target=3D"_blank">frasse.iglesias@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Bin,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On [2021 Jan 15] Fri 10:07:52,=
 Bin Meng wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Francisco,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Fri, Jan 15, 2021 at 2=
:13 AM Francisco Iglesias<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:fra=
sse.iglesias@gmail.com" target=3D"_blank">frasse.iglesias@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Bin,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On [2021 Jan 14] Thu=
 23:08:53, Bin Meng wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; From: Bin Meng =
&lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.meng@wi=
ndriver.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The m25p80 mode=
l uses s-&gt;needed_bytes to indicate how many follow-up<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; bytes are expec=
ted to be received after it receives a command. For<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; example, depend=
ing on the address mode, either 3-byte address or<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; 4-byte address =
is needed.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; For fast read f=
amily commands, some dummy cycles are required after<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; sending the add=
ress bytes, and the dummy cycles need to be counted<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; in s-&gt;needed=
_bytes. This is where the mess began.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; As the variable=
 name (needed_bytes) indicates, the unit is in byte.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; It is not in bi=
t, or cycle. However for some reason the model has<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; been using the =
number of dummy cycles for s-&gt;needed_bytes. The right<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; approach is to =
convert the number of dummy cycles to bytes based on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the SPI protoco=
l, for example, 6 dummy cycles for the Fast Read Quad<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I/O (EBh) shoul=
d be converted to 3 bytes per the formula (6 * 4 / 8).<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; While not being the =
original implementor I must assume that above solution was<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; considered but not c=
hosen by the developers due to it is inaccuracy (it<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; wouldn&#39;t be poss=
ible to model exacly 6 dummy cycles, only a multiple of 8,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; meaning that if the =
controller is wrongly programmed to generate 7 the error<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; wouldn&#39;t be caug=
ht and the controller will still be considered &quot;correct&quot;). Now<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; that we have this de=
tail in the implementation I&#39;m in favor of keeping it, this<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; also because the det=
ail is already in use for catching exactly above error.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I found no clue from the =
commit message that my proposed solution here<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; was ever considered, othe=
rwise all SPI controller models supporting<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; software generation shoul=
d have been found out seriously broken long<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; time ago!<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The controllers you are referr=
ing to might lack support for commands requiring<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; dummy clock cycles but I reall=
y hope they work with the other commands? If so I<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I am not sure why you view dummy cl=
ock cycles as something special<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; that needs some special support fro=
m the SPI controller. For the case<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; 1 controller, it&#39;s nothing spec=
ial from the controller perspective,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; just like sending out a command, or=
 address bytes, or data. The<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; controller just shifts data bit by =
bit from its tx fifo and that&#39;s it.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; In the Xilinx GQSPI controller case=
, the dummy cycles can either be<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; sent via a regular data (the case 1=
 controller) in the tx fifo, or<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; automatically generated (case 2 con=
troller) by the hardware.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Ok, I&#39;ll try to explain my view poin=
t a little differently. For that we also<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; need to keep in mind that QEMU models HW=
, and any binary that runs on a HW<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; board supported in QEMU should ideally r=
un on that board inside QEMU aswell<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; (this can be a bare metal application eq=
ualy well as a modified u-boot/Linux<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; using SPI commands with a non multiple o=
f 8 number of dummy clock cycles).<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Once functionality has been introduced i=
nto QEMU it is not easy to know which<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; intentional or untentional features prov=
ided by the functionality are being<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; used by users. One of the (perhaps not w=
ell known) features I&#39;m aware of that<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; is in use and is provided by the accurat=
e dummy clock cycle modeling inside<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; m25p80 is the be ability to test drivers=
 accurately regarding the dummy clock<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; cycles (even when using commands with a =
non-multiple of 8 number of dummy clock<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; cycles), but there might be others aswel=
l. So by removing this functionality<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; above use case will brake, this since th=
ose test will not be reliable.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Furthermore, since users tend to be crea=
tive it is not possible to know if<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; there are other use cases that will be a=
ffected. This means that in case [1]<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; needs to be followed the safe path is to=
 add functionality instead of removing.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Luckily it also easier in this case, see=
 below.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I understand there might be users other than =
U-Boot/Linux that use an<br>
&gt; &gt; &gt; &gt; &gt; &gt; odd number of dummy bits (not multiple of 8).=
 If your concern was<br>
&gt; &gt; &gt; &gt; &gt; &gt; about model behavior changes, sure I can upda=
te<br>
&gt; &gt; &gt; &gt; &gt; &gt; qemu/docs/system/deprecated.rst to mention th=
at some flashes in the<br>
&gt; &gt; &gt; &gt; &gt; &gt; m25p80 model now implement dummy cycles as by=
tes.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Yes, something like that. My concern is that since=
 this functionality has been<br>
&gt; &gt; &gt; &gt; &gt; in tree for while, users have found known or unkno=
wn features that got<br>
&gt; &gt; &gt; &gt; &gt; introduced by it. By removing the functionality (a=
nd the known/uknown features)<br>
&gt; &gt; &gt; &gt; &gt; we are riscing to brake our user&#39;s use cases (=
currently I&#39;m aware of one<br>
&gt; &gt; &gt; &gt; &gt; feature/use case but it is not unlikely that there=
 are more). [1] states that<br>
&gt; &gt; &gt; &gt; &gt; &quot;In general features are intended to be suppo=
rted indefinitely once introduced<br>
&gt; &gt; &gt; &gt; &gt; into QEMU&quot;, to me that makes very much sense =
because the opposite would mean<br>
&gt; &gt; &gt; &gt; &gt; that we were not reliable. So in case [1] needs to=
 be honored it looks to be<br>
&gt; &gt; &gt; &gt; &gt; safer to add functionality instead of removing (an=
d riscing the removal of use<br>
&gt; &gt; &gt; &gt; &gt; cases/features). Luckily I still believe in this c=
ase that it will be easier to<br>
&gt; &gt; &gt; &gt; &gt; go forward (even if I also agree on what you are s=
aying below about what I<br>
&gt; &gt; &gt; &gt; &gt; proposed).<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Even if the implementation is buggy and we need to keep=
 the buggy<br>
&gt; &gt; &gt; &gt; implementation forever? I think that&#39;s why<br>
&gt; &gt; &gt; &gt; qemu/docs/system/deprecated.rst was created for depreca=
ting such<br>
&gt; &gt; &gt; &gt; feature.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; With the RFC I posted all commands in m25p80 are working for=
 both the case 1<br>
&gt; &gt; &gt; controller (using a txfifo) and the case 2 controller (no tx=
fifo, as GQSPI).<br>
&gt; &gt; &gt; Because of this, I, with all respect, will have to disagree =
that this is buggy.<br>
&gt; &gt;<br>
&gt; &gt; Well, the existing m25p80 implementation that uses dummy cycle<br=
>
&gt; &gt; accuracy for those flashes prevents all SPI controllers that use =
tx<br>
&gt; &gt; fifo to work with those flashes. Hence it is buggy.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; don&#39;t think it is fair to =
call them &#39;seriously broken&#39; (and else we should<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; probably let the maintainers k=
now about it). Most likely the lack of support<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I called it &quot;seriously broken&=
quot; because current implementation only<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; considered one type of SPI controll=
ers while completely ignoring the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; other type.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; If we change view and see this from the =
perspective of m25p80, it models the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; commands a certain way and provides an A=
PI that the SPI controllers need to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; implement for interacting with it. It is=
 true that there are SPI controllers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; referred to above that do not support th=
e portion of that API that corresponds<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; to commands with dummy clock cycles, but=
 I don&#39;t think it is true that this is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; broken since there is also one SPI contr=
oller that has a working implementation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; of m25p80&#39;s full API also when trans=
fering through a tx fifo (use case 1). But<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; as mentioned above, by doing a minor ext=
ension and improvement to m25p80&#39;s API<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; and allow for toggling the accuracy from=
 dummy clock cycles to dummy bytes [1]<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; will still be honored as in the same tim=
e making it possible to have full<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; support for the API in the SPI controlle=
rs that currently do not (please reread<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the proposal in my previous reply that a=
ttempts to do this). I myself see this<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; as win/win situation, also because no co=
ntroller should need modifications.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I am afraid your proposal does not work. Your=
 proposed new device<br>
&gt; &gt; &gt; &gt; &gt; &gt; property &#39;model_dummy_bytes&#39; to selec=
t to convert the accurate dummy<br>
&gt; &gt; &gt; &gt; &gt; &gt; clock cycle count to dummy bytes inside m25p8=
0, is hard to justify as<br>
&gt; &gt; &gt; &gt; &gt; &gt; a property to the flash itself, as the behavi=
or is tightly coupled to<br>
&gt; &gt; &gt; &gt; &gt; &gt; how the SPI controller works.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I agree on above. I decided though that instead of=
 posting sample code in here<br>
&gt; &gt; &gt; &gt; &gt; I&#39;ll post an RFC with hopefully an improved pr=
oposal. I&#39;ll cc you. About below,<br>
&gt; &gt; &gt; &gt; &gt; Xilinx ZynqMP GQSPI should not need any modication=
 in a first step.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Wait, (see below)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Please take a look at the Xilinx GQSPI contro=
ller, which supports both<br>
&gt; &gt; &gt; &gt; &gt; &gt; use cases, that the dummy cycles can be trans=
ferred via tx fifo, or<br>
&gt; &gt; &gt; &gt; &gt; &gt; generated by the controller automatically. Pl=
ease read the example<br>
&gt; &gt; &gt; &gt; &gt; &gt; given in:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0table 24=E2=80=9022, an ex=
ample of Generic FIFO Contents for Quad I/O Read<br>
&gt; &gt; &gt; &gt; &gt; &gt; Command (EBh)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; in <a href=3D"https://www.xilinx.com/support/=
documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf" rel=3D"noreferrer=
" target=3D"_blank">https://www.xilinx.com/support/documentation/user_guide=
s/ug1085-zynq-ultrascale-trm.pdf</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; If you choose to set the m25p80 device proper=
ty &#39;model_dummy_bytes&#39; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; true when working with the Xilinx GQSPI contr=
oller, you are bound to<br>
&gt; &gt; &gt; &gt; &gt; &gt; only allow guest software to use tx fifo to t=
ransfer the dummy cycles,<br>
&gt; &gt; &gt; &gt; &gt; &gt; and this is wrong.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; You missed this part. I looked at your RFC, and as I me=
ntioned above<br>
&gt; &gt; &gt; &gt; your proposal cannot support the complicated controller=
 like Xilinx<br>
&gt; &gt; &gt; &gt; GQSPI. Please read the example of table 24-22. With you=
r RFC, you<br>
&gt; &gt; &gt; &gt; mandate guest software&#39;s GQSPI driver to only use h=
ardware dummy cycle<br>
&gt; &gt; &gt; &gt; generation, which is wrong.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; First, thank you very much for looking into the RFC series, =
very much<br>
&gt; &gt; &gt; appreciated. Secondly, about above, the GQSPI model in QEMU =
transfers from 2<br>
&gt; &gt; &gt; locations in the file, in 1 location the transfer referred t=
o above is done, in<br>
&gt; &gt; &gt; another location the transfer through the txfifo is done. Th=
e location where<br>
&gt; &gt; &gt; transfer referred to above is done will not need any modific=
ations (and will<br>
&gt; &gt; &gt; thus work equally well as it does currently).<br>
&gt; &gt;<br>
&gt; &gt; Please explain this a little bit. How does your RFC series handle=
<br>
&gt; &gt; cases as described in table 24-22, where the 6 dummy cycles are s=
plit<br>
&gt; &gt; into 2 transfers, with one transfer using tx fifo, and the other =
one<br>
&gt; &gt; using hardware dummy cycle generation?<br>
&gt;<br>
&gt; Sorry, I missunderstod. You are right, that won&#39;t work.<br>
<br>
+Edgar E. Iglesias<br>
<br>
So it looks by far the only way to implement dummy cycles correctly to<br>
work with all SPI controller models is what I proposed here in this<br>
patch series.<br>
<br>
Maintainers are quite silent, so I would like to hear your thoughts.<br>
<br>
@Alistair Francis @Philippe Mathieu-Daud=C3=A9 @Peter Maydell would you<br>
please share your thoughts since you are the one who reviewed the<br>
existing dummy implementation (based on commits history)<br>
<br></blockquote><div><br></div>Francisco really knows this stuff better th=
an me....</div><div class=3D"gmail_quote">I would tend to agree that it&#39=
;s unfortunate to model things in cycles, if we could abstract things at a =
higher level that would be nice. Without breaking existing use-cases.</div>=
<div class=3D"gmail_quote">Francisco, is it impossible to bring up the abst=
raction level to bytes and keep existing use-cases?<br></div><div class=3D"=
gmail_quote"><br></div><div class=3D"gmail_quote">We have a bunch of test-c=
ases, We&#39;ll publish some of them in source code, others we can&#39;t pu=
blish since they use proprietary SW we&#39;re not allowed to publish at all=
, but we can run tests and Ack if things work.<br></div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">Best regards,</div><div class=
=3D"gmail_quote">Edgar<br></div></div>

--000000000000819b2105bad4d8fa--

