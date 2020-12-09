Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA912D4185
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:58:25 +0100 (CET)
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmy6x-00082c-L7
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmxsl-0006Jp-2D; Wed, 09 Dec 2020 06:43:45 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmxsi-0004vo-2A; Wed, 09 Dec 2020 06:43:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A67315C03A5;
 Wed,  9 Dec 2020 06:43:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Dec 2020 06:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=sfsMxPE7y6i2RdMKmcAEhBeqysC
 PLeZc6Xo3K9XuzVY=; b=mF4USyWYQENFChK0FjFQZuedw/a8tYU3PN1xMZEz62Q
 f8mddThXqQwYj1tXcnltfvtladMt7UkTM5hd7T5HIV3tX4rZPhs6/X5MQgfr7mbU
 TJjIAbBQjIje16iq8k8XNi7gR7JflMJRCxV0v2z3AZfNIKByLNB2CcgaufYv0WCA
 ZeGxlYwCyEvNXi7VL1+2dIsXa7jpph/dPBuMP6RDjG5VMqAfbL2DIK/HS9Dw8yIo
 9qurXZVud0G0BJUA5Gc83f9Mm9pgUrPG+jEznCPIwJP5F94zNaB94on3dMAIfsGw
 WxMeuld/W2mecjqpG2KlYT/NJYwgtiMeHqyZjc/4Rtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sfsMxP
 E7y6i2RdMKmcAEhBeqysCPLeZc6Xo3K9XuzVY=; b=K0Gq5VhjXGsoZNknQR81cb
 gEb9yf/uwSMsb1AZjDtnFsQP6qZ84iXnwfnbXrRsMth5b7GcypNOvZUq0TlEERkV
 m8I09CFq0JaOXdOmDHgp3388ymMfWgZ6Y2EPH18N6hX0Jfq2OfzLZ9X4Ly4oq4+5
 Za0odgv8E1/HMuwL95ZBnzDkj9pmx4XMZzzQ+uVEeLWg81hHCWJ55LcbLd4MGUjg
 uL0u/+EMcFiEnLPtfbUNs+uevmYHc5BfQEbLQ7Bsnt/pG2AnP7gc4rDZQXo3c5jI
 OWqQmZsKW3V9vqlP5paagHeQP3EZhpdvfbgp9dO9hcI+C2skSCPzw73TlMt5Jhrw
 ==
X-ME-Sender: <xms:abjQXyRLRukF8g_KEs6yf_Qr_BjYaxi7a2p5KGYpnrOgK4qv8yZtWA>
 <xme:abjQX3xylj9-oSjWTSeUD-D_mKvn8-HN8277_HEp1egxgW_yo-pVWcGY_Q2Fk1FAn
 XCb0gRd3nIAKaDwPWo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:abjQX_1-mkfSa7Z4m7acnAUIiex8rdUyQrFcGiEmd4gP9rscx1PUMw>
 <xmx:abjQX-DL_gZn12OO3CDGpFmOLFddY1h5aCpS9zeo2KI4z12fJI741w>
 <xmx:abjQX7jSa1QgVjPcJUvpkEvjIOw0Twa9c744r5NUtGrrdc0Z4WZ4RA>
 <xmx:arjQX7dNGjPKv_qDU2nc9tut3zlN1WWhfQ1vXwl0ubWKP-4ToaodxQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69D3E240057;
 Wed,  9 Dec 2020 06:43:36 -0500 (EST)
Date: Wed, 9 Dec 2020 12:43:34 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/block/nvme: fix bad clearing of CAP
Message-ID: <X9C4Zqupd2FQ3B/x@apples.localdomain>
References: <20201208091658.41820-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x7LxTeh6HYJPYQg1"
Content-Disposition: inline
In-Reply-To: <20201208091658.41820-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--x7LxTeh6HYJPYQg1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  8 10:16, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Commit 37712e00b1f0 ("hw/block/nvme: factor out pmr setup") changed the
> control flow such that the CAP register is erronously cleared after
> nvme_init_pmr() has configured it. Since the entire NvmeCtrl structure
> is zero-filled initially, there is no need for the explicit clearing, so
> just remove it.
>=20
> Fixes: 37712e00b1f0 ("hw/block/nvme: factor out pmr setup")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 8814201364c1..28416b18a5c0 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3040,7 +3040,6 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *=
pci_dev)
>      id->psd[0].enlat =3D cpu_to_le32(0x10);
>      id->psd[0].exlat =3D cpu_to_le32(0x4);
> =20
> -    n->bar.cap =3D 0;
>      NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
>      NVME_CAP_SET_CQR(n->bar.cap, 1);
>      NVME_CAP_SET_TO(n->bar.cap, 0xf);
> --=20
> 2.29.2
>=20
>=20

Thanks for the reviews, applied to nvme-next.

--x7LxTeh6HYJPYQg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/QuGQACgkQTeGvMW1P
Del4qwf/dp+Wd2uHaHUNZTOPRkjmtP7joLw04fRxzv/TmhHD2cx5G8oo+F6gGT/v
jLqr1+z3Uf4lnwOV48f3XpgQktfF89VJI9l7YOqfn1N9ghTwg2XHkTsNEfrKOqy2
1ycF8P4E7Ue0TkHD/jq/oIb38w7o4nd6iS7UHJ5Wd9CEoZO5bJ1e8cISJp7zDnHW
BVjjGdCXMFQ2IwTrgd2F9EZA3ZRLBo/zpci5UpqXStWgXxD72ik0B53jXGGRGtB7
llZz1vC+AcrtPPT3nZnx0ig8/p6/uFjw66gVf4KVSefs5aoZUm3MlT85qUxbPJmp
jlpmqy1iVCwZXKA6J6NEO7ixHviTCQ==
=i2RC
-----END PGP SIGNATURE-----

--x7LxTeh6HYJPYQg1--

