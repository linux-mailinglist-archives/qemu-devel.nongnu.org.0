Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1129973F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 16:46:53 +0200 (CEST)
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0oMW-0008RH-Ex
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 10:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i0oIG-000564-Cf
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i0oIE-0003Lt-DT
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:42:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i0oIB-0003K7-UU; Thu, 22 Aug 2019 10:42:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 48862308427C;
 Thu, 22 Aug 2019 14:42:23 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCBA660603;
 Thu, 22 Aug 2019 14:42:18 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20190814202219.1870-1-mlevitsk@redhat.com>
 <20190814202219.1870-13-mlevitsk@redhat.com>
 <80e25f5b-b26c-7867-bb3a-0992029b33b9@redhat.com>
 <20190822113222.GQ3267@redhat.com>
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
Message-ID: <28be6b06-1a26-dd9a-806b-66df67da7f07@redhat.com>
Date: Thu, 22 Aug 2019 16:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822113222.GQ3267@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FpOSBtKVwE0YrkN2rmDVtk0mtdp89YBRO"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 22 Aug 2019 14:42:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 12/13] qemu-img: implement key management
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FpOSBtKVwE0YrkN2rmDVtk0mtdp89YBRO
Content-Type: multipart/mixed; boundary="Oe5DCVbA9rlSVCGfdN8w8ar9yfNHJFLuU";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>
Message-ID: <28be6b06-1a26-dd9a-806b-66df67da7f07@redhat.com>
Subject: Re: [PATCH 12/13] qemu-img: implement key management
References: <20190814202219.1870-1-mlevitsk@redhat.com>
 <20190814202219.1870-13-mlevitsk@redhat.com>
 <80e25f5b-b26c-7867-bb3a-0992029b33b9@redhat.com>
 <20190822113222.GQ3267@redhat.com>
In-Reply-To: <20190822113222.GQ3267@redhat.com>

--Oe5DCVbA9rlSVCGfdN8w8ar9yfNHJFLuU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.08.19 13:32, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Aug 20, 2019 at 08:29:55PM +0200, Max Reitz wrote:
>> On 14.08.19 22:22, Maxim Levitsky wrote:
>>> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>>> ---
>>>  block/crypto.c   |  16 ++++++
>>>  block/crypto.h   |   3 +
>>>  qemu-img-cmds.hx |  13 +++++
>>>  qemu-img.c       | 140 +++++++++++++++++++++++++++++++++++++++++++++=
++
>>>  4 files changed, 172 insertions(+)
>>
>> Yes, this seems a bit weird.  Putting it under amend seems like the
>> natural thing if that works; if not, I think it should be a single
>> qemu-img subcommand instead of two.
>=20
> I'm not convinced by overloading two distinct operations on to one
> sub-command - doesn't seem to give an obvious benefit to overload
> them & IME experiance overloading results in harder to understand
> commands due to having distinct args to each command.

Because it suits the qemu-img interface we currently have.  For example,
we have a single subcommand for internal snapshot management (=E2=80=9Cqe=
mu-img
snapshot=E2=80=9D), so I think it makes sense to have a single subcommand=
 for
encrypted image management.

Max


--Oe5DCVbA9rlSVCGfdN8w8ar9yfNHJFLuU--

--FpOSBtKVwE0YrkN2rmDVtk0mtdp89YBRO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1eqckACgkQ9AfbAGHV
z0D+bggAt9DelCEDp0U9MWPMGeI5pdVSL0Hqpj35YhQ7RYVqjgcIfWEF0t4L2C6D
rXESY/aBJYVNdHOd2/jsiuAWi88zbdVvKvML4/rQa571Cf0k0NEyGrn7AQ2D+8Q/
9lfcbSKH34X7DUN1a6xcuWcdZcFP1OXrDqd5dY2aMgzAOIoyAZLsTwfjX2vt/P9X
aqO7NV3RqqW77l6E472nOThy0knLg1YLFvkNo4f3UOoWSIHUPTNq77dAN+SS2FS4
wdLQ/rnTXuh1cJbwwj32KLmtjxG9fDIdmlrllSG2YINqzw40mxpqiUFXhbt2L7ln
CMoTp3hJN+hlwjWJ00IZM0D1qjTvTQ==
=y+Mn
-----END PGP SIGNATURE-----

--FpOSBtKVwE0YrkN2rmDVtk0mtdp89YBRO--

