Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0285540
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 23:39:13 +0200 (CEST)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvTeK-0004Ce-Pz
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 17:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43281)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hvTdk-0003j1-5c
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 17:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hvTdi-0001Bl-6j
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 17:38:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hvTdb-00017q-4K; Wed, 07 Aug 2019 17:38:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF86C3073A23;
 Wed,  7 Aug 2019 21:38:25 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-24.brq.redhat.com
 [10.40.204.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58CCD60852;
 Wed,  7 Aug 2019 21:38:21 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20190807144628.4988-1-kwolf@redhat.com>
 <20190807144628.4988-4-kwolf@redhat.com>
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
Message-ID: <ac80ef55-981f-375c-d505-44ae82f41417@redhat.com>
Date: Wed, 7 Aug 2019 23:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807144628.4988-4-kwolf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oh5n00VDyxYN50F14uLefoJlWdivHcpNl"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 07 Aug 2019 21:38:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 3/3] block-backend: Queue requests while
 drained
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
Cc: qemu-devel@nongnu.org, dplotnikov@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oh5n00VDyxYN50F14uLefoJlWdivHcpNl
Content-Type: multipart/mixed; boundary="CRWh7pAsRQgDsIPcQHSGAURW6u99Fpa0i";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eblake@redhat.com, dplotnikov@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com, qemu-devel@nongnu.org
Message-ID: <ac80ef55-981f-375c-d505-44ae82f41417@redhat.com>
Subject: Re: [PATCH v2 3/3] block-backend: Queue requests while drained
References: <20190807144628.4988-1-kwolf@redhat.com>
 <20190807144628.4988-4-kwolf@redhat.com>
In-Reply-To: <20190807144628.4988-4-kwolf@redhat.com>

--CRWh7pAsRQgDsIPcQHSGAURW6u99Fpa0i
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07.08.19 16:46, Kevin Wolf wrote:
> This fixes devices like IDE that can still start new requests from I/O
> handlers in the CPU thread while the block backend is drained.
>=20
> The basic assumption is that in a drain section, no new requests should=

> be allowed through a BlockBackend (blk_drained_begin/end don't exist,
> we get drain sections only on the node level). However, there are two
> special cases where requests should not be queued:
>=20
> 1. Block jobs: We already make sure that block jobs are paused in a
>    drain section, so they won't start new requests. However, if the
>    drain_begin is called on the job's BlockBackend first, it can happen=

>    that we deadlock because the job stays busy until it reaches a pause=

>    point - which it can't if its requests aren't processed any more.
>=20
>    The proper solution here would be to make all requests through the
>    job's filter node instead of using a BlockBackend. For now, just
>    disabling request queuing on the job BlockBackend is simpler.
>=20
> 2. In test cases where making requests through bdrv_* would be
>    cumbersome because we'd need a BdrvChild. As we already got the
>    functionality to disable request queuing from 1., use it in tests,
>    too, for convenience.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/sysemu/block-backend.h |  1 +
>  block/backup.c                 |  1 +
>  block/block-backend.c          | 53 ++++++++++++++++++++++++++++++++--=

>  block/commit.c                 |  2 ++
>  block/mirror.c                 |  1 +
>  blockjob.c                     |  3 ++
>  tests/test-bdrv-drain.c        |  1 +
>  7 files changed, 59 insertions(+), 3 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--CRWh7pAsRQgDsIPcQHSGAURW6u99Fpa0i--

--oh5n00VDyxYN50F14uLefoJlWdivHcpNl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1LRMwACgkQ9AfbAGHV
z0DmpAgAgFnBwfim5k6XGtxY2daTgC6vn6em77z1CZRVSNwsAQmM2i1aybzLo1Wu
bXKbqByA+KdM4U2IyUR4S+GvjtLzaMZpCpEOfo1We41P0nUBnVm5cESjB6xpxylJ
5hsNnkHzGW9np3OHylPNvfZIpNeKubV3KK9eBHhvBtbAYXL0T2lyA7xB0R9s7Xh0
izIiANTfPcgZuWDcFi7km9RKqo1HRDQg9ZB5l6FZiCJf0pfrUh1WEBTab7hYPC/o
XLTotC56ei170+4S5fdLpd+80y4Lt1ACwQ3nt8qfl/CcPdKYjRCLOlCv7IaN9V49
GlV3vv6N+7bKa445SH/ZyJtPiVe2bg==
=l5/r
-----END PGP SIGNATURE-----

--oh5n00VDyxYN50F14uLefoJlWdivHcpNl--

