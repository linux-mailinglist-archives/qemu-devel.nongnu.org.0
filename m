Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF334829D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:10:52 +0100 (CET)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9q6-0007hf-Qf
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9kE-0006Li-W8; Wed, 24 Mar 2021 16:04:47 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:52241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9kC-0005To-B6; Wed, 24 Mar 2021 16:04:46 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8FDAA712;
 Wed, 24 Mar 2021 16:04:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 24 Mar 2021 16:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=fhojXWJvf789Xfs7/z8VexUMBUY
 gXWVc2CI5arV4P2o=; b=lk4JyQ69Z3b/WZrWiBMH0ttjCd62m9JW5oPrYO2gocJ
 tA8Ij34pAelVIV0JCueHmr+3jmXW/1TMrfOGULwWlj0ecpkHZuNFP0FEit79y7CA
 jr5jXfeSwdf0rrUOzcOSUiufU5Ygdy4IBIkBzV6zxz0Jj50VyL8EwZIvnEBkvr3l
 xQLA5bLH2WyJz9FimgszVQ++pCLtKRYXbm/L9ICp+O4G+ln7ABy8HvjG6UjG+CUx
 0YYo7yQ58xbvY+QpQ0JJZiu9aVvgrxFTvPfginx1STvOkiQ5gwITjieGc+6cn9RJ
 sAwfSNX9z1mOrrXcl72NyJBSaZhFJH2W8qtHNBSB0JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fhojXW
 Jvf789Xfs7/z8VexUMBUYgXWVc2CI5arV4P2o=; b=I8Dft9kyH6SvkVzlVVlp7k
 7fmzedrewiSVG+O2WKkDbdG+Cat+X9S6mpKlrBP5z75yXryzxf2+xBoEF2Mos/X6
 Jv8oCrDj0zX2hZyAsbA+/N3AK1sEMin7fMn/9JrlUbAd3wHkyoV/4VLJeutnjz7X
 yzb3BzNndAcd4hU6EL805ZQ8PMZQRkM0JT5sCtdD3mnJXNybFatNEqzWpVjiPasf
 qulSQzFuOFsOjfQruhdqOA8Syqw75z24csF4/MF3nzS386VUES2ibCHWUG0gMIwZ
 9fh0v7IUBHpXdkgBvhJSgxbDKs9g0HCW9spwFzXlS1WQrEAc2A5OQqzJSPUjNtAQ
 ==
X-ME-Sender: <xms:VZtbYM2csEkj4kxQg82H1JhoC47x9Um-8xVaMkpFdpSeJHB97bh14w>
 <xme:VZtbYHByhMjdh4Y4W-S5fEHqgAbGY7AHH_E7V3GqxRB07nHMt8sueAeHOAdVn79QM
 FZMJ5KtwhVwUIGkj24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudeftdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VZtbYBxPmp8gP_0zUP7_GfiNKH4GjIrIYVBpmMVzPzGp36_M9jOmgg>
 <xmx:VZtbYNnDQY_MeGeg8ud4oX3GFNuQcS04tYrb9AKIlUpTr4dQHJqmGQ>
 <xmx:VZtbYOFiAN60ndNh5yPkfR27hg3Pkxi1GvRIn2S_H6exzv2RCi15jw>
 <xmx:V5tbYGoYKgbIn_mqkjszQgbJi7EpZ_Czd8-jm6KxDOAQ7RXy_sGFyg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B3EA3240428;
 Wed, 24 Mar 2021 16:04:36 -0400 (EDT)
Date: Wed, 24 Mar 2021 21:04:34 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] hw/block/nvme: coverity fixes
Message-ID: <YFubUrOXZPKzXO9a@apples.localdomain>
References: <20210322120944.225643-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GZlnYlxCHFMf7GPI"
Content-Disposition: inline
In-Reply-To: <20210322120944.225643-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GZlnYlxCHFMf7GPI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 22 13:09, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Fix two issues reported by coverity (CID 1451080 and 1451082).
>=20
> v2:
>   - replace [2/2] with a fix for the bad reference counting noticed by
>     Max
>=20
> Klaus Jensen (2):
>   hw/block/nvme: fix resource leak in nvme_dif_rw
>   hw/block/nvme: fix ref counting in nvme_format_ns
>=20
>  hw/block/nvme-dif.c |  2 +-
>  hw/block/nvme.c     | 10 ++++++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
>=20

Gentle ping on this so Peter can get the coverity issues off the list ;)

--GZlnYlxCHFMf7GPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBbm04ACgkQTeGvMW1P
DenUhQf+MZuY3W8qecihsSRzioumXYJ3jGW9vaHQV0zmHHoHZweJp8HnhQI7jY5a
6e4QIdGY6xVjsM/LEDVm/GZ0GEzXLPJO0GM2akG3yeAqKmgLVdOU0Lx67AdBB9/e
o559ai4CGDhag11Dw4/ehwQTtoRL/U6oJox84YJGaAiqKskRrl70jiI2HGvTmb1Q
rrV2tEObuD1KLsZ8YrD4XpLmUsvvIeRley7PRELt5GDNjA09ff0yTM9H0MUB9y8d
mXNM62blnH/NgpNpOVQKc2B0xJBybOXLZSudhQev7ygYWOLUUs++Onb4h1KkCyf2
3Nv0Z4jER1CG+M3oNGtFezm9KuhBsw==
=rvvD
-----END PGP SIGNATURE-----

--GZlnYlxCHFMf7GPI--

