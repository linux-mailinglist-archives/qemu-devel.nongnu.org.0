Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CC7BB504
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 15:14:17 +0200 (CEST)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCOAS-0003Kl-7B
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 09:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iCO6I-0000fa-NT
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:09:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iCO6H-0005ts-IH
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:09:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37504)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iCO6F-0005sn-4Y; Mon, 23 Sep 2019 09:09:55 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6100710CC1FB;
 Mon, 23 Sep 2019 13:09:54 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C11C19C58;
 Mon, 23 Sep 2019 13:09:50 +0000 (UTC)
Subject: Re: [PATCH v5 1/5] iotests: remove 'linux' from default supported
 platforms
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20190917234549.22910-1-jsnow@redhat.com>
 <20190917234549.22910-2-jsnow@redhat.com>
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
Message-ID: <a252472e-842a-8401-2743-e4ed948b066b@redhat.com>
Date: Mon, 23 Sep 2019 15:09:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917234549.22910-2-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="APmUgLsi7mXelWLWL6JvlLQrSwxXx40Jn"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Mon, 23 Sep 2019 13:09:54 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--APmUgLsi7mXelWLWL6JvlLQrSwxXx40Jn
Content-Type: multipart/mixed; boundary="8w791jTtwUR381mGtTNTCkRAj92ukMkHz";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Message-ID: <a252472e-842a-8401-2743-e4ed948b066b@redhat.com>
Subject: Re: [PATCH v5 1/5] iotests: remove 'linux' from default supported
 platforms
References: <20190917234549.22910-1-jsnow@redhat.com>
 <20190917234549.22910-2-jsnow@redhat.com>
In-Reply-To: <20190917234549.22910-2-jsnow@redhat.com>

--8w791jTtwUR381mGtTNTCkRAj92ukMkHz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18.09.19 01:45, John Snow wrote:
> verify_platform will check an explicit whitelist and blacklist instead.=

> The default will now be assumed to be allowed to run anywhere.
>=20
> For tests that do not specify their platforms explicitly, this has the =
effect of
> enabling these tests on non-linux platforms. For tests that always spec=
ified
> linux explicitly, there is no change.
>=20
> For Python tests on FreeBSD at least; only seven python tests fail:
> 045 147 149 169 194 199 211
>=20
> 045 and 149 appear to be misconfigurations,
> 147 and 194 are the AF_UNIX path too long error,
> 169 and 199 are bitmap migration bugs, and
> 211 is a bug that shows up on Linux platforms, too.
>=20
> This is at least good evidence that these tests are not Linux-only. If
> they aren't suitable for other platforms, they should be disabled on a
> per-platform basis as appropriate.
>=20
> Therefore, let's switch these on and deal with the failures.

What exactly do you mean by =E2=80=9Cdeal with the failures=E2=80=9D?  Do=
 you have a
reference to patches that deal with them, or are you or is someone else
working on them...?

Apart from that, I am rather hesitant to take a patch through my tree
that not only may cause test failures on platforms that I will not or
actually cannot run tests on (like MacOS or Windows), but that actually
does introduce new failures as you describe.

Well, at least it doesn=E2=80=99t introduce build failures because it app=
ears
there is no Python test that=E2=80=99s in the auto group, so I suppose =E2=
=80=9Crather
hesitant=E2=80=9D is not an =E2=80=9CI won=E2=80=99t=E2=80=9D.

Max

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)


--8w791jTtwUR381mGtTNTCkRAj92ukMkHz--

--APmUgLsi7mXelWLWL6JvlLQrSwxXx40Jn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2IxBwACgkQ9AfbAGHV
z0BZewf/SkTFIiPWUVRLL5Tduo9N/kEpJNjvjzUZQhfNmyCRnijuzS7aLAy1kH6b
xxeBi5GwSAbefst6HuHIH1XqK0V172HDWM6Bktxg9LgKkx1tDWpeb36/c/8t++kh
kFiTXQzikYcaMYNp3hjGkOllUMjd2FEPAW4J2C6remscrwhK01FpFaaIlxvgITua
5hpPDRacPA6hGIN1Qx0Z9F9bTfsUxKL1tdiHolI39YG25vZ1m694SczOkLCGhoXA
v5mlInDl4Y8do99POUeQ5oMIlzIcSR8ADHRARz0cfxdzyy0UkNX2mQ7eJjIekkQp
nN8NmBmh/ceLEse3TaK7GgM2p1xZPg==
=+SD9
-----END PGP SIGNATURE-----

--APmUgLsi7mXelWLWL6JvlLQrSwxXx40Jn--

