Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB8126F5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 06:44:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMQ3j-0004p5-Ek
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 00:44:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hMQ2g-0004V4-O0
	for qemu-devel@nongnu.org; Fri, 03 May 2019 00:43:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hMQ2f-0007fO-Nf
	for qemu-devel@nongnu.org; Fri, 03 May 2019 00:43:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hMQ2d-0007dv-E0; Fri, 03 May 2019 00:43:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B08B73082E8E;
	Fri,  3 May 2019 04:43:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C34CE1001DEF;
	Fri,  3 May 2019 04:43:19 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <e3e75fd5-661e-95ab-d7d6-f9a7bf6548d4@redhat.com>
	<316d5b3f-d25a-6f9d-6d28-a91f7d2bc22e@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <d2a3e561-8f17-8d97-3396-e275f0262cf2@redhat.com>
Date: Fri, 3 May 2019 06:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <316d5b3f-d25a-6f9d-6d28-a91f7d2bc22e@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="J5DIB8I5de95q2y7MIyLNEDAkbm6DzUQI"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 03 May 2019 04:43:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Failing QEMU iotest 221
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J5DIB8I5de95q2y7MIyLNEDAkbm6DzUQI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03/05/2019 00.02, Eric Blake wrote:
> On 4/28/19 10:21 AM, Thomas Huth wrote:
>> QEMU iotest 221 is failing for me, too, when I run it with -raw:
>=20
> Which filesystem?

ext4 again.

$ stat -f /home/thuth/tmp/qemu-build/tests/qemu-iotests/
  File: "/home/thuth/tmp/qemu-build/tests/qemu-iotests/"
    ID: 1e68b4a412e09716 Namelen: 255     Type: ext2/ext3
Block size: 1024       Fundamental block size: 1024

Maybe the "check" script should report the output of "stat -f", too?

>> tests/qemu-iotests$ ./check -raw 221
>> QEMU          -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../=
x86_64-softmmu/qemu-system-x86_64" -nodefaults -machine accel=3Dqtest
>> QEMU_IMG      -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../=
qemu-img"=20
>> QEMU_IO       -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../=
qemu-io"  --cache writeback -f raw
>> QEMU_NBD      -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../=
qemu-nbd"=20
>> IMGFMT        -- raw
>> IMGPROTO      -- file
>> PLATFORM      -- Linux/x86_64 thuth 3.10.0-957.10.1.el7.x86_64
>> TEST_DIR      -- /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch=

>> SOCKET_SCM_HELPER -- /home/thuth/tmp/qemu-build/tests/qemu-iotests/soc=
ket_scm_helper
>>
>> 221         - output mismatch (see 221.out.bad)
>> --- /home/thuth/devel/qemu/tests/qemu-iotests/221.out	2019-04-23 16:43=
:12.000000000 +0200
>> +++ /home/thuth/tmp/qemu-build/tests/qemu-iotests/221.out.bad	2019-04-=
28 17:18:52.000000000 +0200
>> @@ -7,10 +7,10 @@
>>  [{ "start": 0, "length": 43520, "depth": 0, "zero": true, "data": fal=
se, "offset": OFFSET}]
>>  wrote 1/1 bytes at offset 43008
>>  1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>> -[{ "start": 0, "length": 40960, "depth": 0, "zero": true, "data": fal=
se, "offset": OFFSET},
>> -{ "start": 40960, "length": 2049, "depth": 0, "zero": false, "data": =
true, "offset": OFFSET},
>> +[{ "start": 0, "length": 43008, "depth": 0, "zero": true, "data": fal=
se, "offset": OFFSET},
>> +{ "start": 43008, "length": 1, "depth": 0, "zero": false, "data": tru=
e, "offset": OFFSET},
>=20
> Ugh. Hole granularities are file-system specific, so we need to figure
> out some way to fuzz the input. It might also be possible to pick nicer=

> size numbers - perhaps if the test image is sized at 64k+1 instead of
> 43009 (84*512, but NOT evenly divisible by 4k), the +1 byte is more
> likely to be directly one a hole boundary, rather than being somewhere
> that causes rounding the hole boundary 2k earlier because of 4k or 64k
> sizing constraints.

Ok ... sounds like that's definitely something I'd like to leave to you
or one of the block guys to fix.

 Thomas


--J5DIB8I5de95q2y7MIyLNEDAkbm6DzUQI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJcy8bmAAoJEC7Z13T+cC21xnIP/3qeFILC1W7KyGC+i+ZWrOGE
/akPatxVqFq+xZqOhfS4jML3IREtMpsi0taydA6s8SY3fds1jxuO0zhjg51B15DH
HWSB9p/jEywnMOIhBCBQr0DtvYHigVZOGXR5JPvl/mwokAgBaGAkp6FlvPludFMI
nxwqC5rLf17RsZqtr/n2DX1VXpfzUcSm8TlsKMAt5ebyzsZPgR0pwsvJUxxFNLJu
3JhSixqB99jaoEm4M/g92ep7/iDgnZGE17d3S8cCOl5lJHZ3HtmWkIBXeHfPP4NP
Vi54YiZ8snIIpCiynyk1cbpftzlkl2KUsg5MMjHxQ7AIP+QgqDiIbg1tgeQyiG7l
LkTexsndRoitZZSMO1Yb9cqaiYcxDC5RW6GywU1Frtc7LRgvoXAA1FUg7hlfhTin
9iZU1YNWH6V4mcylnZSN2CldmTwwqpz++65mDPsFvS1pTHh6oaTTQjScRa1r9FHz
hlnY2kLxevVjeTW2vXG6hkA7VmrBt0YRtl2lXKLyJGhXECaqwd7ui6fFumVlKcbg
N0WGpPmDlHa7buNyegUID9MBfFuB08dYglwVUXJzb9ri0aEuDbLIxzpFOT3B7ETl
NuVRnkVN3yBndndrz6lVj6HPwbYywPBw9AHGcZEL7Nb3Jzw+dSO9lG0b1s2OcSe5
TN3QqRoeSUnh4DdCvZG4
=pz3s
-----END PGP SIGNATURE-----

--J5DIB8I5de95q2y7MIyLNEDAkbm6DzUQI--

