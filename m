Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F6D36ABB0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 06:45:18 +0200 (CEST)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lat7V-0008Ly-44
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 00:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lat34-0006N8-Dk; Mon, 26 Apr 2021 00:40:43 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lat32-0000hi-1t; Mon, 26 Apr 2021 00:40:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6134F5C0051;
 Mon, 26 Apr 2021 00:40:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 26 Apr 2021 00:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=uOSInjsZVrBHxJOdVSaUCE94TBO
 CWrLearXFPhVdYEg=; b=wFso5IRYz0Eqzpqh10dF+AruccFMy0gx9AJfaYVuGFp
 0OHhX2SmD0ZcC3pDV0Ro9uhSC8YeFLthgYY2uEelEfXDB/389qo6TXMmBIDnXC4B
 608iN0C2tEfgmLhOzGPxmVFCueAJlcz7bICPO9KdHwNLGviEhIsd02hhAfw1L+JF
 Y4svm2rfEK10Z81e1PDIw39ougCE13LGFgxN5TAZ9ENaMh3hAqbYq4NMCLWD0/2h
 fhOYOMIyZVH7LHAFpDQ9qydf9MPXLFSj+Z6D4JFAfu9I5NsXla74dx0pv+eE29e3
 RuNkC56vBsS9FkqXuC10t5BTzWy8QAkZNf6ndzq16tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uOSInj
 sZVrBHxJOdVSaUCE94TBOCWrLearXFPhVdYEg=; b=c4j0O0Bn60LxR0GssNTgy7
 E0+DUNgWQ1iqORaG1YYd6d9tZaLYYvFwTKf5UcqmKofB2XixCixOHwZSxovFRDY8
 UwDOneodBOgBWZCyq4M1rJeaaEVwYbEpMTe2O1FVTNYZzHfzPHLVFVPz27Uh0w5y
 Pi21Qx6YM1Fk0zaIBEC4TEnWhJwa+h06v/dJ8ArZ4JQCeQvbtIWc3dLRCDYdBA1d
 BO1urKX5HaqXnJ5py9cz25UoxVLJggDJxe/4xdXG4Xp0IYp0jSHz9h4VbVGLfReu
 pk+DGWbQT9D68Z7Rm4IAs84OHYv9955JxeuIL7vzH5WAZgQasiUX+vYnYPteKzjw
 ==
X-ME-Sender: <xms:QUSGYE0gp0KWV6X_7Y1U8ellZ4obtlSRC34ky2h9NoIip2eepumrgQ>
 <xme:QUSGYPBvn30LhdRYMzzbdLnVwYa6vbGvqPs0YCW00Qm_h1YcQKKs4FvNUq9Lvrab3
 2jn9mGFG19qawI58PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddujedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QUSGYJw-2a1H_Ya_aB6ZFlIP9-GhT5wTXM8cpykutIBWbLSBHNFfmQ>
 <xmx:QUSGYFm9OvXd4acIf1VwF3EfLL7A4Fk24ijd3PtX2w_0gJkl1ajm8w>
 <xmx:QUSGYGGeK_sgk5p8D4hsQzv8Pv8ulbhjFhM0YGwXalFbBgEDXC1few>
 <xmx:Q0SGYMzjhE3tl4lFIsus_zDvji68MSB3dqiP5pGIh3dnLzuDctI0CA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C4245108006C;
 Mon, 26 Apr 2021 00:40:32 -0400 (EDT)
Date: Mon, 26 Apr 2021 06:40:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.0 v2 1/2] hw/block/nvme: fix invalid msix exclusive
 uninit
Message-ID: <YIZEPo8gD/puvP5T@apples.localdomain>
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WGPWor/7dedDk34E"
Content-Disposition: inline
In-Reply-To: <20210423052127.512489-2-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Klaus Jensen <k.jensen@samsung.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WGPWor/7dedDk34E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 23 07:21, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Commit 1901b4967c3f changed the nvme device from using a bar exclusive
>for MSI-x to sharing it on bar0.
>
>Unfortunately, the msix_uninit_exclusive_bar() call remains in
>nvme_exit() which causes havoc when the device is removed with, say,
>device_del. Fix this.
>
>Additionally, a subregion is added but it is not removed on exit which
>causes a reference to linger and the drive to never be unlocked.
>
>Fixes: 1901b4967c3f ("hw/block/nvme: move msix table and pba to BAR 0")
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 624a1431d072..5fe082ec34c5 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -6235,7 +6235,8 @@ static void nvme_exit(PCIDevice *pci_dev)
>     if (n->pmr.dev) {
>         host_memory_backend_set_mapped(n->pmr.dev, false);
>     }
>-    msix_uninit_exclusive_bar(pci_dev);
>+    msix_uninit(pci_dev, &n->bar0, &n->bar0);
>+    memory_region_del_subregion(&n->bar0, &n->iomem);
> }
>
> static Property nvme_props[] =3D {
>--=20
>2.31.1
>

Ping for a review on this please :)

--WGPWor/7dedDk34E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCGRDsACgkQTeGvMW1P
DemZCQf/R/DJ7F2Z1By81nEPu14XJ9l00dqbSvR8ywbViySVljoc0/xfoG2EIe8Q
x2ZkFAobeuJlDBAhoKSsoSGxmLOUcMjVvTpOPt3mNNawonXd8Vos69gzyyPx00vt
vWogDViqvrocjaSf4iOKPU7qnHdFE2CJI+mAlCRP1k9nPHDAg2Fk6uVeHN/MWpT7
ka5WiMZo/Mr6hzAve1Bgz8SxFo2+wG82DvjsDVn4sFCCYffDHd3hi0NESjhTK5IB
PJmruwOqPOe3XdJbN2boMDoObQbHsVJWXQjyQwsnIrXDB2Wn2lBByDp/lxYGsa25
8O/ivFQzRnTg+WGezhH3kYRTRYv3TA==
=G7Qa
-----END PGP SIGNATURE-----

--WGPWor/7dedDk34E--

