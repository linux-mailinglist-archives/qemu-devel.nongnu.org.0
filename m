Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713A86296CF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:10:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outpO-0007EP-UT; Tue, 15 Nov 2022 06:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1outpM-0007EA-LQ; Tue, 15 Nov 2022 06:10:04 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1outpK-000176-96; Tue, 15 Nov 2022 06:10:04 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 308783200A2E;
 Tue, 15 Nov 2022 06:09:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 06:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668510595; x=1668596995; bh=Vo
 6gBC+3tmyhqnof+o/wOzHrQVenEny1VJlgboracCo=; b=EoWbyS9Ueqc+eDgayr
 7EEhxOzzFlZ6iA5Rt71lkoKRKXT7WHYnTHI+NNDNrsIB0OJBesMsgPmpdAyDZ78B
 5B5mgMaILzA37Y25xsjlPsBbkzYcbwUIGyI6C1BSlgvU/7UHmFWdec5S382/P2wx
 3TqJy8hmSjzh4KOXsNMtda0NlX5AiaESSOL84o3IZOGgLsJF0hnh16m6f8PjxMSW
 6PbyGmIx5tvpkgu8PMfHnx/QZH5paSfFPjJ60ye3ro/v80cNhkLa0Y+6fB+5k033
 I8rPuLjX0h1TcPBvy6QzsAyFheHYAX07oXOeEr4P1AVI8pUC97oDufXTlFidrtpM
 DetA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668510595; x=1668596995; bh=Vo6gBC+3tmyhqnof+o/wOzHrQVen
 Eny1VJlgboracCo=; b=waXoVC0dQCDwJ8fuZlJAK+Xhf58gfGMzrZSwLabqs7i9
 DzvWywq745MGBf2ayxFnaZfwvVi3hPyXKQPa7BUIG0/qXpmKV32vxUTLhy7tKkUX
 nb39ULuu+nmgveDxkmz06TB/zoMTI3OPnmL2CW3iY6PAHeJJb5zBOX7g0CU+BN1i
 QudrmDZeZm0iRLR4f5PHHc40CzH/1YOSH2BKgUOsL4dVO2L28U6b8Hj5nDpDWl1q
 HgrECc3MeBu6dVd/UgEs9z8jZHhhclFI4fSAkmaPSE39fdwG4ZPsSbAovMsAxlY4
 B0UgPB4AkpE0eJo+dNFdfYCR6aGkoc0+z6QyYJi9Gw==
X-ME-Sender: <xms:g3NzY8b3Ph_PlPisPow135LHwYTOcyBiOlRNNan50qJxbbPQ4KDjIg>
 <xme:g3NzY3Z_6UbamllC6D3kfIEqB5DmEA3Tdb6h4-_5BN9PVD3TBRu4SXPMUvd4uK_FD
 JmULCzq2N0p8VEnaIM>
X-ME-Received: <xmr:g3NzY2-hF8YCag4N0BhoqdujaePCvl5s7qugbfOmdMeJ-vq9H6tjzq71He_2u8cS3wHCWXzeJwqv3KRsWham8S5LeDCoGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:g3NzY2riUOzPN5Ccorkp96mJ1lOzpRfV8PFdUgomaHosKZNWgoiwfw>
 <xmx:g3NzY3pn1ytJJHPjioCLyLCZAebuP-g1-23TNwsNBC_KxdXaihFNHw>
 <xmx:g3NzY0RHDeP2GU0ivSAKICQcb2arV-5OHUcNSWGxRIT0UAsCS5lgzQ>
 <xmx:g3NzY2XRdfK8LRBUsoFO7nRlM8zDC7lQyfenQoHLfjCbUKBjgX-EWA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 06:09:54 -0500 (EST)
Date: Tue, 15 Nov 2022 12:09:52 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Joel Granados <j.granados@samsung.com>
Cc: k.jensen@samsung.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v2 1/3] nvme: Move adjustment of data_units{read,written}
Message-ID: <Y3NzgHYczS+K2KFR@cormorant.local>
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135427eucas1p1159db5cc4719af64f8a8449853815c4b@eucas1p1.samsung.com>
 <20221114135043.2958100-2-j.granados@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="367ruM66y82KG2la"
Content-Disposition: inline
In-Reply-To: <20221114135043.2958100-2-j.granados@samsung.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--367ruM66y82KG2la
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 14 14:50, Joel Granados wrote:
> In order to return the units_{read/written} required by the SMART log we
> need to shift the number of bytes value by BDRV_SECTORS_BITS and multiply
> by 1000. This is a prep patch that moves this adjustment to where the SMA=
RT
> log is calculated in order to use the stats struct for calculating OCP
> extended smart log values.
>=20
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  hw/nvme/ctrl.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 87aeba0564..220683201a 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4449,8 +4449,8 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, s=
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
> @@ -4490,10 +4490,12 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint=
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
> +    smart.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(
> +                                           stats.units_read >> BDRV_SECT=
OR_BITS,
> +                                           1000));
> +    smart.data_units_written[0] =3D cpu_to_le64(DIV_ROUND_UP(
> +                                              stats.units_written >> BDR=
V_SECTOR_BITS,
> +                                              1000));
>      smart.host_read_commands[0] =3D cpu_to_le64(stats.read_commands);
>      smart.host_write_commands[0] =3D cpu_to_le64(stats.write_commands);
> =20

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--367ruM66y82KG2la
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNzc38ACgkQTeGvMW1P
DenMIQgArRbgqeFFmE0l0mts27gllpZYQdWr3Mfda46/Wt6ftbwbbPReTg5OhUug
JWMdIe/PdUvJrnbCa/fVyslK5BpJC+vex7nqPOkMU4J78BTM3v+AdoWXObNtbP7B
fCFce4E1YB7vkoTwduU4Bma/f2c8+NsYvnng3MbZ/N7dzWakPYUVHxRYNo7txpXi
hhFKOoGbV4aZDU4CyHlx2OKHcga9fYsOVEGSq2HsZJ7L272Us+Bi/DlkNiiET1jW
teDNElWIHaHA7p6Xiyb+eZBbaSO2ClYHALYQTH8hP66PDhBBu14EGEozS/PQhlRZ
EvWcZKxuOcrXsCbJo2Sx56cMn7912Q==
=B3WP
-----END PGP SIGNATURE-----

--367ruM66y82KG2la--

