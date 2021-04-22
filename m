Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE11368436
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:51:37 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbc6-0001eU-87
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZbRf-00037G-Al; Thu, 22 Apr 2021 11:40:47 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:39343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZbRV-0006Wd-Ks; Thu, 22 Apr 2021 11:40:47 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B45351363;
 Thu, 22 Apr 2021 11:40:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 22 Apr 2021 11:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jrJe8lIKP0ajjmezakut38XcUta
 KXnp6n6f+/cM8jNk=; b=R/Hx8tmc0OVe+TpxLkiGs7IQH3vv3k+LUQZ1uqnaB3c
 FNPpXfVw9VUUop29O3sJeI5W+2XV2Ov62k4vtB37YcXaUgxxvn4oluH47N0FhGOe
 AxXgOgzMKpKyzdXABB2KtyuvB/sMNDz+arEBXH9vMwnwzb4SucxonU0xgWWNnd1S
 ierPNsevt0f0iT9M7w3nQRSD06teiMn/s/xqVWVb2nAuWQ+TWI2Hm2zV3fwhWw/k
 7FYFa6U2PlXIpOyHiBUz1Ty4RqgSsqesmBlJDcjl43shhfr92IYdXvqEyB75AqEo
 VbfkqjqQQIf10DYTLNkvsQ5aBFNazLMajGdV6xqzGUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jrJe8l
 IKP0ajjmezakut38XcUtaKXnp6n6f+/cM8jNk=; b=twqlywgLi0MbcGdAg/kUHe
 ekOvwXR2n1o0vUh42Lgg9uJBZZ9NCYA2F4C6fMXA7HE5C/FQudxFVKerV62Sszlo
 vGd1+JACa/Le/ualpbv0I0SScDuihnfPrFXSTduCnfgWDzlv+VPH/sJuvWGzaGT0
 cU+hGyCQoEVZSB4D2LaGaIQ0ADuzm7zoaIXag3MbQKdpUZsxTIwG1Xn+d2l42Fyq
 REGAX+k7qO0aYb3cPdih06l8E4Ruixl5Mgcw6iJiGfj5WNVNfayo2Hj0gjFEd8X6
 ySI6GR0LwkpmCPqVTbLrlUiqS4V0eMiUuoiuamYWe7L4MW1veZguarv5Yiz+egdg
 ==
X-ME-Sender: <xms:75iBYOrplA8e2jTTkyeQlfVJ7oOdelbyRsT3QI60HF7PX_bGYfHfEg>
 <xme:75iBYPEA0W257VsLCeo3OiZrSDF56zX9EoKMmWth9XEk4iwr_bQ-92dStHZ7uxHGd
 3rkvg_qeBBAqX8mef4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddutddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:75iBYA7ONnJE-Dp2NmKJECKEM_E1KAhl-elUpXxTlKZtmShrOCb6kQ>
 <xmx:75iBYNBARW6tzDkOs4XNebalGK-wmrJovIdMmlv2upsRYTsEutfqog>
 <xmx:75iBYJyo6yK0BYieyxBYvzjhNXSZ3RMDqBe4FN5QTSApqPIWPSvR5w>
 <xmx:8ZiBYLM-XcKxDDrCdUzSfZ9to8o4ufbcwVzWTRLvznX-eR1BEKQFRA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8C8A240067;
 Thu, 22 Apr 2021 11:40:30 -0400 (EDT)
Date: Thu, 22 Apr 2021 17:40:28 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.0? 1/1] hw/block/nvme: fix invalid msix exclusive
 uninit
Message-ID: <YIGY7EnBZJxwSWxD@apples.localdomain>
References: <20210422135834.406688-1-its@irrelevant.dk>
 <20210422135834.406688-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kQa5Vt0nVc23Mia3"
Content-Disposition: inline
In-Reply-To: <20210422135834.406688-2-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kQa5Vt0nVc23Mia3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 22 15:58, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Commit 1901b4967c3f changed the nvme device from using a bar exclusive
>for MSI-x to sharing it on bar0.
>
>Unfortunately, the msix_uninit_exclusive_bar() call remains in
>nvme_exit() which causes havoc when the device is removed with, say,
>device_del.
>
>Fix this.
>
>Fixes: 1901b4967c3f ("hw/block/nvme: move msix table and pba to BAR 0")
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 624a1431d072..31a1a59d88c9 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -6235,7 +6235,7 @@ static void nvme_exit(PCIDevice *pci_dev)
>     if (n->pmr.dev) {
>         host_memory_backend_set_mapped(n->pmr.dev, false);
>     }
>-    msix_uninit_exclusive_bar(pci_dev);
>+    msix_uninit(pci_dev, &n->bar0, &n->bar0);
> }
>
> static Property nvme_props[] =3D {
>--=20
>2.31.1
>

Having investigated more, the proper fix must also delete the subregion=20
that 1901b4967c3f introduced. Otherwise a reference lingers, causing the=20
attached drive to never be "unlocked".

my_bad_counter++;

I found this screw-up while investigating Bug 1925496, so credit to Oguz=20
Bektas for reporting this!


diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 624a1431d072..5fe082ec34c5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -6235,7 +6235,8 @@ static void nvme_exit(PCIDevice *pci_dev)
      if (n->pmr.dev) {
          host_memory_backend_set_mapped(n->pmr.dev, false);
      }
-    msix_uninit_exclusive_bar(pci_dev);
+    msix_uninit(pci_dev, &n->bar0, &n->bar0);
+    memory_region_del_subregion(&n->bar0, &n->iomem);
  }

  static Property nvme_props[] =3D {



--kQa5Vt0nVc23Mia3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCBmOsACgkQTeGvMW1P
DelPTQgAnDljRvbBY+W5mQdvN4A/kuCAjs1KFF/PkU0g9kT3V4c9elyJbezbjyLb
3zF2Hoj68yX2zONT+1xSR4eOUp4auqFRiImGPnRP7ZjlZ/UeKhClRz61BWtkdQVP
YzdeD9VwSHmg+qnEMNzIfxDvlAcFz8ZEJMfUKeCmA+7F0DkL2qzx1ez/yiOqNY68
7IJk+XN6BWoBhbPHk2gm+6ZKy8KbsVLi2Xs/vg5t8SNa0pLo/uN7AcoUQDIY/Etz
4CZIXp0HQysdGQnUnwmi76K3Fuk+O/t88FBBKQc6vvEzm+5ko7KwU6Ex4ZNdFWJ8
65ZJXzD7qN1dwzf9xEmSuLYqAFy26g==
=LXLQ
-----END PGP SIGNATURE-----

--kQa5Vt0nVc23Mia3--

