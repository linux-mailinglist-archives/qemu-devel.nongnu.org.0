Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09641CCDF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 18:22:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQaCb-0003ts-2N
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 12:22:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hQa5v-00076Z-Ei
	for qemu-devel@nongnu.org; Tue, 14 May 2019 12:16:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hQa5u-0007J0-9T
	for qemu-devel@nongnu.org; Tue, 14 May 2019 12:15:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hQa5r-0007Bv-9o; Tue, 14 May 2019 12:15:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0A9589C36;
	Tue, 14 May 2019 16:15:53 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.236])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F112600CD;
	Tue, 14 May 2019 16:15:52 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <c276dc0c-0190-1e83-d491-8157d78ec817@redhat.com>
	<5e56cded-5097-ce97-6f2b-7afee8e480af@redhat.com>
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
Message-ID: <ce551fef-3987-a5fd-7280-e406226c6a20@redhat.com>
Date: Tue, 14 May 2019 18:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5e56cded-5097-ce97-6f2b-7afee8e480af@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="KrjiMHCCWMLENMT5GHjLSizOdUkgSyL0r"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 May 2019 16:15:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Unaligned images with O_DIRECT
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KrjiMHCCWMLENMT5GHjLSizOdUkgSyL0r
From: Max Reitz <mreitz@redhat.com>
To: Eric Blake <eblake@redhat.com>, Qemu-block <qemu-block@nongnu.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
Message-ID: <ce551fef-3987-a5fd-7280-e406226c6a20@redhat.com>
Subject: Re: Unaligned images with O_DIRECT
References: <c276dc0c-0190-1e83-d491-8157d78ec817@redhat.com>
 <5e56cded-5097-ce97-6f2b-7afee8e480af@redhat.com>
In-Reply-To: <5e56cded-5097-ce97-6f2b-7afee8e480af@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14.05.19 17:45, Eric Blake wrote:
> On 5/14/19 10:06 AM, Max Reitz wrote:
>> Hi,
>>
>> Unaligned images don=E2=80=99t work so well with O_DIRECT:
>>
>> $ echo > foo
>> $ qemu-img map --image-opts driver=3Dfile,filename=3Dfoo,cache.direct=3D=
on
>> Offset          Length          Mapped to       File
>> qemu-img: block/io.c:2093: bdrv_co_block_status: Assertion `*pnum &&
>> QEMU_IS_ALIGNED(*pnum, align) && align > offset - aligned_offset' fail=
ed.
>> [1]    10954 abort (core dumped)  qemu-img map --image-opts
>> driver=3Dfile,filename=3Dfoo,cache.direct=3Don
>>
>> (compare https://bugzilla.redhat.com/show_bug.cgi?id=3D1588356)
>>
>> This is because the request_alignment is 512 (in my case), but the EOF=

>> is not aligned accordingly, so raw_co_block_status() returns an aligne=
d
>> *pnum.
>=20
> Uggh. Yet another reason why I want qemu to support byte-accurate
> sizing, instead of rounding up. The rounding keeps raising its head in
> more and more places. I have pending patches that are trying to improve=

> block status to round driver answers up to match request_alignment (whe=
n
> the protocol layer has finer granularity than the format layer); but
> this sounds like it is a bug in the file driver itself for returning an=

> answer that is not properly rounded according to its own
> request_alignment boundary, and not one where my pending patches would =
help.

Yes, I think so, too.

>> I suppose having an unaligned tail is not so bad and maybe we can just=

>> adjust the assertion accordingly.  On the other hand, this has been
>> broken for a while.  Does it even make sense to use O_DIRECT with
>> unaligned images?  Shouldn=E2=80=99t we just reject them outright?
>=20
> The tail of an unaligned file is generally inaccessible to O_DIRECT,

Especially with this.

> where it is easier to use ftruncate() up to an aligned boundary if you
> really must play with that region of the file, and then ftruncate() bac=
k
> to the intended size after I/O. But that sounds hairy.  We could also
> round down and silently ignore the tail of the file, but that is at odd=
s
> with our practice of rounding size up.  So for the short term, I'd be
> happy with a patch that just rejects any attempt to use cache.direct=3D=
on
> (O_DIRECT) with a file that is not already a multiple of the alignment
> required thereby. (For reference, that's what qemu as NBD client
> recently did when talking to a server that advertises a size
> inconsistent with forced minimum block access: commit 3add3ab7)

OK, I=E2=80=99ll send a patch.  Thanks for you explanation!

Max


--KrjiMHCCWMLENMT5GHjLSizOdUkgSyL0r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlza6bUACgkQ9AfbAGHV
z0BFZQf/asoV33q2rQ51bYs0Aw+QIrhxss0oPFuj4ziVcjdxzy27rfXbRu+YTzJ6
pe4zRB/2Qb5dE0vBVh0dTXzz3NiO+XJ6Rwf1AG9WU9kI013qaZ87BJPAfoxT7rul
RtrrzHizIh+jirDT3yT3l3aNAb0ypya8kCoonRm8Y7S0HHQgCD/aAEysFnV0x9Bf
fp6Bzx/OKvhSDRC7uKGYm8JrEIamA9w7oGxUBZO4oLgxFlcYZX2QC4v2XghwXeeM
GjNzP9HN8gp1dvSfZwaiLrTIfh/tS/HluKICUQv19u6MTDfXM7wr/pWAMTrfZmiL
rLac7qbKUeCgQ99qp66xy5gRFzkQ0Q==
=5iU3
-----END PGP SIGNATURE-----

--KrjiMHCCWMLENMT5GHjLSizOdUkgSyL0r--

