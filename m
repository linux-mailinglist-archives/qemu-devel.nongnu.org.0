Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61C6884A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 13:40:48 +0200 (CEST)
Received: from localhost ([::1]:37430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmzLc-000239-5J
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 07:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53399)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hmzLN-0001bL-8C
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hmzLL-0006PL-2r
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:40:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52124)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hmzL8-0006Dh-Ry; Mon, 15 Jul 2019 07:40:20 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A32F2308302F;
 Mon, 15 Jul 2019 11:40:17 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2FE86012C;
 Mon, 15 Jul 2019 11:40:07 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190708220502.12977-1-jsnow@redhat.com>
 <20190708220502.12977-3-jsnow@redhat.com>
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
Message-ID: <e4bd7590-717c-a963-563e-563d8a968e7b@redhat.com>
Date: Mon, 15 Jul 2019 13:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708220502.12977-3-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9cJ1hCFSXYixSdIA7jVrO68FVugGI0qGE"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 15 Jul 2019 11:40:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 2/3] qapi: implement
 block-dirty-bitmap-remove transaction action
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9cJ1hCFSXYixSdIA7jVrO68FVugGI0qGE
Content-Type: multipart/mixed; boundary="jQ3DKaFJpo0ubKeA4im3exuwXSXlC6VSi";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 vsementsov@virtuozzo.com, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Message-ID: <e4bd7590-717c-a963-563e-563d8a968e7b@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: implement block-dirty-bitmap-remove
 transaction action
References: <20190708220502.12977-1-jsnow@redhat.com>
 <20190708220502.12977-3-jsnow@redhat.com>
In-Reply-To: <20190708220502.12977-3-jsnow@redhat.com>

--jQ3DKaFJpo0ubKeA4im3exuwXSXlC6VSi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09.07.19 00:05, John Snow wrote:
> It is used to do transactional movement of the bitmap (which is
> possible in conjunction with merge command). Transactional bitmap
> movement is needed in scenarios with external snapshot, when we don't
> want to leave copy of the bitmap in the base image.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  block.c                        |  2 +-
>  block/dirty-bitmap.c           | 15 +++----
>  blockdev.c                     | 79 +++++++++++++++++++++++++++++++---=

>  include/block/dirty-bitmap.h   |  2 +-
>  migration/block-dirty-bitmap.c |  2 +-
>  qapi/transaction.json          |  2 +
>  6 files changed, 85 insertions(+), 17 deletions(-)

[...]

> diff --git a/qapi/transaction.json b/qapi/transaction.json
> index 95edb78227..da95b804aa 100644
> --- a/qapi/transaction.json
> +++ b/qapi/transaction.json
> @@ -45,6 +45,7 @@
>  #
>  # - @abort: since 1.6
>  # - @block-dirty-bitmap-add: since 2.5
> +# - @block-dirty-bitmap-remove: since 4.1

Optimistic.

But anyway:

Reviewed-by: Max Reitz <mreitz@redhat.com>

>  # - @block-dirty-bitmap-clear: since 2.5
>  # - @block-dirty-bitmap-enable: since 4.0
>  # - @block-dirty-bitmap-disable: since 4.0


--jQ3DKaFJpo0ubKeA4im3exuwXSXlC6VSi--

--9cJ1hCFSXYixSdIA7jVrO68FVugGI0qGE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0sZhUACgkQ9AfbAGHV
z0AuhAf7BWC/i7s8FmOPvCXcfBQBArsJZ5mON7lJaDpk0mS3luQvv0y4/mUOZt33
8XyLt5l65qWFi4DU+CKpSWSXffPkJETeU+sz6CDPIYu/xLimmZUqfUgFb6K+HlWb
3Bg3NLF3o8lsi5kycWVc922JzwkxWXWWlwXTAJId/JE4b9nXtsRD9CyEVqNKn6Kr
ifCNMBjiIWaVLhmyzXbSYtC8/Dfn9ixiMBO2gkIDWBPeZaPpnKjYWqYD+ist6Hj9
24QBLSGcmSbQ6kfI47peJPBEb4quWvHAoSuyUtQEolu4JefZH51yQ9yR7URHGsjX
KsYyur5nkH24DhEotVJXz9FXwilyXg==
=0Qj8
-----END PGP SIGNATURE-----

--9cJ1hCFSXYixSdIA7jVrO68FVugGI0qGE--

