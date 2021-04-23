Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7376368D4F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 08:47:10 +0200 (CEST)
Received: from localhost ([::1]:55096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZpan-0007VP-Ol
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 02:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lZpZq-0006os-TA; Fri, 23 Apr 2021 02:46:10 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lZpZn-0002lC-HN; Fri, 23 Apr 2021 02:46:10 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 130so10640866ybd.10;
 Thu, 22 Apr 2021 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pHwORQiLyUSC157LgRJtCwd1jGOk2Hl7109dwZCd464=;
 b=ZYpmpGT562ac++f2fqv+x3zQgmhE3lZ2sB7IE+69V+386vtxzS1dFP8Da/rktJdhRD
 Wl/JmzZh8ostUfL5Rf3Szft2P3wiEaSgKi0c5TKk9DwRY54IojLDvLxxrwpqWlP/dmsZ
 et579vKN6YNXQN91rhAtqFGE8XRR1/czZg+tL8jq8leBQvk91G9YjznPCw7Hi880FUCv
 aPbC790wip3b6J5fU4BZ5skI/0of4MHSkGBlrDcM+ubJKG3nIn0E/J6G7DmrYwPlNLOi
 ybk/YkHj1nPwisyjF6UPVkdYSduvsgNEIpPhMJ3Ui9XhoipMRlgCGKda4VHwbQeDxXxo
 K75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pHwORQiLyUSC157LgRJtCwd1jGOk2Hl7109dwZCd464=;
 b=Eu8Sr1IFOcOQtg0PX4/NLBh3Ek0k4fJqB0F7E4TtAdFU/pdNXsaHtFASt77GEkdYLc
 u8UFlbkxwdTHhHLUv6D+GpRaNRfZR0Tw+W+1m5iomqY2T5x266J2Aqc3M24uz9igWXjl
 gMYXOT/BMdccaFSHxOvRIhC75rluOCJx0mHGTwXnlQKfs9Oh1bTBO5qh2HXYdOy99iHr
 ctd6+SWUSrpM5Pak5sBzHQuzQ/L530X0PGCACcZjLYUmi2zCJaMCuRUZvvPASCYNasYa
 L5gwMV1qKIelz3hRla/RYCNCOmg42hufn1zabLQgT3a2moo9n7G3qHgo7il/ijwtIAjV
 DyNw==
X-Gm-Message-State: AOAM532bygb5AUcykzDQL+7cUEFdAO+CCL1E12wj7s6M1h5eCCFvxcGj
 Fm27vujY3Dv2ZOMw5Zyeuyo2p9KEqL+ECl5dI5Y=
X-Google-Smtp-Source: ABdhPJwRSLTTWPoKrzn0VYSRrLxdJd8CETfNMv/gPY8HmK2vveYF3yAUJca/u1Z3YLZHonf5rzLYsTQi7vcKYr0MmIo=
X-Received: by 2002:a25:cf8f:: with SMTP id f137mr3470411ybg.122.1619160365130; 
 Thu, 22 Apr 2021 23:46:05 -0700 (PDT)
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
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Apr 2021 14:45:53 +0800
Message-ID: <CAEUhbmXwq-7mwbuwp_29iXDT4AZYTBE4PFDxhaHoZkrCRumCaw@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Francisco Iglesias <frasse.iglesias@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 8, 2021 at 10:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
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
> > > > > > > > > > > > > The m25p80 model uses s->needed_bytes to indicate=
 how many follow-up
> > > > > > > > > > > > > bytes are expected to be received after it receiv=
es a command. For
> > > > > > > > > > > > > example, depending on the address mode, either 3-=
byte address or
> > > > > > > > > > > > > 4-byte address is needed.
> > > > > > > > > > > > >
> > > > > > > > > > > > > For fast read family commands, some dummy cycles =
are required after
> > > > > > > > > > > > > sending the address bytes, and the dummy cycles n=
eed to be counted
> > > > > > > > > > > > > in s->needed_bytes. This is where the mess began.
> > > > > > > > > > > > >
> > > > > > > > > > > > > As the variable name (needed_bytes) indicates, th=
e unit is in byte.
> > > > > > > > > > > > > It is not in bit, or cycle. However for some reas=
on the model has
> > > > > > > > > > > > > been using the number of dummy cycles for s->need=
ed_bytes. The right
> > > > > > > > > > > > > approach is to convert the number of dummy cycles=
 to bytes based on
> > > > > > > > > > > > > the SPI protocol, for example, 6 dummy cycles for=
 the Fast Read Quad
> > > > > > > > > > > > > I/O (EBh) should be converted to 3 bytes per the =
formula (6 * 4 / 8).
> > > > > > > > > > > >
> > > > > > > > > > > > While not being the original implementor I must ass=
ume that above solution was
> > > > > > > > > > > > considered but not chosen by the developers due to =
it is inaccuracy (it
> > > > > > > > > > > > wouldn't be possible to model exacly 6 dummy cycles=
, only a multiple of 8,
> > > > > > > > > > > > meaning that if the controller is wrongly programme=
d to generate 7 the error
> > > > > > > > > > > > wouldn't be caught and the controller will still be=
 considered "correct"). Now
> > > > > > > > > > > > that we have this detail in the implementation I'm =
in favor of keeping it, this
> > > > > > > > > > > > also because the detail is already in use for catch=
ing exactly above error.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > I found no clue from the commit message that my propo=
sed solution here
> > > > > > > > > > > was ever considered, otherwise all SPI controller mod=
els supporting
> > > > > > > > > > > software generation should have been found out seriou=
sly broken long
> > > > > > > > > > > time ago!
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > The controllers you are referring to might lack support=
 for commands requiring
> > > > > > > > > > dummy clock cycles but I really hope they work with the=
 other commands? If so I
> > > > > > > > >
> > > > > > > > > I am not sure why you view dummy clock cycles as somethin=
g special
> > > > > > > > > that needs some special support from the SPI controller. =
For the case
> > > > > > > > > 1 controller, it's nothing special from the controller pe=
rspective,
> > > > > > > > > just like sending out a command, or address bytes, or dat=
a. The
> > > > > > > > > controller just shifts data bit by bit from its tx fifo a=
nd that's it.
> > > > > > > > > In the Xilinx GQSPI controller case, the dummy cycles can=
 either be
> > > > > > > > > sent via a regular data (the case 1 controller) in the tx=
 fifo, or
> > > > > > > > > automatically generated (case 2 controller) by the hardwa=
re.
> > > > > > > >
> > > > > > > > Ok, I'll try to explain my view point a little differently.=
 For that we also
> > > > > > > > need to keep in mind that QEMU models HW, and any binary th=
at runs on a HW
> > > > > > > > board supported in QEMU should ideally run on that board in=
side QEMU aswell
> > > > > > > > (this can be a bare metal application equaly well as a modi=
fied u-boot/Linux
> > > > > > > > using SPI commands with a non multiple of 8 number of dummy=
 clock cycles).
> > > > > > > >
> > > > > > > > Once functionality has been introduced into QEMU it is not =
easy to know which
> > > > > > > > intentional or untentional features provided by the functio=
nality are being
> > > > > > > > used by users. One of the (perhaps not well known) features=
 I'm aware of that
> > > > > > > > is in use and is provided by the accurate dummy clock cycle=
 modeling inside
> > > > > > > > m25p80 is the be ability to test drivers accurately regardi=
ng the dummy clock
> > > > > > > > cycles (even when using commands with a non-multiple of 8 n=
umber of dummy clock
> > > > > > > > cycles), but there might be others aswell. So by removing t=
his functionality
> > > > > > > > above use case will brake, this since those test will not b=
e reliable.
> > > > > > > > Furthermore, since users tend to be creative it is not poss=
ible to know if
> > > > > > > > there are other use cases that will be affected. This means=
 that in case [1]
> > > > > > > > needs to be followed the safe path is to add functionality =
instead of removing.
> > > > > > > > Luckily it also easier in this case, see below.
> > > > > > >
> > > > > > > I understand there might be users other than U-Boot/Linux tha=
t use an
> > > > > > > odd number of dummy bits (not multiple of 8). If your concern=
 was
> > > > > > > about model behavior changes, sure I can update
> > > > > > > qemu/docs/system/deprecated.rst to mention that some flashes =
in the
> > > > > > > m25p80 model now implement dummy cycles as bytes.
> > > > > >
> > > > > > Yes, something like that. My concern is that since this functio=
nality has been
> > > > > > in tree for while, users have found known or unknown features t=
hat got
> > > > > > introduced by it. By removing the functionality (and the known/=
uknown features)
> > > > > > we are riscing to brake our user's use cases (currently I'm awa=
re of one
> > > > > > feature/use case but it is not unlikely that there are more). [=
1] states that
> > > > > > "In general features are intended to be supported indefinitely =
once introduced
> > > > > > into QEMU", to me that makes very much sense because the opposi=
te would mean
> > > > > > that we were not reliable. So in case [1] needs to be honored i=
t looks to be
> > > > > > safer to add functionality instead of removing (and riscing the=
 removal of use
> > > > > > cases/features). Luckily I still believe in this case that it w=
ill be easier to
> > > > > > go forward (even if I also agree on what you are saying below a=
bout what I
> > > > > > proposed).
> > > > > >
> > > > >
> > > > > Even if the implementation is buggy and we need to keep the buggy
> > > > > implementation forever? I think that's why
> > > > > qemu/docs/system/deprecated.rst was created for deprecating such
> > > > > feature.
> > > >
> > > > With the RFC I posted all commands in m25p80 are working for both t=
he case 1
> > > > controller (using a txfifo) and the case 2 controller (no txfifo, a=
s GQSPI).
> > > > Because of this, I, with all respect, will have to disagree that th=
is is buggy.
> > >
> > > Well, the existing m25p80 implementation that uses dummy cycle
> > > accuracy for those flashes prevents all SPI controllers that use tx
> > > fifo to work with those flashes. Hence it is buggy.
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > don't think it is fair to call them 'seriously broken' =
(and else we should
> > > > > > > > > > probably let the maintainers know about it). Most likel=
y the lack of support
> > > > > > > > >
> > > > > > > > > I called it "seriously broken" because current implementa=
tion only
> > > > > > > > > considered one type of SPI controllers while completely i=
gnoring the
> > > > > > > > > other type.
> > > > > > > >
> > > > > > > > If we change view and see this from the perspective of m25p=
80, it models the
> > > > > > > > commands a certain way and provides an API that the SPI con=
trollers need to
> > > > > > > > implement for interacting with it. It is true that there ar=
e SPI controllers
> > > > > > > > referred to above that do not support the portion of that A=
PI that corresponds
> > > > > > > > to commands with dummy clock cycles, but I don't think it i=
s true that this is
> > > > > > > > broken since there is also one SPI controller that has a wo=
rking implementation
> > > > > > > > of m25p80's full API also when transfering through a tx fif=
o (use case 1). But
> > > > > > > > as mentioned above, by doing a minor extension and improvem=
ent to m25p80's API
> > > > > > > > and allow for toggling the accuracy from dummy clock cycles=
 to dummy bytes [1]
> > > > > > > > will still be honored as in the same time making it possibl=
e to have full
> > > > > > > > support for the API in the SPI controllers that currently d=
o not (please reread
> > > > > > > > the proposal in my previous reply that attempts to do this)=
. I myself see this
> > > > > > > > as win/win situation, also because no controller should nee=
d modifications.
> > > > > > > >
> > > > > > >
> > > > > > > I am afraid your proposal does not work. Your proposed new de=
vice
> > > > > > > property 'model_dummy_bytes' to select to convert the accurat=
e dummy
> > > > > > > clock cycle count to dummy bytes inside m25p80, is hard to ju=
stify as
> > > > > > > a property to the flash itself, as the behavior is tightly co=
upled to
> > > > > > > how the SPI controller works.
> > > > > >
> > > > > > I agree on above. I decided though that instead of posting samp=
le code in here
> > > > > > I'll post an RFC with hopefully an improved proposal. I'll cc y=
ou. About below,
> > > > > > Xilinx ZynqMP GQSPI should not need any modication in a first s=
tep.
> > > > > >
> > > > >
> > > > > Wait, (see below)
> > > > >
> > > > > > >
> > > > > > > Please take a look at the Xilinx GQSPI controller, which supp=
orts both
> > > > > > > use cases, that the dummy cycles can be transferred via tx fi=
fo, or
> > > > > > > generated by the controller automatically. Please read the ex=
ample
> > > > > > > given in:
> > > > > > >
> > > > > > >     table 24=E2=80=9022, an example of Generic FIFO Contents =
for Quad I/O Read
> > > > > > > Command (EBh)
> > > > > > >
> > > > > > > in https://www.xilinx.com/support/documentation/user_guides/u=
g1085-zynq-ultrascale-trm.pdf
> > > > > > >
> > > > > > > If you choose to set the m25p80 device property 'model_dummy_=
bytes' to
> > > > > > > true when working with the Xilinx GQSPI controller, you are b=
ound to
> > > > > > > only allow guest software to use tx fifo to transfer the dumm=
y cycles,
> > > > > > > and this is wrong.
> > > > > > >
> > > > >
> > > > > You missed this part. I looked at your RFC, and as I mentioned ab=
ove
> > > > > your proposal cannot support the complicated controller like Xili=
nx
> > > > > GQSPI. Please read the example of table 24-22. With your RFC, you
> > > > > mandate guest software's GQSPI driver to only use hardware dummy =
cycle
> > > > > generation, which is wrong.
> > > > >
> > > >
> > > > First, thank you very much for looking into the RFC series, very mu=
ch
> > > > appreciated. Secondly, about above, the GQSPI model in QEMU transfe=
rs from 2
> > > > locations in the file, in 1 location the transfer referred to above=
 is done, in
> > > > another location the transfer through the txfifo is done. The locat=
ion where
> > > > transfer referred to above is done will not need any modifications =
(and will
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

Hello maintainers,

We apparently missed the 6.0 window to address this mess of the m25p80
model. Please provide your inputs on this before I start working on
the v2.

Regards,
Bin

