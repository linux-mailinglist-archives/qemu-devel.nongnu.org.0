Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C533B656CD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 14:26:25 +0200 (CEST)
Received: from localhost ([::1]:41294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlY9Z-00048Q-1j
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 08:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hlY85-00038n-Cq
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 08:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hlY84-0005xZ-2E
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 08:24:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35677)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hlY80-0005tb-VQ; Thu, 11 Jul 2019 08:24:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E1595D60F;
 Thu, 11 Jul 2019 12:24:48 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D1985D9DC;
 Thu, 11 Jul 2019 12:24:46 +0000 (UTC)
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20190710170349.1548-1-mlevitsk@redhat.com>
 <84232589-627a-8151-a3d5-84c053d9a257@redhat.com>
 <3e82ff24-6f84-9de8-d3ab-c34966f875f0@redhat.com>
 <096a8bcf57997c594e1d5d7ea9606029909b81fc.camel@redhat.com>
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
Message-ID: <1bdb9136-ae97-7bf3-762e-0774b0980160@redhat.com>
Date: Thu, 11 Jul 2019 14:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <096a8bcf57997c594e1d5d7ea9606029909b81fc.camel@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Xu0aL0HgbFlKjppDeqXLsbc3cRkkv5N9P"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 11 Jul 2019 12:24:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] LUKS: support preallocation in qemu-img
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
--Xu0aL0HgbFlKjppDeqXLsbc3cRkkv5N9P
Content-Type: multipart/mixed; boundary="t087NMi0UEBHdh0sGt5nuWbWeEo80LVKt";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Message-ID: <1bdb9136-ae97-7bf3-762e-0774b0980160@redhat.com>
Subject: Re: [PATCH] LUKS: support preallocation in qemu-img
References: <20190710170349.1548-1-mlevitsk@redhat.com>
 <84232589-627a-8151-a3d5-84c053d9a257@redhat.com>
 <3e82ff24-6f84-9de8-d3ab-c34966f875f0@redhat.com>
 <096a8bcf57997c594e1d5d7ea9606029909b81fc.camel@redhat.com>
In-Reply-To: <096a8bcf57997c594e1d5d7ea9606029909b81fc.camel@redhat.com>

--t087NMi0UEBHdh0sGt5nuWbWeEo80LVKt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.07.19 10:39, Maxim Levitsky wrote:
> On Wed, 2019-07-10 at 23:52 +0200, Max Reitz wrote:
>> On 10.07.19 23:24, Max Reitz wrote:
>>> On 10.07.19 19:03, Maxim Levitsky wrote:
>>>> preallocation=3Doff and preallocation=3Dmetadata
>>>> both allocate luks header only, and preallocation=3Dfalloc/full
>>>> is passed to underlying file, with the given image size.
>>>>
>>>> Note that the actual preallocated size is a bit smaller due
>>>> to luks header.
>>>
>>> Couldn=E2=80=99t you just preallocate it after creating the crypto he=
ader so
>>> qcrypto_block_get_payload_offset(crypto->block) + size is the actual
>>> file size?
>=20
> I kind of thought of the same thing after I send the patch. I'll see no=
w it I can make it work.
>=20
>=20
>>>
>>>> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1534951
>>>>
>>>> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>>>> ---
>>>>  block/crypto.c | 28 ++++++++++++++++++++++++++--
>>>>  1 file changed, 26 insertions(+), 2 deletions(-)
>>>
>>> Hm.  I would expect a preallocated image to read 0.  But if you just
>>> pass this through to the protocol layer, it won=E2=80=99t read 0.
>>>
>>> (In fact, I don=E2=80=99t even quite see the point of having LUKS as =
an own
>>> format still.  It was useful when qcow2 didn=E2=80=99t have LUKS supp=
ort, but
>>> now it does, so...  I suppose everyone using the LUKS format should
>>> actually be using qcow2 with LUKS?)
>>
>> Kevin just pointed out to me that our LUKS format is compatible to the=

>> actual layout cryptsetup uses.  OK, that is an important use case.
>>
>> Hm.  Unfortunately, that doesn=E2=80=99t really necessitate preallocat=
ion.
>>
>> Well, whatever.  If it=E2=80=99s simple enough, that shouldn=E2=80=99t=
 stop us from
>> implementing preallocation anyway.
> Exactly. Since I already know the area of qemu-img relatively well, and=

> this bug is on my backlog, I thought why not to do it.
>=20
>=20
>>
>>
>> Now I found that qapi/block-core.json defines PreallocMode=E2=80=99s f=
alloc and
>> full values as follows:
>>
>>> # @falloc: like @full preallocation but allocate disk space by
>>> #          posix_fallocate() rather than writing zeros.
>>> # @full: preallocate all data by writing zeros to device to ensure di=
sk
>>> #        space is really available. @full preallocation also sets up
>>> #        metadata correctly.
>>
>> So it isn=E2=80=99t just me who expects these to pre-initialize the im=
age to 0.
>>  Hm, although...  I suppose @falloc technically does not specify wheth=
er
>> the data reads as zeroes.  I kind of find it to be implied, but, well.=
=2E.
>=20
> I personally don't really think that zeros are important, but rather th=
e level of allocation.
> posix_fallocate probably won't write the data blocks but rather only th=
e inode metadata / used block bitmap/etc.
>=20
> On the other hand writing zeros (or anything else) will force the block=
 layer to actually write to the underlying
> storage which could trigger lower layer allocation if the underlying st=
orage is thin-provisioned.
>=20
> In fact IMHO, instead of writing zeros, it would be better to write ran=
dom garbage instead (or have that as an even 'fuller'
> preallocation mode), since underlying storage might 'compress' the zero=
s.=20

Which is actually an argument why you should just write zeroes on the
LUKS layer, because this will then turn into quasi-random data on the
protocol layer.

Max

> In this version I do have a bug that I mentioned, about not preallocati=
on some data at the end of the image, and I will
> fix it, so that all image is zeros as expected
>=20
> Best regards,
> 	Maxim Levitsky
>=20
>=20
>>
>> Max
>>
>=20
>=20



--t087NMi0UEBHdh0sGt5nuWbWeEo80LVKt--

--Xu0aL0HgbFlKjppDeqXLsbc3cRkkv5N9P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0nKo0ACgkQ9AfbAGHV
z0CWBAf9HqDCH33VaeuM7fhbLLkCkGSz2/Lx0AIG71etBgVghTf6liKd7C8MwGUj
creNQg8gk2E2M3BoGavtt87IvhUun+J0L2gWT4Ctaup/8HJ+O4Ptausao5FPSdun
UoSBkT2Q3l5HmnmuzKCdI/sM7Iy6JPEO+VZeTA5/f+RlcWgy45VO782fQG0IbwPw
pEi4J7Kl9j1prtRgqiywE5aB2E4uQYuNyU5xVo60N7aKJ3Wncz7fyknjKnrex+wv
btTvpPOyMIe/6cziLMoXULtpQ5f17hRCq7xf9+tfa1GpTAg/3zKauowo08S9+sE9
kHL4PRudsPjfYq0eFZhbc4VRmHSwhg==
=1euu
-----END PGP SIGNATURE-----

--Xu0aL0HgbFlKjppDeqXLsbc3cRkkv5N9P--

