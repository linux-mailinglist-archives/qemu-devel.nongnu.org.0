Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5494FF193D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 15:59:39 +0100 (CET)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSMmY-0004lJ-3G
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 09:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iSMlH-0003wk-MF
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:58:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iSMlE-0008OC-VE
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:58:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27205
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iSMlE-0008KY-M3
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573052295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ICgj0CgVMdb6xHe7XDcADkrIFoubx/ymuu7DycFH5m8=;
 b=JV3/gcqoUXtXWkVSglUMevgmQHQtSuiJdCFp9Sgibu08VGN4q3J3dn1Qm47Wfv0LgmQCEc
 fv7odhKdYsHuWtiQjlS97PdU8LPe5amOdy0YtpoSJGVOOe98lHCxTO4AdrQ8bb4GkMWj3t
 OD7G+ZnCPIVvlFNAsZSY4WkPrpmkSy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-NpcRUwodPCmVXLYRQeiRfQ-1; Wed, 06 Nov 2019 09:58:14 -0500
X-MC-Unique: NpcRUwodPCmVXLYRQeiRfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 792A28017DD;
 Wed,  6 Nov 2019 14:58:13 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3676106F;
 Wed,  6 Nov 2019 14:58:01 +0000 (UTC)
Date: Wed, 6 Nov 2019 15:58:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [RFC PATCH 00/18] Add qemu-storage-daemon
Message-ID: <20191106145800.GC7548@dhcp-200-226.str.redhat.com>
References: <20191017130204.16131-1-kwolf@redhat.com>
 <8a9a5eae-d388-867b-f4a1-080e876389b3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8a9a5eae-d388-867b-f4a1-080e876389b3@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline
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
Cc: pkrempa@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 06.11.2019 um 15:37 hat Max Reitz geschrieben:
> On 17.10.19 15:01, Kevin Wolf wrote:
> > This series adds a new tool 'qemu-storage-daemon', which can be used to
> > export and perform operations on block devices.
>=20
> Looks good to me.
>=20
> I remember a discussion at some KVM Forum a couple of years ago where
> someone (Berto?) was asking about adding QMP to qemu-nbd.  I found it a
> pragmatic solution, but I remember that Markus was against it, based on
> the fact that we wanted qemu -M none.

Yes, but it turned out that qemu -M none is a bit too heavyweight in
practice and fixing that would involve a lot of work. As I understand it
(mostly what I took from discussions on the list), even if someone were
interested in doing that and started now, it's the kind of thing that
would take multiple years.

As long as we keep the code simple and the interesting parts are just
reused and shared with the system emulator and other tools, it shouldn't
be hard to maintain.

> Well, but anyway.  Just as I didn=E2=80=99t have anything against adding =
QMP to
> qemu-nbd, I don=E2=80=99t have anything against adding a new application =
that
> kind of fulfills the same purpose.  And I think introducing a new
> application instead of reusing qemu-nbd that focuses on all-around QAPI
> compatibility (which qemu-nbd decidedly does not have) makes sense.

Yes, QAPI is one big reason for creating a new tool that doesn't need to
support the old qemu-nbd command line. Another is that we can add other
types of exports that are not NBD.

> The only thing I don=E2=80=99t like is the name, but that=E2=80=99s what =
<Tab> is for.
> :-)

I'm open for suggestions, but I thought 'qsd' was a bit too terse. :-)

(Actually, maybe we could even pick something that doesn't mention
storage or block? After all, it can do all kinds of QEMU backends in
theory. Not sure if there's any standalone use for them, but who
knows...)

Kevin

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdwt94AAoJEH8JsnLIjy/WRgQQAKbuuPi0DOlZNa73bBu3ChdL
GffBKc+up8nuRUBliHYX3R6c1jSaeV5Er0WIdi+KJChNpbXrkF7atV+l9Usva6js
T9z+WJ9EArxvromE7fJstWEvrossOWp7dhuDMDRRCOWp2UBSAkePDRmm592O3TGz
Qxkiw9xWGADycxHUphsl0CWj7M8cVVlFfZCnJRZWPMXDDQp74xVucGStPjjZgvFj
Alp8GsaaVbaQid+RCdzoHHAFV+ZbE7vJnv5/CL3rZmAjnvQ7Y532k6KCmlCElSS2
udbAFEFF4T218YdOmwImkKra7wnSruz1AVkE3dWPmkiwbzb8dRZxnMgkPYEw6DYI
1MfztBc0UdFNeug2IIOhQhAiBBOn4/eDBaYwVM5Cst2qw5qXrGw+C8G7P6dCzyJN
fSg7TgIsknCivuz7qsavPnCTPXz5p24CJdoe1a7k46+wotiA7u/F84xPLe4550am
N4s6F/OwU527Uih3sxTGu6Ap1WJjZ2tnVsRvjuaXpU6am+NggbeGMkqZiqe78RGV
uilyws7OSx/yEFfdJEeaXEShulNOW/bab0Rv2M+x2yua5uX1V8S3pzUJvoXz6J+5
fJTkhiO9nznxJoWENPPeORKHr5Pc1lsZe5aRtT3pm0ZpASmjFNTBwOxsD0iIU0ds
d9WUdIVlN4pe7itJOIAy
=gE6C
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--


