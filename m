Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D282013DE48
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:08:22 +0100 (CET)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is6kv-0006RK-78
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1is6gl-0002NV-0I
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:04:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1is6gg-0004PP-AN
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:04:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44215
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1is6gg-0004PA-5d
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579187037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=20+cTvTaLmnc2ukRAHPzMlL60khISVae9HSgFglB/0A=;
 b=N74ehRqhdGGMnLSuM1Dd+/rTO+mP4LtO8VtEnHdUqhzQDHtyD3HDDXxYKvlrlJUJq/hxoB
 qFXprX1muILNC5JmuRaxPnA3f6rSMR847x/25OyK62nnqbZqLPlN4p3EM4belZLRKm68Kj
 gJ9Si8hwbHhPp9L5CxFeZnBvDcvMHSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-1etjbdG3MHmaii3yNckCvQ-1; Thu, 16 Jan 2020 10:03:55 -0500
X-MC-Unique: 1etjbdG3MHmaii3yNckCvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69B92801E67;
 Thu, 16 Jan 2020 15:03:54 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-185.ams2.redhat.com
 [10.36.117.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA8BF60E3E;
 Thu, 16 Jan 2020 15:03:48 +0000 (UTC)
Subject: Re: Bug? qemu-img convert to preallocated image makes it sparse
To: Eric Blake <eblake@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>, 
 qemu-devel@nongnu.org, qemu-block@nongnu.org, mlevitsk@redhat.com,
 sgarzare@redhat.com
References: <20200116141352.GA32053@redhat.com>
 <962aa54b-f6e5-bb43-50a0-c4cad59cd22e@redhat.com>
 <75daaf8f-0bfe-d3f6-5df4-88c29b2d9b07@redhat.com>
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
Message-ID: <026ac30d-930c-0c81-0825-346e33e59f36@redhat.com>
Date: Thu, 16 Jan 2020 16:03:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <75daaf8f-0bfe-d3f6-5df4-88c29b2d9b07@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="azLSSi2pvb7k4AHmq0szb48ikED4nqMnt"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--azLSSi2pvb7k4AHmq0szb48ikED4nqMnt
Content-Type: multipart/mixed; boundary="eW7H4EzN1u3SAEA1rZRP9qMWiy2nplFMm"

--eW7H4EzN1u3SAEA1rZRP9qMWiy2nplFMm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 16.01.20 15:57, Eric Blake wrote:
> On 1/16/20 8:47 AM, Max Reitz wrote:
>=20
>> So when you convert to the target image, you have to make sure all areas
>> that are zero in the source are zero in the target, too.=C2=A0 The way w=
e do
>> that is to write zeroes to the target.=C2=A0 The problem is that this
>> operation disregards the previous preallocation and discards the
>> preallocated space.
>>
>> As for fixing the bug...=C2=A0 Can we fix it in qemu(-img)?
>>
>> We could try to detect whether areas that are zero in the source are
>> zero in the (preallocated) target image, too.=C2=A0 But doing so what re=
quire
>> reading the data from those areas and comparing it to zero.=C2=A0 That w=
ould
>> take time and it isn=E2=80=99t trivial.=C2=A0 So that=E2=80=99s somethin=
g I=E2=80=99d rather avoid.
>=20
> Can't we also use block status queries on the destination, as that is
> likely to be faster than actual reads and comparison to zero?

It might work for falloc preallocation, but I don=E2=80=99t know whether we=
 are
really guaranteed that fallocated() areas return holes through lseek().

It won=E2=80=99t work for full preallocation, though.  Yes, you might get a=
round
that with -S 0 then, but I think overall the simplest thing would be a
--target-is-zero flag.  (I don=E2=80=99t know, it seems useful to me in gen=
eral.
 For example, when you convert to a new block device.  The biggest
drawback I see is that people might use it blindly and then complain
that their image contains garbage...)

Max


--eW7H4EzN1u3SAEA1rZRP9qMWiy2nplFMm--

--azLSSi2pvb7k4AHmq0szb48ikED4nqMnt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl4ge1IACgkQ9AfbAGHV
z0Bp2ggAp+Z7ms1a7qag3cxwqOEDEN5slE43yretasjuGBrVfyPKq8w82pQOzBLK
mkNcxx7jc40LsVGZnQI42atkfWz4cydQ1s4ZMZpxcTT6hoU7eodfqykggWdgYgv2
gtrgUZaR5whuoF+sd5Hs2+DA6raZsftNxL9O5qibTtqd+HmZ4ksaa8+q15F8szMN
vehtP011xxMBFIDi4wQf/eumhaK6ZoBBh1g1ndCdXCjYmmdQjRpwwoplQFYbU63I
0mfDmxXl7AkXHkiiSTHRu4vzB3oeNqajeEsigC8qs4pqxTZeuTRvCPrkNe4pXN37
i5A1lzNvXc+wTcDlGFYAMWz7FYJX1w==
=6gZg
-----END PGP SIGNATURE-----

--azLSSi2pvb7k4AHmq0szb48ikED4nqMnt--


