Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEF04DA6E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 21:42:19 +0200 (CEST)
Received: from localhost ([::1]:52486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he2ws-0000ON-Q0
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 15:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1he2Hj-0003pH-NH
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 14:59:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1he2EO-0007IH-55
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 14:56:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39926)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1he2EM-0007GT-Gl; Thu, 20 Jun 2019 14:56:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4DCDE307D971;
 Thu, 20 Jun 2019 18:56:12 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 950545C2E8;
 Thu, 20 Jun 2019 18:56:01 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20190620010356.19164-1-jsnow@redhat.com>
 <20190620010356.19164-9-jsnow@redhat.com>
 <be0cf312-a8e9-a39a-8d9d-47d76967d063@redhat.com>
 <58389e59-4fdd-ddf1-9e71-dd0131ec5fe1@redhat.com>
 <a81fad35-87ab-5af4-7beb-03f0750f4cef@redhat.com>
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
Message-ID: <9f239fc8-adc4-34e4-2d89-c556e7af38df@redhat.com>
Date: Thu, 20 Jun 2019 20:55:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a81fad35-87ab-5af4-7beb-03f0750f4cef@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JhQA2FXjZ6ihnQ0o6mX4igP1nM62R5GbA"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 20 Jun 2019 18:56:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 08/12] iotests: add testing shim for
 script-style python tests
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
 vsementsov@virtuozzo.com, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JhQA2FXjZ6ihnQ0o6mX4igP1nM62R5GbA
Content-Type: multipart/mixed; boundary="a03hkbMsU4qQ9WdJQKo2X0Iig1YFlxjzd";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 eblake@redhat.com, vsementsov@virtuozzo.com,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Xie Changlong <xiechanglong.d@gmail.com>
Message-ID: <9f239fc8-adc4-34e4-2d89-c556e7af38df@redhat.com>
Subject: Re: [PATCH 08/12] iotests: add testing shim for script-style python
 tests
References: <20190620010356.19164-1-jsnow@redhat.com>
 <20190620010356.19164-9-jsnow@redhat.com>
 <be0cf312-a8e9-a39a-8d9d-47d76967d063@redhat.com>
 <58389e59-4fdd-ddf1-9e71-dd0131ec5fe1@redhat.com>
 <a81fad35-87ab-5af4-7beb-03f0750f4cef@redhat.com>
In-Reply-To: <a81fad35-87ab-5af4-7beb-03f0750f4cef@redhat.com>

--a03hkbMsU4qQ9WdJQKo2X0Iig1YFlxjzd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 20.06.19 20:47, John Snow wrote:
>=20
>=20
> On 6/20/19 1:26 PM, Max Reitz wrote:
>> On 20.06.19 19:09, Max Reitz wrote:
>>> On 20.06.19 03:03, John Snow wrote:
>>>> Because the new-style python tests don't use the iotests.main() test=

>>>> launcher, we don't turn on the debugger logging for these scripts
>>>> when invoked via ./check -d.
>>>>
>>>> Refactor the launcher shim into new and old style shims so that they=

>>>> share environmental configuration.
>>>>
>>>> Two cleanup notes: debug was not actually used as a global, and ther=
e
>>>> was no reason to create a class in an inner scope just to achieve
>>>> default variables; we can simply create an instance of the runner wi=
th
>>>> the values we want instead.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>  tests/qemu-iotests/iotests.py | 40 +++++++++++++++++++++++---------=
---
>>>>  1 file changed, 26 insertions(+), 14 deletions(-)
>>>
>>> I don=E2=80=99t quite get how script_main() works (yes, both my Pytho=
nfu and my
>>> Googlefu are that bad), but it works and looks good, so have a
>>
>> Oh, it doesn=E2=80=99t work (well, not automagically).  I just assumed=
 seeing
>> the log output means it=E2=80=99s working.  Seeing that the test needs=
 to call
>> iotests.script_main() explicitly does clear up my confusion.
>>
>> All OK with me.
>>
>> Max
>>
>=20
> Yes. I should convert the others to opt-in to the new format so that
> copy-paste in the future will get us the right paradigm.
>=20
> Tests just need to be refactored to have a single point of entry so it
> can be passed as a closure to the test runner.
>=20
> If this seems like a good change I will do that as a follow-up series
> with only the churn.

It does seem good to me.  Not even because of the test runner, but maybe
even more so because it seems like better style to split the tests into
one function per case.

Max


--a03hkbMsU4qQ9WdJQKo2X0Iig1YFlxjzd--

--JhQA2FXjZ6ihnQ0o6mX4igP1nM62R5GbA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0L1r8ACgkQ9AfbAGHV
z0CrMgf+Pudm7McNerTL1ZlBf/FZ//2dxIgF5JWlMj/bpiB7KTXqyaFNFdD1w6+V
zcjPDAsDNuPqQrLkzXBcl6+tYAvEHH98DLk88PHlPl3hauk2GKI2EspVFb8ngefj
bbhvupHIJMcuBKq11q/oGupX4z4dMdHXm6wv/rBmWecfOenaXscvFsUA0mnG6oxS
axbO9xM3PycNan3n82vhsAbdLCEf1z4atNPvPj1DdLcXRCvckQRz2vsPxWS5tEMz
6NjxU7dmSTM9ja+1xhsA7326mlhLEPVqte6AiujXyXbA3qHSAC8BqGU1G2eroeJ8
pujYogWxqp844p2geGtFlKjT3pbluA==
=LiMm
-----END PGP SIGNATURE-----

--JhQA2FXjZ6ihnQ0o6mX4igP1nM62R5GbA--

