Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5581697797
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 12:52:01 +0200 (CEST)
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0ODg-0001Di-DY
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 06:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i0OCX-0000iK-O1
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 06:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i0OCW-0005sU-OC
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 06:50:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54106)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i0OCU-0005rj-66; Wed, 21 Aug 2019 06:50:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 67124301E136;
 Wed, 21 Aug 2019 10:50:45 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33AB18CC0E;
 Wed, 21 Aug 2019 10:50:38 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20190819201851.24418-1-mreitz@redhat.com>
 <20190819201851.24418-5-mreitz@redhat.com>
 <3e717f46-489f-170a-a201-cbe841d400f6@redhat.com>
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
Message-ID: <118225df-67b0-f415-9c1e-bdcaa9330044@redhat.com>
Date: Wed, 21 Aug 2019 12:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3e717f46-489f-170a-a201-cbe841d400f6@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="F4fAtdDvkOXxOYpAMDdxDbiSgo0TSeKmn"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 21 Aug 2019 10:50:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 4/8] iotests: Use case_skip() in
 skip_if_unsupported()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F4fAtdDvkOXxOYpAMDdxDbiSgo0TSeKmn
Content-Type: multipart/mixed; boundary="5N4XGbrBQtqmiKeV3kdGFZZWmak03EUwj";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Message-ID: <118225df-67b0-f415-9c1e-bdcaa9330044@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 4/8] iotests: Use case_skip() in
 skip_if_unsupported()
References: <20190819201851.24418-1-mreitz@redhat.com>
 <20190819201851.24418-5-mreitz@redhat.com>
 <3e717f46-489f-170a-a201-cbe841d400f6@redhat.com>
In-Reply-To: <3e717f46-489f-170a-a201-cbe841d400f6@redhat.com>

--5N4XGbrBQtqmiKeV3kdGFZZWmak03EUwj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 20.08.19 23:27, John Snow wrote:
>=20
>=20
> On 8/19/19 4:18 PM, Max Reitz wrote:
>> skip_if_unsupported() should use the stronger variant case_skip(),
>> because this allows it to be used even with setUp() (in a meaningful
>> way).
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>  tests/qemu-iotests/iotests.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotest=
s.py
>> index 2f53baf633..726f904f50 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -896,7 +896,7 @@ def skip_if_unsupported(required_formats=3D[], rea=
d_only=3DFalse):
>>              usf_list =3D list(set(required_formats) -
>>                              set(supported_formats(read_only)))
>>              if usf_list:
>> -                case_notrun('{}: formats {} are not whitelisted'.form=
at(
>> +                args[0].case_skip('{}: formats {} are not whitelisted=
'.format(
>>                      args[0], usf_list))
>>              else:
>>                  return func(*args, **kwargs)
>>
>=20
> Should we promote args[0] to a named argument here, because we depend o=
n
> it having a specific type? It's not truly as polymorphic as we're makin=
g
> it appear.
>=20
> That type here is iotests.QMPTestCase because we're relying on case_ski=
p
> being present.
>=20
> def test_wrapper(test_case, *args, **kwargs):
>     ...
>         return func(test_case, *args, **kwargs)

That sounds good to me indeed.

(I didn=E2=80=99t feel too bad about it because we already use args[0] fo=
r the
skip reason, but it really should be named, yes.)

Max


--5N4XGbrBQtqmiKeV3kdGFZZWmak03EUwj--

--F4fAtdDvkOXxOYpAMDdxDbiSgo0TSeKmn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1dIfwACgkQ9AfbAGHV
z0AnzQgAnb03N1CNxvmZgSaVeCPOgGxzZ+LS99NbTPRw19zxfnQGFocU7487N4Wp
6RqqHZ9hAr2dBEsLWX6G9BGGLWLBoR9gihyzCGrWxiIocn9Btv8qgR6+XKAmLjwL
sHFh0UXFWiuvyjkiGZfxIBQmItUxP6rdLKXrtFaKotGNIZPzfoNXNTQCF1iU4Xch
U7kpsNzgSVejEfyhcKiWPAXTnrTKnfKMo+kMvqn9axLAkfQm2PS5ru7k/JESSPZH
1SBqlp02DLce01XKgbnPdDP8Qsy9CL4WgRlJHrM1P2LGvQ68gXR3daoXqGjMAWTE
XkECgWii9S2zAZQrJzq+LoY1MZNFHA==
=In59
-----END PGP SIGNATURE-----

--F4fAtdDvkOXxOYpAMDdxDbiSgo0TSeKmn--

