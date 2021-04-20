Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8D36606D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:52:00 +0200 (CEST)
Received: from localhost ([::1]:59468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwPf-00013w-J5
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYwL4-0000RK-78; Tue, 20 Apr 2021 15:47:14 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:43323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYwL1-0000Mg-Hf; Tue, 20 Apr 2021 15:47:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7A57A2332;
 Tue, 20 Apr 2021 15:47:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 20 Apr 2021 15:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=G372cxz5MNJc7mW3v3ngH438YU8
 xGdC2g0FNmj+23ZE=; b=ZShs3CA2FUaJd7bwzypDKcDDdYEdrJpbGikAeyqSI27
 pkU27wxvkaV6UVmqywSerEvghfrMHcUqq+FrEkMTnGfu/8cH3urtnxrChzsoQTAZ
 7kKPGC1PBrMqfxyA06J/BbEockAoeirU2pUNl+O/k0f6JbEg8XOq/0lAvpgvKtuf
 iVrIIWf+MMZsGkifHxgZNqybXTeGDLM9gWW02n6Ro9jbJPkX+eoZu3hxmltlyHoR
 BGV6J2Qj5DZ0zV4tnJM+9HbPmXmrc1y/dJqD7TO6W4N2crvATGd4X0fMXw3ffq4c
 5lExcX5DnPaowETn2f7AIpzrVNsoHTTzw7T9/atUNrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=G372cx
 z5MNJc7mW3v3ngH438YU8xGdC2g0FNmj+23ZE=; b=tOUWwycriPBIrYypDDIJz4
 aukk7reBu9nxGZ/savgPaU+3RI4jqKhv6xppHHOaN4iVn9f6DI9hrP+++Jeu1GTR
 5hXNO8+hVArycSgaHbDbb6/KEiUkhPhhawssjkws+hTlJHzkvbyUn5dbe/BZXcz0
 TghfrA2zeQP3GLvAH4NuHPcBdV0UMeX/ID4cc9+1lmzAEBP0ctgMkdlAGM9DhiAg
 BFuMT+/Kzj7Qe25Pl6P0XfnWDAUksNU06L3NszXW5H1kARJPURyU76wJ669ig9k9
 f2GpxcU8q7Z3yYiGU7P39lJxjY/YA9wLyJxq4ypz8xahRSX2AVJiZgw+fLLT6d0A
 ==
X-ME-Sender: <xms:uC9_YJmMN9PygWesr_X2znM2UxEP6Xc2luv0kmWO_jxSPRPX95SkQA>
 <xme:uC9_YE1v-mlk7qbl79__7pPZ9-GhA1QmASfl17-Kfl5CGXHgv9sHE9fHjqFSm_yjQ
 DTg0WsMmASn26E2r1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtiedgudeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uC9_YPrp_HcveiEqOq8POpXBZ0aOyiv-X5Yo_vu2Ewh0sU4THYiJUw>
 <xmx:uC9_YJmnQRSJ35rQk0qJFSufGVshOSrai8S3vLN5Sfb48rMTTuVJRA>
 <xmx:uC9_YH2W1wejMhcoygVLF2jkoO6RJVbhGssLhjv2rWGJZ8dSsEMuVQ>
 <xmx:ui9_YBpK9dBUj4AUZyP0D3rjbX67ZT-N12eqm-J4kx2TjM5m_fvpoQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55B551080064;
 Tue, 20 Apr 2021 15:47:03 -0400 (EDT)
Date: Tue, 20 Apr 2021 21:47:00 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v3] hw/block/nvme: fix lbaf formats initialization
Message-ID: <YH8vtPtI2OkOAkOw@apples.localdomain>
References: <CGME20210416120324epcas5p354e2f196cc68680aba45341f385b59ed@epcas5p3.samsung.com>
 <20210416115907.30625-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nUNvbsyanRzwtxd+"
Content-Disposition: inline
In-Reply-To: <20210416115907.30625-1-anaidu.gollu@samsung.com>
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


--nUNvbsyanRzwtxd+
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 16 17:29, Gollu Appalanaidu wrote:
>Currently LBAF formats are being intialized based on metadata
>size if and only if nvme-ns "ms" parameter is non-zero value.
>Since FormatNVM command being supported device parameter "ms"
>may not be the criteria to initialize the supported LBAFs.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
>-v3: Remove "mset" constraint  check if ms < 8, "mset" can be
> set even when ms < 8 and non-zero.
>
>-v2: Addressing review comments (Klaus)
> Change the current "pi" and "ms" constraint check such that it
> will throw the error if ms < 8 and if namespace protection info,
> location and metadata settings are set.
> Splitting this from compare fix patch series.
>
> hw/block/nvme-ns.c | 58 ++++++++++++++++++++--------------------------
> 1 file changed, 25 insertions(+), 33 deletions(-)
>
>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>index 7bb618f182..594b0003cf 100644
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

This part LGTM.

>@@ -395,10 +385,12 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, Nv=
meNamespace *ns,
>         return -1;
>     }
>
>-    if (ns->params.pi && ns->params.ms < 8) {
>-        error_setg(errp, "at least 8 bytes of metadata required to enable=
 "
>-                   "protection information");
>-        return -1;
>+    if (ns->params.ms < 8) {
>+        if (ns->params.pi || ns->params.pil) {
>+            error_setg(errp, "at least 8 bytes of metadata required to en=
able "
>+                    "protection information, protection information locat=
ion");
>+            return -1;
>+        }
>     }
>

If you do this additional check, then you should maybe also check that=20
pil is only set if pi is. But if pi is not enabled, then the value of=20
pil is irrelevant (even though it ends up in FLBAS). In other words, if=20
you want to validate all possible parameter configurations, then we have=20
a lot more checking to do!

Currently, the approach taken by the parameter validation code is to=20
error out on *invalid* configurations that causes invariants to not=20
hold, and I'd prefer that we stick with that to keep the check logic as=20
simple as possible.

So, (without this unnecessary check):

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--nUNvbsyanRzwtxd+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB/L7AACgkQTeGvMW1P
DekRLQgAo+y2UcwV28J0PhrkXpJ4d8VbzxHXrKJCOrt8OJ/OkmKPXcQ3IY8jGdq/
0qiV4iqbg5T3c8lar8t4CG7rJIIDX7jg2rbVQxuqh1QvRQVy4Zcukkw3nf5huAmD
5WnlJdbWguDCRg0Yxi5wmmjzpNULCjBedwkbXaMl+8WLFxNaWyHQnevRyETQMnYE
Eex2C4/z5FfGz/3OL+XpmqibtWUUL6fw4pWHQsCsKx51OU7d7CyE6BT6ZTKhxYcR
QtFYPrjYd4aCGJ+Ow2sHUBVaSWPxdmnoBBiPWE8/kBK46Y+liMTL5lyOXeiZSyJq
g4dzHvI/q0OUHe0VfrRK8AOot0Mggg==
=b6ig
-----END PGP SIGNATURE-----

--nUNvbsyanRzwtxd+--

