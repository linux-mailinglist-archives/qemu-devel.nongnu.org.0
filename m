Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E936083
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 17:47:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYY8F-0001Wg-2X
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 11:47:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hYY4M-0007Jm-JE
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 11:43:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hYXuh-000157-JN
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 11:33:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:17420)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hYXug-0000ys-5w; Wed, 05 Jun 2019 11:33:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95AC330A6960;
	Wed,  5 Jun 2019 15:33:16 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ABF360BC9;
	Wed,  5 Jun 2019 15:33:14 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20190605152650.103483-1-vsementsov@virtuozzo.com>
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
Message-ID: <2b93344d-d0c2-5c36-0693-6fc1e3cef607@redhat.com>
Date: Wed, 5 Jun 2019 17:33:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605152650.103483-1-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3jMWI3i7GVhYl3Sg86ck25O9OlIRpt9Su"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 05 Jun 2019 15:33:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] iotests: fix 254 for qcow (1)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3jMWI3i7GVhYl3Sg86ck25O9OlIRpt9Su
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: kwolf@redhat.com
Message-ID: <2b93344d-d0c2-5c36-0693-6fc1e3cef607@redhat.com>
Subject: Re: [PATCH] iotests: fix 254 for qcow (1)
References: <20190605152650.103483-1-vsementsov@virtuozzo.com>
In-Reply-To: <20190605152650.103483-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.06.19 17:26, Vladimir Sementsov-Ogievskiy wrote:
> Qcow default cluster size is 4k, but default format of created overlay
> image on snapshot operation is qcow2 with it's default cluster of 64k.

Then I wonder why we run this test even for anything but qcow2.

I forgot to mention that this test also fails for all image formats that
do not support image creation.  So we need some form of
iotests.verify_image_format() anyway.  If half of this test requires
qcow2, and the other half does not really care about the image format,
then why not just restrict it to qcow2 altogether.

(Or restrict it to all formats that support backing files, and then
explicitly specify the format when creating the snapshot?)

Max

> This leads to block-dirty-bitmap-merge fail when test run for qcow
> format, as it can't merge bitmaps with different granularities.
> Let's fix it by specifying strict granularity.
>=20
> Reported-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/254     | 5 +++--
>  tests/qemu-iotests/254.out | 3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
> index 33cb80a512..a8ea5818ff 100755
> --- a/tests/qemu-iotests/254
> +++ b/tests/qemu-iotests/254
> @@ -29,7 +29,8 @@ qemu_img_create('-f', iotests.imgfmt, disk, str(size)=
)
>  vm =3D iotests.VM().add_drive(disk, opts=3D'node-name=3Dbase')
>  vm.launch()
> =20
> -vm.qmp_log('block-dirty-bitmap-add', node=3D'drive0', name=3D'bitmap0'=
)
> +vm.qmp_log('block-dirty-bitmap-add', node=3D'drive0', name=3D'bitmap0'=
,
> +           granularity=3D65536)
> =20
>  vm.hmp_qemu_io('drive0', 'write 0 512K')
> =20
> @@ -38,7 +39,7 @@ vm.qmp_log('transaction', indent=3D2, actions=3D[
>       'data': {'device': 'drive0', 'snapshot-file': top,
>                'snapshot-node-name': 'snap'}},
>      {'type': 'block-dirty-bitmap-add',
> -     'data': {'node': 'snap', 'name': 'bitmap0'}},
> +     'data': {'node': 'snap', 'name': 'bitmap0', 'granularity': 65536}=
},
>      {'type': 'block-dirty-bitmap-merge',
>       'data': {'node': 'snap', 'target': 'bitmap0',
>                'bitmaps': [{'node': 'base', 'name': 'bitmap0'}]}}
> diff --git a/tests/qemu-iotests/254.out b/tests/qemu-iotests/254.out
> index d7394cf002..dc899016da 100644
> --- a/tests/qemu-iotests/254.out
> +++ b/tests/qemu-iotests/254.out
> @@ -1,4 +1,4 @@
> -{"execute": "block-dirty-bitmap-add", "arguments": {"name": "bitmap0",=
 "node": "drive0"}}
> +{"execute": "block-dirty-bitmap-add", "arguments": {"granularity": 655=
36, "name": "bitmap0", "node": "drive0"}}
>  {"return": {}}
>  {
>    "execute": "transaction",
> @@ -14,6 +14,7 @@
>        },
>        {
>          "data": {
> +          "granularity": 65536,
>            "name": "bitmap0",
>            "node": "snap"
>          },
>=20



--3jMWI3i7GVhYl3Sg86ck25O9OlIRpt9Su
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlz34LMACgkQ9AfbAGHV
z0DqDAf/VOEkX2jFePJf+qhBkdfgrNmC0lxuuV8I2bXCL24FuDINuDw2gfxeFoiE
HEeDm6S5B4X+AlcfauSDyue1bEFa+AqCjdjJ6nNFFDXAbXGmxb8THhbiFs/hmwHU
rJqhWo5qp8fGteedLF+vH66YC0BTaVsez+aOaVieXMJH4iE9TfdOchtNrDsJqLnI
UxLdyPqBtyo29/lDNnptH33/RIa7itiPPBXTFU2aQatxLaus8StKWj+okeK89ggh
RIvvCnxbyZ+pgYdbb66jMClgAX4zQ6o7Y8qAokjGBFUJjprt+gg7eul0E96KK89t
je8A/dj31CQyztGwn8zHmMWihwEyBw==
=eq3O
-----END PGP SIGNATURE-----

--3jMWI3i7GVhYl3Sg86ck25O9OlIRpt9Su--

