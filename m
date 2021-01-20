Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA42B2FD282
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:22:10 +0100 (CET)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EN8-0001z2-0B
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2ELn-0000Ss-4W; Wed, 20 Jan 2021 09:20:47 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2ELi-0004jv-Ik; Wed, 20 Jan 2021 09:20:46 -0500
Received: by mail-ej1-x632.google.com with SMTP id w1so33708704ejf.11;
 Wed, 20 Jan 2021 06:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DspembmaJIJarXxk54NctOgIA9U7/BNi3Xxxnni+IrE=;
 b=qsxluOVr1ZExykMua5Fpej4wConKcfWTjLvmHToOQNpvGELaJc7j6WyPYg1kp1AetN
 g2+hdtR5HaG5ZpVQJRipVIlRJEt4iKk6UDEqizhs5H0JCzDPjPPvAeZoNGWHBRpUFvTN
 Qd0YrH28RwsgJZnuNpyrDIKjAi99iMRgdog9LrzqynQSdYNa2L7ApCBL8zRyx+PdxXUs
 sQG8/J/745DJ4qt2NnrCX0qUSSIGcYNrHObUhFfCEoD2xEYjXXSws41x0YFknen1ptmf
 GSpTy5s3SjP/RsuwFtID7BBH3YzPOMU7mrU4ZOihhuiaUjgre2KGAkwcumSYZ8wPiLIt
 HopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DspembmaJIJarXxk54NctOgIA9U7/BNi3Xxxnni+IrE=;
 b=QGAPv02eDgF+grpKdA831wNUio1hrs2UJAA0kwA8eWLe8tmQA7hdwvEYXPV3Kl7qd1
 YRoPmrLUfo139PFpZyL668+Zgjl8imcgJaAI1Z0DGazDu3ioFITN/SjVsflkaXTriugn
 O5rhY5Jf4Ze3u67rAD+j2TU96wxK7N0JP0sn8k91oFV465NoTYECkI8XR+GMPpEsNQdP
 4Oy+RmzDqemnMEuzXj9ShZ9X0YLobS5dQakC/eFYYzaSbj/AEA+x2XewBR9I3FhDQb2d
 o/V3xJl4i96+jpxaFhpQwwhoeZAaglh8z2sjjgrqF6x9iLs6kZKhAeT62XxW2fjB6cfR
 V+Mg==
X-Gm-Message-State: AOAM532+Ikfu39ydM76wuq4xwW/+8q2WMc896ERYdQoJt5kLodreF82y
 A7m/SHPmjcxWZsjHjn49oYw6TsnJEoAF05PEGZk=
X-Google-Smtp-Source: ABdhPJzXtqMz7rmBJSMUnKJ2EbDe6Zw31DGnpl1pn7Bppl3waF1ywD+hnxl0trAXU+Ya+8B70eRXKPrts0IMj+PtYig=
X-Received: by 2002:a17:907:68c:: with SMTP id
 wn12mr6528914ejb.41.1611152439986; 
 Wed, 20 Jan 2021 06:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
 <20210115122627.GB29923@fralle-msi>
 <CAEUhbmVYgP063iqY0c10y9zKBmx00Z6vr3BO3RjoRo-CXQpYDw@mail.gmail.com>
 <20210118100557.GA11373@fralle-msi>
 <CAEUhbmWT50o8OV_QAimhs5itWq3pFd6CTKup6PFpvSs2KYpf2w@mail.gmail.com>
 <20210119130113.GA28306@fralle-msi>
In-Reply-To: <20210119130113.GA28306@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Jan 2021 22:20:25 +0800
Message-ID: <CAEUhbmUBAgF4D__jsfbE7yGd++5ZH3YOutTiOBOot52sNCV-eg@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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

On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin,
>
> On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hi Bin,
> > >
> > > On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Hi Bin,
> > > > >
> > > > > On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> > > > > > Hi Francisco,
> > > > > >
> > > > > > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Bin,
> > > > > > >
> > > > > > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > >
> > > > > > > > The m25p80 model uses s->needed_bytes to indicate how many =
follow-up
> > > > > > > > bytes are expected to be received after it receives a comma=
nd. For
> > > > > > > > example, depending on the address mode, either 3-byte addre=
ss or
> > > > > > > > 4-byte address is needed.
> > > > > > > >
> > > > > > > > For fast read family commands, some dummy cycles are requir=
ed after
> > > > > > > > sending the address bytes, and the dummy cycles need to be =
counted
> > > > > > > > in s->needed_bytes. This is where the mess began.
> > > > > > > >
> > > > > > > > As the variable name (needed_bytes) indicates, the unit is =
in byte.
> > > > > > > > It is not in bit, or cycle. However for some reason the mod=
el has
> > > > > > > > been using the number of dummy cycles for s->needed_bytes. =
The right
> > > > > > > > approach is to convert the number of dummy cycles to bytes =
based on
> > > > > > > > the SPI protocol, for example, 6 dummy cycles for the Fast =
Read Quad
> > > > > > > > I/O (EBh) should be converted to 3 bytes per the formula (6=
 * 4 / 8).
> > > > > > >
> > > > > > > While not being the original implementor I must assume that a=
bove solution was
> > > > > > > considered but not chosen by the developers due to it is inac=
curacy (it
> > > > > > > wouldn't be possible to model exacly 6 dummy cycles, only a m=
ultiple of 8,
> > > > > > > meaning that if the controller is wrongly programmed to gener=
ate 7 the error
> > > > > > > wouldn't be caught and the controller will still be considere=
d "correct"). Now
> > > > > > > that we have this detail in the implementation I'm in favor o=
f keeping it, this
> > > > > > > also because the detail is already in use for catching exactl=
y above error.
> > > > > > >
> > > > > >
> > > > > > I found no clue from the commit message that my proposed soluti=
on here
> > > > > > was ever considered, otherwise all SPI controller models suppor=
ting
> > > > > > software generation should have been found out seriously broken=
 long
> > > > > > time ago!
> > > > >
> > > > >
> > > > > The controllers you are referring to might lack support for comma=
nds requiring
> > > > > dummy clock cycles but I really hope they work with the other com=
mands? If so I
> > > >
> > > > I am not sure why you view dummy clock cycles as something special
> > > > that needs some special support from the SPI controller. For the ca=
se
> > > > 1 controller, it's nothing special from the controller perspective,
> > > > just like sending out a command, or address bytes, or data. The
> > > > controller just shifts data bit by bit from its tx fifo and that's =
it.
> > > > In the Xilinx GQSPI controller case, the dummy cycles can either be
> > > > sent via a regular data (the case 1 controller) in the tx fifo, or
> > > > automatically generated (case 2 controller) by the hardware.
> > >
> > > Ok, I'll try to explain my view point a little differently. For that =
we also
> > > need to keep in mind that QEMU models HW, and any binary that runs on=
 a HW
> > > board supported in QEMU should ideally run on that board inside QEMU =
aswell
> > > (this can be a bare metal application equaly well as a modified u-boo=
t/Linux
> > > using SPI commands with a non multiple of 8 number of dummy clock cyc=
les).
> > >
> > > Once functionality has been introduced into QEMU it is not easy to kn=
ow which
> > > intentional or untentional features provided by the functionality are=
 being
> > > used by users. One of the (perhaps not well known) features I'm aware=
 of that
> > > is in use and is provided by the accurate dummy clock cycle modeling =
inside
> > > m25p80 is the be ability to test drivers accurately regarding the dum=
my clock
> > > cycles (even when using commands with a non-multiple of 8 number of d=
ummy clock
> > > cycles), but there might be others aswell. So by removing this functi=
onality
> > > above use case will brake, this since those test will not be reliable=
.
> > > Furthermore, since users tend to be creative it is not possible to kn=
ow if
> > > there are other use cases that will be affected. This means that in c=
ase [1]
> > > needs to be followed the safe path is to add functionality instead of=
 removing.
> > > Luckily it also easier in this case, see below.
> >
> > I understand there might be users other than U-Boot/Linux that use an
> > odd number of dummy bits (not multiple of 8). If your concern was
> > about model behavior changes, sure I can update
> > qemu/docs/system/deprecated.rst to mention that some flashes in the
> > m25p80 model now implement dummy cycles as bytes.
>
> Yes, something like that. My concern is that since this functionality has=
 been
> in tree for while, users have found known or unknown features that got
> introduced by it. By removing the functionality (and the known/uknown fea=
tures)
> we are riscing to brake our user's use cases (currently I'm aware of one
> feature/use case but it is not unlikely that there are more). [1] states =
that
> "In general features are intended to be supported indefinitely once intro=
duced
> into QEMU", to me that makes very much sense because the opposite would m=
ean
> that we were not reliable. So in case [1] needs to be honored it looks to=
 be
> safer to add functionality instead of removing (and riscing the removal o=
f use
> cases/features). Luckily I still believe in this case that it will be eas=
ier to
> go forward (even if I also agree on what you are saying below about what =
I
> proposed).
>

Even if the implementation is buggy and we need to keep the buggy
implementation forever? I think that's why
qemu/docs/system/deprecated.rst was created for deprecating such
feature.

> >
> > > >
> > > > > don't think it is fair to call them 'seriously broken' (and else =
we should
> > > > > probably let the maintainers know about it). Most likely the lack=
 of support
> > > >
> > > > I called it "seriously broken" because current implementation only
> > > > considered one type of SPI controllers while completely ignoring th=
e
> > > > other type.
> > >
> > > If we change view and see this from the perspective of m25p80, it mod=
els the
> > > commands a certain way and provides an API that the SPI controllers n=
eed to
> > > implement for interacting with it. It is true that there are SPI cont=
rollers
> > > referred to above that do not support the portion of that API that co=
rresponds
> > > to commands with dummy clock cycles, but I don't think it is true tha=
t this is
> > > broken since there is also one SPI controller that has a working impl=
ementation
> > > of m25p80's full API also when transfering through a tx fifo (use cas=
e 1). But
> > > as mentioned above, by doing a minor extension and improvement to m25=
p80's API
> > > and allow for toggling the accuracy from dummy clock cycles to dummy =
bytes [1]
> > > will still be honored as in the same time making it possible to have =
full
> > > support for the API in the SPI controllers that currently do not (ple=
ase reread
> > > the proposal in my previous reply that attempts to do this). I myself=
 see this
> > > as win/win situation, also because no controller should need modifica=
tions.
> > >
> >
> > I am afraid your proposal does not work. Your proposed new device
> > property 'model_dummy_bytes' to select to convert the accurate dummy
> > clock cycle count to dummy bytes inside m25p80, is hard to justify as
> > a property to the flash itself, as the behavior is tightly coupled to
> > how the SPI controller works.
>
> I agree on above. I decided though that instead of posting sample code in=
 here
> I'll post an RFC with hopefully an improved proposal. I'll cc you. About =
below,
> Xilinx ZynqMP GQSPI should not need any modication in a first step.
>

Wait, (see below)

> >
> > Please take a look at the Xilinx GQSPI controller, which supports both
> > use cases, that the dummy cycles can be transferred via tx fifo, or
> > generated by the controller automatically. Please read the example
> > given in:
> >
> >     table 24=E2=80=9022, an example of Generic FIFO Contents for Quad I=
/O Read
> > Command (EBh)
> >
> > in https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq=
-ultrascale-trm.pdf
> >
> > If you choose to set the m25p80 device property 'model_dummy_bytes' to
> > true when working with the Xilinx GQSPI controller, you are bound to
> > only allow guest software to use tx fifo to transfer the dummy cycles,
> > and this is wrong.
> >

You missed this part. I looked at your RFC, and as I mentioned above
your proposal cannot support the complicated controller like Xilinx
GQSPI. Please read the example of table 24-22. With your RFC, you
mandate guest software's GQSPI driver to only use hardware dummy cycle
generation, which is wrong.

> > >
> > > >
> > > > > for the commands is because no request has been made for them. Al=
so there is
> > > > > one controller that has support.
> > > >
> > > > Definitely it's not "no request". Nearly all SPI flashes support th=
e
> > > > Fast Read (0Bh) command today, and 0Bh requires a dummy cycle. This=
 is
> > > > "seriously broken" for those case 1 type controllers because they
> > > > cannot read anything from the m25p80 model at all. Unless the guest
> > > > software being tested only uses Read (03h) command which is not
> > > > affected. But I can't find a software that uses Read instead of Fas=
t
> > > > Read.
> > > >
> > > > > > The issue you pointed out that we require the total number of d=
ummy
> > > > > > bits should be multiple of 8 is true, that's why I added the
> > > > > > unimplemented log message in this series (patch 2/3/4) to warn =
users
> > > > > > if this expectation is not met. However this will not cause any=
 issue
> > > > > > when running U-Boot or Linux, because both spi-nor drivers expe=
ct the
> > > > > > same assumption as we do here.
> > > > > >
> > > > > > See U-Boot spi_nor_read_data() and Linux spi_nor_spimem_read_da=
ta(),
> > > > > > there is a logic to calculate the dummy bytes needed for fast r=
ead
> > > > > > command:
> > > > > >
> > > > > >     /* convert the dummy cycles to the number of bytes */
> > > > > >     op.dummy.nbytes =3D (nor->read_dummy * op.dummy.buswidth) /=
 8;
> > > > > >
> > > > > > Note the default dummy cycles configuration for all flashes I h=
ave
> > > > > > looked into as of today, meets the multiple of 8 assumption. On=
 some
> > > > > > flashes the dummy cycle number is configurable, and if it's bee=
n
> > > > > > configured to be an odd value, it would not work on U-Boot/Linu=
x in
> > > > > > the first place.
> > > > > >
> > > > > > > >
> > > > > > > > Things get complicated when interacting with different SPI =
or QSPI
> > > > > > > > flash controllers. There are major two cases:
> > > > > > > >
> > > > > > > > - Dummy bytes prepared by drivers, and wrote to the control=
ler fifo.
> > > > > > > >   For such case, driver will calculate the correct number o=
f dummy
> > > > > > > >   bytes and write them into the tx fifo. Fixing the m25p80 =
model will
> > > > > > > >   fix flashes working with such controllers.
> > > > > > >
> > > > > > > Above can be fixed while still keeping the detailed dummy cyc=
le implementation
> > > > > > > inside m25p80. Perhaps one of the following could be looked i=
nto: configurating
> > > > > > > the amount, letting the spi ctrl fetch the amount from m25p80=
 or by inheriting
> > > > > > > some functionality handling this in the SPI controller. Or a =
mixture of above.
> > > > > >
> > > > > > Please send patches to explain this in detail how this is going=
 to
> > > > > > work. I am open to all possible solutions.
> > > > >
> > > > > In that case I suggest that you instead try with a device propert=
y
> > > > > 'model_dummy_bytes' used to select to convert the accurate dummy =
clock cycle
> > > > > count to dummy bytes inside m25p80. Below is an example on how to=
 modify the
> > > >
> > > > No this is wrong in my view. This is not like a DMA vs. PIO handlin=
g.
> > > >
> > > > > decode_fast_read_cmd function (the other commands requiring dummy=
 clock cycles
> > > > > can follow a similar pattern). This way the fifo mode will be abl=
e to work the
> > > > > way you desire while also keeping the current functionality intac=
t. Suddenly
> > > > > removing functionality (features) will take users by surprise.
> > > >
> > > > I don't think we are removing any features. This is a fix to make t=
he
> > > > model to be used by any SPI controllers.
> > > >
> > > > As I pointed out, both U-Boot and Linux have the multiple of 8
> > > > assumption for the dummy bit, which is the default configuration fo=
r
> > > > all flashes I have looked into so far. Can you please comment what =
use
> > > > case you want to support? I requested a U-Boot/Linux kernel testing=
 in
> > > > the previous SST thread [1] against Xilinx GQSPI but there was no
> > > > response.
> > >
> > > In [2] instructions on how to boot u-boot/Linux is found. For buildin=
g the
> > > various software components I followed the official doc in [3].
> >
> > I see the following QEMU commands are used to test booting U-Boot/Linux=
:
> >
> > $ qemu-system-aarch64 -M xlnx-zcu102,secure=3Don,virtualization=3Don -m=
 4G
> > -serial stdio -display none -device loader,file=3Du-boot.elf -kernel
> > bl31.elf -device loader,addr=3D0x40000000,file=3DImage -device
> > loader,addr=3D0x2000000,file=3Dsystem.dtb
> >
> > I am not sure where the system.dtb gets built from?
>
> It is the instructions in [2] to look into. 'system.dtb' is the kernel dt=
b for
> zcu102 ([2] has been fixed). I created [2] purely for you, so respectfull=
y I
> will ask you to try a little first before asking for further guidance.
>

I tried, but no success. I removed the "-device loader" part for
loading kernel image and the device tree, and only focused on booting
U-Boot.

The ATF bl31.elf was built from
https://github.com/ARM-software/arm-trusted-firmware, by following
build instructions at
https://trustedfirmware-a.readthedocs.io/en/latest/plat/xilinx-zynqmp.html.
U-Boot was built from the upstream U-Boot.

$ ./qemu-system-aarch64 -M xlnx-zcu102,secure=3Don,virtualization=3Don -m
4G -serial stdio -display none -device loader,file=3Du-boot.elf -kernel
bl31.elf
ERROR:   Incorrect XILINX IDCODE 0x0, maskid 0x4600093
NOTICE:  ATF running on XCZUUNKN/silicon v1/RTL0.0 at 0xfffea000
NOTICE:  BL31: v2.4(release):v2.4-228-g337e493
NOTICE:  BL31: Built : 21:18:14, Jan 20 2021
ERROR:   BL31: Platform Management API version error. Expected: v1.1 -
Found: v0.0
ERROR:   Error initializing runtime service sip_svc

I also tried the Xilinx fork of ATF from
https://github.com/Xilinx/arm-trusted-firmware, by following build
instructions at
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842305/Build+ARM+Tr=
usted+Firmware+ATF

$ ./qemu-system-aarch64 -M xlnx-zcu102,secure=3Don,virtualization=3Don -m
4G -serial stdio -display none -device loader,file=3Du-boot.elf -kernel
bl31.elf
ERROR:   Incorrect XILINX IDCODE 0x0, maskid 0x4600093
NOTICE:  ATF running on XCZUUNKN/silicon v1/RTL0.0 at 0xfffea000
NOTICE:  BL31: v2.2(release):xilinx-v2020.2
NOTICE:  BL31: Built : 21:52:38, Jan 20 2021
ERROR:   BL31: Platform Management API version error. Expected: v1.1 -
Found: v0.0
ERROR:   Error initializing runtime service sip_svc

Then I tried to build a U-Boot from the Xilinx fork at
https://github.com/Xilinx/u-boot-xlnx/, still no success.

> Best regards,
> Francisco Iglesias
>
> [1] qemu/docs/system/deprecated.rst
> [2] https://github.com/franciscoIglesias/qemu-cmdline/blob/master/xlnx-zc=
u102-atf-u-boot-linux.md
>
>

Regards,
Bin

