Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2FF16478
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 15:23:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO03z-0003wY-UV
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 09:23:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hO02c-0003Vi-88
	for qemu-devel@nongnu.org; Tue, 07 May 2019 09:21:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hO02b-0005f5-5e
	for qemu-devel@nongnu.org; Tue, 07 May 2019 09:21:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36355)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hO02Y-0005XL-Jc; Tue, 07 May 2019 09:21:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44FD18764B;
	Tue,  7 May 2019 13:21:36 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.217])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35250174B2;
	Tue,  7 May 2019 13:21:34 +0000 (UTC)
To: qemu-block@nongnu.org
References: <20190417153005.30096-1-mreitz@redhat.com>
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
Message-ID: <50f215b9-dc7f-7507-403a-c88d1a312fd9@redhat.com>
Date: Tue, 7 May 2019 15:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417153005.30096-1-mreitz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="n6RQOjP9ZiWsu4Uqus7kJJ8Xn0639TJtn"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 07 May 2019 13:21:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] iotests: Make 182 do without device_add
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--n6RQOjP9ZiWsu4Uqus7kJJ8Xn0639TJtn
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Alberto Garcia <berto@igalia.com>
Message-ID: <50f215b9-dc7f-7507-403a-c88d1a312fd9@redhat.com>
Subject: Re: [PATCH] iotests: Make 182 do without device_add
References: <20190417153005.30096-1-mreitz@redhat.com>
In-Reply-To: <20190417153005.30096-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.04.19 17:30, Max Reitz wrote:
> 182 fails if qemu has no support for hotplugging of a virtio-blk device=
=2E
> Using an NBD server instead works just as well for the test, even on
> qemus without hotplugging support.
>=20
> Fixes: 6d0a4a0fb5c8f10c8eb68b52cfda0082b00ae963
> Reported-by: Danilo C. L. de Paula <ddepaula@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> To reintroduce the bug for which this test was written, revert the
> following commits:
>=20
> $ git revert -n \
>     23dece19da41724349809873923e20a48b619cb7 \
>     6ceabe6f77e4ae5ac2fa3d2ac1be11dc95021941 \
>     a6aeca0ca530f104b5a5dd6704fca22b2c5edefa \
>     577a133988c76e4ebf01d050d0d758d207a1baf7
> ---
>  tests/qemu-iotests/182     | 22 +++++++++++++++++-----
>  tests/qemu-iotests/182.out |  1 +
>  2 files changed, 18 insertions(+), 5 deletions(-)

Thanks for the reviews, applied to my block branch.

Max


--n6RQOjP9ZiWsu4Uqus7kJJ8Xn0639TJtn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzRhl0ACgkQ9AfbAGHV
z0Cz8wf+Or/5TMdDErjBRpYSNIfI5va3jlEKPGE+IKIbVjdDzrcCcOuM2tNbP3SJ
gfzNk/6A/WeNNAAj4ImVPWl18BsyFfS+X+OxZZovo2ggzCu0u++2o75M1SPyo/+K
17osPYRgsvH/Mq52bn3VXLapWP1i4GBzTz6u0zJivWMtgMSNg3tZXAe/24DkmtNe
LIoJz6zhTeCSMWfatLH8SOm7/sTIJfq7JR1f/s+Yh90uMCwMBNQ+6pdVZPrIWfLf
zylzsV27vXPcvXrpn7lDE3SAehzvTfPKS8aKf/cMQNG5+gk4GsKOyhs4ZeeIXfF6
+PykPMlNbA1MLR4klkgohWKbm/DZyA==
=FUzt
-----END PGP SIGNATURE-----

--n6RQOjP9ZiWsu4Uqus7kJJ8Xn0639TJtn--

