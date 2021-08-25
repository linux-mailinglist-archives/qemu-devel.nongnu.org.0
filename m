Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807DA3F7473
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:39:51 +0200 (CEST)
Received: from localhost ([::1]:41594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIrG2-0006G9-1q
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrBA-0000of-7y; Wed, 25 Aug 2021 07:34:48 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIrB8-0003PG-HC; Wed, 25 Aug 2021 07:34:48 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CAC6432009C8;
 Wed, 25 Aug 2021 07:34:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 25 Aug 2021 07:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=XgSlKUw/SZVY0bBTCIHeIayhISu
 PMtF7mULE0GbA/0U=; b=kNqI75WpekpnNV9wkpj3LqUeEdxjE9EhAjrZR79VEPZ
 wnnm1xOw/gN2CSGKnW7I/+3bWmVrcdIHiwvran3zXtsLWvp9a8shuj9RkFfKc94Y
 aQlFFgmHyywJ1SeQYG3zXQ7vUyzeqfIynOAlup5raLpA7y5pBpTJX8hYCE+mFSUr
 uL9GyKtsKDeAMOnUNWikaYCwalTzdFTFk/mAivhBjztnfdGm1jPlrcP/Sn+jkEh0
 FOuZ5XZBUJKVXbZbP2IBbbAvmrpC+Jb7qaOLtfexMCIX6B/D6aJRDtturB6Rr6bU
 CV9m5Q5XB4g+4e7f6jiYY7iSW/G07H3ju8Z8Uc2eglg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XgSlKU
 w/SZVY0bBTCIHeIayhISuPMtF7mULE0GbA/0U=; b=Q+AxyAg6CuH9/uzOhrYU3+
 9v7z3mHNZRydIXe6WvTp9toArQaphYoA46jnGFvEUYQo2wPrkLBJ0aJIIJ57MFFW
 Htk2WWozpILYVMyKlvruc7Irwk9ukOnR+8EgYLJtSmCeETYEMPwu0x6VUUbFG3+q
 Cig8wLd5qpAV2MXQSQ78ZORCPCF0fnqCS88I1nZYDz46qhhhKDVoES0TccQTHK24
 T/iqiVaxayqxeZ3Ib0sTrWCJWhvFQcfjeli7OZrm29/13aGsCTJ+T3jsGHY0DTAV
 Pmijnmp3UN1nCs2H3XrHd4i7yjDeoPvIb2eDYK6aRBqOiiTo6nbKRI6v0wkdqtTw
 ==
X-ME-Sender: <xms:0iomYduuaxhM5Zg59lPhwWlVSgnv5Mo68kpx1n5hmYOJI0YT9rhQCA>
 <xme:0iomYWdRzIjXKjJJ6xDXkeL_JN3wugsR-JIIGcADdi95NBHFaooAGkBRdyswjtnm2
 YrUxNr8mMdw_pFvVtU>
X-ME-Received: <xmr:0iomYQyLdSQhV6EmkAcTHxyQKlKm6qetW_tDBR-gGyrZKoX0g66RzFvRm2McyUKRv3afLdSxM8qRnGEdGtSoDPyz3FsC1ARrM-A9vnR43ZDKoDhteA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0iomYUNo7PzMioHGNFNP881knVqgjEn8-UYGANe9x3DxceeNITFMNA>
 <xmx:0iomYd9aXIrcnYMfKHj_Kp0gE7x-TJ6s4lMH1j3qvV82k0DzD392Qw>
 <xmx:0iomYUWncYvrf2yttWdy69RoHrv5ii8VBiAfmdwVYjmWZQZ7b_wtrA>
 <xmx:0yomYWMDmcnEVoXtuYxEc39Dz7xg2Zf7GtHK-5APTZraidg13h1amg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 07:34:40 -0400 (EDT)
Date: Wed, 25 Aug 2021 13:34:39 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 7/9] util/vfio-helpers: Have qemu_vfio_dma_map()
 propagate Error
Message-ID: <YSYqzxZfZbmnVvRo@apples.localdomain>
References: <20210824141142.1165291-1-philmd@redhat.com>
 <20210824141142.1165291-8-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KtK62iw1ZbxmogmW"
Content-Disposition: inline
In-Reply-To: <20210824141142.1165291-8-philmd@redhat.com>
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


--KtK62iw1ZbxmogmW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 24 16:11, Philippe Mathieu-Daud=C3=A9 wrote:
> Now that all qemu_vfio_dma_map() callers provide an Error* argument,
> fill it with relevant / more descriptive message. Reduce 'ret'
> (returned value) scope by returning errno directly to simplify
> (removing the goto / 'out' label).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  block/nvme.c        |  1 +
>  util/vfio-helpers.c | 31 ++++++++++++++-----------------
>  2 files changed, 15 insertions(+), 17 deletions(-)
>=20
> diff --git a/block/nvme.c b/block/nvme.c
> index 663e5d918fa..80546b0babd 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -240,6 +240,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMe=
State *s,
>      r =3D qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
>                            false, &prp_list_iova, errp);
>      if (r) {
> +        error_prepend(errp, "Cannot map buffer for DMA: ");

Ah. Here is the missing error message that I noticed in patch 2 ;)

>          goto fail;
>      }
>      q->free_req_head =3D -1;
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index 3e1a49bea15..f4c16e1dae5 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -729,7 +729,6 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t siz=
e, uint64_t *iova)
>  int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
>                        bool temporary, uint64_t *iova, Error **errp)
>  {
> -    int ret =3D 0;
>      int index;
>      IOVAMapping *mapping;
>      uint64_t iova0;
> @@ -742,32 +741,34 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host,=
 size_t size,
>      if (mapping) {
>          iova0 =3D mapping->iova + ((uint8_t *)host - (uint8_t *)mapping-=
>host);
>      } else {
> +        int ret;
> +
>          if (s->high_water_mark - s->low_water_mark + 1 < size) {
> -            ret =3D -ENOMEM;
> -            goto out;
> +            error_setg(errp, "iova exhausted (water mark reached)");
> +            return -ENOMEM;
>          }
>          if (!temporary) {
> -            if (qemu_vfio_find_fixed_iova(s, size, &iova0)) {
> -                ret =3D -ENOMEM;
> -                goto out;
> +            if (qemu_vfio_find_fixed_iova(s, size, &iova0) < 0) {
> +                error_setg(errp, "iova range not found");
> +                return -ENOMEM;

Just curious.

Previously this did error_setg_errno in out. Why don't we want to do that h=
ere?

>              }
> =20
>              mapping =3D qemu_vfio_add_mapping(s, host, size, index + 1, =
iova0);
>              assert(qemu_vfio_verify_mappings(s));
>              ret =3D qemu_vfio_do_mapping(s, host, size, iova0);
> -            if (ret) {
> +            if (ret < 0) {
>                  qemu_vfio_undo_mapping(s, mapping, NULL);
> -                goto out;
> +                return ret;
>              }
>              qemu_vfio_dump_mappings(s);
>          } else {
>              if (qemu_vfio_find_temp_iova(s, size, &iova0)) {
> -                ret =3D -ENOMEM;
> -                goto out;
> +                error_setg(errp, "iova range not found");
> +                return -ENOMEM;
>              }
>              ret =3D qemu_vfio_do_mapping(s, host, size, iova0);
> -            if (ret) {
> -                goto out;
> +            if (ret < 0) {
> +                return ret;
>              }
>          }
>      }
> @@ -775,11 +776,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, =
size_t size,
>      if (iova) {
>          *iova =3D iova0;
>      }
> -out:
> -    if (ret) {
> -        error_setg_errno(errp, -ret, "Cannot map buffer for DMA");
> -    }
> -    return ret;
> +    return 0;
>  }
> =20
>  /* Reset the high watermark and free all "temporary" mappings. */
> --=20
> 2.31.1
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--KtK62iw1ZbxmogmW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEmKs0ACgkQTeGvMW1P
Denh8Af/QmV5eJ+7hYGMqM3LRCYcB3f3JrPjQg+xDi1VdfWw/BVPYEwHRi4Qecxw
WNhK72KpsfE1UA3dab6gVcKMJeoKmq/pNGOjrnR2jLhYLz9E/NZyBPdm9qAWvijn
O/dX1jVKUI0vW1wthhjW1SouN5UWN6Xriu0K5i+WJCN5TlEFQXY5I3jVzlk8SsbJ
7WixdjWba4b2wFA4AEuq3zO0rQ/vw7Sx6MEWN6+xFLtWV8zN1iaucIB/ntkdjaJi
Dkk8Ami76ygyMJ+hR113tTTLC5oN2C7NJcn/JkLlS3jgLFA/JGJSb5c5GS3IqYHd
o1HCmhqK+G7+4gRo+zY2TceZriC1vw==
=3NKX
-----END PGP SIGNATURE-----

--KtK62iw1ZbxmogmW--

