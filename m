Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D3BB58A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 15:37:10 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCOWa-00024A-R9
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 09:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iCOTc-0000ax-Bi
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:34:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iCOTb-0004zr-CL
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:34:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iCOTZ-0004y6-6d; Mon, 23 Sep 2019 09:34:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 86A09811DC;
 Mon, 23 Sep 2019 13:34:00 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A5119C58;
 Mon, 23 Sep 2019 13:33:47 +0000 (UTC)
Subject: Re: [PATCH v5 3/5] iotest 258: use script_main
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20190917234549.22910-1-jsnow@redhat.com>
 <20190917234549.22910-4-jsnow@redhat.com>
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
Message-ID: <1bb640a1-749a-87cf-8b13-677d5de26cd4@redhat.com>
Date: Mon, 23 Sep 2019 15:33:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917234549.22910-4-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uWWBBkfpqeHiLoWdK3YPCAadgQLFmU7UA"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 23 Sep 2019 13:34:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uWWBBkfpqeHiLoWdK3YPCAadgQLFmU7UA
Content-Type: multipart/mixed; boundary="DFMQtex3IBqEFJarUTNB3Se4eqI0zdtRW";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1bb640a1-749a-87cf-8b13-677d5de26cd4@redhat.com>
Subject: Re: [PATCH v5 3/5] iotest 258: use script_main
References: <20190917234549.22910-1-jsnow@redhat.com>
 <20190917234549.22910-4-jsnow@redhat.com>
In-Reply-To: <20190917234549.22910-4-jsnow@redhat.com>

--DFMQtex3IBqEFJarUTNB3Se4eqI0zdtRW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18.09.19 01:45, John Snow wrote:
> Since this one is nicely factored to use a single entry point,
> use script_main to run the tests.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/258 | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--DFMQtex3IBqEFJarUTNB3Se4eqI0zdtRW--

--uWWBBkfpqeHiLoWdK3YPCAadgQLFmU7UA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2IyboACgkQ9AfbAGHV
z0CeBwgAueb0i4lm9C+jv6wMWzDRzgJyoWVtjanX1j0DhAaU1pESkz3aiC2PAl1I
wge+fD9IWiQ5hGqKoSKusrkGbSEeMRvFVu2FEBwLCvF9/jRYmTKHsJ/HcLXEDOth
CISvopBpyUkQFnCYaPq2C1ZdEUpJH3OiG8S2ZkNrJLH417u+/XjRABT2KiM6Glli
ApvhKnCdtHygXHl5R/2a/i89LZTIpaNTdEK0tolM/tGlOQxTDX4xtoGdeJAC8aRV
eUb5o43r6Mlnu70R1DhBPE3VXufQhYG6e4oQEczZblPoK9jR7yzla1ez0g3YXaWB
b6C/jA29MzqK1QgbCy6L3LAkQZvj8A==
=NnNV
-----END PGP SIGNATURE-----

--uWWBBkfpqeHiLoWdK3YPCAadgQLFmU7UA--

