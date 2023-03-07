Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239BA6AE2AD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYQy-0003Xj-1A; Tue, 07 Mar 2023 09:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1pZYQv-0003Uy-Qm; Tue, 07 Mar 2023 09:36:53 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1pZYQs-0000Im-Qt; Tue, 07 Mar 2023 09:36:53 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230307143641euoutp019ef7278f3e6a30fc40adeb494d022520~KKdPbYWVx0713207132euoutp01M;
 Tue,  7 Mar 2023 14:36:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230307143641euoutp019ef7278f3e6a30fc40adeb494d022520~KKdPbYWVx0713207132euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678199801;
 bh=9MU0tp3eVuNL8YYdDhYdSgHb3WF4Q8oPNlgpjvZ0JbI=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=pvHueD4J5UPbwXMDdlpFR3w/Wv2bSsZlCefpdxT2AKVAsjDgN5PzjuawantOviP9u
 lWRmwbADX3GfpLBG+2SUtaqXhwwEPy53HQL2FUmvaLvq7RVCiQcQQmGATHjqGpStEC
 tPgwWmaay1LYtA68OfVc6b+MJ8EVbGq8kauu9vAE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230307143640eucas1p140dba4c1e7425cecbfcfb0efaf419f0e~KKdPLYHvr0620806208eucas1p1U;
 Tue,  7 Mar 2023 14:36:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 45.E6.09503.8FB47046; Tue,  7
 Mar 2023 14:36:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230307143640eucas1p1bcded08463190b68328361b5efabb620~KKdOvsSm61245912459eucas1p16;
 Tue,  7 Mar 2023 14:36:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230307143640eusmtrp2a3c4f91071b3dd699d3fe2104cbc5869~KKdOvD-GM1571515715eusmtrp2Q;
 Tue,  7 Mar 2023 14:36:40 +0000 (GMT)
X-AuditID: cbfec7f2-ea5ff7000000251f-b0-64074bf88316
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A7.DD.08862.8FB47046; Tue,  7
 Mar 2023 14:36:40 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230307143640eusmtip2b4fa62d4e582a2d24cdc74fed1aa39f8~KKdOh1mic3235332353eusmtip2a;
 Tue,  7 Mar 2023 14:36:40 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 7 Mar 2023 14:36:39 +0000
Date: Tue, 7 Mar 2023 15:36:38 +0100
From: Joel Granados <j.granados@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Keith
 Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, <qemu-block@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PULL 1/5] hw/nvme: move adjustment of data_units{read,written}
Message-ID: <20230307143638.g3yh5me3povmbt7d@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="xtuykghru2b3zafk"
Content-Disposition: inline
In-Reply-To: <20230306143433.10351-2-its@irrelevant.dk>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNKsWRmVeSWpSXmKPExsWy7djPc7o/vNlTDA40a1hc2X+e0eLB3X5G
 i/0Hv7FaTDp0jdFiycVUizlnHrBYrFkhbDHrXTubxfHeHSwWryf9Z3Xg8vhxrp3N49yO8+we
 m1Z1snncubaHzePJtc1MHu/3XWULYIvisklJzcksSy3St0vgyth6dhF7wW3Zit7mKcwNjAcl
 uhg5OSQETCQ2X7nEAmILCaxglOi/ydXFyAVkf2GUaJm9iBki8ZlRYtIpO5iGaTt3MUIULWeU
 eL/uADtc0eP79hD2ZkaJnpcJIDaLgIrE4lMHwDawCehInH9zB2yoCFD86b+9LCCDmAXeMEls
 uvGMCSQhLOAjsaN7JthQXgFziSOzdrJA2IISJ2c+AbOZBSokJn49BXQFB5AtLbH8HwdImBOo
 /NeLI0wQhypJfH3Tywph10qc2nKLCWSXhMBqToljM3vYQXolBFwk+meFQ9QIS7w6voUdwpaR
 +L9zPtScbImdU3YxQ9gFErNOTmWDaLWW6DuTAxF2lGjYeREqzCdx460gxJF8EpO2TWeGCPNK
 dLQJQVSrSexo2so4gVF5FpK3ZiF5axbCWxBhHYkFuz+xYQhrSyxb+JoZwraVWLfuPcsCRvZV
 jOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYgWnu9L/jn3Ywzn31Ue8QIxMH4yFGFaDmRxtW
 X2CUYsnLz0tVEuF9+44tRYg3JbGyKrUoP76oNCe1+BCjNAeLkjivtu3JZCGB9MSS1OzU1ILU
 IpgsEwenVAOTvbDlBEOHbwcePdq5kWX5/Mi/JwS7mwNSw0NylLbckdHJvZz9mX/9Wttc2dDK
 msONztYembWsmoX7nXyze49PmpDiOE3W/dOZZRNq508WZUhcHHMzcPPSgtsK3da9kvcCQpbO
 /fmIVT5jQW/uv7eCJefKUgJZE09KrtDc+UyqVErsm68YC6eP7CLd8sU/ei4przRWVp99yoL5
 8eYHgZ/kBKYfueZ53FF9mzmnJauS78+ze6ZEimQwyz9YXdv3ebHguxa/6c/6GVT3XsmT+/9P
 otRu0VKuNFa1icHnXr4/3JM+661bvcv5AB0tjw1vWhgecs9+GWFmx8u7S6mvYuOjVPPNmq2r
 jp0Q71WetF2JpTgj0VCLuag4EQACWHyH7gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDIsWRmVeSWpSXmKPExsVy+t/xe7o/vNlTDNpvcltc2X+e0eLB3X5G
 i/0Hv7FaTDp0jdFiycVUizlnHrBYrFkhbDHrXTubxfHeHSwWryf9Z3Xg8vhxrp3N49yO8+we
 m1Z1snncubaHzePJtc1MHu/3XWULYIvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaP
 tTIyVdK3s0lJzcksSy3St0vQyzh6IbrgpmxFe98R1gbG/RJdjJwcEgImEtN27mIEsYUEljJK
 dE9IhYjLSHy68pEdwhaW+HOti62LkQuo5iOjxI0TXawQzmZGiUmnJ7CBVLEIqEgsPnWABcRm
 E9CROP/mDjOILQIUf/pvL1icWeANk8Srdg4QW1jAR2JH90ywDbwC5hJHZu1kgRi6nVHi/fa1
 rBAJQYmTM59ANZdJrH73G+hUDiBbWmL5P7A5nEC9v14cYYK4VEni65teVgi7VuLz32eMExiF
 ZyGZNAvJpFkIkyDCWhI3/r1kwhDWlli28DUzhG0rsW7de5YFjOyrGEVSS4tz03OLDfWKE3OL
 S/PS9ZLzczcxAqN+27Gfm3cwznv1Ue8QIxMH4yFGFaDORxtWX2CUYsnLz0tVEuF9+44tRYg3
 JbGyKrUoP76oNCe1+BCjKTAUJzJLiSbnA9NRXkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpi
 SWp2ampBahFMHxMHp1QDk8H7Vvvuo6lbs+8prVT2L6ubwXjQ9Mbrjvz+9ItJF+bwmp9QkPhz
 4N/ahNpWhrmiqTm7Nx5Z91h74qftO6KmnTdZLfLvFE9344L3R7sYrGw23ZseEGjKKucgpMMn
 vVpdf8tfebOlNT6LU86/6/ISCFHRMT3C85a58NPWx65isvHvvs0rlnYRqts/L/JQzPt7l3vZ
 UkuN3zP0TbPvuNiwWSDgiVbql8veZUdYrL9esbx4euFiyehY3vziiws1mycfY5Dwszy41U0l
 PXYJ85KXtQ8//9r5MyNHglFx2i6b+M+37WL2GG75dzBXQ2W6zbH957nM9s8/mbbj5+o1s1l9
 QuSXzQ73/n4snVnanEV2sRJLcUaioRZzUXEiANr/z3mPAwAA
X-CMS-MailID: 20230307143640eucas1p1bcded08463190b68328361b5efabb620
X-Msg-Generator: CA
X-RootMTR: 20230306143447eucas1p289dd1bdf0fd599c70b5e574468f7fdb8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230306143447eucas1p289dd1bdf0fd599c70b5e574468f7fdb8
References: <20230306143433.10351-1-its@irrelevant.dk>
 <CGME20230306143447eucas1p289dd1bdf0fd599c70b5e574468f7fdb8@eucas1p2.samsung.com>
 <20230306143433.10351-2-its@irrelevant.dk>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--xtuykghru2b3zafk
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 03:34:29PM +0100, Klaus Jensen wrote:
> From: Joel Granados <j.granados@samsung.com>
>=20
> Move the rounding of bytes read/written into nvme_smart_log which
> reports in units of 512 bytes, rounded up in thousands. This is in
> preparation for adding the Endurance Group Information log page which
> reports in units of billions, rounded up.
Awesome. the message now makes more sense. I see that it already has my
signed off tag :)

Joel

>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index f25cc2c235e9..99b92ff20b9a 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4386,8 +4386,8 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, s=
truct nvme_stats *stats)
>  {
>      BlockAcctStats *s =3D blk_get_stats(ns->blkconf.blk);
> =20
> -    stats->units_read +=3D s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_B=
ITS;
> -    stats->units_written +=3D s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECT=
OR_BITS;
> +    stats->units_read +=3D s->nr_bytes[BLOCK_ACCT_READ];
> +    stats->units_written +=3D s->nr_bytes[BLOCK_ACCT_WRITE];
>      stats->read_commands +=3D s->nr_ops[BLOCK_ACCT_READ];
>      stats->write_commands +=3D s->nr_ops[BLOCK_ACCT_WRITE];
>  }
> @@ -4401,6 +4401,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_=
t rae, uint32_t buf_len,
>      uint32_t trans_len;
>      NvmeNamespace *ns;
>      time_t current_ms;
> +    uint64_t u_read, u_written;
> =20
>      if (off >=3D sizeof(smart)) {
>          return NVME_INVALID_FIELD | NVME_DNR;
> @@ -4427,10 +4428,11 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint=
8_t rae, uint32_t buf_len,
>      trans_len =3D MIN(sizeof(smart) - off, buf_len);
>      smart.critical_warning =3D n->smart_critical_warning;
> =20
> -    smart.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units_re=
ad,
> -                                                        1000));
> -    smart.data_units_written[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units=
_written,
> -                                                           1000));
> +    u_read =3D DIV_ROUND_UP(stats.units_read >> BDRV_SECTOR_BITS, 1000);
> +    u_written =3D DIV_ROUND_UP(stats.units_written >> BDRV_SECTOR_BITS, =
1000);
> +
> +    smart.data_units_read[0] =3D cpu_to_le64(u_read);
> +    smart.data_units_written[0] =3D cpu_to_le64(u_written);
>      smart.host_read_commands[0] =3D cpu_to_le64(stats.read_commands);
>      smart.host_write_commands[0] =3D cpu_to_le64(stats.write_commands);
> =20
> --=20
> 2.39.2
>=20

--xtuykghru2b3zafk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmQHS+4ACgkQupfNUreW
QU/RTAv/T9JewrVVZ72WBPPzaFqYWziaMnwCf/YvLqgf1+6TMCMzaSjy7sNZC/tG
dUukgy+sDwQ8kqUfjOb6relZ1GlCacaCuKpc1kWLD1U0QhPiEKKQoxx2RQR6S5Vr
OVptLluHg6f86bIpI3/VfnGhwShuZghhnxL93IhBNCzDHCbpj6lcoRFB4nYVR3mK
j0BJLCfomHRgJpptEILmZZWcjTJTihVXoOpfE6NNtj9csltszWz17LeQyZzUx2O7
xuWVuJJYH+oVZffPF0ssEcq8x9+tvQ1wfwMetNNmyCxlcMpobXsyHi3UkczJGv7c
DdbFEowEGETC9578NZtQYWXcCpqplnJwUW7f2UycpibF+/RKm+MLJwYj1dAXB3nM
wK20lSa3+hhpSDQW2eoKF2SbAcVA+32QJcnmaJpN/vUfWLg7XPrnyn68iVqcBkoD
V6/xlXXD5C24jsIT/Avp/oB4hVsYYKLsrB44x/RJdL2++BueFU4uNn/zybPSDi4X
kkP7cZca
=obtA
-----END PGP SIGNATURE-----

--xtuykghru2b3zafk--

