Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B336BF0B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 07:58:15 +0200 (CEST)
Received: from localhost ([::1]:48778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbGje-0007ZY-M6
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 01:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGi9-00074J-Uf; Tue, 27 Apr 2021 01:56:42 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGi6-0004eH-RN; Tue, 27 Apr 2021 01:56:41 -0400
Received: by mail-io1-xd2e.google.com with SMTP id l21so15277020iob.1;
 Mon, 26 Apr 2021 22:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kJu9gyLwe5RXZvwQNJfB+VYySMQ0WX4wKPgCx9KERn4=;
 b=APiuOpehXVfAZdu04sGsEOVVQkcAUsUhwLK/8nnGD/XlEoSCiOKEeUom9mRhfA6qza
 4la8X+Qed0OEzzq7nui7TkPGh0uhMmHHY8YmlunxgNa6WAyaCfHOiTc0zDFqkqbMnqMI
 J98EWnqy8jVuUb9ShO9tfFT27nNkO9jqQpSHfMIdZOh6O92sapgGcbvbYp3M2qKLKLeK
 WydCFO0K1zzNC92gR+LSDSXktdHbAN5rv8dkY+kw0sQa1rOBtkF3x+i7jb7EhDBfUIS2
 ddVm0EyvH/GFQDuzKMKL0l2gPjT7CIHbkif87lBZU4sn2u9Dsh3YXksDzboaJORApjLa
 2CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kJu9gyLwe5RXZvwQNJfB+VYySMQ0WX4wKPgCx9KERn4=;
 b=HTwOSnpa6Huxm04n2UkuRkQsiLj2E7dRHbTxvSoCBOqyCevzEbuMDoZzQPzqfRyfFq
 fa1eh4p5TnTloeq4xlnVmsgf0Gwd0ZrE2fDLX2jTJhNr6c2w9Oc6QW48v6nQb/sV2gBt
 iJszNnUu6QT8Ru0q0Tgp9Kshf4IKfWm83+ZKgtfTQtyblsOxbjStRf9poGvKyh94jubr
 Rm+wJ3HZ6P5BIVX7KprLIFbjM2gHGxMHq6E/Yti2iVMv8jo+AcX2W3bnowDKy44+Om5J
 81zUYkIOlMMzzz6OZQo5kjfrQ8jcIA3f2ctUAY44+6fDZmRy5FWUnMBibbIMkocCTpkO
 80SQ==
X-Gm-Message-State: AOAM532fZnCoNFCTnUJVSpATq6C1oeb7lBaB4h0eGRdmhsw6NB5S9mjc
 eY/LKNlaiqProEfeTMiBgvkXYMA12LwfB+wV+/Y=
X-Google-Smtp-Source: ABdhPJz6A8OZGjjizF2+CHBi12b/h/jF2yB1VuEaF/CDHbbyH2QCZaqXuZbvgjfKmrt2vS0qcr3BIr45aqHtK66G9fQ=
X-Received: by 2002:a05:6602:1206:: with SMTP id
 y6mr17374971iot.105.1619502996558; 
 Mon, 26 Apr 2021 22:56:36 -0700 (PDT)
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
 <CAEUhbmXwq-7mwbuwp_29iXDT4AZYTBE4PFDxhaHoZkrCRumCaw@mail.gmail.com>
In-Reply-To: <CAEUhbmXwq-7mwbuwp_29iXDT4AZYTBE4PFDxhaHoZkrCRumCaw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Apr 2021 15:56:10 +1000
Message-ID: <CAKmqyKMkgR6p7G3MscSvVHHZuYF2p4piq9W1o+Ye9SSuOqszOA@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 4:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Feb 8, 2021 at 10:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Jan 21, 2021 at 10:18 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hi Bin,
> > >
> > > On [2021 Jan 21] Thu 16:59:51, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Thu, Jan 21, 2021 at 4:50 PM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Dear Bin,
> > > > >
> > > > > On [2021 Jan 20] Wed 22:20:25, Bin Meng wrote:
> > > > > > Hi Francisco,
> > > > > >
> > > > > > On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias
> > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Bin,
> > > > > > >
> > > > > > > On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:
> > > > > > > > Hi Francisco,
> > > > > > > >
> > > > > > > > On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
> > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Bin,
> > > > > > > > >
> > > > > > > > > On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
> > > > > > > > > > Hi Francisco,
> > > > > > > > > >
> > > > > > > > > > On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
> > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi Bin,
> > > > > > > > > > >
> > > > > > > > > > > On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> > > > > > > > > > > > Hi Francisco,
> > > > > > > > > > > >
> > > > > > > > > > > > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > > > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > > >
> > > > > > > > > > > > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > > > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The m25p80 model uses s->needed_bytes to indica=
te how many follow-up
> > > > > > > > > > > > > > bytes are expected to be received after it rece=
ives a command. For
> > > > > > > > > > > > > > example, depending on the address mode, either =
3-byte address or
> > > > > > > > > > > > > > 4-byte address is needed.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > For fast read family commands, some dummy cycle=
s are required after
> > > > > > > > > > > > > > sending the address bytes, and the dummy cycles=
 need to be counted
> > > > > > > > > > > > > > in s->needed_bytes. This is where the mess bega=
n.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > As the variable name (needed_bytes) indicates, =
the unit is in byte.
> > > > > > > > > > > > > > It is not in bit, or cycle. However for some re=
ason the model has
> > > > > > > > > > > > > > been using the number of dummy cycles for s->ne=
eded_bytes. The right
> > > > > > > > > > > > > > approach is to convert the number of dummy cycl=
es to bytes based on
> > > > > > > > > > > > > > the SPI protocol, for example, 6 dummy cycles f=
or the Fast Read Quad
> > > > > > > > > > > > > > I/O (EBh) should be converted to 3 bytes per th=
e formula (6 * 4 / 8).
> > > > > > > > > > > > >
> > > > > > > > > > > > > While not being the original implementor I must a=
ssume that above solution was
> > > > > > > > > > > > > considered but not chosen by the developers due t=
o it is inaccuracy (it
> > > > > > > > > > > > > wouldn't be possible to model exacly 6 dummy cycl=
es, only a multiple of 8,
> > > > > > > > > > > > > meaning that if the controller is wrongly program=
med to generate 7 the error
> > > > > > > > > > > > > wouldn't be caught and the controller will still =
be considered "correct"). Now
> > > > > > > > > > > > > that we have this detail in the implementation I'=
m in favor of keeping it, this
> > > > > > > > > > > > > also because the detail is already in use for cat=
ching exactly above error.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > I found no clue from the commit message that my pro=
posed solution here
> > > > > > > > > > > > was ever considered, otherwise all SPI controller m=
odels supporting
> > > > > > > > > > > > software generation should have been found out seri=
ously broken long
> > > > > > > > > > > > time ago!
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > The controllers you are referring to might lack suppo=
rt for commands requiring
> > > > > > > > > > > dummy clock cycles but I really hope they work with t=
he other commands? If so I
> > > > > > > > > >
> > > > > > > > > > I am not sure why you view dummy clock cycles as someth=
ing special
> > > > > > > > > > that needs some special support from the SPI controller=
. For the case
> > > > > > > > > > 1 controller, it's nothing special from the controller =
perspective,
> > > > > > > > > > just like sending out a command, or address bytes, or d=
ata. The
> > > > > > > > > > controller just shifts data bit by bit from its tx fifo=
 and that's it.
> > > > > > > > > > In the Xilinx GQSPI controller case, the dummy cycles c=
an either be
> > > > > > > > > > sent via a regular data (the case 1 controller) in the =
tx fifo, or
> > > > > > > > > > automatically generated (case 2 controller) by the hard=
ware.
> > > > > > > > >
> > > > > > > > > Ok, I'll try to explain my view point a little differentl=
y. For that we also
> > > > > > > > > need to keep in mind that QEMU models HW, and any binary =
that runs on a HW
> > > > > > > > > board supported in QEMU should ideally run on that board =
inside QEMU aswell
> > > > > > > > > (this can be a bare metal application equaly well as a mo=
dified u-boot/Linux
> > > > > > > > > using SPI commands with a non multiple of 8 number of dum=
my clock cycles).
> > > > > > > > >
> > > > > > > > > Once functionality has been introduced into QEMU it is no=
t easy to know which
> > > > > > > > > intentional or untentional features provided by the funct=
ionality are being
> > > > > > > > > used by users. One of the (perhaps not well known) featur=
es I'm aware of that
> > > > > > > > > is in use and is provided by the accurate dummy clock cyc=
le modeling inside
> > > > > > > > > m25p80 is the be ability to test drivers accurately regar=
ding the dummy clock
> > > > > > > > > cycles (even when using commands with a non-multiple of 8=
 number of dummy clock
> > > > > > > > > cycles), but there might be others aswell. So by removing=
 this functionality
> > > > > > > > > above use case will brake, this since those test will not=
 be reliable.
> > > > > > > > > Furthermore, since users tend to be creative it is not po=
ssible to know if
> > > > > > > > > there are other use cases that will be affected. This mea=
ns that in case [1]
> > > > > > > > > needs to be followed the safe path is to add functionalit=
y instead of removing.
> > > > > > > > > Luckily it also easier in this case, see below.
> > > > > > > >
> > > > > > > > I understand there might be users other than U-Boot/Linux t=
hat use an
> > > > > > > > odd number of dummy bits (not multiple of 8). If your conce=
rn was
> > > > > > > > about model behavior changes, sure I can update
> > > > > > > > qemu/docs/system/deprecated.rst to mention that some flashe=
s in the
> > > > > > > > m25p80 model now implement dummy cycles as bytes.
> > > > > > >
> > > > > > > Yes, something like that. My concern is that since this funct=
ionality has been
> > > > > > > in tree for while, users have found known or unknown features=
 that got
> > > > > > > introduced by it. By removing the functionality (and the know=
n/uknown features)
> > > > > > > we are riscing to brake our user's use cases (currently I'm a=
ware of one
> > > > > > > feature/use case but it is not unlikely that there are more).=
 [1] states that
> > > > > > > "In general features are intended to be supported indefinitel=
y once introduced
> > > > > > > into QEMU", to me that makes very much sense because the oppo=
site would mean
> > > > > > > that we were not reliable. So in case [1] needs to be honored=
 it looks to be
> > > > > > > safer to add functionality instead of removing (and riscing t=
he removal of use
> > > > > > > cases/features). Luckily I still believe in this case that it=
 will be easier to
> > > > > > > go forward (even if I also agree on what you are saying below=
 about what I
> > > > > > > proposed).
> > > > > > >
> > > > > >
> > > > > > Even if the implementation is buggy and we need to keep the bug=
gy
> > > > > > implementation forever? I think that's why
> > > > > > qemu/docs/system/deprecated.rst was created for deprecating suc=
h
> > > > > > feature.
> > > > >
> > > > > With the RFC I posted all commands in m25p80 are working for both=
 the case 1
> > > > > controller (using a txfifo) and the case 2 controller (no txfifo,=
 as GQSPI).
> > > > > Because of this, I, with all respect, will have to disagree that =
this is buggy.
> > > >
> > > > Well, the existing m25p80 implementation that uses dummy cycle
> > > > accuracy for those flashes prevents all SPI controllers that use tx
> > > > fifo to work with those flashes. Hence it is buggy.
> > > >
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > don't think it is fair to call them 'seriously broken=
' (and else we should
> > > > > > > > > > > probably let the maintainers know about it). Most lik=
ely the lack of support
> > > > > > > > > >
> > > > > > > > > > I called it "seriously broken" because current implemen=
tation only
> > > > > > > > > > considered one type of SPI controllers while completely=
 ignoring the
> > > > > > > > > > other type.
> > > > > > > > >
> > > > > > > > > If we change view and see this from the perspective of m2=
5p80, it models the
> > > > > > > > > commands a certain way and provides an API that the SPI c=
ontrollers need to
> > > > > > > > > implement for interacting with it. It is true that there =
are SPI controllers
> > > > > > > > > referred to above that do not support the portion of that=
 API that corresponds
> > > > > > > > > to commands with dummy clock cycles, but I don't think it=
 is true that this is
> > > > > > > > > broken since there is also one SPI controller that has a =
working implementation
> > > > > > > > > of m25p80's full API also when transfering through a tx f=
ifo (use case 1). But
> > > > > > > > > as mentioned above, by doing a minor extension and improv=
ement to m25p80's API
> > > > > > > > > and allow for toggling the accuracy from dummy clock cycl=
es to dummy bytes [1]
> > > > > > > > > will still be honored as in the same time making it possi=
ble to have full
> > > > > > > > > support for the API in the SPI controllers that currently=
 do not (please reread
> > > > > > > > > the proposal in my previous reply that attempts to do thi=
s). I myself see this
> > > > > > > > > as win/win situation, also because no controller should n=
eed modifications.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I am afraid your proposal does not work. Your proposed new =
device
> > > > > > > > property 'model_dummy_bytes' to select to convert the accur=
ate dummy
> > > > > > > > clock cycle count to dummy bytes inside m25p80, is hard to =
justify as
> > > > > > > > a property to the flash itself, as the behavior is tightly =
coupled to
> > > > > > > > how the SPI controller works.
> > > > > > >
> > > > > > > I agree on above. I decided though that instead of posting sa=
mple code in here
> > > > > > > I'll post an RFC with hopefully an improved proposal. I'll cc=
 you. About below,
> > > > > > > Xilinx ZynqMP GQSPI should not need any modication in a first=
 step.
> > > > > > >
> > > > > >
> > > > > > Wait, (see below)
> > > > > >
> > > > > > > >
> > > > > > > > Please take a look at the Xilinx GQSPI controller, which su=
pports both
> > > > > > > > use cases, that the dummy cycles can be transferred via tx =
fifo, or
> > > > > > > > generated by the controller automatically. Please read the =
example
> > > > > > > > given in:
> > > > > > > >
> > > > > > > >     table 24=E2=80=9022, an example of Generic FIFO Content=
s for Quad I/O Read
> > > > > > > > Command (EBh)
> > > > > > > >
> > > > > > > > in https://www.xilinx.com/support/documentation/user_guides=
/ug1085-zynq-ultrascale-trm.pdf
> > > > > > > >
> > > > > > > > If you choose to set the m25p80 device property 'model_dumm=
y_bytes' to
> > > > > > > > true when working with the Xilinx GQSPI controller, you are=
 bound to
> > > > > > > > only allow guest software to use tx fifo to transfer the du=
mmy cycles,
> > > > > > > > and this is wrong.
> > > > > > > >
> > > > > >
> > > > > > You missed this part. I looked at your RFC, and as I mentioned =
above
> > > > > > your proposal cannot support the complicated controller like Xi=
linx
> > > > > > GQSPI. Please read the example of table 24-22. With your RFC, y=
ou
> > > > > > mandate guest software's GQSPI driver to only use hardware dumm=
y cycle
> > > > > > generation, which is wrong.
> > > > > >
> > > > >
> > > > > First, thank you very much for looking into the RFC series, very =
much
> > > > > appreciated. Secondly, about above, the GQSPI model in QEMU trans=
fers from 2
> > > > > locations in the file, in 1 location the transfer referred to abo=
ve is done, in
> > > > > another location the transfer through the txfifo is done. The loc=
ation where
> > > > > transfer referred to above is done will not need any modification=
s (and will
> > > > > thus work equally well as it does currently).
> > > >
> > > > Please explain this a little bit. How does your RFC series handle
> > > > cases as described in table 24-22, where the 6 dummy cycles are spl=
it
> > > > into 2 transfers, with one transfer using tx fifo, and the other on=
e
> > > > using hardware dummy cycle generation?
> > >
> > > Sorry, I missunderstod. You are right, that won't work.
> >
> > +Edgar E. Iglesias
> >
> > So it looks by far the only way to implement dummy cycles correctly to
> > work with all SPI controller models is what I proposed here in this
> > patch series.
> >
> > Maintainers are quite silent, so I would like to hear your thoughts.
> >
> > @Alistair Francis @Philippe Mathieu-Daud=C3=A9 @Peter Maydell would you
> > please share your thoughts since you are the one who reviewed the
> > existing dummy implementation (based on commits history)

I agree with Edgar, in that Francisco and Bin know this better than me
and that modelling things in cycles is a pain.

As Bin points out it seems like currently we should be modelling bytes
(from the variable name) so it makes sense to keep it in bytes. I
would be in favour of this series in that case. Do we know what use
cases this will break? I know it's hard to answer but I don't think
there are too many SSI users in QEMU so it might not be too hard to
test most of the possible use cases.

Alistair

>
> Hello maintainers,
>
> We apparently missed the 6.0 window to address this mess of the m25p80
> model. Please provide your inputs on this before I start working on
> the v2.
>
> Regards,
> Bin
>

