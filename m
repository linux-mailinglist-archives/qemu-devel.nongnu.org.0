Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD5E3F7459
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:29:05 +0200 (CEST)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIr5b-0001LQ-Q3
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIr1f-0008UN-CH; Wed, 25 Aug 2021 07:24:59 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:37699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIr1c-0005AE-0c; Wed, 25 Aug 2021 07:24:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E56AA3200A36;
 Wed, 25 Aug 2021 07:24:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Aug 2021 07:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=JCDUkYgna/foQ5eD51EwgubB3B8
 a/YKbTv7IMhXq0dA=; b=ivs833oy7jBnLPJOlRNCRIkU3N9WrmBBLp+dD8NAIol
 gRLJnaqJQt/EyLdZPut0iIUJa1PdeHzU7Vig0tsxlKHqvTzlvp8e0TQFXxPXZYwt
 dxn9Jo2hxofw1z0wPeW87xijs5qXFRtWtpZjQyuLvnKc3+vsPou+lggZk64aeOvq
 01rX376seBHKC5C7qugc0xh1Xyc3/NDFcFgDJRfPX4QTJqA1RsxvBZvqivjtdt28
 b5bmd428z1PqROEN6h9bTO7cSHNSZidUXY3K97qWmp4eTYiXn6lsMCPBHSfeOGe9
 Pd2xeNoUE048joqq/QQltsj7crRZuL87UgH3E2Hv01w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JCDUkY
 gna/foQ5eD51EwgubB3B8a/YKbTv7IMhXq0dA=; b=dELPU1LwjDQRCFdPqRnfjj
 hz0S1H8meX/l0oKU96o21pkO2mhInWntSlxsE5hkHtnjk0vWA8kM3OSBjo6puYz4
 yFcUfCH17xY8u6YQT8Zk/fhg5XWELUfU0VTzflCZ9zHR9uC77yorQZZvXfgvKUsN
 yEEg/c9Xyp/SRnsUFYUfw6LVUuez0CMQ1abK6tpj+SdNqYCyJ1GqnMcvIcar8SeP
 apevP24kjglo708AGAj0m/V/k01hM4/CGtb971FjDk118QZj/hlMid0eF0VNLrYR
 JdA/j/1pEiFQ8w6Oumy595woJ7D/c07rP1SXP52OqSaoJmltuLBhZc5YqKqayNxQ
 ==
X-ME-Sender: <xms:gCgmYbcikKcLLxIoHxKUMXxjVlc8FdMLn4Zo_RHoD_zL24GPxBQHww>
 <xme:gCgmYRNOOdLUQQqbwwoy71xFCP61GrOzOy-ZvygurUK5lRDJX3af1KRQHsIzS8ADx
 1c_0Xoc03p1rhhdyoQ>
X-ME-Received: <xmr:gCgmYUiob2l-hLwEiJoN6a9P3pTmGYyoe_refpBiAaHpBRHFp44YrpWHmujHypv9oa8_ABPQfi7N61kzDS_CTwVPmZu8SkLwiP7D80Xdbl6QwKD8ow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:gCgmYc_C_gxgWImqjR5h3oyBDz5qnssm-uoJ399tslqaze7O7605YA>
 <xmx:gCgmYXuwlsA7lb9mpS9cz64m922Cs7tdiZyvgJD42apnHyW6OcqhsA>
 <xmx:gCgmYbFCAj9GEApLio3Dm99PVSgOSaQ3yP5J9biA1CnO4O5PDZTB2Q>
 <xmx:gSgmYQ-DLkZFJ9lWuugXcUFBB4mPOH5IGAR2V6CKhCkCEJQWJHjSOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 07:24:47 -0400 (EDT)
Date: Wed, 25 Aug 2021 13:24:44 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/9] block/nvme: Have nvme_create_queue_pair() report
 errors consistently
Message-ID: <YSYofOKNbWdEdK9M@apples.localdomain>
References: <20210824141142.1165291-1-philmd@redhat.com>
 <20210824141142.1165291-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eelCdcpEk8sXJKJd"
Content-Disposition: inline
In-Reply-To: <20210824141142.1165291-3-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eelCdcpEk8sXJKJd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 24 16:11, Philippe Mathieu-Daud=C3=A9 wrote:
> nvme_create_queue_pair() does not return a boolean value (indicating
> eventual error) but a pointer, and is inconsistent in how it fills the
> error handler. To fulfill callers expectations, always set an error
> message on failure.
>=20
> Reported-by: Auger Eric <eric.auger@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  block/nvme.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/block/nvme.c b/block/nvme.c
> index e8dbbc23177..6642c104aa4 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -220,6 +220,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMe=
State *s,
> =20
>      q =3D g_try_new0(NVMeQueuePair, 1);
>      if (!q) {
> +        error_setg(errp, "Cannot allocate queue pair");
>          return NULL;
>      }
>      trace_nvme_create_queue_pair(idx, q, size, aio_context,
> @@ -228,6 +229,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMe=
State *s,
>                            qemu_real_host_page_size);
>      q->prp_list_pages =3D qemu_try_memalign(qemu_real_host_page_size, by=
tes);
>      if (!q->prp_list_pages) {
> +        error_setg(errp, "Cannot allocate PRP page list");
>          goto fail;
>      }
>      memset(q->prp_list_pages, 0, bytes);
> --=20
> 2.31.1
>=20

Looks like

    r =3D qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
                          false, &prp_list_iova);
    if (r) {
        goto fail;
    }

should set an error message as well.

--eelCdcpEk8sXJKJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEmKHgACgkQTeGvMW1P
DekEPQgAjVuiH9lhKPFJHOqGIC6fxcV5PrpWucis3QLS0cDV8U6md/VBgGUD/9wB
ZgXvMYkESr9iMsPW1uFXr+ETgxTC6Uu8AUKoLe735KL2Edkol5xo3Y0WjYWOwkOW
Wn7iTzOz4WceN/gxAIBKj+E7kOT0KD2NuZgDH2U19GrbFLRBHvylWU23ezkNMeZJ
FJHZaCH8ODu0aKVFt9o3pN/aRcv1kNhvlkHgky8DoeTsqBOJXAPwPpwx6Q4syPRx
RmeraCWZbEy1JGVc6Mo/d+q8k+KKU6+0WpKjSCnPdxk16zQLAEx2nV47FJpxT3md
fNBqtchuHH1jlC70GE/lQJYa5ebwIQ==
=v6sz
-----END PGP SIGNATURE-----

--eelCdcpEk8sXJKJd--

