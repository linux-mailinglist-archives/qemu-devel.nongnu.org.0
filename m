Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480848235E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 19:01:42 +0200 (CEST)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hugMf-0004ez-Hd
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 13:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41489)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hugM7-0004BG-Bh
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 13:01:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hugM6-0008Nl-7T
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 13:01:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55232)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hugM3-0008ME-QL; Mon, 05 Aug 2019 13:01:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E1167793ED;
 Mon,  5 Aug 2019 17:01:02 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 439405D712;
 Mon,  5 Aug 2019 17:01:01 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190805163740.23616-1-mreitz@redhat.com>
 <d7a1adf8-d0a2-dead-b8d5-2576d9b05f47@virtuozzo.com>
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
Message-ID: <3a38f834-7759-fe3b-c5e7-d6232dc04e56@redhat.com>
Date: Mon, 5 Aug 2019 19:00:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d7a1adf8-d0a2-dead-b8d5-2576d9b05f47@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Lg1NbNJAinkUHmIBTAdxRQxc4EF48AJgn"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 05 Aug 2019 17:01:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 0/7] Block patches for 4.1.0-rc4
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Lg1NbNJAinkUHmIBTAdxRQxc4EF48AJgn
Content-Type: multipart/mixed; boundary="TAtKcvvXKX1FNno1FRIVrzwcMuGp10QRp";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Message-ID: <3a38f834-7759-fe3b-c5e7-d6232dc04e56@redhat.com>
Subject: Re: [Qemu-devel] [PULL 0/7] Block patches for 4.1.0-rc4
References: <20190805163740.23616-1-mreitz@redhat.com>
 <d7a1adf8-d0a2-dead-b8d5-2576d9b05f47@virtuozzo.com>
In-Reply-To: <d7a1adf8-d0a2-dead-b8d5-2576d9b05f47@virtuozzo.com>

--TAtKcvvXKX1FNno1FRIVrzwcMuGp10QRp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05.08.19 18:59, Vladimir Sementsov-Ogievskiy wrote:
> 05.08.2019 19:37, Max Reitz wrote:
>> The following changes since commit 9bb68d34dda9be60335e73e65c8fb61bca0=
35362:
>>
>>    Merge remote-tracking branch 'remotes/philmd-gitlab/tags/edk2-next-=
20190803' into staging (2019-08-05 11:05:36 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/XanClic/qemu.git tags/pull-block-2019-08-05
>>
>> for you to fetch changes up to 07b0851c592efe188a87259adbda26a63c61dc9=
2:
>>
>>    block/backup: disable copy_range for compressed backup (2019-08-05 =
18:05:05 +0200)
>>
>> ----------------------------------------------------------------
>> Block patches for 4.1.0-rc4:
>> - Fix the backup block job when using copy offloading
>> - Fix the mirror block job when using the write-blocking copy mode
>> - Fix incremental backups after the image has been grown with the
>>    respective bitmap attached to it
>>
>> ----------------------------------------------------------------
>> Max Reitz (5):
>>    backup: Copy only dirty areas
>>    iotests: Test backup job with two guest writes
>>    iotests: Test incremental backup after truncation
>>    mirror: Only mirror granularity-aligned chunks
>>    iotests: Test unaligned blocking mirror write
>>
>> Vladimir Sementsov-Ogievskiy (2):
>>    util/hbitmap: update orig_size on truncate
>>    block/backup: disable copy_range for compressed backup
>>
>=20
> As I understand, this all should go to stable too? CC it.
Ah, yes.  Thanks.

Max


--TAtKcvvXKX1FNno1FRIVrzwcMuGp10QRp--

--Lg1NbNJAinkUHmIBTAdxRQxc4EF48AJgn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1IYMsACgkQ9AfbAGHV
z0BOGQgAmFOSUYqE0GHyADRzoKXc57yHz+xzp6woFJpMKj/ckKJuH6Ip8+eit8xH
m6VOqtUrMqppz8suG1GSL89gBMWT1Ru5GQUn8JYczRjgcvgk0x6aIJe6moOXrMh7
drWjPBEN/cNWSqBvfVWVb7KR5IsRd343gWH+a23Vuxv9uz66Q/eyf3yEhttTr5PH
+o8sJYpcG7tIMt1HuhXd1UFw0tF+zv7hmL+llU08mNTr6wGsJK9NSudDSTfl54Rr
5XB6t68Y86HgOQl3J8lUPkUMkI0/FDhaFC2cFZAc2g6MgLkTlojwvGGdbQZ3SQJT
Iil6A9PxORAGUq29Pmb2H7JuAbwhjA==
=SfBh
-----END PGP SIGNATURE-----

--Lg1NbNJAinkUHmIBTAdxRQxc4EF48AJgn--

