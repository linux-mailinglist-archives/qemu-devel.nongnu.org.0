Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DFC3A1E01
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:14:59 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4bK-00023t-TX
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lr4X3-00014s-IR; Wed, 09 Jun 2021 16:10:33 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lr4X1-0005pw-Bz; Wed, 09 Jun 2021 16:10:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CAF05C0136;
 Wed,  9 Jun 2021 16:10:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Jun 2021 16:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=GhDvETbj5Z3gFHDhX1+COEU2Sv/
 Fm+kwVPhd47ZEJV0=; b=P9xTxS7QBrS1mzBVftc8SThFEsmDspWsgF22H1PRL3a
 EgCcgkCsxOg45AjXIJe5NwhllkMHApwtI8teCuZXTYDg/bQJhkdSd7w5gFUrKaZs
 y0FwKW34InyNvru4cNS876MbjXY4CV2ZLQxle1z/V/tsWdNAXn5ASyqab+qS24SP
 nt5HR6+BwfIzC+C8aeOiJ6u2Gz/EWWB+KL8sqpD72zhtkBYJv/HIEjOysTBljeOS
 gK7v9kCgRK3SWMqZp5Sjl2kqJAt7IdedEtesCSuxkAsFaSxGDEAKsPj56Qj+FbNn
 D7ZTl8P3SX8G76DuK6M+Kxzn3o78+t49V5d63MMH15g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GhDvET
 bj5Z3gFHDhX1+COEU2Sv/Fm+kwVPhd47ZEJV0=; b=KNqWP+Ici5JONDYHw1Aqye
 j9mK+z2tMtcvesNGmqqYnfK26rYfiTawIZA0Iukx7EmRcZJ1xsAoqn+u/3s78P7T
 2NbSSjYz7zKplNaUeg07KyLxQz3dTecOpWiwLvRzUByx7+t7WIbDrqH6Kfnva/U1
 wNG9H2awE2KhBRmQ+8kn3SYIp1f8xA6RJd6IRQfZA4AIJvYsEEUapOmaUp1J8qCo
 4bTgKgKg8zMuHwWSDf1pxGwMCALBU1hxbNXxJIscFcVU7mHVsfiqSmfLA2TwSiix
 +Y5XrTwaAsxe+B1hssw+hTFFMTK6UiMiMEC3qWmQKFVBvvvlKSnJjzPsgmqSIiRg
 ==
X-ME-Sender: <xms:MiDBYD5KBcbT6o33FzQRqd_KnXt2xcBCNWYtopnWgUiS-OLNk9n6bw>
 <xme:MiDBYI5sEo5wNWt2T9Tw5IvWKL4eVqpMhu_UWYSQGmqFF9yzylXbuN_WDmzi3_EKv
 En9UriZqvL1goHJPII>
X-ME-Received: <xmr:MiDBYKckqDk2Ov5SRjzP14WQlJ--XWJyCoKC9KfPaZ_vAJIdwhbQabtVeqYPY1SV7j_mLBapJrHR78vSQzPvPF3UbRvg_01mmyIjhmS7qzxx2pYUYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgudeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MiDBYEIRXX5Gh5Wljn8wmyiHyvDgKMzmXDy7L-tHuWZGwHdC3BEsFA>
 <xmx:MiDBYHJpPczyP1GH5foViQOicMZ6DqGXVWW_Vo_x0zkKHVU7g0l3bA>
 <xmx:MiDBYNzt4LTceCtm14O_RmtZk5m4GSCwc-y10v48cUM8lpDffj_bbw>
 <xmx:NSDBYEo2SJrqLQUZwLef4CLzY77xSVaYhhzBe_azSljRuEQsW3x1Mw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 16:10:25 -0400 (EDT)
Date: Wed, 9 Jun 2021 22:10:22 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2] hw/nvme/ctrl: fix csi field for cns 0x00 and 0x11
Message-ID: <YMEgLlV0Qxwv7k3g@apples.localdomain>
References: <CGME20210427063530epcas5p4c260382227175e68d29da6d10957ad95@epcas5p4.samsung.com>
 <20210427063052.31078-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QEwqiJ+a0IeXnqp6"
Content-Disposition: inline
In-Reply-To: <20210427063052.31078-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


--QEwqiJ+a0IeXnqp6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 27 12:00, Gollu Appalanaidu wrote:
>As per the TP 4056d Namespace types CNS 0x00 and CNS 0x11
>CSI field shouldn't use but it is being used for these two
>Identify command CNS values, fix that.
>
>Remove 'nvme_csi_has_nvm_support()' helper as suggested by
>Klaus we can safely assume NVM command set support for all
>namespaces.
>
>Suggested-by: Klaus Jensen <its@irrelevant.dk>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
>-v2: add sugggestions from Klaus
>We can Remove 'nvme_csi_has_nvm_support()' helper, we can
>assume NVM command set support for all namespaces.
>
> hw/nvme/ctrl.c | 14 ++------------
> 1 file changed, 2 insertions(+), 12 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 2e7498a73e..7fcd699235 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -4178,16 +4178,6 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *=
n, NvmeRequest *req)
>     return nvme_c2h(n, id, sizeof(id), req);
> }
>
>-static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
>-{
>-    switch (ns->csi) {
>-    case NVME_CSI_NVM:
>-    case NVME_CSI_ZONED:
>-        return true;
>-    }
>-    return false;
>-}
>-
> static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
> {
>     trace_pci_nvme_identify_ctrl();
>@@ -4244,7 +4234,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRe=
quest *req, bool active)
>         }
>     }
>
>-    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>+    if (active || ns->csi =3D=3D NVME_CSI_NVM) {
>         return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
>     }
>
>@@ -4315,7 +4305,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, Nv=
meRequest *req,
>         }
>     }
>
>-    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>+    if (c->csi =3D=3D NVME_CSI_NVM) {
>         return nvme_rpt_empty_id_struct(n, req);
>     } else if (c->csi =3D=3D NVME_CSI_ZONED && ns->csi =3D=3D NVME_CSI_ZO=
NED) {
>         return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZon=
ed),
>--=20
>2.17.1
>

Applied to nvme-next. Thanks!

--QEwqiJ+a0IeXnqp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDBICwACgkQTeGvMW1P
Del2mwf+IHAiMbM7KBf54Ir+4bKl9NDgNoODqhdXBxgfJu7Cmx6V1JL3UWWLlbA0
yuE0RYNVJ5t7RvFjtzc6rZLN1+XTV9e7XqfuStg7H236WhzuLWpaAXVK+9TLaJrU
pn2iiSNwcvxwtBeMTAwj9fPj6ygSWR/pGFmCJifXWobDfXviXfR8PAE0zEoRPDHc
oVi4lkSlKLiwiPDZUsmPOkQHgMEaSW868CzP2epFMCWqE90pPhJuu/zhUGh9O6RN
xaju7H96h1BP2xJSVM1u/prX7Enc8GfQbF84GNal9FGqI7A9vAoC8k2JCbIyjW22
du1x/lTiA+aYoJud4W/miUiBjnJo6g==
=WZPG
-----END PGP SIGNATURE-----

--QEwqiJ+a0IeXnqp6--

