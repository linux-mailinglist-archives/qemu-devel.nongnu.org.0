Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A972C1768
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:13:49 +0100 (CET)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ9e-0000uo-Ej
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khIiW-0001by-WF; Mon, 23 Nov 2020 15:45:45 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:51647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khIiU-0001Sf-4K; Mon, 23 Nov 2020 15:45:44 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2AD791A76;
 Mon, 23 Nov 2020 15:45:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Nov 2020 15:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zb/tukUzDqC5CeuzrC8VH8Gze+h
 GP+49eu1ysv5CXCo=; b=x1xyE2r+pwZh39jhgJKP9vwTGTbK/Y6PhvMGw61igYR
 HPgBvJDyzhK/26Hxx1OfgMlXgAiblQcGZ7ww0sYxzQjAiEQo1dS1jZrgaqWITco+
 w4m+g2lKjpaHdsAgPi+ptagC/G+Me1zzWRYHJDZbwMAs06uOmHBYaPLH6AjZmmbK
 onQhsX65aFfzgBC4EzhnR2SvvNs4bpIMrO4tVLh5V49sBMesHuAsNJSMwF4TPSfm
 FjJnoWfE+PEel+A3P0KPOLwygK+pQeDWcdWZ7hT4p8Gp1vWDVo7cFqxnpnBVoyF/
 +6BG45mLnGWF8Sc5C1GCzgRSqeKSP8GYSdIxM9eks+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zb/tuk
 UzDqC5CeuzrC8VH8Gze+hGP+49eu1ysv5CXCo=; b=LStRaolv7Nr2/kQlBuzywc
 faYWSTMH7ux3NttLRWhh5upqq1sWy9c6fziBjdeN6wvUsCGhmgt278J7GlOqWX9v
 KgQp0LC9SImMLLpqwRQtibYEvcXSTIvDZsHhHIkmZ9liHKwolG24hmCuJBYuOeMM
 k/IiI2qmjHAnE7ofHIEbjxh1YP0d9+unCO+2fuO2u91VJuvaYIgtYtLmibqGoWO8
 hXMNMJ6xWNJsTozh5ZHaePFk0YVTAhc8SI1yjZAxMdy/fGY1C851rxeDSafLjjSA
 VtDjqvosM4iTKhIYHw1dRtGJ931VA9oOBfg6nHdbw/zOM7oTkWour0c7MJwgTV2g
 ==
X-ME-Sender: <xms:cR-8X3n8tEUBqoPSBnS8XCBKB7Mc0pJgShdJup1LqSlLK4TVJRf_1Q>
 <xme:cR-8X61RZj50sVjQycROZnY219zHL8ym443zLGAdYeIU_5zbqc2sgHBJXAT5NBPeV
 3Ht6h-slkIaNxSXhbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegjedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:cR-8X9qMzsdwFiexs9a4QLlPtVzC9GK07CDIiNK7qGHsIg30H_UdYg>
 <xmx:cR-8X_lAWc-XLjxHWdV4bqwzbLEK3pY-VBIeW18XPMmS4Ii6M4F_eA>
 <xmx:cR-8X10kMIkya8E2-he4t4ZFHuNLM7vX4cYQoId-Yl4p8j3Xq2yKww>
 <xmx:ch-8X98w79w1-j-ViM8rWnZGvY-en1cVEmHqoPhB8G0BKip8kxLO_g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20CF9328005A;
 Mon, 23 Nov 2020 15:45:36 -0500 (EST)
Date: Mon, 23 Nov 2020 21:45:34 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v8 0/5] hw/block/nvme: dulbe and dsm support
Message-ID: <X7wfbihVNUIOBbb6@apples.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WGOtyXrZx7yCoeC4"
Content-Disposition: inline
In-Reply-To: <20201112195945.819915-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WGOtyXrZx7yCoeC4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 12 20:59, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This adds support for the Deallocated or Unwritten Logical Block error
> recovery feature as well as the Dataset Management command.
>=20
> v8:
>   - Move req->opaque clearing to nvme_req_clear.
>   - Add two preparation/cleanup patches.
>=20
> v7:
>   - Handle negative return value from bdrv_block_status.
>   - bdrv_get_info may not be supported on all block drivers, so do not
>     consider it a fatal error.
>=20
> v6:
>   - Skip the allocation of the discards integer and just use the opaque
>     value directly (Philippe)
>   - Split changes to include/block/nvme.h into a separate patch
>     (Philippe)
>   - Clean up some convoluted checks on the discards value (Philippe)
>   - Use unambiguous units in the commit messages (Philippe)
>   - Stack allocate the range array (Keith)
>=20
> v5:
>   - Restore status code from callback (Keith)
>=20
> v4:
>   - Removed mixed declaration and code (Keith)
>   - Set NPDG and NPDA and account for the blockdev cluster size.
>=20
> Klaus Jensen (5):
>   hw/block/nvme: remove superfluous NvmeCtrl parameter
>   hw/block/nvme: pull aio error handling
>   hw/block/nvme: add dulbe support
>   nvme: add namespace I/O optimization fields to shared header
>   hw/block/nvme: add the dataset management command
>=20
>  hw/block/nvme-ns.h    |   4 +
>  hw/block/nvme.h       |   2 +
>  include/block/nvme.h  |  12 +-
>  hw/block/nvme-ns.c    |  34 +++++-
>  hw/block/nvme.c       | 258 ++++++++++++++++++++++++++++++++++++------
>  hw/block/trace-events |   4 +
>  6 files changed, 276 insertions(+), 38 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Thanks for the reviews everyone; applied to nvme-next.

--WGOtyXrZx7yCoeC4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl+8H2oACgkQTeGvMW1P
DenH0QgAmyQYXNJ0vZX4YzfhneBa7GVHPEnV3tUUR4IU0nL3l56Tdk6p3J8qKttc
4W9EY+pIND7wFUKjo0KDtvqt+QJZVb405zI4BSDTUgtTqS4Ls466Kpxqc7K98e4g
ak4SQJ/q05OsOPAiuL7x7rroniyNyrW9FbMfK7AFwjHWbD5dAV37kuf7Ru4KtOeK
cq/PQUZFDfa9goTD/82O9jurVsz+qu/nSvLMHUzeWaYX0Gt+7z1iViyw22/FVdBI
XgWeEykL3zqyqimlv3NI5ZyJpIOD1wwkUXXDSt23DxA/VUpCV70o3nUoo2F9JSgI
TL/zSXuiTIjIb+KlGVKrTpiQ4v4IbA==
=s+M+
-----END PGP SIGNATURE-----

--WGOtyXrZx7yCoeC4--

