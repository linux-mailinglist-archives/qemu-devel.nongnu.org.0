Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349B26AC2A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 17:45:58 +0200 (CEST)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnPeP-0005c3-EM
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 11:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38499)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hnPe9-00051D-EB
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:45:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hnPe8-0007EA-69
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 11:45:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42754)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hnPe5-0007Ct-HQ; Tue, 16 Jul 2019 11:45:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8A3F300C724;
 Tue, 16 Jul 2019 15:45:36 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE2E5D71B;
 Tue, 16 Jul 2019 15:45:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190716122836.31187-1-thuth@redhat.com>
 <20190716122836.31187-3-thuth@redhat.com>
 <1832e90b-0fd2-19ac-f90e-572147e51f53@redhat.com>
 <62ec1243-3bb9-c18d-0ff6-4c4ad193620c@redhat.com>
 <03b260f7-b108-f035-2974-17b5ef74e4e6@redhat.com>
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
Message-ID: <f34992f1-0e36-1cb9-77bd-84e7384466d6@redhat.com>
Date: Tue, 16 Jul 2019 17:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <03b260f7-b108-f035-2974-17b5ef74e4e6@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TuwslmhKW1Sg8P8Ht9oxpBMMeJobe90WK"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 16 Jul 2019 15:45:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/4] tests/qemu-iotests/group: Remove
 some more tests from the "auto" group
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TuwslmhKW1Sg8P8Ht9oxpBMMeJobe90WK
Content-Type: multipart/mixed; boundary="MaBSB5TjUCchPq3RMkcD6yxRPWQ5fdmYw";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Message-ID: <f34992f1-0e36-1cb9-77bd-84e7384466d6@redhat.com>
Subject: Re: [PATCH v2 2/4] tests/qemu-iotests/group: Remove some more tests
 from the "auto" group
References: <20190716122836.31187-1-thuth@redhat.com>
 <20190716122836.31187-3-thuth@redhat.com>
 <1832e90b-0fd2-19ac-f90e-572147e51f53@redhat.com>
 <62ec1243-3bb9-c18d-0ff6-4c4ad193620c@redhat.com>
 <03b260f7-b108-f035-2974-17b5ef74e4e6@redhat.com>
In-Reply-To: <03b260f7-b108-f035-2974-17b5ef74e4e6@redhat.com>

--MaBSB5TjUCchPq3RMkcD6yxRPWQ5fdmYw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 16.07.19 17:44, Max Reitz wrote:
> On 16.07.19 17:31, Thomas Huth wrote:
>> On 16/07/2019 17.26, Max Reitz wrote:
>>> On 16.07.19 14:28, Thomas Huth wrote:
>>>> Remove some more tests from the "auto" group that either have issues=

>>>> in certain environments (like macOS or FreeBSD, or on certain file s=
ystems
>>>> like ZFS or tmpfs), do not work with the qcow2 format, or that are s=
imply
>>>> taking too much time.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>  tests/qemu-iotests/group | 114 ++++++++++++++++++++----------------=
---
>>>>  1 file changed, 58 insertions(+), 56 deletions(-)
>>>
>>> I just looked through the list to see whether any of the test seems l=
ike
>>> we=E2=80=99d want to keep it even though it is a bit slow.  Mostly I =
was looking
>>> for tests that cover complex cases.
>>>
>>> 255 is the only one that seemed to fit that bill to me.  So why do yo=
u
>>> remove it?  Is it because it takes two seconds?
>>
>> No, I removed it because it was failing on macOS:
>>
>>  https://cirrus-ci.com/task/4860239294234624
>>
>> ("OSError: AF_UNIX path too long" is the error, if I got that right)
>=20
> Ah, OK.  So, uh, we effectively can=E2=80=99t run any Python tests on m=
acOS?

(Forgot the

Reviewed-by: Max Reitz <mreitz@redhat.com>

because I=E2=80=99m so... amazed by that possibility)


--MaBSB5TjUCchPq3RMkcD6yxRPWQ5fdmYw--

--TuwslmhKW1Sg8P8Ht9oxpBMMeJobe90WK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0t8RwACgkQ9AfbAGHV
z0AMhwgAgb5nr7LCF/TwKgtJwhkU8JMMvjaQ/RtRvedJZSdEsGQ3/EKZqpvFsVxA
JlK2I5HhjY2xJTwvMhIjfgJFSLq7wZnmwphlBPsY311ItMKh4OHpWB+B5i7lQcsM
6NxjDnLim6Po3qW4E/5tQC+B+mO5d6sFT3GgWEoeHBPGxQZSGh4RPMpv0jbvoQNj
wDYBaGyw7MT3JH43EH/vcMDGRrDp5lJLxqHtXcl8ClQpwWNIQGN8rfyPTyDJWsw6
+ASHiSEQD0UKaL4k7BDLsS3yOIsSD6PC1po8Jjoo2EXyS0gso08vKAVXzhKvtToz
N+Cq1JHuS4bgbncWL5pQmDrfrVF6KA==
=ldOM
-----END PGP SIGNATURE-----

--TuwslmhKW1Sg8P8Ht9oxpBMMeJobe90WK--

