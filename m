Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EECE361BBA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:53:00 +0200 (CEST)
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXKDj-00008T-4S
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lXK9N-0007hQ-Pw; Fri, 16 Apr 2021 04:48:30 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lXK9J-00051u-LI; Fri, 16 Apr 2021 04:48:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 27A175C0159;
 Fri, 16 Apr 2021 04:48:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 16 Apr 2021 04:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=S7T2W9TBGp4xgA/mS9kS9vo2nN4
 pL536HLzHm8coLFM=; b=BYFpiF+P8SbBjyJD9YZQs+9Kyx1EjXaWm9Fr/YnDBeW
 OGULDYzZTMy5gLiPLUymWb1tPjfJjMnTgDW0+QDX3CNqDNzydcCLnwXgCKpSz1MY
 ziunsD8/u/5WptzXOUXksI38c6TqYl3lv1XmfemACOvEUjt7i0MZ9Pqqm+CEbVfr
 LPrUDypkgvGzO/4XgOqiEfzJMizB1Y/DNQTeecYiL3aohBKMlLdc7zuOrsm8cUDH
 2FWHMHPEiCoiRccK/KFRCbqFH82Q84j92vjBSxpdI5vZUajYMQc3+JZ2oAwYVuO7
 7BH7S/Q2sjL60Y7dbsEdUQo9bvadV7jv5y9Vi26EmfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=S7T2W9
 TBGp4xgA/mS9kS9vo2nN4pL536HLzHm8coLFM=; b=Lg3gGzXbrSrdRzPZa8Q6ga
 QAq28S1Nf+ke8y0VQLfWzQIXKay4JuxgJMffi0Wtra7+yIVvEG34SmQHaDvg3ZuS
 PA/S84YDVnWMrY+KlWUfb3fr3ML2IINpAng62IqsfclgjBWNqpV3jQpdgIRlawhm
 ej5NWGVg1j2z8/48p3cMiMtHrpy2ph/DkIXJalZJuhOG/xAFcoD/fZ3RTlDmLrAZ
 414CyhRgKkfM4zu56sqItQVMN33u7PSNOCWqHLh5Aolg4RSTvRo/1+4XTbdJNQfZ
 9pJsZG6I0aEF3KoPh7WS2KX8cZXfu+Y0hIUAb/4Qm7oggQqeTTdC3gyynCcmyXKg
 ==
X-ME-Sender: <xms:U095YMUGbyhTWUmSGA9nJ11flLe6EZZshqJ2JFN03mBggYaCa_UBiQ>
 <xme:U095YAn87FIzyd5iYfblrX8jIL9jz1nyyvvIALs0Xl7CgU-OuZZ_L9TlMtr8D_S5p
 6OLkuJ8H2HoiZ6YaGE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecukfhppeektddrudeijedrleekrdduledt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:U095YAa-A1eZTTmFs7F18pHASkBEX4BonT2NNpI9qwtbH7CW1m-kzg>
 <xmx:U095YLW4vA8OurH5VFG35GUsWOUhs_-W4tYj1tx0FfghKkr7uNwixw>
 <xmx:U095YGkHbbrnRRFeqxvx3S72rxqELiN-Ify8z3A-K53nQkIllFurIA>
 <xmx:VE95YEan777u1u506hfUgXYE6x8jZkn592xYJUmwLtq1fD62FJB1_Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 058D024005A;
 Fri, 16 Apr 2021 04:48:17 -0400 (EDT)
Date: Fri, 16 Apr 2021 10:48:16 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 2/2] hw/block/nvme: fix lbaf formats initialization
Message-ID: <YHlPUMYBcnl/Newj@apples.localdomain>
References: <20210416072234.25732-1-anaidu.gollu@samsung.com>
 <CGME20210416072544epcas5p26bf011c82ad4b60693cfaac32bc9e36f@epcas5p2.samsung.com>
 <20210416072234.25732-2-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bndTBN5M6VlKoUlI"
Content-Disposition: inline
In-Reply-To: <20210416072234.25732-2-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


--bndTBN5M6VlKoUlI
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 16 12:52, Gollu Appalanaidu wrote:
>Currently LBAF formats are being intialized based on metadata
>size if and only if nvme-ns "ms" parameter is non-zero value.
>Since FormatNVM command being supported device parameter "ms"
>may not be the criteria to initialize the supported LBAFs.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme-ns.c | 48 ++++++++++++++++++----------------------------
> 1 file changed, 19 insertions(+), 29 deletions(-)
>
>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>index 7bb618f182..573dbb5a9d 100644
>--- a/hw/block/nvme-ns.c
>+++ b/hw/block/nvme-ns.c
>@@ -85,38 +85,28 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **err=
p)
>     ds =3D 31 - clz32(ns->blkconf.logical_block_size);
>     ms =3D ns->params.ms;
>
>-    if (ns->params.ms) {
>-        id_ns->mc =3D 0x3;
>+    id_ns->mc =3D 0x3;
>
>-        if (ns->params.mset) {
>-            id_ns->flbas |=3D 0x10;
>-        }
>+    if (ms && ns->params.mset) {
>+        id_ns->flbas |=3D 0x10;
>+    }
>
>-        id_ns->dpc =3D 0x1f;
>-        id_ns->dps =3D ((ns->params.pil & 0x1) << 3) | ns->params.pi;
>-
>-        NvmeLBAF lbaf[16] =3D {
>-            [0] =3D { .ds =3D  9           },
>-            [1] =3D { .ds =3D  9, .ms =3D  8 },
>-            [2] =3D { .ds =3D  9, .ms =3D 16 },
>-            [3] =3D { .ds =3D  9, .ms =3D 64 },
>-            [4] =3D { .ds =3D 12           },
>-            [5] =3D { .ds =3D 12, .ms =3D  8 },
>-            [6] =3D { .ds =3D 12, .ms =3D 16 },
>-            [7] =3D { .ds =3D 12, .ms =3D 64 },
>-        };
>-
>-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>-        id_ns->nlbaf =3D 7;
>-    } else {
>-        NvmeLBAF lbaf[16] =3D {
>-            [0] =3D { .ds =3D  9 },
>-            [1] =3D { .ds =3D 12 },
>-        };
>+    id_ns->dpc =3D 0x1f;
>+    id_ns->dps =3D ((ns->params.pil & 0x1) << 3) | ns->params.pi;

While nvme_ns_check_constraints() will error out if pi is set and the=20
metadata bytes are insufficient, I don't think this should set bit 3=20
unless both metadata and pi is enabled. It's not against the spec, but=20
it's just slightly weird.

>
>-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>-        id_ns->nlbaf =3D 1;
>-    }
>+    NvmeLBAF lbaf[16] =3D {
>+        [0] =3D { .ds =3D  9           },
>+        [1] =3D { .ds =3D  9, .ms =3D  8 },
>+        [2] =3D { .ds =3D  9, .ms =3D 16 },
>+        [3] =3D { .ds =3D  9, .ms =3D 64 },
>+        [4] =3D { .ds =3D 12           },
>+        [5] =3D { .ds =3D 12, .ms =3D  8 },
>+        [6] =3D { .ds =3D 12, .ms =3D 16 },
>+        [7] =3D { .ds =3D 12, .ms =3D 64 },
>+    };
>+
>+    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>+    id_ns->nlbaf =3D 7;
>
>     for (i =3D 0; i <=3D id_ns->nlbaf; i++) {
>         NvmeLBAF *lbaf =3D &id_ns->lbaf[i];
>--=20
>2.17.1
>
>


--bndTBN5M6VlKoUlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB5T04ACgkQTeGvMW1P
DemqXAf8DzJipNPZJ+fW21z1IGoEWAOyom3nVlGyE+SdaCDkgL8i0YIkmhhhTLF2
7/F3JNhwLs4tdtwpnfWUoL+BlHLpG1R1r/fMGdvbBR4uxotmO2UP7FknKyz33X3F
JKnCo8/JeZl2svXnMrvTxGEPtaBFQ4iKri/Nk2DJNhbHiLgF1HKO0Ow54uKnwk0E
/EfMQ75OCZ66LIGe9yAPjCt5BJ3CpHG17L5vf/Lj2TH92H0Ml9dFu3VaXwoxbUzc
mBmmFyIu2BJ6e+8VVbni90avWZO/LN/rU05OIQl0sEpdhxT4JUWKoZR+ItH6izIm
ua16mqViiWi7MhdWLXZScbX5aHVmtQ==
=1s9v
-----END PGP SIGNATURE-----

--bndTBN5M6VlKoUlI--

