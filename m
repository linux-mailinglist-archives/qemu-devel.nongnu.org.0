Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396D2F9FD1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:34:43 +0100 (CET)
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tk2-0001iS-6O
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1Thz-0000oT-N2; Mon, 18 Jan 2021 07:32:35 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1Thv-0002dz-CD; Mon, 18 Jan 2021 07:32:35 -0500
Received: by mail-yb1-xb30.google.com with SMTP id r32so2774590ybd.5;
 Mon, 18 Jan 2021 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6EyI9x6cFHpTQV8J3KQ2NVQOkpXY5m6GxTR3FGz9GkM=;
 b=JrdAN/wPiSMTPU6vCdpF4sPNqxIwIfz9K86OGs8JFI5OVO25DNqczX8RIlTd4dYwHS
 4BHk/hgxTEWlMucMF+2vnmM/WjETUamSTQoto16n0sdlMUCWG8ofO6FQ7mK2HSqA7/kF
 tF79/Wxt/WatKyVR6RJWeUX+Y2qwDzpDDJ2JOdSjJ8zmPgziYQrd25lE+ZWc/EvkpRpM
 USrE5Qg0AL0WRNKKM8okyjkANUoFM7s4TFgqHpZGVaGTKA0qwXJ76Z6oFPGHhh4fu1vb
 yzEONgnDAlLQmYin9Bxq7WrCsrhxzWnvAY7ho639q4bgIOGO79SbnilrCRFzreRl3wzr
 pGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6EyI9x6cFHpTQV8J3KQ2NVQOkpXY5m6GxTR3FGz9GkM=;
 b=KoLeV61Z5XOfTgKGKMwVBwuULPUr0geTHXRll434N7kEg4IPogbMU3lQOdX1WPx7AQ
 BSNRSkvA4bftgf9V4fzt1gzbh5gSTG4jNC/ko8xoWJ7w4J0emSBCjroq1imnV/DJho+s
 TgBFm4K7Gj2fhobiSpoj9hhveIH1OyCah88sYR7iIfapQa/SLe0Alh+tIrKH7Fs+xfYK
 fcwf2s5ri4oL6EXmZQp1kkxEsQaR/oAN73L8Kuo4FVMBitJ9bmmS/SdBBb06BqtVazZn
 +pKK2XBSgnHwBrrhSOwFgxqTP5snWUwciLI5ET70y6D6VVg6GyrWh+2zTuoz+Muji995
 dlVw==
X-Gm-Message-State: AOAM530PLsQKHq8Y85AQ0i5phMJ6gpF3G6oof+QCbYJWAExi9s3XBZnT
 pKIQuc1xgYlo8hLLzUmtPRZe2d8UNpCvKbnEc5k=
X-Google-Smtp-Source: ABdhPJxj4C1ed7MYLXzVeNfspjAt/2hl/SO7Pox69646JFq6xOP2EMV19O4GAKxtzhvKNMYcvMnGOj+eF9DSyjRMxGE=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr34044033ybm.517.1610973149166; 
 Mon, 18 Jan 2021 04:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
 <20210115122627.GB29923@fralle-msi>
 <CAEUhbmVYgP063iqY0c10y9zKBmx00Z6vr3BO3RjoRo-CXQpYDw@mail.gmail.com>
 <20210118100557.GA11373@fralle-msi>
In-Reply-To: <20210118100557.GA11373@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 18 Jan 2021 20:32:19 +0800
Message-ID: <CAEUhbmWT50o8OV_QAimhs5itWq3pFd6CTKup6PFpvSs2KYpf2w@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin,
>
> On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hi Bin,
> > >
> > > On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Hi Bin,
> > > > >
> > > > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > >
> > > > > > The m25p80 model uses s->needed_bytes to indicate how many foll=
ow-up
> > > > > > bytes are expected to be received after it receives a command. =
For
> > > > > > example, depending on the address mode, either 3-byte address o=
r
> > > > > > 4-byte address is needed.
> > > > > >
> > > > > > For fast read family commands, some dummy cycles are required a=
fter
> > > > > > sending the address bytes, and the dummy cycles need to be coun=
ted
> > > > > > in s->needed_bytes. This is where the mess began.
> > > > > >
> > > > > > As the variable name (needed_bytes) indicates, the unit is in b=
yte.
> > > > > > It is not in bit, or cycle. However for some reason the model h=
as
> > > > > > been using the number of dummy cycles for s->needed_bytes. The =
right
> > > > > > approach is to convert the number of dummy cycles to bytes base=
d on
> > > > > > the SPI protocol, for example, 6 dummy cycles for the Fast Read=
 Quad
> > > > > > I/O (EBh) should be converted to 3 bytes per the formula (6 * 4=
 / 8).
> > > > >
> > > > > While not being the original implementor I must assume that above=
 solution was
> > > > > considered but not chosen by the developers due to it is inaccura=
cy (it
> > > > > wouldn't be possible to model exacly 6 dummy cycles, only a multi=
ple of 8,
> > > > > meaning that if the controller is wrongly programmed to generate =
7 the error
> > > > > wouldn't be caught and the controller will still be considered "c=
orrect"). Now
> > > > > that we have this detail in the implementation I'm in favor of ke=
eping it, this
> > > > > also because the detail is already in use for catching exactly ab=
ove error.
> > > > >
> > > >
> > > > I found no clue from the commit message that my proposed solution h=
ere
> > > > was ever considered, otherwise all SPI controller models supporting
> > > > software generation should have been found out seriously broken lon=
g
> > > > time ago!
> > >
> > >
> > > The controllers you are referring to might lack support for commands =
requiring
> > > dummy clock cycles but I really hope they work with the other command=
s? If so I
> >
> > I am not sure why you view dummy clock cycles as something special
> > that needs some special support from the SPI controller. For the case
> > 1 controller, it's nothing special from the controller perspective,
> > just like sending out a command, or address bytes, or data. The
> > controller just shifts data bit by bit from its tx fifo and that's it.
> > In the Xilinx GQSPI controller case, the dummy cycles can either be
> > sent via a regular data (the case 1 controller) in the tx fifo, or
> > automatically generated (case 2 controller) by the hardware.
>
> Ok, I'll try to explain my view point a little differently. For that we a=
lso
> need to keep in mind that QEMU models HW, and any binary that runs on a H=
W
> board supported in QEMU should ideally run on that board inside QEMU aswe=
ll
> (this can be a bare metal application equaly well as a modified u-boot/Li=
nux
> using SPI commands with a non multiple of 8 number of dummy clock cycles)=
.
>
> Once functionality has been introduced into QEMU it is not easy to know w=
hich
> intentional or untentional features provided by the functionality are bei=
ng
> used by users. One of the (perhaps not well known) features I'm aware of =
that
> is in use and is provided by the accurate dummy clock cycle modeling insi=
de
> m25p80 is the be ability to test drivers accurately regarding the dummy c=
lock
> cycles (even when using commands with a non-multiple of 8 number of dummy=
 clock
> cycles), but there might be others aswell. So by removing this functional=
ity
> above use case will brake, this since those test will not be reliable.
> Furthermore, since users tend to be creative it is not possible to know i=
f
> there are other use cases that will be affected. This means that in case =
[1]
> needs to be followed the safe path is to add functionality instead of rem=
oving.
> Luckily it also easier in this case, see below.

I understand there might be users other than U-Boot/Linux that use an
odd number of dummy bits (not multiple of 8). If your concern was
about model behavior changes, sure I can update
qemu/docs/system/deprecated.rst to mention that some flashes in the
m25p80 model now implement dummy cycles as bytes.

> >
> > > don't think it is fair to call them 'seriously broken' (and else we s=
hould
> > > probably let the maintainers know about it). Most likely the lack of =
support
> >
> > I called it "seriously broken" because current implementation only
> > considered one type of SPI controllers while completely ignoring the
> > other type.
>
> If we change view and see this from the perspective of m25p80, it models =
the
> commands a certain way and provides an API that the SPI controllers need =
to
> implement for interacting with it. It is true that there are SPI controll=
ers
> referred to above that do not support the portion of that API that corres=
ponds
> to commands with dummy clock cycles, but I don't think it is true that th=
is is
> broken since there is also one SPI controller that has a working implemen=
tation
> of m25p80's full API also when transfering through a tx fifo (use case 1)=
. But
> as mentioned above, by doing a minor extension and improvement to m25p80'=
s API
> and allow for toggling the accuracy from dummy clock cycles to dummy byte=
s [1]
> will still be honored as in the same time making it possible to have full
> support for the API in the SPI controllers that currently do not (please =
reread
> the proposal in my previous reply that attempts to do this). I myself see=
 this
> as win/win situation, also because no controller should need modification=
s.
>

I am afraid your proposal does not work. Your proposed new device
property 'model_dummy_bytes' to select to convert the accurate dummy
clock cycle count to dummy bytes inside m25p80, is hard to justify as
a property to the flash itself, as the behavior is tightly coupled to
how the SPI controller works.

Please take a look at the Xilinx GQSPI controller, which supports both
use cases, that the dummy cycles can be transferred via tx fifo, or
generated by the controller automatically. Please read the example
given in:

    table 24=E2=80=9022, an example of Generic FIFO Contents for Quad I/O R=
ead
Command (EBh)

in https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ult=
rascale-trm.pdf

If you choose to set the m25p80 device property 'model_dummy_bytes' to
true when working with the Xilinx GQSPI controller, you are bound to
only allow guest software to use tx fifo to transfer the dummy cycles,
and this is wrong.

>
> >
> > > for the commands is because no request has been made for them. Also t=
here is
> > > one controller that has support.
> >
> > Definitely it's not "no request". Nearly all SPI flashes support the
> > Fast Read (0Bh) command today, and 0Bh requires a dummy cycle. This is
> > "seriously broken" for those case 1 type controllers because they
> > cannot read anything from the m25p80 model at all. Unless the guest
> > software being tested only uses Read (03h) command which is not
> > affected. But I can't find a software that uses Read instead of Fast
> > Read.
> >
> > > > The issue you pointed out that we require the total number of dummy
> > > > bits should be multiple of 8 is true, that's why I added the
> > > > unimplemented log message in this series (patch 2/3/4) to warn user=
s
> > > > if this expectation is not met. However this will not cause any iss=
ue
> > > > when running U-Boot or Linux, because both spi-nor drivers expect t=
he
> > > > same assumption as we do here.
> > > >
> > > > See U-Boot spi_nor_read_data() and Linux spi_nor_spimem_read_data()=
,
> > > > there is a logic to calculate the dummy bytes needed for fast read
> > > > command:
> > > >
> > > >     /* convert the dummy cycles to the number of bytes */
> > > >     op.dummy.nbytes =3D (nor->read_dummy * op.dummy.buswidth) / 8;
> > > >
> > > > Note the default dummy cycles configuration for all flashes I have
> > > > looked into as of today, meets the multiple of 8 assumption. On som=
e
> > > > flashes the dummy cycle number is configurable, and if it's been
> > > > configured to be an odd value, it would not work on U-Boot/Linux in
> > > > the first place.
> > > >
> > > > > >
> > > > > > Things get complicated when interacting with different SPI or Q=
SPI
> > > > > > flash controllers. There are major two cases:
> > > > > >
> > > > > > - Dummy bytes prepared by drivers, and wrote to the controller =
fifo.
> > > > > >   For such case, driver will calculate the correct number of du=
mmy
> > > > > >   bytes and write them into the tx fifo. Fixing the m25p80 mode=
l will
> > > > > >   fix flashes working with such controllers.
> > > > >
> > > > > Above can be fixed while still keeping the detailed dummy cycle i=
mplementation
> > > > > inside m25p80. Perhaps one of the following could be looked into:=
 configurating
> > > > > the amount, letting the spi ctrl fetch the amount from m25p80 or =
by inheriting
> > > > > some functionality handling this in the SPI controller. Or a mixt=
ure of above.
> > > >
> > > > Please send patches to explain this in detail how this is going to
> > > > work. I am open to all possible solutions.
> > >
> > > In that case I suggest that you instead try with a device property
> > > 'model_dummy_bytes' used to select to convert the accurate dummy cloc=
k cycle
> > > count to dummy bytes inside m25p80. Below is an example on how to mod=
ify the
> >
> > No this is wrong in my view. This is not like a DMA vs. PIO handling.
> >
> > > decode_fast_read_cmd function (the other commands requiring dummy clo=
ck cycles
> > > can follow a similar pattern). This way the fifo mode will be able to=
 work the
> > > way you desire while also keeping the current functionality intact. S=
uddenly
> > > removing functionality (features) will take users by surprise.
> >
> > I don't think we are removing any features. This is a fix to make the
> > model to be used by any SPI controllers.
> >
> > As I pointed out, both U-Boot and Linux have the multiple of 8
> > assumption for the dummy bit, which is the default configuration for
> > all flashes I have looked into so far. Can you please comment what use
> > case you want to support? I requested a U-Boot/Linux kernel testing in
> > the previous SST thread [1] against Xilinx GQSPI but there was no
> > response.
>
> In [2] instructions on how to boot u-boot/Linux is found. For building th=
e
> various software components I followed the official doc in [3].

I see the following QEMU commands are used to test booting U-Boot/Linux:

$ qemu-system-aarch64 -M xlnx-zcu102,secure=3Don,virtualization=3Don -m 4G
-serial stdio -display none -device loader,file=3Du-boot.elf -kernel
bl31.elf -device loader,addr=3D0x40000000,file=3DImage -device
loader,addr=3D0x2000000,file=3Dsystem.dtb

I am not sure where the system.dtb gets built from?

In [3], it mentions the Xilinx QEMU is used. And a different QEMU
command is used as the example to launch U-Boot which is different
from your command above.

See https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841606/QEMU+-+Z=
ynq+UltraScale+MPSoC#QEMU-ZynqUltraScale+MPSoC-RunningaZynqUltraScale+U-boo=
tImageOnXilinx'sARMQEMU

$ ./aarch64-softmmu/qemu-system-aarch64 -M arm-generic-fdt -serial
mon:stdio -serial /dev/null -display none \
  -device loader,addr=3D0xfd1a0104,data=3D0x8000000e,data-len=3D4 \ # Un-re=
set the A53
  -device loader,file=3D./pre-built/linux/images/bl31.elf,cpu-num=3D0 \ #
ARM Trusted Firmware
  -device loader,file=3D./pre-built/linux/images/u-boot.elf\ # The
u-boot exectuable
  -hw-dtb ./pre-built/linux/images/zynqmp-qemu-arm.dtb # HW Device
Tree that QEMU uses to generate the model

It is using a machine called "arm-generic-fdt", but in the mainline
QEMU there is no such machine called "arm-generic-fdt".

>
> Best regards,
> Francisco
>
> [1] qemu/docs/system/deprecated.rst
> [2] https://github.com/franciscoIglesias/qemu-cmdline/blob/master/xlnx-zc=
u102-atf-u-boot-linux.md
> [3] https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/460653138/Xilin=
x+Open+Source+Linux
>

Regards,
Bin

