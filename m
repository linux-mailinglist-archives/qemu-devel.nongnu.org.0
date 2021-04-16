Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F482361F8B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 14:10:44 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXNJ3-0003s3-R2
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 08:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lXNFL-0003Js-OS; Fri, 16 Apr 2021 08:06:51 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lXNFI-00063p-4t; Fri, 16 Apr 2021 08:06:51 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CC5D45C0110;
 Fri, 16 Apr 2021 08:06:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 16 Apr 2021 08:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=tYtOQaqdCsqK/JH1/Zi4OtRAoS3
 9A/xG4osJJXYnIck=; b=BunjZxnGnAH2h+lkHPH1kHtc8ZVNngbaLOFk0Ya8wSQ
 n91bhH9IY3lFEsHeiuLMObQ0Mtae1xVLwnhehwlXFle7U5WL1bJ3ZEjfg4CD5tXW
 UepD3JSg3vj42csy0NgDddeXkkQJkHMopgpTZ2Q4eVg6e9Nq5r8KUjnlZ9/vTtYP
 txNvOW/B60Jf/F7Sk0KYsp36zCaWOAD2/+kkLoIb+k0W15PDmpSlO+dsdAJT5dT8
 K2kUL0icUOIXd3hQB91H+mYHPGSFM1Lh2wYPBJR7y87RTPshctia94Lb26731PYd
 dzeb0vi3WDwGyrB6i2SWEgp2t0fSfcdksdzkbA8AW6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tYtOQa
 qdCsqK/JH1/Zi4OtRAoS39A/xG4osJJXYnIck=; b=bjNiGrZ3vzVS6ZYE9QVj+F
 f5ejWkHZtCAEvFtRQ+KaAqTEvc3J4tAM76bWxqFn/uOFkF9XSWjSOZwxEZU2morh
 4DkpT4VzgGxa+qvAMX/YArDwIIULCvO+XBY6mANs4ZX3GwpfOnf4J1prYPV2rph1
 m/mBtcVeFKssPqo+QgC8LJJBqvmeihYYUzE0iSakLGO5nCOZe0QoRxLSwpVQsqlK
 JgMVMvsr2E46w1cJetOB0J65suHmwz5YOhHIeLEgkZoqGGyt/bfJ5qkwO7h0eHUi
 ZZ1dZlQKTKxaVVgsN0kNV/ENFduTNihOKyGkU4iQ62mWwQbtiEv1oEqXPDNs5Gow
 ==
X-ME-Sender: <xms:1X15YF-mA8osC5vHVbUdmXqjeddtZmULknvbJwkn2MJNLEHGhdL3JQ>
 <xme:1X15YJtMkVQwto1dJrhBY56HSLtWLDVO1D-gIeDTL38X5meP5fIvgEJ7pNZykUSfN
 YGzWtyyY6IoeI_rC2E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecukfhppeektddrudeijedrleekrdduledt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1X15YDA49YyOtlR9oou5Z88XeN8Lg9iNkZlSbYSmPkLkvgYkASNcGw>
 <xmx:1X15YJd4BwYwu5vDjbZreezXAKdbHmFuEvf750kdi12amRY_YOchvA>
 <xmx:1X15YKPG_aCtmf6gaNrLXWruJwZEBXWU3hnIMzzloRTMPuE1pNJ1OQ>
 <xmx:1n15YGBhswCNi5U8jKHLidZ1svRZ9M84hT12y3YBTM1Dqgk37Hp9pg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6CBD41080067;
 Fri, 16 Apr 2021 08:06:44 -0400 (EDT)
Date: Fri, 16 Apr 2021 14:06:42 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 1/2] hw/block/nvme: consider metadata read aio return
 value in compare
Message-ID: <YHl90ktSdfhCOdYZ@apples.localdomain>
References: <CGME20210416072533epcas5p305e83206f2b3d947e9b5fef9fde1c969@epcas5p3.samsung.com>
 <20210416072234.25732-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GC7oygq3qN54GJlx"
Content-Disposition: inline
In-Reply-To: <20210416072234.25732-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--GC7oygq3qN54GJlx
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
>

Good fix, thanks! Since there is no crash, data corruption or other=20
"bad" behavior, this isn't critical for v6.0.

Might consider it for a potential stable release though, so I'll add a=20
Fixes: tag and queue it up.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--GC7oygq3qN54GJlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB5fdAACgkQTeGvMW1P
Del7ogf/QCDRbed9UjzgmfSiJqV6jfzDjBjApdgmg59k3t/2n9u1Z4wO9d1QoMwy
5tP552BECwqatcaYiPyvXWKfxwKQLYlnOBqMcTBdMg470v4RhdOklcuzhWfzM/xe
qitggicfTWyv/91Thq2wFxF6Fh+2ICaYhPNkphi9+vxESToqF/7Wyts/9/EYHZHE
M1lpE0ZDhbLWR2z/bUJmjMgJiOGRl6FfnTrcox3xKIM2FYP/+ePWP3H5jul5sIQo
09pbRXyjP3O2IqPM5uI+Fb0y7CVuObTLwjs4J83YkZs95QnVD7SRk+/cs74EmlBU
5Khqu4NBNqXAAS5eChSRVMWB+OvpMw==
=6OXt
-----END PGP SIGNATURE-----

--GC7oygq3qN54GJlx--

