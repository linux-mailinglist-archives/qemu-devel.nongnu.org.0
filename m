Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37678F55
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 17:32:33 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs7dY-00015W-E3
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 11:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47471)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hs7cI-00084e-L4
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hs7cH-00066I-JY
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:31:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37922)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hs7cB-00062p-GD; Mon, 29 Jul 2019 11:31:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 73D9B87642;
 Mon, 29 Jul 2019 15:31:05 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-55.ams2.redhat.com
 [10.36.117.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EAA95D6A0;
 Mon, 29 Jul 2019 15:31:04 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20190729105343.19250-1-kwolf@redhat.com>
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
Message-ID: <81bbb801-6e73-253c-7e21-24cc17daae01@redhat.com>
Date: Mon, 29 Jul 2019 17:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190729105343.19250-1-kwolf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lGMOLHcBrJzpybCqpv8WQTSA4Wy5csRWc"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 29 Jul 2019 15:31:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1] block/copy-on-read: Fix
 permissions for inactive node
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
--lGMOLHcBrJzpybCqpv8WQTSA4Wy5csRWc
Content-Type: multipart/mixed; boundary="G20Za4ZnHuui5jSjODV84iaWxJnISq827";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
Message-ID: <81bbb801-6e73-253c-7e21-24cc17daae01@redhat.com>
Subject: Re: [PATCH for-4.1] block/copy-on-read: Fix permissions for inactive
 node
References: <20190729105343.19250-1-kwolf@redhat.com>
In-Reply-To: <20190729105343.19250-1-kwolf@redhat.com>

--G20Za4ZnHuui5jSjODV84iaWxJnISq827
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 29.07.19 12:53, Kevin Wolf wrote:
> The copy-on-read drive must not request the WRITE_UNCHANGED permission
> for its child if the node is inactive, otherwise starting a migration
> destination with -incoming will fail because the child cannot provide
> write access yet:
>=20
>   qemu-system-x86_64: -blockdev copy-on-read,file=3Dimg,node-name=3Dcor=
: Block node is read-only
>=20
> Earlier QEMU versions additionally ran into an abort() on the migration=

> source side: bdrv_inactivate_recurse() failed to update permissions.
> This is silently ignored today because it was only supposed to loosen
> restrictions. This is the symptom that was originally reported here:
>=20
>   https://bugzilla.redhat.com/show_bug.cgi?id=3D1733022
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/copy-on-read.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--G20Za4ZnHuui5jSjODV84iaWxJnISq827--

--lGMOLHcBrJzpybCqpv8WQTSA4Wy5csRWc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0/ETYACgkQ9AfbAGHV
z0BfZQgAotulPoxKc6dLD+gmR7L5cdbuiCfYf5recwRe0SzSpiWJUU9UxF3kzPC4
hshxaELjtFabiLsMzPVciAohnpUWcizIK1kWnwrIOFd9OUdNWFg4oVGqvmjYBlpT
oXYcCk8YQw5gdhAnd8xUs2e8qTo+b+NX2UwkqDkXgjT07eQjDmTaM+ot+IcfIqzh
13kYJZEDsI6ZAYa+hOwXl9de0azD7s1lhYPfNAuoKUWJSWx/cC1YGq9J4IIsmXzD
h9IC+CSmbiVswF8ROsD2r9IBMkLQlf1KNCQSs0lQNABG9+izGq1fJ43IugV38UpQ
iLZ/+IF4Tc9WCSX+0I1ZPn4JfaoUBg==
=4q6i
-----END PGP SIGNATURE-----

--lGMOLHcBrJzpybCqpv8WQTSA4Wy5csRWc--

