Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF63886243
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 14:51:18 +0200 (CEST)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvht0-0001kf-35
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 08:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59653)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hvhsL-0001GU-SR
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 08:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hvhsK-0002Jw-SH
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 08:50:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54355)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hvhsH-0002GA-UO; Thu, 08 Aug 2019 08:50:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 03BE7C028329;
 Thu,  8 Aug 2019 12:50:33 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF935C219;
 Thu,  8 Aug 2019 12:50:30 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, Denis Plotnikov
 <dplotnikov@virtuozzo.com>, kwolf@redhat.com, armbru@redhat.com
References: <20190704130949.14017-1-dplotnikov@virtuozzo.com>
 <20190704130949.14017-2-dplotnikov@virtuozzo.com>
 <325bf443-64fb-ecde-f08a-978e9bede31b@redhat.com>
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
Message-ID: <82193040-c2ac-93fc-4230-8bbe136aef3c@redhat.com>
Date: Thu, 8 Aug 2019 14:50:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <325bf443-64fb-ecde-f08a-978e9bede31b@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GbHsLBUspUAoSw3SvuctFXPlZdJRB2s3P"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 12:50:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/3] qcow2: introduce compression type
 feature
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
Cc: vsementsov@virtuozzo.com, den@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GbHsLBUspUAoSw3SvuctFXPlZdJRB2s3P
Content-Type: multipart/mixed; boundary="Nu2GKNNz2cazKTGwBjVXt9eTAT46q1OqA";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Eric Blake <eblake@redhat.com>, Denis Plotnikov
 <dplotnikov@virtuozzo.com>, kwolf@redhat.com, armbru@redhat.com
Cc: den@virtuozzo.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Message-ID: <82193040-c2ac-93fc-4230-8bbe136aef3c@redhat.com>
Subject: Re: [PATCH v2 1/3] qcow2: introduce compression type feature
References: <20190704130949.14017-1-dplotnikov@virtuozzo.com>
 <20190704130949.14017-2-dplotnikov@virtuozzo.com>
 <325bf443-64fb-ecde-f08a-978e9bede31b@redhat.com>
In-Reply-To: <325bf443-64fb-ecde-f08a-978e9bede31b@redhat.com>

--Nu2GKNNz2cazKTGwBjVXt9eTAT46q1OqA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08.08.19 02:18, Eric Blake wrote:
> On 7/4/19 8:09 AM, Denis Plotnikov wrote:
>> The patch adds some preparation parts for incompatible compression typ=
e
>> feature to QCOW2 header that indicates that *all* compressed clusters
>> must be (de)compressed using a certain compression type.
>>
>> It is implied that the compression type is set on the image creation a=
nd
>> can be changed only later by image conversion, thus compression type
>> defines the only compression algorithm used for the image.
>>
>> The goal of the feature is to add support of other compression algorit=
hms
>> to qcow2. For example, ZSTD which is more effective on compression tha=
n ZLIB.
>> It works roughly 2x faster than ZLIB providing a comparable compressio=
n ratio
>> and therefore provide a performance advantage in backup scenarios.
>=20
> provides
>=20
>>
>> The default compression is ZLIB. Images created with ZLIB compression =
type
>> are backward compatible with older qemu versions.
>>
>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>=20
>> +++ b/docs/interop/qcow2.txt
>> @@ -109,7 +109,12 @@ in the description of a field.
>>                                  An External Data File Name header ext=
ension may
>>                                  be present if this bit is set.
>> =20
>> -                    Bits 3-63:  Reserved (set to 0)
>> +                    Bit 3:      Compression type bit. The bit must be=
 set if
>> +                                the compression type differs from def=
ault: zlib.
>=20
> I'd word this 'from the default of zlib.'
>=20
>> +                                If the compression type is default th=
e bit must
>> +                                be unset.
>=20
> Why? I see no reason to forbid a qcow2 image that has the incompatible
> bit set but still uses zlib compression.  True, such an image is not as=

> friendly to older clients, but it is not technically wrong, and newer
> clients would still be able to use the image if not for this sentence
> telling them they must not.

Just because an image doesn=E2=80=99t adhere to the specification doesn=E2=
=80=99t mean
you have to reject it, if the intention is clear.

> I'd drop this sentence.

I wouldn=E2=80=99t, I like it (in essence).  Though maybe the =E2=80=9Cmu=
st=E2=80=9D is indeed
too strong and it should be a =E2=80=9Cshould=E2=80=9D instead.

Max


--Nu2GKNNz2cazKTGwBjVXt9eTAT46q1OqA--

--GbHsLBUspUAoSw3SvuctFXPlZdJRB2s3P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1MGpUACgkQ9AfbAGHV
z0A2Iwf/XIdvsNGlTnHQ57JR/p2w5hDnQLNyGjasQZa+RkOvE2RWx1hzL06zfXDo
7JaZPRPz8GtaV8MtcdlTOglYy3ZuFUj2EhyP9gq6OHqnT9q7gUWHZTPtNQe4Upvl
fLxByU5xf/QjtnNr8N+guIKjKfo0PJ/DemkVkPbMBwcBqxp5MKYj93rT4MwjSETo
JA+e4XsTTrUDMwhBENlDdkiDedAcm0PH/k+SI8zhSpiEPNSrJvvc5AQ2z3jouquz
eBR/5HeHZZ+RRApQkjuP4A3U90z1aM4Jm6xlBKalcDgPnsvsbit/aYl8MfFuImcP
59EB7eD+XafgdM+tupeBUv64TAdbXw==
=j9pi
-----END PGP SIGNATURE-----

--GbHsLBUspUAoSw3SvuctFXPlZdJRB2s3P--

