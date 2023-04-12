Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAFB6DF17A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:03:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXJW-00037P-Kl; Wed, 12 Apr 2023 06:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmXJT-00036o-8P; Wed, 12 Apr 2023 06:02:51 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmXJP-0004vL-Qh; Wed, 12 Apr 2023 06:02:50 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id EC19732009A6;
 Wed, 12 Apr 2023 06:02:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 12 Apr 2023 06:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681293764; x=
 1681380164; bh=a1dcv5JDOvXlpfcbVMnDFJXe4RyB7N765Je1/oXPFiQ=; b=J
 7sySitmuZqGYa/fs9rN6XKiXDFPTC8hnNoGT2Z7bJcSAcbOUTXjIVsqGG4khkyXj
 HVfMviTITwR4HUa9qEDUaMM1lz9mUD0ITd5tTWLiTN48ZdBXAcMNonLM/+hpz199
 h09SOCLJIz/Bd707rZgeSvBAuFafx/0+dgNk8+E96In3cJhI9Ba8I0Ewr8c9aijf
 NKoFc2FBb1o7rnUqzBz+14ubtM+qSb+DJS5lDA6Y4ERncAyQuC94D6K4eAu2sY+c
 CQQ/7SrSLv7Oy3Sn5G49Si7Ro0u+Us2YI/KpFIdXwUv8aaGR2QKfPhx4guPmDrXk
 KsMoeOaMAqKZnspxz8iaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681293764; x=1681380164; bh=a1dcv5JDOvXlp
 fcbVMnDFJXe4RyB7N765Je1/oXPFiQ=; b=OmhqiQ5brYxfwIKA2txbGFWtTvhW1
 JkY4Q3eRiGQqKwKcPlRBr9UMN3t12LBFif2zD9C8Xkbre2X2CYlv5Yb439lX0PZK
 uG/757IBry+HgwhMqJiQUqvsQZotLm63pCfgHHYiLZq7fW1fIvJOIQCSKNZpVCSQ
 AJ/PHY6FRXevpw6Reb8aga9xYs0tZyGwk7l0NPpLFCExF5LIGqb9xdJkKU/YRCVp
 fVC7rUZQb5qCOqf73R0deB8LH10gmBshFnax9NpX1ijJjG78C9frN09eC4JvSuJV
 3o9ACtBVFmstCAdMXmeNJISX1SU96hEvXmQ9yHjXvRgRlHqH/EjxS8R3Q==
X-ME-Sender: <xms:w4E2ZHTw_TTnK9CJ-d6UcUJ-gYVIbs-zQM_og3c73pyzWWDE4oeseQ>
 <xme:w4E2ZIy1DUFaqHMPrAdRiwO5JLwkPkWMA3JCeCj6jLwvMh_0vRiH4aSkVpuneT6Ks
 z8H4TJl70sYn0EsAns>
X-ME-Received: <xmr:w4E2ZM1sYsA5WfxTIZmhidK-wqbxgNrmZZfeed686uyftLC5hBznG97iLrphesANx6jNLNSra0beJ85EH2QGLYzoX_ddKy4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:w4E2ZHDth698QrPnSlY_mkTVpbCtcocyoH_wUgfSFiS_d_MnC80LEA>
 <xmx:w4E2ZAh9thukzW5xTGjJ15lbTbzxczDcHzCHsRPJlgsnVDaojleZNA>
 <xmx:w4E2ZLoIT3XIKzWGGLCvughK8D8_XKv3P1UkNfYOtPxxZLtYqTJQvA>
 <xmx:xIE2ZKbjBnQ5CMibc9s2_oYnB__FmysN4gsfB3iZLYo4NJ8_7sc1jA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Apr 2023 06:02:42 -0400 (EDT)
Date: Wed, 12 Apr 2023 12:02:40 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 2/2] hw/nvme: fix memory leak in nvme_dsm
Message-ID: <ZDaBwLivCo9yRx/s@cormorant.local>
References: <20230411190448.64863-1-its@irrelevant.dk>
 <20230411190448.64863-3-its@irrelevant.dk>
 <b05fa5da-436f-7a49-7da0-3d17a13408b1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pndk831NWyouGJ22"
Content-Disposition: inline
In-Reply-To: <b05fa5da-436f-7a49-7da0-3d17a13408b1@linaro.org>
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


--pndk831NWyouGJ22
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 12 11:54, Philippe Mathieu-Daud=C3=A9 wrote:
> On 11/4/23 21:04, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The iocb (and the allocated memory to hold LBA ranges) leaks if reading
> > the LBA ranges fails.
> >=20
> > Fix this by adding a free and an unref of the iocb.
> >=20
> > Reported-by: Coverity (CID 1508281)
> > Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/nvme/ctrl.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 8b7be1420912..ac24eeb5ed5a 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -2619,6 +2619,9 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest=
 *req)
> >           status =3D nvme_h2c(n, (uint8_t *)iocb->range, sizeof(NvmeDsm=
Range) * nr,
> >                             req);
> >           if (status) {
> > +            g_free(iocb->range);
> > +            qemu_aio_unref(iocb);
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> I note the qemu_aio_FOO() functions are not documented.
>=20

As-in, "you are not supposed to use them" or "this should be documented
at some point"?

Thanks for your reviews Philippe, you're a life-saver :)

--pndk831NWyouGJ22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmQ2gb8ACgkQTeGvMW1P
Dek3fgf/cOCu1Pjxyt3eWF4vaJCbum/nVokbg2Hde5t3nAh1VE0fJdqNHaDfojzw
6hECeJvzMOQxIP2wriAFCgHgZBHzMj6Lz0cmyFU9q7RPNTx3rj1mi7PQ3CJbj72X
Lse2cTHtO4NQdwM7FmCuweSstd+FTF8N9gg/ThTdS9YyuKAL6ozgRBavexkti/Bi
SFiKrBaBGpq4rGD0MaKepgustctvhq/FgZfnc274s7B5e4U9zk7g1nVG20mM85+2
IPdu/08v2a8yOy1VzV9dusYs8iAhtfHEx1L4WNaiSES9cescrKPqxblAnUHDmUUG
/G8YBRcZCjHSs201QVcBImQ+jWsi+A==
=CQWm
-----END PGP SIGNATURE-----

--pndk831NWyouGJ22--

