Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D073C8D66
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 17:51:52 +0200 (CEST)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFgus-00083o-HI
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 11:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFgtQ-0007Vi-8j
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:50:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFgtP-0003UA-6X
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:50:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44410)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFgtM-0003SF-LZ; Wed, 02 Oct 2019 11:50:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 994B218C4289;
 Wed,  2 Oct 2019 15:50:15 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CE476012C;
 Wed,  2 Oct 2019 15:50:13 +0000 (UTC)
Subject: Re: [PATCH] iotests: Do not run the iotests during "make check"
 anymore
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20191002142146.6124-1-thuth@redhat.com>
 <20191002150329.GA30342@redhat.com>
 <1b6616ed-bb06-332e-6451-b2acd748e891@redhat.com>
From: Max Reitz <mreitz@redhat.com>
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
Message-ID: <1bf47905-9237-eff6-9a3e-d1693a3d597a@redhat.com>
Date: Wed, 2 Oct 2019 17:50:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <1b6616ed-bb06-332e-6451-b2acd748e891@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="O6MSb4h9M8Ty9xCwzaUkzgluyf7cZ0sXf"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Wed, 02 Oct 2019 15:50:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O6MSb4h9M8Ty9xCwzaUkzgluyf7cZ0sXf
Content-Type: multipart/mixed; boundary="YsEQM1Ql5O75JnQ3sHccfXrbQ4upnmSsM"

--YsEQM1Ql5O75JnQ3sHccfXrbQ4upnmSsM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02.10.19 17:10, Thomas Huth wrote:
> On 02/10/2019 17.03, Daniel P. Berrang=C3=A9 wrote:
>> On Wed, Oct 02, 2019 at 04:21:46PM +0200, Thomas Huth wrote:
>>> Running the iotests during "make check" is causing more headaches tha=
n
>>> benefits for the block layer maintainers, so let's disable the iotest=
s
>>> during "make check" again.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  tests/Makefile.include   | 2 +-
>>>  tests/qemu-iotests/group | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> I don't have any objection to removing from 'make check', but I feel
>> like this commit should be modifying the travis.yml config so that
>> it explicitly runs the block tests, otherwise we're loosing automated
>> CI and the block tests will increase their rate of bitrot again.
>=20
> I was planning to send a separate patch for that (once my Travis builds=

> are through...), but if it is preferred, I can also send a v2 of this
> patch here where I include that change.
>=20
> Max, any preferences?

I don=E2=80=99t mind either way.  I don=E2=80=99t think we=E2=80=99re in =
danger of you
forgetting to send the Travis patch.

As for running the tests on macOS: Good question.  I=E2=80=99d just let t=
hem run
now and maybe see later whether that decision hurts.  macOS has its own
filesystem, so it may be worth testing there.

Max


--YsEQM1Ql5O75JnQ3sHccfXrbQ4upnmSsM--

--O6MSb4h9M8Ty9xCwzaUkzgluyf7cZ0sXf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2UxzQACgkQ9AfbAGHV
z0ARugf+O4xenaQBmczZJq8tC4CteSP0OTK8ogIJYwL88gNtPn4uRyQ6Nk5aCIdb
76NmkKwNxsu+LiuKKPSV2VD6giHGzV2Qr0fu/agxpHuNezT88ka7yo9OmCFvO45s
Ztn7yuKsiN64zwo6sJbtfr2fbORtrl/ZMHsqwmhkBYY9XKWSHAZq4/KMu1SL9rm+
TLgNgexmu8ZsP2wgO1U6+wumpf23a1ubzKKdqaY4lARpyV11eUuHL/BcuiVd/LJD
/a2bhL/Zb3hMqMBQMC8iQ8oPTMY1w9H59hwDyQFnNUCkApPiC9K3hCPFI4FMpbxk
DjM0USwNS4m8/TYPnHjb5krPCI8tHw==
=yMPv
-----END PGP SIGNATURE-----

--O6MSb4h9M8Ty9xCwzaUkzgluyf7cZ0sXf--

