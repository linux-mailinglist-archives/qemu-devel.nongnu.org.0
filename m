Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E757211734B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 19:00:40 +0100 (CET)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieNKp-0000OC-Rx
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 13:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ieNIr-0006uX-GP
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:58:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ieNIp-0005B3-AL
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:58:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36156
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ieNIp-0005Ax-1J
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575914314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sNdqxFDJhlfQGFFAJOSVnPMBHTkxh1IXdMDxQduHjIU=;
 b=XX/778el6R27Rh1fz15phbRs4qUrvvgRSasVySxNktqHqlPHeq6WXOmU8aAOpMJudhhi/4
 4w8fGwR2Dt9Y77c7pL00AbJD3CYO3UGiohJCJKEsDBGgpahi+RAebm3PK9AMl0zHZTXF0D
 sB4XPVNAWMcmW7JNZQET7jyxNdYgJ3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-EKOqPmEAMWWrnAG9-BFt6w-1; Mon, 09 Dec 2019 12:58:29 -0500
X-MC-Unique: EKOqPmEAMWWrnAG9-BFt6w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F8E218A8C81;
 Mon,  9 Dec 2019 17:58:28 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F445D6B7;
 Mon,  9 Dec 2019 17:58:23 +0000 (UTC)
Subject: Re: [bugfix ping2] Re: [PATCH v2 0/2] fix
 qcow2_can_store_new_dirty_bitmap
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20191014115126.15360-1-vsementsov@virtuozzo.com>
 <e89b8844-26c7-0768-f6dd-6faa814551e2@virtuozzo.com>
 <0db82122-ee0d-a346-cb49-d902d5d66b77@virtuozzo.com>
 <cbba2b12-da7d-eed8-1f6b-fc2412f82ff8@redhat.com>
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
Message-ID: <a67b4a16-773c-52c8-288a-0e9e032b4589@redhat.com>
Date: Mon, 9 Dec 2019 18:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cbba2b12-da7d-eed8-1f6b-fc2412f82ff8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qS29Io3xhRKUgVADNw1bLllBv1hsyCsmm"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Denis Lunev <den@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qS29Io3xhRKUgVADNw1bLllBv1hsyCsmm
Content-Type: multipart/mixed; boundary="uNYV0YItdrxQdWY95HFIXWSanOM9t2SmO"

--uNYV0YItdrxQdWY95HFIXWSanOM9t2SmO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09.12.19 17:30, Max Reitz wrote:
> On 02.12.19 15:09, Vladimir Sementsov-Ogievskiy wrote:
>> Hi again!
>>
>> Still forgotten bug-fix :(
>>
>> Is it too late for 4.2?
>=20
> Sorry. :-/
>=20
> Yes, I think I just forgot it.  I don=E2=80=99t think it=E2=80=99s too im=
portant for
> 4.2, so, well, it isn=E2=80=99t too bad, but...  Sorry.
>=20
>> I can't imagine better test, and it tests exactly what written in
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1712636
>>
>> (Hmm, actually, I doubt that it is real use-case, more probably it's a b=
ug in management layer)
>>
>> So, take this with test or without test, to 4.2 or 5.0.
>=20
> I was thinking of seeing whether I could write a quicker test, but of
> course we should take the patch either way.

OK, I give up.  It=E2=80=99s very much possible to create an image with 655=
35
bitmaps very quickly (like, under a second) outside of qemu, but just
opening it takes 2:30 min (because of the quadratic complexity of
checking whether a bitmap of the same name already exists).

Max


--uNYV0YItdrxQdWY95HFIXWSanOM9t2SmO--

--qS29Io3xhRKUgVADNw1bLllBv1hsyCsmm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl3uiz4ACgkQ9AfbAGHV
z0DRGgf+P2yuzy66SgUfQXjKvZ0yoUhVhpu7gpVcOG8sXgYSBen1LVmOtSYRPZNI
8pRVyY/xtpLPaXUdqhv69MTxCcSliYLeb5XAXCLKM07u0xIvx5oRI/a5I5Ps14Se
DZzkcmO7gZXn49dLpDde8BzHSaw6AsUP/J+a86CQXkgRMraNmzMYyk6vE97XTekX
rXI1eHN/JiyCWmT2g+NCMGVsRvP07et3LNXyP/wXmeG94lO7QWbhAxBV162X6bp0
AL/jr4GuCJsl9hgaJJsuytOLdixV4g8ifOX0uj02oy2C8luyThx/7uT3wSbMHZxQ
gVfq3Z3oyKnymcFLI8SQ148mZR4+yw==
=4ueZ
-----END PGP SIGNATURE-----

--qS29Io3xhRKUgVADNw1bLllBv1hsyCsmm--


