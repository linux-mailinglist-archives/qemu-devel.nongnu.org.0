Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17A331733
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:26:35 +0100 (CET)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLWU-0002gs-Fu
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJL2T-0002LT-7g; Mon, 08 Mar 2021 13:55:33 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJL2P-00005J-Ss; Mon, 08 Mar 2021 13:55:32 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E7FF580707;
 Mon,  8 Mar 2021 13:55:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 13:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=gmAvXZekthKVds1ec4JC9RLYhQa
 NMGXQmeY9PG701fA=; b=McUmZOtDPlcJGyHjiaoaLuKz2bxrIRUvFVpn6YlIkan
 0v49aziIiYdWMbCVYDnk1c8PrJneyDKjxOcMYVJrYr6Ib4UP3EqUagXzpON8vu7J
 T7q94nQEHFuqogayacGGMYyKQ55MfozaMouE9X9C4DXWea73gYOMraZtfH8J32Lm
 J6md3IvwXy7OI9ru14z7/DOQX4snStLDu+PhIryp6M3KZQBPL0CnR0xwOOtedp4J
 KD3PgNJIG/H/wdY8i4VMNbUZ5wAmJt0f/MSaY9KA1rjWYpgAlX2LFIRGESrx/271
 YSrqDsdFvts9ZEXzZx6xP5y07wPVQpYyq+XN3KFWcyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gmAvXZ
 ekthKVds1ec4JC9RLYhQaNMGXQmeY9PG701fA=; b=QN/zjqwCX3bRRCyRwuaNBb
 UDLkGJHy3ZXf0tiQTpBDRFBv0515SxBYvrYjtlNIoj9sTsGeJgulL0kKD6oBJYhz
 B4NnYxFVGCbJb+vzxe8z+JUeRaJ6+8N6TiMQ0sTgSzmqHoaO/1CIEfOUdnrMCZn+
 w3MBaqY+6X5fBptTu1VhZ4fHAsB7KxoGVhLyJRnBtNKiDBA+jvi880chInR4MJiQ
 njU27PFE8IrmpVWjQoNFk0YNKyOuHMF8egsVyeE+YlGI+LPYz5vEu01Vvl2dt8Jr
 tv6nH//9nCso96uvy5ZiizYOzkumqnIoguF168xX8CgGAkHIL1eKvDcDvsf+pxiw
 ==
X-ME-Sender: <xms:H3NGYB6buZjYXB0F83V5jM5oOM9UmcioIa7IflNWr7x0PkFasaAf2g>
 <xme:H3NGYO4bAhRVcZS-d7gsiAAjv_MsFz56-SsRShrWFQSZSiYos8kebT_YrEtBhcPZu
 TySXccpD7qyktIMbGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehgeehgfffgeekveefteetudekheejffdtvedvudfgffelleefvdfftdekgffg
 udenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:H3NGYIcQxoTFnwfjbDHqMK4HZr1_XoeHPaUYwIJD0NodtYrDXR4f5Q>
 <xmx:H3NGYKK_hQ5H3m6O5dyO214zbBtvPaiCgPAm-SnIWFhg64Nm0NIKbw>
 <xmx:H3NGYFLoubpLEEXoGKyhlGx4INiG5t2i5UlZMGHZ8dSeSxcfdIWHyQ>
 <xmx:IHNGYM8oRpeHGacXMZDRcWHuRuPtI9qZxhTQas2Pi77-lg1wkLeG6Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A97F124005A;
 Mon,  8 Mar 2021 13:55:25 -0500 (EST)
Date: Mon, 8 Mar 2021 19:55:24 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 01/38] hw/block/nvme: introduce nvme-subsys device
Message-ID: <YEZzHF0mUFgZpATC@apples.localdomain>
References: <20210308122313.286938-1-its@irrelevant.dk>
 <20210308122313.286938-2-its@irrelevant.dk>
 <48178d72-444c-91fd-c1ef-0ae28b8a674e@redhat.com>
 <YEZw/cDu+1zouiHT@apples.localdomain>
 <CAFEAcA9Jf9JPyzZEagNKwd3pRwyY5OZJUV9U-=3LGwcCbF695w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IEslRVchhB9HBTMs"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9Jf9JPyzZEagNKwd3pRwyY5OZJUV9U-=3LGwcCbF695w@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IEslRVchhB9HBTMs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  8 18:53, Peter Maydell wrote:
> On Mon, 8 Mar 2021 at 18:46, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > On Mar  8 19:32, Paolo Bonzini wrote:
> > > On 08/03/21 13:22, Klaus Jensen wrote:
> > > >
> > > > This patch introduced a simple nvme-subsys device model.  The subsy=
stem
> > > > will be prepared with subsystem NQN with <subsys_id> provided in
> > > > nvme-subsys device:
> > > >
> > > >    ex) -device nvme-subsys,id=3Dsubsys0: nqn.2019-08.org.qemu:subsy=
s0
> > >
> > > Hi Klaus, sorry for not spotting this before.  In the SCSI subsystem =
we
> > > moved away from using id as guest-visible data.  Keeping it as a defa=
ult is
> > > fine I guess, but would it be possible to add an nqn property to nvme=
-subsys
> > > and use it if it is present instead of the id?
> > >
> > > Thanks,
> > >
> > > Paolo
> > >
> >
> > Hi Paolo,
> >
> > Thanks for pointing this out! Absolutely - we have no specific reason to
> > use 'id', so we can just change it completely to use 'nqn'.
> >
> > Peter, you want this in a v2 or did you already start integration of
> > this PR?
>=20
> I haven't yet started working on this PR so if the change is trivial
> feel free to roll a v2.
>=20

Thanks, I'll do that!


--IEslRVchhB9HBTMs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBGcxoACgkQTeGvMW1P
Den3vwgAnwF4Qs3v9+vOF77fg7D+0CSvwrOG3CTRW9phDaNZyYPXYyre6m592972
IzXPisc5/AI/GFV2a6hqGt16QUMcW8Jw6xITxr4EPkD2rotcDwR2SpZKjeOm/kVW
DM6sr6iV9umQbkufhcKRXMaUMeWSQzQECuHlVbZ9zsLn2aWNHMBeGOmCdozfgQDR
JxOx9Xryhs8Pn3n+CYOOLje2fB/JghOmkl9128brJ+W/01rlQgf08KwYtea9tSk+
RECqMUXPhnhNFnZTDpbrCzNyO8ez3awVk2lnnT5Sb9hNpfC5p2yOMwyEC+MWDbZc
u2RATXoh1mGRDMSUZQtzr7zdAzdZkw==
=/VTP
-----END PGP SIGNATURE-----

--IEslRVchhB9HBTMs--

