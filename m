Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4085BE1E8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 11:29:13 +0200 (CEST)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaZZ2-0006Sy-Fa
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 05:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oaYyf-0001hx-Sz; Tue, 20 Sep 2022 04:51:38 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:44381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oaYyT-00042u-E2; Tue, 20 Sep 2022 04:51:37 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2031C320090C;
 Tue, 20 Sep 2022 04:51:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 20 Sep 2022 04:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1663663876; x=1663750276; bh=4a
 inM1Eidgf5v0tdvMdrXiyZvkM4pPO9YNp2owtZVt0=; b=gXEV2rlrNT7SUQYc+B
 ylcmEId+ffJSKK51PXFlFnIdzBUAZgW3JZ2b5VgNS+aBPJVTkqcIOEGvbybssdU5
 61T7p4mZl2ZbVZnyvBtt36Hz8sV4GxyLcIm9VdRMnEaeWp3UPRO5jB0/YMBl80Og
 b++fq6sGXuWEU2kzFyY/OqdCyh6gJWn4Acc0Wim5YzgMQ12rNtqKnOe/LdZQo+kF
 vhh1GHL11zar6CKq1UihAXdTIaZMg5whD8ZSFhhCyRjfHBQm+Y0kC/d6YsET/L/V
 ySytCsPDE5sUWlC0owsDinilrHOUGkaPj2FWalhxYn40Ix0ck+yjMs+Sr0IsFCHF
 HxJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663663876; x=1663750276; bh=4ainM1Eidgf5v0tdvMdrXiyZvkM4
 pPO9YNp2owtZVt0=; b=B01+Hb8fxwCv/KPY2I/V/iesIhRaegEaNUQ/Vlab3Yxi
 T7v732gWrazSVRtJxbSxUQvuUdGA7gL52Okf2Zrh33rW8mqXiT3LsDYcjJ2HfDCz
 tYT9lppvwViE7TBBzBYUW1gY+EUh2ByJFX4HJ5MDAY0Q1O1KZM1t/4hmVi40bfxl
 JwfdkHHCsGQtXdqcEyh9owE3IpfawhsF83wfj4TVxdMDEJ3P/GAeNvLHxMqtevIk
 6DibYFboK9f7+8ID9Bmjq5Uif6ht1o7hfQVOYDOOGfPXcIP3HrJU69HeMZH8nWUR
 Sq2LeQX7h3j7e6pwowukYd0msiv4Fxi910gHdQbqiA==
X-ME-Sender: <xms:A38pY2TVULNbHuhTnIKZTLROy9aHTqNocbgShGDPQRVpQq3tivk62Q>
 <xme:A38pY7zPSLHE_UMisGch9tnTsuhfl5NEdZErKPvrz9e3QEzbg7um4I7FcrwTeMXnB
 WXxQM6qVMLBaSDfans>
X-ME-Received: <xmr:A38pYz2zU2emE0e-QDmfU-t67LGWKOMDeBjOP61lkyxwiRvxgUPPWio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:A38pYyCLy5iYz4kZWMnyOPBA705BvfDvyO1nPtqTyRzDkT51o28GDQ>
 <xmx:A38pY_jAbCuTGn4_lE2pgArqyBbigg6scZWamIeJKyj5X4-oT0Vajg>
 <xmx:A38pY-qVM6hP7_bdxYKm7zBEWwLaJ3wB79txnP5wddLzx-_3Oe0b7g>
 <xmx:BH8pYyr34ggsl62g0GF_Z_H8p0zkeBdVYsQlTKIfzi_HasuAn6Dv1Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 04:51:13 -0400 (EDT)
Date: Tue, 20 Sep 2022 10:51:12 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com,
 Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v9 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <Yyl/AC9X7uHyeTCu@apples>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-4-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OYU47mRhbLCfprsv"
Content-Disposition: inline
In-Reply-To: <20220910052759.27517-4-faithilikerun@gmail.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OYU47mRhbLCfprsv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 10 13:27, Sam Li wrote:
> Add a new zoned_host_device BlockDriver. The zoned_host_device option
> accepts only zoned host block devices. By adding zone management
> operations in this new BlockDriver, users can use the new block
> layer APIs including Report Zone and four zone management operations
> (open, close, finish, reset).
>=20
> Qemu-io uses the new APIs to perform zoned storage commands of the device:
> zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> zone_finish(zf).
>=20
> For example, to test zone_report, use following command:
> $ ./build/qemu-io --image-opts -n driver=3Dzoned_host_device, filename=3D=
/dev/nullb0
> -c "zrp offset nr_zones"
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/block-backend.c             | 145 ++++++++++++++
>  block/file-posix.c                | 323 +++++++++++++++++++++++++++++-
>  block/io.c                        |  41 ++++
>  include/block/block-io.h          |   7 +
>  include/block/block_int-common.h  |  21 ++
>  include/block/raw-aio.h           |   6 +-
>  include/sysemu/block-backend-io.h |  17 ++
>  meson.build                       |   1 +
>  qapi/block-core.json              |   8 +-
>  qemu-io-cmds.c                    | 143 +++++++++++++
>  10 files changed, 708 insertions(+), 4 deletions(-)
>=20
> +/*
> + * zone management operations - Execute an operation on a zone
> + */
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZone=
Op op,
> +        int64_t offset, int64_t len) {
> +#if defined(CONFIG_BLKZONED)
> +    BDRVRawState *s =3D bs->opaque;
> +    RawPosixAIOData acb;
> +    int64_t zone_sector, zone_sector_mask;
> +    const char *zone_op_name;
> +    unsigned long zone_op;
> +    bool is_all =3D false;
> +
> +    zone_sector =3D bs->bl.zone_sectors;
> +    zone_sector_mask =3D zone_sector - 1;
> +    if (offset & zone_sector_mask) {
> +        error_report("sector offset %" PRId64 " is not aligned to zone s=
ize "
> +                     "%" PRId64 "", offset, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    if (len & zone_sector_mask) {
> +        error_report("number of sectors %" PRId64 " is not aligned to zo=
ne size"
> +                      " %" PRId64 "", len, zone_sector);
> +        return -EINVAL;
> +    }

These checks impose a power-of-two constraint on the zone size. Can they
be changed to divisions to lift that constraint? I don't see anything in
this patch set that relies on power of two zone sizes.

--OYU47mRhbLCfprsv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMpfvwACgkQTeGvMW1P
DemdyAf/QTONQeJm1UUkrHLTZTcjPf7O8D2Djn9xA2hm67Pj7xTFUOqgAvO2/yO8
EfRjPgJJ1w8mAkByb/h1rL8ZrasPG6REQopDFOQrL1szu2b7LyWOjzveuqfwKdKN
cLCM0coG07lIz7z///17aQmVMrEgr3JoaN618we0M6ciQvVd6gmLlJta/CcA7JZN
AfwUdhvLb+0gAcSIU8e7fJPFCmp1FefBF8Dt4IaLxrTj+Ajli50yymI56v5UaeZr
gOIylwPxeN5o2vymd1YWWlyLN146RiXj1aXxCZrYQ7gVwKB6syGqA4xNv+CEtNV9
DwfDrdIz93NPYIUHcFvqS3zED/Jr9A==
=uvY0
-----END PGP SIGNATURE-----

--OYU47mRhbLCfprsv--

