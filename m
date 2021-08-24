Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D863F5799
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 07:30:45 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIP1I-0000zZ-1K
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 01:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIOxD-0008WJ-Rt; Tue, 24 Aug 2021 01:26:31 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIOxB-0000sC-IK; Tue, 24 Aug 2021 01:26:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C9AB75C00E2;
 Tue, 24 Aug 2021 01:26:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 24 Aug 2021 01:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1B5o3MGNAmHT9V+LjIl3VdHgqFr
 j1hBKM2YldIOteTI=; b=OMhFFyFKydA4JmgFSxD5N/3jXb6+OegN7CvGVtt8mLm
 fRLwVu1IrH4nflK0Fi6OrmwkS46wFeVDyZi5FVDcXyQTjnZ6WR9pGCWSyZfN4z63
 mVvgGt1UKvKxGiZhMTxzMk7V4ZuxSVX+GFEa8cSTN3zJTlknM9hVEJ8vx42USaax
 ur+7+pHzGmbeTjEMtEiDEUpHCtyvhdtgJq17y8YmuQXs6idbAmfmkFlKjA4yvx/3
 8cB5DAmzUAPekTPO8ovG9IpxUO5iD121spX3titmjbVv4joCxv4u0GSiQDOK95oP
 R4nFUWdgutFx+wd3URaJZfoO9cOKi0yyhu0uZB0rq7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1B5o3M
 GNAmHT9V+LjIl3VdHgqFrj1hBKM2YldIOteTI=; b=DXrU3K84gmaqM3VhxaGQ2o
 al0/emF/H0kqlgO3wRo3fgku2Fket4SVFaDhCZuv1hZUZ19eVYEOBWZ20VuvNc71
 Sg0/vRypt0ciRLvR7PtGVEA24S47UDKpybDtG+9yX3T17bL2zQM8vDOTQFIzj49h
 cDHzKZchQRE3c1s0yMhH6e3DK6LscQ9rv2XS3VagxrH7T7uEf9jgT0oXKxFJgDSl
 8lyv2fjx4AB46OiK/bDNDsWEjeIZPHTcq+nBp4OavkKdBbZJfa5KhqavqnkF4qLC
 /tIMGo2SUHPyNmDIc/AnCoocAc4g5DvVlB9rENuBxV2o0SfEUqAYFWmPkn3KSxTQ
 ==
X-ME-Sender: <xms:AoMkYaiwnNU2GfEw1fwzIWQ3IxKgG1GmA8OUvwwXN4TEkCNadu__0A>
 <xme:AoMkYbBDRI0jscmOYUZb085ayT-eZANVrrmJDm3PnUrDDVVVW4Z4_qQYErW6A-168
 XRZMy8OJPwaAgSrL1g>
X-ME-Received: <xmr:AoMkYSFKgXiz7xrZNiG2qsWGFqS3N_hiAIgc1t1iMwVOhzMcrQ09Xmic-Ntgt7Iyrb0z5MiFrNEO-EtrURTKXu0X12VlcUQCwA3Bvsq0q2mIrf0dhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtiedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:AoMkYTSi9bCRhnId68jAZte9jOO5TasLwdm4xEFfY6qgRYCGNbAvLA>
 <xmx:AoMkYXyMhOQnHPiRv3yZ8VaQo7NuVt-JbxQBEfTXx2GXYVLyhLmA_g>
 <xmx:AoMkYR7V3e2ilr6pHgJfPQQnhb4vOCgpqVP0j5SgnyN2RrMFIcgTCA>
 <xmx:A4MkYX-A9MWhHB0cRgVjqvIJrMKPtX_HoV4Gk1drXYbsRzHxr15hqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 01:26:25 -0400 (EDT)
Date: Tue, 24 Aug 2021 07:26:24 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/nvme: fix validation of ASQ and ACQ
Message-ID: <YSSDALW4D0lONGHd@apples.localdomain>
References: <20210823122018.401370-1-its@irrelevant.dk>
 <20210824014748.GA64408@C02WT3WMHTD6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ccHo8Ir1q8F218io"
Content-Disposition: inline
In-Reply-To: <20210824014748.GA64408@C02WT3WMHTD6>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ccHo8Ir1q8F218io
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 23 19:47, Keith Busch wrote:
> On Mon, Aug 23, 2021 at 02:20:18PM +0200, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Address 0x0 is a valid address. Fix the admin submission and completion
> > queue address validation to not error out on this.
>=20
> Indeed, there are environments that can use that address. It's a host err=
or if
> the controller was enabled with invalid queue addresses anyway. The contr=
oller
> only needs to verify the lower bits are clear, which we do later.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>
>=20

Thanks Keith,

Yeah, I noticed this with a VFIO-based driver where the IOVAs typically
start at 0x0.

And yes, I specifically refrained from adding any other sanity checks on
the addresses. I.e., we could add a check for ASQ !=3D ACQ, but who are we
to judge ;)

Applied to nvme-next!

--ccHo8Ir1q8F218io
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEkgvwACgkQTeGvMW1P
DelBgQf8DZBOJpc2xuUqyGHkj9BD9cP/MF8Ge2ahCkaCh01vkI9P7HURiTiRT1zd
Qic/wovyYwjAfpa1X/dGWlYUyiRM01MQBt9dPvGscDynaBKnLHWzoTlGraUvbRdK
UBKNMkE6+b276hFTNICLaGpzvnZOmRd0RY5wNC3dWNys7I61aalb5Zzij3ne3dHT
UJEyliZHlA+7/rFPZB9VDCQoqX00zXSApQ4zNYxZ+EBXcgJXMe/fziPDR1NQ2Zqa
AMM8RlOXLXflN2xcUnGhUgR1PA7U6gkEWIISacWQvxsct5fnZwLFYWeq88YuLg+e
pfzcKRBDuL98HUsaWlTL1Tf4cPisAw==
=GKQD
-----END PGP SIGNATURE-----

--ccHo8Ir1q8F218io--

