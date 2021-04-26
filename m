Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F036B219
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 13:11:28 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laz99-0003iG-Ki
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 07:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1laz1I-0001ua-5m; Mon, 26 Apr 2021 07:03:16 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:48815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1laz1E-000665-Ol; Mon, 26 Apr 2021 07:03:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EFF831644;
 Mon, 26 Apr 2021 07:03:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 26 Apr 2021 07:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=uJgHAMHh2KjXXySw/fnSsNVgqnx
 YiahnGbKu2tHCNHM=; b=j1LPi/Wblq2mqC432/eT/j2hr2Kb4qnuwgHw4Xlr+W+
 miyEBnGrpW7v9atP+mBr04y90JK8RmEqbVJcL27tpSoZ9YSOge4xWHjb+CJVm/Wj
 Z4a86EoDpNfRLyBqUG6aYG2RPJmoK4MbBQxIcH1/FA9WossL529RMWvruv/y4eo9
 oRByAY48J5+IdvF6Wou7Z746piOWFsLCdSMaIUILSarWEX7dIYN0E5pniJxB7z7B
 U2FrBk7irvmoCPmG2009xeduoijMwLUZE+6/VxtAAr+hhsbcldfG/vOH4YsZiCUi
 OmP028EOziuUUWFNtHQLE5CwtFy99Q4FdHMSj7OkOBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uJgHAM
 Hh2KjXXySw/fnSsNVgqnxYiahnGbKu2tHCNHM=; b=P7ZiLVrrV+VQSSUgqT2tck
 t20vvq8Kjf+XORM3PXgDwJj+uCe0KjFy6sTa40dDzc1c/5y8B5tPTlzqZ72E9HJo
 SqxIoCPJikqz/IK8Lg9ENU8yWw9cjBISyiD5x04FZPO+LaCAvJA2shBn94YlW+sl
 t01VVs2oPhCDqYie48gRMwI/ncmC2mmpC4xNz9q0ir4nEVUqxSTwn4bWdPgtE52w
 QtrGgjLCPz0lNWzWjS5pvQ76bNleyFD+7uBmXbpKc7iQGFVLGG8VPRocIgRlz90/
 WQ0GOlxJ3KyvXUZo60lpooHYPVibMih2Zp/DM1N6wCZnmNx3IP72cGOar8UlR7eA
 ==
X-ME-Sender: <xms:7J2GYGW7jdYgZeBFe9cSOf9Y-99fpfp3jeftD3Q9XYHT5d1idi7HPQ>
 <xme:7J2GYCmkx091FTIaCyAVAMgO1GjNSVXCg0HSrfqUCVvz4eo17rymr6Ol3IlUpyWvb
 i1IplsrjAi5W6Lenhs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddukedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepheevffekffevuddugfdvudfhjeffve
 efgedvhfejvdevheetheffveetgfeluddtnecuffhomhgrihhnpegtthhrlhdrtgifnecu
 kfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:7J2GYKYTqjDunbf8VSlPxg89NTyK9JhRTq5ycXmF0ENTd6jCKaUdJA>
 <xmx:7J2GYNXt_NvvwmYp8cNNs02puSvebNOwkdW1PR0v4_t58Yc9MEqYTA>
 <xmx:7J2GYAlm_hrlbgsXkOE27d-3eq_6jm2b1XcgNIJOPO5_M2cKUNYBaA>
 <xmx:7Z2GYObDpAoHo3b4Pyhpj_oE4dNTOvQIXUXt2aDvJ_So9V7JvVK3hg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 014E91080064;
 Mon, 26 Apr 2021 07:03:06 -0400 (EDT)
Date: Mon, 26 Apr 2021 13:03:04 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: fix csi field for cns 0x00 and 0x11
Message-ID: <YIad6KpbnA2ihJ7e@apples.localdomain>
References: <CGME20210426074741epcas5p1ac30fed5ef8c21a1b7e5685920ff6847@epcas5p1.samsung.com>
 <20210426074650.24245-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SqoQXFtKNVchbZXD"
Content-Disposition: inline
In-Reply-To: <20210426074650.24245-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SqoQXFtKNVchbZXD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 26 13:16, Gollu Appalanaidu wrote:
>As per the TP 4056d Namespace types CNS 0x00 and CNS 0x11
>CSI field shouldn't use but it is being used for these two
>Identify command CNS values, fix that.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/nvme/ctrl.c | 11 ++++++++---
> 1 file changed, 8 insertions(+), 3 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 2e7498a73e..1657b1d04a 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -4244,11 +4244,16 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, Nvme=
Request *req, bool active)
>         }
>     }
>
>-    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>-        return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
>+    if (active && nvme_csi_has_nvm_support(ns)) {
>+        goto out;
>+    } else if (!active && ns->csi =3D=3D NVME_CSI_NVM) {
>+        goto out;
>+    } else {
>+        return NVME_INVALID_CMD_SET | NVME_DNR;
>     }
>
>-    return NVME_INVALID_CMD_SET | NVME_DNR;
>+out:
>+    return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
> }
>
> static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *=
req)
>--=20
>2.17.1
>
>

Looking closer at this, since we only support the NVM and Zoned command=20
sets, we can get rid of the `nvme_csi_has_nvm_support()` helper and just=20
assume NVM command set support for all namespaces. The way different=20
command sets are handled doesn't scale anyway, so we might as well=20
simplify the logic a bit.

Something like this (compile-tested only) patch maybe?

diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
index 2e7498a73e70..7fcd6992358d 100644
--- i/hw/nvme/ctrl.c
+++ w/hw/nvme/ctrl.c
@@ -4178,16 +4178,6 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *n=
, NvmeRequest *req)
      return nvme_c2h(n, id, sizeof(id), req);
  }

-static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
-{
-    switch (ns->csi) {
-    case NVME_CSI_NVM:
-    case NVME_CSI_ZONED:
-        return true;
-    }
-    return false;
-}
-
  static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
  {
      trace_pci_nvme_identify_ctrl();
@@ -4244,7 +4234,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeReq=
uest *req, bool active)
          }
      }

-    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
+    if (active || ns->csi =3D=3D NVME_CSI_NVM) {
          return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
      }

@@ -4315,7 +4305,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, Nvm=
eRequest *req,
          }
      }

-    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
+    if (c->csi =3D=3D NVME_CSI_NVM) {
          return nvme_rpt_empty_id_struct(n, req);
      } else if (c->csi =3D=3D NVME_CSI_ZONED && ns->csi =3D=3D NVME_CSI_ZO=
NED) {
          return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZon=
ed),


--SqoQXFtKNVchbZXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCGnecACgkQTeGvMW1P
DemSkAgAvJKGbh/seBfD5BpNWfEJ+CCTotu2RcRhf1q21EVF50k07+2drd3JaGVT
n5bu6dRFb+e/L9ppreaREsIyzWVrqc/6h2OmljFagGsFOH0TNd66PRJa3+b/xc5l
siLlZJVpWr/GEGmh7tlaXwfpLNBFRYIoMjfXwgsjs4uf7JC3IkfoPRfjWMJ6LZi7
NFIbCS6eFQnyWPNgtBNtp0aDvWuCD+KhDQDOPUH6X6EZIVVJCUggeezj0BUIe7Qu
XLaEQygr170fwPl/dA3X71l2vB6jvEiIovqw41VrAYOtMhDjdMObz1D04yOzQyqV
OLcYorkoJ+pbcoRmCWb5oxGwN1WijA==
=nniz
-----END PGP SIGNATURE-----

--SqoQXFtKNVchbZXD--

