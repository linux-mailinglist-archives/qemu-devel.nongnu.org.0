Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E608A0511
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 16:34:07 +0200 (CEST)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2z1S-0007Q0-BW
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 10:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2yzs-0006me-Ie
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2yzr-0004yz-5K
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:32:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51536)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2yzo-0004xZ-7q; Wed, 28 Aug 2019 10:32:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E6E3CC0467C3;
 Wed, 28 Aug 2019 14:32:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-32.brq.redhat.com
 [10.40.204.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5246760BF7;
 Wed, 28 Aug 2019 14:32:13 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190826161312.489398-1-vsementsov@virtuozzo.com>
 <20190826161312.489398-3-vsementsov@virtuozzo.com>
 <6c22ee44-4875-92e5-273b-53276cdec860@redhat.com>
 <5989858c-4c50-d3e5-fc17-5d1e772613f2@virtuozzo.com>
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
Message-ID: <6a8d5a3d-dd57-1c7e-37b5-5333ecd07a72@redhat.com>
Date: Wed, 28 Aug 2019 16:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5989858c-4c50-d3e5-fc17-5d1e772613f2@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Qiyjdb1uTfd9mxXwDyWiSnE2ftgRwyuae"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 28 Aug 2019 14:32:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v9 02/13] block/backup: split shareable
 copying part from backup_do_cow
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
--Qiyjdb1uTfd9mxXwDyWiSnE2ftgRwyuae
Content-Type: multipart/mixed; boundary="4JVoW85Kn734uPjWgF2giFNOVLWC1jQuB";
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
Message-ID: <6a8d5a3d-dd57-1c7e-37b5-5333ecd07a72@redhat.com>
Subject: Re: [PATCH v9 02/13] block/backup: split shareable copying part from
 backup_do_cow
References: <20190826161312.489398-1-vsementsov@virtuozzo.com>
 <20190826161312.489398-3-vsementsov@virtuozzo.com>
 <6c22ee44-4875-92e5-273b-53276cdec860@redhat.com>
 <5989858c-4c50-d3e5-fc17-5d1e772613f2@virtuozzo.com>
In-Reply-To: <5989858c-4c50-d3e5-fc17-5d1e772613f2@virtuozzo.com>

--4JVoW85Kn734uPjWgF2giFNOVLWC1jQuB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 28.08.19 16:27, Vladimir Sementsov-Ogievskiy wrote:
> 28.08.2019 17:22, Max Reitz wrote:
>> On 26.08.19 18:13, Vladimir Sementsov-Ogievskiy wrote:
>>> Split copying logic which will be shared with backup-top filter.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com=
>
>>> ---
>>>   block/backup.c | 47 ++++++++++++++++++++++++++++++++---------------=

>>>   1 file changed, 32 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/block/backup.c b/block/backup.c
>>> index 33b144305f..13a1d80157 100644
>>> --- a/block/backup.c
>>> +++ b/block/backup.c
>>> @@ -248,26 +248,18 @@ static int64_t backup_bitmap_reset_unallocated(=
BackupBlockJob *s,
>>>       return ret;
>>>   }
>>>  =20
>>> -static int coroutine_fn backup_do_cow(BackupBlockJob *job,
>>> -                                      int64_t offset, uint64_t bytes=
,
>>> -                                      bool *error_is_read,
>>> -                                      bool is_write_notifier)
>>> +static int coroutine_fn backup_do_copy(BackupBlockJob *job,
>>> +                                       int64_t offset, uint64_t byte=
s,
>>> +                                       bool *error_is_read,
>>> +                                       bool is_write_notifier)
>>>   {
>>> -    CowRequest cow_request;
>>>       int ret =3D 0;
>>> -    int64_t start, end; /* bytes */
>>> +    int64_t start =3D offset, end =3D bytes + offset; /* bytes */
>>
>> Maybe just rename the =E2=80=9Coffset=E2=80=9D parameter to =E2=80=9Cs=
tart=E2=80=9D, replace the =E2=80=9Cbytes=E2=80=9D
>> parameter by an =E2=80=9Cend=E2=80=9D parameter, and drop this line?
>>
>=20
> I really want final block_copy have more common in block-layer offset+b=
ytes
> interface. So better to refactor a bit the function itself, but I'd pre=
fer
> to do it as a follow-up and keep this patch simpler..

OK, but s/offset/start/ should still be possible.

Max


--4JVoW85Kn734uPjWgF2giFNOVLWC1jQuB--

--Qiyjdb1uTfd9mxXwDyWiSnE2ftgRwyuae
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1mkGsACgkQ9AfbAGHV
z0DxSQf9F1k+mLPuaEoWiFWxwCLg3F2+Xk4s9AMkET8u2zY2nqtH9Li0qA38znhd
RGh+I0Lw6mUNYTJnyNFgA+zPBKnVSUDDGRTdvnO+8wZfFe3blliFXOMXV9/hm0l0
xte3gh5vN5xk5l0ulA6CQa7megSwI3PUS+pJn6CPyNa3Phq0E6o1SFy7uyou9V/l
54haaew4AzRogsy7ECwRt/Vp7SLrBIzrpKSx+Fb4H8S8agK/J1LMuDfbxWQpACFs
2pykwZwolHEHOkWce+Dwk68QS8wERcSJJSamraCuecjTO1uKEVO9cjWvrq/k1LQH
DY1iZuNJ/0dGfg/xFbZrp84L1zTpmg==
=frRz
-----END PGP SIGNATURE-----

--Qiyjdb1uTfd9mxXwDyWiSnE2ftgRwyuae--

