Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B376B4983
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 10:30:09 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iA8sC-0007Bg-Jd
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 04:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iA8rI-0006bg-Ed
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 04:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iA8rH-0000Pf-9D
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 04:29:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iA8rD-0000NS-SX; Tue, 17 Sep 2019 04:29:08 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E02553082137;
 Tue, 17 Sep 2019 08:29:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-130.ams2.redhat.com
 [10.36.116.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 478A66012E;
 Tue, 17 Sep 2019 08:29:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20190819201851.24418-1-mreitz@redhat.com>
 <20190819201851.24418-7-mreitz@redhat.com>
 <44f97011-4a02-7832-c253-d43474f79d44@redhat.com>
 <a829185c-7c09-5afe-1479-15054ad59807@redhat.com>
 <33f60f4e-8156-e46f-8500-79b0982348b2@redhat.com>
 <c38acedf-d3db-384f-4aea-967ef3f87fdd@redhat.com>
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
Message-ID: <a41365b5-91fd-02e1-e960-c083d370e3ed@redhat.com>
Date: Tue, 17 Sep 2019 10:29:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c38acedf-d3db-384f-4aea-967ef3f87fdd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eHQAnApBTEuhiqnqW7GR3ylWsQrzpJrWB"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 17 Sep 2019 08:29:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 6/8] iotests: Test driver whitelisting
 in 093
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eHQAnApBTEuhiqnqW7GR3ylWsQrzpJrWB
Content-Type: multipart/mixed; boundary="LXANiKWBFXvr1r5YpFEfMJ5SA5GjKoCxV";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Message-ID: <a41365b5-91fd-02e1-e960-c083d370e3ed@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 6/8] iotests: Test driver whitelisting in
 093
References: <20190819201851.24418-1-mreitz@redhat.com>
 <20190819201851.24418-7-mreitz@redhat.com>
 <44f97011-4a02-7832-c253-d43474f79d44@redhat.com>
 <a829185c-7c09-5afe-1479-15054ad59807@redhat.com>
 <33f60f4e-8156-e46f-8500-79b0982348b2@redhat.com>
 <c38acedf-d3db-384f-4aea-967ef3f87fdd@redhat.com>
In-Reply-To: <c38acedf-d3db-384f-4aea-967ef3f87fdd@redhat.com>

--LXANiKWBFXvr1r5YpFEfMJ5SA5GjKoCxV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 17.09.19 10:18, Max Reitz wrote:
> On 13.09.19 20:30, John Snow wrote:
>>
>>
>> On 9/13/19 8:47 AM, Max Reitz wrote:
>>> On 20.08.19 23:32, John Snow wrote:
>>>>
>>>>
>>>> On 8/19/19 4:18 PM, Max Reitz wrote:
>>>>> null-aio may not be whitelisted.  Skip all test cases that require =
it.
>>>>>
>>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>>> ---
>>>>>  tests/qemu-iotests/093 | 12 +++++++++---
>>>>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
>>>>> index 50c1e7f2ec..f03fa24a07 100755
>>>>> --- a/tests/qemu-iotests/093
>>>>> +++ b/tests/qemu-iotests/093
>>>>> @@ -24,7 +24,7 @@ import iotests
>>>>>  nsec_per_sec =3D 1000000000
>>>>> =20
>>>>>  class ThrottleTestCase(iotests.QMPTestCase):
>>>>> -    test_img =3D "null-aio://"
>>>>> +    test_driver =3D "null-aio"
>>>>>      max_drives =3D 3
>>>>> =20
>>>>>      def blockstats(self, device):
>>>>> @@ -35,10 +35,14 @@ class ThrottleTestCase(iotests.QMPTestCase):
>>>>>                  return stat['rd_bytes'], stat['rd_operations'], st=
at['wr_bytes'], stat['wr_operations']
>>>>>          raise Exception("Device not found for blockstats: %s" % de=
vice)
>>>>> =20
>>>>> +    def required_drivers(self):
>>>>> +        return [self.test_driver]
>>>>> +
>>>>> +    @iotests.skip_if_unsupported(required_drivers)
>>>>
>>>> Oh, I see why you're passing args[0] back to the callback now. Why n=
ot
>>>> just pass self.required_drivers and call it with no arguments instea=
d?
>>>>
>>>> You can get a bound version that way that doesn't need additional
>>>> arguments, and then the callback is free to take generic callables o=
f
>>>> any kind.
>>>
>>> Am I doing something wrong?
>>>
>>> I just get
>>>
>>> +Traceback (most recent call last):
>>> +  File "093", line 26, in <module>
>>> +    class ThrottleTestCase(iotests.QMPTestCase):
>>> +  File "093", line 41, in ThrottleTestCase
>>> +    @iotests.skip_if_unsupported(self.required_drivers)
>>> +NameError: name 'self' is not defined
>>>
>>> this way.
>>>
>>> Max
>>>
>> What was I even talking about? :\ Well.
>>
>> I'd still like to define func_wrapper with a nod to the type constrain=
t
>> it has:
>>
>> def func_wrapper(instance: iotests.QMPTestCase, *args, **kwargs):
>>     [...]
>>
>>
>> Then, you'd write:
>>
>> if callable(required_formats):
>>     fmts =3D required_formats(instance)
>> else:
>>     fmts =3D required_formats
>=20
> Yep, that anyway.  (Although I didn=E2=80=99t know about the =E2=80=9Cp=
aram: type=E2=80=9D
> syntax and put that constraint in a comment instead.  Thanks again :-))=


Ah, but it isn=E2=80=99t a constraint, but just a =E2=80=9Ctype hint=E2=80=
=9D and the
interpreter doesn=E2=80=99t enforce it.  How quaint.

Well, better than a comment anyway.

Max


--LXANiKWBFXvr1r5YpFEfMJ5SA5GjKoCxV--

--eHQAnApBTEuhiqnqW7GR3ylWsQrzpJrWB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2AmU0ACgkQ9AfbAGHV
z0CJGAf/el2XKR4+LqpCWiy6ViNK2qO+ksC5cEY3aWad8DP/eJ08SNN/81erfhwC
oi+0eSOA147/4OujHTbEXgi0jYATVfGM1yMe+4G4h6Iwy6NENVb3WQxLfxF8q6F8
4gu+07ooVsdAIJVvHi4B17P3Av8cQTSMYIgqcTrOuX7XM9BH+R7Tn1OJwB64xBd8
A4PZAoXzqCo3/Swc+rgoYJPWtkUOk0EXiH0s5CplJv1jSNMgclvbUiM9V8YUV4jG
mBkiOlqTOusYF1K/L5X4F7lBHF+Hzp+Y/J6CIAUrDtBtiMkhQYNIuQWQ/2nUcrsp
qTlZDrAhVNxCVKeBNGfPIlIPW4DBug==
=kXNA
-----END PGP SIGNATURE-----

--eHQAnApBTEuhiqnqW7GR3ylWsQrzpJrWB--

