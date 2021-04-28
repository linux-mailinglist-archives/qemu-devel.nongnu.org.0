Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E00E36D81B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:14:21 +0200 (CEST)
Received: from localhost ([::1]:50032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbk1E-0004yw-6Z
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lbjzR-0004HP-8l; Wed, 28 Apr 2021 09:12:29 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:46931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lbjzO-0005d6-F1; Wed, 28 Apr 2021 09:12:29 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id y2so71703657ybq.13;
 Wed, 28 Apr 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1P0clZc20VUlydS5uIx6Qa1e7WWqXzI0B2HyBFsl+xU=;
 b=U2a8vIgjvh0Makm8VTupFl3Sj7kckae5nQk6Hh7RehHGw7JuZNeC2ByVgBrS/F87dK
 MLymVM2YyjxpHWFEH03YWDeIFecWXB+adU8akouFjpGtEiOPejtjbYmxJ1+n3o0tOkdB
 oa11Udmp58XtW2c8Qx6d4m4yDNC9Lm70GlHN9Kt9jzUMky31Feetk+LuO0XqBcLV0HCH
 Sy5jQAFvhT8tMAf3DXFu6L+4Hl6RvwBN7w/JAGXzvwlJrK4Yhy7NxwJwYKrLQyslQNjK
 2aNSJs08Ym3PhVsF4okPwg6MTn+4O6Dgcif0HV+9IeDX9rwL/prs69lGpuKZjcxut5q8
 1yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1P0clZc20VUlydS5uIx6Qa1e7WWqXzI0B2HyBFsl+xU=;
 b=jEI3skHX2Fsh4hs2fFYqMy3PUic+c3Bl7q9ujAoZkqkOZIi1S3ujhiGL0B6e1Yflkt
 g7VIjfBS+PlclH3qT7ecjuXTmSTh9L2eZaER2odozQNk65dD0gDSpwtEAEiJOAkElEAN
 30G8I3JagDJeoQKpWDAREXcS7uopp/U6zyCfwuYhZ2QwpoPbJgON9K2867rNfjHqztcO
 /3lRauYI65XGS5WeVHidiQLAgZ8n7NoMyclhsDArC69fFpdLz0uHFYGELXPRSorhr440
 6boZTRJQxY8OPKaVKeiKsoW3/t6ZBQceajjkPQJY2zgNpZqS52HNtK/upD9JJc68wNZS
 F9WQ==
X-Gm-Message-State: AOAM533b6sUqCssz1WCS8qKK3s0Qd82Yd+FYmQHEn087/10jzJdwoVDy
 FfwES9SW7NF16L7S2Nop2Z0CsJY3fNX5u6u0SUw=
X-Google-Smtp-Source: ABdhPJxZGgpmV4Q5FiONZvT+5i8KvtS6jRTIilk8GAmVf750hG+DpXN8U1D1NVOE71iWQlcXMzgmN3gfo3gF+PAmpFk=
X-Received: by 2002:a25:504b:: with SMTP id e72mr38226164ybb.152.1619615541315; 
 Wed, 28 Apr 2021 06:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210118100557.GA11373@fralle-msi>
 <CAEUhbmWT50o8OV_QAimhs5itWq3pFd6CTKup6PFpvSs2KYpf2w@mail.gmail.com>
 <20210119130113.GA28306@fralle-msi>
 <CAEUhbmUBAgF4D__jsfbE7yGd++5ZH3YOutTiOBOot52sNCV-eg@mail.gmail.com>
 <20210121085006.GA10391@fralle-msi>
 <CAEUhbmUh54vqXmtkjnTzk7Y6U+oZEbw-O3ode+CdKbfZ0Qs+9Q@mail.gmail.com>
 <20210121141844.GC10391@fralle-msi>
 <CAEUhbmWT9QPa-EFRdQme2L9hiUJSYWZWfmzQTShQN86WMW93ew@mail.gmail.com>
 <CAEUhbmXwq-7mwbuwp_29iXDT4AZYTBE4PFDxhaHoZkrCRumCaw@mail.gmail.com>
 <CAKmqyKMkgR6p7G3MscSvVHHZuYF2p4piq9W1o+Ye9SSuOqszOA@mail.gmail.com>
 <20210427085433.GA9656@fralle-msi>
 <1fe8a69c-df7b-c924-69c6-c9db905f8f95@kaod.org>
In-Reply-To: <1fe8a69c-df7b-c924-69c6-c9db905f8f95@kaod.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Apr 2021 21:12:11 +0800
Message-ID: <CAEUhbmVj4gU40P3Hd_5ugD0KD=szoWcye=DODhAdStz6N1KLTA@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Joe Komlodi <komlodi@xilinx.com>, Alistair Francis <alistair23@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi C=C3=A9dric,

On Tue, Apr 27, 2021 at 10:32 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> Hello,
>
> On 4/27/21 10:54 AM, Francisco Iglesias wrote:
> > On [2021 Apr 27] Tue 15:56:10, Alistair Francis wrote:
> >> On Fri, Apr 23, 2021 at 4:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>
> >>> On Mon, Feb 8, 2021 at 10:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>
> >>>> On Thu, Jan 21, 2021 at 10:18 PM Francisco Iglesias
> >>>> <frasse.iglesias@gmail.com> wrote:
> >>>>>
> >>>>> Hi Bin,
> >>>>>
> >>>>> On [2021 Jan 21] Thu 16:59:51, Bin Meng wrote:
> >>>>>> Hi Francisco,
> >>>>>>
> >>>>>> On Thu, Jan 21, 2021 at 4:50 PM Francisco Iglesias
> >>>>>> <frasse.iglesias@gmail.com> wrote:
> >>>>>>>
> >>>>>>> Dear Bin,
> >>>>>>>
> >>>>>>> On [2021 Jan 20] Wed 22:20:25, Bin Meng wrote:
> >>>>>>>> Hi Francisco,
> >>>>>>>>
> >>>>>>>> On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias
> >>>>>>>> <frasse.iglesias@gmail.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Bin,
> >>>>>>>>>
> >>>>>>>>> On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:
> >>>>>>>>>> Hi Francisco,
> >>>>>>>>>>
> >>>>>>>>>> On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
> >>>>>>>>>> <frasse.iglesias@gmail.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> Hi Bin,
> >>>>>>>>>>>
> >>>>>>>>>>> On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
> >>>>>>>>>>>> Hi Francisco,
> >>>>>>>>>>>>
> >>>>>>>>>>>> On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
> >>>>>>>>>>>> <frasse.iglesias@gmail.com> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Hi Bin,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> >>>>>>>>>>>>>> Hi Francisco,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> >>>>>>>>>>>>>> <frasse.iglesias@gmail.com> wrote:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Hi Bin,
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> >>>>>>>>>>>>>>>> From: Bin Meng <bin.meng@windriver.com>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> The m25p80 model uses s->needed_bytes to indicate how ma=
ny follow-up
> >>>>>>>>>>>>>>>> bytes are expected to be received after it receives a co=
mmand. For
> >>>>>>>>>>>>>>>> example, depending on the address mode, either 3-byte ad=
dress or
> >>>>>>>>>>>>>>>> 4-byte address is needed.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> For fast read family commands, some dummy cycles are req=
uired after
> >>>>>>>>>>>>>>>> sending the address bytes, and the dummy cycles need to =
be counted
> >>>>>>>>>>>>>>>> in s->needed_bytes. This is where the mess began.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> As the variable name (needed_bytes) indicates, the unit =
is in byte.
> >>>>>>>>>>>>>>>> It is not in bit, or cycle. However for some reason the =
model has
> >>>>>>>>>>>>>>>> been using the number of dummy cycles for s->needed_byte=
s. The right
> >>>>>>>>>>>>>>>> approach is to convert the number of dummy cycles to byt=
es based on
> >>>>>>>>>>>>>>>> the SPI protocol, for example, 6 dummy cycles for the Fa=
st Read Quad
> >>>>>>>>>>>>>>>> I/O (EBh) should be converted to 3 bytes per the formula=
 (6 * 4 / 8).
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> While not being the original implementor I must assume th=
at above solution was
> >>>>>>>>>>>>>>> considered but not chosen by the developers due to it is =
inaccuracy (it
> >>>>>>>>>>>>>>> wouldn't be possible to model exacly 6 dummy cycles, only=
 a multiple of 8,
> >>>>>>>>>>>>>>> meaning that if the controller is wrongly programmed to g=
enerate 7 the error
> >>>>>>>>>>>>>>> wouldn't be caught and the controller will still be consi=
dered "correct"). Now
> >>>>>>>>>>>>>>> that we have this detail in the implementation I'm in fav=
or of keeping it, this
> >>>>>>>>>>>>>>> also because the detail is already in use for catching ex=
actly above error.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> I found no clue from the commit message that my proposed s=
olution here
> >>>>>>>>>>>>>> was ever considered, otherwise all SPI controller models s=
upporting
> >>>>>>>>>>>>>> software generation should have been found out seriously b=
roken long
> >>>>>>>>>>>>>> time ago!
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The controllers you are referring to might lack support for=
 commands requiring
> >>>>>>>>>>>>> dummy clock cycles but I really hope they work with the oth=
er commands? If so I
> >>>>>>>>>>>>
> >>>>>>>>>>>> I am not sure why you view dummy clock cycles as something s=
pecial
> >>>>>>>>>>>> that needs some special support from the SPI controller. For=
 the case
> >>>>>>>>>>>> 1 controller, it's nothing special from the controller persp=
ective,
> >>>>>>>>>>>> just like sending out a command, or address bytes, or data. =
The
> >>>>>>>>>>>> controller just shifts data bit by bit from its tx fifo and =
that's it.
> >>>>>>>>>>>> In the Xilinx GQSPI controller case, the dummy cycles can ei=
ther be
> >>>>>>>>>>>> sent via a regular data (the case 1 controller) in the tx fi=
fo, or
> >>>>>>>>>>>> automatically generated (case 2 controller) by the hardware.
> >>>>>>>>>>>
> >>>>>>>>>>> Ok, I'll try to explain my view point a little differently. F=
or that we also
> >>>>>>>>>>> need to keep in mind that QEMU models HW, and any binary that=
 runs on a HW
> >>>>>>>>>>> board supported in QEMU should ideally run on that board insi=
de QEMU aswell
> >>>>>>>>>>> (this can be a bare metal application equaly well as a modifi=
ed u-boot/Linux
> >>>>>>>>>>> using SPI commands with a non multiple of 8 number of dummy c=
lock cycles).
> >>>>>>>>>>>
> >>>>>>>>>>> Once functionality has been introduced into QEMU it is not ea=
sy to know which
> >>>>>>>>>>> intentional or untentional features provided by the functiona=
lity are being
> >>>>>>>>>>> used by users. One of the (perhaps not well known) features I=
'm aware of that
> >>>>>>>>>>> is in use and is provided by the accurate dummy clock cycle m=
odeling inside
> >>>>>>>>>>> m25p80 is the be ability to test drivers accurately regarding=
 the dummy clock
> >>>>>>>>>>> cycles (even when using commands with a non-multiple of 8 num=
ber of dummy clock
> >>>>>>>>>>> cycles), but there might be others aswell. So by removing thi=
s functionality
> >>>>>>>>>>> above use case will brake, this since those test will not be =
reliable.
> >>>>>>>>>>> Furthermore, since users tend to be creative it is not possib=
le to know if
> >>>>>>>>>>> there are other use cases that will be affected. This means t=
hat in case [1]
> >>>>>>>>>>> needs to be followed the safe path is to add functionality in=
stead of removing.
> >>>>>>>>>>> Luckily it also easier in this case, see below.
> >>>>>>>>>>
> >>>>>>>>>> I understand there might be users other than U-Boot/Linux that=
 use an
> >>>>>>>>>> odd number of dummy bits (not multiple of 8). If your concern =
was
> >>>>>>>>>> about model behavior changes, sure I can update
> >>>>>>>>>> qemu/docs/system/deprecated.rst to mention that some flashes i=
n the
> >>>>>>>>>> m25p80 model now implement dummy cycles as bytes.
> >>>>>>>>>
> >>>>>>>>> Yes, something like that. My concern is that since this functio=
nality has been
> >>>>>>>>> in tree for while, users have found known or unknown features t=
hat got
> >>>>>>>>> introduced by it. By removing the functionality (and the known/=
uknown features)
> >>>>>>>>> we are riscing to brake our user's use cases (currently I'm awa=
re of one
> >>>>>>>>> feature/use case but it is not unlikely that there are more). [=
1] states that
> >>>>>>>>> "In general features are intended to be supported indefinitely =
once introduced
> >>>>>>>>> into QEMU", to me that makes very much sense because the opposi=
te would mean
> >>>>>>>>> that we were not reliable. So in case [1] needs to be honored i=
t looks to be
> >>>>>>>>> safer to add functionality instead of removing (and riscing the=
 removal of use
> >>>>>>>>> cases/features). Luckily I still believe in this case that it w=
ill be easier to
> >>>>>>>>> go forward (even if I also agree on what you are saying below a=
bout what I
> >>>>>>>>> proposed).
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Even if the implementation is buggy and we need to keep the bugg=
y
> >>>>>>>> implementation forever? I think that's why
> >>>>>>>> qemu/docs/system/deprecated.rst was created for deprecating such
> >>>>>>>> feature.
> >>>>>>>
> >>>>>>> With the RFC I posted all commands in m25p80 are working for both=
 the case 1
> >>>>>>> controller (using a txfifo) and the case 2 controller (no txfifo,=
 as GQSPI).
> >>>>>>> Because of this, I, with all respect, will have to disagree that =
this is buggy.
> >>>>>>
> >>>>>> Well, the existing m25p80 implementation that uses dummy cycle
> >>>>>> accuracy for those flashes prevents all SPI controllers that use t=
x
> >>>>>> fifo to work with those flashes. Hence it is buggy.
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>> don't think it is fair to call them 'seriously broken' (and=
 else we should
> >>>>>>>>>>>>> probably let the maintainers know about it). Most likely th=
e lack of support
> >>>>>>>>>>>>
> >>>>>>>>>>>> I called it "seriously broken" because current implementatio=
n only
> >>>>>>>>>>>> considered one type of SPI controllers while completely igno=
ring the
> >>>>>>>>>>>> other type.
> >>>>>>>>>>>
> >>>>>>>>>>> If we change view and see this from the perspective of m25p80=
, it models the
> >>>>>>>>>>> commands a certain way and provides an API that the SPI contr=
ollers need to
> >>>>>>>>>>> implement for interacting with it. It is true that there are =
SPI controllers
> >>>>>>>>>>> referred to above that do not support the portion of that API=
 that corresponds
> >>>>>>>>>>> to commands with dummy clock cycles, but I don't think it is =
true that this is
> >>>>>>>>>>> broken since there is also one SPI controller that has a work=
ing implementation
> >>>>>>>>>>> of m25p80's full API also when transfering through a tx fifo =
(use case 1). But
> >>>>>>>>>>> as mentioned above, by doing a minor extension and improvemen=
t to m25p80's API
> >>>>>>>>>>> and allow for toggling the accuracy from dummy clock cycles t=
o dummy bytes [1]
> >>>>>>>>>>> will still be honored as in the same time making it possible =
to have full
> >>>>>>>>>>> support for the API in the SPI controllers that currently do =
not (please reread
> >>>>>>>>>>> the proposal in my previous reply that attempts to do this). =
I myself see this
> >>>>>>>>>>> as win/win situation, also because no controller should need =
modifications.
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> I am afraid your proposal does not work. Your proposed new dev=
ice
> >>>>>>>>>> property 'model_dummy_bytes' to select to convert the accurate=
 dummy
> >>>>>>>>>> clock cycle count to dummy bytes inside m25p80, is hard to jus=
tify as
> >>>>>>>>>> a property to the flash itself, as the behavior is tightly cou=
pled to
> >>>>>>>>>> how the SPI controller works.
> >>>>>>>>>
> >>>>>>>>> I agree on above. I decided though that instead of posting samp=
le code in here
> >>>>>>>>> I'll post an RFC with hopefully an improved proposal. I'll cc y=
ou. About below,
> >>>>>>>>> Xilinx ZynqMP GQSPI should not need any modication in a first s=
tep.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Wait, (see below)
> >>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Please take a look at the Xilinx GQSPI controller, which suppo=
rts both
> >>>>>>>>>> use cases, that the dummy cycles can be transferred via tx fif=
o, or
> >>>>>>>>>> generated by the controller automatically. Please read the exa=
mple
> >>>>>>>>>> given in:
> >>>>>>>>>>
> >>>>>>>>>>     table 24=E2=80=9022, an example of Generic FIFO Contents f=
or Quad I/O Read
> >>>>>>>>>> Command (EBh)
> >>>>>>>>>>
> >>>>>>>>>> in https://www.xilinx.com/support/documentation/user_guides/ug=
1085-zynq-ultrascale-trm.pdf
> >>>>>>>>>>
> >>>>>>>>>> If you choose to set the m25p80 device property 'model_dummy_b=
ytes' to
> >>>>>>>>>> true when working with the Xilinx GQSPI controller, you are bo=
und to
> >>>>>>>>>> only allow guest software to use tx fifo to transfer the dummy=
 cycles,
> >>>>>>>>>> and this is wrong.
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>> You missed this part. I looked at your RFC, and as I mentioned a=
bove
> >>>>>>>> your proposal cannot support the complicated controller like Xil=
inx
> >>>>>>>> GQSPI. Please read the example of table 24-22. With your RFC, yo=
u
> >>>>>>>> mandate guest software's GQSPI driver to only use hardware dummy=
 cycle
> >>>>>>>> generation, which is wrong.
> >>>>>>>>
> >>>>>>>
> >>>>>>> First, thank you very much for looking into the RFC series, very =
much
> >>>>>>> appreciated. Secondly, about above, the GQSPI model in QEMU trans=
fers from 2
> >>>>>>> locations in the file, in 1 location the transfer referred to abo=
ve is done, in
> >>>>>>> another location the transfer through the txfifo is done. The loc=
ation where
> >>>>>>> transfer referred to above is done will not need any modification=
s (and will
> >>>>>>> thus work equally well as it does currently).
> >>>>>>
> >>>>>> Please explain this a little bit. How does your RFC series handle
> >>>>>> cases as described in table 24-22, where the 6 dummy cycles are sp=
lit
> >>>>>> into 2 transfers, with one transfer using tx fifo, and the other o=
ne
> >>>>>> using hardware dummy cycle generation?
> >>>>>
> >>>>> Sorry, I missunderstod. You are right, that won't work.
> >>>>
> >>>> +Edgar E. Iglesias
> >>>>
> >>>> So it looks by far the only way to implement dummy cycles correctly =
to
> >>>> work with all SPI controller models is what I proposed here in this
> >>>> patch series.
> >>>>
> >>>> Maintainers are quite silent, so I would like to hear your thoughts.
> >>>>
> >>>> @Alistair Francis @Philippe Mathieu-Daud=C3=A9 @Peter Maydell would =
you
> >>>> please share your thoughts since you are the one who reviewed the
> >>>> existing dummy implementation (based on commits history)
> >>
> >> I agree with Edgar, in that Francisco and Bin know this better than me
> >> and that modelling things in cycles is a pain.
> >
> > Hi Alistair,
> >
> >>
> >> As Bin points out it seems like currently we should be modelling bytes
> >> (from the variable name) so it makes sense to keep it in bytes. I
> >> would be in favour of this series in that case. Do we know what use
> >> cases this will break? I know it's hard to answer but I don't think
> >> there are too many SSI users in QEMU so it might not be too hard to
> >> test most of the possible use cases.
> >
> > The use case I'm aware of is regression testing of drivers. Ex: if a
> > driver is using 10 dummy clock cycles with the commands and a patch
> > accidentaly changes the driver to use 11 dummy clock cycles QEMU curren=
tly
> > finds the problem, that won't be possible with this series. It's diffic=
ult
> > to say but it is not impossible there are other use cases also.
>
>
> It was breaking the Aspeed machines :
>
>   https://lore.kernel.org/qemu-devel/78a12882-1303-dd6d-6619-96c5e2cbf531=
@kaod.org/

Yes, as I mentioned in the series the modification was based on a pure
guess from existing QEMU codes as I could not find a datasheet of the
Aspeed SPI controller on the internet. Do you know if this is publicly
available?

>
> QEMU 6.1 should have acceptance tests that will help in detecting
> regressions in this area.
>

Regards,
Bin

