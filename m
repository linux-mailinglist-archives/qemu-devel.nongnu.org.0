Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241BD155D27
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 18:48:10 +0100 (CET)
Received: from localhost ([::1]:33440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j07jd-0001Et-6X
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 12:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j07iW-0000CN-8z
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 12:47:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j07iU-00087j-4D
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 12:46:59 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49692
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j07iT-00081F-R2
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 12:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581097617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7X5vBe1CUx1rYs4RNKHblr0gvgqwJL0B6EkX9nZjK1U=;
 b=EgnutsDG8J3ARKO9JAQ1U5PexG5ohQp3UvDLDwH7X67NUSRrfDVw+PFAlVVGKk/Rd3wars
 e3IDnjzuW0NtSvIec9TxQzzpBCWVHf48HPrKwmzuI8m13kpsL4RR5c9t91QmJCH72bjPC+
 s3qM0/BnNkgBEUxuv0G6W4Z9bYIE6Rk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-HKIIrfeWPT6tn3JmJfJAJw-1; Fri, 07 Feb 2020 12:46:52 -0500
X-MC-Unique: HKIIrfeWPT6tn3JmJfJAJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16505184AEA3;
 Fri,  7 Feb 2020 17:46:51 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-14.ams2.redhat.com
 [10.36.117.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 013DF5C545;
 Fri,  7 Feb 2020 17:46:46 +0000 (UTC)
Subject: Re: [PATCH v2 2/7] block/block-copy: use block_status
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20191127180840.11937-1-vsementsov@virtuozzo.com>
 <20191127180840.11937-3-vsementsov@virtuozzo.com>
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
Message-ID: <81ce033a-2ac9-21b6-4649-48df61d41797@redhat.com>
Date: Fri, 7 Feb 2020 18:46:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191127180840.11937-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="koUrbt4JaxBV8w2EuFG5sKpjVDgYJYRoR"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--koUrbt4JaxBV8w2EuFG5sKpjVDgYJYRoR
Content-Type: multipart/mixed; boundary="r3cVv2RIYl14Qw8d8D44E5lGke7XCD132"

--r3cVv2RIYl14Qw8d8D44E5lGke7XCD132
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 27.11.19 19:08, Vladimir Sementsov-Ogievskiy wrote:
> Use bdrv_block_status_above to chose effective chunk size and to handle
> zeroes effectively.
>=20
> This substitutes checking for just being allocated or not, and drops
> old code path for it. Assistance by backup job is dropped too, as
> caching block-status information is more difficult than just caching
> is-allocated information in our dirty bitmap, and backup job is not
> good place for this caching anyway.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/block-copy.c | 67 +++++++++++++++++++++++++++++++++++++---------
>  block/trace-events |  1 +
>  2 files changed, 55 insertions(+), 13 deletions(-)
>=20
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 8602e2cae7..74295d93d5 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c

[...]

> @@ -336,23 +375,25 @@ int coroutine_fn block_copy(BlockCopyState *s,
>              chunk_end =3D next_zero;
>          }
> =20
> -        if (s->skip_unallocated) {
> -            ret =3D block_copy_reset_unallocated(s, start, &status_bytes=
);
> -            if (ret =3D=3D 0) {
> -                trace_block_copy_skip_range(s, start, status_bytes);
> -                start +=3D status_bytes;
> -                continue;
> -            }
> -            /* Clamp to known allocated region */
> -            chunk_end =3D MIN(chunk_end, start + status_bytes);
> +        ret =3D block_copy_block_status(s, start, chunk_end - start,
> +                                      &status_bytes);
> +        if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
> +            bdrv_reset_dirty_bitmap(s->copy_bitmap, start, status_bytes)=
;
> +            s->progress_reset_callback(s->progress_opaque);
> +            trace_block_copy_skip_range(s, start, status_bytes);
> +            start +=3D status_bytes;
> +            continue;
>          }
> =20
> +        chunk_end =3D MIN(chunk_end, start + status_bytes);

I=92m not sure how much the old =93Clamp to known allocated region=94 actua=
lly
helps, but I wouldn=92t drop it anyway.

Apart from this nit, the patch looks good to me.

Max


--r3cVv2RIYl14Qw8d8D44E5lGke7XCD132--

--koUrbt4JaxBV8w2EuFG5sKpjVDgYJYRoR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl49ooUACgkQ9AfbAGHV
z0AbtQgAp/vwBw8ALb3QR44ScY3oNphUp493yA9MxNwiN6hLZuDJhCIhyZTenG3d
Fh33qoRT0NRYBZSQyJ8iTweFj/a2XKFFgfC10Dw6Qwt0QcexBQwlOcqJfR0J6vNy
TYsJptvoXmRa2NaS1IWXifdXxTk4F+X9GHfoxCOeW/ZDHh1Te67mYyOcxgAgjnNU
jUQPmjWJSAqBMwUMQRMj48LlFauHx5WuSVL8gAkvfNEzLFYgnEvhuWIXczbcihQ7
e/RWU5DdECvk3kJN6SFR/GK9BJREdZodFWH2tv7LKRhl2nAU79B1hoYinoD5F9Hw
7nKQF4fow1cJGhgVyLrx3ZmNNjIOcw==
=+jxF
-----END PGP SIGNATURE-----

--koUrbt4JaxBV8w2EuFG5sKpjVDgYJYRoR--


