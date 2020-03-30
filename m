Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF8197BF1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 14:35:29 +0200 (CEST)
Received: from localhost ([::1]:49010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jItdY-0001fZ-O6
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 08:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jItcb-000117-G7
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jItca-0005SQ-Hy
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:34:29 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:55592)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jItca-0005SA-DL
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585571668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LUe5Mvvz39wH+RQkiuVAKBAwH4VPp/JHOcbuXJJOSaQ=;
 b=AvzZgY1or4BkSbGuinBDUAZyUjXSmFgDsSidIR7G1WRhIK9WD4Ss7blV0RZJX+uMMgsowE
 MN++b7deu2Sn/GczlV5q+E+64WvAGf0I13MLPCqmwcFFLNq2x13Z1ngdf9XE3UKKuZ9Lvt
 fFXPVKJG8MpE2pkM/GihyQWdG6Ve+bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-1ksZdV1oO929p0bBi56-lg-1; Mon, 30 Mar 2020 08:34:26 -0400
X-MC-Unique: 1ksZdV1oO929p0bBi56-lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0671B107ACC9;
 Mon, 30 Mar 2020 12:34:25 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-93.ams2.redhat.com
 [10.36.113.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A21EC5DF2A;
 Mon, 30 Mar 2020 12:34:22 +0000 (UTC)
Subject: Re: [PATCH v9 09/14] iotests: limit line length to 79 chars
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20200324232103.4195-1-jsnow@redhat.com>
 <20200324232103.4195-10-jsnow@redhat.com>
 <9cbad981-3c63-c0d7-48e6-a0785d25be30@redhat.com>
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
Message-ID: <193a5d86-570f-595a-aab4-981873345aaf@redhat.com>
Date: Mon, 30 Mar 2020 14:34:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9cbad981-3c63-c0d7-48e6-a0785d25be30@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1KH40an0ivYPPrIU3E7ilegmN8kp8nY4W"
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
 armbru@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1KH40an0ivYPPrIU3E7ilegmN8kp8nY4W
Content-Type: multipart/mixed; boundary="qx2jWUoH9c147390EU8JzVJmLPcHdKdVK"

--qx2jWUoH9c147390EU8JzVJmLPcHdKdVK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 30.03.20 14:31, Max Reitz wrote:
> On 25.03.20 00:20, John Snow wrote:
>> 79 is the PEP8 recommendation. This recommendation works well for
>> reading patch diffs in TUI email clients.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  tests/qemu-iotests/iotests.py | 64 +++++++++++++++++++++++------------
>>  tests/qemu-iotests/pylintrc   |  6 +++-
>>  2 files changed, 47 insertions(+), 23 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.=
py
>> index 3a049ece5b..e12d6e533e 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>=20
> [...]
>=20
>> @@ -537,11 +547,13 @@ def pause_drive(self, drive, event=3DNone):
>>              self.pause_drive(drive, "write_aio")
>>              return
>>          self.qmp('human-monitor-command',
>> -                 command_line=3D'qemu-io %s "break %s bp_%s"' % (drive,=
 event, drive))
>> +                 command_line=3D'qemu-io %s "break %s bp_%s"'
>> +                 % (drive, event, drive))
>> =20
>>      def resume_drive(self, drive):
>>          self.qmp('human-monitor-command',
>> -                 command_line=3D'qemu-io %s "remove_break bp_%s"' % (dr=
ive, drive))
>> +                 command_line=3D'qemu-io %s "remove_break bp_%s"'
>> +                 % (drive, drive))
>=20
> Hm.  You didn=E2=80=99t reply on my (second, insisting) question on what =
stops
> us from introducing a variable here (hmp_cmd =3D 'qemu-io %s ...' % ...;
> self.qmp('human-monitor-command', command_line=3Dhmp_cmd)).
>=20
> :c

Ah!  The next patch is there to address my whining.

c:

Reviewed-by: Max Reitz <mreitz@redhat.com>


--qx2jWUoH9c147390EU8JzVJmLPcHdKdVK--

--1KH40an0ivYPPrIU3E7ilegmN8kp8nY4W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6B50wACgkQ9AfbAGHV
z0BEZwgAmPUA2kXFLfvDZ488Dr10w0AzuJMVkUtUm/O9+Xg6boORZaCEXDpc5xFv
C0UYp6St1aXz6f68lVhsGmdsZL0/wQ5JnV6zS5o6S3D80skcMJzIAhXZ5LmThhfh
JpZMSGy/LMfM5B/Omg12pvQPwXg+1xm4e0JFoMK05cWabVCp6UOGzFdBmqYN4n/W
WKUDxhSKNdbHnIHypgk4yX8KEUmlWUj0NLxRH/xbx1hIo6VDVsYgdUobZS52FEr6
uzek3/rZWOZs/UNPYKMdguQ29XADHthV6pRiJPZ5J9gk7eQ3KNO62Gybts6tGASy
UIq68v+JvXKu6t9cFCC5FNZ0sdT/4A==
=1pCX
-----END PGP SIGNATURE-----

--1KH40an0ivYPPrIU3E7ilegmN8kp8nY4W--


