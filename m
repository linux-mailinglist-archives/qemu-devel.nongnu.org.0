Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D885203EC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 12:56:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRE3s-0008W3-Dk
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 06:56:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hRDzz-0005uW-3K
	for qemu-devel@nongnu.org; Thu, 16 May 2019 06:52:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hRDoj-00056l-LA
	for qemu-devel@nongnu.org; Thu, 16 May 2019 06:40:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62631)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hRDoi-00054J-64; Thu, 16 May 2019 06:40:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 183CE308623C;
	Thu, 16 May 2019 10:40:51 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-34.brq.redhat.com
	[10.40.204.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 642EE608AB;
	Thu, 16 May 2019 10:40:49 +0000 (UTC)
To: Denis Plotnikov <dplotnikov@virtuozzo.com>,
	"kwolf@redhat.com" <kwolf@redhat.com>
References: <20190205090825.14059-1-dplotnikov@virtuozzo.com>
	<cd22d738-d09c-4e2f-5ec6-8d3d34e2b341@redhat.com>
	<f441d52b-4124-7951-c715-a35127ca3a54@virtuozzo.com>
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
Message-ID: <be26ed1d-ced3-4a26-24f5-ef26278d72a5@redhat.com>
Date: Thu, 16 May 2019 12:40:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f441d52b-4124-7951-c715-a35127ca3a54@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FcTq6f65IjcONIBxzej2ah2AhxPBz7MKf"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 16 May 2019 10:40:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] [RFC] qcow2: add compression type feature
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	Denis Lunev <den@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FcTq6f65IjcONIBxzej2ah2AhxPBz7MKf
From: Max Reitz <mreitz@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>
Cc: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Denis Lunev <den@virtuozzo.com>, "eblake@redhat.com" <eblake@redhat.com>
Message-ID: <be26ed1d-ced3-4a26-24f5-ef26278d72a5@redhat.com>
Subject: Re: [PATCH] [RFC] qcow2: add compression type feature
References: <20190205090825.14059-1-dplotnikov@virtuozzo.com>
 <cd22d738-d09c-4e2f-5ec6-8d3d34e2b341@redhat.com>
 <f441d52b-4124-7951-c715-a35127ca3a54@virtuozzo.com>
In-Reply-To: <f441d52b-4124-7951-c715-a35127ca3a54@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16.05.19 09:50, Denis Plotnikov wrote:
>=20
>=20
> On 29.04.2019 1:32, Max Reitz wrote:
>> On 05.02.19 10:08, Denis Plotnikov wrote:
>>> The patch adds some preparation parts for incompatible compression ty=
pe
>>> feature into QCOW2 header that indicates that *all* compressed cluste=
rs
>>> must be (de)compressed using a certain compression type.
>>>
>>> It is implied that the compression type is set on the image creation =
and
>>> can be changed only later by image convertion, thus the only compress=
ion
>>> algorithm is used for the image.
>>>
>>> The plan is to add support for ZSTD and then may be something more ef=
fective
>>> in the future.
>>>
>>> ZSDT compression algorithm consumes 3-5 times less CPU power with a
>>> comparable comression ratio with zlib. It would be wise to use it for=

>>> data compression f.e. for backups.
>>>
>>> The default compression is ZLIB.
>>>
>>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>> ---
>>>   block/qcow2.c | 25 +++++++++++++++++++++++++
>>>   block/qcow2.h | 26 ++++++++++++++++++++++----
>>>   2 files changed, 47 insertions(+), 4 deletions(-)
>>
>> Are there plans to pursue this further?
> Yes, I'm going to come up with the first version in a few weeks

OK.

>> [...]
>>
>>> diff --git a/block/qcow2.h b/block/qcow2.h
>>> index 32cce9eee2..fdde5bbefd 100644
>>> --- a/block/qcow2.h
>>> +++ b/block/qcow2.h
>>> @@ -112,6 +112,10 @@
>>>   #define QCOW2_OPT_REFCOUNT_CACHE_SIZE "refcount-cache-size"
>>>   #define QCOW2_OPT_CACHE_CLEAN_INTERVAL "cache-clean-interval"
>>>  =20
>>> +/* Compression types */
>>> +#define QCOW2_COMPRESSION_TYPE_ZLIB    0
>>> +#define QCOW2_COMPRESSION_TYPE_ZSTD    1
>>
>> We probably want QAPI types anyway (qemu-img info should report the
>> compression type), so I think we could use them instead.
> I'm not sure that I understood the idea. Could you please explain what =

> is meant here? We don't need those constants and should use the=20
> constants defined somewhere else (where)?

qemu-img info can report format-specific information.  I think the
compression type should be listed there as well, once there is more than
one.

Format-specific information is a QAPI type, namely
ImageInfoSpecificQCow2.  Therefore, everything it contains needs to be a
QAPI object, and this includes potential compression information.  We
thus need a QAPI enum like Qcow2CompressionType, and that would
automatically give us these values.

Max


--FcTq6f65IjcONIBxzej2ah2AhxPBz7MKf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzdPi8ACgkQ9AfbAGHV
z0A2JAf/XvWpYzRao+e7i590Gh+yd4wobif+QnnKyxGvLZHkqIRIeKbLaGaGyoT4
nuKrSUkXZlCLY72Vicd4QNGsz0VnjmvFaZrHdUhft7PDhIhvU5l8gag5KAp3big9
j0ujvq8oO2j2UtSiL3SFkahqj1apLFoHtMvDM1dIsgWZjTAyWEd9fkvRRJdSlkbD
QmHUq364I/8CRfvMaGA+gyeb0y1P2OhnQXkCB+9LNQk9lUaphfIlGZuYU4ySOxe0
AydTPGrCcUafwX1oXZP1tTTAH4LMLwnfoZs0EWkhtWkvzw2i7emnPZ4LoZMpwBYN
mLkA6ZinjJZvs+QM3YD3Wtu1S8liCQ==
=vEJ2
-----END PGP SIGNATURE-----

--FcTq6f65IjcONIBxzej2ah2AhxPBz7MKf--

