Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179178A779
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 21:47:17 +0200 (CEST)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxGHk-0000LM-2g
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 15:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55133)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hxGHD-0008IP-OJ
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 15:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hxGHB-0007Rn-Jn
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 15:46:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hxGH4-0007OL-A9; Mon, 12 Aug 2019 15:46:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DC2753082E61;
 Mon, 12 Aug 2019 19:46:32 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-161.brq.redhat.com
 [10.40.204.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83BD362675;
 Mon, 12 Aug 2019 19:46:31 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20190812181146.26121-1-vsementsov@virtuozzo.com>
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
Message-ID: <35b23140-25d5-627e-7a86-4b50fbc5be52@redhat.com>
Date: Mon, 12 Aug 2019 21:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812181146.26121-1-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LTY0Pw6GQw1upVhioBnMB1DczlNIYOuoy"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 12 Aug 2019 19:46:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] deal with BDRV_BLOCK_RAW
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LTY0Pw6GQw1upVhioBnMB1DczlNIYOuoy
Content-Type: multipart/mixed; boundary="JlA5z186qP29Vfgcd3caOVd5StHU62e6s";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org
Message-ID: <35b23140-25d5-627e-7a86-4b50fbc5be52@redhat.com>
Subject: Re: [PATCH 0/2] deal with BDRV_BLOCK_RAW
References: <20190812181146.26121-1-vsementsov@virtuozzo.com>
In-Reply-To: <20190812181146.26121-1-vsementsov@virtuozzo.com>

--JlA5z186qP29Vfgcd3caOVd5StHU62e6s
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12.08.19 20:11, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>=20
> I'm not sure, is it a bug or a feature, but using qcow2 under raw is
> broken. It should be either fixed like I propose (by Max's suggestion)
> or somehow forbidden (just forbid backing-file supporting node to be
> file child of raw-format node).

I agree, I think only filters should return BDRV_BLOCK_RAW.

(And not even them, they should just be handled transparently by
bdrv_co_block_status().  But that=E2=80=99s something for later.)

> Vladimir Sementsov-Ogievskiy (2):
>   block/raw-format: switch to BDRV_BLOCK_DATA with BDRV_BLOCK_RECURSE
>   iotests: test mirroring qcow2 under raw format
>=20
>  block/raw-format.c         |  2 +-
>  tests/qemu-iotests/263     | 46 ++++++++++++++++++++++++++++++++++++++=

>  tests/qemu-iotests/263.out | 12 ++++++++++
>  tests/qemu-iotests/group   |  1 +
>  4 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100755 tests/qemu-iotests/263
>  create mode 100644 tests/qemu-iotests/263.out

Thanks, applied to my block-next branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block-next

Max


--JlA5z186qP29Vfgcd3caOVd5StHU62e6s--

--LTY0Pw6GQw1upVhioBnMB1DczlNIYOuoy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1RwhUACgkQ9AfbAGHV
z0CBzQf+N6w29T1N1NuIiYu86Ljjl8tuD7OLluW2cRtxFkHL3pgeUkcZZBS2UI1/
tp7FBaBteXaguI7pQr3S9m1UetMB6HNCTSahdKvfinThYeCGuT6qrCXf5984Ytgu
zYII1iRjGNZ9MFCsmejJSY3Tjx9ti9qtdsb2o+uy/Apny+I8uLPKNCCyAhYQcdgk
h7j3TezEHZGt4zHEH6tvM3xKqvCHXgO/MFjG4ytj7EMzGtYm3qo1gddaBnJDT5Hh
uCdWdx0fyvOTYNRt2JSG12uZPnPdz/pm43H0xBF6slFmNj6IPn915y2vpaLlWt4k
OB3kaiE7Hu+DTwSgjVnkiiK4sdb0gw==
=FuYY
-----END PGP SIGNATURE-----

--LTY0Pw6GQw1upVhioBnMB1DczlNIYOuoy--

