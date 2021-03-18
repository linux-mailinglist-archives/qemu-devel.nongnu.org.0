Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5F340526
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:07:53 +0100 (CET)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMrRQ-00029m-43
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMrKM-0007Mw-7F; Thu, 18 Mar 2021 08:00:34 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMrKK-0002rt-9R; Thu, 18 Mar 2021 08:00:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 57D5B5C015A;
 Thu, 18 Mar 2021 08:00:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 18 Mar 2021 08:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2u5FhNOMTz4bVYJ8N/i1iQNShfY
 YxTfuFizA/oGYjR4=; b=opZSqJ2W2Vn8iZW+nCqXdBN2xO8Rebznsdil5SWSyct
 xZc//CzM17g4JXrG+sXVLEMKM7S581+M+JF9+Dk3fqLzdeuaiy9qtyi5YVbNkbs3
 NDzNAxp5btfP8UTWWDcIgfMuKCA3b7R358QPKPGp8DX6A99LGUwwdYU5xsAbI2c3
 1Cjg78blAShcjzTbB4+85yUlf4VfZK0OLJBZM+aQyCpIYYbk5Ai7AJmkXE5Slx+g
 neBVZRfG1H9BAvvjDq1TXjUUVviS6aGfiO9Hv6TPf9RoxgrkQ1XjBE93h5AdHlA+
 J8gpCm+zA9FsfHHSzd89eBOTAJUE3DXFN/M2s9exveA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2u5FhN
 OMTz4bVYJ8N/i1iQNShfYYxTfuFizA/oGYjR4=; b=ECNOmjqTCDDGGUpfHU4sZ8
 fe1cIhPKu8DI7UA2Z69EAu8Daar9P2GzaOX3ilwRBu5FCtHbOv1i2ghO/q3QRIIw
 vZzAdJcuv7vTtVLV8FIMX23LSQ4QEX5t/bemDiyxqoPZjIVdrU+IBcKTnj4USlgb
 lf7cJP1shF/mprCanBRWaT/3DVOhvwSQsSH2AvD9/tDNbjM2v8Iqer52YS8SxJAc
 D7PYgIg8/FaVLuNPf6KvubIGL1Y6vELmpYEr/xhNFz5L+FLDSSIJl7YcPcJ3CdNe
 2V5MtVV6jpzxc1oQS4+Tt7XvMwOeAZ1CxVR0DKt2zwGeTt8RJTtoICkIgDTGZTcQ
 ==
X-ME-Sender: <xms:3UBTYFqEJQjr7VKhmTnPPJj-geFcVsHN6otBLrNIwVBIm34sT1pIAA>
 <xme:3UBTYDUGfUgfBBtNHd1vZ9_nmqznJZOIiY70ynjK10AJdcFSHbOvs2gmTHWkecTDz
 o3aZJPhoGPCt5teyKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedutdehleelvdetvdefueehgeevhfejueeliefhudfhiefffffhuddtkeekieek
 feenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3UBTYM6b83sm_VA_GDN0UkA_ZJaVAw8XfPmBslyH34kRpH2_5TTtUQ>
 <xmx:3UBTYB2yxrhcoKOXThbV4raH3l941DBLW6ZOr2b9LvtyCHDbPu-JGw>
 <xmx:3UBTYD8kGdJcqIEGIDz_T8JXNOnoTRXzWQdy08AIg3XfK05XyZjCaw>
 <xmx:30BTYNVsy44O5LB18L7l_VOeJiiS3DH71X4QTC_kjfjOSwq4T6J8iw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 494E0240066;
 Thu, 18 Mar 2021 08:00:28 -0400 (EDT)
Date: Thu, 18 Mar 2021 13:00:26 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/11] emulated nvme updates and fixes
Message-ID: <YFNA2qbDw9lJhXvE@apples.localdomain>
References: <20210318115757.58923-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z3DX2YwXwH2TZiuL"
Content-Disposition: inline
In-Reply-To: <20210318115757.58923-1-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Z3DX2YwXwH2TZiuL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 18 12:57, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Hi Peter,
>=20
> The following changes since commit b12498fc575f2ad30f09fe78badc7fef526e2d=
76:
>=20
>   Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.0-pull-req=
uest' into staging (2021-03-18 10:05:37 +0000)
>=20
> are available in the Git repository at:
>=20
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>=20
> for you to fetch changes up to dc04d25e2f3f7e26f7f97b860992076b5f04afdb:
>=20
>   hw/block/nvme: add support for the format nvm command (2021-03-18 12:41=
:43 +0100)
>=20
> ----------------------------------------------------------------
> emulated nvme updates and fixes
>=20
> * fixes for Coverity CID 1450756, 1450757 and 1450758 (me)
> * fix for a bug in zone management receive (me)
> * metadata and end-to-end data protection support (me & Gollu Appalanaidu)
> * verify support (Gollu Appalanaidu)
> * multiple lba formats and format nvm support (Minwoo Im)
>=20
> and a couple of misc refactorings from me.
>=20
> v2:
>   - remove an unintended submodule update. Argh.
>=20
> ----------------------------------------------------------------
>=20
> Gollu Appalanaidu (1):
>   hw/block/nvme: add verify command
>=20
> Klaus Jensen (8):
>   hw/block/nvme: fix potential overflow
>   hw/block/nvme: assert namespaces array indices
>   hw/block/nvme: fix zone management receive reporting too many zones
>   hw/block/nvme: add metadata support
>   hw/block/nvme: end-to-end data protection
>   hw/block/nvme: add non-mdts command size limit for verify
>   hw/block/nvme: prefer runtime helpers instead of device parameters
>   hw/block/nvme: pull lba format initialization
>=20
> Minwoo Im (2):
>   hw/block/nvme: support multiple lba formats
>   hw/block/nvme: add support for the format nvm command
>=20
>  hw/block/nvme-dif.h    |   53 ++
>  hw/block/nvme-ns.h     |   50 +-
>  hw/block/nvme-subsys.h |    2 +
>  hw/block/nvme.h        |   44 +-
>  include/block/nvme.h   |   29 +-
>  hw/block/nvme-dif.c    |  508 ++++++++++++++++
>  hw/block/nvme-ns.c     |  124 +++-
>  hw/block/nvme-subsys.c |    7 +-
>  hw/block/nvme.c        | 1257 ++++++++++++++++++++++++++++++++++++----
>  hw/block/meson.build   |    2 +-
>  hw/block/trace-events  |   22 +-
>  11 files changed, 1939 insertions(+), 159 deletions(-)
>  create mode 100644 hw/block/nvme-dif.h
>  create mode 100644 hw/block/nvme-dif.c
>=20
> --=20
> 2.30.1
>=20

Following a convention I've seen on the list, I'm only re-sending the
cover letter since there are no changes to any of the patches, only the
tag.

--Z3DX2YwXwH2TZiuL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBTQNkACgkQTeGvMW1P
DemSoQf/U1Z1eTurKpV7ydayXGa6ZXjR7EPpVjr9ywVDLkTCT/B3DKZ1ZcrMO+iF
BWGfA4/nqJfgOl1A8BlsWgYFX3wA3MNPIabhZwH7IM93rDUuyqQPdvUYCao33kw8
cl4PhOhx2YiwizryD3CjQd7C5PxV02CgYM7Ivh4J1wlJM8W3J7oXrXGHb96QR979
3bekCddveZ976YfhiuAu97Mcyk4GvDwtRI29hfCC7kn1jawI/Qm9gNjc1/bRDBCg
+3fV1Y7PLbEWwhMm5CKeJygGKppaGXKzng1asKvNd6vwSIiKA3J87pCrGTUKwcI5
cL3I+N8Dj6Dj3pklfytSQImd2hvtOg==
=zqYf
-----END PGP SIGNATURE-----

--Z3DX2YwXwH2TZiuL--

