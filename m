Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF33171D0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:00:01 +0100 (CET)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wae-0004ee-2Z
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wSt-0001yQ-Ss; Wed, 10 Feb 2021 15:52:00 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:48693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wSj-0004fe-Hb; Wed, 10 Feb 2021 15:51:59 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1DD8658003B;
 Wed, 10 Feb 2021 15:51:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 15:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=4kBlyHOnLjSz/Uo6jty/BoCcDYg
 RaeOlVy+lhTNNrOQ=; b=leFYhIbhJCjfqONQ2WJK20DYjlMPsHv/Jm3ewB1R/fC
 BDvrLmLcmFPQzSr4uAczncPBs2QS9QlTC1TEVUMVf97mZLFPGIRzJWBx6enzSdxI
 2YsO7/QrtWvdyzc9XrrXTh3LtA5FE9oO9x/2C+uhxnhS/lrZ0Chv7v6qZz3P0Rtd
 SbgPR3Ln53N+fq5h9ebRCowCwAMKOQX48VL34xXXTWF2ylh8bRuQx5NUJp6sLgvd
 oPf3yI002x8XvAbWFpqaptenWziXSG6xGL92FRvqRmlP4Arpp1QeNe079/ujH5qx
 85Pdf6/7/iRQlrWbbE+2nu8DwFd3XaV7yMQgXX6Cb7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4kBlyH
 OnLjSz/Uo6jty/BoCcDYgRaeOlVy+lhTNNrOQ=; b=NnZw9EQRX6SCuNUwst2edj
 s88DPFu5HZdPbURQ3ssx6njpMLYx1ZS+t099/VoT45aQFa/zlp0z58eQFzbK62+I
 WoH0zOwUa48+Ym1lSwCUNCEQ1nCm0VqQ8RpXNHEE1JRJGByZ/HfIb0/W6CbC9n+7
 98XwHieNd82aJmqPRDGSXwQN9s1vKVwP2GaI385ot/0d0YwjHpRw6RcPDGDU+wvu
 npUEvr5+KbHS3yYcZ6sbx8lCy3qnoH1oI6Yrl3Wdsz7wWOyHM3bYM6vGhPkEPvSy
 AgnsYeskVKGlN7CpIsIM7gcn8EBs4RonP+eWJH4uNmwKMe0vZceXVGG79iknUSDw
 ==
X-ME-Sender: <xms:YUckYMdTQAUT-32ykbF22-jG4I1rvhWK7zYlQ0B7F3zhjdBP2_XetQ>
 <xme:YUckYOOREh3MaTb1d9aYvKq3IE3uqx31U7lzVSQxrbC6TIEF7bNbtmf3F0GEO9K5R
 z2MvG635moNw6iR1o8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddufeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YUckYNhnnl6Jv0XXgxk3EagbBxrV5z00C6CNo2PZABeOdF-LKVFGpw>
 <xmx:YUckYB-zwertRm63wQWqNjhQH3JZB_PLPUKuc80trdWqvTbXHl2g-w>
 <xmx:YUckYIviPjrojoupNb4nc7UE-MhIzM2ryS1xPPXovWe6kT_ioiw2HA>
 <xmx:YkckYGD2loh9GT5htjhORviq1H8RxEo8B9z6SfT6iRdeGTkAroVSlw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B459D24005D;
 Wed, 10 Feb 2021 15:51:43 -0500 (EST)
Date: Wed, 10 Feb 2021 21:51:41 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3] hw/block: nvme: Fix a build error in nvme_get_feature()
Message-ID: <YCRHXeLFZ+Mf/JQz@apples.localdomain>
References: <1612956141-63712-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PEuokG28+hz/0Kvk"
Content-Disposition: inline
In-Reply-To: <1612956141-63712-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PEuokG28+hz/0Kvk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 10 19:22, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> Current QEMU HEAD nvme.c does not compile with the default GCC 5.4
> on a Ubuntu 16.04 host:
>=20
>   hw/block/nvme.c:3242:9: error: =E2=80=98result=E2=80=99 may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          ^
>   hw/block/nvme.c:3150:14: note: =E2=80=98result=E2=80=99 was declared he=
re
>      uint32_t result;
>               ^
>=20
> Explicitly initialize the result to fix it.
>=20
> Cc: qemu-trivial@nongnu.org
> Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>=20

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

> ---
>=20
> Changes in v3:
> - mention compiler and host information in the commit message
>=20
> Changes in v2:
> - update function name in the commit message
>=20
>  hw/block/nvme.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 5ce21b7..c122ac0 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3228,6 +3228,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeR=
equest *req)
>          result =3D ns->features.err_rec;
>          goto out;
>      case NVME_VOLATILE_WRITE_CACHE:
> +        result =3D 0;
>          for (i =3D 1; i <=3D n->num_namespaces; i++) {
>              ns =3D nvme_ns(n, i);
>              if (!ns) {
> --=20
> 2.7.4
>=20

--PEuokG28+hz/0Kvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAkR1wACgkQTeGvMW1P
Dek8pgf/fYWOnYn8U2EZO+7WlgUQM7xee59vY6HMTdYo0HZiF4mpFuIys9xV5deT
ucCvFt2njG/IwrpqLbu97pV7T1JE+iz871rmw7kJPad8Mt3Zxwj7X5mH5/umZVyS
T0tDGaoG43BPXogYkwGo0BwFwmgcqCSvWGMvGm85mKGjcN+Jyub9XJgl9CJLaHVS
Vdgey+WgnckI6O2ZTY8Qm4N9jRr45/qvn6jXoviWH9+oX+Y54A1XyWStQy1uGhr4
14X/kAyyyOLHQ0JInRCeRDBW9a6Ym3x9ioYDd9Jq6xu64wSpGj1l4zogYd061HLu
W8RVAE3U+UdxnnjoNHjIwpbwg7Al5Q==
=VdO9
-----END PGP SIGNATURE-----

--PEuokG28+hz/0Kvk--

