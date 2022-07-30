Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E408585C7F
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jul 2022 00:09:55 +0200 (CEST)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHuef-0001pT-Rx
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 18:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oHube-0007J4-BF; Sat, 30 Jul 2022 18:06:47 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:43477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oHubc-00084U-50; Sat, 30 Jul 2022 18:06:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3838580194;
 Sat, 30 Jul 2022 18:06:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 30 Jul 2022 18:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659218800; x=
 1659222400; bh=Q19SOrz+iixpkVrXoD1D8Yd8emXi7wNEhzPse00POkQ=; b=g
 qAZNaPYfuBCCqemibnwjocki8gxUc/5Ilk+w9hBEIXCR10hrmq3M/bMoIL8e2q6k
 3phuiAarri9NQi1oNFAvFAV3cTn2VzJtuFCbvqBqoTwJeF4b/dhpKmw0Mkj30hiL
 D0BbPuOBV0e6EpYcd6S1Yl6HB66Z/ai5D1xrMi/hjniMOJ+WtpTmFW0lIZYm0XTA
 QHTEjkIPQS2nUreYcrL3PsqyFc7hLzPffaPsHtdMz3EG6NEDzBPZpXPX8sDgJ1Ki
 ILlGP1z93y3JVqjlagPbNj4rN2LiBEa7PdIwGKir0tcAnMBDyTuBVuryH2Y/7p5t
 U9Be4f8U73UgwLn097kUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659218800; x=
 1659222400; bh=Q19SOrz+iixpkVrXoD1D8Yd8emXi7wNEhzPse00POkQ=; b=W
 qW2G1E1DxlAMuHmDiDA2ZdjgAP8qSy5atclv8yKLUaxa52eqx53drUoV0TG5xYOV
 nt4jH/W046jpSpPoOrMtbAnwh90+RvyxUymcFfDqNd4OwXVGAN0lgL58hZupgBvV
 DjuxJuIOSqhtmi+U7XatKgR6On56m/nJMISaW1kcCOZaWSxhjd4Wv1bJRoy8JM5S
 q+n/JPPi7wG/keZjHOP5eSTdpOBiyfMHYIos4bfJm2/TA8B6vwBBhQk0Yki/aG/U
 MnfyNTLd9GTRSCGxX7sYVBBDASRGqSd7R446vT2Wq0PzvTuLrSh/pMLb9x6exogH
 YdEK17W5rEhN+7CVs+LwQ==
X-ME-Sender: <xms:cKvlYnlDugbLkee-ZnBy8fpKAprVUQYtseqfogoMGgKVgak8EU0c1Q>
 <xme:cKvlYq2Mb588i65hkLHD0BlcJC7Mk-QK8Vj2OtzGubYsNOxOx8P8QFdeYOiRp7uJP
 Le1i0ZPYHXS2Yhj07A>
X-ME-Received: <xmr:cKvlYtqrvscruypRYcQZc02oTtHeZeWmLZGnRJpkW7XhFQeTIBwXsnU18voo1DGVv_kv7rI4Vgjv6a8LwnbKUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvtddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesth
 ekrodttddtudenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgv
 rhesphhjugdruggvvheqnecuggftrfgrthhtvghrnhepffeiuddthfeifedtleektedvtd
 ellefgffeujeehjeejiefhffduveegleeiledtnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:cKvlYvlzcBhaNMdl4lEYCR3sPrDGhY4TEctPA41TxzEw37bJ8oazyQ>
 <xmx:cKvlYl3b4oPnLaOPKuaKU4UKe9zoIFnZG0dooPdeIuxGYTBgmMK3ZA>
 <xmx:cKvlYuuQT1lR65OXgp-Rzb2h3M4VCIZ7xoTJi0Eq8puwyZKgiqDfjg>
 <xmx:cKvlYk2kNSssdUDFz9OqrSPO1pUjNPenmmV0yTaiQu3weUEr1E9bjQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Jul 2022 18:06:38 -0400 (EDT)
Date: Sat, 30 Jul 2022 15:06:36 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Iris Chen <irischenlj@fb.com>, pdel@fb.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, patrick@stwcx.xyz, alistair@alistair23.me,
 kwolf@redhat.com, hreitz@redhat.com, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, qemu-block@nongnu.org,
 dz4list@gmail.com
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Message-ID: <YuWrbJglNYdGOmUh@pdel-mbp.dhcp.thefacebook.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
 <YuQZP4xkkU2R9VmO@pdel-mbp.dhcp.thefacebook.com>
 <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

On Sat, Jul 30, 2022 at 11:18:33PM +0200, Cédric Le Goater wrote:
> On 7/29/22 19:30, Peter Delevoryas wrote:
> > On Fri, Jul 29, 2022 at 03:25:55PM +0200, Cédric Le Goater wrote:
> > > Hello Iris,
> > > 
> > > On 7/29/22 01:23, Iris Chen wrote:
> > > > Hey everyone,
> > > > 
> > > > I have been working on a project to add support for SPI-based TPMs in QEMU.
> > > > Currently, most of our vboot platforms using a SPI-based TPM use the Linux
> > > > SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the Aspeed
> > > > SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an implementation
> > > > deficiency that prevents bi-directional operations.
> > > aspeed_smc models the Aspeed FMC/SPI controllers which have a well defined
> > > HW interface. Your model proposal adds support for a new SPI controller
> > > using bitbang GPIOs. These are really two differents models. I don't see
> > > how you could reuse aspeed_smc for this purpose.
> > > 
> > > or you mean that Linux is using the SPI-GPIO driver because the Linux
> > > Aspeed SMC driver doesn't match the need ? It is true that the Linux
> > > driver is not generic, it deals with flash devices only. But that's
> > > another problem.
> > > 
> > > > Thus, in order to connect
> > > > a TPM to this bus, my patch implements a QEMU SPI-GPIO driver (as the QEMU
> > > > counterpart of the Linux SPI-GPIO driver).
> > > > 
> > > > As we use SPI-based TPMs on many of our BMCs for the secure-boot implementation,
> > > > I have already tested this implementation locally with our Yosemite-v3.5 platform
> > > > and Facebook-OpenBMC. This model was tested by connecting a generic SPI-NOR (m25p80
> > > > for example) to the Yosemite-v3.5 SPI bus containing the TPM.
> > > > 
> > > > This patch is an RFC because I have several questions about design. Although the
> > > > model is working, I understand there are many areas where the design decision
> > > > is not deal (ie. abstracting hard coded GPIO values). Below are some details of the
> > > > patch and specific areas where I would appreciate feedback on how to make this better:
> > > > hw/arm/aspeed.c:
> > > > I am not sure where the best place is to instantiate the spi_gpio besides the
> > > > aspeed_machine_init.
> > > 
> > > The SPI GPIO device would be a platform device and not a SoC device.
> > > Hence, it should be instantiated at the machine level, like the I2C
> > > device are, using properties to let the model know about the GPIOs
> > > that should be driven to implement the SPI protocol.
> > 
> > Agreed, should be like an I2C device.
> > 
> > > 
> > > Ideally, the state of the GPIO controller pins and the SPI GPIO state
> > > should be shared. I think that's what you are trying to do that with
> > > attribute 'controller_state' in your patch ? But, the way it is done
> > > today, is too tightly coupled (names) with the Aspeed GPIO model to
> > > be generic.
> > > 
> > > I think we need an intermediate QOM interface, or a base class, to
> > > implement an abstract SPI GPIO model and an Aspeed SPI GPIO model
> > > on top which would be linked to the Aspeed GPIO model of the SoC
> > > in use.
> > 
> > Disagree, I feel like we can accomplish this without inheritance.
> > 
> > > 
> > > Or we could introduce some kind of generic GPIO controller that
> > > we would link the SPI GPIO model with (using a property). The
> > > Aspeed GPIO model would be of that kind and the SPI GPIO model
> > > would be able to drive the pins using a common interface.
> > > That's another way to do it.
> > 
> > Agree, I would like to go in this direction if at all possible.
> Let's give it a try then. I would introduce a new QOM interface,
> something like  :
> 
>     #define TYPE_GPIO_INTERFACE "gpio-interface"
>     #define GPIO_INTERFACE(obj)                                     \
>         INTERFACE_CHECK(GpioInterface, (obj), TYPE_GPIO_INTERFACE)
>     typedef struct GpioInterfaceClass GpioInterfaceClass;
>     DECLARE_CLASS_CHECKERS(GpioInterfaceClass, GPIO_INTERFACE,
>                            TYPE_GPIO_INTERFACE)
>     struct GpioInterfaceClass {
>         InterfaceClass parent;
>         int (*get)(GpioInterface *gi, ...);
>         int (*set)(GpioInterface *gi, ...);
>         ...
>     };
> 
> and implement the interface handlers under the AspeedGPIO model.
> The SPI GPIO model would have a link to such an interface to drive
> the GPIO pins.
> 
> See IPMI and XIVE for some more complete models.

This sounds good, but I just want to clarify first:

Is it necessary to introduce a GPIO interface?

Or, could we connect the IRQ's just using the existing
QOM/sysbus/object/IRQ infrastructure?

I'll investigate if we can connect the IRQ's without introducing a new
interface. We can continue with this design for now though.

> 
> > > > Could we add the ability to instantiate it on the command line?
> > > 
> > > It might be complex to identify the QOM object to use as the GPIO
> > > controller from the command line since it is on the SoC and not
> > > a platform device. In that case, an Aspeed SPI GPIO model would
> > > be a better approach. we  would have to peek in the machine/soc to
> > > get a link on the Aspeed GPIO model in the realize routine of the
> > > Aspeed SPI GPIO model.
> > 
> > Hrrrm perhaps, I feel like it shouldn't be that hard though.
> > 
> > - Get a pointer to the QOM object that holds the GPIO's using object
> >    path or ID. Something similar to '-device ftgmac100,netdev=<id>'
> >    right?
> 
> yes. something like that.

+1

> 
> > - Get the GPIO's by name from the QOM object.
> 
> yes.

+1

> 
> > In this situation, I think we should be able to get the GPIO controller
> > object, and then get the IRQ's by the "sysbus-irq[126]"/etc name.
> > 
> > We could refactor the aspeed_gpio.c model to name the IRQ's like the
> > properties,.  to use "gpioX4" instead of "sysbus-irq[*]".
> 
> we could use qdev_init_gpio_out_named() instead of sysbus_init_irq()
> to name them.
>

+1, I actually suggested to Iris offline that this change might be
useful regardless.

> 
> > > > m25p80_transfer8_ex in hw/block/m25p80.c:
> > > > Existing SPI model assumed that the output byte is fully formed, can be passed to
> > > > the SPI device, and the input byte can be returned, all in one operation. With
> > > > SPI-GPIO we don't have the input byte until all 8 bits of the output have been
> > > > shifted out, so we have to prime the MISO with bogus values (0xFF).
> > > 
> > > That's fine I think. We do something similar for dummies.
> > > 
> > > > MOSI pin in spi_gpio: the mosi pin is not included and we poll the realtime value
> > > > of the gpio for input bits to prevent bugs with caching the mosi value. It was discovered
> > > > during testing that when using the mosi pin as the input pin, the mosi value was not
> > > > being updated due to a kernel and aspeed_gpio model optimization.
> > > 
> > > ah. We need help from Andrew ! the model should have a mosi pin .
> > 
> > Not sure if this was clear, but Iris is just saying that she used object
> > properties to read and write the mosi, miso, and clk pins, rather than
> > the IRQ's.
> 
> The IRQ line is not raised ?

Something like that, yes. She was having trouble following the IRQ level
purely through edge changes. Perhaps this is due to a bug in
aspeed_gpio.c.

> 
> > Certainly we'd like to use IRQ's instead, but she ran into correctness
> > problems. Maybe we can investigate that further and fix it.
> 
> So much is happening in that mode. We need more trace events in the Aspeed
> GPIO model at least an extra in aspeed_gpio_update()

+1

> 
> Thanks,
> 
> C.
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > C.
> > > 
> > > > Thus, here we are
> > > > reading the value directly from the gpio controller instead of waiting for the push.
> > > > 
> > > > I realize there are Aspeed specifics in the spi_gpio model. To make this extensible,
> > > > is it preferred to make this into a base class and have our Aspeed SPI GPIO extend
> > > > this or we could set up params to pass in the constructor?
> > > > 
> > > > Thanks for your review and any direction here would be helpful :)
> > > > 
> > > > Iris Chen (3):
> > > >     hw: m25p80: add prereading ability in transfer8
> > > >     hw: spi_gpio: add spi gpio model
> > > >     hw: aspeed: hook up the spi gpio model
> > > > 
> > > >    hw/arm/Kconfig            |   1 +
> > > >    hw/arm/aspeed.c           |   5 ++
> > > >    hw/block/m25p80.c         |  29 ++++++-
> > > >    hw/ssi/Kconfig            |   4 +
> > > >    hw/ssi/meson.build        |   1 +
> > > >    hw/ssi/spi_gpio.c         | 166 ++++++++++++++++++++++++++++++++++++++
> > > >    hw/ssi/ssi.c              |   4 -
> > > >    include/hw/ssi/spi_gpio.h |  38 +++++++++
> > > >    include/hw/ssi/ssi.h      |   5 ++
> > > >    9 files changed, 248 insertions(+), 5 deletions(-)
> > > >    create mode 100644 hw/ssi/spi_gpio.c
> > > >    create mode 100644 include/hw/ssi/spi_gpio.h
> > > > 
> > > 
> 

