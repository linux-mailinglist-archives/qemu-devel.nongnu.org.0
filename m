Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DB162D43A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 08:39:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovZSs-0001IW-TH; Thu, 17 Nov 2022 02:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovZSo-0001HN-8Y; Thu, 17 Nov 2022 02:37:34 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovZSm-0007j8-59; Thu, 17 Nov 2022 02:37:34 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 88B115C02D2;
 Thu, 17 Nov 2022 02:37:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 02:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668670650; x=1668757050; bh=89
 1SjVv0/f5vxwmIG406zhFqC14wW+Cyk4cKtiURAcM=; b=YrpY+NGFwUGWLAOqJp
 C1EK8xbSHUn5O7WKHBd2AuafZaj0/NhbeySdwlVGmi1LlKqo+mU3RQpi2BMRwAF2
 AqLpSZIBJEViTic4sM4BKuRYkGj1e/roTWVQ8oTJVUadky+eVM2PGNk0GuqAkgOY
 lrqr9q7LED5Mis5JOVB8ld57tyTlADemGy28EQVInRSsV/t439uoLlsnX1MjXEpN
 g825wbZbd8UKqkwTmh6rBrELIRmw8VabCfYTVf0K4U8tXocsJhc0OfNB/SEHXbz4
 h2CKlDIHCe4QtEyntejRRivOgDICE2Q9+PuISqpR7k3l48zgMbz+8alAtka0Ui3Q
 UMOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668670650; x=1668757050; bh=891SjVv0/f5vxwmIG406zhFqC14w
 W+Cyk4cKtiURAcM=; b=nGdZyTA0RkNfAWHcLQIYpB0NGCfoVHTCBMNCGLucm55Y
 GOzUxbUius4IJ7eUTW7Y0UHYhPrGkDaINgPNWIbjVWH0FYPl2I+LGZl6h5elkRBS
 CZRYIB+tQlr+Eolrn/fHf+fGXdIIPyIskF1xcIct7EObEHB0vfwLlzSdR2S/H/EN
 iMBNkjzQFpewiDAol5/gzJWxnu+jgqU/5zVoC6cnPlo2007QcefzCQwaS5da5qqe
 /8RnkYcG1DjyLpNE311xtvFoXnZxuf6bXS4UnKANv9AlrOLiyXLliUdlTjLPL5+A
 cHcPnqIbRe4BOGnAR/2hctwbJ/bRnIXWmR0XhP17ng==
X-ME-Sender: <xms:ueR1Y4pZr45ArH9yDu3455OKP4IntkH_nJzR45b9vHDDHOdcKkOsZg>
 <xme:ueR1Y-o3ScqgLSFtJPTMhvLGpL6-SfX-h5tnOVrzJX05-soNmpnCaNBtMe7UUl7GQ
 gALNr-XVvPfpALBikQ>
X-ME-Received: <xmr:ueR1Y9NigViKTyW7p_7iW5DrJ_R83Qa7Esfovfi0ehoknIHVd0HuCeke9lKfdQDQ4l39qAvaJZkpxo_Dk6VeJiCCQPdtQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ueR1Y_4RSEckmNSYu_JReRQZ30HsVSM9NTeXx67daeXKzhfF2LmAgQ>
 <xmx:ueR1Y36hRTBFGsfpDkzScDqETIfZ4OwqOyN7m1vDx46IaIPRB1MAMA>
 <xmx:ueR1Y_iSy8HkBrI8bFCwlHUOlwUZ3dVGic369gIOwJZDhvnZfONIzw>
 <xmx:uuR1Y7hTzKLYEnQ-mmYwxxB5XgtPekediVGOTM5U733kwQu6S63H0g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 02:37:27 -0500 (EST)
Date: Thu, 17 Nov 2022 08:37:26 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
Message-ID: <Y3Xktt8b85RvJ89A@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
 <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
 <Y3XXcWUnntBrIXq+@cormorant.local>
 <6bfe7b2e-2e4f-c286-530a-b0342f9107a0@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="O22X86+JsKrlo8Eb"
Content-Disposition: inline
In-Reply-To: <6bfe7b2e-2e4f-c286-530a-b0342f9107a0@kaod.org>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--O22X86+JsKrlo8Eb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17 07:56, C=C3=A9dric Le Goater wrote:
> On 11/17/22 07:40, Klaus Jensen wrote:
> > On Nov 16 16:58, C=C3=A9dric Le Goater wrote:
> > > On 11/16/22 09:43, Klaus Jensen wrote:
> > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > >=20
> > > > It is not given that the current master will release the bus after a
> > > > transfer ends. Only schedule a pending master if the bus is idle.
> > > >=20
> > > > Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > > ---
> > > >    hw/i2c/aspeed_i2c.c  |  2 ++
> > > >    hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
> > > >    include/hw/i2c/i2c.h |  2 ++
> > > >    3 files changed, 26 insertions(+), 15 deletions(-)
> > > >=20
> > > > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > > > index c166fd20fa11..1f071a3811f7 100644
> > > > --- a/hw/i2c/aspeed_i2c.c
> > > > +++ b/hw/i2c/aspeed_i2c.c
> > > > @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2C=
Bus *bus, uint64_t value)
> > > >            }
> > > >            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, =
0);
> > > >            aspeed_i2c_set_state(bus, I2CD_IDLE);
> > > > +
> > > > +        i2c_schedule_pending_master(bus->bus);
> > >=20
> > > Shouldn't it be i2c_bus_release() ?
> > >=20
> >=20
> > The reason for having both i2c_bus_release() and
> > i2c_schedule_pending_master() is that i2c_bus_release() sort of pairs
> > with i2c_bus_master(). They either set or clear the bus->bh member.
> >=20
> > In the current design, the controller (in this case the Aspeed I2C) is
> > an "implicit" master (it does not have a bottom half driving it), so
> > there is no bus->bh to clear.
> >=20
> > I should (and will) write some documentation on the asynchronous API.
>=20
> I found the routine names confusing. Thanks for the clarification.
>=20
> Maybe we could do this rename  :
>=20
>   i2c_bus_release()             -> i2c_bus_release_and_clear()
>   i2c_schedule_pending_master() -> i2c_bus_release()
>=20
> and keep i2c_schedule_pending_master() internal the I2C core subsystem.
>=20

How about renaming i2c_bus_master to i2c_bus_acquire() such that it
pairs with i2c_bus_release().

And then add an i2c_bus_yield() to be used by the controller? I think we
should be able to assert in i2c_bus_yield() that bus->bh is NULL. But
I'll take a closer look at that.

--O22X86+JsKrlo8Eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN15LYACgkQTeGvMW1P
DemWVQf1H8EPM1jJeL1GjMLKuTuHo+FyVgRc6ED7Os4iGvg3A27BI85bvrpG5Vc9
JnlQKRiMvxdT+ekwsyE/PPU4wTJ3gikmoipsER+WZw+3jGtrG1MqDKGQaq9v2UyG
oi6osjz2x/NGLmY5oXvRC2fQ39LaqPWASPeXS0BuXnH2YqOoGLRFKzbCE/ysU4Bx
par92B9t8LckDnKObIhvHTIBzJoBLHF2mYCpaoXOxN1iRGkuALE/qyay449eYWVZ
m/HFOtvMY1AVZMjoqxmqyoEj/SBC0oF+4VYXgR/dnzkMkCirv6OnhOX6LHmHd8GR
AqhtyMGjTOfUVlp8qi6zGT2Ehfrz
=w1bz
-----END PGP SIGNATURE-----

--O22X86+JsKrlo8Eb--

