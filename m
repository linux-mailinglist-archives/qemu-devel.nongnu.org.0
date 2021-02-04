Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D4730FC56
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:14:42 +0100 (CET)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7k5P-00062L-Eu
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7jR8-0000r2-DM; Thu, 04 Feb 2021 13:33:02 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:57915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7jR6-0003ab-QC; Thu, 04 Feb 2021 13:33:02 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 039405C006C;
 Thu,  4 Feb 2021 13:33:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 04 Feb 2021 13:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TWNcmZPoNBIkOWC+3950PBRpP8f
 bYxzm463Oy9zbjo4=; b=scMzuFLYEUWD/oWb+g0RewWTOPvkW9HOS3c1WQ9Imn0
 BQHwooSz8JXPQF4aDlqi4mEthwPK6ISF8f6bcpLsvV6+acwVLcOQaGXgVCT+Ee2k
 UH7YtYyQBbb3La1i3kMaM2iMohVnjhgnhPRyJEkY54VQNS20xOYIYhlSIK5mIpWT
 xkY0r2Fnfjf+tqHgNeCegO5q3YsNdgHZP5kz6XbTUFjKNMBWgawOvAsG2Pzmr4C9
 6yBSrwwCNpGX40YX0w2U88jqZnN3hE7Ng6nz1CVFbForYahVWxS5w3RXvSNSilpv
 V8V6FN/vkr6HHzceYGssSIuU9vyZirINyA8YwHNjtgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TWNcmZ
 PoNBIkOWC+3950PBRpP8fbYxzm463Oy9zbjo4=; b=VEVv2mGTYidczQIW8I86Th
 VERUVQeNRn1YrtKjtmX8P2nILkbYu1pq8XPOYlNfMWeviKwxIZdKo26mkDNC+kwK
 KO5XDcJKjYSDDs2UceiFJ7jswfxG36Z7dJcO7McO+ImYYL+XVcrlskMPD/SOOzXf
 QHTbwO66NbcldUKl8mRirn5cJJRyNsGl9KBeJYYXLiUpFxuXveXXvS1B2VC8NhiB
 J//LxUadY6oEUY6Dz2N4YfEAGNI296pEX3MXsmMdwn6kItCJE1VHwYmE4U0H5s0Z
 tFwAz7EcvbR/7O/zTgvcfTvztsqaT/zpwoa9UEV9oK58ULv3dnkZvRjvczSC2WvQ
 ==
X-ME-Sender: <xms:2j0cYNlXHr9fxtGQSmXzYxkfUHqRFZkV7QYifDusxWp8cVsnyxAgKg>
 <xme:2j0cYDZrzjoNlxA8_QC2nCR8mldvsa1mEXWULssZOM--WciXFtNkcAoJz0moX2nLQ
 4M8cAMYcfMb6QNpUrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeeggddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:2j0cYAM4HgH94KlqisW_SaSHbJtvfoBrgqevGpkpI1KiwN75I_QkfA>
 <xmx:2j0cYAbBNYphgNWv59g_JRyBucQFXxCKjDCv_rvkk0SgAuEjGZLbIA>
 <xmx:2j0cYG3hbJgyXXVOuM-qn6wBapLxUKwe3n-ClkZ4NHJHrzYjUy9gQw>
 <xmx:2z0cYDinKIxSNnJfcJd5qZwxHs9RlQ2Kycp8eurSCUZ7PzbO_NmgfQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC8591080059;
 Thu,  4 Feb 2021 13:32:57 -0500 (EST)
Date: Thu, 4 Feb 2021 19:32:55 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V6 0/6] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YBw91/sHjRSMVe7E@apples.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <YBw9mvw3xzT7SUMe@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="628NBmuWgV6en9bf"
Content-Disposition: inline
In-Reply-To: <YBw9mvw3xzT7SUMe@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--628NBmuWgV6en9bf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  4 19:31, Klaus Jensen wrote:
> On Jan 24 11:54, Minwoo Im wrote:
> >=20
> > Minwoo Im (6):
> >   hw/block/nvme: introduce nvme-subsys device
> >   hw/block/nvme: support to map controller to a subsystem
> >   hw/block/nvme: add CMIC enum value for Identify Controller
> >   hw/block/nvme: support for multi-controller in subsystem
> >   hw/block/nvme: add NMIC enum value for Identify Namespace
> >   hw/block/nvme: support for shared namespace in subsystem
> >=20
> >  hw/block/meson.build   |   2 +-
> >  hw/block/nvme-ns.c     |  23 +++++++--
> >  hw/block/nvme-ns.h     |   7 +++
> >  hw/block/nvme-subsys.c | 106 +++++++++++++++++++++++++++++++++++++++++
> >  hw/block/nvme-subsys.h |  32 +++++++++++++
> >  hw/block/nvme.c        |  72 +++++++++++++++++++++++++---
> >  hw/block/nvme.h        |   4 ++
> >  include/block/nvme.h   |   8 ++++
> >  8 files changed, 242 insertions(+), 12 deletions(-)
> >  create mode 100644 hw/block/nvme-subsys.c
> >  create mode 100644 hw/block/nvme-subsys.h
> >=20
>=20
> Thanks Minwoo, this was a super awesome series.
>=20
> Applied to nvme-next!

By the way, we are really cluttering up hw/block now, so I'm gonna
submit a patch based on the one that Philippe did to move the device
into hw/nvme.

--628NBmuWgV6en9bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAcPdYACgkQTeGvMW1P
Denu2Qf/Xupx5b51MM01KT2Tb1Azh/qZLk/G08hXz/eA97FLCDkS6wtVerDfR/rm
lhc5FjmA1HaSxbO4xeKsNfX8pBDi174vnQtP5dpFA5ODeiI9lqKaJZ+OIySMnTV0
MUDqkSlqHSOu+bl1sLyiH7nQuTOuuKm+7XnhAqLWpWtGBW2kqlfS0aXWKxc8IPNE
Cg5XIcdtGtrrhwZt17n470hm9mfxNO4rFpYcUo5KC4jOHpZUVNvCRKBgSfPfdknE
CzcV7JR9lk6chHKZ2mz5iHCcVJYpeX0XnsXHhurKPN4g0mlDd3MIcelUu5p09ML9
Ysi8uPtCTAAxTUHPftr2+wcMtOgW6w==
=tqrf
-----END PGP SIGNATURE-----

--628NBmuWgV6en9bf--

