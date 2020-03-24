Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C21913FE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 16:16:37 +0100 (CET)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGlIC-0000pK-Sa
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 11:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jGlEJ-0003ii-J9
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:12:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jGlEI-0005xq-2c
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:12:35 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:37742)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jGlEH-0005vs-P0
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585062751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XVRI+0TaVkGSXoxGYRPK4jgkzwvM7P7yrtyi91Xapf8=;
 b=Ic1n9KRFXQ252/L0BOkXCgegC3aqXeXbHsPIOlhg8EVEb+xyjueuAAtFtQMpKXzjfymAS7
 9/m6TY/FGlZt5v0/7jiWW0bwvmAPUrz5Q5pJOzVLIkwSnhIHi+XDD04PWBTlKr9ztt15DS
 cQx/dyn2WnxiNBvHSC7OCm+MP+h8LjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95--M9lljIeNhSQdyoGV9LVtg-1; Tue, 24 Mar 2020 11:12:28 -0400
X-MC-Unique: -M9lljIeNhSQdyoGV9LVtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D981A1360;
 Tue, 24 Mar 2020 15:12:27 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-213.ams2.redhat.com
 [10.36.114.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62D6560BF3;
 Tue, 24 Mar 2020 15:12:24 +0000 (UTC)
Subject: Re: [PATCH v8 07/11] iotests: limit line length to 79 chars
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20200317004105.27059-1-jsnow@redhat.com>
 <20200317004105.27059-8-jsnow@redhat.com>
 <dcc1f8fa-2916-4241-b213-5ddf0ed62c34@redhat.com>
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
Message-ID: <2f230c22-bd4b-ded5-27a9-1971efea0ec3@redhat.com>
Date: Tue, 24 Mar 2020 16:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <dcc1f8fa-2916-4241-b213-5ddf0ed62c34@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="r8upjIegqRpxbzSOcgLVSPuSsU8132QV7"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 philmd@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--r8upjIegqRpxbzSOcgLVSPuSsU8132QV7
Content-Type: multipart/mixed; boundary="AWgbCxGh2oPHEFXbBICLWStbnVevmOCRX"

--AWgbCxGh2oPHEFXbBICLWStbnVevmOCRX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 24.03.20 16:02, Max Reitz wrote:
> On 17.03.20 01:41, John Snow wrote:
>> 79 is the PEP8 recommendation. This recommendation works well for
>> reading patch diffs in TUI email clients.
>=20
> Also for my very GUI-y diff program (kompare).
>=20
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  tests/qemu-iotests/iotests.py | 64 +++++++++++++++++++++++------------
>>  tests/qemu-iotests/pylintrc   |  6 +++-
>>  2 files changed, 47 insertions(+), 23 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.=
py
>> index 3d90fb157d..75fd697d77 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>=20
> [...]
>=20
>> @@ -529,11 +539,13 @@ def pause_drive(self, drive, event=3DNone):
>>              self.pause_drive(drive, "write_aio")
>>              return
>>          self.qmp('human-monitor-command',
>> -                 command_line=3D'qemu-io %s "break %s bp_%s"' % (drive,=
 event, drive))
>> +                 command_line=3D'qemu-io %s "break %s bp_%s"'
>> +                 % (drive, event, drive))
>=20
> Can we put this value in a variable instead?  I don=E2=80=99t like the %
> aligning with the parameter name instead of the string value.  (I also
> don=E2=80=99t like how there are no spaces around the assignment =3D, but=
 around
> the %, even though the % binds more strongly.)
>=20
>> =20
>>      def resume_drive(self, drive):
>>          self.qmp('human-monitor-command',
>> -                 command_line=3D'qemu-io %s "remove_break bp_%s"' % (dr=
ive, drive))
>> +                 command_line=3D'qemu-io %s "remove_break bp_%s"'
>> +                 % (drive, drive))
>> =20
>>      def hmp_qemu_io(self, drive, cmd):
>>          '''Write to a given drive using an HMP command'''
>> @@ -793,16 +805,18 @@ def dictpath(self, d, path):
>>                  idx =3D int(idx)
>> =20
>>              if not isinstance(d, dict) or component not in d:
>> -                self.fail('failed path traversal for "%s" in "%s"' % (p=
ath, str(d)))
>> +                self.fail(f'failed path traversal for "{path}" in "{d}"=
')
>=20
> Do we require 3.6 so that f-strings are guaranteed to work?  (I thought
> we didn=E2=80=99t.  I=E2=80=99d be happy to use them.)

Oh.  Of course we do.  It says so in this file that this whole series is
about.

Max


--AWgbCxGh2oPHEFXbBICLWStbnVevmOCRX--

--r8upjIegqRpxbzSOcgLVSPuSsU8132QV7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl56I1YACgkQ9AfbAGHV
z0CM4Qf9FkwZFN9SCQscD1Uu0jw/CUuvjFNfdvJdOUkmep64HaxA62z57mPg72sh
TWxGfR7B77gjbP4a/6z1epWw1001wehvKzu/RQCnCKky5HJ4S+xfo5PT1RIYwhUO
6I6tHMrI2BMAJbeQaoUeECLGCTO1ctVhsMPWxfCTmzzKG5CvO7ViiQN833BxNnyU
hf8kwWB+oEPDIboCMYe5Lf7odnLtW/1ZzSIf401mr4KXIU1pZrEF8GfJO9rRTbsN
BGHhh31MImEpdRrej0ZNoqPnA/RH8oqMCC/FwFzDpwp7bgDjSiveCq5U862WhD8B
Gb0bdaE6B3Dlor7zO7NbEPNKDbbWKQ==
=AIOP
-----END PGP SIGNATURE-----

--r8upjIegqRpxbzSOcgLVSPuSsU8132QV7--


