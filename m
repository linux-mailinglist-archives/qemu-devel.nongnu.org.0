Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1993C82A8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:21:03 +0200 (CEST)
Received: from localhost ([::1]:53052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3c0j-0006T0-To
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1m3bnf-0006Av-Sw
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:07:32 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1m3bnd-000871-Mm
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:07:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E474D3200925;
 Wed, 14 Jul 2021 06:07:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Jul 2021 06:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=23HvBHX49QTu0GAcV/Pld0PSJsM
 eUqj0OiCI59mJ1qc=; b=JTnUGtmfCbH9r8lYkRym6e2vz+cx/QkA3RUqXW50EnW
 SeVuVhxqDGdUrauO7GUeuvdJdZHM9eeRErj6MW9Si7f76Zk2UGOQ1ClaZDsWuBWX
 1CXyQKQpPsXgT0UpMIItLrYcihTRZA/5DWORG1kov0ZRSAIWITEMmOMB+ZDdWyv7
 qTs4GtwV9Wvn+hZEBzE1sxOd+Y2NbJigzqiv6UpzBFNqCpOmpHCe2jBcERKUubWV
 NAs9r/oDm70IPwT6WXWGutX89axsXxzTOYrMyl/eX9Lhrv2zwDj+LTfsv4DKdVJf
 AwcCUS4wi0Zc5xT2W2SIZeWV2dn4S9gozxoK9dux/8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=23HvBH
 X49QTu0GAcV/Pld0PSJsMeUqj0OiCI59mJ1qc=; b=aGVpqGp4gN2ODqWDz+fzpv
 shTQkMeWJl9POtczUOK8nDUvKLZwlNjijWGnS+K+V9rghp1D4sGs8SKyWU3sjcZX
 PbTRdRspMLFdH79GrvMgB30LU9cH3n4vXopPX/o/cqlqfM+x7jBfQw7Y+w71hD9j
 mNbIG2Tk86RF+IDisV2IhhenmmnFfcBTdr0kRQX8EdXlNpkS8s+4Kj9p6r1vQKOI
 DYwTAyCDiGUGAIS1RR4Mf1AnAF0DVZ1iD1xE6q9/bUZkZ4yx82QH+/bxbHd8N96g
 6akUoMDex4a9OmE/U9b78UVvo9c5mPMeN2CixaI/32jjJ5Y9JqyT/Rka4IJ3tJvA
 ==
X-ME-Sender: <xms:XbfuYKHOd7f1JhxOefeoCuTLZvR0i7kPvvfHMeLOw5bs67CWPVx4MA>
 <xme:XbfuYLW8CSR8PiheA7OGPU2ocKW7OCMcOnhNslFlwZzNf2dMgbONHd9Tfo4JbTkRU
 j3c-FvfCPOud8Odv2o>
X-ME-Received: <xmr:XbfuYEJP7PsGNxOxNFIuNgAkVcMRlt7F82MOojnO8Hs1JO48QtBMwp_XsX_qsDW0qeSRX05K3Xxbpt6M3LW98jrTrfr23T4iixsNQm2ix65lNCvRkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XbfuYEF3jiQIYoxA8ivOQa54e4aC_JPK_oy_OzAz2QV5xHvuGt1MqA>
 <xmx:XbfuYAXx_BmW95soU0snXhZIgYjwonB0y7a-F-T3orBbkvr-T6-2-g>
 <xmx:XbfuYHO5v1hjYINqNTO3yu437dLn23IF_DElmeH5vyYc_6RB0aCx4w>
 <xmx:XrfuYOw6E9e-yF0vMDkyAXUkWdAH5qMpTCvyJ_6K_vMiSjiAPATokg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jul 2021 06:07:24 -0400 (EDT)
Date: Wed, 14 Jul 2021 12:07:21 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v1 10/21] contrib/gitdm: add domain-map/group-map
 mappings for Samsung
Message-ID: <YO63WSIk04aPNWnd@apples.localdomain>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
 <20210714093719.21429-11-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3atTy/ZnqA/BluHf"
Content-Disposition: inline
In-Reply-To: <20210714093719.21429-11-alex.bennee@linaro.org>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3atTy/ZnqA/BluHf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 14 10:37, Alex Benn=C3=A9e wrote:
> Minwoo is listed as a Samsung employee working on nvme so I'm assuming
> the QEMU contributions are work based.
>=20

Minwoos contributions are individual/hobby-based, otherwise we sign-off
with @samsung.com (and use a From: line if submitting from a different
address like I do).

--3atTy/ZnqA/BluHf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDut1gACgkQTeGvMW1P
Dek8Jwf8D2eyayQAL6yJjejAO8Qf9lXWNe6LRXBS5zhZ63vva52vYpyDA3PfC76H
bWyVK+4dG/dKbXhvtgWm1ZvM2B0eHKL/xSV+JvO60yGOc9Q++z3rR2vjh8am5bd6
2yolqwUuiMLFmVziDS4owvexLDLc4mIV/fXH/LXPaMGtVJPDxeEeBbAmquDi4cuZ
X4FhTcJtWGXwN+q1XcwT0Q0I4pIzZ0vOpfK9dUvRD4GkiFrlJch+/SPkTBQ6np6F
gXrEbk8L4x/+MdrVElFQU5r3je2LVdqw1twcO4VxpKprJh9KyJ7B/Ao9kBYXSFpT
a30pebpsL6LV7p3Hg5tM66ZR4NCnsg==
=7pln
-----END PGP SIGNATURE-----

--3atTy/ZnqA/BluHf--

