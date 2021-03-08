Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9267B330C98
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:41:13 +0100 (CET)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEG7-00045m-Ta
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJE7h-00085R-CF; Mon, 08 Mar 2021 06:32:29 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJE7f-0000hG-GX; Mon, 08 Mar 2021 06:32:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2C3123FE;
 Mon,  8 Mar 2021 06:32:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 06:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=J8DWwZhxKEm5F33vdKNAMB5SH+m
 HfGQOGxNzmtU5oFs=; b=bvfipwmM00r19yC12z0l+0O39HkmphNDKNFoBJouEEA
 HLxoWbu8QiJZaJ6C5RZg7yAvtYmu6n+Ov8sIGtnQWKolQdO4ermNP77MrdeRwJPn
 jrqJyIc4HWNzc6Qn2WfLGq6EmrjbfCarQ7hbQcOFPe5yuBTBB6LNw0ANTLH8IBXG
 3qkxulskJmTP8i/tAW4Tw9I443v70STYlPG1aEMGrGmSpy9Ko1F80I+SgaeF8PwF
 J+9UqYJJIYAHAVpkf9rIbeCPbBZSluVrkZB96Bl5JyeZCx+YXFdK249suqYf/I6+
 xtVKncNAtpVntsy7gdaOsSuumG0sfxitUfiuWsxEJaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=J8DWwZ
 hxKEm5F33vdKNAMB5SH+mHfGQOGxNzmtU5oFs=; b=mzbvz8foGxiUPNGFvAIygV
 Y/fR/ONb0KYUg05hG7dF3Cm59eWPqqGdf05OJRnIQAwkOGkTJMJdm7LxWgZ0AAA5
 bbGwRMLSomJiereXOdwG9mxvPfFJLM+aIrqdWulgethyLVwMfiymCQgnw3Oe3eGu
 GlRgns+jK4NekU+5Af9K8Pzj7qH0YWX1cr7zmVQUHptcBSLvrTHkZ29nqBIOPo6k
 JY75iW9k0nmN0SJYzA4iuyBobieUcqinJfdcuMPZvb7iaa/TH+YpQeTZ9ONrhsDm
 HiO3jOvhKUKdvON+Fa1Gjn6ezzBwGhyJjNvpzSjgv4CUcS3yDmyUfALVO0X2euhw
 ==
X-ME-Sender: <xms:RwtGYFZJnnw9DIApxa5Q57Wby4vIw7-IG95JgnlQ2snqsHECWF_HOQ>
 <xme:RwtGYMaZhrybUlbePclnYFj56Owzm-h9SUz-Q10k5ubH2VwJC9-iY2CqSRy8iWEY-
 1VeS9QkY0IeuId-UB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RwtGYH-1X6GMkxwcX_4UV3htsoJtsAPQV8EVBPSRQ--pnmq6Yym86g>
 <xmx:RwtGYDrNx2qGsZ6rkZHG_fAtJGJFBTv62siAQEu-wEIcqSijxrij2Q>
 <xmx:RwtGYApCMLNXx0-hUyyR_rx5Hb1upo6Eqp9Sl_SUUgVCrUjup60T4g>
 <xmx:SAtGYIIhgsutSFljcCtmJr5m637e1NOiUm3BY_NRwo2U6LmtcCajMg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28AB51080066;
 Mon,  8 Mar 2021 06:32:22 -0500 (EST)
Date: Mon, 8 Mar 2021 12:32:20 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 00/12] hw/block/nvme: metadata and end-to-end data
 protection support
Message-ID: <YEYLRNv79RGN5J6v@apples.localdomain>
References: <20210301140047.106261-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="axYxKbPUD0cZG6hK"
Content-Disposition: inline
In-Reply-To: <20210301140047.106261-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--axYxKbPUD0cZG6hK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  1 15:00, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This is v4 (RFC removed) of a series that adds support for metadata and
> end-to-end data protection.
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
> The core of the series (metadata and eedp) is preceeded by a set of
> patches that refactors mapping (yes, again) and tries to deal with the
> qsg/iov duality mess (maybe also again?).
>=20
> Support fro metadata and end-to-end data protection is all joint work
> with Gollu Appalanaidu.
>=20
> v4:
>   * promoted from RFC
>   * moved most eedp additions to nvme-dif.{c,h}. (Keith)
>=20
> v3:
>=20
>   * added patch with Verify command
>   * added patches for multiple LBA formats and Format NVM
>   * changed NvmeSG to be a union (Keith)
>=20
> Gollu Appalanaidu (1):
>   hw/block/nvme: add verify command
>=20
> Klaus Jensen (9):
>   hw/block/nvme: remove redundant len member in compare context
>   hw/block/nvme: remove block accounting for write zeroes
>   hw/block/nvme: fix strerror printing
>   hw/block/nvme: try to deal with the iov/qsg duality
>   hw/block/nvme: remove the req dependency in map functions
>   hw/block/nvme: refactor nvme_dma
>   hw/block/nvme: add metadata support
>   hw/block/nvme: end-to-end data protection
>   hw/block/nvme: add non-mdts command size limit for verify
>=20
> Minwoo Im (2):
>   hw/block/nvme: support multiple lba formats
>   hw/block/nvme: add support for the format nvm command
>=20
>  hw/block/nvme-dif.h   |   53 ++
>  hw/block/nvme-ns.h    |   49 +-
>  hw/block/nvme.h       |   51 +-
>  include/block/nvme.h  |   34 +-
>  hw/block/nvme-dif.c   |  513 ++++++++++++++
>  hw/block/nvme-ns.c    |   90 ++-
>  hw/block/nvme.c       | 1548 ++++++++++++++++++++++++++++++++++-------
>  hw/block/meson.build  |    2 +-
>  hw/block/trace-events |   25 +-
>  9 files changed, 2071 insertions(+), 294 deletions(-)
>  create mode 100644 hw/block/nvme-dif.h
>  create mode 100644 hw/block/nvme-dif.c
>=20
> --=20
> 2.30.1
>=20

Applied patches 1 through 6. I'll let the metadata and eedp patches
simmer for a few days more.

--axYxKbPUD0cZG6hK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBGC0MACgkQTeGvMW1P
DemtVwf/bLvcnDlMCENVFq1To5WXQpiJPMAcHM9FU9PKQbrZb8eGpU3rMyDoh4H9
EGR/fpGWd2v2ZuJtnqVJZTIYYtDYi7Qxukhevqss86jtUyaqyQmkMjMhgyvExGm2
5tNQfLnCcE7QzVHTesByNyG+j7S0vZV+Cqkv8LHLZDASoYvKTdx71EMbU/GcsDOK
1Unqn3+3mLaZJL0qvaBYnqH3wrB9ez7dHSvc5eUA13MTuqA6fIiWcZhzoy438cs/
Z3rkOeuCJyW8703Ghb2f/lNRqM/PNZ7WbO504l4wzVQtSfZoOwzSsLcObSWp3B/M
pngSBzICcgc9hxjU6Lvs931foFOJiQ==
=JAjg
-----END PGP SIGNATURE-----

--axYxKbPUD0cZG6hK--

