Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506BC8ED9A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 16:04:01 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyGMC-0002ok-ES
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 10:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hyGLB-0002Ll-4l
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:02:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hyGL7-0003yC-Ni
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:02:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34810)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hyGKy-0003vI-U0; Thu, 15 Aug 2019 10:02:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C944E30024C4;
 Thu, 15 Aug 2019 14:02:42 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA8D44B2;
 Thu, 15 Aug 2019 14:02:35 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20190815121042.121309-1-vsementsov@virtuozzo.com>
 <20190815121042.121309-4-vsementsov@virtuozzo.com>
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
Message-ID: <bf6e0e4a-bf79-6031-5ad9-55b5793f3e03@redhat.com>
Date: Thu, 15 Aug 2019 16:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815121042.121309-4-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uNLHsnMbwaREIJ0PQjJHsUKlHZQUpyENY"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 15 Aug 2019 14:02:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 3/4] block/qcow2: refactor
 qcow2_co_pwritev_part
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
--uNLHsnMbwaREIJ0PQjJHsUKlHZQUpyENY
Content-Type: multipart/mixed; boundary="Y5Pzhvqwv7tVl09hs4u95QTKa117cd0gD";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, den@openvz.org, stefanha@redhat.com
Message-ID: <bf6e0e4a-bf79-6031-5ad9-55b5793f3e03@redhat.com>
Subject: Re: [PATCH v3 3/4] block/qcow2: refactor qcow2_co_pwritev_part
References: <20190815121042.121309-1-vsementsov@virtuozzo.com>
 <20190815121042.121309-4-vsementsov@virtuozzo.com>
In-Reply-To: <20190815121042.121309-4-vsementsov@virtuozzo.com>

--Y5Pzhvqwv7tVl09hs4u95QTKa117cd0gD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 15.08.19 14:10, Vladimir Sementsov-Ogievskiy wrote:
> Similarly to previous commit, prepare for parallelizing write-loop
> iterations.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2.c | 153 +++++++++++++++++++++++++++++---------------------=

>  1 file changed, 89 insertions(+), 64 deletions(-)
>=20
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 89afb4272e..3aaa180e2b 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -2234,6 +2234,87 @@ static int handle_alloc_space(BlockDriverState *=
bs, QCowL2Meta *l2meta)
>      return 0;
>  }
> =20
> +/*
> + * qcow2_co_pwritev_task
> + * Called with s->lock unlocked
> + * l2meta  - if not NULL, qcow2_co_do_pwritev() will consume it. Calle=
r must not

You missed this instance of =E2=80=9Cqcow2_co_do_pwritev()=E2=80=9D.

With that fixed:

Reviewed-by: Max Reitz <mreitz@redhat.com>


--Y5Pzhvqwv7tVl09hs4u95QTKa117cd0gD--

--uNLHsnMbwaREIJ0PQjJHsUKlHZQUpyENY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1VZfoACgkQ9AfbAGHV
z0A14wf/ahPygEMx1UOsEy3tEPG04CgAzDueDCZ86oJQhGUVoCE0HEZi6zac7VXq
9dG2ZaGcy1sbLBSE0RepJXcAa7DYjRi5DUiCA83ZSCWti8z/tWzBvE2UtrnsxUx2
MI+MN9VBlsY7FeUdiOYTYLGD5ZCdAVsZ3bfRge0jSenQHbqXHU61f4DreqhRK3qY
XGzeKHBAcVWGiOoEE/i7NKMBpMuiL7wfVy0ykCK+62hiLGHewt+XLcM+twc2zdYv
vNXcXqatu0igz7odhYidwISzyTj1MZOanLhlhVGpdR897N9LD7+m6vmDK5dF/OLH
1eWO+AUacmP9LI4UHfxakf3J28pKXg==
=wYlS
-----END PGP SIGNATURE-----

--uNLHsnMbwaREIJ0PQjJHsUKlHZQUpyENY--

