Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3D2DE08B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:45:48 +0100 (CET)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCKZ-0000U7-Q1
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqCED-0006ia-Dv; Fri, 18 Dec 2020 04:39:14 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqCE7-00089Q-4A; Fri, 18 Dec 2020 04:39:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C21065C008E;
 Fri, 18 Dec 2020 04:39:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 04:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=luGOYjIDjKB4b80mQ0JZ+DVtDOV
 Lx2ftEBmk6VAQKXc=; b=HUVc8j/XSRNB5C4czpYSjHa57TLCzdsiqcA6cRzYbEk
 rVqRz1fXIwygX87xY5LLSfPr/gIE292VMWnwCZtZR+uoIAm3544LDqOHWBaNiAwh
 1OematNkd0kV9G07xR5anJRuSzzpUG6rA2ZxJVW8LoADfRgvYtutBSvPYWuKo6SQ
 6O1Sfexv757MjMQ+ZWmzk6P7mtcIBAIImRsHEMHYHU5249zD4U+U3Q4U5iSRkZeG
 FcYzv8rExR6bzN5X4cZeCCWNJmVOpE7HvdgAleT5j629bm6MpkyWNHu8lEXBdUMS
 degWWecsBDGzHG7oyybqIwCH1Qwm/x/0FfKKFGWmFkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=luGOYj
 IDjKB4b80mQ0JZ+DVtDOVLx2ftEBmk6VAQKXc=; b=IjssT0EzvksaCzKvguIThK
 60Nw3ksyHk/r0jNlQ80bNW+nFO1O/8QMJWHV146oSPBx2rCCGpvlzn7+N8yoc8zY
 N9HRmc2pNz3Z75QIVIqpDuObO2Gsl9XlaRplV6O0ULi20UaKykXHe9E2UAcB4tDM
 38IwBc9guZsNDh2GIliwt/t1oQfyxghnFkXiEVGXQbQTHi3gYXAxDVim3dp0tP0U
 Fw4MBJZO1NFUwmz5nn5DP0wTCDZSIcnhhfh5uyZvI8naQzw74iR5G6EOqkJdltG+
 4/XBLULIrFrbtYp+g75NnE028OlTLnYULwgRea0MqsP9T5i43iZ5O+c0e7HjSg2Q
 ==
X-ME-Sender: <xms:uHjcX_0eMp_v9-ejGQiEe92AuNmNtAT8wt2F0kLBp4_YmVojvQl41g>
 <xme:uHjcX-GbYA9mjhbqXVWfEhebuTKmGCLG3UIOZD6BfoWw03WN20lHu_wXH-ZAX28dI
 kpvMtFpE73k08LPw8s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uHjcX_7c-iAdTGInJ6DYMfW-LE-mQqpPcv0bD4BI7sBUXtXWd2DLqg>
 <xmx:uHjcX024Z7A1Kwn64-X3wJmh0Dp5xH5byv9-0fScVXRg35HARjgZ6g>
 <xmx:uHjcXyFr_jTP5CiVJ89JOG6NQR-Ye9OQbQIr-1a2Zn_8jCQJ2lye1w>
 <xmx:uXjcX349CWaFH0on3YVxfqh0ffEKYwVwnIC4g5VpRpxktDIkqjwtkQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B338924005E;
 Fri, 18 Dec 2020 04:39:03 -0500 (EST)
Date: Fri, 18 Dec 2020 10:39:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC 0/3] hw/block/nvme: dif-based end-to-end data
 protection support
Message-ID: <X9x4tUI+QLDNTBtS@apples.localdomain>
References: <20201217210222.779619-1-its@irrelevant.dk>
 <20201217211440.GA502315@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HK+RASooX07dsBIq"
Content-Disposition: inline
In-Reply-To: <20201217211440.GA502315@dhcp-10-100-145-180.wdc.com>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HK+RASooX07dsBIq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 17 13:14, Keith Busch wrote:
> On Thu, Dec 17, 2020 at 10:02:19PM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > This series adds support for extended LBAs and end-to-end data
> > protection. Marked RFC, since there are a bunch of issues that could use
> > some discussion.
> >=20
> > Storing metadata bytes contiguously with the logical block data and
> > creating a physically extended logical block basically breaks the DULBE
> > and deallocation support I just added. Formatting a namespace with
> > protection information requires the app- and reftags of deallocated or
> > unwritten blocks to be 0xffff and 0xffffffff respectively; this could be
> > used to reintroduce DULBE support in that case, albeit at a somewhat
> > higher cost than the block status flag-based approach.
> >=20
> > There is basically three ways of storing metadata (and maybe a forth,
> > but that is probably quite the endeavour):
> >=20
> >   1. Storing metadata as extended blocks directly on the blockdev. That
> >      is the approach used in this RFC.
> >=20
> >   2. Use a separate blockdev. Incidentially, this is also the easiest
> >      and most straightforward solution to support MPTR-based "separate
> >      metadata". This also allows DULBE and block deallocation to be
> >      supported using the existing approach.
> >=20
> >   3. A hybrid of 1 and 2 where the metadata is stored contiguously at
> >     the end of the nvme-ns blockdev.
> >=20
> > Option 1 obviously works well with DIF-based protection information and
> > extended LBAs since it maps one to one. Option 2 works flawlessly with
> > MPTR-based metadata, but extended LBAs can be "emulated" at the cost of
> > a bunch of scatter/gather operations.
>=20
> Are there any actual users of extended metadata that we care about? I'm
> aware of only a few niche places that can even access an extended
> metadata format. There's not kernel support in any major OS that I know
> of.
>=20

Yes, there are definitely actual users in enterprise storage. But the
main use case here is testing (using extended LBAs with SPDK for
instance).

> Option 2 sounds fine.
>=20
> If option 3 means that you're still using MPTR, but just sequester space
> at the end of the backing block device for meta-data purposes, then that
> is fine too. You can even resize it dynamically if you want to support
> different metadata sizes.

Heh, I tend to think that my English vocabulary is pretty decent but I
had to look up 'sequester'. I just learned a new word today \o/

Yes. I actually also like option 3. Technically option 2 does not break
image interoperability between devices (ide, virtio), but you would
leave out a bunch of metadata that your application might depend on, so
I don't see any way to not break interoperability really.

And I would then be just fine with "emulating" extended LBAs at the cost
of more I/O. Because I would like the device to support that mode of
operation as well. We have not implemented this, but my gut feeling says
that it can be done.

>=20
> > The 4th option is extending an existing image format (QCOW2) or create
> > something on top of RAW to supports metadata bytes per block. But both
> > approaches require full API support through the block layer. And
> > probably a lot of other stuff that I did not think about.
>=20
> It definitely sounds appealing to push the feature to a lower level if
> you're really willing to see that through.
>=20

Yes, its super appealing and I would like to have some input from the
block layer guys on this. That is, if anyone has ever explored it?

> In any case, calculating T10 CRCs is *really* slow unless you have
> special hardware and software support for it.
>=20

Yeah. I know this is super slow. For for emulation and testing purposes
I think it is a nice feature for the device to optionally offer.

--HK+RASooX07dsBIq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/ceLIACgkQTeGvMW1P
DelHDQf+Iw1RqDHDwW5hf/itfFy4zGAF3BAs6VTaTgLySf5bWFY8lPELy5W+Pr22
rdDmB8MBYG/1CddBXqy5DVuVj0negns8mRYzBivBIaPE64OurzVUmQz8rhROMbpm
yc3JkdrLi/qQc+VHpPjH1afpi8WNdzgMgsSGnl5+IAI4MNL/WQpPmL4UBvH/dQ31
qcCBVhMtapV4mmMtEbDG37/7Xh395aoFkqZb8zEmbDYQji0ow7+lV/e6vmY/gCeR
as/woYVfnzn7eb5uz/5SeqJDr48EbcPrzQrczEO5Xe4fgzY6oknrFk3OJ0GLbSEg
YnlmPyNN/XOxkIRGOx89JJuDte72Gg==
=Vav9
-----END PGP SIGNATURE-----

--HK+RASooX07dsBIq--

