Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32E238C08E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:18:35 +0200 (CEST)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzQY-00064s-SQ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ljzMD-0004zr-5y; Fri, 21 May 2021 03:14:05 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:40945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ljzM9-0003xG-PM; Fri, 21 May 2021 03:14:04 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BD8DE1286;
 Fri, 21 May 2021 03:13:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 21 May 2021 03:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=k7m3kGJytjps9nD/I7PcW0Rut/7
 4nAcDWqD0A46NrWI=; b=KrdzD05wP21vSA0MHSXwLhstueIhBnjHBP00LR/hMz2
 Ei4XzBwtKLEoRC6sxEd44oqg6W12OuK3HG02w+EdUhcIgH3qtd7ONp0SWeUXeh3u
 rs4UmEYLxe4UMNGMtfKFQ5VExTqwOh3fLGSlVwqt5w4dKZnGRHmvncIDvshkNxCH
 nC3Q0cV9qZH0xRUtRlLyFkaWtTlLhCP4qs1Udd2Be3r7SUknmyBt6fh3qRvI+fN6
 IAEQHM/1IN5cywTe1AlgxADjPcZttSq7uw/9gJhYXSHFjtF3IZs6c/QDaNMBCyN2
 uy6vNXRg2I5NanVQhC6eAxogEyFf99tvpB3EKyhmgig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=k7m3kG
 Jytjps9nD/I7PcW0Rut/74nAcDWqD0A46NrWI=; b=kHqBvvKBx2FfcM9IeKjEC1
 RzHETsNnGHI+idni5nA8NIWv14SqisW/9+n2kWl2b6NosfwHIoZy6kwvK0LfTd0y
 WtXlObIyVVLYHB+b+mZm+8h9l0kuRiF0yE/5YP7ZHuKvYqS3MzketWURpA03/znD
 9UwwmQ5NiRgP8Zmd5FVjS/Mac+Dc3aEXBrrrdvtiIErC0l1YFmzrZplqA+VAdwv+
 eoFjckD3QTRynJ7/HXlLFCP/TWCf5dcpbB8IKacjlz9QrNXOeKf7DMUdRWGVpS9w
 RR4Y8gV8t2TegZVmc6sjp6axWRrm4qQ6P3wQ0eJNRSLm2FrUBDlSuy2HG/JP3o6g
 ==
X-ME-Sender: <xms:s12nYFexdCSwq8PlgDZDmwmnIpdNC9NKOPRi9nPkasY2uSYCLa3GFQ>
 <xme:s12nYDPILZPx8pUBaH1hNFqB7GtYnpO3Dm2w2hNZFgGNWsSWjypxneY7Ib2SPmyGw
 -_vASbVTKQCUi5KYRo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejvddguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:s12nYOhnwIz3dyi0AJKrRQo4apqHBn4xUeQcYHrAyxbMlKrudwbQzQ>
 <xmx:s12nYO8ZCgrkSQxpzHtG1DEyqvCs4fgqhm5AVH70lUlivchNqd5iVQ>
 <xmx:s12nYBuJMcAhU4Umzh-wXL74JO6DsgFvzrDVEK5F0WrfU2lHiAK6YA>
 <xmx:tF2nYFga3dGjWaQJfNpkfXafHfgPSj0lQbwbLkQKLFCOJinN_4oR1g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 03:13:53 -0400 (EDT)
Date: Fri, 21 May 2021 09:13:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] hw/nvme/ctrl: fix functions style
Message-ID: <YKddr8UDZhPzK0Yr@apples.localdomain>
References: <CGME20210521061352epcas5p145b3a19453f7ff9d625bb9ae447b649c@epcas5p1.samsung.com>
 <20210521060842.25516-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ubPlQgpMiHzfipxy"
Content-Disposition: inline
In-Reply-To: <20210521060842.25516-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ubPlQgpMiHzfipxy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 21 11:38, Gollu Appalanaidu wrote:
>Identify command related functions style fix.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/nvme/ctrl.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 0bcaf7192f..40a7efcea9 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -4291,7 +4291,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeC=
trl *n, NvmeRequest *req)
> }
>
> static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
>-        bool active)
>+                                     bool active)
> {
>     NvmeNamespace *ns;
>     NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>@@ -4326,7 +4326,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, Nv=
meRequest *req,
> }
>
> static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
>-        bool active)
>+                                     bool active)
> {
>     NvmeNamespace *ns;
>     NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>@@ -4373,7 +4373,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, Nv=
meRequest *req,
> }
>
> static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
>-        bool active)
>+                                         bool active)
> {
>     NvmeNamespace *ns;
>     NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>--=20
>2.17.1
>
>

Thanks, applied to nvme-next.

Please just use 'hw/nvme:' in the commit title, we don't need to specify=20
the sub-subsystem ;)

--ubPlQgpMiHzfipxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCnXaoACgkQTeGvMW1P
DenFrQf+PiEHsLIWcl3VVIZSwNfxzAYlKIbFELzbr2cLPFQJecrGq7a1h/v4teIn
wXdZO2Hi+4NWUxN0q1PIhHyxR6pFQz25wFuaFVCDfAn70dB09T9cVxXDfuv7wTgY
ap/GvPuAqjAiQ73s95MZHaoQsUrz/3tA7V2g7r5pT3RiS+mHxkzYKUKzhuR9QQTt
61nmasK5GACuFWuInnVgoMrb4ULqRnVt/vRVS86ttnCL5kyUZBCuiNhZ7Kkafc7K
ajTKKc313Gve56K3yfSKjZGFB2vwgFftY7OqnmEBbFgq85cHrlmUPDFnVkuqEXBN
xxm4f6foNza+DyfkJrHkPzXOuR1UEA==
=ucDY
-----END PGP SIGNATURE-----

--ubPlQgpMiHzfipxy--

