Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D3A0445
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 16:09:35 +0200 (CEST)
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2ydi-0007Gt-8a
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 10:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2yck-0006hb-Ja
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:08:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2ycj-0006up-N6
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:08:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2ych-0006tI-Ed; Wed, 28 Aug 2019 10:08:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E291E86668;
 Wed, 28 Aug 2019 14:08:29 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-32.brq.redhat.com
 [10.40.204.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C4665C1D6;
 Wed, 28 Aug 2019 14:08:21 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20190826161312.489398-1-vsementsov@virtuozzo.com>
 <20190826161312.489398-2-vsementsov@virtuozzo.com>
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
Message-ID: <c07fc397-debb-42bf-4e15-fa9a680eb129@redhat.com>
Date: Wed, 28 Aug 2019 16:08:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826161312.489398-2-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lmsmAayjcelYJaQtItct1jCoFAevHShlR"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 28 Aug 2019 14:08:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v9 01/13] block/backup: fix
 backup_cow_with_offload for last cluster
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lmsmAayjcelYJaQtItct1jCoFAevHShlR
Content-Type: multipart/mixed; boundary="dE393h8SeqBki91MOxFqadAsWqFDLzxr8";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
Message-ID: <c07fc397-debb-42bf-4e15-fa9a680eb129@redhat.com>
Subject: Re: [PATCH v9 01/13] block/backup: fix backup_cow_with_offload for
 last cluster
References: <20190826161312.489398-1-vsementsov@virtuozzo.com>
 <20190826161312.489398-2-vsementsov@virtuozzo.com>
In-Reply-To: <20190826161312.489398-2-vsementsov@virtuozzo.com>

--dE393h8SeqBki91MOxFqadAsWqFDLzxr8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 26.08.19 18:13, Vladimir Sementsov-Ogievskiy wrote:
> We shouldn't try to copy bytes beyond EOF. Fix it.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/backup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/backup.c b/block/backup.c
> index 2baf7bed65..33b144305f 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -161,7 +161,7 @@ static int coroutine_fn backup_cow_with_offload(Bac=
kupBlockJob *job,
> =20
>      assert(QEMU_IS_ALIGNED(job->copy_range_size, job->cluster_size));
>      assert(QEMU_IS_ALIGNED(start, job->cluster_size));
> -    nbytes =3D MIN(job->copy_range_size, end - start);
> +    nbytes =3D MIN(job->copy_range_size, MIN(end - start, job->len - s=
tart));

Might be easier to read as MIN(end, job->len) - start, but either way:

Reviewed-by: Max Reitz <mreitz@redhat.com>

>      nr_clusters =3D DIV_ROUND_UP(nbytes, job->cluster_size);
>      bdrv_reset_dirty_bitmap(job->copy_bitmap, start,
>                              job->cluster_size * nr_clusters);
>=20



--dE393h8SeqBki91MOxFqadAsWqFDLzxr8--

--lmsmAayjcelYJaQtItct1jCoFAevHShlR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1mitMACgkQ9AfbAGHV
z0Aw8Qf/fPDSfkdTA9vZ7R7dwKjGK4+MjBP7/Q2E60+9byh+W2RjaA03l3Pb5fDg
7xjiJQFXsj0r3YYxRT2sAccMO+WMKnBjXFSlttaAJJ5wfqb3h+xcjegvKkU7KZ80
a76J2GWVT7oVPV8w1VdlAf10RYI55sfwBLXvWRoKRtFkaVyo7KSEsYlk8xlhTqik
2gss23eFC8Y4gSyA/DhPEROl7TLEVW2faSjG3U4N0picNArp/WZcz0LzWwD/9/7D
8x3iiy0wACI0eXBYyOTBEpf1zShF+q0sV7QTQhYa06OxVdkl1oXXq4FLGtpwAiyq
DK5g9BaXm4hDYAJ95zingTwkrqvkgA==
=GS1h
-----END PGP SIGNATURE-----

--lmsmAayjcelYJaQtItct1jCoFAevHShlR--

