Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221D8ED2A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 15:42:46 +0200 (CEST)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyG1d-0002yf-Fd
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 09:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hyG0f-0002TQ-FY
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 09:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hyG0c-0002aA-H8
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 09:41:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48752)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hyG0V-0002St-03; Thu, 15 Aug 2019 09:41:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94D02308427D;
 Thu, 15 Aug 2019 13:41:33 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D9E65C1D8;
 Thu, 15 Aug 2019 13:41:29 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20190815121042.121309-1-vsementsov@virtuozzo.com>
 <20190815121042.121309-2-vsementsov@virtuozzo.com>
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
Message-ID: <ffb68839-2d43-210f-4041-3482e72501a7@redhat.com>
Date: Thu, 15 Aug 2019 15:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815121042.121309-2-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PNQJmcoHY4klNtNU13oKoQKy9iF2Ul5Bz"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 15 Aug 2019 13:41:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 1/4] block: introduce aio task pool
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PNQJmcoHY4klNtNU13oKoQKy9iF2Ul5Bz
Content-Type: multipart/mixed; boundary="kVizUf7eICzzYHerYC7j1hQk7FhUAilRa";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, den@openvz.org, stefanha@redhat.com
Message-ID: <ffb68839-2d43-210f-4041-3482e72501a7@redhat.com>
Subject: Re: [PATCH v3 1/4] block: introduce aio task pool
References: <20190815121042.121309-1-vsementsov@virtuozzo.com>
 <20190815121042.121309-2-vsementsov@virtuozzo.com>
In-Reply-To: <20190815121042.121309-2-vsementsov@virtuozzo.com>

--kVizUf7eICzzYHerYC7j1hQk7FhUAilRa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 15.08.19 14:10, Vladimir Sementsov-Ogievskiy wrote:
> Common interface for aio task loops. To be used for improving
> performance of synchronous io loops in qcow2, block-stream,
> copy-on-read, and may be other places.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/aio_task.h |  54 +++++++++++++++++
>  block/aio_task.c         | 124 +++++++++++++++++++++++++++++++++++++++=

>  block/Makefile.objs      |   2 +
>  3 files changed, 180 insertions(+)
>  create mode 100644 include/block/aio_task.h
>  create mode 100644 block/aio_task.c
>=20
> diff --git a/include/block/aio_task.h b/include/block/aio_task.h
> new file mode 100644
> index 0000000000..58b4d99e59
> --- /dev/null
> +++ b/include/block/aio_task.h

[...]

> +AioTaskPool *aio_task_pool_new(int max_busy_tasks);

Because aio_task_pool_wait_one() asserts that it runs in the same
coroutine as aio_task_pool_new(), this should be a coroutine_fn as well.
O:-)

But I don=E2=80=99t want to be responsible for breaking your =E2=80=9C1=E2=
=80=9D key (assuming
you have the exclamation mark there):

Reviewed-by: Max Reitz <mreitz@redhat.com>


--kVizUf7eICzzYHerYC7j1hQk7FhUAilRa--

--PNQJmcoHY4klNtNU13oKoQKy9iF2Ul5Bz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1VYQcACgkQ9AfbAGHV
z0BBIQf+OeRizF4yMtowRaPe67w6xp8nEMBg1AZQHKliSpxD+BA51SOAi35l4lRV
sX77ZEvWqyNB5chopV9ZvhZi38VPn0ka7JixujD1X1QFNki78EQ5/kHuo86i9G9Q
devrdF18JjMwjxGqJyFsJ1kPbLyOp1VurC4MckJw31wkNtfeAt15Jtv6ovSbastC
tSZ/BIxb2zkHvAE6Bhji8de2OAOnJCy+550oj4XyvPOIFQU12uwWGHnvhnxtz0Uy
qIXKgA0DZARraGJQXuQM8iUNeWpBs+6oufXxe6clrfBjEsus1VTbf4pKrHcXz1AN
K+nofRDjIiOfay3FbjFbyMY+T61Zdw==
=4P2k
-----END PGP SIGNATURE-----

--PNQJmcoHY4klNtNU13oKoQKy9iF2Ul5Bz--

