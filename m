Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1403133C95A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:27:40 +0100 (CET)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvgY-0006GD-Ki
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLvcb-0005Ht-Dy; Mon, 15 Mar 2021 18:23:33 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLvcY-0005yB-Mi; Mon, 15 Mar 2021 18:23:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AE67D278F;
 Mon, 15 Mar 2021 18:23:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 18:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=LWyeEWNSTVeMlX73eU2r0IKyMf8
 5eri81MsaNzuaiu8=; b=LD+/8HKX6qZg+wEgJnhih6f55WLpnqlnQ3hY8Opz+Uw
 ZSB2paXcuxGmkkCJw/m5NkPJPKL3/pEubvRn78S7cF66Ck8PQ9DeC2y9A3TcLzCb
 PDBYBK7JrRIpbf8rIJ/UGjhUqU40Yn5nBOQXAmW7gQDkrzwTvFow0TYz2YO8IlKQ
 fmsSKQpbdwGtSQwyjljRQZ3maeN6dF8wAHknu8EqqYb+yx8mPQ4o9y7pvoe9ChqF
 F7VKGhUuLGZstvQA0HAum48t1p3BzOmQYO6JTrCcXRxx7/jlthSn7cM/EqqzYcmW
 8hvCzBdeEVljatawlDcCYr4tDfjQtql5DFYY72zc4Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LWyeEW
 NSTVeMlX73eU2r0IKyMf85eri81MsaNzuaiu8=; b=lBBfmAoX4a1tbtWDuZSxf1
 UNm+Ji/RTY9i9z/i2nEZE9o0YpR3SZlCHz6FX77VMhB9g1DAfcerYVnmCGkdIA8Q
 zEwNtZQVRz0JLVY8EP2Eppu6iTFi+T70W4CM6e9uKjcOWFavd2BBJ6UKp66/7g+Y
 o/cDaK2gh6T1DRDK+VjYiugn6cDb4iqpKpO/Hd33hXX7ceXD8q29r0KNyW2i9BbH
 HEYfrDVAbV6WQk7aTOly7MrSy5FJRJrdqKH1hpO+QC5ZFt7MoCd/4sa3AtWCJPQY
 TqcsG1NhnMNeWTz5cvD8CPsNdaOhxaq2XFPpv75jzuCiK5O9SKi0v9nLd3JZE5eg
 ==
X-ME-Sender: <xms:Xd5PYPCh6NVt0L4BRSeEHbls0JbHq84rgID9M4gi2M6pvRKw1dwidw>
 <xme:Xd5PYFivwMaNJvbEaC24yXMZDEoFNnE3-G7bpQFWT8KpUYQcF21XeIqzSBmb75RQd
 YZDNh6TsNIftfJArpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeftddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefghfejfeejhfeiffeljeevheffteehhfeuffehhfeltddvvdehheelkeevfeej
 tdenucffohhmrghinhepshhpughkrdhiohenucfkphepkedtrdduieejrdelkedrudeltd
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhs
 sehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Xd5PYKkQFKru4BkqqVckveLOPwNYG2V8bOjCZTKjDriLt01uGUVBPw>
 <xmx:Xd5PYBxaMqAzO2GDtv4AmMcbucwksr-zMwlfo7rj5vmJAGDo4MgjKQ>
 <xmx:Xd5PYERKeQj5LhZvXqeT1Xrw6ppDdNv53u_wHvW1WxrcEd0EYodstQ>
 <xmx:X95PYJS_lF7AwVw3-6hWpMydqniXKSm3Okxz25ibFm5QiWzpdzXjuQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E4D324005D;
 Mon, 15 Mar 2021 18:23:24 -0400 (EDT)
Date: Mon, 15 Mar 2021 23:23:22 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 00/13] hw/block/nvme: metadata and end-to-end data
 protection support
Message-ID: <YE/eWmadF1ZEPDZp@apples.localdomain>
References: <20210310095347.682395-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0ubVIq0LrNk4VK+g"
Content-Disposition: inline
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0ubVIq0LrNk4VK+g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 10 10:53, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This is v5 of a series that adds support for metadata and end-to-end
> data protection.
>=20
> First, on the subject of metadata, in v1, support was restricted to
> extended logical blocks, which was pretty trivial to implement, but
> required special initialization and broke DULBE. In v2, metadata is
> always stored continuously at the end of the underlying block device.
> This has the advantage of not breaking DULBE since the data blocks
> remains aligned and allows bdrv_block_status to be used to determinate
> allocation status. It comes at the expense of complicating the extended
> LBA emulation, but on the other hand it also gains support for metadata
> transfered as a separate buffer.
>=20
> The end-to-end data protection support blew up in terms of required
> changes. This is due to the fact that a bunch of new commands has been
> added to the device since v1 (zone append, compare, copy), and they all
> require various special handling for protection information. If
> potential reviewers would like it split up into multiple patches, each
> adding pi support to one command, shout out.
>=20
> Support for metadata and end-to-end data protection is all joint work
> with Gollu Appalanaidu.
>=20
> v5:
>   * add a required fix for zone management receive when metadata is
>     involved
>   * add a couple of refactor patches for the zoned init code to make the
>     format nvm patch more straight forward wrt. formatting of zoned
>     namespaces.
>=20

FYI, the SPDK e2edp test (tests/nvme/e2edp/nvme_dp) fails on this series
when metadata is more than 8 bytes. This is a bug in the test and I've
posted a fix upstream for this.

  https://review.spdk.io/gerrit/c/spdk/spdk/+/6891


--
k

--0ubVIq0LrNk4VK+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBP3lgACgkQTeGvMW1P
DemyyQf/SpevjP77caToriOQ6YuYbm4K6yI3EbMdKpPRd5bPLJO3UFPL4qlN3ImE
+xcVihaBCnwou9v2Yb0DksczUFGvW9NL0Ncl/AwI3vFf4+5Ax2b83nfq+IAS2ZD6
SdOykVePmqPCf7Nucll/qfzKjMyE9CNCEErUcOfyiZC/10ED9tiGm6rqtqjPvACj
TxNAxkdzKebsTOK8YOpCd/Q+TNGixcqEbcEVE5A/eVYsHQ+JfO+kN4yhVM+DR3Fi
mhdQBU/u+tD/UCA6Y4dAKjKwroPBCnENnww1GhdFWbptktlHxegqFFQmHmLd1rIo
bWxFqvraV5TTcMRUojz6rvBFUaIfGg==
=/wSY
-----END PGP SIGNATURE-----

--0ubVIq0LrNk4VK+g--

