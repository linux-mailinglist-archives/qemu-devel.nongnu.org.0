Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECCF27EF0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 16:00:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hToGF-0005Dp-9P
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 09:59:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hTo1w-00037O-5k
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hTo1u-0006TG-PK
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:45:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hTo1u-0006SJ-I3
	for qemu-devel@nongnu.org; Thu, 23 May 2019 09:45:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C37A17EBAE;
	Thu, 23 May 2019 13:45:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B511D5C69A;
	Thu, 23 May 2019 13:45:02 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 956EB1806B12;
	Thu, 23 May 2019 13:45:01 +0000 (UTC)
Date: Thu, 23 May 2019 09:45:01 -0400 (EDT)
From: Cleber Rosa <crosa@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Message-ID: <1094559891.24356881.1558619101528.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAL1e-=iW2honEgNfrsFoA0tU1wMq0mw5LuoRbWVmRDBMA22ELA@mail.gmail.com>
References: <20190520231910.12184-1-f4bug@amsat.org>
	<20190522211230.GA10764@habkost.net>
	<1711852617.24204010.1558561566547.JavaMail.zimbra@redhat.com>
	<CAL1e-=iW2honEgNfrsFoA0tU1wMq0mw5LuoRbWVmRDBMA22ELA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.36.116.137, 10.4.195.29]
Thread-Topic: mips: Add more Avocado tests
Thread-Index: qL03d4Fa+xRGiw5N1qPYZ47/U0zyvA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 23 May 2019 13:45:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/4] mips: Add more Avocado tests
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-devel@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Aleksandar Markovic" <aleksandar.m.mail@gmail.com>
> To: "Cleber Rosa" <crosa@redhat.com>
> Cc: "Wainer dos Santos Moschetta" <wainersm@redhat.com>, "Aleksandar Mark=
ovic" <amarkovic@wavecomp.com>,
> qemu-devel@nongnu.org, "Aleksandar Rikalo" <arikalo@wavecomp.com>, "Eduar=
do Habkost" <ehabkost@redhat.com>,
> "Aurelien Jarno" <aurelien@aurel32.net>, "Philippe Mathieu-Daud=C3=A9" <f=
4bug@amsat.org>
> Sent: Wednesday, May 22, 2019 6:43:54 PM
> Subject: Re: [Qemu-devel] [PATCH 0/4] mips: Add more Avocado tests
>=20
> On May 22, 2019 11:46 PM, "Cleber Rosa" <crosa@redhat.com> wrote:
> >
> >
> >
> > ----- Original Message -----
> > > From: "Eduardo Habkost" <ehabkost@redhat.com>
> > > To: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> > > Cc: qemu-devel@nongnu.org, "Aleksandar Rikalo" <arikalo@wavecomp.com>=
,
> "Aleksandar Markovic"
> > > <aleksandar.m.mail@gmail.com>, "Aleksandar Markovic" <
> amarkovic@wavecomp.com>, "Cleber Rosa" <crosa@redhat.com>,
> > > "Aurelien Jarno" <aurelien@aurel32.net>, "Wainer dos Santos Moschetta=
" <
> wainersm@redhat.com>
> > > Sent: Wednesday, May 22, 2019 5:12:30 PM
> > > Subject: Re: [Qemu-devel] [PATCH 0/4] mips: Add more Avocado tests
> > >
> > > On Tue, May 21, 2019 at 01:19:06AM +0200, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > Hi,
> > > >
> > > > It was a rainy week-end here, so I invested it to automatize some
> > > > of my MIPS tests.
> > > >
> > > > The BootLinuxSshTest is not Global warming friendly, it is not
> > > > meant to run on a CI system but rather on a workstation previous
> > > > to post a pull request.
> > > > It can surely be improved, but it is a good starting point.
> > >
> > > Until we actually have a mechanism to exclude the test case on
> > > travis-ci, I will remove patch 4/4 from the queue.  Aleksandar,
> > > please don't merge patch 4/4 yet or it will break travis-ci.
> > >
> > > Cleber, Wainer, is it already possible to make "avocado run" skip
> > > tests tagged with "slow"?
> > >
> >
> > The mechanism exists, but we haven't tagged any test so far as slow.
> >
>=20
> Cleber,
>=20
> For the test from patch 4/4, there is no dilemma - it should be in the
> =E2=80=9Cslow=E2=80=9D group, as Philippe envisioned and said, so that it=
 is not humpered
> with stricter requirements for =E2=80=9Cfast=E2=80=9D (default) group. Co=
uld you explain us
> how to do it, so that we can hopefully finally proceed?
>=20

Hi Aleksandar,

The point is that there's no "group" definition at this point.  This is the
core of the discussion.

I think we're close to converging to something simple and effective.  Pleas=
e
let us know what you think of the proposals given.

Thanks!
- Cleber.

> Gratefully,
> Aleksandar
>=20
> > Should we define/document a criteria for a test to be slow?  Given
> > that this is highly subjective, we have to think of:
> >
> >  * Will we consider the average or maximum run time (the timeout
> >    definition)?
> >
> >  * For a single test, what is "slow"? Some rough numbers from Travis
> >    CI[1] to help us with guidelines:
> >    - boot_linux_console.py:BootLinuxConsole.test_x86_64_pc:  PASS (6.04=
 s)
> >    - boot_linux_console.py:BootLinuxConsole.test_arm_virt:  PASS (2.91 =
s)
> >    -
> linux_initrd.py:LinuxInitrd.test_with_2gib_file_should_work_with_linux_v4=
_16:
> PASS (18.14 s)
> >    - boot_linux.py:BootLinuxAarch64.test_virt:  PASS (396.88 s)
> >
> >  * Do we want to set a maximum job timeout?  This way we can skip
> >    tests after a given amount of time has passed.  Currently we interru=
pt
> >    the test running when the job timeout is reached, but it's possible
> >    to add a option so that no new tests will be started, but currently
> >    running ones will be waited on.
> >
> > Regards,
> > - Cleber.
> >
> > [1] - https://travis-ci.org/clebergnu/qemu/jobs/535967210#L3518
> >
> > > --
> > > Eduardo
> > >
>=20

