Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2669FA68F9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 14:51:58 +0200 (CEST)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i58Ht-0001Tt-14
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 08:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i58Gi-0000tf-NA
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 08:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i58Gh-0003DK-95
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 08:50:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42660)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i58GX-0002qv-2Z; Tue, 03 Sep 2019 08:50:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6B17C04B940;
 Tue,  3 Sep 2019 12:50:29 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-98.brq.redhat.com
 [10.40.204.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 925621F5;
 Tue,  3 Sep 2019 12:50:28 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190827182313.25983-1-mreitz@redhat.com>
 <CAFEAcA-bt1GYfjUh0aRE6gwni1bzu8WJzNhbpQxrdc47ZYQkCg@mail.gmail.com>
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
Message-ID: <5bd7f7fc-ef4a-6fef-cc8d-0863b89cecec@redhat.com>
Date: Tue, 3 Sep 2019 14:50:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-bt1GYfjUh0aRE6gwni1bzu8WJzNhbpQxrdc47ZYQkCg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OaXIT5BzABAKPZszKWeJ35bHWDLZBPfM0"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 03 Sep 2019 12:50:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 00/15] Block patches
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OaXIT5BzABAKPZszKWeJ35bHWDLZBPfM0
Content-Type: multipart/mixed; boundary="9jtGy7GWmeZs0bEqZyuFPJdLhj6X8S6ca";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <5bd7f7fc-ef4a-6fef-cc8d-0863b89cecec@redhat.com>
Subject: Re: [PULL 00/15] Block patches
References: <20190827182313.25983-1-mreitz@redhat.com>
 <CAFEAcA-bt1GYfjUh0aRE6gwni1bzu8WJzNhbpQxrdc47ZYQkCg@mail.gmail.com>
In-Reply-To: <CAFEAcA-bt1GYfjUh0aRE6gwni1bzu8WJzNhbpQxrdc47ZYQkCg@mail.gmail.com>

--9jtGy7GWmeZs0bEqZyuFPJdLhj6X8S6ca
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03.09.19 10:39, Peter Maydell wrote:
> On Tue, 27 Aug 2019 at 19:23, Max Reitz <mreitz@redhat.com> wrote:
>>
>> The following changes since commit 23919ddfd56135cad3cb468a8f54d5a595f=
024f4:
>>
>>   Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20190827=
' into staging (2019-08-27 15:52:36 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/XanClic/qemu.git tags/pull-block-2019-08-27
>>
>> for you to fetch changes up to bb043c056cffcc2f3ce88bfdaf2e76e455c09e2=
c:
>>
>>   iotests: Unify cache mode quoting (2019-08-27 19:48:44 +0200)
>>
>> ----------------------------------------------------------------
>> Block patches:
>> - qemu-io now accepts a file to read a write pattern from
>> - Ensure that raw files have their first block allocated so we can pro=
be
>>   the O_DIRECT alignment if necessary
>> - Various fixes
>=20
> Fails make check running the iotests (on some platforms,
> including x86-64 Linux):
>=20
> Not run: 220
> Failures: 071 099 120 184 186
> Failed 5 of 105 tests
> /home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:1100:
> recipe for target 'check-tests/check-block.sh' failed
>=20
> The printed diff output for the failures generally looks like:
> --- /home/petmay01/linaro/qemu-for-merges/tests/qemu-iotests/071.out
>  2018-12-19 15:31:00.523062228 +0000
> +++ /home/petmay01/linaro/qemu-for-merges/build/all/tests/qemu-iotests/=
071.out.bad
>      2019-09-03 09:01:43.665180692 +0100
> @@ -1,4 +1,5 @@
>  QA output created by 071
> +Unable to init server: Could not connect: Connection refused

OK, I think I know which patch is to blame.  (The problem is probably
that you don=E2=80=99t have a $DISPLAY on your test machine.  Neither had=
 I
until a couple of weeks ago.,,)

(Well, I personally blame adding the iotests to make check, but, well.)

Max


--9jtGy7GWmeZs0bEqZyuFPJdLhj6X8S6ca--

--OaXIT5BzABAKPZszKWeJ35bHWDLZBPfM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1uYZIACgkQ9AfbAGHV
z0CwrQf+KaHMEBi73cVA8KD5cmbk7vFxGqxgyKIec7hSleT0HfSXoVtLcEmjLniN
Im4Y05nIq7SaQFeMdpUqtSVINPdf7hytCC4YqXt3Cc2bGNGKQL30YkEpXWZRuhQZ
u10sfKXTR1cCjdfGt82+v0z4hMLioCSEXqbEEfRrz48t+EzHtQ49iDxhiWZOTbaR
uN/7/ngr8MbRcbBDpL6tOK9BAUmlg6SmGtnKXr6B+S9RqOsdFNX7rZ6raiXbmV6I
0AeWidxTBUuo/R6Nn2xHZCvTMUGMQF1KbFhGmgiJz72IRa4JTArfPQ+sk08UKqcd
iRRY43OvJ6eTObQ76iJ/UNctHtad4g==
=t+Yd
-----END PGP SIGNATURE-----

--OaXIT5BzABAKPZszKWeJ35bHWDLZBPfM0--

