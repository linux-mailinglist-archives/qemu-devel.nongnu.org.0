Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F87DAB1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 13:54:03 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ht9ek-0003iV-OY
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 07:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38418)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1ht9eF-0003Ey-W8
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 07:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ht9eF-0007Gb-41
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 07:53:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41860)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1ht9eD-0007Fp-2j; Thu, 01 Aug 2019 07:53:29 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 23BB231760ED;
 Thu,  1 Aug 2019 11:53:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-187.brq.redhat.com
 [10.40.204.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F8051001281;
 Thu,  1 Aug 2019 11:53:27 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20190731204203.10732-1-kwolf@redhat.com>
 <20190731204203.10732-3-kwolf@redhat.com>
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
Message-ID: <ebb124d5-913b-b004-cf48-c282ae49353d@redhat.com>
Date: Thu, 1 Aug 2019 13:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731204203.10732-3-kwolf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YVlR5escEFeJZRVXjW2Xqrf960d2iPuTE"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 01 Aug 2019 11:53:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] iotests/118: Create test classes
 dynamically
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YVlR5escEFeJZRVXjW2Xqrf960d2iPuTE
Content-Type: multipart/mixed; boundary="za3HG8VrWFYvciQqBTNMUeiZhojmQ8I7N";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
Message-ID: <ebb124d5-913b-b004-cf48-c282ae49353d@redhat.com>
Subject: Re: [PATCH 2/3] iotests/118: Create test classes dynamically
References: <20190731204203.10732-1-kwolf@redhat.com>
 <20190731204203.10732-3-kwolf@redhat.com>
In-Reply-To: <20190731204203.10732-3-kwolf@redhat.com>

--za3HG8VrWFYvciQqBTNMUeiZhojmQ8I7N
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 31.07.19 22:42, Kevin Wolf wrote:
> We're getting a ridiculous number of child classes of
> TestInitiallyFilled and TestInitiallyEmpty that differ only in a few
> attributes that we want to test in all combinations.
>=20
> Instead of explicitly writing down every combination, let's use a loop
> and create those classes dynamically.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/118 | 69 +++++++++++++-----------------------------=

>  1 file changed, 21 insertions(+), 48 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +            name =3D '%s_%s_%s' % (case.__name__, media, interface)
> +            globals()[name] =3D type(name, (case, ), attr)

=C3=84h.  OK.  Well, learned about that (trailing comma) today, I guess.


--za3HG8VrWFYvciQqBTNMUeiZhojmQ8I7N--

--YVlR5escEFeJZRVXjW2Xqrf960d2iPuTE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1C0rUACgkQ9AfbAGHV
z0Dtiwf+PgJduZsRhaoR8xOscbgsERCHibfAa8Qq+Warhn0lpBNPdteB2vypxBco
4kGST2RrPZMVSEap2idT/DggTHAy0N4/wsDyWWGpmU/oAWn7vCP9YbPjjTC+ecEz
Cy7DCSBT4+8CxT6lXANYhopMzyjsE0GEXWX3fKojnRO0myJ9qEDp4bt380EkzLeW
7kM3iEF+b3ykk1Ru3Cuhua7q7MOsFeffsIxSO7XziIZqjqwgBNYbW5K/BlkdckVF
KY5SMsmnla7VlBJSYIXo29B1cAJ59+54mrHH8hfVmcRsr57Zl/FIjP/ojBXfHXZL
Yb+i6o3ucaFL2rNTohFdvKtrA92T6w==
=1f8S
-----END PGP SIGNATURE-----

--YVlR5escEFeJZRVXjW2Xqrf960d2iPuTE--

