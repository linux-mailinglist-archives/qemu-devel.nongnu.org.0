Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5F8520E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 19:28:58 +0200 (CEST)
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvPk9-0005vE-Gm
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 13:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54947)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hvPje-0005RE-J4
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:28:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hvPjd-0004he-LC
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:28:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hvPjb-0004Zr-FW; Wed, 07 Aug 2019 13:28:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 929EE30C3400;
 Wed,  7 Aug 2019 17:28:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-24.brq.redhat.com
 [10.40.204.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 658835D71C;
 Wed,  7 Aug 2019 17:28:15 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20190807080750.15950-1-vsementsov@virtuozzo.com>
 <20190807080750.15950-4-vsementsov@virtuozzo.com>
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
Message-ID: <8472029e-a7e1-b5aa-d6d6-7fbfb39460c1@redhat.com>
Date: Wed, 7 Aug 2019 19:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807080750.15950-4-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uTqVVJK9UNx8CrZO9qa3pqT9b2sHbzTpd"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 07 Aug 2019 17:28:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/8] block/io: handle alignment and
 max_transfer for copy_range
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uTqVVJK9UNx8CrZO9qa3pqT9b2sHbzTpd
Content-Type: multipart/mixed; boundary="QMDFkJbmPrQaVkTUyd1no4l7fRg1T7hCG";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, kwolf@redhat.com, jsnow@redhat.com, den@openvz.org
Message-ID: <8472029e-a7e1-b5aa-d6d6-7fbfb39460c1@redhat.com>
Subject: Re: [PATCH 3/8] block/io: handle alignment and max_transfer for
 copy_range
References: <20190807080750.15950-1-vsementsov@virtuozzo.com>
 <20190807080750.15950-4-vsementsov@virtuozzo.com>
In-Reply-To: <20190807080750.15950-4-vsementsov@virtuozzo.com>

--QMDFkJbmPrQaVkTUyd1no4l7fRg1T7hCG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07.08.19 10:07, Vladimir Sementsov-Ogievskiy wrote:
> copy_range ignores these limitations, let's improve it. block/backup
> code handles max_transfer for copy_range by itself, now it's not needed=

> more, drop it.

Shouldn=E2=80=99t this be two separate patches?

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/backup.c | 11 ++---------
>  block/io.c     | 41 +++++++++++++++++++++++++++++++++--------
>  2 files changed, 35 insertions(+), 17 deletions(-)

[...]

> diff --git a/block/io.c b/block/io.c
> index 06305c6ea6..5abbd0fff2 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3005,6 +3005,12 @@ static int coroutine_fn bdrv_co_copy_range_inter=
nal(
>  {
>      BdrvTrackedRequest req;
>      int ret;
> +    uint32_t align =3D MAX(src->bs->bl.request_alignment,
> +                         dst->bs->bl.request_alignment);
> +    uint32_t max_transfer =3D
> +            QEMU_ALIGN_DOWN(MIN_NON_ZERO(MIN_NON_ZERO(src->bs->bl.max_=
transfer,
> +                                                      dst->bs->bl.max_=
transfer),
> +                                         INT_MAX), align);

I suppose the outer QEMU_ALIGN_DOWN() may result in @max_transfer of 0
(in theory, if one=E2=80=99s max_transfer is smaller than the other=E2=80=
=99s alignment).

Not likely, but should still be handled.

The rest looks good to me.

Max

>      /* TODO We can support BDRV_REQ_NO_FALLBACK here */
>      assert(!(read_flags & BDRV_REQ_NO_FALLBACK));


--QMDFkJbmPrQaVkTUyd1no4l7fRg1T7hCG--

--uTqVVJK9UNx8CrZO9qa3pqT9b2sHbzTpd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1LCi0ACgkQ9AfbAGHV
z0ApRQgAoa0wImFox/sE9fic/L88/eTdfX2axH5NBJZ9j3iYRius9BuZvQgpeFRR
l8W7Lb/2AdOk3bCELE2p5aJzjo6JDFHLGqW5L7LzbchVNCf1JUvFJeLpFq4CbQmR
wUIw8PF6zKRxTf3bR7JXmSyc9iudVUYeABXPWbhql1lupWcVDfR5wAGfd3XeTiHF
JqBnfJA5J+KOT7tEVoJPbb3rCBiGOcb9ANBtsT3UEIvVHIfAqYv954ftYCc9pCyk
Hdx+J3hGb+GMNwOhSnEYiMTF4bAe/YVrKIHBAMvHSDz2DukV9QCOnA0VTGfEZjdA
H+93xfCTvUocNv65PfvFOHA1VszN4w==
=+sNn
-----END PGP SIGNATURE-----

--uTqVVJK9UNx8CrZO9qa3pqT9b2sHbzTpd--

