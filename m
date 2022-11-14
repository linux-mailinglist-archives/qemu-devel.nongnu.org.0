Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F9628EA4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:47:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouif5-0004v2-58; Mon, 14 Nov 2022 18:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ouidv-0001o2-D5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:31 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ouiBo-0001e7-AE
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:44:30 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A759E3200A24;
 Mon, 14 Nov 2022 17:44:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 14 Nov 2022 17:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1668465862; x=
 1668552262; bh=hZeDXWVW4X+rEFcbPsT5Xj71pcns2L2JSacJro9Jg94=; b=U
 HpzY4yRQasCw8TIt8OMqB91gejxa1lxs0yNbh0eiBWZ7HP7voC0Ocm/wEl8jVE41
 t2qA9KdVrRL+LcSphFLoXUoKzen8IB4U9ny74MFo7Kqzv0ievuoKac8PfKJW2e07
 AkCBxWR81c6Ri5FowNjaSXzBkzmisVDf9IeJZJBHrwrpbK6dnhCgjzbwiGQ+lw3H
 HKIwDfSAMzKtW26UPdhs+qEXD7SFP2eWukFIRpiyzf3As7TLLmAZUAytm7Qk0NV/
 Msy0umW/tvLScQwO8HpL423vsHeVcnU0QU0IOYv1dD4jfJTkx+LEVPUFhKAYPIJC
 lfPlieb8xIn8DVX0RlhYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668465862; x=1668552262; bh=hZeDXWVW4X+rEFcbPsT5Xj71pcns
 2L2JSacJro9Jg94=; b=B/tSB+kcuauRrOWrC6kLFk5120BXThIlk7A/ZZVr0JPU
 hDAuzc7t+M1KmQbA71b7KbyW3vaMgIO18pkr8SvOaXIEWhk6XYhypNuFModZaVWk
 4oJIkCc7ZJjQuH3n/tTOlUU1PXjRO/cIuP0whXPMvUSmd69tKJyHrZu9RegAVyxB
 3sGMb0KYJBly2SFnsAG4yDgVip1RbFXX8v+E0mGmSZ0KhMtBH5vDL5zfP3D0Ly+Y
 AXXvWaEPuFd7rMJ6uPerORgf2IA2/BiBMLdlGpEKhqAtJc/CHgwRWlRtRhBuiE3S
 IJwR1Eo4V18ifLO6RzvH+PGpmK1sDQv8Gh833vuHkA==
X-ME-Sender: <xms:xcRyY5ceeO87LQcFAZ4cMakpvjcyEKZYtSRs5CnuVtZZnHYw6oknrQ>
 <xme:xcRyY3PMyk4Bec9Zgo0aLfnF6IYfRtzKZCtkg8N-lVv1274b-iaCwSH7uBZvzWPON
 9svQOqpr8vRog>
X-ME-Received: <xmr:xcRyYyi3bOveXL6zVPK1K7zy7i3hAa3TVBarQRa9vJ6LeqgwDdbYOKaQmC9kzCCoiXbKQMQk5cyKXi8c9WQVTf4zlXQCj5Z6RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeefgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiledu
 vdekjeeukefhffetgeefiefffeejjedvieejvdfgjeehteduvdekffduieenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomh
X-ME-Proxy: <xmx:xcRyYy9Ym7d1FGyW67c4HJDw66iAKNpD4kkLsGJzEileBUgWdh-DSQ>
 <xmx:xcRyY1uK9gd8vhTh4AVhPsFixVoDxiVJ1ZBJz2zZ7bmPfq-tvWvqew>
 <xmx:xcRyYxFHEdvF3B1gYlK1bD93TuOtB0XAsfa0jCZDMRtRUjrwE406LQ>
 <xmx:xsRyY9Ide7JyGYxyeMLH6ZnGahWewsio-dvhau24yjtCTBVw-73O1Q>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 17:44:20 -0500 (EST)
Date: Mon, 14 Nov 2022 23:44:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on Xen
Message-ID: <Y3LEwV6kqqZ/pyy1@mail-itl>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <5f2b496a-f1dc-aa45-9600-aa9e5bbede8e@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vN93UjOCOL/zDQFO"
Content-Disposition: inline
In-Reply-To: <5f2b496a-f1dc-aa45-9600-aa9e5bbede8e@citrix.com>
Received-SPF: none client-ip=64.147.123.19;
 envelope-from=marmarek@invisiblethingslab.com;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


--vN93UjOCOL/zDQFO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Nov 2022 23:44:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen

On Mon, Nov 14, 2022 at 07:39:48PM +0000, Andrew Cooper wrote:
> On 14/11/2022 19:20, Marek Marczykowski-G=C3=B3recki wrote:
> > The /dev/mem is used for two purposes:
> >  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
> >  - reading Pending Bit Array (PBA)
> >
> > The first one was originally done because when Xen did not send all
> > vector ctrl writes to the device model, so QEMU might have outdated old
> > register value. This has been changed in Xen, so QEMU can now use its
> > cached value of the register instead.

I should have noted that "has been changed in Xen" isn't fully accurate
(yet). It refers to this patch:
https://lore.kernel.org/xen-devel/20221114192100.1539267-2-marmarek@invisib=
lethingslab.com/T/#u

> > The Pending Bit Array (PBA) handling is for the case where it lives on
> > the same page as the MSI-X table itself. Xen has been extended to handle
> > this case too (as well as other registers that may live on those pages),
> > so QEMU handling is not necessary anymore.
> >
> > Removing /dev/mem access is useful to work within stubdomain, and
> > necessary when dom0 kernel runs in lockdown mode.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> The commit message ought to go further.=C2=A0 Using /dev/mem like this is
> buggy anyway, because it is trapped and emulated by Xen in whatever
> context Qemu is running.=C2=A0 Qemu cannot get the actual hardware value,=
 and
> even if it could, it would be racy with transient operations needing to
> mask the vector.
>=20
> i.e. it's not just nice-to-remote - it's fixing real corner cases.

Good point, I'll extend it.
But for this to work, the Xen patch needs to go in first (which won't
happen for 4.17). And also, upstream QEMU probably needs some way to
detect whether Xen has the change or not - to work with older versions
too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vN93UjOCOL/zDQFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNyxMEACgkQ24/THMrX
1yx2Bgf/Zxk3GrfD0HbIUYIAIcvvtzcL6qNrGbF+G7sTR7MXOoNLa/b9qBelAtMr
d1Rh+y6I0ne1PTTPI2eExh9aNN88XX90ZlNqpjRgalmuRgIo7FYy/f1gJ2QGOpm/
iHMtcWzXPNE1Y/KS5dBcJy5NYugO9NDt+VHqJR5e6fzw+912cmgVTiF6ZTuXRRJE
IbG5dBwTc991XrOTSSiiwyHFEOOwVuly43tr+/+zogbCt0Cs8P2/lcuwt7OT20kV
UGsu9hhZzqeaitAr/MoBgxBhdN6fDb2RtJtFrrpY8N8YavbkJ+8raUpIiQ8lmT/I
3vwrKLYK6/RxEWmdzWZNLcCbgpHKSw==
=hLSV
-----END PGP SIGNATURE-----

--vN93UjOCOL/zDQFO--

