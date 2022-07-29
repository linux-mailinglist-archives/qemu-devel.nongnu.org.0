Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211A5848DF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 02:08:21 +0200 (CEST)
Received: from localhost ([::1]:53020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHDYC-0001I0-2E
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 20:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oHDUB-0007kw-QZ; Thu, 28 Jul 2022 20:04:12 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:55157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oHDU9-0005ZA-8O; Thu, 28 Jul 2022 20:04:11 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C0F60580970;
 Thu, 28 Jul 2022 20:04:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 28 Jul 2022 20:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1659053045; x=1659056645; bh=xgSP42vbAZ
 SLhepapOuVyt/hlHA3kBHyULg6xLce66w=; b=gEvyKGrXjAR2cSfv/B0WWrhZhB
 sD689jLF57uqtTsRUUJ97H1wolnHno5/JWHhzHlQDiOCVk5SmODpD5RA2zLCwGJh
 cdev8bcN1hgEiOTXEjW00xbmiPKRoV/0KwLWgp95a03oh7qPWVwS97oYdwzKhShU
 BngCrh82/dhAtHYwht2M1QJoopKVbqoWDAsZYU6XOmjO/9WwyEn8yfcw9OFKDDaC
 04sEoGF/dv27RXF1ipOYRxO0QbSTB11gBNrzWfiUEFJRLasQv1PAq3dQdmQMj6G6
 O2Bb1YnbfE3pV+d2uwJeshlsqtparMYnWt17hr9T59H+nJ/gcdNE1AwFOMyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659053045; x=1659056645; bh=xgSP42vbAZSLhepapOuVyt/hlHA3
 kBHyULg6xLce66w=; b=JeracpJqhr+zEk3Auf0Ev+RC3RobWSwIwK4kBaH96227
 XaNKrCeR9tfDSS54AFnERAXyeK1UJUJgbYwzG+0L5tL39d171+kG6kgwcMHf+ryh
 MQYuC8tLDNnbR6IMYZms55Ibv6N7wc/XITkBBvE0Ao2HGzXHIljfDTi0IQQ0fgjl
 rI53mBQNte81QgCIykVSwJbAMw9tiq9GLD2UbSE4gRydU2yKkgcJdvMr61dPjD1l
 0WUaR4Kc1u3pebIAFX1GFlcG44Uy/yJijVxI2RuJc/L2V8+EsICBC54O+u+Hl2ZN
 u9nggqvIZUlXP31SCcD/4og+rHftNlIhhKAAJGlStw==
X-ME-Sender: <xms:9SPjYrn--ARM8iijKxWAaIon5p1PiP2urrS4q7FEtSBFKRnfrEWJGw>
 <xme:9SPjYu3GYFtzVSOg2XntiT1hA8pNJfsCjIvB4m3GIuniFiqb4Dy76RA7B1Y-17d1G
 q_BpT5Rxa1vPRuSxWc>
X-ME-Received: <xmr:9SPjYhr5ybpgLZGsm42luPIqsL9shEShmamrGQYMKm8MsCry6ouPGtW9f7S9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduhedgudefgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesth
 dtredttddtvdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgv
 rhesphhjugdruggvvheqnecuggftrfgrthhtvghrnhepudetiefhffelueevkeegudfgfe
 efhedtgeeuffffhfelhefgudeujeejkeefueeknecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:9SPjYjnYp3Jod9bxSeqklZXUK3fkdIREbkS-ryd7wygm3aHba8cyBQ>
 <xmx:9SPjYp0KipyVt3jcBKHrboXI36bDF5eCsm95KAywSu9_B5mWjdiCTg>
 <xmx:9SPjYisv8huV2rnLmWeyM77UF8v-S_8aY7N3J0gA6oiZJRB4edqneA>
 <xmx:9SPjYo320JY2EALXdMVv-t1OvIqNW5hsXJTE1T7Pp1kU1SUSIhpMWw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 20:04:03 -0400 (EDT)
Date: Thu, 28 Jul 2022 17:04:01 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org, dz4list@gmail.com
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Message-ID: <YuMj8bU9BTjUWaT8@pdel-mbp>
References: <20220728232322.2921703-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728232322.2921703-1-irischenlj@fb.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
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

On Thu, Jul 28, 2022 at 04:23:19PM -0700, Iris Chen wrote:
> Hey everyone,
> 
> I have been working on a project to add support for SPI-based TPMs in QEMU.
> Currently, most of our vboot platforms using a SPI-based TPM use the Linux 
> SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the Aspeed 
> SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an implementation 
> deficiency that prevents bi-directional operations. Thus, in order to connect 
> a TPM to this bus, my patch implements a QEMU SPI-GPIO driver (as the QEMU
> counterpart of the Linux SPI-GPIO driver).
> 
> As we use SPI-based TPMs on many of our BMCs for the secure-boot implementation,  
> I have already tested this implementation locally with our Yosemite-v3.5 platform 
> and Facebook-OpenBMC. This model was tested by connecting a generic SPI-NOR (m25p80 
> for example) to the Yosemite-v3.5 SPI bus containing the TPM.
> 
> This patch is an RFC because I have several questions about design. Although the
> model is working, I understand there are many areas where the design decision
> is not deal (ie. abstracting hard coded GPIO values). Below are some details of the 
> patch and specific areas where I would appreciate feedback on how to make this better:
>  
> hw/arm/aspeed.c: 
> I am not sure where the best place is to instantiate the spi_gpio besides the
> aspeed_machine_init. Could we add the ability to instantiate it on the command line?

Yes, hypothetically I think it would be something like this:

-device spi-gpio,miso=aspeed.gpio.gpioX4,mosi=aspeed.gpio.gpioX5,id=foo
-device n25q00,bus=foo,drive=bar
-drive file=bar.mtd,format=raw,if=mtd,id=bar

Something like that? I haven't really looked into the details. I think
it requires work in several other places though.

> 
> m25p80_transfer8_ex in hw/block/m25p80.c: 
> Existing SPI model assumed that the output byte is fully formed, can be passed to 
> the SPI device, and the input byte can be returned, all in one operation. With 
> SPI-GPIO we don't have the input byte until all 8 bits of the output have been 
> shifted out, so we have to prime the MISO with bogus values (0xFF).

Perhaps the Aspeed FMC model needs to support asynchronous transfers?
(Is the M25P80 model not asynchronous already?) I'm still skeptical that
the m25p80_transfer8_ex solution is appropriate.

> 
> MOSI pin in spi_gpio: the mosi pin is not included and we poll the realtime value
> of the gpio for input bits to prevent bugs with caching the mosi value. It was discovered 
> during testing that when using the mosi pin as the input pin, the mosi value was not 
> being updated due to a kernel and aspeed_gpio model optimization. Thus, here we are 
> reading the value directly from the gpio controller instead of waiting for the push.
> 
> I realize there are Aspeed specifics in the spi_gpio model. To make this extensible, 
> is it preferred to make this into a base class and have our Aspeed SPI GPIO extend 
> this or we could set up params to pass in the constructor?

Actually, I would hope that there won't be any inheritance here. The
kernel driver doesn't have some kind of inheritance implementation, for
example.

> 
> Thanks for your review and any direction here would be helpful :) 
> 
> Iris Chen (3):
>   hw: m25p80: add prereading ability in transfer8
>   hw: spi_gpio: add spi gpio model
>   hw: aspeed: hook up the spi gpio model
> 
>  hw/arm/Kconfig            |   1 +
>  hw/arm/aspeed.c           |   5 ++
>  hw/block/m25p80.c         |  29 ++++++-
>  hw/ssi/Kconfig            |   4 +
>  hw/ssi/meson.build        |   1 +
>  hw/ssi/spi_gpio.c         | 166 ++++++++++++++++++++++++++++++++++++++
>  hw/ssi/ssi.c              |   4 -
>  include/hw/ssi/spi_gpio.h |  38 +++++++++
>  include/hw/ssi/ssi.h      |   5 ++
>  9 files changed, 248 insertions(+), 5 deletions(-)
>  create mode 100644 hw/ssi/spi_gpio.c
>  create mode 100644 include/hw/ssi/spi_gpio.h
> 
> -- 
> 2.30.2
> 

