Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E939C589FCA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:17:48 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeTj-0004ir-LE
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1oJeIa-0001sW-LY; Thu, 04 Aug 2022 13:06:16 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:36598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1oJeIY-0006QD-Bo; Thu, 04 Aug 2022 13:06:16 -0400
Received: by mail-qv1-xf30.google.com with SMTP id y11so61019qvn.3;
 Thu, 04 Aug 2022 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=sxFq4MkCefRbaVSTryF7kaatZcdfcgqjn/6pFaw1Z6w=;
 b=gLzyeAZY30lYh6BWf1CAh2Zvq73Gy9ikqJ7pZhZyN8BcQ2e3TqE30jjLUkejXOtbF2
 cK5H87+sMDH70GiTFelQBcQTXCwxx8NMSThr+fFGB+QxZG+WciMyviSk+vjXARXuNeW+
 +Zc6c1pZ1j0KqUhxfjuO8gfvP+rk81dAS5uwZ15Hk0a6IeUN+hNg/13J0wmX9QUufZug
 qfGxHZwHrWueL0cpKjBcpSY9YKm6OfNQQs/yZphQgydOEHUIgFLgm9qnsOp4s6F5JA2E
 sHmJr0vLKBety+61lkCHM1oYrCOVcs4JL2wAfmYZODVC0wridePK5FRgzSfxbLl+wCS2
 wwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=sxFq4MkCefRbaVSTryF7kaatZcdfcgqjn/6pFaw1Z6w=;
 b=HSkSXuh9D9UBJpY3e0OSf51VZterwEItgGiaxg0aqW1L+x47C1B9Vi85Nl8+CzgT0E
 4EXIFAz5SOYKK77qKria3sWjlqJsPcdcX041cg96RiCd6uQb/jwJ6V87oOWBqqCkB+R/
 eKhIomD0/JszqwIlmvDCJ7Mtd0xv8a7FQAldlkl8JH8uW7jWZw4xqgrU6rxRloNcEvx6
 TnFrtmHTb+k7rzaX6g0V9NK1DL2vMnA7S+Hz6xQuCgClKaHQS4dvxuiahBE3jEnK2eqm
 w9d1ZTJvgYmIUnqAwwdgFw0aFQ8/WIsMBD/L2aBd5a67f0sbYRFl6cVdpCV+5pnLFObn
 QX1Q==
X-Gm-Message-State: ACgBeo1LBes+YZ1yrclfFtNWBGHrvh8+FQHqwKIOIvDaXCA3zl7ukZIo
 qoCJlUooXfFT6g2FO473CtDq+e7dFjTRquiwFoQ=
X-Google-Smtp-Source: AA6agR7Ugi9DDGWE+Kf2I/cEinna4pM2e15a3D+fIGs6N7fAuaXrvGjP9A2QzfDd2nPy7BqpsSNllbUYOKRbN2Wo360=
X-Received: by 2002:a05:6214:d88:b0:478:c84c:6c17 with SMTP id
 e8-20020a0562140d8800b00478c84c6c17mr1058274qve.63.1659632771577; Thu, 04 Aug
 2022 10:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
 <YuQZP4xkkU2R9VmO@pdel-mbp.dhcp.thefacebook.com>
 <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
 <YuWrbJglNYdGOmUh@pdel-mbp.dhcp.thefacebook.com>
 <2f7f05aa-6aa2-970e-b4ab-bfbed80b381b@kaod.org>
In-Reply-To: <2f7f05aa-6aa2-970e-b4ab-bfbed80b381b@kaod.org>
From: Dan Zhang <dz4list@gmail.com>
Date: Thu, 4 Aug 2022 10:06:00 -0700
Message-ID: <CAJxKyLfOs9aQar5NP7j-1qsqeZGbsofEzDfr5QbvRrH_rv2gjg@mail.gmail.com>
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Delevoryas <peter@pjd.dev>, Iris Chen <irischenlj@fb.com>,
 Peter Delevoryas <pdel@fb.com>, 
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 patrick@stwcx.xyz, 
 Alistair Francis <alistair@alistair23.me>, kwolf@redhat.com, hreitz@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Joel Stanley <joel@jms.id.au>, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=dz4list@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Aug 2022 13:10:06 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 2, 2022 at 7:25 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 7/31/22 00:06, Peter Delevoryas wrote:
> > On Sat, Jul 30, 2022 at 11:18:33PM +0200, C=C3=A9dric Le Goater wrote:
> >> On 7/29/22 19:30, Peter Delevoryas wrote:
> >>> On Fri, Jul 29, 2022 at 03:25:55PM +0200, C=C3=A9dric Le Goater wrote=
:
> >>>> Hello Iris,
> >>>>
> >>>> On 7/29/22 01:23, Iris Chen wrote:
> >>>>> Hey everyone,
> >>>>>
> >>>>> I have been working on a project to add support for SPI-based TPMs =
in QEMU.
> >>>>> Currently, most of our vboot platforms using a SPI-based TPM use th=
e Linux
> >>>>> SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the=
 Aspeed
> >>>>> SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an i=
mplementation
> >>>>> deficiency that prevents bi-directional operations.
> >>>> aspeed_smc models the Aspeed FMC/SPI controllers which have a well d=
efined
> >>>> HW interface. Your model proposal adds support for a new SPI control=
ler
> >>>> using bitbang GPIOs. These are really two differents models. I don't=
 see
> >>>> how you could reuse aspeed_smc for this purpose.
> >>>>
> >>>> or you mean that Linux is using the SPI-GPIO driver because the Linu=
x
> >>>> Aspeed SMC driver doesn't match the need ? It is true that the Linux
> >>>> driver is not generic, it deals with flash devices only. But that's
> >>>> another problem.
> >>>>
> >>>>> Thus, in order to connect
> >>>>> a TPM to this bus, my patch implements a QEMU SPI-GPIO driver (as t=
he QEMU
> >>>>> counterpart of the Linux SPI-GPIO driver).
> >>>>>
> >>>>> As we use SPI-based TPMs on many of our BMCs for the secure-boot im=
plementation,
> >>>>> I have already tested this implementation locally with our Yosemite=
-v3.5 platform
> >>>>> and Facebook-OpenBMC. This model was tested by connecting a generic=
 SPI-NOR (m25p80
> >>>>> for example) to the Yosemite-v3.5 SPI bus containing the TPM.
> >>>>>
> >>>>> This patch is an RFC because I have several questions about design.=
 Although the
> >>>>> model is working, I understand there are many areas where the desig=
n decision
> >>>>> is not deal (ie. abstracting hard coded GPIO values). Below are som=
e details of the
> >>>>> patch and specific areas where I would appreciate feedback on how t=
o make this better:
> >>>>> hw/arm/aspeed.c:
> >>>>> I am not sure where the best place is to instantiate the spi_gpio b=
esides the
> >>>>> aspeed_machine_init.
> >>>>
> >>>> The SPI GPIO device would be a platform device and not a SoC device.
> >>>> Hence, it should be instantiated at the machine level, like the I2C
> >>>> device are, using properties to let the model know about the GPIOs
> >>>> that should be driven to implement the SPI protocol.
> >>>
> >>> Agreed, should be like an I2C device.
> >>>
> >>>>
> >>>> Ideally, the state of the GPIO controller pins and the SPI GPIO stat=
e
> >>>> should be shared. I think that's what you are trying to do that with
> >>>> attribute 'controller_state' in your patch ? But, the way it is done
> >>>> today, is too tightly coupled (names) with the Aspeed GPIO model to
> >>>> be generic.
> >>>>
> >>>> I think we need an intermediate QOM interface, or a base class, to
> >>>> implement an abstract SPI GPIO model and an Aspeed SPI GPIO model
> >>>> on top which would be linked to the Aspeed GPIO model of the SoC
> >>>> in use.
> >>>
> >>> Disagree, I feel like we can accomplish this without inheritance.
> >>>
> >>>>
> >>>> Or we could introduce some kind of generic GPIO controller that
> >>>> we would link the SPI GPIO model with (using a property). The
> >>>> Aspeed GPIO model would be of that kind and the SPI GPIO model
> >>>> would be able to drive the pins using a common interface.
> >>>> That's another way to do it.
> >>>
> >>> Agree, I would like to go in this direction if at all possible.
> >> Let's give it a try then. I would introduce a new QOM interface,
> >> something like  :
> >>
> >>      #define TYPE_GPIO_INTERFACE "gpio-interface"
> >>      #define GPIO_INTERFACE(obj)                                     \
> >>          INTERFACE_CHECK(GpioInterface, (obj), TYPE_GPIO_INTERFACE)
> >>      typedef struct GpioInterfaceClass GpioInterfaceClass;
> >>      DECLARE_CLASS_CHECKERS(GpioInterfaceClass, GPIO_INTERFACE,
> >>                             TYPE_GPIO_INTERFACE)
> >>      struct GpioInterfaceClass {
> >>          InterfaceClass parent;
> >>          int (*get)(GpioInterface *gi, ...);
> >>          int (*set)(GpioInterface *gi, ...);
> >>          ...
> >>      };
> >>
> >> and implement the interface handlers under the AspeedGPIO model.
> >> The SPI GPIO model would have a link to such an interface to drive
> >> the GPIO pins.
> >>
> >> See IPMI and XIVE for some more complete models.
> >
> > This sounds good, but I just want to clarify first:
> >
> > Is it necessary to introduce a GPIO interface?
>
> Well, my feeling is that we need an abstract layer to interface the
> SPI GPIO model with any model of GPIO controller.
>
This abstract layer can be in form of virtual func of spi_gpio base class
set_cs(bool), set_clk(), set_mosi(), get_miso().
This give user (normally the board model creator ) the full flexibility as
how to implement these function in inherit class of spi_gpio i.e.
aspeed_spi_gpio

The down side of virtual function "abstract" layer is that user need
to write QEMU code.

Another form of abstract layer is "output pin and properties of GPIO
controller model"
The pro of this is that as long as the GPIO controller provides these
required output pin
and property, the final user can use command line input parameters to
connect the
spi_gpio with the gpio controller.

The required pin and property to controller model will be:
Two named output pins exposed as QEMUIrq, which will be used as SPI_CS
and SPI_CLK.
Two properties which can be used by spi_gpio to get (sample) the level
as SPI_MOSI and
set the level as SPI_MISO.


> > Or, could we connect the IRQ's just using the existing
> > QOM/sysbus/object/IRQ infrastructure?
>
> and we would use the QOM canonical path to identify the GPIO pins
> and QOM routines to get and set the values ? It looks feasible.
> That's how I would do it in a script but not in model.



>
> > I'll investigate if we can connect the IRQ's without introducing a new
> > interface. We can continue with this design for now though.
>
> OK. Let's see.
>
> >>>>> Could we add the ability to instantiate it on the command line?
> >>>>
> >>>> It might be complex to identify the QOM object to use as the GPIO
> >>>> controller from the command line since it is on the SoC and not
> >>>> a platform device. In that case, an Aspeed SPI GPIO model would
> >>>> be a better approach. we  would have to peek in the machine/soc to
> >>>> get a link on the Aspeed GPIO model in the realize routine of the
> >>>> Aspeed SPI GPIO model.
> >>>
> >>> Hrrrm perhaps, I feel like it shouldn't be that hard though.
> >>>
> >>> - Get a pointer to the QOM object that holds the GPIO's using object
> >>>     path or ID. Something similar to '-device ftgmac100,netdev=3D<id>=
'
> >>>     right?
> >>
> >> yes. something like that.
> >
> > +1
> >
> >>
> >>> - Get the GPIO's by name from the QOM object.
> >>
> >> yes.
> >
> > +1
> >
> >>
> >>> In this situation, I think we should be able to get the GPIO controll=
er
> >>> object, and then get the IRQ's by the "sysbus-irq[126]"/etc name.
> >>>
> >>> We could refactor the aspeed_gpio.c model to name the IRQ's like the
> >>> properties,.  to use "gpioX4" instead of "sysbus-irq[*]".
> >>
> >> we could use qdev_init_gpio_out_named() instead of sysbus_init_irq()
> >> to name them.
> >>
> >
> > +1, I actually suggested to Iris offline that this change might be
> > useful regardless.
>
> yes. This change can come as a preliminary.
>
> >
> >>
> >>>>> m25p80_transfer8_ex in hw/block/m25p80.c:
> >>>>> Existing SPI model assumed that the output byte is fully formed, ca=
n be passed to
> >>>>> the SPI device, and the input byte can be returned, all in one oper=
ation. With
> >>>>> SPI-GPIO we don't have the input byte until all 8 bits of the outpu=
t have been
> >>>>> shifted out, so we have to prime the MISO with bogus values (0xFF).
> >>>>
> >>>> That's fine I think. We do something similar for dummies.
> >>>>
> >>>>> MOSI pin in spi_gpio: the mosi pin is not included and we poll the =
realtime value
> >>>>> of the gpio for input bits to prevent bugs with caching the mosi va=
lue. It was discovered
> >>>>> during testing that when using the mosi pin as the input pin, the m=
osi value was not
> >>>>> being updated due to a kernel and aspeed_gpio model optimization.
> >>>>
> >>>> ah. We need help from Andrew ! the model should have a mosi pin .
> >>>
> >>> Not sure if this was clear, but Iris is just saying that she used obj=
ect
> >>> properties to read and write the mosi, miso, and clk pins, rather tha=
n
> >>> the IRQ's.
> >>
> >> The IRQ line is not raised ?
> >
> > Something like that, yes. She was having trouble following the IRQ leve=
l
> > purely through edge changes. Perhaps this is due to a bug in
> > aspeed_gpio.c.
>
> That could be it. The HW logic is quite complex. Adding more tests as
> suggested by Andrew would help.
>
>
> Thanks,
>
> C.
>
>
>
> >
> >>
> >>> Certainly we'd like to use IRQ's instead, but she ran into correctnes=
s
> >>> problems. Maybe we can investigate that further and fix it.
> >>
> >> So much is happening in that mode. We need more trace events in the As=
peed
> >> GPIO model at least an extra in aspeed_gpio_update()
> >
> > +1
> >
> >>
> >> Thanks,
> >>
> >> C.
> >>
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>> C.
> >>>>
> >>>>> Thus, here we are
> >>>>> reading the value directly from the gpio controller instead of wait=
ing for the push.
> >>>>>
> >>>>> I realize there are Aspeed specifics in the spi_gpio model. To make=
 this extensible,
> >>>>> is it preferred to make this into a base class and have our Aspeed =
SPI GPIO extend
> >>>>> this or we could set up params to pass in the constructor?
> >>>>>
> >>>>> Thanks for your review and any direction here would be helpful :)
> >>>>>
> >>>>> Iris Chen (3):
> >>>>>      hw: m25p80: add prereading ability in transfer8
> >>>>>      hw: spi_gpio: add spi gpio model
> >>>>>      hw: aspeed: hook up the spi gpio model
> >>>>>
> >>>>>     hw/arm/Kconfig            |   1 +
> >>>>>     hw/arm/aspeed.c           |   5 ++
> >>>>>     hw/block/m25p80.c         |  29 ++++++-
> >>>>>     hw/ssi/Kconfig            |   4 +
> >>>>>     hw/ssi/meson.build        |   1 +
> >>>>>     hw/ssi/spi_gpio.c         | 166 +++++++++++++++++++++++++++++++=
+++++++
> >>>>>     hw/ssi/ssi.c              |   4 -
> >>>>>     include/hw/ssi/spi_gpio.h |  38 +++++++++
> >>>>>     include/hw/ssi/ssi.h      |   5 ++
> >>>>>     9 files changed, 248 insertions(+), 5 deletions(-)
> >>>>>     create mode 100644 hw/ssi/spi_gpio.c
> >>>>>     create mode 100644 include/hw/ssi/spi_gpio.h
> >>>>>
> >>>>
> >>
>

