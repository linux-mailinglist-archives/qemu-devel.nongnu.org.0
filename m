Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821476A17D5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:21:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTKB-0006da-JY; Fri, 24 Feb 2023 03:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1pVTJx-0006Zk-8e; Fri, 24 Feb 2023 03:20:49 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1pVTJu-0001RH-Lg; Fri, 24 Feb 2023 03:20:49 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230224082030euoutp02c8abd725bb935fadf1551f0570193cfe~GtOp9b_5_0519805198euoutp02T;
 Fri, 24 Feb 2023 08:20:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230224082030euoutp02c8abd725bb935fadf1551f0570193cfe~GtOp9b_5_0519805198euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1677226830;
 bh=326Ubw++yNDinGswHpQ9SCLBTUN8Wjovt+XX4335x/Q=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=fQMWV8MfTuogdPxqiDt1wdPhHVy0/neeYZgg5s79ObHsiW9TZLBCEfIGLXOYuMafo
 O+vCLmL5y8UG2UP/YvCxGkOnl69xgLdlGJAkyErf5C4goPPKkjyyu4xdHtK6U+cSqy
 mgiK+G5UupafTxUeidfTZ/9Ilq1ADLBQ2Ll8ulfY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230224082030eucas1p1db01fd28063c316e3dd41d572e03bc00~GtOpxZN451954319543eucas1p1n;
 Fri, 24 Feb 2023 08:20:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 9C.C6.61197.E4378F36; Fri, 24
 Feb 2023 08:20:30 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230224082029eucas1p1c296c93c7bb3024af69481c8ecf4fb66~GtOpa_lG12589225892eucas1p1N;
 Fri, 24 Feb 2023 08:20:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230224082029eusmtrp2f9621293865641fc44c96c6405bb7df2~GtOpaRYwC1487014870eusmtrp2L;
 Fri, 24 Feb 2023 08:20:29 +0000 (GMT)
X-AuditID: cbfec7f5-7dbff7000000ef0d-30-63f8734e2f79
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D3.2C.00518.D4378F36; Fri, 24
 Feb 2023 08:20:29 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230224082029eusmtip23eeb52309cc11f5aa7654418f90924a3~GtOpOxx_X2381223812eusmtip2g;
 Fri, 24 Feb 2023 08:20:29 +0000 (GMT)
Received: from localhost (106.210.248.238) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Feb 2023 08:20:28 +0000
Date: Fri, 24 Feb 2023 09:20:27 +0100
From: Joel Granados <j.granados@samsung.com>
To: Jesper Devantier <jwd@defmacro.it>
CC: <qemu-devel@nongnu.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>, <qemu-block@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Hanna Reitz
 <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen
 <k.jensen@samsung.com>
Subject: Re: [PATCH v3 1/5] hw/nvme: move adjustment of
 data_units{read,written}
Message-ID: <20230224082027.xy56qmirky6pxuss@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="pfaff43gicuxdcxd"
Content-Disposition: inline
In-Reply-To: <20230220115926.54623-2-jwd@defmacro.it>
X-Originating-IP: [106.210.248.238]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djPc7p+xT+SDR4v4ba4sv88o8WDu/2M
 FvsPfmO1eHj8AKPFpEPXGC2WXEy1WLNC2GLWu3Y2i+O9O1gsXk/6z+rA5TFl2jV2jx/n2tk8
 zu04z+6xaVUnm8eda3vYPJ5c28zk8X7fVbYA9igum5TUnMyy1CJ9uwSujKO939gKFshXLF5w
 mrmB8ZpkFyMnh4SAicS3yQeYuhi5OIQEVjBKLH7/hgXC+cIo8aCpkQ3C+cwo8aSxkQWmZcfJ
 t8wQieWMEtMXLmAGSYBVzXjhBpHYyihxa8FDNpAEi4CqxIuH69lBbDYBHYnzb+6ANYgIqEkc
 ebcRbB+zwDMmiXPrXwA5HBzCAkES72/zgdTwCphLdDTsYYawBSVOznwCdgWzQIXE61XLGUHK
 mQWkJZb/4wAJcwqYSqz6+QssLCGgLHH6qSfEzbUSp7bcAntTQmA/p0TzgxVQz7hITLu4DsoW
 lnh1fAs7hC0j8X/nfCYIO1ti55RdzBB2gcSsk1PZIOZbS/SdyYEIO0psu7efFSLMJ3HjrSDE
 kXwSk7ZNZ4YI80p0tAlBVKtJ7GjayjiBUXkWkrdmIXlrFsJbEGEdiQW7P7FhCGtLLFv4mhnC
 tpVYt+49ywJG9lWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBSe/0v+NfdzCuePVR7xAj
 EwfjIUYVoOZHG1ZfYJRiycvPS1US4Z3K9D1ZiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+27clk
 IYH0xJLU7NTUgtQimCwTB6dUA5Mxe4fcx7uvtH+yrLM/b1n/W/Dlkb46yarG48lnw0vqrj9P
 4l4+1e/cwvXbfyyWmTa/nr3wdTHLxn35PZn5jHOOfwnwZPx9zHC26uubqw9e3CrSkMh78b/i
 EdPVgumHDP0uHuzv9Zn5+cDF7TmTZr11vBJcONWgeEMY62LNigX2ktLhnn8eyot7mTfHtmTM
 d2ee+jpQgzPwiuR7vrWyH4s9+ubWH94acNVC4LeE2PdXaqGJ7XnVL1ZU/N9eOaH5wVojz99+
 bW83BE2NPpkUXS8wPyP0vcXfdWt8+ecUHv0uHeS4JLrQ7c/T/pNX2Y28tlUcLYt95r50300l
 4YplfqZnV8tlLtRnW6sZvOzlHyklluKMREMt5qLiRAAKQ1Yn9QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4PV3f4h/JBpueG1hc2X+e0eLB3X5G
 i/0Hv7FaPDx+gNFi0qFrjBZLLqZarFkhbDHrXTubxfHeHSwWryf9Z3Xg8pgy7Rq7x49z7Wwe
 53acZ/fYtKqTzePOtT1sHk+ubWbyeL/vKlsAe5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJ
 pZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvHL7WwF8+Qrtn3qZmlgvCLZxcjJISFgIrHj5Fvm
 LkYuDiGBpYwSD37sZYRIyEh8uvKRHcIWlvhzrYsNougjo8SWL/dZQRJCAlsZJebOtwaxWQRU
 JV48XA/WwCagI3H+zR1mEFtEQE3iyLuNLCDNzALPmCTOrX8B5HBwCAsESby/zQdSwytgLtHR
 sAfqis2MEs82fWWCSAhKnJz5hAXEZhYok/g96SQzSC+zgLTE8n8cIGFOAVOJVT9/MYKEJQSU
 JU4/9YS4uVbi899njBMYhWchGTQLyaBZCIMgwloSN/69ZMIQ1pZYtvA1M4RtK7Fu3XuWBYzs
 qxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQLjf9uxn1t2MK589VHvECMTB+MhRhWgzkcbVl9g
 lGLJy89LVRLhncr0PVmINyWxsiq1KD++qDQntfgQoykwECcyS4km5wMTU15JvKGZgamhiZml
 gamlmbGSOK9nQUeikEB6YklqdmpqQWoRTB8TB6dUAxPTlX4Lkxerey89vRnrDExWZQLLtarY
 fzmdn5cr/upyM8/jkr9Ou1nrXiz3EZ616wzDvskSM4MULuf7m93O/LWr49nKLaxH3jy7IlG5
 dua6YB6Vd/Y8KTUh63ynlJW6dV530Dtmfc3q3QmDVTneW/zWfC676qEasX2TzJnKhUKKvIbW
 S6em7vuS2rguS+O9/S2/s2dPV1bacnR5zFnBE/FT+v30ck7RCbME9VVu3ePN5GKaHFWir+r+
 ZEYTb1e8X6vT/xs5My9PfN8y6erzGN6InZ0nOlx0o3/a5cx9wbh2qfPR0AWz9oTsbyw/WvK+
 rFrwojuL3A+/cL+Uu1cS6te+FFZz2/v+pqnupG0KdUosxRmJhlrMRcWJAIAm8qeUAwAA
X-CMS-MailID: 20230224082029eucas1p1c296c93c7bb3024af69481c8ecf4fb66
X-Msg-Generator: CA
X-RootMTR: 20230220115941eucas1p18804ba500e79b6d61c468bd2fe25f7bc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230220115941eucas1p18804ba500e79b6d61c468bd2fe25f7bc
References: <20230220115926.54623-1-jwd@defmacro.it>
 <CGME20230220115941eucas1p18804ba500e79b6d61c468bd2fe25f7bc@eucas1p1.samsung.com>
 <20230220115926.54623-2-jwd@defmacro.it>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=j.granados@samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--pfaff43gicuxdcxd
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2023 at 12:59:22PM +0100, Jesper Devantier wrote:
> From: Joel Granados <j.granados@samsung.com>
>=20
> In order to return the units_{read/written} required by the SMART log we
> need to shift the number of bytes value by BDRV_SECTORS_BITS and multiply
> by 1000. This is a prep patch that moves this adjustment to where the SMA=
RT
> log is calculated in order to use the stats struct for calculating OCP
> extended smart log values.

This was originally part of another patchset that looked at adding OCP
to qemu. Why is it needed for this patch set? Should we change the
wording of the commit to remove the OCP specific stuff? or should we
just remove the patch all together?

best
Joel

>=20
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index f25cc2c235..99b92ff20b 100644
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

--pfaff43gicuxdcxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmP4c0gACgkQupfNUreW
QU9+WQwAjAzUUQeDIj9OzKr7Ruon5wcem3UIauhYOuRZR/uaAyHyu0hzQ/L8esGR
fzQ2FZ1uFld+8kkqH/KquZAqRAeVE6surldabUJHiX9ookgcsZ/Vxg2U06www6E8
mRYA3Fa2ky7hIfV5OxezHtIny7IDe13jCRiH7ugMbI70Hc7aP8fOPvi7rs/hW7lN
fyctOXgsQ7QqEewr8U6nzfBgSm0QJSt3/MyrStbHTHVQPGXK5yafmhrdhHkYQFJk
0boK82G8lTjeRshGIo44pcEzCTP8KOx8a8DU5SBJ8HNIGgKGcZoiJHcIyR56MLpK
7p+w0gHg9S7wVzgqTuHzp2ugM5hugRGGvKIBreuhj/vbqlwwF5M052JvOC7UMMlp
CP5vbVkc5kq2lcHh/RFiaAFQRnumDxxfpBskvfyuhUp8j0gQQj8D1FuORR73lwk7
c9cpzsrFNgQIFgqnrC953MXYHaORArQWafF7pk6QFb1eBPOanmwCp7Pb7j9B2Zif
/SrotnGs
=c2gb
-----END PGP SIGNATURE-----

--pfaff43gicuxdcxd--

