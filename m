Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB813ADCD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 16:39:15 +0100 (CET)
Received: from localhost ([::1]:42316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irOHh-0000dF-8C
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 10:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1irO4r-0000w0-QF
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:25:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1irO4q-0001uh-MN
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:25:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36256
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1irO4q-0001tX-Ib
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579015555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9I2dgKJyvYjL5iyyAEnq9iHldjL0ytYt1hKA5+TXTT8=;
 b=QEDtjdGh2gkqM3NJDJLRnGcitAsKeF4bplwTc6jKB0aC0qXJgzSS2/DGEu377GdqAWEc/z
 kTJA9WTVajmK3xoO/KnVvDkd6Kb4kWqJUKPk/iSwqoq7MuTcEvtWiE27R59uorGZTcYZe1
 K98AB9ljPiVSw2fdKMI0GCxJCH2p6yM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-1wCbYP3nPpi3ngERvk05kQ-1; Tue, 14 Jan 2020 10:25:51 -0500
X-MC-Unique: 1wCbYP3nPpi3ngERvk05kQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFF001005502;
 Tue, 14 Jan 2020 15:25:49 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6677C83A;
 Tue, 14 Jan 2020 15:25:45 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] luks: extract
 block_crypto_calculate_payload_offset()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20200109111012.559052-1-stefanha@redhat.com>
 <20200109111012.559052-2-stefanha@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <7ea9cf7e-2622-c17a-6936-3109e4cd228a@redhat.com>
Date: Tue, 14 Jan 2020 16:25:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200109111012.559052-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xJNSRQDhrbvIhZIhuCcWEDZslManIZ7Vb"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xJNSRQDhrbvIhZIhuCcWEDZslManIZ7Vb
Content-Type: multipart/mixed; boundary="qPmy6m5kT9iWM1oVM6Id6IbWqz0le8kRz"

--qPmy6m5kT9iWM1oVM6Id6IbWqz0le8kRz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09.01.20 12:10, Stefan Hajnoczi wrote:
> The qcow2 .bdrv_measure() code calculates the crypto payload offset.
> This logic really belongs in block/crypto.c where it can be reused by
> other image formats.
>=20
> The "luks" block driver will need this same logic in order to implement
> .bdrv_measure(), so extract the block_crypto_calculate_payload_offset()
> function now.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/crypto.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  block/crypto.h |  5 ++++
>  block/qcow2.c  | 59 ++++------------------------------------------
>  3 files changed, 73 insertions(+), 55 deletions(-)
>=20
> diff --git a/block/crypto.c b/block/crypto.c
> index 24823835c1..ed32202fa2 100644
> --- a/block/crypto.c
> +++ b/block/crypto.c
> @@ -185,6 +185,70 @@ block_crypto_create_opts_init(QDict *opts, Error **e=
rrp)

[...]

> +/* Determine the number of bytes for the crypto header */
> +bool block_crypto_calculate_payload_offset(QemuOpts *opts,
> +                                           const char *optprefix,
> +                                           size_t *len,
> +                                           Error **errp)
> +{
> +    QDict *cryptoopts_qdict;
> +    QCryptoBlockCreateOptions *cryptoopts;
> +    QCryptoBlock *crypto;
> +
> +    /* Extract options into a qdict */
> +    if (optprefix) {
> +        QDict *opts_qdict =3D qemu_opts_to_qdict(opts, NULL);
> +
> +        qdict_extract_subqdict(opts_qdict, &cryptoopts_qdict, optprefix)=
;
> +        qobject_unref(opts_qdict);
> +    } else {
> +        cryptoopts_qdict =3D qemu_opts_to_qdict(opts, NULL);
> +    }
> +
> +    /* Build QCryptoBlockCreateOptions object from qdict */
> +    qdict_put_str(cryptoopts_qdict, "format", "luks");

Should this be a parameter?

Max


--qPmy6m5kT9iWM1oVM6Id6IbWqz0le8kRz--

--xJNSRQDhrbvIhZIhuCcWEDZslManIZ7Vb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl4d3XgACgkQ9AfbAGHV
z0BfFwf8C4n79fZoJelGuiXD536vdsvZ+NwDZyEVtKGAwqCC0fEAT+zhiDhjp4Ed
bR27m4oicUW+YSbF8sZ1Tn0Wfln4Idk2PEc2uv/eWw0YMCAg9XcMC9arGtrFjda2
z5vOuV1iScDbN5zOAly565M4BBZroRSwDekVwpDW4Eh1ghdNa58o5eGp1ZV6UMmV
bH2MSkWt68rlAC+Dpzc0c7skYMIIzuD1MobCqhRYdx4S6pM1zr4ErIySA7klTr1E
pXxyONnU34381akuLnXPlZXXXJgo6TKSGm7ncD4Dni/lyPxzNyTIG9xKIzq1EZjH
ufXA6wQRsOV4Jk1tmF3sNcUyRIhi+w==
=JKzk
-----END PGP SIGNATURE-----

--xJNSRQDhrbvIhZIhuCcWEDZslManIZ7Vb--


