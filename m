Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962663F7506
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 14:24:22 +0200 (CEST)
Received: from localhost ([::1]:34026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIrx7-00089D-BZ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 08:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrrZ-0006h3-Gq; Wed, 25 Aug 2021 08:18:37 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:38519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrrT-0000nB-T5; Wed, 25 Aug 2021 08:18:37 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 402735C0131;
 Wed, 25 Aug 2021 08:18:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 25 Aug 2021 08:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=IVfnHR7S2noGD/mqzSb2OA57FZe
 7ztvGHSnP+r6Dnrk=; b=cOCLj4ROKbIfud/dGsexN8IfPpxlBA+KNAjE35n2lrF
 uBnJbv9kh4tREQy1Nw7BKCYI2x6liXxtimtYXRcDh+Eg94+jTDaGIa9KOiK6+DC+
 Y2QmT5cGK65FxU28YJ1mOW6E/GVgyU7da+Qevbc+b/peDcB7MtTo+aT2SNZKfFXb
 ka3rXk2e0sHcttWnhGllmppsK1TYTa1NChfVihNy7JX42JdrK5DRnGLjTJFDnNW3
 JnTyi1pgj0Zeg99BiPyms0U+yTCN2NVx5nXYEse1K3jzJQViHLxa2Gh2MRfcZfdQ
 SgICLyz/q7X1AblWKMIeX1mCuwLipmQmuBC16XwvN6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IVfnHR
 7S2noGD/mqzSb2OA57FZe7ztvGHSnP+r6Dnrk=; b=am1I/hQCS9J2nFFNsMRAC+
 JAH4X1kXLlMOJVNrtd1dSMYT3S/tLE5St+sE+vHxwP99Gj2D/RqxkXhtuAX0azfO
 yMezLrHsJ96pndkCY1ABSLt4ApzJyxPGD9LM+pRNYGVAwSw8MsXoXiUudQovOCbh
 qN6K2wAwEwo28mcN0dDIX3l1goC1lJTjh73jpRGkYb+Q/0/cGzYIkwgBrbclHLTJ
 cyo+/2FV7C37YAlJYLeWdRsuNnU/1SQqGC/3bUGHWYi1elXIMdekW2DjGqdjYWrx
 wZehCOgfGQ9KxcwAWhWEvDOMr1JTef8N9zkF6rwmQZC+hxIZqoZvo3Q9hlPQ92rg
 ==
X-ME-Sender: <xms:FDUmYcz7kjCVpbRhum4op7fsM8s1btfAnuwLjjv7hr6_ilT3tYsSgw>
 <xme:FDUmYQSa1Ay5onGY5-_qpZUbQi2poWD3G8SRLwl5C5-PAyrOUDAQPicOSF5-mC0Sn
 lVFDJGirge7Xb80NMc>
X-ME-Received: <xmr:FDUmYeWD9eMRpzLOx65Xs4R5Ygrmm8fB9O3Qype3imkZu7UnnRo-TxVmh2HEpoES6nW-QiayUxTRshMPPjOKbh_zI_tAUDYuZrT4XavBIAu5HypJeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:FDUmYahSCBZpHDvGd0rM6s2ZbS6EJg192MvoGH_17KQb8daXiZcx6g>
 <xmx:FDUmYeDl8fo_wYqTlSp_N3SyaLrubIgNLZtRuztQ63EPZJFvGNuTiw>
 <xmx:FDUmYbK87NhVtNnZcCgp3z0QcmIJkzDzGAUO5R3wd2XqZPfw5S2IAg>
 <xmx:FjUmYa0v0adHMmm10dYjfu1snlPs5fzqiCq2k_w3yfJTzWAele-iqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 08:18:26 -0400 (EDT)
Date: Wed, 25 Aug 2021 14:18:25 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 9/9] block/nvme: Only report VFIO error on failed retry
Message-ID: <YSY1Efn2r0JS0SW1@apples.localdomain>
References: <20210824141142.1165291-1-philmd@redhat.com>
 <20210824141142.1165291-10-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UuG4h3If/6oXeNzk"
Content-Disposition: inline
In-Reply-To: <20210824141142.1165291-10-philmd@redhat.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Tingting Mao <timao@redhat.com>, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UuG4h3If/6oXeNzk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 24 16:11, Philippe Mathieu-Daud=C3=A9 wrote:
> We expect the first qemu_vfio_dma_map() to fail (indicating
> DMA mappings exhaustion, see commit 15a730e7a3a). Do not
> report the first failure as error, since we are going to
> flush the mappings and retry.
>=20
> This removes spurious error message displayed on the monitor:
>=20
>   (qemu) c
>   (qemu) qemu-kvm: VFIO_MAP_DMA failed: No space left on device
>   (qemu) info status
>   VM status: running
>=20
> Reported-by: Tingting Mao <timao@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Neat.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--UuG4h3If/6oXeNzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEmNQ0ACgkQTeGvMW1P
Deng0gf+PsqQD8Cb71mx4GF3DPgJL69JlXLZCkDvwWGfw0FdVvMzTdEXABiufA+W
DVdVvjF2H8yViCZHYRBBB7kHbtcmcWjgs/Te3VqpR832nC/xJmy3xDnA9U4h53KH
AUiyk8XogfpA9HIroEZ4HxJ4Hwje2BP2Y2XS+uBA7Q/mimbKHnJC+YJl6WlEjrL3
1fF0zpgsFxcYFpWuFRZH+RpxSAZdXtzAfk4qDnzJE3OjZSeNcbKC3VMlVtaBdQ10
9kD3YtlH3mn0WH7LCxqBs5zBGjrgVVSLaBiffBXhsZHfT0wT/fuF4NZm9xqY3yyw
Iv3HOD/QB4B4q7WkE4JSrTXavzbsTQ==
=UxMS
-----END PGP SIGNATURE-----

--UuG4h3If/6oXeNzk--

