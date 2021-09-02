Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BA13FF07A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:48:34 +0200 (CEST)
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLox7-0006Ca-EU
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1mLova-00043P-1k; Thu, 02 Sep 2021 11:46:58 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1mLovV-0000iL-3X; Thu, 02 Sep 2021 11:46:57 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2144D320090E;
 Thu,  2 Sep 2021 11:46:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 02 Sep 2021 11:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=gmI7uD1T5cln+C3tDRgJCFvkKa7
 ccLDZSlf0cbMI3qE=; b=TmfakpHbtIn5UlczoIj7A7J+Mje3VfMjVEzE1AkAx6P
 Ucn4+NZ/Qd74yNWbQ2ghpEQOiGjAb3jvfXRgZOwhqFecWFI357fFY+k1i+/giaqg
 zGkNY/3EOjkLH9a9naeluPmFENlKOL/Y1ePhs6ilO/edDYhkuA1E6w6vQbo7hUPV
 2Ae66gXsPos2r99skMkretU4nX79tDiiDUYRMJty0+lfrPzEwkJCh3zQPdZXKo/7
 RcJu8OXSJhbR7DA9ia9omvjCFTT5+AFGf/d/ddN4V7LlVI69M8GSCyC5VAwzJQ0g
 YRTZQ12caMDn7tKdusIYLFe4YvAIIDM/kCaGSZT5C2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gmI7uD
 1T5cln+C3tDRgJCFvkKa7ccLDZSlf0cbMI3qE=; b=fMBgwdpUcwxzmgVKz2WFUS
 JiKihVQ57cONTB30pPwLzLQe1VjtP9Hvo34EYeqqmUxmMf6ap4zhQ3Zrj0MvBtqz
 2LYp/n5ImfnRHkTbXgZOmzHf5Ty7Fv4WzDx7iowx3dvU4WquUYl23hlh4dGIobIh
 LY+49eDm4J6VCpLNCL6TneOkmhn1EDpnCByvqPLoVBqkJqFASEJF5i/oWYrVqqqD
 kSwS8kjfZfcj6SN7RPCKJXU8ORjNVNG0sHOj5K9xFxlPlrxC6W39BWmL3SwGQxX4
 RZn5dcTgPziGCfxfDjSX9u/HPU3OgjVEcx5RYCJLgpI5/yVjAzgTZECumpY4+Hkw
 ==
X-ME-Sender: <xms:5_EwYZCoC2VGTAt8TMgAkzKdGqxMoIZau-vI6Ij0_ogT6zq7ophmRw>
 <xme:5_EwYXhBHgwEKecC8zDkIh3_EhnWEiJuPDgihtJGj4IKNnh_i3gEJQTxvnbL3RH0G
 1mvLRp8Ee7Kfd4KRr8>
X-ME-Received: <xmr:5_EwYUkItLk_PZbW5diOZQebb2a3ItUDs4APeBw1keEgwhjmPTzW8eXOCrop-LGP2wIIbRSRy6-WDWwnxIkwBUIpNJ-7iC1Zki4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkedvheduveekhfeuvdettefhfeel
 hfdvheeigfdugedvgffgteffveektedugedunecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:5_EwYTyJSAdZUFE25l0GbL47xUyUIJGufyhDb93Alafa2UXVU0SYvg>
 <xmx:5_EwYeQawgy2H3t3x7hgkY9YTHuHTxFAs5vF_NrhWOxM4Cxgc2syhQ>
 <xmx:5_EwYWbn5NXZsVDKYL7NfRDwi7jxH3BjA3wYeWpKLrsWMraw7O7Fmg>
 <xmx:6PEwYdFR9MuUCvjD9WcetMpI-6zLGP_Jo9H7UrxAHsRkXUsD_NwThg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 11:46:47 -0400 (EDT)
Date: Thu, 2 Sep 2021 10:46:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add Fuji machine type
Message-ID: <YTDx5fyuHmylObg8@heinlein>
References: <20210901225946.500125-1-pdel@fb.com>
 <60994ebb-d345-cc40-020e-2c14ed438097@kaod.org>
 <0B35613A-4001-4E31-A522-ECF827CF1F8E@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UKoYqOT1BrAKQ9oq"
Content-Disposition: inline
In-Reply-To: <0B35613A-4001-4E31-A522-ECF827CF1F8E@fb.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=patrick@stwcx.xyz;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, PDS_OTHER_BAD_TLD=2, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UKoYqOT1BrAKQ9oq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 03:12:12PM +0000, Peter Delevoryas wrote:
>=20
> > On Sep 2, 2021, at 1:12 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> > Are we sure the flash models fit what the machine expects ?
>=20
> Oh, I see, I=E2=80=99m not exactly sure which device is being used
> but it should be one using the m25p80 command set, and after
> switching to one of those devices (e.g. mx66l1g45g) it works:
>=20
> [   54.867027] Creating 6 MTD partitions on "spi0.0":
> [   54.867506] 0x000000000000-0x0000000e0000 : "u-boot"
> [   54.873929] 0x0000000e0000-0x0000000f0000 : "env"
> [   54.876546] 0x0000000f0000-0x000000100000 : "meta"
> [   54.878948] 0x000000100000-0x000007800000 : "fit"
> [   54.881290] 0x000007800000-0x000008000000 : "data0"
> [   54.883965] 0x000000000000-0x000008000000 : "flash0"

It appears that machine uses the 128MB flash layout dtsi file:
    https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/faceboo=
k-bmc-flash-layout-128.dtsi

I think that means it would be safe to use the same mx66l1g45g that Sonorap=
ass
is using in the Fuji config.  Likely we're either using that exact chip or
something 100% compatible with it.

> >=20
> >  [   41.314338] 6 fixed-partitions partitions found on MTD device spi0.0
> >  [   41.314600] Creating 6 MTD partitions on "spi0.0":
> >  [   41.314957] 0x000000000000-0x0000000e0000 : "u-boot"
> >  [   41.318355] 0x0000000e0000-0x0000000f0000 : "env"
> >  [   41.319747] 0x0000000f0000-0x000000100000 : "meta"
> >  [   41.321064] 0x000000100000-0x000007800000 : "fit"
> >  [   41.321247] mtd: partition "fit" extends beyond the end of device "=
spi0.0" -- size truncated to 0x3f00000
> >  [   41.322684] 0x000007800000-0x000008000000 : "data0"
> >  [   41.322827] mtd: partition "data0" is out of reach -- disabled
> >  [   41.324110] 0x000000000000-0x000008000000 : "flash0"
> >  [   41.324253] mtd: partition "flash0" extends beyond the end of devic=
e "spi0.0" -- size truncated to 0x4000000
> >=20
> > More info in the log below.
> >=20
> >=20
> > Could we also define the list of expected I2C devices of the machine ?=
=20
>=20
> Yeah sure! I=E2=80=99ll follow up with that.
>=20

The fuji DTS is available upstream:
    https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-=
bmc-facebook-fuji.dts

I found that when I did Sonora Pass there were a number of unsupported i2c
devices (ie. devices without QEMU models) but most of them were behind muxe=
s,
which are similarly non-supported.  You'll see a pretty large fan-out in th=
e i2c
busses of that DTS.  I don't see anything obvious in the DTS that is direct=
ly
connected except for the muxes.

--=20
Patrick Williams

--UKoYqOT1BrAKQ9oq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEw8eMACgkQqwNHzC0A
wRl/KA/+JREIsgImsxxpk3SFGIqb+8bYrGjrUvfvFXhA7u7lbjy/6dN6L3ZxgVzh
ogC6GZzAiVlsNX+Ogg1knlHBBP3v7gKoH1R3sOldIKtJ3VvX1o4nswMCe/y0YVss
OVbajSS4UfivguiKl/Zey9Yhgqr9vHr34BgevHavjuhjGcIXR77pbCUTIvjG+du+
+rxNa3xFFAZ7aKIKHRAcIdRXv+j9oifAVKR+zU98FiDSQ95wibH0EfgI21GkBiW0
06RValgiHL2WWBIdOF7LI5q77gTeDT9bcCJgUmH2GhEjx/Qcid5t2ygGeyvxZTDx
IBBI0Pfsz2HCmVFYm9X4xBMevepcfmG8I/4/6OR4DDtbroeWHq9Edtr7A7oqb/dj
nB3V+xT3p2z4075uUziBtqVQPWOpYzbGFX/dwUu0hYqnIi0xnFhaFJH6X7BZN/CW
hy9fCWmSc8ybj0z2ZKjSsJm3NzwmhPIrHiV6Njys88hNfAg6byT344ukyEw+ohSv
OqLVkjj1mg7RG2xZVyIMPjVkNUi9XWeRrP0UmxVSYJx2ZVDN4ty8grsP/QfpszeI
RGybZ6M34SdFdNcrGsqhRVWi0C1G0eOzk1YedOfyahpOL5S3Mawg0EUtgT91dO7O
iI3/gIFhndxvFLnLro8QID26G+pWAGLuLUH0yvuWsIfy6p9bYdc=
=OOAy
-----END PGP SIGNATURE-----

--UKoYqOT1BrAKQ9oq--

