Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F1F1344
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 11:05:35 +0100 (CET)
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSIBy-0004zG-1r
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 05:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iSIB0-0004Tk-Qa
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 05:04:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iSIAy-0004Kw-Iu
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 05:04:33 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57332
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iSIAy-0004Kn-Ds
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 05:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573034672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Kw1jFx8Jk0WvWliU5majCnF2ziVVFS2PkiLBAto+obo=;
 b=cacuIAh7PxxYNkBoj+zkGpCwuTjdVUDk85FTXYQbwgK/4ub9xiUdNyyu0vKPLop9AYISAZ
 fwoSwjEHa7bK123JeIk845De7YajBrz0OiuasmBkbohfY/X0/v/EpnjE27wOTAkY92G1AO
 PtiiSjyj4qzxhxwfX85ilXmF0DzYDpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-81qfIvjXP06blxHvotP0_w-1; Wed, 06 Nov 2019 05:04:28 -0500
X-MC-Unique: 81qfIvjXP06blxHvotP0_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 168C41005500;
 Wed,  6 Nov 2019 10:04:27 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-212.ams2.redhat.com
 [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF35F60852;
 Wed,  6 Nov 2019 10:04:18 +0000 (UTC)
Subject: Re: [PATCH v1 4/4] iotests: add test for virtio-scsi and virtio-blk
 machine type settings
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>
References: <20191105161105.19016-1-dplotnikov@virtuozzo.com>
 <20191105161105.19016-5-dplotnikov@virtuozzo.com>
 <20191106092412.GH189998@stefanha-x1.localdomain>
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
Message-ID: <909f6a98-a750-db34-de23-6c9d89f9f19e@redhat.com>
Date: Wed, 6 Nov 2019 11:04:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106092412.GH189998@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wbzx25enHKYGyBzBZCQzRr0flbpzXqQ50"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: fam@euphon.net, kwolf@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, qemu-devel@nongnu.org,
 den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wbzx25enHKYGyBzBZCQzRr0flbpzXqQ50
Content-Type: multipart/mixed; boundary="kA2D9xSag9rURcvbj9gplHZApYzY9v2se"

--kA2D9xSag9rURcvbj9gplHZApYzY9v2se
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06.11.19 10:24, Stefan Hajnoczi wrote:
> On Tue, Nov 05, 2019 at 07:11:05PM +0300, Denis Plotnikov wrote:
>> It tests proper queue size settings for all available machine types.
>>
>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>> ---
>>  tests/qemu-iotests/267     | 154 +++++++++++++++++++++++++++++++++++++
>>  tests/qemu-iotests/267.out |   1 +
>>  tests/qemu-iotests/group   |   1 +
>>  3 files changed, 156 insertions(+)
>>  create mode 100755 tests/qemu-iotests/267
>>  create mode 100644 tests/qemu-iotests/267.out
>=20
> The qemu-iotests maintainers might prefer for this to be at the
> top-level in tests/ since it's not really an iotest, but the code itself
> looks fine to me:
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Good question.  I don=92t really mind, but it would be weird if started
adding all kinds of =93external=94 qemu tests (i.e. that use QMP) in the
iotests directory.

What is the alternative?  Just putting it in a different directory
doesn=92t sound that appealing to me either, because it would still depend
on the iotests infrastructure, right?  (i.e., iotests.py and check)

Max


--kA2D9xSag9rURcvbj9gplHZApYzY9v2se--

--wbzx25enHKYGyBzBZCQzRr0flbpzXqQ50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl3CmqAACgkQ9AfbAGHV
z0B8hgf+Ne7eMVMA6oPlx9vZe7XLgTatOmk2BhgZxy+0T3LKezC0idSdh2h4683I
R4R5S4seq4eJoO4UcsDRXjY+wQf7K4nYxuhlZHtyO2+riMfGqSu3guI0yLF+yX+t
dizjfC2kj8/gwm6q1hkYdRorLUDTSrQg2ag/VHni1AaNrFfkqxohnSDS4/vUy0Wz
DUwYO9DkmEuqmF8kjDo8JPLXSOfW5GtR+YQQb8rn4LWKQkFHDnL6Do9s25xJNpKe
KQSgop8OCH6eAGSeN0uqwSLRR5LlVkDJMxpUemQ+2r2YcaWMXMSvK3u34e4773nT
myufXQpKNtkO1Njl6En1i0Bw3MEFQw==
=OdOw
-----END PGP SIGNATURE-----

--wbzx25enHKYGyBzBZCQzRr0flbpzXqQ50--


