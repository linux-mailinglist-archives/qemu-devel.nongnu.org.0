Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8B1BA7B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 17:59:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQDMH-0006LS-IU
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 11:59:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hQDJt-00057N-3S
	for qemu-devel@nongnu.org; Mon, 13 May 2019 11:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hQDHC-0003Em-5r
	for qemu-devel@nongnu.org; Mon, 13 May 2019 11:54:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hQDHA-0003DU-S9; Mon, 13 May 2019 11:54:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 356183087944;
	Mon, 13 May 2019 15:54:04 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.206.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2500E608B9;
	Mon, 13 May 2019 15:54:02 +0000 (UTC)
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1557754872.git.berto@igalia.com>
	<20dfb3d9ccec559cdd1a9690146abad5d204a186.1557754872.git.berto@igalia.com>
	<5783a050-5866-80d5-4699-7ea0bf122398@redhat.com>
	<w51r292pd0n.fsf@maestria.local.igalia.com>
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
Message-ID: <ca7573fa-774b-89dd-ab7d-849258d51904@redhat.com>
Date: Mon, 13 May 2019 17:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <w51r292pd0n.fsf@maestria.local.igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="l7euaRzGsHEl6QdEtXUikx92nBZM23axJ"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 13 May 2019 15:54:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v3 2/2] block: Make
 bdrv_root_attach_child() unref child_bs on failure
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l7euaRzGsHEl6QdEtXUikx92nBZM23axJ
From: Max Reitz <mreitz@redhat.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Message-ID: <ca7573fa-774b-89dd-ab7d-849258d51904@redhat.com>
Subject: Re: [PATCH v3 2/2] block: Make bdrv_root_attach_child() unref
 child_bs on failure
References: <cover.1557754872.git.berto@igalia.com>
 <20dfb3d9ccec559cdd1a9690146abad5d204a186.1557754872.git.berto@igalia.com>
 <5783a050-5866-80d5-4699-7ea0bf122398@redhat.com>
 <w51r292pd0n.fsf@maestria.local.igalia.com>
In-Reply-To: <w51r292pd0n.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.05.19 17:52, Alberto Garcia wrote:
> On Mon 13 May 2019 04:31:16 PM CEST, Max Reitz wrote:
>>> @@ -2569,10 +2582,6 @@ BdrvChild *bdrv_open_child(const char *filenam=
e,
>>>      }
>>> =20
>>>      c =3D bdrv_attach_child(parent, bs, bdref_key, child_role, errp)=
;
>>> -    if (!c) {
>>> -        bdrv_unref(bs);
>>> -        return NULL;
>>> -    }
>>> =20
>>>      return c;
>>>  }
>>
>> (That could have been simplified even further. *shrug*)
>=20
> Right, we can remove the 'c' variable altogether. Feel free to edit the=

> commit if you want.

OK, I=E2=80=99ll do that, then.

Max


--l7euaRzGsHEl6QdEtXUikx92nBZM23axJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzZkxkACgkQ9AfbAGHV
z0DiNggAmJU5iQUlIxspL6IsSJkuLvhc3bBVkU/w6topAYi9ehGBVFITdnajsGMl
EItdsYpT87CCSwv/1SoXOOGgCAKTTetsb+l7o6BL+3gk8lrG0rkzY58emmjIZKZ3
8Njegc0Tj0WBN6O8oC6Y+J0mkSOxgg4hizsgXl/+7uga4IVXdDB3SwVb6dLEstTT
ywuB62tRZtL8n4K3EhHH6tj5bzgOzuqSfIbV4R+dfnzQHLmK0i6I+W6msbf7jbf7
IaJFss1Kp0L8tpaJiaVG4BRtfZW8W2efhklo5X2lHqWIoVngeHJ2818VaRofCzwO
8VM82ifjydwKxJ5wEYr2hCQ5sCZAAw==
=Nei5
-----END PGP SIGNATURE-----

--l7euaRzGsHEl6QdEtXUikx92nBZM23axJ--

