Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560039CE0D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 13:23:18 +0200 (CEST)
Received: from localhost ([::1]:51816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2D5h-0002ri-0s
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 07:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2D4Z-0002Lu-EZ
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 07:22:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2D4Y-0002Hn-Fn
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 07:22:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2D4U-0002Dq-2E; Mon, 26 Aug 2019 07:22:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 10C2A3082126;
 Mon, 26 Aug 2019 11:21:59 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1D9C5D9CC;
 Mon, 26 Aug 2019 11:21:57 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20190824100740.61635-1-vsementsov@virtuozzo.com>
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
Message-ID: <01661ed8-9bf5-4d1e-5637-2669d4df23a3@redhat.com>
Date: Mon, 26 Aug 2019 13:21:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190824100740.61635-1-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3bBy8MIRVd9SvPeWhIdIgMviZl1GGZPgb"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 26 Aug 2019 11:21:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] block: fix permission update in
 bdrv_replace_node
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3bBy8MIRVd9SvPeWhIdIgMviZl1GGZPgb
Content-Type: multipart/mixed; boundary="lFbcgS04Sa7ipkChBAyfHAXJyfNBqUSvg";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com
Message-ID: <01661ed8-9bf5-4d1e-5637-2669d4df23a3@redhat.com>
Subject: Re: [PATCH] block: fix permission update in bdrv_replace_node
References: <20190824100740.61635-1-vsementsov@virtuozzo.com>
In-Reply-To: <20190824100740.61635-1-vsementsov@virtuozzo.com>

--lFbcgS04Sa7ipkChBAyfHAXJyfNBqUSvg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 24.08.19 12:07, Vladimir Sementsov-Ogievskiy wrote:
> It's wrong to OR shared permissions. It may lead to crash on further
> permission updates.
> Also, no needs to consider previously calculated permissions, as at
> this point we already bind all new parents and bdrv_get_cumulative_perm=

> result is enough. So fix the bug by just set permissions by
> bdrv_get_cumulative_perm result.
>=20
> Bug was introduced in long ago 234ac1a9025, in 2.9.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>=20
> Hi all!
>=20
> I found this bug during my work around backup-top filter. It happens th=
at
> on filter removing, bdrv_replace_node() breaks permissions in graph whi=
ch
> lead to bdrv_set_backing_hd(new backing: NULL) on
> assert(tighten_restrictions =3D=3D false).
>=20
>  block.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Thanks, that makes sense.

Applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


--lFbcgS04Sa7ipkChBAyfHAXJyfNBqUSvg--

--3bBy8MIRVd9SvPeWhIdIgMviZl1GGZPgb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1jwNMACgkQ9AfbAGHV
z0DY+Qf9Ga8+1SWx+WF2CC/nRCKMCEk6+am37ME3xeFR/fE0hT2B9t8eRGzsclko
6w9wps7vQC7tFFjzP61B01j+QhLikW754JGyjG8BA9xD9y+XSDG6MbjeLkXX8PRQ
nxtK+tq74K3YE/fQ/aTD+AnTpEEtcpqZOT9967NfF4eejEdpZC+ekna9Gga0tJmB
U6Job5k/e+qmq1JoDa21t8O/4Uyio5Jj45roOtpEYvzjq9knvwx9eB3vVNAE1Iv/
88ad7gcHyZ5HCoOO07bS8YE+R3BNNy63/bkIvj5nCa+iSfnK/bxN1vnDQyVf5e7N
lLX9/xH4TnNkgy/VkUI+8sp0VNsckQ==
=vZ3G
-----END PGP SIGNATURE-----

--3bBy8MIRVd9SvPeWhIdIgMviZl1GGZPgb--

