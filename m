Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED8366092
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 22:03:39 +0200 (CEST)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwav-0003j2-Dv
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 16:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYwWA-0002i7-A6; Tue, 20 Apr 2021 15:58:42 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYwW7-0007JY-FJ; Tue, 20 Apr 2021 15:58:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 872503E73;
 Tue, 20 Apr 2021 15:58:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 20 Apr 2021 15:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7j1WzjFuq34j16gxrjPzgZjMOgj
 SeYPHdW/hp8gRGXc=; b=f4UmrW23HBpMTnn525zX/vUUuHbvvDelgfKCbd0DGa3
 vqjSoK87BUw8PEqWTeu89QCEIPNivT7AE8GMXujwfJ57pWemLfN28H3NiFIqD+9z
 CRyFLadw/OxaApAtfwJlKAXfRVnULTE4iw0WAYQwEqMq5JW6+9iUlbEjgSrNbiMm
 l/43nBfIr960Ob/3W5P9aWQViCkwO+WJmFzwnwNtTQ2ixKPQT26Up+Iun2ms9ZxP
 T6xKXdxeKeoZ1yH077wZth9RGEbrAj0Wt4/ESjh2FtUIfkhXFRESvSsHzAjh5zhW
 yxxDpLLqQLV0CtHY+8W9Uk7na8X8Ubm1MxSHps1J+PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7j1Wzj
 Fuq34j16gxrjPzgZjMOgjSeYPHdW/hp8gRGXc=; b=pHFxALHuIFbd2arb0rzo38
 55rcAnlN+CJ4etUs9dK7tH2qjaEQf+WJnIipVi57YQ1QrD4ytv81Ep31PSQ9uS3E
 tdi1xw2N2Nt70eWoTBG8WZxIv0lypdTlSSuwsq8AcMrJ+NKx+CpUYevCyC3VRVbq
 /AxF5hfG4Q3bp9JGo2gX6X9UcVQJOQJXWX6LEY1Fz4J0qtGQ5AotvUDYr6pLHmBf
 EtMAAZVza6oPWw6b3vlXYBg+hAtFSvkjy31vJAt/KRaMgLNHK9nOyixCNZsW3/w2
 hC9VHXoMtWAWLF08kYSzPu2bxjQHmCwfPGKNumlhAeX/8xmVnOmDXuvANlcuXsmA
 ==
X-ME-Sender: <xms:ajJ_YLuj2Ura5yRNMbdQ-awbzyyudzJpJ1-KLq2IDVlEPYzsK_MR8g>
 <xme:ajJ_YHDGEvCxZhUHz3_8k1hAAv0Umu5T-b93Vr3-hLNQQEHWMM6JMDDTQUNY914qt
 iFz6MM7puwks8JkINI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtiedgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ajJ_YLUrp_746cLcCzvnmhQMxUL4sATdmx0S5xSFfWJbRZUwJFsCrQ>
 <xmx:ajJ_YNBvj4yr9nohbLPs4URsDv2_KEFTBoXbtWF57inwYa87HHyDPg>
 <xmx:ajJ_YG_J3Xm-Y7cued_BjlRujEF-F7MtWjP1IDpmz6eDZmpYuHvTtw>
 <xmx:bDJ_YFXeNF_oCgtNrHcPLetoO7f2g0To2ML4dx2I5t1pviUtzbk9Gg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40962240066;
 Tue, 20 Apr 2021 15:58:33 -0400 (EDT)
Date: Tue, 20 Apr 2021 21:58:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 1/2] hw/block/nvme: consider metadata read aio return
 value in compare
Message-ID: <YH8yZuln/+glm1f6@apples.localdomain>
References: <CGME20210416072533epcas5p305e83206f2b3d947e9b5fef9fde1c969@epcas5p3.samsung.com>
 <20210416072234.25732-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9j17SFk1+0mVyrDy"
Content-Disposition: inline
In-Reply-To: <20210416072234.25732-1-anaidu.gollu@samsung.com>
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


--9j17SFk1+0mVyrDy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 16 12:52, Gollu Appalanaidu wrote:
>Currently in compare command metadata aio read blk_aio_preadv return
>value ignored, consider it and complete the block accounting.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 624a1431d0..c2727540f1 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -2369,10 +2369,19 @@ static void nvme_compare_mdata_cb(void *opaque, in=
t ret)
>     uint32_t reftag =3D le32_to_cpu(rw->reftag);
>     struct nvme_compare_ctx *ctx =3D req->opaque;
>     g_autofree uint8_t *buf =3D NULL;
>+    BlockBackend *blk =3D ns->blkconf.blk;
>+    BlockAcctCookie *acct =3D &req->acct;
>+    BlockAcctStats *stats =3D blk_get_stats(blk);
>     uint16_t status =3D NVME_SUCCESS;
>
>     trace_pci_nvme_compare_mdata_cb(nvme_cid(req));
>
>+    if (ret) {
>+        block_acct_failed(stats, acct);
>+        nvme_aio_err(req, ret);
>+        goto out;
>+    }
>+
>     buf =3D g_malloc(ctx->mdata.iov.size);
>
>     status =3D nvme_bounce_mdata(n, buf, ctx->mdata.iov.size,
>@@ -2421,6 +2430,8 @@ static void nvme_compare_mdata_cb(void *opaque, int =
ret)
>         goto out;
>     }
>
>+    block_acct_done(stats, acct);
>+
> out:
>     qemu_iovec_destroy(&ctx->data.iov);
>     g_free(ctx->data.bounce);
>--=20
>2.17.1
>

Applied to nvme-next, thanks!

--9j17SFk1+0mVyrDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB/MmQACgkQTeGvMW1P
DekGGAf/d6x/+0562Vl7KbyKxbUNPCxleGApDG19zKrHz1q9+3B6q3RVRxEjmP0x
yobBac94l/+j9AJplPL5tBDwGBKpYXMVFFox2M97FInwnpfYmsB9knFOfiCfwzop
VBDW4GI7vOu3ypvuyU6iIwX9yrebJkJxkRn52ancnWRbGqz3t+GwdVSejln9DjYX
r83bhucMNbdk/N4E0my2vM9lYnytN6fXlDE54UvvdG0kmoHPHIjfKFktsrHpd2FJ
IqTR2rWqH6bkK8vosHelxqU/2iOLPJnHLq9Z1MYwoC9W3Da2szKpGMbQuEbiOpUl
mmihE1Nt2kGJpfxZfzE6WuFJLUXY6Q==
=tlhf
-----END PGP SIGNATURE-----

--9j17SFk1+0mVyrDy--

