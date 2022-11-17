Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469462D38F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 07:42:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovYaK-0001ya-Np; Thu, 17 Nov 2022 01:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovYa3-0001pg-DN; Thu, 17 Nov 2022 01:40:59 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovYa1-00040L-Ak; Thu, 17 Nov 2022 01:40:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 501AA5C00B3;
 Thu, 17 Nov 2022 01:40:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 17 Nov 2022 01:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668667254; x=1668753654; bh=/D
 jujLued+f4maFRExX9+Utna5WnVzy5qA8N8/BO7KE=; b=QbfaN3CebtT7qyoUEP
 xmX7f6cCxsnaNtL8ZzgtXajUVuE2qbzbtFY1nOL04GXGvYHRyoFcyr3eb0Tzp8uu
 p+spdr0rqWxMRjjZp5krL02wHrw21Wyhvd3uWM4Afboz0eYFz/tcMNKH7BfvblMp
 un0ggcSUwWZLzyFVXUwFsOUkEiTUJtLHIl/g/uj861zXH7EwQGZhd6FNKkPkAjhb
 jMz3tVCr+MBdsyfSr/ESWUUpAyUim/umMvcxVPBdMqPBh9kdZAp3oSHc0XDhKdAv
 BZmK1Gw/kppKMLIjvfU6dWdLAtVJDKqJwBiXygVEl5Yl0MW1dRmjqA53pypMPSfl
 oacw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668667254; x=1668753654; bh=/DjujLued+f4maFRExX9+Utna5Wn
 Vzy5qA8N8/BO7KE=; b=kk6u/381OtoYLcMTJnp7MYXAmvWKAElOAeW3LLEHlpN6
 QwIuUx3YYGVc6xVFtB8mDHSr82IuzbfNeQY1mToPyWGSKPO130vbd4fHqkxMgwov
 eMD/7bxyHdIHpF+DWgHXFUb/t6BoUr1M7VhOtACWBadckJn2axwlru6WSQCZLZyF
 exO3Gjdl7Vab4kr9pwUn6d+Zg8dJNNuDvR4Z4E9U54mgmtcwUboBtmRDOC4lw1RK
 4YJjKLw8Eac01oVRIDKwWqoUfDBq+Vr0fG85O9U4EWmBoAjOVM/VlpX7mkkzQAPU
 +Bcd3jSJiixEkHPS14FWKInQYFFKqA4WTcoK4RWGjw==
X-ME-Sender: <xms:ddd1Y-XPalsu6-5Lv7tabSKMQOGBTM-3Ppn6V_p0Upf9wWsePIji6w>
 <xme:ddd1Y6leVGi_wOTo8ryWb4C0QPDNYmkA78bFtxEWWTa8WiGmMxo-vxvDk0tBTJUaT
 G5S-qP7ujv8c4c9VDU>
X-ME-Received: <xmr:ddd1YyZ8JAIfH054Ub5Jv-2v8WREmTKpjrtKst-1c-d2_ZWNXLTriV2QTUMEISgkQPsyOWaGty4rsVy1Gbuop0hegIZe2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ddd1Y1Vs_lxP9DEzoktVwgGdtdEmiyZBO_VXKk0_f9GAtCvr5DLHgw>
 <xmx:ddd1Y4lCSP6wjy-B5npZtMyKgpCU5X1vM5FvBHNsgNB7SMNyiSs4ZA>
 <xmx:ddd1Y6cGvtUM1wl39RBurEz20qRsf6M9TEJbWFjEEYrbmuJUxZH3nw>
 <xmx:dtd1YycRj6MHemh66muOCT8n4RTybUXoSTROm5OI-TY7ZiN-E8h5Qg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 01:40:51 -0500 (EST)
Date: Thu, 17 Nov 2022 07:40:49 +0100
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
Message-ID: <Y3XXcWUnntBrIXq+@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
 <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f1BjjTwSyNKKJ47c"
Content-Disposition: inline
In-Reply-To: <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
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


--f1BjjTwSyNKKJ47c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 16:58, C=C3=A9dric Le Goater wrote:
> On 11/16/22 09:43, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > It is not given that the current master will release the bus after a
> > transfer ends. Only schedule a pending master if the bus is idle.
> >=20
> > Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/i2c/aspeed_i2c.c  |  2 ++
> >   hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
> >   include/hw/i2c/i2c.h |  2 ++
> >   3 files changed, 26 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > index c166fd20fa11..1f071a3811f7 100644
> > --- a/hw/i2c/aspeed_i2c.c
> > +++ b/hw/i2c/aspeed_i2c.c
> > @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus =
*bus, uint64_t value)
> >           }
> >           SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
> >           aspeed_i2c_set_state(bus, I2CD_IDLE);
> > +
> > +        i2c_schedule_pending_master(bus->bus);
>=20
> Shouldn't it be i2c_bus_release() ?
>=20

The reason for having both i2c_bus_release() and
i2c_schedule_pending_master() is that i2c_bus_release() sort of pairs
with i2c_bus_master(). They either set or clear the bus->bh member.

In the current design, the controller (in this case the Aspeed I2C) is
an "implicit" master (it does not have a bottom half driving it), so
there is no bus->bh to clear.

I should (and will) write some documentation on the asynchronous API.

--f1BjjTwSyNKKJ47c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN113EACgkQTeGvMW1P
Dekvmwf8CGDgu6+G8P4qeT5FE/bIzJVOMN/W2rpeJNHNdbAOCdhsBUqXieaLnk0g
hzSwwow1nU+uxHRiasM9xoLxPydfP+jyQT8+4Fv546CFq7mi59375DOnqM7AzeRg
KJeAdUnwhFCvDP+dYUnkJp4L2AptxPfS7RpntV0+9C46Te4aW4E+aDdjSHGXyjr2
C5KjPbPiImhk+hUaNOenDYqjaifu1zrnJ5xSwey26SgjDinErr7wEE+FgdpmIn3I
eZKNILEV5Wek5qY3pxcIfmMD5sJxkXye9IB/vBO59zbf4oQ/eJJtfb22Yp/nDzaE
+hqQ8MdItGEMyID/iwBmsK0XnX0OFQ==
=viUC
-----END PGP SIGNATURE-----

--f1BjjTwSyNKKJ47c--

