Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC353B480
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 09:43:22 +0200 (CEST)
Received: from localhost ([::1]:39140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwfUH-0005uG-RQ
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 03:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwfLT-0001N3-0G; Thu, 02 Jun 2022 03:34:15 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwfLQ-0005Me-J2; Thu, 02 Jun 2022 03:34:14 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8DED93200916;
 Thu,  2 Jun 2022 03:34:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 02 Jun 2022 03:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654155248; x=1654241648; bh=yo
 wEY7uQrSDt5NNDp4lFVZcsizEWdlR2aE86b9lljV8=; b=YWNbY6DB77C7irftZq
 yvF/DYnF4XIMnwc6n6X+rNY/ZvarXEbFtJy6ukeXe7OVWMF3yGcvQPQfAnosaOcK
 H67qf+j7H3WZ6z+/NcGt68NJfKIRV33wW0iRUwu0ZSxBvjJf0Q/sRQ1A5C5m4nl7
 8KFWwpcQdYWVjEOv6MvtiPYmQTcPy9aHmc0ffRpRTN2O7xco+TbrgUGINwDmkQH0
 /dwFXjIU5BPQI2TSmjTP+TqCJoAwwS6RdWJnyTkCEXPVlO1Qzv+2WhT2szSSBtmJ
 Vpc+0x+h/uMidOg+qUXZw/SBj3ez9XK/ByNMOfKRZv1oXdFLr+ADbk0BmPh47HW6
 PsXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654155248; x=1654241648; bh=yowEY7uQrSDt5NNDp4lFVZcsizEW
 dlR2aE86b9lljV8=; b=r1YWYtmrYcJqzDM8oYa23ljcSRiqxCJ3kCe/NQlHUHfh
 DEQ4tyYeWT8VPtIHtFGprwL3dbygAHOmOmetL6oxCe1c/hD98WRCxbejnCG4p9+E
 sSGfFaPCQ0RezjaHJzcr3VAM/XMJ9ZM+BlES57HH93qx0p0TOn5WBP0ZyVcMipgr
 OYUHDIOH1V9UQc5k8VtBIWZRWhOZ5GZV9R4xjcfV8mG2NlRUKvFWn/hrA98DJMoe
 dG7YZty12tV7uZHh72H6BtzVFbZ01E0RYMQsOCZaB0vMb/o2hr09u95Ww7TciLhZ
 4Ulndi1Ssanzbn+D19wHMi/trmMy1RKLI5t3dyL79w==
X-ME-Sender: <xms:72eYYt1XoIe56Rhkzz30pi5VDfDeCvggy12D06oDNGFQzCbOT4fu8Q>
 <xme:72eYYkET6LsZChJv7ei_VQGJ7MOuCwH-TiDTDF1fd_0HRaqIKhFhqIwD74xy1yKmh
 QY1PmQTjmuvFKNVuXU>
X-ME-Received: <xmr:72eYYt7waJj2R4X_Ro_qdDrWqpt7vm_7zo7s-Ow__oWr_ppawXJX2qDFO3rJ7woY7Eq2Splemcby4q2_hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:72eYYq1uoQLdhbMB9r-xjH0Nd4uPlwDLFtAkCr3mezENl3hvgslcww>
 <xmx:72eYYgFS63HO2fbza0mYBazxAmjttEpLwSe27xP4yHKDUQOLvpCP4Q>
 <xmx:72eYYr9sseS5JZFbD-wFZfZ4bsfD_ngMGIKFXV3PgnU0PtN6AgbXyA>
 <xmx:8GeYYndhAMLmwUhNS63-fwnmA-ippC6vTseWNd-hsOjXbekfunCORg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 03:34:05 -0400 (EDT)
Date: Thu, 2 Jun 2022 09:34:04 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 qemu-arm@nongnu.org, Peter Delevoryas <pdel@fb.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [RFC PATCH v2 2/6] hw/i2c/aspeed: add DEV_ADDR in old register
 mode
Message-ID: <Yphn7HrOZQqdLW1m@apples>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-3-its@irrelevant.dk>
 <13946fb6-727e-3d84-6028-8941a7e1907d@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xUXZVOhaG/wAgVc9"
Content-Disposition: inline
In-Reply-To: <13946fb6-727e-3d84-6028-8941a7e1907d@kaod.org>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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


--xUXZVOhaG/wAgVc9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  2 09:30, C=C3=A9dric Le Goater wrote:
> On 6/1/22 23:08, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add support for writing and reading the device address register in old
> > register mode.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/i2c/aspeed_i2c.c         | 5 +++--
> >   include/hw/i2c/aspeed_i2c.h | 8 ++++++++
> >   2 files changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > index 576425898b09..5a7eb5579b01 100644
> > --- a/hw/i2c/aspeed_i2c.c
> > +++ b/hw/i2c/aspeed_i2c.c
> > @@ -104,6 +104,7 @@ static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBu=
s *bus, hwaddr offset,
> >       case A_I2CD_AC_TIMING2:
> >       case A_I2CD_INTR_CTRL:
> >       case A_I2CD_INTR_STS:
> > +    case A_I2CD_DEV_ADDR:
> >       case A_I2CD_POOL_CTRL:
> >       case A_I2CD_BYTE_BUF:
> >           /* Value is already set, don't do anything. */
> > @@ -741,8 +742,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *=
bus, hwaddr offset,
> >           }
> >           break;
> >       case A_I2CD_DEV_ADDR:
> > -        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
> > -                      __func__);
> > +        bus->regs[R_I2CD_DEV_ADDR] =3D value;
> >           break;
> >       case A_I2CD_POOL_CTRL:
> >           bus->regs[R_I2CD_POOL_CTRL] &=3D ~0xffffff;
> > @@ -1060,6 +1060,7 @@ static void aspeed_i2c_bus_reset(DeviceState *dev)
> >       s->regs[R_I2CD_INTR_CTRL] =3D 0;
> >       s->regs[R_I2CD_INTR_STS] =3D 0;
> > +    s->regs[R_I2CD_DEV_ADDR] =3D 0;
> >       s->regs[R_I2CD_CMD] =3D 0;
> >       s->regs[R_I2CD_BYTE_BUF] =3D 0;
> >       s->regs[R_I2CD_DMA_ADDR] =3D 0;
> > diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> > index 79c6779c6c1e..03fe829a3a57 100644
> > --- a/include/hw/i2c/aspeed_i2c.h
> > +++ b/include/hw/i2c/aspeed_i2c.h
> > @@ -297,6 +297,14 @@ static inline uint32_t aspeed_i2c_bus_cmd_offset(A=
speedI2CBus *bus)
> >       return R_I2CD_CMD;
> >   }
> > +static inline uint32_t aspeed_i2c_bus_dev_addr_offset(AspeedI2CBus *bu=
s)
>=20
> This routine seems unused.
>=20

It is, but I added it to align with other registers that are different
between old/new mode. But we can introduce it later if needed instead.

--xUXZVOhaG/wAgVc9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKYZ+kACgkQTeGvMW1P
DelgIgf/UDrzQW+oR/6TjzozyEgwMqeG6aIep7xlYzmuj3yX+XoZEVvxUysh26SP
MfmMcyl31R9abmaBiwJYAeh8d+pclN1ColGzDrViu+USZmKflltwIPBqGmQ5Z+Y6
HwR2s52Ia0HqjxkplQIU4dKO3jxtpTz1k+XNsyG/IF5Pi3puCy2kUxwCRTgXnQvu
LvgUYtzgnRcT6ySN8LBB2i7usyGji7L4QzO0g9NO9PGP389O7e/PBpSzGbxZBePD
t2a3Gb6SGfIvbz1D+0yfse2SNlqhP/+n+QNx2d1ZZxxk83W2oyWk9ZkZr7yrS2vo
5oYbiLt8fE8yhAon3R1UlLOrpLv1gw==
=btXE
-----END PGP SIGNATURE-----

--xUXZVOhaG/wAgVc9--

