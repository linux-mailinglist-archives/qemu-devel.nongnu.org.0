Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282D6A69B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 12:33:45 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnKmG-0002QZ-5A
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 06:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49355)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hnKm1-00021W-NZ
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 06:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hnKlz-0007NJ-Ab
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 06:33:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48504)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hnKlq-0007FA-IG; Tue, 16 Jul 2019 06:33:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 709043001757;
 Tue, 16 Jul 2019 10:33:17 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A73860C05;
 Tue, 16 Jul 2019 10:33:11 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190716000117.25219-1-jsnow@redhat.com>
 <20190716000117.25219-4-jsnow@redhat.com>
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
Message-ID: <750c55d7-0a9e-a6d5-4ed3-5350174e5e5f@redhat.com>
Date: Tue, 16 Jul 2019 12:33:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716000117.25219-4-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="R8nGpkfYg8GPCnS0S23JPuLWDVEekgOr2"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 16 Jul 2019 10:33:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 03/11] iotests/257: Refactor backup
 helpers
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R8nGpkfYg8GPCnS0S23JPuLWDVEekgOr2
Content-Type: multipart/mixed; boundary="7yWS5VriEsYFZ3qvKNQ8QP2s6JcsEyYji";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com, Markus Armbruster <armbru@redhat.com>
Message-ID: <750c55d7-0a9e-a6d5-4ed3-5350174e5e5f@redhat.com>
Subject: Re: [PATCH v2 03/11] iotests/257: Refactor backup helpers
References: <20190716000117.25219-1-jsnow@redhat.com>
 <20190716000117.25219-4-jsnow@redhat.com>
In-Reply-To: <20190716000117.25219-4-jsnow@redhat.com>

--7yWS5VriEsYFZ3qvKNQ8QP2s6JcsEyYji
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 16.07.19 02:01, John Snow wrote:
> This test needs support for non-bitmap backups and missing or
> unspecified bitmap sync modes, so rewrite the helpers to be a little
> more generic.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/257     |  56 ++++++-----
>  tests/qemu-iotests/257.out | 192 ++++++++++++++++++-------------------=

>  2 files changed, 128 insertions(+), 120 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--7yWS5VriEsYFZ3qvKNQ8QP2s6JcsEyYji--

--R8nGpkfYg8GPCnS0S23JPuLWDVEekgOr2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0tp+UACgkQ9AfbAGHV
z0B/GAf8CSb1Kg3r98qlWiLctaJ7+fHnuEweVyUPFjqq8OtNk1qzmz6IXIiuDMJB
kxJ6W16lljqt7nQIhUgKVoCuFDftKw7r0h3Gp+BpdxaGBxookbOWL5t2JqniD9Cp
IQf7oSZqaqfDg2xaZ+gzc0UCKztKvGFoeC1pHN/f6jLyt3vGxJN7vYk1mO0TAQnz
TbV/guN2VOKWeTRiMczeEeMZvYYhCJOQx54wBa18VoHdQCkREdeQiK8POUWIfpjL
6kMLOEQLwVemybdfBmpQ5Al8jJSymH2P+cGkCqp8+aDb/uZxriFwRzLODZ+ESWsk
6K8yzkuDq3LB8CHNrncjRo51ns2uJw==
=ppy6
-----END PGP SIGNATURE-----

--R8nGpkfYg8GPCnS0S23JPuLWDVEekgOr2--

