Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523C64B4E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 19:16:02 +0200 (CEST)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlGCH-0000UI-7U
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 13:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46031)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hlGAx-0008Rr-9F
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 13:14:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hlGAw-000606-Cy
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 13:14:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9597)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hlGAu-0005xv-9W; Wed, 10 Jul 2019 13:14:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 76241C08C327;
 Wed, 10 Jul 2019 17:14:35 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C308660603;
 Wed, 10 Jul 2019 17:14:33 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190710010556.32365-1-jsnow@redhat.com>
 <20190710010556.32365-9-jsnow@redhat.com>
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
Message-ID: <8147a871-906b-2e97-86c1-fd8f32218960@redhat.com>
Date: Wed, 10 Jul 2019 19:14:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190710010556.32365-9-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1hPD8HVSGyMdVvCdIzAOitW6N1fJNLo4l"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 10 Jul 2019 17:14:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 8/8] iotests/257: test traditional sync
 modes
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1hPD8HVSGyMdVvCdIzAOitW6N1fJNLo4l
Content-Type: multipart/mixed; boundary="908CL1uiqwuDZcFSkJ3DUWFoid3vblRo6";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>
Message-ID: <8147a871-906b-2e97-86c1-fd8f32218960@redhat.com>
Subject: Re: [PATCH 8/8] iotests/257: test traditional sync modes
References: <20190710010556.32365-1-jsnow@redhat.com>
 <20190710010556.32365-9-jsnow@redhat.com>
In-Reply-To: <20190710010556.32365-9-jsnow@redhat.com>

--908CL1uiqwuDZcFSkJ3DUWFoid3vblRo6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10.07.19 03:05, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/257     |   31 +
>  tests/qemu-iotests/257.out | 3089 ++++++++++++++++++++++++++++++++++++=

>  2 files changed, 3120 insertions(+)

Oof.

> diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
> index de8707cb19..8de1c4da19 100755
> --- a/tests/qemu-iotests/257
> +++ b/tests/qemu-iotests/257

[...]

> @@ -410,6 +416,11 @@ def test_bitmap_sync(bsync_mode, msync_mode=3D'bit=
map', failure=3DNone):
>          if bsync_mode =3D=3D 'always' and failure =3D=3D 'intermediate=
':
>              # We manage to copy one sector (one bit) before the error.=

>              ebitmap.clear_bit(ebitmap.first_bit)
> +            if msync_mode in ('full', 'top'):
> +                # These modes return all bits set except what was copi=
ed/skipped

Hm.  How useful is bitmap support for 'top' then, anyway?  That means
that if you want to resume a top backup, you always have to resume it
like it was a full backup.  Which sounds kind of useless.

Max

> +                fail_bit =3D ebitmap.first_bit
> +                ebitmap.clear()
> +                ebitmap.dirty_bits(range(fail_bit, SIZE // GRANULARITY=
))
>          ebitmap.compare(get_bitmap(bitmaps, drive0.device, 'bitmap0'))=

> =20
>          # 2 - Writes and Reference Backup
[...]


--908CL1uiqwuDZcFSkJ3DUWFoid3vblRo6--

--1hPD8HVSGyMdVvCdIzAOitW6N1fJNLo4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0mHPgACgkQ9AfbAGHV
z0D+SAf8CbzL0haLc/qU+qTRy7VshDgDbyguHEHMjHI2if/Vs/zgC7Wq8UTL88iS
CfwuAtSoJjSZowxvMku759gfrMPPXua5z8+GDrBk/kgA9Z9HpXpSUayXBKF77lsn
CmhZgb3zasP/wlwid23Wz0VTY9uz7GT9JFiJ+GexB+S9IQtWK0gMPmVObCTIXLK3
JghbhJhDGgRLhYrstuCo4Z/OsGkbaWZvi+fr3t1PYOi1wTbv3e11vvJItbJENyHz
UPK6nEDm4AIKMEO/2DPHOXbvX/v8lWaU2af4dTujWDtclgI9K1oRUzJOx5WITb63
wSvbGNr5tjBngVt2ytkqVt5dxa+R6w==
=LU6i
-----END PGP SIGNATURE-----

--1hPD8HVSGyMdVvCdIzAOitW6N1fJNLo4l--

