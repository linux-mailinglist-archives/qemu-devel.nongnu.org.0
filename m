Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEA41800A7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 15:52:48 +0100 (CET)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBgFT-0004RO-SP
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 10:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jBgDS-0002tJ-IV
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 10:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jBgDR-0000aI-K4
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 10:50:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40588
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jBgDR-0000XV-Dm
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 10:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583851841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9gqMhk2aZv8QvPgFVgodpZzg4YAjjiy5ft9QutMscj8=;
 b=W6JBmaHRi1OQlaUKHyl2r5FZFz+trFRc1ISgYz5LJN0b5xOhDxgB29YCt/v3MwRY/1qOdW
 gzRg38fEVMDBi36sAZVN8lQ415eP+vev6XcyKmbdL4mmrLthSLBwJuchiUNdk5cmvB4y8e
 5z+5vYamvVo1SRy23gP3ZI51SMDCbBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-2FlmisSJP1iH_WafqpGbUw-1; Tue, 10 Mar 2020 10:50:33 -0400
X-MC-Unique: 2FlmisSJP1iH_WafqpGbUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA2C19067E7;
 Tue, 10 Mar 2020 14:50:32 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7D4873874;
 Tue, 10 Mar 2020 14:50:30 +0000 (UTC)
Subject: Re: [PATCH v3 7/9] block/block-copy: rename start to offset in
 interfaces
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200306073831.7737-1-vsementsov@virtuozzo.com>
 <20200306073831.7737-8-vsementsov@virtuozzo.com>
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
Message-ID: <826a06c1-49d0-24a0-4098-fc0ec8f9f5a0@redhat.com>
Date: Tue, 10 Mar 2020 15:50:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306073831.7737-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NEZ5k1BGm0LB1aQxVtQKwwBOA7cvuqIYx"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NEZ5k1BGm0LB1aQxVtQKwwBOA7cvuqIYx
Content-Type: multipart/mixed; boundary="XSB3zTv9Fy6D78ccLW5mLqH6vvvTBLXpv"

--XSB3zTv9Fy6D78ccLW5mLqH6vvvTBLXpv
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06.03.20 08:38, Vladimir Sementsov-Ogievskiy wrote:
> offset/bytes pair is more usual naming in block layer, let's use it.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>  include/block/block-copy.h |  4 +-
>  block/block-copy.c         | 84 +++++++++++++++++++-------------------
>  2 files changed, 44 insertions(+), 44 deletions(-)

[...]

> diff --git a/block/block-copy.c b/block/block-copy.c
> index 4c947e548b..2b29131653 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -25,13 +25,13 @@
>  #define BLOCK_COPY_MAX_MEM (128 * MiB)
> =20
>  static BlockCopyInFlightReq *find_conflicting_inflight_req(BlockCopyStat=
e *s,
> -                                                           int64_t start=
,
> -                                                           int64_t bytes=
)
> +                                                          int64_t offset=
,
> +                                                          int64_t bytes)

The alignment=92s off now.

Max


--XSB3zTv9Fy6D78ccLW5mLqH6vvvTBLXpv--

--NEZ5k1BGm0LB1aQxVtQKwwBOA7cvuqIYx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5nqTUACgkQ9AfbAGHV
z0Ceswf/XOQgllj1DuB4cLFBs/9CvPivEz+l7jKkxWu7EZMZDRSprqLbBbpDtANz
sebnhx6t2mMi2XkkqEGltg8mtZeumEMjuqzxqGXH96oTv2PPUGdDn4zozBCJNCpL
P6kdFVZ/hZqaCuhbw3V/IK17Rnsb50SrugxBx5m5HMqtWdVeriYLwPnJRvzHnt4M
t7MqVqbWWRiHkkwzZFZ0T1wbNxdb2tEDMpMjIxhZyL4R3Rw8CIBLPDC8DYFmYNOc
/TAV4YeHGv376Fyu2H1qrJ4p3f3M5U1c72hySOZK2Yl9Ptwf2Mbd/2+wkXPIuz5o
ni+G+hDnCxySo7IiWZBtzntxtoYkMQ==
=xpkW
-----END PGP SIGNATURE-----

--NEZ5k1BGm0LB1aQxVtQKwwBOA7cvuqIYx--


