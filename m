Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C632F5C60
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:29:18 +0100 (CET)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzy0L-0005Js-Pc
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzxwF-0003Rx-UP; Thu, 14 Jan 2021 03:25:03 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzxwA-0005cR-Jx; Thu, 14 Jan 2021 03:25:03 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2A99B148A;
 Thu, 14 Jan 2021 03:24:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 14 Jan 2021 03:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=6sCXdaQnBHEP428mCs2Zh9AkzA9
 RszMbuua7VNQ9StU=; b=YopW/dFSSkxShACeuUJpN0m+G4xzRNj7T9c4oWXZfZq
 9yBaV9tPPdaAS831/VcJ9rEaX0+n40DDwYWS0XkjHDEuKyG8ZycouyPMnHgFU/EH
 c7pXmTeHPunCIOE+CkjjPsYetPKFn7pfFJHjNvWFAh/3riurdJTpURC6bHyy3oWw
 /8JrtefUjgco/X75428QKDS3hDKPUcv9Qj5qkgeYAsQRKVMqSEGvc+oZ6olaGn/x
 +h9EE3VWBXwzIWp2Ve29Icyq5Q8c338YBVlCAkpTc7aH5wkl3myoFEGbAdDvweLr
 +9s+9hC1r8lQi1jRd4qI1kSlza3Tbw3KUvFpbDUgG/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6sCXda
 QnBHEP428mCs2Zh9AkzA9RszMbuua7VNQ9StU=; b=eCVnLGnJK9HxNEd6KIIZjh
 LBfw4E+2fNMbBXzLe8GsKw4ULrrUomw5R1UOSp5H7nF2P94oI19mG+kZIbB151VQ
 3XnfkNxqMFUkhtIyZsFO2WrE69xUzN/s3dcBskMXdeqmw2LHzMkpxp899IMrGS3v
 KklF685ZK7OhOkd3G4DyeD+1uGcgejkN/uJ4/GQkMHtecXWfpNq1IXrR1ZwCWjLZ
 zSeonTzHZ0WLDfRteIFGrx4DD5GiSDR1xgzRih6rFwv27uNW/z/BT0rD8yJV62Jp
 G4I10yYCHhlmgtxHdmP9iDR/NMyXZ8ln6brhTNor8nKKTK1eyOU0iNmtE398usbQ
 ==
X-ME-Sender: <xms:1___X1eC8jbCaHPHZSdTnw0qS_vqKPNsSBj5wsvJPcYEtiK91HanIw>
 <xme:1___XzPFhSg7gV-w-bnpl128lblNMZRy4UkMdFvqa-aCrB6w3L66Lj4rAUAUXAiy8
 UsnhIjas2zPFFDFJHc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedutdehleelvdetvdefueehgeevhfejueeliefhudfhiefffffhuddtkeekieek
 feenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1___X-gghWxK2V9ILIzb53z-4ZL0YF3g4uP7OGGG1UlgCQhcECLtuQ>
 <xmx:1___X-_eAptMAafakjMzRF9wcMfNbjpQ9Q0FrPr3RQF0iHebRa2sLA>
 <xmx:1___XxtqG5drDFxhZQSkGSk8sS_LdyRBGJtEdrfRchXBbqmF97_beQ>
 <xmx:1___X_VMjgZQsbvI6MtXi19FjI0oSrFeW3S-KpYIPBWgXPISNjJXbw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20A07240057;
 Thu, 14 Jan 2021 03:24:54 -0500 (EST)
Date: Thu, 14 Jan 2021 09:24:52 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v3 2/4] hw/block/nvme: fix overwritten bar.cap
Message-ID: <X///1ImtG6lDC9qq@apples.localdomain>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
 <20210114072251.334304-3-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hZM1kr3X7yXjN1Qu"
Content-Disposition: inline
In-Reply-To: <20210114072251.334304-3-pizhenwei@bytedance.com>
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hZM1kr3X7yXjN1Qu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 14 15:22, zhenwei pi wrote:
> After PMR initialization, bar.cap should not be clear in function
> nvme_init_ctrl. Otherwise the PMR cap would be always disabled.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hw/block/nvme.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 27d2c72716..f361103bb4 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -2745,7 +2745,6 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *=
pci_dev)
>      id->psd[0].enlat =3D cpu_to_le32(0x10);
>      id->psd[0].exlat =3D cpu_to_le32(0x4);
> =20
> -    n->bar.cap =3D 0;
>      NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
>      NVME_CAP_SET_CQR(n->bar.cap, 1);
>      NVME_CAP_SET_TO(n->bar.cap, 0xf);
> --=20
> 2.25.1
>=20
>=20

Good fix, but looks like you are on master and not on nvme-next[1]? The
same fix is already staged.

  [1]: http://git.infradead.org/qemu-nvme.git/shortlog/refs/heads/nvme-next

--hZM1kr3X7yXjN1Qu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl///9IACgkQTeGvMW1P
DenpJgf9Ed0sgaDLLdKOaUPduSbvSD1ddtGocdvo2q7eH+xAqNHzKXyK/2urXkzI
e75Cd7n5J8GFsMNW8Ye/crmtySPPcKDG9pQ71bI9F4TjqK7wPeEewGeia6zNAI9u
ZNyXslaoYBwwWCHCaOodCnG7inNlrcYztwtfdyfE2G1IzC7EZIwCWup2mqYN+D+C
DqWX9/z1DVAUoQdGpV3t8qPuLdVijqukdKjdE3JUOujf1klzD31Tigjc05FUbRiZ
OxgZvZZv2RvV4g2h4+FmyAe1gOZ+2JfFoFU2WnrCD705tUySO/gYJzE/NpfFMXCM
wJZbkqnZ4uADcswTPlUxMg2kcaiBLQ==
=Fqhz
-----END PGP SIGNATURE-----

--hZM1kr3X7yXjN1Qu--

