Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF5066B3C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 12:58:36 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hltG7-0008HZ-Ki
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 06:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hltFt-0007ow-Ia
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:58:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hltFs-0000R1-F9
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:58:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58526)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hltFp-0000On-Ve; Fri, 12 Jul 2019 06:58:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3720985543;
 Fri, 12 Jul 2019 10:58:16 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A49860920;
 Fri, 12 Jul 2019 10:58:09 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
References: <20190711195804.30703-1-mreitz@redhat.com>
 <20190711195804.30703-3-mreitz@redhat.com>
 <20190712094919.GC4514@dhcp-200-226.str.redhat.com>
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
Message-ID: <e0d93b2b-21c2-3eaa-bf27-0a1c7f19f4e4@redhat.com>
Date: Fri, 12 Jul 2019 12:58:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712094919.GC4514@dhcp-200-226.str.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JKLwvRH7SEKXgYZy4c4e8NKoheu5cbRjj"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 12 Jul 2019 10:58:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 2/5] block: Generic truncation fallback
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JKLwvRH7SEKXgYZy4c4e8NKoheu5cbRjj
Content-Type: multipart/mixed; boundary="O8vMdW337GWW1RLMv5GsPKpZX48uq5lTh";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <e0d93b2b-21c2-3eaa-bf27-0a1c7f19f4e4@redhat.com>
Subject: Re: [RFC 2/5] block: Generic truncation fallback
References: <20190711195804.30703-1-mreitz@redhat.com>
 <20190711195804.30703-3-mreitz@redhat.com>
 <20190712094919.GC4514@dhcp-200-226.str.redhat.com>
In-Reply-To: <20190712094919.GC4514@dhcp-200-226.str.redhat.com>

--O8vMdW337GWW1RLMv5GsPKpZX48uq5lTh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12.07.19 11:49, Kevin Wolf wrote:
> Am 11.07.2019 um 21:58 hat Max Reitz geschrieben:
>> If a protocol driver does not support truncation, we call fall back to=

>> effectively not doing anything if the new size is less than the actual=

>> file size.  This is what we have been doing for some host device drive=
rs
>> already.
>=20
> Specifically, we're doing it for drivers that access a fixed-size image=
,
> i.e. block devices rather than regular files. We don't want to do this
> for drivers where the file size could be changed, but just didn't
> implement it.
>=20
> So I would suggest calling the function more specifically something lik=
e
> bdrv_co_truncate_blockdev(), and not using it as an automatic fallback
> in bdrv_co_truncate(), but just make it the BlockDriver.bdrv_co_truncat=
e
> implementation for those drivers where it makes sense.

I was thinking about this, but the problem is that .bdrv_co_truncate()
does not get a BdrvChild, so an implementation for it cannot generically
zero the first sector (without bypassing the permission system, which
would be wrong).

So the function pointer would actually need to be set to something like
(int (*)(BlockDriverState *, int64_t, PreallocMode, Error **))42ul, or a
dummy function that just aborts, and then bdrv_co_truncate() would
recognize this magic constant.  But that seemed so weird to me that I
decided just not to do it, mostly because I was wondering what would be
so bad about treating images whose size we cannot change because we
haven=E2=80=99t implemented it exactly like fixed-size images.

(Also, =E2=80=9Cfixed-size=E2=80=9D is up to interpretation.  You can cha=
nge an LVM
volume=E2=80=99s size.  qemu doesn=E2=80=99t do it, obviously.  But that =
is the reason
for the warning qemu-img resize emits when it sees that the file size
did not change.)

> And of course, we only need these fake implementations because qemu-img=

> (or .bdrv_co_create_opts) always wants to create the protocol level. If=

> we could avoid this, then we wouldn't need any of this.

It=E2=80=99s trivial to avoid this.  I mean, patch 4 does exactly that.

So it isn=E2=80=99t about avoiding creating the protocol level, it=E2=80=99=
s about
avoiding the truncation there.  But why would you do that?

Max


--O8vMdW337GWW1RLMv5GsPKpZX48uq5lTh--

--JKLwvRH7SEKXgYZy4c4e8NKoheu5cbRjj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl0oZ8AACgkQ9AfbAGHV
z0AE3Qf9Fki0WZJd9f05orzoDjV0ilYhFJrBgHuGO2Wa7K7THxAAsjcomdmg5UrZ
oDk3TspUzPs0n9L/IHWoGSx7UVdlChK5esqvksmkqNeuLpQdQktWkD+jzKocfdPI
NaPcOsKgrLtTq2eXcDENFzTOUS/AKw7fMDqJ/bJgzcyHaCcalH0P0YyEbr6wm7eZ
pAt6MZ3+B4erwiilJj81/okP60Tqepsc+EQXN0CpwKzvnuD45XvK0K5tB5nvT7Qb
267RcWBNupKoKmYkv6sLixmVZtFE82AeL076W+3QmD3Mm2BLHkdikLd8yOhLOAc2
kJNiaW3AJoTAlQ9rAJKmzGpVi9h6Bw==
=8s+X
-----END PGP SIGNATURE-----

--JKLwvRH7SEKXgYZy4c4e8NKoheu5cbRjj--

