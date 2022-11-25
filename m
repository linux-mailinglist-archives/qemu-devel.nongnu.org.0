Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D66384AA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 08:46:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyTO4-0004v5-0o; Fri, 25 Nov 2022 02:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oyTO2-0004up-3C; Fri, 25 Nov 2022 02:44:38 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oyTNt-0005Yr-Ei; Fri, 25 Nov 2022 02:44:37 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D20E03200A13;
 Fri, 25 Nov 2022 02:44:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Nov 2022 02:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1669362264; x=1669448664; bh=Wx
 MesDgPm5rBzvF0IHacp2nV+L17GcyKU66BZwbVnlg=; b=DEwf6DD6191qMPoNXR
 RctFwNZLDm/XQCXnBE7ULw/9w5O8fO9HU4LQ4+hieu891pCLpCwt4yJVTGr+9Csd
 GzaAOWetJYIHYQB4GrxbQE0uW1IRG2OvpoX2XAT4io9SWtE4hsN6BahzfLJwqrD3
 Qh+5pxxmJDpjN47J3WpeMEvCYSMvyX+iGN5+s+MH+NCB8ySUyIhGHGVVs2t6roFa
 NVxBd1EQCaAsVsx7rGwcQfIH47SiRZjwP6cgnWRJnMjTODw/M6nsco2h9ggfVmQu
 FbdttjWo1UCnFneVOivMe6Ur3boUxLJgz41PZDWxr1vSA5Py9j0tA7J1CiDq7TA4
 YLnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669362264; x=1669448664; bh=WxMesDgPm5rBzvF0IHacp2nV+L17
 GcyKU66BZwbVnlg=; b=GBZmgWJ9PbMFlTzSdEbtShONxVyMUXGA3a2mWk4w8ibX
 771SnQRoUKDjM97vbW+ujBElh9gubj3y6GNcam3kOXIVLQEHSadFzVk9kMl+CK2u
 D/HPOA7Vyp+BoJ6e+nWTsCvbSbL7gV+bNtOEoWbB+Bs5aYBSVuyzdzRuwrR+wmqM
 mcHApXkCHinGN+yZoOPgWKQ/3vfD9zN69Pmkp7dXp0G1u44c4G9rNteE5wyOMVMQ
 Jfg5ZST88gLTw89KL5rlKH9M5gWPUZChMeOwblji1ksIdOT3sHA7c6wiNbwraA5t
 Dg6PTB0fFGDSvjz4x0ajHoZDe++hsa8EBXIvgHBmlA==
X-ME-Sender: <xms:V3KAY2s6Pmc1x7rKLEBaUuG2Vm7gURCQeI8OUm2FmVxQ_IxQ09xBIw>
 <xme:V3KAY7cdlcqdBx7pHvRkOltnd8HmZ154v69_W06SiSpo7ucQkgV_R2l3F1uynoS0K
 f-Ed5lsv0vGs_K2RLw>
X-ME-Received: <xmr:V3KAYxxpREgA-rUP-S13IlF5pJo6KWF6nHV70iC1x2CutWTiWkkvlI0zDWwiz_tI0xc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepffduvdfhheejudfgieejueeileegveduvdelhfekhffgteetffdtvdekveei
 leefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:V3KAYxNVQ64-SvaTPrq_lGCG3NLziTcEdmEdkdv2USg1TJedkkXx6w>
 <xmx:V3KAY28P4tTCj4waeIQ12l9vCDmpw3kc9EyijjyBu3sls4DgtD85Ig>
 <xmx:V3KAY5XoWLtA-7uusOtG76jr4guNpSexVI-IchH8g09yETxzvvt43Q>
 <xmx:WHKAY5bgc4-JxolZIJQQz2h8KXOeRqOoRrAXJKf9oy2-ixb7Bmg6rw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 02:44:19 -0500 (EST)
Date: Fri, 25 Nov 2022 08:44:18 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tihov <d.tihov@yadro.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kbusch@kernel.org,
 linux@yadro.com, m.malygin@yadro.com, a.buev@yadro.com,
 ddtikhov@gmail.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC 0/5] Protection information pass-through for block devices
Message-ID: <Y4ByUi5gOH6swqMS@cormorant.local>
References: <20221124155821.1501969-1-d.tihov@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aHfgJCneiGsK3raT"
Content-Disposition: inline
In-Reply-To: <20221124155821.1501969-1-d.tihov@yadro.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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


--aHfgJCneiGsK3raT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC: block layer maintainers (Kevin, Hanna)

On Nov 24 18:58, Dmitry Tihov wrote:
> This patch set allows using End-to-End Data Protection in NVMe subsystem
> with integrity capable host devices as the NVMe namespaces backend.
> The patch series is based on io-uring kernel interface feature not merged
> to kernel upstream yet:
> https://lore.kernel.org/linux-block/20220920144618.1111138-1-a.buev@yadro=
=2Ecom/
>=20
> The main advantage of this approach is that it allows using the
> same protection information enabled disks in multiple VMs
> concurrently. This may be useful in cluster setups.
>=20
> Please let me know what do you think, are this kind of changes appropriate
> for QEMU upstream, what should be changed, etc.
>=20
> Dmitry Tihov (5):
>   docs/nvme: add new feature summary
>   block: add transfer of protection information
>   hw/nvme: add protection information pass parameter
>   hw/nvme: implement pi pass read/write/wrz commands
>   hw/nvme: extend pi pass capable commands
>=20
>  block/file-posix.c           | 130 ++++++++++++-
>  block/io_uring.c             | 109 ++++++++++-
>  docs/system/devices/nvme.rst |  15 ++
>  hw/nvme/ctrl.c               | 361 ++++++++++++++++++++++++++++++++---
>  hw/nvme/dif.c                | 303 +++++++++++++++++++++++++++++
>  hw/nvme/dif.h                |  18 ++
>  hw/nvme/ns.c                 |  59 +++++-
>  hw/nvme/nvme.h               |   2 +
>  hw/nvme/trace-events         |   6 +
>  include/block/block-common.h |   2 +
>  include/block/raw-aio.h      |   3 +-
>  include/qemu/iov.h           |   6 +
>  util/iov.c                   |  24 +++
>  13 files changed, 992 insertions(+), 46 deletions(-)
>=20
> --=20
> 2.38.1
>=20

Hi Dmitry,

Neat.

But this is largely depending on how the API turns out in block/ and I
am not the right one to comment on that. It's great that you have an
example device to utilize the API, but this needs comments from the
block layer maintainers before we consider it in hw/nvme.

--aHfgJCneiGsK3raT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmOAclEACgkQTeGvMW1P
DekhEwgAqRIeKGBWB8jF3eMcd+fyN8X5LhTnTUdFw4RXHFcL0xhtfSo9YE7gQXJq
g72wGhSSLwFHmU8X+KtusHuMPjRmPOvpyaTQ5EQh6ANeGHNTBOaAcsGXSTY5U4Hs
sHOx/sDscpqILOjMgrEY44Osz63oZlqLeSwoR0gAASqhpoOa9P4S/jDIh43Vpp4d
+x04pdDyWVsdz9Jmp1aUI+aTgDYJfPyI15VuH+0AYDQsmPs/Fxi0qe9Itdgcif2X
Wo+F09sEj6RK7C4K2u4I/IbKNg0fqGxJbknn3ex32emBs2ybdWFzcOM/F6zLVVOT
qwgzkNmOz9/Iw1Vi7/gjk03HSNR7AQ==
=fDxD
-----END PGP SIGNATURE-----

--aHfgJCneiGsK3raT--

