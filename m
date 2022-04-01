Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2AE4EE8A0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 08:48:43 +0200 (CEST)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naB5O-00008w-Da
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 02:48:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1naAnk-0002Ja-KC; Fri, 01 Apr 2022 02:30:28 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1naAnd-0007zT-Of; Fri, 01 Apr 2022 02:30:25 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DF888320157F;
 Fri,  1 Apr 2022 02:30:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 01 Apr 2022 02:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=s3bri+p69zltGR13PH7UqZKDLtvn9O
 +xBdEbwA8YHVY=; b=jtd2OJj5bQDvmaOm9k+K+1UV3NPysmS9vqDbJSj8b4u6pJ
 wVN1SF6zD/G3s/zpIOauSIQV8AFKEelXrgJBzaWvW2/UNTU+qgautgmlnXo8uC4x
 chVgKGuDJaEQKa3rkKqs29qfbH8Ls637RY0LbEKIgnxtsB6gcuwNvwK3fjEhiSBb
 qrh65JsWbhghGjy1HyjN/ufCNrOrbgA9Q42PYrlmZqbGwjVj7UraRFuZ87PMS2Mo
 h1hs5kMHItCm2PhKg6AjBPoxyEEcqvGRLVr3T/t5RQ39UPWBrN6Vp41u66mjAvJx
 6/oHiMGXiNO1XEw/P8ZcYJAF/IgttIz6E2XYFzZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=s3bri+p69zltGR13P
 H7UqZKDLtvn9O+xBdEbwA8YHVY=; b=LYTrF9CsQ7hNU73t2mZuSCuv2N7/p95qq
 jcczWGONMv56w+NYPYNEBa3zF/uRWfcah9SrbPzzcuQOrj67TTGKEwM+KZ9yaFAA
 aUnMnN6dbRWNdN2YklC0DbUW4swW1dgrjHZ0p+aSMmIK153xPYgyhapDfU3wpckK
 pa1pUbgGVoZKQw07X3nEub6Edo9k4ePSpEC3Y46jhJcLD3BEjcPZ6mz8GMunZcIT
 o/pjHlsNTBGzu56rcy2kzBet4bWuWGIO7zM5KPdEKzWr2HVJSyWwQACiE6BiL8zH
 jB67p/ThjZ0BIC0M03MCsU0vxdmRz6qYWOs6NwZQIVemwzSWErJgA==
X-ME-Sender: <xms:-ZtGYpcXqCYYZyXPxvTIbXVZ46F2FpRaXRk9tgyYvExs4YYcc_YJ9Q>
 <xme:-ZtGYnPR7XMFRJYckut4kWoToYzJYOM_vpHSRfycNhN55x6WQlSoNYaukqng26Eqa
 LdIg-Ria57Ofu-P_34>
X-ME-Received: <xmr:-ZtGYijY080xJg1laesY-QxqrsqhV-YlCVukRx8CG4T5mOEomGZS8GUz8IGgGvyzPeBeIP5sdgVvLvxB8js>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeihedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-ZtGYi9lKjEKIgppYYgAWAFDyEpifBep_qGdv3kxxj3fSzdq_McxQw>
 <xmx:-ZtGYlsTjUu-F5PObwgk9hOg8uT8-aoglW-qeY4ZC5AXnX1bH1qFrQ>
 <xmx:-ZtGYhGcPy3qQlwtZprpIZUibBdAsqgPrxksmfdZjxQvw0KFUd1mBQ>
 <xmx:-ptGYuGBxvOEwn_XfKnugOTTgkpa3dNgj3W4i9hMx24WRw2aUj_lDw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 02:30:15 -0400 (EDT)
Date: Fri, 1 Apr 2022 08:30:14 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH 3/4] hw/i2c: add slave mode for aspeed_i2c
Message-ID: <Ykab9mR/B79iI916@apples>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331165737.1073520-4-its@irrelevant.dk>
 <7300ef1f-8702-733d-2a50-4253345fde45@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pruGYCmDnY7ETRGO"
Content-Disposition: inline
In-Reply-To: <7300ef1f-8702-733d-2a50-4253345fde45@gmail.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Jeremy Kerr <jk@ozlabs.org>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pruGYCmDnY7ETRGO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 31 22:44, Philippe Mathieu-Daud=C3=A9 wrote:
> On 31/3/22 18:57, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add slave mode functionality for the Aspeed I2C controller. This is
> > implemented by creating an Aspeed I2C Slave device that attaches to the
> > bus.
> >=20
> > This i2c slave device only implements the asynchronous version of
> > i2c_send() and the event callback.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/i2c/aspeed_i2c.c         | 95 +++++++++++++++++++++++++++++++++----
> >   hw/i2c/trace-events         |  2 +-
> >   hw/misc/meson.build         |  2 +
> >   include/hw/i2c/aspeed_i2c.h |  8 ++++
> >   4 files changed, 97 insertions(+), 10 deletions(-)
>=20
> > @@ -558,14 +565,19 @@ static void aspeed_i2c_bus_write(void *opaque, hw=
addr offset,
> >               bus->controller->intr_status &=3D ~(1 << bus->id);
> >               qemu_irq_lower(aic->bus_get_irq(bus));
> >           }
> > -        if (handle_rx && (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_=
LAST))) {
> > -            aspeed_i2c_handle_rx_cmd(bus);
> > -            aspeed_i2c_bus_raise_interrupt(bus);
> > +
> > +        if (handle_rx) {
> > +            if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
> > +                aspeed_i2c_handle_rx_cmd(bus);
> > +                aspeed_i2c_bus_raise_interrupt(bus);
>=20
> Eventually split this hunk into a separate patch to have better readabili=
ty.
>=20

Alright.

> > +            }
> >           }
>=20
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 6fb69612e064..c1c1abea41dd 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -122,6 +122,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: f=
iles('nrf51_rng.c'))
> >   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pn=
p.c'))
> > +softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
>=20
> This change belongs to the next patch.

Woops. Chopping up my changes went a bit too fast I think :)

--pruGYCmDnY7ETRGO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJGm/QACgkQTeGvMW1P
Dem5AAf/Wd7I4SNrU1OwQ6OD4n96+ClYUcHhSWkSUH95HykyvTiXTz+fk0Goq0RA
WoY9v35SU21YEk3WmbFRiv0BMWUIt+VaSZ27fAfJsdCfjtMCJdgbRQlKzIhZ7s2y
iPA5ATkbY/eXz+Vai0lJcUWqganIfTC8Iy0wQLftbgM/YLaVcSQZlSXLzev18tJ6
2jpT7b/i69jVlgJ/6coNm5q69NrO6PYVPKk0zwGsT8sqZAcqdXlLAocw7/UyWmOY
b0EBkC0Iygsup2LypkGrxug3RvNpGXziDaU8RwvrS2XqVCw8QavYdP51N3VeF+7b
1GY/LH+Bq/QJpCFzlGh2GJtmHftyEg==
=H1lK
-----END PGP SIGNATURE-----

--pruGYCmDnY7ETRGO--

