Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4B2FB316
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 08:36:53 +0100 (CET)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1lZL-0007c7-89
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 02:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1lV9-0006jL-Ao; Tue, 19 Jan 2021 02:32:31 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1lV6-0005pv-Hl; Tue, 19 Jan 2021 02:32:30 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 35B7810B6;
 Tue, 19 Jan 2021 02:32:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 02:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=AUY7jCrLeXfEKnoxWpYO+ytL9Gd
 Gs3gE+SLzhSAJnj0=; b=gEFy83JKxz9TuQXwHfK3q6jlXOgveF6uek9h4Bs9PU5
 /xdX1xGzE+L4EEeBIC8ix3TyEM3/+e5TR2Rh2KDGkGanHgRIKmBiDr7oxR3PzvHS
 2VOPohX/sptM3imWF2fEgGnybSp9CbLyqUwLCfoiHFOv1j7kfGnKayOPV/ikUEUZ
 bfkhLjqMwg7dRh1/47NTK1hKcFrhp+GxPqxNe9GMpfJf+dTPPdwJm9wUEpab53+T
 +1wXsbK7cLwC7uNJVfZC7C/rgcdIlWlb9Ixf/2vvRqoFFPGiP59lfP+pt83SEwGy
 vBqC+JGq17WsUNF5HGLXxGJfS2jlD4IK0iIEtfFoyuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AUY7jC
 rLeXfEKnoxWpYO+ytL9GdGs3gE+SLzhSAJnj0=; b=kYcauBLyHxn5zj72i5gg8K
 Ed+l8o8XM1bAjSz+uzf0U2oPkkYFoJPvCOBgmo4n1+hhqyzYEhWd9diz9t/oD/FN
 h4kty2UDhBVAdj+nH9gRClDBmyo4yITvJPBYD8wNZPVSPpDqdRCbUPSJy9q8mMp/
 WfByzs5UJOKeDigJLsInFU5xMDCErIRJ2lvSWu87BB0L5AB4zwfJZul7VooW1TMu
 X/cjj8CQ679DkFQ2AZfGXgVMD4mTxIjcB3KvKbsOVcIECnKwty2J5/XHzqXPgSuu
 KB+/zD0V/NH6vHGi7NLnEhtSExjev/7R0NLuCkXRF3K8n+KHWueSNzPRJS+hSjCg
 ==
X-ME-Sender: <xms:CIsGYBtdCV07EQ5x2HYHFhu9pBl5GUaqXKBL0QNxVWy4GjEd6MQfgg>
 <xme:CIsGYKcCfY1fP6zCwDj3Lc6MqWNaI9THyFy2C2VnpbJhAUYl5d4_5MaW3YO8nOjy9
 Vis6PCjLHs-jTYx9pA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdelgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:CIsGYEyD8Mm9b0I-UMoVc1rqUCZWk7GAPvaw_m2FU999uncr9og7uQ>
 <xmx:CIsGYIObUUg1IXgHIKyihmM-TZwdMic2kjJICHS4SceoLzhan4KkgA>
 <xmx:CIsGYB-tfk-zxFjMYPrcvF3u8HfxvBxYP4SET8u1hStQypUQsV5gEA>
 <xmx:CIsGYNZQWUIW1NCHN7f93RhQ9OCfIDSDykuYQgAcXL4U4XHIJtnnug>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58AE024005B;
 Tue, 19 Jan 2021 02:32:23 -0500 (EST)
Date: Tue, 19 Jan 2021 08:32:21 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 02/11] hw/block/nvme: open code for volatile write
 cache
Message-ID: <YAaLBWVT+g5q/paE@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-3-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kZUY9LoWDGW6x/NP"
Content-Disposition: inline
In-Reply-To: <20210117145341.23310-3-minwoo.im.dev@gmail.com>
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kZUY9LoWDGW6x/NP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 23:53, Minwoo Im wrote:
> Volatile Write Cache(VWC) feature is set in nvme_ns_setup() in the
> initial time.  This feature is related to block device backed,  but this
> feature is controlled in controller level via Set/Get Features command.
>=20
> This patch removed dependency between nvme and nvme-ns to manage the VWC
> flag value.  Also, it open coded the Get Features for VWC to check all
> namespaces attached to the controller, and if false detected, return
> directly false.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme-ns.c |  4 ----
>  hw/block/nvme.c    | 15 ++++++++++++---
>  hw/block/nvme.h    |  1 -
>  3 files changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index 32662230130b..c403cd36b6bd 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -89,10 +89,6 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace=
 *ns, Error **errp)
>          return -1;
>      }
> =20
> -    if (blk_enable_write_cache(ns->blkconf.blk)) {
> -        n->features.vwc =3D 0x1;
> -    }
> -
>      return 0;
>  }
> =20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index cf0fe28fe6eb..b2a9c48a9d81 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3033,6 +3033,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeR=
equest *req)
>      NvmeGetFeatureSelect sel =3D NVME_GETFEAT_SELECT(dw10);
>      uint16_t iv;
>      NvmeNamespace *ns;
> +    int i;
> =20
>      static const uint32_t nvme_feature_default[NVME_FID_MAX] =3D {
>          [NVME_ARBITRATION] =3D NVME_ARB_AB_NOLIMIT,
> @@ -3108,7 +3109,17 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, Nvme=
Request *req)
>          result =3D ns->features.err_rec;
>          goto out;
>      case NVME_VOLATILE_WRITE_CACHE:
> -        result =3D n->features.vwc;
> +        for (i =3D 1; i <=3D n->num_namespaces; i++) {
> +            ns =3D nvme_ns(n, i);
> +            if (!ns) {
> +                continue;
> +            }
> +
> +            result =3D blk_enable_write_cache(ns->blkconf.blk);
> +            if (!result) {
> +                break;
> +            }
> +        }

I did a small tweak here and changed `if (!result)` to `if (result)`. We
want to report that a volatile write cache is present if ANY of the
namespace backing devices have a write cache.

--kZUY9LoWDGW6x/NP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAGiwMACgkQTeGvMW1P
DelRuQf/fCaZEGlXcy/XRT37FBK5t79FjWIvI0Zpf7WWFWplrhDun/fOO+l0FwYT
O28URlUzYBGFy1T09SmOpmAujljsVNnYo2y8U5ONvuOeDjS0mtMo5WSvmIBcSwzL
NLuuxp8fjDMbdxefSAfFNoFSvOQMZEHPJvWghl2autzyCYaLvYgDLZIzcZVCvXp7
8oQnMT68Hhis0T1rDbGhWMUzVbnyHvlvfyc48VUAuWyK8FSPeXSPrHKf5kI0pjGQ
SZaeoGabp4pHf+7b8bgVWouZAKmuM5FDXePbAafywUVoa4/xXElEkujxLb9j1w4I
qr6wXDsBzX9CtQ506FjInLz9kOGBjA==
=xg2R
-----END PGP SIGNATURE-----

--kZUY9LoWDGW6x/NP--

