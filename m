Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE016EB26
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 17:18:46 +0100 (CET)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6cv0-0008Ga-2p
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 11:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j6ctA-0007LF-SP
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:16:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j6ct9-00045E-OF
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:16:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27030
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j6ct9-00044w-J8
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582647410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G6zIfJHBXs9Zx13cGpS95eW7MISgHbAIEToIZG2AKXY=;
 b=SqJZnvvRtjt3PL2bGB/S1YOscNXgSYW/SXkIoBGUSOc0LgIgQO3KnvrHzI14QzRj4B7sk4
 eFQmwDa8nvtc+YM7hlVeRrzprhs6nIpVlvR5wSxG8nMlx6fdTshmpPc8nKksDNxXsrnbIu
 P3DvpzucH9Te/T6g5OygMa7+nzVDXQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-hLJmX7SsOoaQcaagAInipw-1; Tue, 25 Feb 2020 11:16:48 -0500
X-MC-Unique: hLJmX7SsOoaQcaagAInipw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17234800EB5;
 Tue, 25 Feb 2020 16:16:47 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-215.ams2.redhat.com
 [10.36.117.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 393D560BF7;
 Tue, 25 Feb 2020 16:16:44 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] Dump QCOW2 metadata
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
References: <1578990137-308222-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <fb4eb1a7-25f7-86ce-4c27-06bca430e97a@redhat.com>
 <18dea012-49ff-fda5-7450-964c37a9ed1d@virtuozzo.com>
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
Message-ID: <68f97545-0422-6b7c-ab1d-3cd895a1984c@redhat.com>
Date: Tue, 25 Feb 2020 17:16:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <18dea012-49ff-fda5-7450-964c37a9ed1d@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="K3luEQo9pgoVkEKb97w8hdFv6LsWVq2td"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--K3luEQo9pgoVkEKb97w8hdFv6LsWVq2td
Content-Type: multipart/mixed; boundary="GpUEUtILe4IEMxi87uTP0x0e4qSWEcbck"

--GpUEUtILe4IEMxi87uTP0x0e4qSWEcbck
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 20.02.20 13:10, Vladimir Sementsov-Ogievskiy wrote:
> 20.02.2020 14:58, Max Reitz wrote:
>> On 14.01.20 09:22, Andrey Shinkevich wrote:
>>> The information about QCOW2 metadata allocations in an image ELF-file i=
s
>>> helpful for finding issues with the image data integrity.
>>
>> Sorry that I=92m replying only so late =96 but I don=92t know why we nee=
d this
>> in qemu, and this cover letter doesn=92t provide a justification.=A0 I m=
ean,
>> it isn=92t too complex (from the diffstat), but wouldn=92t it be better =
to
>> just have a script for this?
>>
>> I suppose one reason to put it in qemu/qemu-img is that a script
>> wouldn=92t be packaged by distributions.=A0 So if a user has a corrupted
>> image, with this series we could tell them to run qemu-img check -M and
>> put the output somewhere.=A0 With a script, we=92d first have to tell th=
em
>> to download the script.=A0 But then again, downloading a script (that
>> should be part of the qemu repository) doesn=92t seem too much trouble t=
o
>> me either.
>>
>> So I=92m curious as to whether you had a specific reason in mind when yo=
u
>> decided to implement this as part of qemu itself?
>>
>> (I suppose the additional complexity is fully limited to the check
>> infrastructure, so it wouldn=92t interfere with the rest of the qcow2
>> driver.=A0 Hm.=A0 Fair enough.)
>>
>=20
> Just not to parse qcow2 from scratch. Qemu already can read qcow2, and
> it looks through all its structures during check, why not
> to add an ability to represent these structures as a qobject?

Because it=92d be code in qemu (i.e., a liability) that users are pretty
much never going to use.

Max


--GpUEUtILe4IEMxi87uTP0x0e4qSWEcbck--

--K3luEQo9pgoVkEKb97w8hdFv6LsWVq2td
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5VSGsACgkQ9AfbAGHV
z0ASxAf/UgmCg0URmm3uLOd5NULWJg79vNX0N57s6/Lo4/40B7sMW8nkSM0CqRlC
M47m9A7jPAmRFC0n9vvxOWH5rfX38b7Pii+S4X001fmcioLMINkNCQ9PZ+YsTmE2
BVo2okKwX6X4wC5gIEBAz3qTIov9l+iwe1bRHOYaXYEQKkT3+0AJe7/yI2DvVK8a
M1w+Vb/mZzd5/RcKEYrfhKjmcGzxtbxJx/B9NV3DSoxNaO4C8TfdAciss+QydqDD
vKcLtgPIhddkh64OR7TGbjoKPRLWCHVCb146atLqqxyUOH5YbwxpFaug8pc/svDj
eYFrJoOLKECmRq+7j/18hUcqz1y8JQ==
=PLeW
-----END PGP SIGNATURE-----

--K3luEQo9pgoVkEKb97w8hdFv6LsWVq2td--


