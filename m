Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EC0820F1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 17:57:58 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hufMz-0006YX-Qt
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 11:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57549)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hufMU-0005wi-Ag
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hufMT-0000wT-9h
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:57:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hufMQ-0000uI-R9; Mon, 05 Aug 2019 11:57:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 98E6E83F4C;
 Mon,  5 Aug 2019 15:57:21 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77D285DA21;
 Mon,  5 Aug 2019 15:57:16 +0000 (UTC)
To: qemu-block@nongnu.org
References: <20190805153308.2657-1-mreitz@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
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
Message-ID: <de38d7b0-8b41-4c2d-0ce4-9dbaea505dd6@redhat.com>
Date: Mon, 5 Aug 2019 17:57:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805153308.2657-1-mreitz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pZe5fUb4h3HIVa9BW1mK1ZKCCaPPjCkJj"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 05 Aug 2019 15:57:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] mirror: Only mirror granularity-aligned
 chunks
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pZe5fUb4h3HIVa9BW1mK1ZKCCaPPjCkJj
Content-Type: multipart/mixed; boundary="hBfJiAmWqGnjeQGm0cDsqi8qscA622eKE";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-stable@nongnu.org
Message-ID: <de38d7b0-8b41-4c2d-0ce4-9dbaea505dd6@redhat.com>
Subject: Re: [PATCH v3] mirror: Only mirror granularity-aligned chunks
References: <20190805153308.2657-1-mreitz@redhat.com>
In-Reply-To: <20190805153308.2657-1-mreitz@redhat.com>

--hBfJiAmWqGnjeQGm0cDsqi8qscA622eKE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05.08.19 17:33, Max Reitz wrote:
> In write-blocking mode, all writes to the top node directly go to the
> target.  We must only mirror chunks of data that are aligned to the
> job's granularity, because that is how the dirty bitmap works.
> Therefore, the request alignment for writes must be the job's
> granularity (in write-blocking mode).
>=20
> Unfortunately, this forces all reads and writes to have the same
> granularity (we only need this alignment for writes to the target, not
> the source), but that is something to be fixed another time.
>=20
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> v3: Handle bdrv_refresh_limits() errors [Vladimir]
> ---
>  block/mirror.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Thanks for the review, I=E2=80=99m taking the silence around =E2=80=9Cfix=
 unaligned
reset=E2=80=9D as a sign to take this patch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


--hBfJiAmWqGnjeQGm0cDsqi8qscA622eKE--

--pZe5fUb4h3HIVa9BW1mK1ZKCCaPPjCkJj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1IUdoACgkQ9AfbAGHV
z0CfHAf8D0g6HcEhQcuqAN+iEjgMO4MpzMNgBM4xtakf442YNudOTGm4kN8mb4tx
TaiWqmVUhXtCe94TjMzxkzg6PjL3hifK9NzC/MB0ptbv/PJlJn0rbRCl+W/Z+PIL
Y0t/YU497IqXFxWpoVcf1eX71UV+M8yRdxQGg4Yd4BSxENvYoIC6Dk6wC76dWX7B
OI5Il/DS4qk1G9+fSqgbuKCEs/D454lHDatyE2L5dhOU7vHXhbZrDqRl7xdAKLhT
ZOlM3m/GSee/gsEIYCWRyA1coGtCbKbEbFAlUAobgaAgZ0k1xy3eCoy+FhwOE3/F
dmbFeCmC4tnwod0b5Fgo5nlk28RQxA==
=N/RZ
-----END PGP SIGNATURE-----

--pZe5fUb4h3HIVa9BW1mK1ZKCCaPPjCkJj--

