Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D657DAD9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 14:04:00 +0200 (CEST)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ht9oN-00005x-PS
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 08:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40394)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1ht9na-0007ql-Kc
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:03:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ht9nZ-0002UQ-N6
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:03:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47328)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1ht9nX-0002Te-Js; Thu, 01 Aug 2019 08:03:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5BE930B1AD0;
 Thu,  1 Aug 2019 12:03:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-187.brq.redhat.com
 [10.40.204.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D5F4100032A;
 Thu,  1 Aug 2019 12:03:05 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20190731204203.10732-1-kwolf@redhat.com>
 <20190731204203.10732-4-kwolf@redhat.com>
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
Message-ID: <f7525aea-04bc-d66f-fc5c-7b539bedb7df@redhat.com>
Date: Thu, 1 Aug 2019 14:03:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731204203.10732-4-kwolf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vZtwBxcGmal2SftqKNiUyn7pgyfAc6hv6"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 01 Aug 2019 12:03:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] iotests/118: Add -blockdev based tests
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vZtwBxcGmal2SftqKNiUyn7pgyfAc6hv6
Content-Type: multipart/mixed; boundary="xF07yb9NEMH7Bw3QXShpYwzFg7yDaXoSy";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
Message-ID: <f7525aea-04bc-d66f-fc5c-7b539bedb7df@redhat.com>
Subject: Re: [PATCH 3/3] iotests/118: Add -blockdev based tests
References: <20190731204203.10732-1-kwolf@redhat.com>
 <20190731204203.10732-4-kwolf@redhat.com>
In-Reply-To: <20190731204203.10732-4-kwolf@redhat.com>

--xF07yb9NEMH7Bw3QXShpYwzFg7yDaXoSy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 31.07.19 22:42, Kevin Wolf wrote:
> The code path for -device drive=3D<node-name> or without a drive=3D...
> option for empty drives, which is supposed to be used with -blockdev
> differs enough from the -drive based path with a user-owned
> BlockBackend, so we want to test both paths at least for the basic test=
s
> implemented by TestInitiallyFilled and TestInitiallyEmpty.
>=20
> This would have caught the bug recently fixed for inserting read-only
> nodes into a scsi-cd created without a drive=3D... option.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/118     | 43 ++++++++++++++++++++++++++------------=

>  tests/qemu-iotests/118.out |  4 ++--
>  2 files changed, 32 insertions(+), 15 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--xF07yb9NEMH7Bw3QXShpYwzFg7yDaXoSy--

--vZtwBxcGmal2SftqKNiUyn7pgyfAc6hv6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1C1PgACgkQ9AfbAGHV
z0DZEwf/cGXYbHI2yqJ34GP7hnzzMkPbUtrLkWzRcW5fvllluAhThDxdQn/lxyMK
UKePDYrPl6lASvWyXwYi17t+UeLeUgCytY3OmzTxnhaI94TUzIBbDjQEKXRE2DKI
m+pi3U5tdNHyiCDo3oFCZW5eFs0Xi1f+7XZPgUOLFeZQoX9VONTBBoKwUh6rb22Y
oti6nWN74yy7mTaRNJeIAFrB1ZUmc3RlSwm7wObe8c4pxgkve2zlbj9N0fGNCC3c
Vk7yF2Oz8yct9UrtIKixscHkFVhDmlb6LpSpqI5uXM0BOQCf96exY/S6JDe0EEtl
dIr3EqSx3R9vkeaubUir+OhfeMlTLQ==
=jBuH
-----END PGP SIGNATURE-----

--vZtwBxcGmal2SftqKNiUyn7pgyfAc6hv6--

