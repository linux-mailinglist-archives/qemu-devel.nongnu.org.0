Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294C396B6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 22:20:51 +0200 (CEST)
Received: from localhost ([::1]:52834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZLM2-000886-ID
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 16:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58972)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hZK5O-0004JK-G5
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 14:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hZK5K-0001Nn-00
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 14:59:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60496)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1hZK5G-0001KQ-Ua; Fri, 07 Jun 2019 14:59:28 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0C8EF2F8BE2;
 Fri,  7 Jun 2019 18:59:14 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7384419733;
 Fri,  7 Jun 2019 18:58:59 +0000 (UTC)
Date: Fri, 7 Jun 2019 15:58:57 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Message-ID: <20190607185857.GD22416@habkost.net>
References: <20190117185628.21862-1-crosa@redhat.com>
 <20190117185628.21862-16-crosa@redhat.com>
 <b235e7a9-57ad-5547-b8ca-693159820a8f@redhat.com>
 <e63a4ea3-e9ff-4920-cdfa-14bf04b5b08c@redhat.com>
 <84aa43ba-df19-51f6-e14d-fb82a7f2dfcc@redhat.com>
 <a638e504-f7ad-fa3a-f198-c3878cfc560e@redhat.com>
 <20190607032648.GA22416@habkost.net>
 <20190607034214.GB22416@habkost.net>
 <20190607154432.GA10275@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190607154432.GA10275@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 07 Jun 2019 18:59:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 15/18] Boot Linux Console Test: add a test
 for aarch64 + virt
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Stefan Markovic <smarkovic@wavecomp.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-s390x@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Caio Carrara <ccarrara@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing Daniel, who wrote commit 6ab3fc32ea64.

On Fri, Jun 07, 2019 at 11:44:32AM -0400, Cleber Rosa wrote:
> On Fri, Jun 07, 2019 at 12:42:14AM -0300, Eduardo Habkost wrote:
> > On Fri, Jun 07, 2019 at 12:26:48AM -0300, Eduardo Habkost wrote:
> > > On Fri, Feb 01, 2019 at 11:10:31AM -0500, Cleber Rosa wrote:
> > > >=20
> > > >=20
> > > > On 1/31/19 4:26 PM, Cleber Rosa wrote:
> > > > >=20
> > > > >=20
> > > > > On 1/31/19 3:21 PM, Cleber Rosa wrote:
> > > > >>
> > > > >>
> > > > >> On 1/31/19 3:02 PM, Wainer dos Santos Moschetta wrote:
> > > > >>>
> > > > >>> On 01/17/2019 04:56 PM, Cleber Rosa wrote:
> > > > >>>> Just like the previous tests, boots a Linux kernel on a aarc=
h64 target
> > > > >>>> using the virt machine.
> > > > >>>>
> > > > >>>> One special option added is the CPU type, given that the ker=
nel
> > > > >>>> selected fails to boot on the virt machine's default CPU (co=
rtex-a15).
> > > > >>>>
> > > > >>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > > > >>>> ---
> > > > >>>> =A0 .travis.yml=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +-
> > > > >>>> =A0 tests/acceptance/boot_linux_console.py | 20 ++++++++++++=
++++++++
> > > > >>>> =A0 2 files changed, 21 insertions(+), 1 deletion(-)
> > > > >>>>
> > > > >>>> diff --git a/.travis.yml b/.travis.yml
> > > > >>>> index 54100eea5a..595e8c0b6c 100644
> > > > >>>> --- a/.travis.yml
> > > > >>>> +++ b/.travis.yml
> > > > >>>> @@ -187,7 +187,7 @@ matrix:
> > > > >>>> =A0 =A0=A0=A0=A0=A0 # Acceptance (Functional) tests
> > > > >>>> =A0=A0=A0=A0=A0 - env:
> > > > >>>> -=A0=A0=A0=A0=A0=A0=A0 - CONFIG=3D"--python=3D/usr/bin/pytho=
n3
> > > > >>>> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu=
,ppc64-softmmu"
> > > > >>>> +=A0=A0=A0=A0=A0=A0=A0 - CONFIG=3D"--python=3D/usr/bin/pytho=
n3
> > > > >>>> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu=
,ppc64-softmmu,aarch64-softmmu"
> > > > >>>>
> > > > >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 - TEST_CMD=3D"make check-accepta=
nce"
> > > > >>>> =A0=A0=A0=A0=A0=A0=A0 addons:
> > > > >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 apt:
> > > > >>>> diff --git a/tests/acceptance/boot_linux_console.py
> > > > >>>> b/tests/acceptance/boot_linux_console.py
> > > > >>>> index f3ccd23a7a..107700b517 100644
> > > > >>>> --- a/tests/acceptance/boot_linux_console.py
> > > > >>>> +++ b/tests/acceptance/boot_linux_console.py
> > > > >>>> @@ -138,3 +138,23 @@ class BootLinuxConsole(Test):
> > > > >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 self.vm.launch()
> > > > >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 console_pattern =3D 'Kernel comm=
and line: %s' %
> > > > >>>> kernel_command_line
> > > > >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 self.wait_for_console_pattern(co=
nsole_pattern)
> > > > >>>> +
> > > > >>>> +=A0=A0=A0 def test_aarch64_virt(self):
> > > > >>>
> > > > >>> That test case fails on my system (Fedora 29 x86_64). Avocado=
 seems
> > > > >>> unable to kill the VM so it=A0 reaches the timeout.
> > > > >>>
> > > > >>> I compiled QEMU with default configuration:
> > > > >>>
> > > > >>> $ configure --python=3D/usr/bin/python3 --target-list=3Dx86_6=
4-softmmu
> > > > >>> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,=
ppc64-softmmu,aarch64-softmmu)
> > > > >>>
> > > > >>>
> > > > >>> Follows a snippet of the Avocado's job.log file:
> > > > >>> ----
> > > > >>> 2019-01-31 14:41:34,912 test=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 L0602 INFO | START
> > > > >>> 07-/root/src/qemu/tests/acceptance/boot_linux_console.py:Boot=
LinuxConsole.test_aarch64_virt
> > > > >>>
> > > > >>> 2019-01-31 14:41:34,912 test=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 L0298 DEBUG| DATA
> > > > >>> (filename=3Doutput.expected) =3D> NOT FOUND (data sources: va=
riant, test, file)
> > > > >>> 2019-01-31 14:41:34,913 parameters=A0=A0=A0=A0=A0=A0 L0146 DE=
BUG| PARAMS (key=3Darch,
> > > > >>> path=3D*, default=3Daarch64) =3D> 'aarch64'
> > > > >>> 2019-01-31 14:41:34,913 parameters=A0=A0=A0=A0=A0=A0 L0146 DE=
BUG| PARAMS
> > > > >>> (key=3Dqemu_bin, path=3D*, default=3Daarch64-softmmu/qemu-sys=
tem-aarch64) =3D>
> > > > >>> 'aarch64-softmmu/qemu-system-aarch64'
> > > > >>> 2019-01-31 14:41:34,915 download=A0=A0=A0=A0=A0=A0=A0=A0 L007=
0 INFO | Fetching
> > > > >>> https://sjc.edge.kernel.org/fedora-buffet/fedora/linux/releas=
es/29/Server/aarch64/os/images/pxeboot/vmlinuz
> > > > >>> -> /var/lib/avocado/data/cache/by_name/vmlinuz.3upct2pr
> > > > >>> 2019-01-31 14:41:35,490 download=A0=A0=A0=A0=A0=A0=A0=A0 L005=
4 DEBUG| Retrieved URL
> > > > >>> "https://sjc.edge.kernel.org/fedora-buffet/fedora/linux/relea=
ses/29/Server/aarch64/os/images/pxeboot/vmlinuz":
> > > > >>> content-length 8623423, date: "Thu, 31 Jan 2019 19:41:35 GMT"=
,
> > > > >>> last-modified: "Sun, 21 Oct 2018 00:43:09 GMT"
> > > > >>> 2019-01-31 14:41:41,765 qemu=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 L0317 DEBUG| VM launch command:
> > > > >>> 'aarch64-softmmu/qemu-system-aarch64 -chardev
> > > > >>> socket,id=3Dmon,path=3D/var/tmp/tmpizirkcud/qemu-32609-monito=
r.sock -mon
> > > > >>> chardev=3Dmon,mode=3Dcontrol -display none -vga none -machine=
 virt -chardev
> > > > >>> socket,id=3Dconsole,path=3D/var/tmp/tmpizirkcud/qemu-32609-co=
nsole.sock,server,nowait
> > > > >>> -serial chardev:console -cpu cortex-a53 -kernel
> > > > >>> /var/lib/avocado/data/cache/by_name/vmlinuz -append console=3D=
ttyAMA0'
> > > > >>> 2019-01-31 14:41:41,779 qmp=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 L0167 DEBUG| >>> {'execute':
> > > > >>> 'qmp_capabilities'}
> > > > >>> 2019-01-31 14:41:41,931 qmp=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 L0175 DEBUG| <<< {'return': {}}
> > > > >>> 2019-01-31 14:41:42,830 boot_linux_conso L0041 DEBUG| [=A0=A0=
=A0 0.000000]
> > > > >>> Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> > > > >>>
> > > > >>> (...)
> > > > >>>
> > > > >>> 2019-01-31 14:41:42,833 boot_linux_conso L0041 DEBUG| [=A0=A0=
=A0 0.000000]
> > > > >>> Policy zone: DMA32
> > > > >>> 2019-01-31 14:41:42,833 boot_linux_conso L0041 DEBUG| [=A0=A0=
=A0 0.000000]
> > > > >>> Kernel command line: console=3DttyAMA0
> > > > >>> 2019-01-31 14:41:42,833 qmp=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 L0167 DEBUG| >>> {'execute':
> > > > >>> 'quit'}
> > > > >>
> > > > >> Here, a QMP response like "<<< {'return': {}}" would be expect=
ed.
> > > > >>
> > > > >> Since I can not reproduce this on my system (or on Travis-CI j=
obs I've
> > > > >> sent), can you tell me on top of which commit you've applied t=
hese patches?
> > > > >>
> > > > >=20
> > > > > I spoke too soon:
> > > > >=20
> > > > > https://travis-ci.org/clebergnu/qemu/jobs/487121425#L3033
> > > > >=20
> > > > > This looks like a recent regression, and I'm guessing it's not =
on the
> > > > > test's side.  I'll try to bisect it and let you know.
> > > > >=20
> > > >=20
> > > > On a fresh environment, I am able to get this reproduced on every=
 2 of
> > > > runs, more or less.  When I hit it, I attached GDB to it, and the
> > > > backtrace shows:
> > > >=20
> > > > Thread debugging using libthread_db enabled]
> > > > Using host libthread_db library "/lib64/libthread_db.so.1".
> > > > warning: Loadable section ".note.gnu.property" outside of ELF seg=
ments
> > > > warning: Loadable section ".note.gnu.property" outside of ELF seg=
ments
> > > > __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevell=
ock.S:103
> > > > 103     2:      movl    %edx, %eax
> > > > (gdb) bt
> > > > #0  __lll_lock_wait () at
> > > > ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:103
> > > > #1  0x00007fc6ba1a2e09 in __GI___pthread_mutex_lock
> > > > (mutex=3Dmutex@entry=3D0x5615a233d020 <qemu_global_mutex>) at
> > > > ../nptl/pthread_mutex_lock.c:80
> > > > #2  0x00005615a1bb7593 in qemu_mutex_lock_impl (mutex=3D0x5615a23=
3d020
> > > > <qemu_global_mutex>, file=3D0x5615a1db2d4c "util/main-loop.c", li=
ne=3D236)
> > > > at util/qemu-thread-posix.c:66
> > > > #3  0x00005615a171125e in qemu_mutex_lock_iothread_impl
> > > > (file=3Dfile@entry=3D0x5615a1db2d4c "util/main-loop.c", line=3Dli=
ne@entry=3D236)
> > > > at /home/cleber/src/qemu/cpus.c:1849
> > > > #4  0x00005615a1bb415d in os_host_main_loop_wait (timeout=3D<opti=
mized
> > > > out>) at util/main-loop.c:236
> > > > #5  main_loop_wait (nonblocking=3D<optimized out>) at util/main-l=
oop.c:497
> > > > #6  0x00005615a18fdd39 in main_loop () at vl.c:1928
> > > > #7  0x00005615a16c9ee9 in main (argc=3D<optimized out>, argv=3D<o=
ptimized
> > > > out>, envp=3D<optimized out>) at vl.c:4665
> > >=20
> > > Tip: run "thread apply all bt" so you can get a backtrace of all
> > > threads.
> > >=20
> > >=20
> > > >=20
> > > > Running it with `taskset -c 1` prevents this issue from happening=
, which
> > > > AFAICT, contributes even further towards this being a QEMU race c=
ondition.
> > > >=20
> > > > I'm CC'ing Peter and Claudio (listed maintainers of aarch64), as =
this
> > > > seems to limited to that target.  Any tips on what to do here?
> > >=20
> > > I am hitting this on Travis, too, and I finally could reproduce
> > > it locally,
> > >=20
> > > The guest is still writing on the serial console, but nobody is
> > > reading the data on the other side.  A VCPU thread is stuck
> > > inside the EAGAIN/nanosleep loop at qemu_chr_write_buffer(),
> > > holding the QEMU global lock.
> >=20
> > Experimental fix below.
> >=20
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  python/qemu/__init__.py | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/python/qemu/__init__.py b/python/qemu/__init__.py
> > index 81d9657ec0..4a691f34da 100644
> > --- a/python/qemu/__init__.py
> > +++ b/python/qemu/__init__.py
> > @@ -274,10 +274,6 @@ class QEMUMachine(object):
> > =20
> >          self._qemu_log_path =3D None
> > =20
> > -        if self._console_socket is not None:
> > -            self._console_socket.close()
> > -            self._console_socket =3D None
> > -
> >          if self._temp_dir is not None:
> >              shutil.rmtree(self._temp_dir)
> >              self._temp_dir =3D None
> > @@ -336,6 +332,14 @@ class QEMUMachine(object):
> >          """
> >          Terminate the VM and clean up
> >          """
> > +
> > +        # If we keep the console socket open, we may deadlock waitin=
g
> > +        # for QEMU to exit, while QEMU is waiting for the socket to
> > +        # become writeable.
> > +        if self._console_socket is not None:
> > +            self._console_socket.close()
> > +            self._console_socket =3D None
> > +
>=20
> Right, this is somewhat equivalent to the following "workaround":
>=20
>    https://github.com/clebergnu/qemu/commit/e1713f3b91972ad57c089f276c5=
4db3f3fa63423
>=20
> I could not tell at the moment, though, if closing (or shutting down)
> the console socket was the appropriate fix.
>=20
> What I see is that Rick's commit pointed to by Lazlo is dated from
> 2016, and it says that a virtio-console fix is necessary.  I'd imagine
> that, if a fix was ever proposed, it'd have been incorporated in the
> F29 kernel used in this test... and that this workaround/fix would
> not be the best solution.

If I understood this correctly, fixing the guest driver wouldn't
help here.  The commit mentioned by Laszlo (6ab3fc32ea64 "hw:
replace most use of qemu_chr_fe_write with qemu_chr_fe_write_all")
fixes data loss bugs but introduces the potential for deadlocks
like the one we are seeing.

Unless we replace the existing ~30 qemu_chr_fe_write_all() calls
in device code, we need to make sure we are constantly reading
data from the console socket.

>=20
> But, I'm mostly attempting to navigate this using my senses , few hard
> data and even less background :).
>=20
> Regards,
> - Cleber.
>=20
> >          if self.is_running():
> >              try:
> >                  self._qmp.cmd('quit')
> > --=20
> > 2.18.0.rc1.1.g3f1ff2140
> >=20
> > --=20
> > Eduardo

--=20
Eduardo

