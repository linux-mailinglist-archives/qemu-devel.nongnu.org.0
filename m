Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FFC64D71
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 22:20:57 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlJ5E-00006V-3N
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 16:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55843)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hlJ4B-0007aT-6h
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 16:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hlJ4A-0005s6-4T
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 16:19:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44790)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hlJ47-0005nR-PD; Wed, 10 Jul 2019 16:19:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1240636899;
 Wed, 10 Jul 2019 20:19:47 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C47860BFC;
 Wed, 10 Jul 2019 20:19:42 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190710010556.32365-1-jsnow@redhat.com>
 <20190710010556.32365-5-jsnow@redhat.com>
 <0f0c6f6e-501a-d747-13ff-edc45ccc231d@redhat.com>
 <4bc49e42-2dfa-8ca9-2cb6-678962f75f0a@redhat.com>
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
Message-ID: <837ad3c2-efe7-5937-d9ba-c1084f2c7a17@redhat.com>
Date: Wed, 10 Jul 2019 22:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4bc49e42-2dfa-8ca9-2cb6-678962f75f0a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fQNT5iv1OAQGGTb3oJ32D2qkFy1jt71Ws"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 10 Jul 2019 20:19:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 4/8] block/backup: hoist bitmap check into
 QMP interface
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fQNT5iv1OAQGGTb3oJ32D2qkFy1jt71Ws
Content-Type: multipart/mixed; boundary="zyRNDII5gOIgeLqWEbhJuFlIJHy9si8yj";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>
Message-ID: <837ad3c2-efe7-5937-d9ba-c1084f2c7a17@redhat.com>
Subject: Re: [PATCH 4/8] block/backup: hoist bitmap check into QMP interface
References: <20190710010556.32365-1-jsnow@redhat.com>
 <20190710010556.32365-5-jsnow@redhat.com>
 <0f0c6f6e-501a-d747-13ff-edc45ccc231d@redhat.com>
 <4bc49e42-2dfa-8ca9-2cb6-678962f75f0a@redhat.com>
In-Reply-To: <4bc49e42-2dfa-8ca9-2cb6-678962f75f0a@redhat.com>

--zyRNDII5gOIgeLqWEbhJuFlIJHy9si8yj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10.07.19 19:57, John Snow wrote:
>=20
>=20
> On 7/10/19 12:11 PM, Max Reitz wrote:
>> On 10.07.19 03:05, John Snow wrote:
>>> This is nicer to do in the unified QMP interface that we have now,
>>> because it lets us use the right terminology back at the user.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>  block/backup.c | 13 ++++---------
>>>  blockdev.c     | 10 ++++++++++
>>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/block/backup.c b/block/backup.c
>>> index e2729cf6fa..a64b768e24 100644
>>> --- a/block/backup.c
>>> +++ b/block/backup.c
>>> @@ -566,6 +566,10 @@ BlockJob *backup_job_create(const char *job_id, =
BlockDriverState *bs,
>>>      assert(bs);
>>>      assert(target);
>>> =20
>>> +    /* QMP interface protects us from these cases */
>>> +    assert(sync_mode !=3D MIRROR_SYNC_MODE_INCREMENTAL);
>>> +    assert(sync_bitmap || sync_mode !=3D MIRROR_SYNC_MODE_BITMAP);
>>
>> Implication would be a nice operator sometimes.
>>
>> ("assert(sync_mode =3D=3D MIRROR_SYNC_MODE_BITMAP -> sync_bitmap)")
>>
>> (Can you do that in C++?  No, you can=E2=80=99t overload bool=E2=80=99=
s operators, right?)
>>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>
>=20
> Yes, I also find this assertion kind of hard to read personally, but it=

> feels somewhat clunky to write:
>=20
> if (antecedent) {
>     assert(condition);
> }
>=20
> I suppose we can also phrase this as:
>=20
> assert(sync_mode =3D=3D MIRROR_SYNC_MODE_BITMAP ? sync_bitmap : true);
>=20
> Which might honestly be pretty good. Mind if I change it to this?

Looks weird (mostly unfamiliar), but I do not.

Max


--zyRNDII5gOIgeLqWEbhJuFlIJHy9si8yj--

--fQNT5iv1OAQGGTb3oJ32D2qkFy1jt71Ws
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0mSF0ACgkQ9AfbAGHV
z0BggQgAjBDDj+yiV0EGXvX0W7Bvmw/Z79ZWAhs/r+IdIpj8U6yT3Tyk+qRrsdSa
VnpTpb+CGccIxfzBp5NXADhUnAgt5CAcw8gjAU2Y5DDkij7jLBVE0Gh3wLbHAHhy
tdyegrJEghu1PwswEaJTOiui2rdwqCIa1b2QNikTDKb3R5vdMbNADHPr9SaOBTTC
6aNNwdflIY8IQE2uuYJiy6+CqzTz3c3LPVsYoygT+3fwy5sUMOwCDFGboMGcX/tx
BvmT4IvhgEoa8DtS1HAwh24EI0OY46uvR2FCTrAYdUqOT9SobJqAVp+X3rogY3D7
x7xbmcwg3GGD2WwZmVZLOZ2oco3P/A==
=DiEW
-----END PGP SIGNATURE-----

--fQNT5iv1OAQGGTb3oJ32D2qkFy1jt71Ws--

