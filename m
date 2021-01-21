Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74342FE5B9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:03:13 +0100 (CET)
Received: from localhost ([::1]:60480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Vs0-00049n-TA
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2VpA-00032x-8g; Thu, 21 Jan 2021 04:00:16 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:45398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2Vp6-0007RC-29; Thu, 21 Jan 2021 04:00:15 -0500
Received: by mail-yb1-xb29.google.com with SMTP id e67so1315059ybc.12;
 Thu, 21 Jan 2021 01:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9pUmNYDArRVI1pFXJvbr6KXfnM/Wqx5Y0CqXnj19YBs=;
 b=AYACVBTEWFsuVohMKquyUSMhE3KcR9pIDy66wrD/FarwUlFEEY3Ob9M7C7PbNNMys4
 +W3ubHT21ULGjMUkRJT9918hmmo/6syuw52Rvr+1314fKlWkCOl0rhTaUwd2i/db2rTO
 Oa+JA07ioLmfTIZ6KQFvHp0fe/2JC6mBNxQvl1PKmhhA/PSeazGbtiTbjbvLhVfG0rvO
 9HAQIVHUO0By0+RMBYM+6rFBksd6xLB7j6CpKNQ7DYk6Vyx2RDnY91OvPDgqdiznWOdH
 U8nRE6aEwIwxpeoKYwkZ99pA6V+FnzJzAc3g2foNG/mcIdf8Btxn9G5eWCJ4+/e7QpCf
 JShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9pUmNYDArRVI1pFXJvbr6KXfnM/Wqx5Y0CqXnj19YBs=;
 b=LK8DEyjDrWgp3Mp7qX15Fxm4TAhbn5xb5Qs9YYOWBO0Zov3NzLTq1s6nGT1/v8Zoqf
 FqtB72WffgWrmYQfhrA6S0s1PYBDbvlgTQiZmGPQB2HD6CjffziPhl4TZQGg7ovvFWvj
 aaSzYH02zoIh7e7J9Z/U2VMMWz6xpLt3BEjUDcc/rFZ5F2mPUy40DgWryF1oi+AumtML
 xy3LTBxp0mU/fVP58eZbxvu9bJuAgjRby+sg1/wbaTpNjIOkvw0zYUyvLfUL5si5LGw1
 OgzgfV+70RgH0olTtID1tiPrx2bLMlFY/A34sKwc6UwudY3K32+QXpl4v2qlFdGSz6hT
 nAXg==
X-Gm-Message-State: AOAM533lHbad8GW80qB2dMUpQ/x08acdEVEX9vsoYSU11zEEHd8NV3ld
 wM5CVJmuLllzKowwzA8+Fkwv1vmVSibi43UYYrg=
X-Google-Smtp-Source: ABdhPJzWJCCkkDKAhEsAunrZ+7pAb9hSoMLG95aiVmjHrFi+f0RmgQHfRSXWsxbY5s3Nk7dkXuMArcIpGV4GBeMssT4=
X-Received: by 2002:a25:cacc:: with SMTP id
 a195mr14385099ybg.306.1611219609889; 
 Thu, 21 Jan 2021 01:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
 <20210115122627.GB29923@fralle-msi>
 <CAEUhbmVYgP063iqY0c10y9zKBmx00Z6vr3BO3RjoRo-CXQpYDw@mail.gmail.com>
 <20210118100557.GA11373@fralle-msi>
 <CAEUhbmWT50o8OV_QAimhs5itWq3pFd6CTKup6PFpvSs2KYpf2w@mail.gmail.com>
 <20210119130113.GA28306@fralle-msi>
 <CAEUhbmUBAgF4D__jsfbE7yGd++5ZH3YOutTiOBOot52sNCV-eg@mail.gmail.com>
 <20210121085006.GA10391@fralle-msi>
In-Reply-To: <20210121085006.GA10391@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Jan 2021 16:59:51 +0800
Message-ID: <CAEUhbmUh54vqXmtkjnTzk7Y6U+oZEbw-O3ode+CdKbfZ0Qs+9Q@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Thu, Jan 21, 2021 at 4:50 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Dear Bin,
>
> On [2021 Jan 20] Wed 22:20:25, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hi Bin,
> > >
> > > On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Hi Bin,
> > > > >
> > > > > On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
> > > > > > Hi Francisco,
> > > > > >
> > > > > > On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
> > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Bin,
> > > > > > >
> > > > > > > On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> > > > > > > > Hi Francisco,
> > > > > > > >
> > > > > > > > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Bin,
> > > > > > > > >
> > > > > > > > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > >
> > > > > > > > > > The m25p80 model uses s->needed_bytes to indicate how m=
any follow-up
> > > > > > > > > > bytes are expected to be received after it receives a c=
ommand. For
> > > > > > > > > > example, depending on the address mode, either 3-byte a=
ddress or
> > > > > > > > > > 4-byte address is needed.
> > > > > > > > > >
> > > > > > > > > > For fast read family commands, some dummy cycles are re=
quired after
> > > > > > > > > > sending the address bytes, and the dummy cycles need to=
 be counted
> > > > > > > > > > in s->needed_bytes. This is where the mess began.
> > > > > > > > > >
> > > > > > > > > > As the variable name (needed_bytes) indicates, the unit=
 is in byte.
> > > > > > > > > > It is not in bit, or cycle. However for some reason the=
 model has
> > > > > > > > > > been using the number of dummy cycles for s->needed_byt=
es. The right
> > > > > > > > > > approach is to convert the number of dummy cycles to by=
tes based on
> > > > > > > > > > the SPI protocol, for example, 6 dummy cycles for the F=
ast Read Quad
> > > > > > > > > > I/O (EBh) should be converted to 3 bytes per the formul=
a (6 * 4 / 8).
> > > > > > > > >
> > > > > > > > > While not being the original implementor I must assume th=
at above solution was
> > > > > > > > > considered but not chosen by the developers due to it is =
inaccuracy (it
> > > > > > > > > wouldn't be possible to model exacly 6 dummy cycles, only=
 a multiple of 8,
> > > > > > > > > meaning that if the controller is wrongly programmed to g=
enerate 7 the error
> > > > > > > > > wouldn't be caught and the controller will still be consi=
dered "correct"). Now
> > > > > > > > > that we have this detail in the implementation I'm in fav=
or of keeping it, this
> > > > > > > > > also because the detail is already in use for catching ex=
actly above error.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I found no clue from the commit message that my proposed so=
lution here
> > > > > > > > was ever considered, otherwise all SPI controller models su=
pporting
> > > > > > > > software generation should have been found out seriously br=
oken long
> > > > > > > > time ago!
> > > > > > >
> > > > > > >
> > > > > > > The controllers you are referring to might lack support for c=
ommands requiring
> > > > > > > dummy clock cycles but I really hope they work with the other=
 commands? If so I
> > > > > >
> > > > > > I am not sure why you view dummy clock cycles as something spec=
ial
> > > > > > that needs some special support from the SPI controller. For th=
e case
> > > > > > 1 controller, it's nothing special from the controller perspect=
ive,
> > > > > > just like sending out a command, or address bytes, or data. The
> > > > > > controller just shifts data bit by bit from its tx fifo and tha=
t's it.
> > > > > > In the Xilinx GQSPI controller case, the dummy cycles can eithe=
r be
> > > > > > sent via a regular data (the case 1 controller) in the tx fifo,=
 or
> > > > > > automatically generated (case 2 controller) by the hardware.
> > > > >
> > > > > Ok, I'll try to explain my view point a little differently. For t=
hat we also
> > > > > need to keep in mind that QEMU models HW, and any binary that run=
s on a HW
> > > > > board supported in QEMU should ideally run on that board inside Q=
EMU aswell
> > > > > (this can be a bare metal application equaly well as a modified u=
-boot/Linux
> > > > > using SPI commands with a non multiple of 8 number of dummy clock=
 cycles).
> > > > >
> > > > > Once functionality has been introduced into QEMU it is not easy t=
o know which
> > > > > intentional or untentional features provided by the functionality=
 are being
> > > > > used by users. One of the (perhaps not well known) features I'm a=
ware of that
> > > > > is in use and is provided by the accurate dummy clock cycle model=
ing inside
> > > > > m25p80 is the be ability to test drivers accurately regarding the=
 dummy clock
> > > > > cycles (even when using commands with a non-multiple of 8 number =
of dummy clock
> > > > > cycles), but there might be others aswell. So by removing this fu=
nctionality
> > > > > above use case will brake, this since those test will not be reli=
able.
> > > > > Furthermore, since users tend to be creative it is not possible t=
o know if
> > > > > there are other use cases that will be affected. This means that =
in case [1]
> > > > > needs to be followed the safe path is to add functionality instea=
d of removing.
> > > > > Luckily it also easier in this case, see below.
> > > >
> > > > I understand there might be users other than U-Boot/Linux that use =
an
> > > > odd number of dummy bits (not multiple of 8). If your concern was
> > > > about model behavior changes, sure I can update
> > > > qemu/docs/system/deprecated.rst to mention that some flashes in the
> > > > m25p80 model now implement dummy cycles as bytes.
> > >
> > > Yes, something like that. My concern is that since this functionality=
 has been
> > > in tree for while, users have found known or unknown features that go=
t
> > > introduced by it. By removing the functionality (and the known/uknown=
 features)
> > > we are riscing to brake our user's use cases (currently I'm aware of =
one
> > > feature/use case but it is not unlikely that there are more). [1] sta=
tes that
> > > "In general features are intended to be supported indefinitely once i=
ntroduced
> > > into QEMU", to me that makes very much sense because the opposite wou=
ld mean
> > > that we were not reliable. So in case [1] needs to be honored it look=
s to be
> > > safer to add functionality instead of removing (and riscing the remov=
al of use
> > > cases/features). Luckily I still believe in this case that it will be=
 easier to
> > > go forward (even if I also agree on what you are saying below about w=
hat I
> > > proposed).
> > >
> >
> > Even if the implementation is buggy and we need to keep the buggy
> > implementation forever? I think that's why
> > qemu/docs/system/deprecated.rst was created for deprecating such
> > feature.
>
> With the RFC I posted all commands in m25p80 are working for both the cas=
e 1
> controller (using a txfifo) and the case 2 controller (no txfifo, as GQSP=
I).
> Because of this, I, with all respect, will have to disagree that this is =
buggy.

Well, the existing m25p80 implementation that uses dummy cycle
accuracy for those flashes prevents all SPI controllers that use tx
fifo to work with those flashes. Hence it is buggy.

>
> >
> > > >
> > > > > >
> > > > > > > don't think it is fair to call them 'seriously broken' (and e=
lse we should
> > > > > > > probably let the maintainers know about it). Most likely the =
lack of support
> > > > > >
> > > > > > I called it "seriously broken" because current implementation o=
nly
> > > > > > considered one type of SPI controllers while completely ignorin=
g the
> > > > > > other type.
> > > > >
> > > > > If we change view and see this from the perspective of m25p80, it=
 models the
> > > > > commands a certain way and provides an API that the SPI controlle=
rs need to
> > > > > implement for interacting with it. It is true that there are SPI =
controllers
> > > > > referred to above that do not support the portion of that API tha=
t corresponds
> > > > > to commands with dummy clock cycles, but I don't think it is true=
 that this is
> > > > > broken since there is also one SPI controller that has a working =
implementation
> > > > > of m25p80's full API also when transfering through a tx fifo (use=
 case 1). But
> > > > > as mentioned above, by doing a minor extension and improvement to=
 m25p80's API
> > > > > and allow for toggling the accuracy from dummy clock cycles to du=
mmy bytes [1]
> > > > > will still be honored as in the same time making it possible to h=
ave full
> > > > > support for the API in the SPI controllers that currently do not =
(please reread
> > > > > the proposal in my previous reply that attempts to do this). I my=
self see this
> > > > > as win/win situation, also because no controller should need modi=
fications.
> > > > >
> > > >
> > > > I am afraid your proposal does not work. Your proposed new device
> > > > property 'model_dummy_bytes' to select to convert the accurate dumm=
y
> > > > clock cycle count to dummy bytes inside m25p80, is hard to justify =
as
> > > > a property to the flash itself, as the behavior is tightly coupled =
to
> > > > how the SPI controller works.
> > >
> > > I agree on above. I decided though that instead of posting sample cod=
e in here
> > > I'll post an RFC with hopefully an improved proposal. I'll cc you. Ab=
out below,
> > > Xilinx ZynqMP GQSPI should not need any modication in a first step.
> > >
> >
> > Wait, (see below)
> >
> > > >
> > > > Please take a look at the Xilinx GQSPI controller, which supports b=
oth
> > > > use cases, that the dummy cycles can be transferred via tx fifo, or
> > > > generated by the controller automatically. Please read the example
> > > > given in:
> > > >
> > > >     table 24=E2=80=9022, an example of Generic FIFO Contents for Qu=
ad I/O Read
> > > > Command (EBh)
> > > >
> > > > in https://www.xilinx.com/support/documentation/user_guides/ug1085-=
zynq-ultrascale-trm.pdf
> > > >
> > > > If you choose to set the m25p80 device property 'model_dummy_bytes'=
 to
> > > > true when working with the Xilinx GQSPI controller, you are bound t=
o
> > > > only allow guest software to use tx fifo to transfer the dummy cycl=
es,
> > > > and this is wrong.
> > > >
> >
> > You missed this part. I looked at your RFC, and as I mentioned above
> > your proposal cannot support the complicated controller like Xilinx
> > GQSPI. Please read the example of table 24-22. With your RFC, you
> > mandate guest software's GQSPI driver to only use hardware dummy cycle
> > generation, which is wrong.
> >
>
> First, thank you very much for looking into the RFC series, very much
> appreciated. Secondly, about above, the GQSPI model in QEMU transfers fro=
m 2
> locations in the file, in 1 location the transfer referred to above is do=
ne, in
> another location the transfer through the txfifo is done. The location wh=
ere
> transfer referred to above is done will not need any modifications (and w=
ill
> thus work equally well as it does currently).

Please explain this a little bit. How does your RFC series handle
cases as described in table 24-22, where the 6 dummy cycles are split
into 2 transfers, with one transfer using tx fifo, and the other one
using hardware dummy cycle generation?

>
> Now that above has is cleared out, and since I know you are heavily loade=
d with
> other higher prio tasks, lets wait for the maintainers to also have a loo=
k into
> the RFC (understandibly this can take some time due to that they also are
> heavily loaded).

Yes, maintainers are pretty much silent on this topic.

However may I ask you to provide more details on my questions below on
booting U-Boot/Linux with the QEMU?

You can post patches to add documentation for zynqmp in
docs/system/arm, or once I get a working instructions, I could do that
too. Much appreciated.

>
> Best regards,
> Francisco Iglesias
>
>
> > > > >
> > > > > >
> > > > > > > for the commands is because no request has been made for them=
. Also there is
> > > > > > > one controller that has support.
> > > > > >
> > > > > > Definitely it's not "no request". Nearly all SPI flashes suppor=
t the
> > > > > > Fast Read (0Bh) command today, and 0Bh requires a dummy cycle. =
This is
> > > > > > "seriously broken" for those case 1 type controllers because th=
ey
> > > > > > cannot read anything from the m25p80 model at all. Unless the g=
uest
> > > > > > software being tested only uses Read (03h) command which is not
> > > > > > affected. But I can't find a software that uses Read instead of=
 Fast
> > > > > > Read.
> > > > > >
> > > > > > > > The issue you pointed out that we require the total number =
of dummy
> > > > > > > > bits should be multiple of 8 is true, that's why I added th=
e
> > > > > > > > unimplemented log message in this series (patch 2/3/4) to w=
arn users
> > > > > > > > if this expectation is not met. However this will not cause=
 any issue
> > > > > > > > when running U-Boot or Linux, because both spi-nor drivers =
expect the
> > > > > > > > same assumption as we do here.
> > > > > > > >
> > > > > > > > See U-Boot spi_nor_read_data() and Linux spi_nor_spimem_rea=
d_data(),
> > > > > > > > there is a logic to calculate the dummy bytes needed for fa=
st read
> > > > > > > > command:
> > > > > > > >
> > > > > > > >     /* convert the dummy cycles to the number of bytes */
> > > > > > > >     op.dummy.nbytes =3D (nor->read_dummy * op.dummy.buswidt=
h) / 8;
> > > > > > > >
> > > > > > > > Note the default dummy cycles configuration for all flashes=
 I have
> > > > > > > > looked into as of today, meets the multiple of 8 assumption=
. On some
> > > > > > > > flashes the dummy cycle number is configurable, and if it's=
 been
> > > > > > > > configured to be an odd value, it would not work on U-Boot/=
Linux in
> > > > > > > > the first place.
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Things get complicated when interacting with different =
SPI or QSPI
> > > > > > > > > > flash controllers. There are major two cases:
> > > > > > > > > >
> > > > > > > > > > - Dummy bytes prepared by drivers, and wrote to the con=
troller fifo.
> > > > > > > > > >   For such case, driver will calculate the correct numb=
er of dummy
> > > > > > > > > >   bytes and write them into the tx fifo. Fixing the m25=
p80 model will
> > > > > > > > > >   fix flashes working with such controllers.
> > > > > > > > >
> > > > > > > > > Above can be fixed while still keeping the detailed dummy=
 cycle implementation
> > > > > > > > > inside m25p80. Perhaps one of the following could be look=
ed into: configurating
> > > > > > > > > the amount, letting the spi ctrl fetch the amount from m2=
5p80 or by inheriting
> > > > > > > > > some functionality handling this in the SPI controller. O=
r a mixture of above.
> > > > > > > >
> > > > > > > > Please send patches to explain this in detail how this is g=
oing to
> > > > > > > > work. I am open to all possible solutions.
> > > > > > >
> > > > > > > In that case I suggest that you instead try with a device pro=
perty
> > > > > > > 'model_dummy_bytes' used to select to convert the accurate du=
mmy clock cycle
> > > > > > > count to dummy bytes inside m25p80. Below is an example on ho=
w to modify the
> > > > > >
> > > > > > No this is wrong in my view. This is not like a DMA vs. PIO han=
dling.
> > > > > >
> > > > > > > decode_fast_read_cmd function (the other commands requiring d=
ummy clock cycles
> > > > > > > can follow a similar pattern). This way the fifo mode will be=
 able to work the
> > > > > > > way you desire while also keeping the current functionality i=
ntact. Suddenly
> > > > > > > removing functionality (features) will take users by surprise=
.
> > > > > >
> > > > > > I don't think we are removing any features. This is a fix to ma=
ke the
> > > > > > model to be used by any SPI controllers.
> > > > > >
> > > > > > As I pointed out, both U-Boot and Linux have the multiple of 8
> > > > > > assumption for the dummy bit, which is the default configuratio=
n for
> > > > > > all flashes I have looked into so far. Can you please comment w=
hat use
> > > > > > case you want to support? I requested a U-Boot/Linux kernel tes=
ting in
> > > > > > the previous SST thread [1] against Xilinx GQSPI but there was =
no
> > > > > > response.
> > > > >
> > > > > In [2] instructions on how to boot u-boot/Linux is found. For bui=
lding the
> > > > > various software components I followed the official doc in [3].
> > > >
> > > > I see the following QEMU commands are used to test booting U-Boot/L=
inux:
> > > >
> > > > $ qemu-system-aarch64 -M xlnx-zcu102,secure=3Don,virtualization=3Do=
n -m 4G
> > > > -serial stdio -display none -device loader,file=3Du-boot.elf -kerne=
l
> > > > bl31.elf -device loader,addr=3D0x40000000,file=3DImage -device
> > > > loader,addr=3D0x2000000,file=3Dsystem.dtb
> > > >
> > > > I am not sure where the system.dtb gets built from?
> > >
> > > It is the instructions in [2] to look into. 'system.dtb' is the kerne=
l dtb for
> > > zcu102 ([2] has been fixed). I created [2] purely for you, so respect=
fully I
> > > will ask you to try a little first before asking for further guidance=
.
> > >
> >
> > I tried, but no success. I removed the "-device loader" part for
> > loading kernel image and the device tree, and only focused on booting
> > U-Boot.
> >
> > The ATF bl31.elf was built from
> > https://github.com/ARM-software/arm-trusted-firmware, by following
> > build instructions at
> > https://trustedfirmware-a.readthedocs.io/en/latest/plat/xilinx-zynqmp.h=
tml.
> > U-Boot was built from the upstream U-Boot.
> >
> > $ ./qemu-system-aarch64 -M xlnx-zcu102,secure=3Don,virtualization=3Don =
-m
> > 4G -serial stdio -display none -device loader,file=3Du-boot.elf -kernel
> > bl31.elf
> > ERROR:   Incorrect XILINX IDCODE 0x0, maskid 0x4600093
> > NOTICE:  ATF running on XCZUUNKN/silicon v1/RTL0.0 at 0xfffea000
> > NOTICE:  BL31: v2.4(release):v2.4-228-g337e493
> > NOTICE:  BL31: Built : 21:18:14, Jan 20 2021
> > ERROR:   BL31: Platform Management API version error. Expected: v1.1 -
> > Found: v0.0
> > ERROR:   Error initializing runtime service sip_svc
> >
> > I also tried the Xilinx fork of ATF from
> > https://github.com/Xilinx/arm-trusted-firmware, by following build
> > instructions at
> > https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842305/Build+AR=
M+Trusted+Firmware+ATF
> >
> > $ ./qemu-system-aarch64 -M xlnx-zcu102,secure=3Don,virtualization=3Don =
-m
> > 4G -serial stdio -display none -device loader,file=3Du-boot.elf -kernel
> > bl31.elf
> > ERROR:   Incorrect XILINX IDCODE 0x0, maskid 0x4600093
> > NOTICE:  ATF running on XCZUUNKN/silicon v1/RTL0.0 at 0xfffea000
> > NOTICE:  BL31: v2.2(release):xilinx-v2020.2
> > NOTICE:  BL31: Built : 21:52:38, Jan 20 2021
> > ERROR:   BL31: Platform Management API version error. Expected: v1.1 -
> > Found: v0.0
> > ERROR:   Error initializing runtime service sip_svc
> >
> > Then I tried to build a U-Boot from the Xilinx fork at
> > https://github.com/Xilinx/u-boot-xlnx/, still no success.
> >
> > > Best regards,
> > > Francisco Iglesias
> > >
> > > [1] qemu/docs/system/deprecated.rst
> > > [2] https://github.com/franciscoIglesias/qemu-cmdline/blob/master/xln=
x-zcu102-atf-u-boot-linux.md
> > >

Regards,
Bin

