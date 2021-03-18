Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3734053C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:13:18 +0100 (CET)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMrWf-0005OG-ON
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMrLw-0008GL-8O; Thu, 18 Mar 2021 08:02:12 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMrLo-0003rW-33; Thu, 18 Mar 2021 08:02:12 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 225AF5C0172;
 Thu, 18 Mar 2021 08:02:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 18 Mar 2021 08:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=gvQti4JbSzv7WfXGJP+hOoW9+g0
 OijVmPHzbQfLY+mM=; b=tbd2C71PE/Dn1eOhzD5jqaxVNJFuoXPUL1kVKG5juCt
 W9MBjZUG3V59CANh73jgZr11bWfSyKQAyoGexB4Bl5Ck5HWN7BRX/1C3e+YY6FGP
 eZc99Bnx4sbMd32MbsldJrzWL7yGaenW7nGOZIHshPGoy0OF1MSSsasaF1OrNrEU
 6OCeuSVBSeDxcUGVNmbvecg7snZ4IQBiZRLbmtse0E9qIJRa9PlJO0I+XRp8syOK
 13N4sUDE8I+WHk/U8dXhPNBP/PUPON4KGWNlV9/TqGlK6M359DI9VYc4ydU9UfL1
 EcRHLlhkFxCZ4lbmUAtVJwhi1rylfloHwyK047tFOHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gvQti4
 JbSzv7WfXGJP+hOoW9+g0OijVmPHzbQfLY+mM=; b=ann5B7aNn3RFfR1Ck3q22E
 FyvEoEODQ7rM0/RCV5GD53w/Yk3pyIfA0XoErRhe7mxDEv8+A37MnwWl/fwYkQfE
 17vbKcw87uJVBPMeQ+AR5KOMoadWdHqSx+2pXvEuhQ2+Yu6FOYbizexXW+tTHcrV
 SA6pmmevHynFlR68upvRIqWXCr8X51r8k+fNnyfyd3/Sz2NSbKoPzHd9ZqXcc4au
 oEFKa/JXQPr32V6v/oOWE9emOtUbu/le52QVp/Ms8vJhPlYWS7x9sdpbrcfKtvmz
 2xsuri281pG3ZmXDN+BnJbp9T045H30BWmjm3SW+yvf7bieM2Mtpq7bYxKz+1/UA
 ==
X-ME-Sender: <xms:OUFTYGz6XAJeXvPWBJoSB4829ybwCS2dF9DdWKH7q0M6edz8t7FbkA>
 <xme:OUFTYJEaSKJFONc1OvY68Lz3NQTV2GNQXFohyE2xANbm4hHTnEYLuG5tEwHOmbVkD
 27i5xX_QmNwyzvLRiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OUFTYJiJWKwPnHv4_4WbF75nCYxm1wshdxX6eugZEI9rxfWvqIGtcQ>
 <xmx:OUFTYKSAh6n0GIHbCe9EuvrdFyz3aHfI1AWNKu_3H5ugf9oBWCXpAg>
 <xmx:OUFTYPXbDIkjER1156XAsoWDKCaYvi1gcdWbkqV1zoIci_dyIJw8Wg>
 <xmx:O0FTYJE_BgEnlvg31zxE9qIctofzsoB2TX7A1ufmWP0mALJmbcagzQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2607C240067;
 Thu, 18 Mar 2021 08:02:00 -0400 (EDT)
Date: Thu, 18 Mar 2021 13:01:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/11] emulated nvme updates and fixes
Message-ID: <YFNBNjvRQgLh9Vh3@apples.localdomain>
References: <20210316214753.399389-1-its@irrelevant.dk>
 <CAFEAcA8_rcfiYz4NSqY1QKA-FMPK7Hk3xcVvFbXGZnXw_HKuYA@mail.gmail.com>
 <YFM5MjqxwMiddbaB@apples.localdomain>
 <CAFEAcA9YZPbUVCgwaxsMjmkCbYN1uTv=N4P9VjUiktBD_0JRPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ynAp+qdnLVDfILxV"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9YZPbUVCgwaxsMjmkCbYN1uTv=N4P9VjUiktBD_0JRPQ@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ynAp+qdnLVDfILxV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 18 11:28, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 11:27, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > On Mar 18 11:26, Peter Maydell wrote:
> > > On Tue, 16 Mar 2021 at 21:47, Klaus Jensen <its@irrelevant.dk> wrote:
> > > Hi. This tag includes a submodule update which is not mentioned
> > > in the cover letter or listed in the cover letter diffstat:
> > >
> > >  roms/opensbi           |    2 +-
> > >
> > > so I suspect it was inadvertent. Please fix up and resend.
> > >
> >
> > Oh crap. Sorry!
>=20
> No worries -- git makes this a very easy mistake to make when
> doing rebases. That's why I have a check for it in my 'apply
> a pull request' scripts :-)
>=20

Out of curiosity, are there any obvious safe guards I can implement
myself to stop this from happening?

--ynAp+qdnLVDfILxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBTQTQACgkQTeGvMW1P
DemIIQf/QK3NRiDYOo8/85QmWL0U9Fl8jMrmC2SynSlZ89G0E2y8ZJqVVklULqrB
Eo8kdRxCLt3fLjJ5bIN0YHC1n5iJOjM8HPirbwl2CN9aTQ6G9WkHoXCqgcybsP+T
o65u/p67kmk4mFs8Rm4Numv4vJwkznDal4CNLmczMgB1AWjo+qkFCjfnOH5QJele
j0A0zeYtlewI6ABkjxH7JfEiS4eMSOdAqcDDXvZgpTnGgkWCfKLkMc70CV7fGeAb
ch6liUKpCsNgU3OXqcYBcYUcqovp8z3uIiGoOLwt8t0w0Hm0u0NPZo0i3alAZaj5
T5N4164ynq/jQQcKYdoJn669zSPDpw==
=L2tX
-----END PGP SIGNATURE-----

--ynAp+qdnLVDfILxV--

