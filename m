Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBE43FD174
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:42:07 +0200 (CEST)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGCU-0005GD-Km
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1mLG1k-00070k-6D; Tue, 31 Aug 2021 22:31:00 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1mLG1d-0003ys-QV; Tue, 31 Aug 2021 22:30:59 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 50A8E5C0275;
 Tue, 31 Aug 2021 22:30:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 31 Aug 2021 22:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=LyV4J0d7vciEnuqemN67Hut3I9e
 4RiMw98AR9CeuZ0E=; b=q9WZzDEbkR4TtxubH9CvyxvYG0IfXCU3ExvmBV793Cz
 rEFBKX/Ph4dKPmfnv3PN8oCuyAf1Te+eyeVmFRls8735/LEaNc/U8sb+IIJSgNcR
 i9tlt35zljNXWUENg4WFEF8Ryxwo9YJ/a7blJtXEpTDYH0uu4Nmg6+zr5D04pxGV
 DlzojhBPoxVO5W92UbHdcIq2ITz8jYRiOtJXnuZUHAgSEkioADoGbD7Y9cydIsqp
 TskTNR5lTze7yN/FyFqoCqEInDNbPGxhBVSYA/c1HEkTliCGeF7MvqOXuigJlRlf
 wh8VTWB0f+syW9cf8MM4yRCukvcaOOOmsFIDXDXuJ7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LyV4J0
 d7vciEnuqemN67Hut3I9e4RiMw98AR9CeuZ0E=; b=SnoVnjAtVV1OL7IsvHpoBf
 NjFuG1aFcrDVyJWjH+xvlwLYhebXPnjMkfsWox+YnKt41N7YVvUdBbbH2/vDAGD+
 zVgeEL2s3tA6/dMZ7vC9mTCqwn6YZ+3p77T5ZRyd9GlQ9CX17roV6JL61Gp69gfv
 IFQ8TeMm+3mZSlhlQAJgtsgLqwcvrXJRfqmIchpIRn0/wItak2uFF4boO9z5hw3u
 eC95oONt8EtyRUKst3pXQ5/b6GM4gX+TvwhA3/KdTltynqgB1apRjYjfkAKKbyBk
 TRl7/e51HQUbnJZh010iUI3546T6XX5n2uE5H6HlJVSMag7UyKFvaxBLT8bSkWug
 ==
X-ME-Sender: <xms:1-UuYZpPWZ5UwL2wHTIsPU3XQrH1KyPM0h5Likk7qTHP1Uoyse9PsA>
 <xme:1-UuYbpced_Yg1vjnDrb1Aw7jB0oFSleQW3LyyjFJNVDFcW7MDCNoCJyIHo739odD
 CL03G2tEvLoo6Nvc_c>
X-ME-Received: <xmr:1-UuYWPv0-7Xyuy9dsxNzmMWALZEKKwU4U4CfZLkDRXm5Y97VzAd72DBvS7g44tKkh4KszqcmPEkbdiksTptOWU_bjMcBFI6Y3ptQm_VTP5Wkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:1-UuYU5Ld-c-m6Tga24gm1MFyAKR9-jut_DRdSosTodI-R7_NxxMvw>
 <xmx:1-UuYY7ongdmc0YlMdBpR0kNvhv2QSnMrLtMbmHrihWtVUQP6a7tGQ>
 <xmx:1-UuYcg0ZwuyI7FkSlgjcmnoKzf1B7erlWpNUzWF48sXWFgrGSO7_Q>
 <xmx:2eUuYT2xu8ZKTr5FeJbyuC4BopzhS2XKMcbLD_LN8U2tOAnYEUdyBg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Aug 2021 22:30:47 -0400 (EDT)
Date: Tue, 31 Aug 2021 21:30:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: pdel@fb.com
Subject: Re: [PATCH 1/1] hw/arm/aspeed: Allow machine to set serial_hd(0)
Message-ID: <YS7l1cnWySwaUwfr@heinlein>
References: <20210831233140.2659116-1-pdel@fb.com>
 <20210831233140.2659116-2-pdel@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C6Lm7KwueyVOnR8v"
Content-Disposition: inline
In-Reply-To: <20210831233140.2659116-2-pdel@fb.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=patrick@stwcx.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: andrew@aj.id.au, f4bug@amsat.org, qemu-arm@nongnu.org, clg@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--C6Lm7KwueyVOnR8v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 04:31:40PM -0700, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
>=20
> When you run QEMU with an Aspeed machine and a single serial device
> using stdio like this:
>=20
>     qemu -machine ast2600-evb -drive ... -serial stdio
>=20
> The guest OS can read and write to the UART5 registers at 0x1E784000 and
> it will receive from stdin and write to stdout. The Aspeed SoC's have a
> lot more UART's though (AST2500 has 5, AST2600 has 13) and depending on
> the board design, may be using any of them as the serial console. (See
> "stdout-path" in a DTS to check which one is chosen).
>=20
> Most boards, including all of those currently defined in
> hw/arm/aspeed.c, just use UART5, but some use UART1. This change adds
> some flexibility for different boards without requiring users to change
> their command-line invocation of QEMU.
>=20
> I tested this doesn't break existing code by booting an AST2500 OpenBMC
> image and an AST2600 OpenBMC image, each using UART5 as the console.
>=20
> Then I tested switching the default to UART1 and booting an AST2600
> OpenBMC image that uses UART1, and that worked too.
>=20
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed.c         |  1 +
>  hw/arm/aspeed_ast2600.c | 11 +++++++----
>  hw/arm/aspeed_soc.c     |  9 ++++++---
>  include/hw/arm/aspeed.h |  1 +
>  4 files changed, 15 insertions(+), 7 deletions(-)
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--C6Lm7KwueyVOnR8v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEu5dMACgkQqwNHzC0A
wRn3kQ//ULzm12CH3hiEdGlHYWspj3kB6hcCB/1LIG81I2mx/GUClYF8RQ3qoJxy
MI1l/DVfV5PnHZrPuHaulenlZWKaQyjDVCLbMjbzAUZSEtXiGq8+1vrdAfVMT3ef
oQllpSl97eAVK97acerKZ63h7qjkAsuq07H3E6ij9po+DblVYhQisCAHwcl7lKVq
EpWgbjvitLI7/ns1PziWcL0V6nrL1SNHQ6UCHFDfOSCa73LvAJ6nHSqmeH3KtMGi
5aCVT1aOO+6QbU3BZxlXgzNfIqFFnSxjdiT2OKqJ4C5XM+f1zZz3+5QR56Rpl58d
RoL+RK6rTYK6z06MPArStnB7ZN82BCY9yPoGDYJybLczvi5PhPsKHj1hcYsGT1OO
GfHtHBtS7CzVVyv8sdp8M1POK4BYzSFo/YNFG2t3IQ09lfORak06xn3ORPM3ybe1
ftli6J4DfpplEQD6MHAqdxEmSzi6+BszLezsoEQSIm8a1rfs7OARu3OcsbkSVVsF
t/UdeU5x5YYbeKGSnWb9c2IQLOtbQgHH34qU5m0eFPrj4c86KCnsJ18lVkSdJDOZ
fdv3rsfE1Zoy4ncu23077FKgSjHQ/u8oW032FTVb9akp6e3SR9VhY+vzMBAd84mf
5OzJdG8mkKwX9OYOLy7vZtqeWebYrTvzOxBnaOdaBlKYQ6VjkFQ=
=ToJ2
-----END PGP SIGNATURE-----

--C6Lm7KwueyVOnR8v--

