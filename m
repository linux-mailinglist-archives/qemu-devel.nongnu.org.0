Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85828BBD2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 16:44:33 +0200 (CEST)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxY2K-0005KB-WF
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 10:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hxY1k-0004RD-U9
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 10:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hxY1j-0005Jf-UI
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 10:43:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56276)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hxY1h-0005I1-EL; Tue, 13 Aug 2019 10:43:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 452962F8BDB;
 Tue, 13 Aug 2019 14:43:52 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB4413484C;
 Tue, 13 Aug 2019 14:43:50 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20190812181146.26121-1-vsementsov@virtuozzo.com>
 <20190812181146.26121-2-vsementsov@virtuozzo.com>
 <20190813110428.GE4663@localhost.localdomain>
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
Message-ID: <fef7f4d1-b40e-6c84-3952-120a641a8061@redhat.com>
Date: Tue, 13 Aug 2019 16:43:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813110428.GE4663@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QDI3kMsPK9qVnBP1gUBMVAIa6MJR9weSp"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 13 Aug 2019 14:43:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] block/raw-format: switch to
 BDRV_BLOCK_DATA with BDRV_BLOCK_RECURSE
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
Cc: den@openvz.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QDI3kMsPK9qVnBP1gUBMVAIa6MJR9weSp
Content-Type: multipart/mixed; boundary="vHkyHna57nROrp8wgFgWykhKHMdNOKQVC";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, den@openvz.org
Message-ID: <fef7f4d1-b40e-6c84-3952-120a641a8061@redhat.com>
Subject: Re: [PATCH 1/2] block/raw-format: switch to BDRV_BLOCK_DATA with
 BDRV_BLOCK_RECURSE
References: <20190812181146.26121-1-vsementsov@virtuozzo.com>
 <20190812181146.26121-2-vsementsov@virtuozzo.com>
 <20190813110428.GE4663@localhost.localdomain>
In-Reply-To: <20190813110428.GE4663@localhost.localdomain>

--vHkyHna57nROrp8wgFgWykhKHMdNOKQVC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 13.08.19 13:04, Kevin Wolf wrote:
> Am 12.08.2019 um 20:11 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> BDRV_BLOCK_RAW makes generic bdrv_co_block_status to fallthrough to
>> returned file. But is it correct behavior at all? If returned file
>> itself has a backing file, we may report as totally unallocated and
>> area which actually has data in bottom backing file.
>>
>> So, mirroring of qcow2 under raw-format is broken. Which is illustrate=
d
>> by following commit with a test. Let's make raw-format behave more
>> correctly returning BDRV_BLOCK_DATA.
>>
>> Suggested-by: Max Reitz <mreitz@redhat.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>=

>=20
> After some reading, I think I came to the conclusion that RAW is the
> correct thing to do. There is indeed a problem, but this patch is tryin=
g
> to fix it in the wrong place.
>=20
> In the case where the backing file contains some data, and we have a
> 'raw' node above the qcow2 overlay node, the content of the respective
> block is not defined by the queried backing file layer, so it is
> completely correct that bdrv_is_allocated() returns false,like it would=

> if you queried the qcow2 layer directly.

I disagree.  The queried backing file layer is the raw node.  As I said,
in my opinion raw nodes are not filter nodes, neither in behavior (they
have an offset option), nor in how they are generally used (as a format).=


The raw format does not support backing files.  Therefore, everything on
a raw node is allocated.

(That is, like, my opinion.)

>                                          If it returned true, we would
> copy everything, which isn't right either (the test cases should may ad=
d
> the qemu-img map output of the target so this becomes visible).

It is right.

Max


--vHkyHna57nROrp8wgFgWykhKHMdNOKQVC--

--QDI3kMsPK9qVnBP1gUBMVAIa6MJR9weSp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1SzKQACgkQ9AfbAGHV
z0D1oAf9F8CE6jsyHHnSTMbN5z+KV0eHnoXS600/TPy9IlsiHw+ytZhsln3RqAYL
WnrrAeaOL8W92ea3wEpzU0KdInbUTA1PIlbhjPMLXgFNo7AJ0ZjIoZo0JDapGZDF
UPDXDthJ3OB5JiSUQjYHbv4uCmU6Tvyp7wzrN3Ciiu0FFaKvbWKKe8GZOV1O4Mmx
uT2T5AuIY7hv61d2HLz2I+ToiGkxTusGJjxQAelbzvwxIpyccSx1xj1Lf6d6PS3u
fkyCR0nCqgc6vV7AhyyF+IFiGup8anSqn5QKmB7hB4dwUfr1fXgajFlTE5Vkursc
Y+uFbulW+H5yT2Q5NCEQzw0iSjJ+Wg==
=4jtA
-----END PGP SIGNATURE-----

--QDI3kMsPK9qVnBP1gUBMVAIa6MJR9weSp--

