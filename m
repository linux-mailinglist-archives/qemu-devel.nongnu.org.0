Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E65172944
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 21:10:23 +0100 (CET)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7PUE-0004R5-PM
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 15:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1j7PTM-0003vB-0w
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 15:09:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1j7PTK-0000eV-Hi
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 15:09:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41679
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1j7PTK-0000dn-EO
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 15:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582834165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pvd4aSgOe6ddTrJuLZDObahl+QYE4sUHQVvmF0SsGqE=;
 b=StVy6jVXLGibdlE+o+kMhdJ7N6FtNY4p3jELxWnhgnSN6nNY4bOvmAIh+nlvBGwypFScGF
 m9mcu6f47pZN3UewzJ1rggi/45RydgnrSDwnfM3kRYU+nCvDAoYcZxo/ViajowNpQkGuMd
 PPuGxdIm2G8FgY30HwyfM0NAZlShNjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-TQXqgbjUPwOvSqoYSxV_Ew-1; Thu, 27 Feb 2020 15:09:15 -0500
X-MC-Unique: TQXqgbjUPwOvSqoYSxV_Ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A14621005512;
 Thu, 27 Feb 2020 20:09:13 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34D5660BE0;
 Thu, 27 Feb 2020 20:09:13 +0000 (UTC)
Date: Thu, 27 Feb 2020 15:09:12 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: ping Re: [PATCH for-5.0 v2 0/3] benchmark util
Message-ID: <20200227200912.GE4440@habkost.net>
References: <20191126154848.193407-1-vsementsov@virtuozzo.com>
 <e1efd3d2-b623-292b-67a9-e3cdd479f104@virtuozzo.com>
 <fca8ced2-b3c6-74db-0d70-11ac3304b273@virtuozzo.com>
 <1ae79aad-5405-cf95-1401-e93191e94033@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <1ae79aad-5405-cf95-1401-e93191e94033@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, stefanha@gmail.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, crosa@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, this is due to lack of bandwidth of maintainers who can
review those patches.

I have one suggestion: if you make your script self-contained
inside a scripts/ subdirectory, it would be simpler to merge it
without detailed reviews from others.

The python/ subdirectory is supposed to appear on sys.path, so
maybe simplebench.py and qemu/bench_block_job.py can stay there,
but bench-example.py is not a loadable Python module and
shouldn't be there.

I see two possible options:

a) Moving everything to a scripts/simplebench subdirectory.
b) Moving only bench-example.py to scripts/, and do the sys.path
   hacking the other scripts do.

On either case, please add your name to MAINTAINERS as the
maintainer of those new files.


On Thu, Feb 27, 2020 at 04:18:00PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Hi!
>=20
> Is problem in "S: Odd fixes" in Python section of MAINTAINERS?
>=20
> Will it be correct, if I send a patch to MAINTAINERS, proposing
> myself as maintainer of Python scripts and s/Odd fixes/Maintained/ ?
>=20
> And then just send pull request with this series, as "nobody minds"?
>=20
> 08.02.2020 13:36, Vladimir Sementsov-Ogievskiy wrote:
> > pingg..
> >=20
> > Hi! Could it be merged at all?
> >=20
> > 20.01.2020 12:10, Vladimir Sementsov-Ogievskiy wrote:
> > > ping
> > >=20
> > > 26.11.2019 18:48, Vladimir Sementsov-Ogievskiy wrote:
> > > > Hi all!
> > > >=20
> > > > Here is simple benchmarking utility, to generate performance
> > > > comparison tables, like the following:
> > > >=20
> > > > ----------=A0 -------------=A0 -------------=A0 -------------
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 backup-1=A0=A0=A0=A0=A0=A0 bac=
kup-2=A0=A0=A0=A0=A0=A0 mirror
> > > > ssd -> ssd=A0 0.43 +- 0.00=A0=A0 4.48 +- 0.06=A0=A0 4.38 +- 0.02
> > > > ssd -> hdd=A0 10.60 +- 0.08=A0 10.69 +- 0.18=A0 10.57 +- 0.05
> > > > ssd -> nbd=A0 33.81 +- 0.37=A0 10.67 +- 0.17=A0 10.07 +- 0.07
> > > > ----------=A0 -------------=A0 -------------=A0 -------------
> > > >=20
> > > > This is a v2, as v1 was inside
> > > > =A0 "[RFC 00/24] backup performance: block_status + async"
> > > >=20
> > > > I'll use this benchmark in other series, hope someone
> > > > will like it.
> > > >=20
> > > > Vladimir Sementsov-Ogievskiy (3):
> > > > =A0=A0 python: add simplebench.py
> > > > =A0=A0 python: add qemu/bench_block_job.py
> > > > =A0=A0 python: add example usage of simplebench
> > > >=20
> > > > =A0 python/bench-example.py=A0=A0=A0=A0=A0=A0=A0 |=A0 80 ++++++++++=
+++++++++++
> > > > =A0 python/qemu/bench_block_job.py | 115 ++++++++++++++++++++++++++=
+++
> > > > =A0 python/simplebench.py=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 128 ++++++++=
+++++++++++++++++++++++++
> > > > =A0 3 files changed, 323 insertions(+)
> > > > =A0 create mode 100644 python/bench-example.py
> > > > =A0 create mode 100755 python/qemu/bench_block_job.py
> > > > =A0 create mode 100644 python/simplebench.py
> > > >=20
> > >=20
> > >=20
> >=20
> >=20
>=20
>=20
> --=20
> Best regards,
> Vladimir
>=20

--=20
Eduardo


