Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547EA18155E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 10:56:16 +0100 (CET)
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBy63-0003nX-Dd
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 05:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32885)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jBy52-0002vc-JF
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 05:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jBy51-0000Z0-JI
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 05:55:12 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40113
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jBy51-0000Yk-Er
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 05:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583920511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZKw/IzxHhiSM8Ko5krloyBxXSw5G1D6zIAEjY+In0mQ=;
 b=fmUxz9kkGjP4EF5AQXFaSbX0sQTp5eakFt0KFj1c6Kjpe2Yf1tGK7DiJ/rm7mkhgDB6Aoa
 mkjFQbtMcFM5SM8w6jbJq8m79zKq1PdHln8QPMzOJdCpv7zxsLWlXuSsKbrsVysroxQ7BM
 aSQ8al25k8QJ1Ix4xF2uLz/xJgqxZM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-DrGl_6rAOjaamoKm8q4YrQ-1; Wed, 11 Mar 2020 05:55:08 -0400
X-MC-Unique: DrGl_6rAOjaamoKm8q4YrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2033800D50;
 Wed, 11 Mar 2020 09:55:07 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-216.ams2.redhat.com
 [10.36.117.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D943B5C1D4;
 Wed, 11 Mar 2020 09:55:05 +0000 (UTC)
Subject: Re: [PATCH v4 00/10] Further bitmaps improvements
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200205112041.6003-1-vsementsov@virtuozzo.com>
 <4cf33f31-cdbb-cee4-a1b4-4053c88a002e@redhat.com>
 <6b570584-100b-248f-5412-98a5d91f62f5@virtuozzo.com>
 <ca6f95ef-d51f-130a-8ad1-4eba5e0a3528@redhat.com>
 <7b655cdf-8c54-b10a-4140-2ad083dec75a@virtuozzo.com>
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
Message-ID: <153ff5cc-a929-1aa9-c405-846739b13570@redhat.com>
Date: Wed, 11 Mar 2020 10:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7b655cdf-8c54-b10a-4140-2ad083dec75a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bBpUWHj7zT05zGX9BLKwBKFVNrtfRCzAL"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bBpUWHj7zT05zGX9BLKwBKFVNrtfRCzAL
Content-Type: multipart/mixed; boundary="Mp2ddUMY7EtAKyNm22uPaBKTFOMA47Nq6"

--Mp2ddUMY7EtAKyNm22uPaBKTFOMA47Nq6
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.03.20 07:17, Vladimir Sementsov-Ogievskiy wrote:
> 10.03.2020 20:17, Max Reitz wrote:
>> On 06.03.20 08:45, Vladimir Sementsov-Ogievskiy wrote:
>>> 26.02.2020 16:13, Max Reitz wrote:
>>>> On 05.02.20 12:20, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Hi!
>>>>>
>>>>> The main feature here is improvement of _next_dirty_area API, which
>>>>> I'm
>>>>> going to use then for backup / block-copy.
>>>>>
>>>>> Somehow, I thought that it was merged, but seems I even forgot to sen=
d
>>>>> v4.
>>>>
>>>> The changes from v3 look good to me, but I=92d prefer a review from Er=
ic
>>>> on patch 8.
>>>>
>>>
>>> Hi!
>>>
>>> Could you take it now, or do you prefer me to resend?
>>
>> I understand that you agreed to drop the comment above
>> bd_extent_array_convert_to_be(), then do the
>> =93s/further call/so further calls/=94 replacement, and finally replace =
the
>> whole four lines Eric has quoted by =93(this ensures that after a failur=
e,
>> no further extents can accidentally change the bounds of the last extent
>> in the array)=94?
>>
>=20
> Yes, all true.

Hm, I could take it then, but on second thought, John is the maintainer
for 8/10 patches, and Eric is for the other two...  So I=92m not sure
whether I=92m even the right person to do so.

Max


--Mp2ddUMY7EtAKyNm22uPaBKTFOMA47Nq6--

--bBpUWHj7zT05zGX9BLKwBKFVNrtfRCzAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5otXcACgkQ9AfbAGHV
z0APDAgAkGNK16xff5EnHmC0b+UHpTJqzr5X3dFiM6Zp2eqMhAM3L3X8rY+lIBol
cZXGUlB/C559Bahn5pVOUvxGUIO2dPoiEJ0H6rgs2tdg1smJa8L8GgjCdM+FM2OP
Hqek6C6sLPbeBrZjbL19BXva0ELEgdngFfzRek0PzWTBVGxn4rQ3+uNCs9ZquDh+
G8sgJPfNMQuzjGZ8X0tnA5ezIMQTYS1ehnZXCnbCagVoJC5DBFVq3Vc2n6WqosGh
fsGrzRuTmMaIyCuYFV6qd3WT8LnsWfdA9whE0RQ0zLxNxp/5EhfaIwyhkkojZ7r9
JnjeHNZ8d6eBtaKIL3O9AEdA3rxMHw==
=CGkE
-----END PGP SIGNATURE-----

--bBpUWHj7zT05zGX9BLKwBKFVNrtfRCzAL--


