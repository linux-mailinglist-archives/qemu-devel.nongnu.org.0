Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F7B358D77
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:26:47 +0200 (CEST)
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaIg-0003UQ-RK
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUaD7-0000gi-4C; Thu, 08 Apr 2021 15:21:01 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUaD4-0003RE-Cq; Thu, 08 Apr 2021 15:21:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A2A875C0134;
 Thu,  8 Apr 2021 15:20:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 08 Apr 2021 15:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=aKqCRFvUEsQekxL51uHb1fbfAJI
 x1TcoiZKQXh5S2sk=; b=Q+u921fgrG7b3aEYvoxoP6OxfKzRYMiqHopydIKonAQ
 15IRrse/etiHsj9Bdz0NzOqN8tGX19pZRNommmYmdnIW8hA22o95hQhxVLnDfs+/
 XIhJ+tg8ESiSl1/UmgrlGqPGugkQP2qmIryxIJt/gLhob/AEmMECOCUcCM0QCvca
 ND+LeKWwGgrWqBeP62hSEeV0sbsimUuuaLAnnEVv2T0j+Ob4v/DFmnw3jBof4m4l
 Xr5A45ttbQQs5QahGH8Y8iwyrUcMb9d50PX2z0X58UoyWvjFHUYyqr0BrPhkXRU8
 2nXfxhF0DKnRw/oUuJwj9/axDVeEwIdNpKmq5c2J0ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aKqCRF
 vUEsQekxL51uHb1fbfAJIx1TcoiZKQXh5S2sk=; b=N0sQ3IRmnCaRqMNi0Nv8Hu
 XTGc3gRdWwD2eszyOg+Xg3vTTcCJF33GqMZi+pa/RKDbSvz859pI1DPYMBXf6nhx
 9QlQfRKYnUQKIK07Xo9QzaCukI09mK/wJJq3FLK3W+hvUnBNPRlTaxTXxgSuDrgK
 QAFygeUMQE2jswsYs9tiHblss75tclpJKVhoRbSOsILB93i76pbjXqm1ao177maR
 dL4Bf57HScUERRA07OrzwShLo8DP5THF1r/R8B0SLu7Jijq6U5kVQNGU79b8ix2t
 AtWqgxkD+zfeCV53LyOoLFSlRER+tvVffSSAtzGqqvkCdwLkkGuS1YVHgG+Yr6OA
 ==
X-ME-Sender: <xms:lldvYPdN2SNQnVZK0CmiUOT820ohuviB4m1h0BYQwprCCbg93fggnw>
 <xme:lldvYFM4PNns4Kb4ECEEOlI2ptHL4cxlZvySTl5wgNQlwKMBWSQdMgVE7CB8vlpWb
 KL46YKQAHinN_XADrU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lldvYIjlInfvnOuiZyFxnTfI4O1iLVxUZOWsK09aoewMyBlItHfrFA>
 <xmx:lldvYA9XV-LZwYInxaS-qCKveRAXOEZa-crdnbaJeH7mqNzV7rXFxg>
 <xmx:lldvYLtPf1dN03zMIQc7NKtfRY7jOA7Syld6JSjEcKS0unb9uOqkYw>
 <xmx:mFdvYPgeImyDiSx_ZuI3q2BMwmCAFK1hHUK2qkH4MAxMZKVQlO4OQA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C6CA24005B;
 Thu,  8 Apr 2021 15:20:52 -0400 (EDT)
Date: Thu, 8 Apr 2021 21:20:50 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: map prp fix if prp2 contains non-zero
 offset
Message-ID: <YG9XkgaNZ9VlWYC3@apples.localdomain>
References: <CGME20210408162750epcas5p1f093ab42779ab250fbcb672a41455a30@epcas5p1.samsung.com>
 <20210408162313.22749-1-p.kalghatgi@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i5/qriCO+RM3+5uS"
Content-Disposition: inline
In-Reply-To: <20210408162313.22749-1-p.kalghatgi@samsung.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--i5/qriCO+RM3+5uS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  8 21:53, Padmakar Kalghatgi wrote:
>From: padmakar <p.kalghatgi@samsung.com>
>
>nvme_map_prp needs to calculate the number of list entries based on the
>offset value. For the subsequent PRP2 list, need to ensure the number of
>entries is within the MAX number of PRP entries for a page.
>
>Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
>---
> hw/block/nvme.c | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index d439e44..efb7368 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -577,7 +577,12 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg,=
 uint64_t prp1,
>             uint32_t nents, prp_trans;
>             int i =3D 0;
>
>-            nents =3D (len + n->page_size - 1) >> n->page_bits;
>+            /*
>+             *   The first PRP list entry, pointed by PRP2 can contain
>+             *   offsets. Hence, we need calculate the no of entries in
>+             *   prp2 based on the offset it has.
>+             */
>+            nents =3D (n->page_size - (prp2 % n->page_size)) >> 3;
>             prp_trans =3D MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
>             ret =3D nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
>             if (ret) {
>@@ -588,7 +593,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, =
uint64_t prp1,
>             while (len !=3D 0) {
>                 uint64_t prp_ent =3D le64_to_cpu(prp_list[i]);
>
>-                if (i =3D=3D n->max_prp_ents - 1 && len > n->page_size) {
>+                if (i =3D=3D nents - 1 && len > n->page_size) {
>                     if (unlikely(prp_ent & (n->page_size - 1))) {
>                         trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
>                         status =3D NVME_INVALID_PRP_OFFSET | NVME_DNR;
>@@ -597,7 +602,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, =
uint64_t prp1,
>
>                     i =3D 0;
>                     nents =3D (len + n->page_size - 1) >> n->page_bits;
>-                    prp_trans =3D MIN(n->max_prp_ents, nents) * sizeof(ui=
nt64_t);
>+                    nents =3D MIN(nents, n->max_prp_ents);
>+                    prp_trans =3D nents * sizeof(uint64_t);
>                     ret =3D nvme_addr_read(n, prp_ent, (void *)prp_list,
>                                          prp_trans);
>                     if (ret) {
>--=20
>2.7.0.windows.1
>
>

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--i5/qriCO+RM3+5uS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBvV40ACgkQTeGvMW1P
DenDNgf7BYAr5sXZUdoOCTMBFYv+dWvahKLCDxr1ygDAcNbcFtw06im20q2JNtbT
CQUulLsCwvCqsEqRV5ciaLvN8BXbchHB7nUo1HqiVOYRQh28P0n+XGoOwWeh3Etw
iw6/zTflPTSmBjJop7v/gGqPC4R1oBXpZGlnl5tg0Vpu0j6QmlPwKOx81eraRHJp
GtOEnhIxe0tnhICa+P0ELasbHlJ3A0mc0z0Iu+BJXYIgBaFa0ccNwRgorSkzOQr4
G6zTb51rqJ6K9vRo1GsYLI1rr67WLAOahYvBadnZ4McTz1Mt9yugK9XOrjqz8HdT
TxZ/Vj8ZNKt4HjIJH1J4V9yXHWmolA==
=Frb0
-----END PGP SIGNATURE-----

--i5/qriCO+RM3+5uS--

