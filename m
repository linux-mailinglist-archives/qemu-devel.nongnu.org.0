Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8396836
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 20:00:34 +0200 (CEST)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i08Qr-0000ul-Dy
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 14:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i08Pz-0000Ns-7v
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 13:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i08Py-0003fn-6t
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 13:59:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41738)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i08Pv-0003eD-E3; Tue, 20 Aug 2019 13:59:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AB794898102;
 Tue, 20 Aug 2019 17:59:34 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C23C917D50;
 Tue, 20 Aug 2019 17:59:25 +0000 (UTC)
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20190814202219.1870-1-mlevitsk@redhat.com>
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
Message-ID: <daa54ca3-6b57-0201-fc8a-6102ea1c509b@redhat.com>
Date: Tue, 20 Aug 2019 19:59:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814202219.1870-1-mlevitsk@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="toC5qqAs52hUzixQ275hgvnMEJb84ezU2"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 20 Aug 2019 17:59:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 00/13] RFC: luks/encrypted qcow2 key
 management
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--toC5qqAs52hUzixQ275hgvnMEJb84ezU2
Content-Type: multipart/mixed; boundary="lDU2n9puLlKf61gxgZPCqXLmw1Jww7kDC";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>
Message-ID: <daa54ca3-6b57-0201-fc8a-6102ea1c509b@redhat.com>
Subject: Re: [PATCH 00/13] RFC: luks/encrypted qcow2 key management
References: <20190814202219.1870-1-mlevitsk@redhat.com>
In-Reply-To: <20190814202219.1870-1-mlevitsk@redhat.com>

--lDU2n9puLlKf61gxgZPCqXLmw1Jww7kDC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 14.08.19 22:22, Maxim Levitsky wrote:

[...]

> Testing. This was lightly tested with manual testing and with few iotes=
ts that I prepared.
> I haven't yet tested fully the write sharing behavior, nor did I run th=
e whole iotests
> suite to see if this code causes some regressions. Since I will need pr=
obably
> to rewrite some chunks of it to change to 'amend' interface, I decided =
to post it now,
> to see if you have other ideas/comments to add.

I can see that, because half of the qcow2 tests that contain the string
=E2=80=9Csecret=E2=80=9D break:

Failures: 087 134 158 178 188 198 206
Failed 7 of 13 tests

Also, 210 when run with -luks.

Some are just due to different test outputs (because you change
_filter_img_create to filter some encrypt.* parameters), but some of
them are due to aborts.  All of them look like different kinds of heap
corruptions.


I can fully understand not running all iotests (because only the
maintainers do that before pull requests), but just running the iotests
that immediately concern a series seems prudent to me (unless the series
is trivial).

(Just =E2=80=9C(cd tests/qemu-iotests && grep -l secret ???)=E2=80=9D tel=
ls you which
tests to run that may concern themselves with qcow2 encryption, for
example.)


So I suppose I=E2=80=99ll stop reviewing the series in detail and just gi=
ve a
more cursory glance from now on.

Max


--lDU2n9puLlKf61gxgZPCqXLmw1Jww7kDC--

--toC5qqAs52hUzixQ275hgvnMEJb84ezU2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1cNPwACgkQ9AfbAGHV
z0AFxQf/f/DAIpFpaqHMvVF6S4mgPSCvk4TMDxDpKOv9cSqDaNT71R/5Q+zYn18m
BAkZcbnrD5RS4YE4X0TzX8g2s8bp+pM34wbMvWEbmaMFxNQPBVl9c+0ziboH+Nab
VtZYtAH2jdjbUoJST98ShD8eVkRAqulFSLqaUkZgZrZNYdsvJhusewGCZfYYK7FF
loUJkAofU3HZzTuKCSZI+DIRm1Mb5ZAs2St3T1FY5RbuAC1hK/QQgiIXEXC/I1Zn
ualE5zz9gBfoYt3NikukF3QRrnrWKqMyE6ThC+dIeyOBU1cTELDSMvTtv10Aikb8
3yNqrQ+rWDC+EyKMuJ0MBgkdP1RKpA==
=JdvK
-----END PGP SIGNATURE-----

--toC5qqAs52hUzixQ275hgvnMEJb84ezU2--

