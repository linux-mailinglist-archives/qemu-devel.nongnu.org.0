Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BFCADB01
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 16:18:21 +0200 (CEST)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7KUm-0002pp-2c
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 10:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i7KSD-0001ml-7r
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 10:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i7KSC-0000em-2u
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 10:15:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57170)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i7KS9-0000cw-RA; Mon, 09 Sep 2019 10:15:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8BC83C04FFE0;
 Mon,  9 Sep 2019 14:15:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 971A76061E;
 Mon,  9 Sep 2019 14:15:01 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190830161228.54238-1-vsementsov@virtuozzo.com>
 <20190830161228.54238-9-vsementsov@virtuozzo.com>
 <75066c81-04f5-b849-51a8-c663fea5b60b@redhat.com>
 <19a3e738-795f-50a8-27a1-548c9ec5fbdc@virtuozzo.com>
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
Message-ID: <aca2aa89-0b0f-aa2c-86f9-336e0c0427b4@redhat.com>
Date: Mon, 9 Sep 2019 16:14:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <19a3e738-795f-50a8-27a1-548c9ec5fbdc@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ii6887RjMhBcDDZXvNOI3B0lpKb1OMUs9"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 09 Sep 2019 14:15:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v10 08/14] iotests: prepare 124 and 257
 bitmap querying for backup-top filter
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
Cc: "fam@euphon.net" <fam@euphon.net>, "kwolf@redhat.com" <kwolf@redhat.com>,
 Denis Lunev <den@virtuozzo.com>,
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ii6887RjMhBcDDZXvNOI3B0lpKb1OMUs9
Content-Type: multipart/mixed; boundary="4JkQTQzf8oCD6X0MmMDxqMDVMJmXnznIb";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "fam@euphon.net" <fam@euphon.net>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, Denis Lunev <den@virtuozzo.com>
Message-ID: <aca2aa89-0b0f-aa2c-86f9-336e0c0427b4@redhat.com>
Subject: Re: [PATCH v10 08/14] iotests: prepare 124 and 257 bitmap querying
 for backup-top filter
References: <20190830161228.54238-1-vsementsov@virtuozzo.com>
 <20190830161228.54238-9-vsementsov@virtuozzo.com>
 <75066c81-04f5-b849-51a8-c663fea5b60b@redhat.com>
 <19a3e738-795f-50a8-27a1-548c9ec5fbdc@virtuozzo.com>
In-Reply-To: <19a3e738-795f-50a8-27a1-548c9ec5fbdc@virtuozzo.com>

--4JkQTQzf8oCD6X0MmMDxqMDVMJmXnznIb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09.09.19 15:49, Vladimir Sementsov-Ogievskiy wrote:
> 09.09.2019 16:25, Max Reitz wrote:
>> On 30.08.19 18:12, Vladimir Sementsov-Ogievskiy wrote:
>>> After backup-top filter appearing it's not possible to see dirty
>>> bitmaps in top node, so use node-name instead.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com=
>
>>> ---
>>>   tests/qemu-iotests/124        |  83 ++++----
>>>   tests/qemu-iotests/257        |  49 ++---
>>>   tests/qemu-iotests/257.out    | 364 +++++++++++++------------------=
---
>>>   tests/qemu-iotests/iotests.py |  27 +++
>>>   4 files changed, 219 insertions(+), 304 deletions(-)
>>
>> [...]
>>
>>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotes=
ts.py
>>> index 84438e837c..1906eb72f3 100644
>>> --- a/tests/qemu-iotests/iotests.py
>>> +++ b/tests/qemu-iotests/iotests.py
>>> @@ -643,6 +643,33 @@ class VM(qtest.QEMUQtestMachine):
>>
>> [...]
>>
>>> +    def check_bitmap_status(self, node_name, bitmap_name, fields):
>>> +        ret =3D self.get_bitmap(node_name, bitmap_name)
>>> +
>>> +        return fields.items() <=3D ret.items()
>>
>> Why the <=3D?  AFAIU, it will compare each of the arrays=E2=80=99 elem=
ents one by
>> one and return true if all of the ones in @fields are less than or equ=
al
>> to the ones in @ret.
>=20
> No, it's a valid way to check that one dict is subdict of another,
> as dict_view works like Set class:

OK.  It looked to me like .items() just returned an array.  (When I
googled for how <=3D behaves here.)

[...]

> Should I care about python2 now, or we already dropped its support in i=
otests?

We haven=E2=80=99t officially.  OTOH, 4.2 is set to release on December 3=
, which
is less than one month before Python 2=E2=80=99s EOL.  So it would be clo=
se to
wrong to care at this point, I guess?

Reviewed-by: Max Reitz <mreitz@redhat.com>


--4JkQTQzf8oCD6X0MmMDxqMDVMJmXnznIb--

--ii6887RjMhBcDDZXvNOI3B0lpKb1OMUs9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl12XmMACgkQ9AfbAGHV
z0Awlwf8CavsWW6CYWZ/fKS3NyGfeEB+DLLM49MzNV4VA3lfsRrwkoyKE7/pV40m
iNhsUQNR698b4gM5ajKNm/ADlsLJeFB38cAQra0M9JmNtDVzroiV4cuD7mY+zYrf
Oew09Uzv/2PBpXNicxqyvZuxg+AOvjDss1OAQOq9eghYm/bsDdTIMii+YO2nLlSY
WSSTYRm0zdVMpFxEC0tGgqPRhVkYpyiI+vkwTV2AvovwLH8pDFhW9Q7B8OcvVhw6
j5SSX9nHMHNjgojSDmG3oFJALl4486Lf0uFR7wxmWMizJ9zYPuGMaN2k7dg5P6Jm
896wY/x4qvWLADZXvpoNhL1iW/H2Pw==
=Z/WA
-----END PGP SIGNATURE-----

--ii6887RjMhBcDDZXvNOI3B0lpKb1OMUs9--

