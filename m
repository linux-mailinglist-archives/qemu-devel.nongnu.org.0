Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EFD2FCD5B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:21:34 +0100 (CET)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29gC-0004oV-Cl
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l29a1-0002jk-MR; Wed, 20 Jan 2021 04:15:09 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l29Zz-0000Qu-48; Wed, 20 Jan 2021 04:15:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C3C45C01BB;
 Wed, 20 Jan 2021 04:15:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 20 Jan 2021 04:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=yvJpeiBgZL8eSHn1fStUOFyFZD3
 tEL/4hXdbelVNaJw=; b=A66WtKv4mliTtSrsPnH7HRepefF+/6GWXzp5M0j2ycQ
 yw5ihjtxPBshCz6Ky5qv7nRDGwynbELX3XaW3abeQ1D91bsUup5o6v6DTLPzL26O
 z//5yoClM4NHgL8WDo9WWVnw2i4WNdgkz5Tz2FW5j8dQCzMaXeyuKPzWc+hwAPTp
 T4Ojv4nZSoHWfSQKt4NAc0hXjUccnCVJZVbq4n8kn8tWznqh1NMZx2L95jg3k4k0
 aII02CJep4cuBAEkSKWNow3ebvMsy/3xuJ4tJl1wl1bIClr3dvUazP9kGLpTwDez
 JSR+imP7QVrXiBszYMuC6DiBTdfvgTpCWlzu+d5xnCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yvJpei
 BgZL8eSHn1fStUOFyFZD3tEL/4hXdbelVNaJw=; b=RshSaHczg5ZxzmQqrvrKij
 kwqe64GYmYESwSSt81hjXxDMILoUrrFkMnfnyQH+d/dYr6/F/pVM6SRrlCHhH9vY
 pqlbsTfb4ZznKtL/GmrPivkSBCbpQHqHhdn0+V7yBpD9KkgA+0R0MuPQkxnae0B9
 Ifk15w2w5CZKFYVB2oGBMp30pghwLT3sUAvNlgUnSySlqLP7eeRIiwF+c9R5zkLR
 2w8JCW9DdRoQwt3dFtR7M58sTt9PQ+W0ghLPJf4g7Md59hHr15pC3HCL1L0SBocv
 AN/or50wVueENbqlwxBCSWRxwO8zcwGFRbQpHoqOhusPns/bt3flSKeGgteb0E6w
 ==
X-ME-Sender: <xms:mPQHYA6tAXsOC0aOWA2mx2XccYlVQ-bOpnEEr0uC9-BITph9ek86Hg>
 <xme:mPQHYB5fD9aVPZV2Ha0zSq84vHQUhWYZfAv07Uw2aPWYhT8DPLgpM0H_viC-_ucsh
 xnc0ISnEBg4RpG-G70>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mPQHYPfLCJ_gL4bUwLu0FD_BoxD3FaHqtvC0tco8ea34pNG4YaN_fQ>
 <xmx:mPQHYFIulhyWe5rJpGc-OYBY2yK0n5M6a7CUypDYAKyBfnXTMJtlBg>
 <xmx:mPQHYEIpayVp2WcokzHySn31g97e_az8LnqmUERf4NKDIHqhH-vHjA>
 <xmx:mfQHYJEpchR3NNWDjmfeK_HWhjfYzDPjeIMNYH0-g9jFUZAMhVajHg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B9C9A1080067;
 Wed, 20 Jan 2021 04:15:01 -0500 (EST)
Date: Wed, 20 Jan 2021 10:14:59 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/block/nvme: fix zone write finalize
Message-ID: <YAf0kzhXWxOdxQ2l@apples.localdomain>
References: <20210112094235.188686-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="om+LflFrSHaE3gzE"
Content-Disposition: inline
In-Reply-To: <20210112094235.188686-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--om+LflFrSHaE3gzE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 12 10:42, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> The zone write pointer is unconditionally advanced, even for write
> faults. Make sure that the zone is always transitioned to Full if the
> write pointer reaches zone capacity.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  hw/block/nvme.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 0854ee307227..280b31b4459d 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1268,10 +1268,13 @@ static void nvme_finalize_zoned_write(NvmeNamespa=
ce *ns, NvmeRequest *req,
>      nlb =3D le16_to_cpu(rw->nlb) + 1;
>      zone =3D nvme_get_zone_by_slba(ns, slba);
> =20
> +    zone->d.wp +=3D nlb;
> +
>      if (failed) {
>          res->slba =3D 0;
> -        zone->d.wp +=3D nlb;
> -    } else if (zone->w_ptr =3D=3D nvme_zone_wr_boundary(zone)) {
> +    }
> +
> +    if (zone->d.wp =3D=3D nvme_zone_wr_boundary(zone)) {
>          switch (nvme_get_zone_state(zone)) {
>          case NVME_ZONE_STATE_IMPLICITLY_OPEN:
>          case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> @@ -1288,9 +1291,6 @@ static void nvme_finalize_zoned_write(NvmeNamespace=
 *ns, NvmeRequest *req,
>          default:
>              assert(false);
>          }
> -        zone->d.wp =3D zone->w_ptr;
> -    } else {
> -        zone->d.wp +=3D nlb;
>      }
>  }
> =20

Applied to nvme-next.

--om+LflFrSHaE3gzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAH9JIACgkQTeGvMW1P
DekOpwgAuZCN+Jj3w/Zd4INkvewsAkC/mBIvOz+JLbeEclNXLfb5A+Liht61bFY5
bxOYwtzVBie43VEXVjP77RX1+ETtP8NLcoM6rS34udFe9U0YB9nLaOBeO8HGWz+D
ixdNAfFcxs9XMnocG7pTt+0hDcZ/X6xlCLQSwU8aGVoDnWRQqTOf9jdmkgyAw9ik
aDW1yNRB2euTwEU0MfCRVBqneonkF1H1m4Ui6YfH0l5mSgOvcuo2lENio0DfyoFX
RCaDLVbQZxT4xNE2/954PzTVMk+qswJvL23oAvct68nSqbtSsYijxKqfzIIkKXqM
hf+N7ElujOPyfQ6/WLuC/xqZzXjkXQ==
=iU44
-----END PGP SIGNATURE-----

--om+LflFrSHaE3gzE--

