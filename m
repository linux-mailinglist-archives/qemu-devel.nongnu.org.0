Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD936DF0AC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 11:41:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmWxm-00030l-GJ; Wed, 12 Apr 2023 05:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmWxk-00030X-7f; Wed, 12 Apr 2023 05:40:24 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmWxi-0000Ae-F0; Wed, 12 Apr 2023 05:40:23 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F080D320091A;
 Wed, 12 Apr 2023 05:40:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 12 Apr 2023 05:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681292418; x=
 1681378818; bh=K83+0GEUN9qnzX+MtdBRjE63dhIn48A9gS3ZEIivPYw=; b=m
 45KcehvQXmIPM5pOCUjb5JoT7PjUXA5NqvmlSqHRkWL2hLhsyfWWeUtoZBR6AdbN
 COFMXM8/GlptkrCzPUxZDP/4kCY0BjWUNRjqnEhalY5pi491s8LehmJsYIWzMs+z
 hAI9txXRQTzaXQh0yQzPjYtqJKS9utAoHfpqUEA+Z/aR/MAh0GvaO1XaBqlxPRoy
 DA/r28l7noY4Qp+UKkaxO9JXVuWic4L2ykmunKXiHvTw5iCv6eZaS343OqEYtzOd
 4+QwjsVLjSoP52BKLNwK9xvdmZH7GJi/7f9wqH7TqVLumrMBQi4C3rHi+b8ulthK
 759AOsRQES5WUEnJIENkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681292418; x=1681378818; bh=K83+0GEUN9qnz
 X+MtdBRjE63dhIn48A9gS3ZEIivPYw=; b=eWFAudYK6OPke1pp1dVH1ieqt5/gs
 5p+2UDe1VJMqPgU4t4F68tUdesMv9nW3BJcCqeZxrUNxoOSyjGa/c2roybsqz87j
 X8z+dezmyfvgDMxfhdmKv/l9n7GM0/GwdggE3Ie+PS1ywLj42n0YeKbH8nzSHehI
 uGCfpgdPCn4xkzoXb6GKSR6ePrvcnO+R77Zq7EfaRyDhBPH7ARp+H7wWXIlenrrw
 gJI+m4hN+EuRxpVgvSHW4I2vvt9s4nZmZfHvZkYZsEFU65hvK1yP/xdJygxn18zJ
 6mnqQ8E6Q00Q2WzIvlygxfEZ2WARjkHaoHPTYLv1FLRdJ2WlAtALpPrZw==
X-ME-Sender: <xms:gXw2ZNQhfHILeyBKEKpCjzYq4u7ULXVYF2x78fJi6G5lh52ciWFnIQ>
 <xme:gXw2ZGz7pJQHr5HEx9-BygQP-hRrF3i-xqc5sn1n71Fz9iI4h-BZxlJ96PI8IvAlu
 wqjA1lKZjl0pH9hGIw>
X-ME-Received: <xmr:gXw2ZC1tEutGZf7g2cfIUvj83oHL9qDFE9Gz1ATuqQOdZej1vitKLkkSsNQYW5FWty8q6jV0_W1_Cds-23nbmDo2WxKa28Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:gXw2ZFBWTpUkLZq2aztJ4uC3iO4iMDF7IB7BG3UR9zaALD4MCvr_Aw>
 <xmx:gXw2ZGhk6iEidy1OW4Qll05CbzOX99TS-wCDzEqyvUXA7cW9SkeS8g>
 <xmx:gXw2ZJrMyEfVKKbiQOBqwxH-B0IUqKM4hb000Iw6Y_HGQkf-2ImLiQ>
 <xmx:gnw2ZOfkFYkEWUg6S2qLLYA1XwQT_Yw1BvJN6X-cPpX-Dg03EACuSA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Apr 2023 05:40:16 -0400 (EDT)
Date: Wed, 12 Apr 2023 11:40:14 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 0/2] hw/nvme: coverity fixes
Message-ID: <ZDZ8fqM9QVghcfuy@cormorant.local>
References: <20230411190448.64863-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RNNyEbBiDXnXoZoT"
Content-Disposition: inline
In-Reply-To: <20230411190448.64863-1-its@irrelevant.dk>
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


--RNNyEbBiDXnXoZoT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 11 21:04, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Fix two issues reported by Coverity (CID 1507979 and 1508281).
>=20
> Klaus Jensen (2):
>   hw/nvme: fix memory leak in fdp ruhid parsing
>   hw/nvme: fix memory leak in nvme_dsm
>=20
>  hw/nvme/ctrl.c | 3 +++
>  hw/nvme/ns.c   | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20

Peter,

Are you willing to merge this for 8.0 without additional reviews?

I'm pretty confident on my fixes.


Thanks,
Klaus

--RNNyEbBiDXnXoZoT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmQ2fH4ACgkQTeGvMW1P
Dem23Af+Llk8I5lH6Nfo34JPQUjjCnk7srat5+7QtPIx1rsSLm9B1VwrkAOgAVlE
ifmief513vIJa77MHvoVmJSMYtnaBLsE9tQlnZthXkK0nSv3fKpdgnOn0Uk2S5Vt
Fe1dUAnlifvDPRoSPbPnlUb7Zt6aZUeDjpK0LcKpKmgMrmn3qFdHTMty8het7N4y
zeTAnwrvMJOHYt/Po+PHLTbO7CDk+SXlKjc0+Y9aN0oXMD5bRNyckGy/B0IiyOcc
kwMxALOw6cwq9NOFcBOYyea+2LMszbmZf0CEoMj9JbnVsgugLp0nrjJIk50pOmSj
Z2nj6P5O0FFPSTHm85n7tTu+ovlsQw==
=KDtm
-----END PGP SIGNATURE-----

--RNNyEbBiDXnXoZoT--

