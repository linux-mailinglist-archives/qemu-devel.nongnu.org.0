Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB05851C0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 16:43:36 +0200 (CEST)
Received: from localhost ([::1]:52082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRDD-0004zu-61
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 10:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1oHRBE-0000te-St; Fri, 29 Jul 2022 10:41:32 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1oHRBD-0000WH-A2; Fri, 29 Jul 2022 10:41:32 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A1E85C0058;
 Fri, 29 Jul 2022 10:41:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 10:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1659105690; x=1659192090; bh=oOFL5HOHH8
 Br6v1A6zEzjvrIsMcHqaRWyGFHEuoRzlU=; b=hA79VGRFSGeLQlefrrKbk29QyA
 zd4amETq1Kdab0/9fEv7wrnUav+J2kSUCX7JNxGOJSDEsTNPXswWjm2ZLfyygMLB
 gs4iQV4OifCu4tS0hR2DYKAno3sDkFp42wGvYBMsPpqhKx9S/CHWgIyOZSKvgEOm
 wCSNP/dEw5fiRCF86f9wjAattV6IG3n0ZE5fRoGONzt+WL4WQJRWktnMu1XFuwYG
 YM96KcyNE7XocBxX6tY+1TCR77eW3dYF+zsV15dBeUXfGlZOgFzNGQTsWzRLP6kw
 I1vjPkS8k2ed5kstbbF4Lqj+H4mXBaM4nIGeiXNyeY7PEenQVp5EWB0w35KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659105690; x=1659192090; bh=oOFL5HOHH8Br6v1A6zEzjvrIsMcH
 qaRWyGFHEuoRzlU=; b=fYTeD3y0o7+nACRAEBRPH1E47dNmGHMT28uOT9XYtuB1
 LEUEcbSUM7wbak/HAan1QbrTJpnjhZcUEnzLc17nrBaGkkIY4sUo22P+Iq8HMP++
 l6v7lAKWHRKPp14C4Ym+deMx+E5my8GTZD76Y1b9zCM3SJUw0edmvLcAVHLaQK3O
 HtB2T9hkd1emvx1O6IWZJ/jeaZAVHuuU6L/Hq5Skcc7pUE8xGqHZ7qPb+xaVqu9M
 jLhb5T2GJezH13/id7Y2A7o4evZD8HDUNkhCR9O11cmSJvzxMbqQlKEuF1Z0TREx
 UHiHW5fEQslpwLDcygRIEFOmCVc+zUGgOuMS+NVc3A==
X-ME-Sender: <xms:mfHjYiDQo0tDjAi5W2zzW0WFDQXcwh77H7v8MJaMDH3_8o-esEtMaQ>
 <xme:mfHjYsh5MkcA2f9T0tmFe82qo7jI4FNm8SxaRBSaLb4aL4cbHhbhe-JZ0rze_cf0R
 J4z1Q2bny4JFMlhmpc>
X-ME-Received: <xmr:mfHjYlnip1VuedW5kKOF2W5TcFR0XghIRa0kfp9kfqabjaPskOUN6HiIVsBs6LCjBynqHOALzi3Aj80nITs8YVgBWdJW2E-L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpefrrghtrhhitghkucghihhl
 lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
 hnpedtjeejgfdugefhtedvudfghfejfeejfefhffeffeelgeduveejleelffefvdffleen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
 hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:mfHjYgzCxmqM1k4eOEYxrbfVgzPa_pp0h4Vx0pgfp9zHpTCtvb2Thg>
 <xmx:mfHjYnQrS5DhxcO_zAWg3r0xtne4k20Yyh0YpVWtEIx-5dMgGtrfbg>
 <xmx:mfHjYrZU4iDELHMbE-xQECihsCOpRy4BZH_XbUGVybzC_7J8HRJ98g>
 <xmx:mvHjYohOvStgXGRXNessNMcGNPs-I2jscAwdCnPZsVjsAMr7_EPI2A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 10:41:29 -0400 (EDT)
Date: Fri, 29 Jul 2022 09:41:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Iris Chen <irischenlj@fb.com>, peter@pjd.dev, pdel@fb.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alistair@alistair23.me,
 kwolf@redhat.com, hreitz@redhat.com, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, qemu-block@nongnu.org,
 dz4list@gmail.com
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Message-ID: <YuPxmO63cE13Lgjd@heinlein.stwcx.org.github.beta.tailscale.net>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0iO6xrwk87ZolTFE"
Content-Disposition: inline
In-Reply-To: <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=patrick@stwcx.xyz;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


--0iO6xrwk87ZolTFE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 03:25:55PM +0200, C=E9dric Le Goater wrote:
> Hello Iris,
>=20
> On 7/29/22 01:23, Iris Chen wrote:

> > MOSI pin in spi_gpio: the mosi pin is not included and we poll the real=
time value
> > of the gpio for input bits to prevent bugs with caching the mosi value.=
 It was discovered
> > during testing that when using the mosi pin as the input pin, the mosi =
value was not
> > being updated due to a kernel and aspeed_gpio model optimization.=20
>=20
> ah. We need help from Andrew ! the model should have a mosi pin .

This discussion about SMC reminded me of something that might be leading
to the issues we're seeing.  Our hardware implementation uses the same
GPIOs as one of the SMCs and doesn't use the SMC.  It could be that both
QEMU models (the SPI-GPIO and the SMC) are trying to grab the same
GPIOs.

--=20
Patrick Williams

--0iO6xrwk87ZolTFE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLj8ZgACgkQqwNHzC0A
wRkZvhAAgScFLj//BkHVTPNmqSHKmkJWkyxuN+0+1hESlu7L5S9ud+VncLTbDscT
D+MrqHXBPNzca8qc2wSgGVkqBw7f+HyC59+L0GbiDcJIBbA+RsL4H3sw/9mR4tD4
1bEiuCAsPhSxfntoaIIsSHe9nbXcT38fakKcHQIHBkgKhcerSAbjwQl8nUgLBBYD
LyfeEB00JdRD2t5CV6/SpuYo2xtTihp7Vl+SVzqRhJHuaznj+2eRy+967vTqSJVU
P4jV31xOqilnJgWmlgAz5HEwR3GsVZ8RSWhCmnE7J5hui7M/eVAMQxGPjiQUSvE6
q7uMpDkYVq4rcirXhhImAoa7I2xP0WhxboJxxe+uvaX0vx5LOZ44JrVxqh+FT7wD
7oNu/egJbbwfbERmvaJsUU4hXRh6faVXTm9mjNQgHjeIGttCi/Jnvq8WBeR6fYI5
4iHf4Vw3EJNL/sT67fsA0gf8b0CzKCA37otbe9O8/nlKY0Gi6gwoD41lpa9HYm34
jVq/ZyXIgdJ2pduGFTSe8C6q2OfnGlqvjietM0tfIKprKgXd8ymjYwyr+XtODCnd
rP3a99Z7EwM3zSQ4l0wL0Xxi81BoJe0BY1OkYUoJTG1vZuQPYft3VNsxoeGumikT
UCzNNQiQMuIZI7VirbEQ8q6Fu3YT8IK/62TVEeg9b/oCYOan8tc=
=M/ZB
-----END PGP SIGNATURE-----

--0iO6xrwk87ZolTFE--

