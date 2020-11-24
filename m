Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764172C26AF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:02:09 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXxQ-00083r-78
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quentin.grolleau@ovhcloud.com>)
 id 1khXuY-0006RK-HY
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:59:10 -0500
Received: from 10.mo301.mail-out.ovh.net ([137.74.110.73]:60266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quentin.grolleau@ovhcloud.com>)
 id 1khXuS-0006mm-PL
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:59:10 -0500
Received: from EX2.OVH.local (gw2.corp.ovh.com [51.255.55.227])
 by mo301.mail-out.ovh.net (Postfix) with ESMTPS id 286F57FF5B;
 Tue, 24 Nov 2020 13:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ovhcloud.com;
 s=mailout; t=1606222734;
 bh=cV819cRFLlguEGAIWTIRA2voHL0BhLQYYsXokY0VszE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UVK20x2I3Q1XdZoN8bIf+BTQfTgGUrrK5KsImgCqvB7wA95nZV26qRqWYmw3eTNA6
 PiAQ/kKxp61OrErPm82NSm3VduZ0bYKuob7Cvsd3A+E3nuoh9vcuoOGUg80z+XmjSW
 NyIHi4NlWWyJ6fpqCbOBSSy0v1eFDyFFx+mormuQ=
Received: from DAGFR7EX1.OVH.local (172.16.2.20) by EX2.OVH.local (172.16.2.2)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Tue, 24
 Nov 2020 13:58:53 +0100
Received: from DAGFR7EX2.OVH.local (172.16.2.21) by DAGFR7EX1.OVH.local
 (172.16.2.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.721.2; Tue, 24 Nov 2020
 13:58:53 +0100
Received: from DAGFR7EX2.OVH.local ([fe80::81c3:c718:13b4:fd11]) by
 DAGFR7EX2.OVH.local ([fe80::81c3:c718:13b4:fd11%3]) with mapi id
 15.02.0721.003; Tue, 24 Nov 2020 13:58:53 +0100
From: Quentin Grolleau <quentin.grolleau@ovhcloud.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: RE: [raw] Guest stuck during live live-migration
Thread-Topic: [raw] Guest stuck during live live-migration
Thread-Index: AQHWwXs6AGfiafuLa06oUseJIin6S6nVk7cAgAAij70=
Date: Tue, 24 Nov 2020 12:58:53 +0000
Message-ID: <7113e11c65da4711969c178c5b425bbe@ovhcloud.com>
References: <e6f25c7e67ce4cfea5e01e4e46f0a3d8@ovhcloud.com>,
 <20201123122526.GC5317@merkur.fritz.box>
In-Reply-To: <20201123122526.GC5317@merkur.fritz.box>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [109.190.254.58]
x-ovh-corplimit-skip: true
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Ovh-Tracer-Id: 256142231308123712
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufhtfffkfhgjihgtgfggsehtqhhjtddttddunecuhfhrohhmpefsuhgvnhhtihhnucfirhholhhlvggruhcuoehquhgvnhhtihhnrdhgrhholhhlvggruhesohhvhhgtlhhouhgurdgtohhmqeenucggtffrrghtthgvrhhnpeduudeitdfhffdvgfdvhfdtveeikeehleefieetveegieekveffiefgtdeggfduheenucffohhmrghinhepghhnuhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpddutdelrdduledtrddvheegrdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopefgigdvrdfqggfjrdhlohgtrghlpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehquhgvnhhtihhnrdhgrhholhhlvggruhesohhvhhgtlhhouhgurdgtohhmpdhrtghpthhtohepkhifohhlfhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=137.74.110.73;
 envelope-from=quentin.grolleau@ovhcloud.com; helo=10.mo301.mail-out.ovh.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Kevin,=20

> > Hello,
> >
> > In our company, we are hosting a large number of Vm, hosted behind Open=
stack (so libvirt/qemu).
> > A large majority of our Vms are runnign with local data only, stored on=
 NVME, and most of them are RAW disks.
> >
> > With Qemu 4.0 (can be even with older version) we see strange  live-mig=
ration comportement:

> First of all, 4.0 is relatively old. Generally it is worth retrying with
> the most recent code (git master or 5.2.0-rc2) before having a closer
> look at problems, because it is frustrating to spend considerable time
> debugging an issue and then find out it has already been fixed a year
> ago.

> I will try to build it the most recent code


I will try to build with the most recent code, but it will take me some tim=
e to do it


> >     - some Vms live migrate at very high speed without issue (> 6 Gbps)
> >     - some Vms are running correctly, but migrating at a strange low sp=
eed (3Gbps)
> >     - some Vms are migrating at a very low speed (1Gbps, sometime less)=
 and during the migration the guest is completely I/O stuck
> >
> > When this issue happen the VM is completly block, iostat in the Vm show=
 us a latency of 30 secs

> Can you get the stack backtraces of all QEMU threads while the VM is
> blocked (e.g. with gdb or pstack)?

(gdb) thread apply all bt                                                  =
  =20
                                                                           =
                                                                 =20
Thread 20 (Thread 0x7f8a0effd700 (LWP 201248)):                            =
                                                                           =
                                                                           =
                          =20
#0  pthread_cond_wait@@GLIBC_2.3.2 () at ../sysdeps/unix/sysv/linux/x86_64/=
pthread_cond_wait.S:185                                                    =
                                                                          =
=20
#1  0x000056520139878b in qemu_cond_wait_impl (cond=3D0x5652020f27b0, mutex=
=3D0x5652020f27e8, file=3D0x5652014e4178 "/root/qemu_debug_LSEEK/qemu_debug=
/qemu/ui/vnc-jobs.c", line=3D214) at /root/qemu_debug_LSEEK/qemu_debug/qemu=
/util/qemu-thread-posix.c:161
#2  0x00005652012a264d in vnc_worker_thread_loop (queue=3Dqueue@entry=3D0x5=
652020f27b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c:214   =
                                                                           =
                              =20
#3  0x00005652012a2c18 in vnc_worker_thread (arg=3Darg@entry=3D0x5652020f27=
b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c:324            =
                                                                           =
   =20
#4  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#5  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a0effd700) at pthread_cr=
eate.c:333                                                 =20
#6  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109                                                     =20
                                                                           =
       =20
Thread 19 (Thread 0x7f8a0ffff700 (LWP 201222)):                            =
       =20
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x565202354480) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089          =
                                                                           =
                              =20
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2354480) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281             =
                                                                           =
   =20
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a0ffff700) at pthread_cr=
eate.c:333                                                 =20
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109                                                     =20
                                                                           =
       =20
Thread 18 (Thread 0x7f8a2cff9700 (LWP 201221)):                            =
       =20
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x565202331320) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089          =
                                                                           =
                              =20
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2331320) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281             =
                                                                           =
   =20
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2cff9700) at pthread_cr=
eate.c:333                                                 =20
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109                                                     =20
                                                                           =
       =20
Thread 17 (Thread 0x7f8a2d7fa700 (LWP 201220)):                            =
       =20
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x56520230e1c0) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089          =
                                                                           =
                 =20
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
230e1c0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281             =
                                                                 =20
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=20
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2d7fa700) at pthread_cr=
eate.c:333                                                                 =
                                                                          =
=20
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 16 (Thread 0x7f8a2dffb700 (LWP 201219)):                            =
                                                                           =
                                                         =20
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135                                                                        =
                                                                           =
                       =20
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80     =
                                                 =20
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652022ea870) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089=20
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
22ea870) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2dffb700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 15 (Thread 0x7f8a2e7fc700 (LWP 201218)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652022c7710) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
22c7710) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2e7fc700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 14 (Thread 0x7f8a2effd700 (LWP 201217)):
---Type <return> to continue, or q <return> to quit---
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652022a45b0) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
22a45b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2effd700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 13 (Thread 0x7f8a2f7fe700 (LWP 201216)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x565202281450) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2281450) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2f7fe700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 12 (Thread 0x7f8a2ffff700 (LWP 201214)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x56520225e2f0) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
225e2f0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2ffff700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 11 (Thread 0x7f8a50ff9700 (LWP 201213)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013c54c0 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/exec.c", line=3D3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qe=
mu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013c54c0 "/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c", line=3Dl=
ine@entry=3D3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
#4  0x0000565200f3a9a1 in prepare_mmio_access (mr=3D0x565202db4c10, mr=3D0x=
565202db4c10) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3243
#5  0x0000565200f3fe0f in flatview_read_continue (fv=3Dfv@entry=3D0x7f8a340=
34250, addr=3Daddr@entry=3D49222, attrs=3Dattrs@entry=3D..., buf=3D<optimiz=
ed out>, buf@entry=3D0x7f8a6329a000 "", len=3Dlen@entry=3D2, addr1=3D6, l=
=3D2, mr=3D0x565202db4c10)
    at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3338
#6  0x0000565200f40003 in flatview_read (fv=3D0x7f8a34034250, addr=3D49222,=
 attrs=3D..., buf=3D0x7f8a6329a000 "", len=3D2) at /root/qemu_debug_LSEEK/q=
emu_debug/qemu/exec.c:3378
#7  0x0000565200f4011b in address_space_read_full (as=3D<optimized out>, ad=
dr=3Daddr@entry=3D49222, attrs=3D..., buf=3Dbuf@entry=3D0x7f8a6329a000 "", =
len=3Dlen@entry=3D2) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3391
#8  0x0000565200f4023a in address_space_rw (as=3D<optimized out>, addr=3Dad=
dr@entry=3D49222, attrs=3D..., attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f8a6=
329a000 "", len=3Dlen@entry=3D2, is_write=3Dis_write@entry=3Dfalse) at /roo=
t/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3421
#9  0x0000565200fa7d9b in kvm_handle_io (count=3D1, size=3D2, direction=3D<=
optimized out>, data=3D<optimized out>, attrs=3D..., port=3D49222) at /root=
/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:1778
#10 kvm_cpu_exec (cpu=3Dcpu@entry=3D0x56520223b1d0) at /root/qemu_debug_LSE=
EK/qemu_debug/qemu/accel/kvm/kvm-all.c:2024
#11 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
223b1d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#12 0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#13 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a50ff9700) at pthread_cr=
eate.c:333
#14 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 10 (Thread 0x7f8a517fa700 (LWP 201212)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x565202217c30) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2217c30) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a517fa700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 9 (Thread 0x7f8a51ffb700 (LWP 201211)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
---Type <return> to continue, or q <return> to quit---
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652021f4ad0) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
21f4ad0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a51ffb700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 8 (Thread 0x7f8a527fc700 (LWP 201210)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652021d1970) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
21d1970) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a527fc700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 7 (Thread 0x7f8a52ffd700 (LWP 201208)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652021ae630) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
21ae630) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a52ffd700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 6 (Thread 0x7f8a537fe700 (LWP 201207)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x56520218b4d0) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
218b4d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a537fe700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 5 (Thread 0x7f8a53fff700 (LWP 201206)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/accel/kvm/kvm-all.c", line=3D2089) at /root/qemu_debug_LSEEK/qemu_debug=
/qemu/util/qemu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013d7c68 "/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all=
.c", line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cp=
us.c:1850
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x565202167a50) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2167a50) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a53fff700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 4 (Thread 0x7f8a58fc0700 (LWP 201204)):
#0  __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
135
#1  0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@entry=3D=
0x565201adb680 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
#2  0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680 <qem=
u_global_mutex>, file=3D0x5652013c54c0 "/root/qemu_debug_LSEEK/qemu_debug/q=
emu/exec.c", line=3D3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qe=
mu-thread-posix.c:66
#3  0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@entry=
=3D0x5652013c54c0 "/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c", line=3Dl=
ine@entry=3D3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1850
#4  0x0000565200f3a9a1 in prepare_mmio_access (mr=3D0x56520307d930, mr=3D0x=
56520307d930) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3243
#5  0x0000565200f3fe0f in flatview_read_continue (fv=3Dfv@entry=3D0x7f8a340=
75e00, addr=3Daddr@entry=3D4261433344, attrs=3Dattrs@entry=3D..., buf=3D<op=
timized out>, buf@entry=3D0x7f8a633ee028 "\002", len=3Dlen@entry=3D1, addr1=
=3D0, l=3D1, mr=3D0x56520307d930)
    at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3338
#6  0x0000565200f40003 in flatview_read (fv=3D0x7f8a34075e00, addr=3D426143=
3344, attrs=3D..., buf=3D0x7f8a633ee028 "\002", len=3D1) at /root/qemu_debu=
g_LSEEK/qemu_debug/qemu/exec.c:3378
#7  0x0000565200f4011b in address_space_read_full (as=3D<optimized out>, ad=
dr=3D<optimized out>, attrs=3D..., buf=3Dbuf@entry=3D0x7f8a633ee028 "\002",=
 len=3D<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:33=
91
#8  0x0000565200f4023a in address_space_rw (as=3D<optimized out>, addr=3D<o=
ptimized out>, attrs=3D..., attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f8a633e=
e028 "\002", len=3D<optimized out>, is_write=3D<optimized out>) at /root/qe=
mu_debug_LSEEK/qemu_debug/qemu/exec.c:3421
#9  0x0000565200fa7cf8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x565202119100) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2034
#10 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2119100) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#11 0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#12 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a58fc0700) at pthread_cr=
eate.c:333
#13 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109
---Type <return> to continue, or q <return> to quit---

Thread 3 (Thread 0x7f8a597c1700 (LWP 201203)):
#0  0x00007f8a5df7474d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f8a6234138c in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f8a62341712 in g_main_loop_run () from /lib/x86_64-linux-gnu/lib=
glib-2.0.so.0
#3  0x00005652010aa3b1 in iothread_run (opaque=3Dopaque@entry=3D0x565202108=
420) at /root/qemu_debug_LSEEK/qemu_debug/qemu/iothread.c:82
#4  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#5  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a597c1700) at pthread_cr=
eate.c:333
#6  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 2 (Thread 0x7f8a5a903700 (LWP 201196)):
#0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
#1  0x0000565201398caf in qemu_futex_wait (val=3D<optimized out>, f=3D<opti=
mized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/include/qemu/futex.h:=
29
#2  qemu_event_wait (ev=3Dev@entry=3D0x565201b2da88 <rcu_call_ready_event>)=
 at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:442
#3  0x00005652013a9868 in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at =
/root/qemu_debug_LSEEK/qemu_debug/qemu/util/rcu.c:261
#4  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#5  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a5a903700) at pthread_cr=
eate.c:333
#6  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 1 (Thread 0x7f8a633acbc0 (LWP 201184)):
#0  0x00007f8a5e253b67 in lseek64 () at ../sysdeps/unix/syscall-template.S:=
84
#1  0x0000565201301278 in find_allocation (bs=3D0x565202109ca0, hole=3D<syn=
thetic pointer>, data=3D<synthetic pointer>, start=3D5738856448) at /root/q=
emu_debug_LSEEK/qemu_debug/qemu/block/file-posix.c:2427
#2  raw_co_block_status (bs=3D0x565202109ca0, want_zero=3D<optimized out>, =
offset=3D5738856448, bytes=3D15728640, pnum=3D0x7f7b529e9f20, map=3D0x7f7b5=
29e9ca0, file=3D0x7f7b529e9ca8) at /root/qemu_debug_LSEEK/qemu_debug/qemu/b=
lock/file-posix.c:2490
#3  0x00005652013078b3 in bdrv_co_block_status (bs=3D0x565202109ca0, want_z=
ero=3Dwant_zero@entry=3Dtrue, offset=3D5738856448, bytes=3D15728640, pnum=
=3Dpnum@entry=3D0x7f7b529e9f20, map=3Dmap@entry=3D0x7f7b529e9d50, file=3D0x=
7f7b529e9d58)
    at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2110
#4  0x00005652013079c7 in bdrv_co_block_status (bs=3Dbs@entry=3D0x565202102=
640, want_zero=3Dwant_zero@entry=3Dtrue, offset=3Doffset@entry=3D5738856448=
, bytes=3Dbytes@entry=3D15728640, pnum=3Dpnum@entry=3D0x7f7b529e9f20, map=
=3Dmap@entry=3D0x0, file=3D0x0)
    at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2134
#5  0x0000565201307c14 in bdrv_co_block_status_above (file=3D0x0, map=3D0x0=
, pnum=3D0x7f7b529e9f20, bytes=3D15728640, offset=3D5738856448, want_zero=
=3Dtrue, base=3D0x0, bs=3D<optimized out>) at /root/qemu_debug_LSEEK/qemu_d=
ebug/qemu/block/io.c:2212
#6  bdrv_block_status_above_co_entry (opaque=3D0x7f7b529e9e20) at /root/qem=
u_debug_LSEEK/qemu_debug/qemu/block/io.c:2242
#7  0x0000565201308198 in bdrv_common_block_status_above (bs=3Dbs@entry=3D0=
x565202102640, base=3Dbase@entry=3D0x0, want_zero=3Dwant_zero@entry=3Dtrue,=
 offset=3Doffset@entry=3D5738856448, bytes=3D<optimized out>, pnum=3Dpnum@e=
ntry=3D0x7f7b529e9f20, map=3D0x0, file=3D0x0)
    at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2277
#8  0x000056520130918d in bdrv_block_status_above (bs=3Dbs@entry=3D0x565202=
102640, base=3Dbase@entry=3D0x0, offset=3Doffset@entry=3D5738856448, bytes=
=3D<optimized out>, pnum=3Dpnum@entry=3D0x7f7b529e9f20, map=3Dmap@entry=3D0=
x0, file=3D0x0)
    at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2290
#9  0x00005652013057c0 in mirror_iteration (s=3D0x565202fd66a0) at /root/qe=
mu_debug_LSEEK/qemu_debug/qemu/block/mirror.c:526
#10 mirror_run (job=3D0x565202fd66a0, errp=3D<optimized out>) at /root/qemu=
_debug_LSEEK/qemu_debug/qemu/block/mirror.c:968
#11 0x00005652012b913f in job_co_entry (opaque=3D0x565202fd66a0) at /root/q=
emu_debug_LSEEK/qemu_debug/qemu/job.c:889
#12 0x00005652013aafca in coroutine_trampoline (i0=3D<optimized out>, i1=3D=
<optimized out>) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/coroutine-u=
context.c:116
#13 0x00007f8a5dec35d0 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#14 0x00007ffff4114730 in ?? ()
#15 0x0000000000000000 in ?? ()


> > First we thought it was related to an hardware issue we check it, we co=
mparing different hardware, but no issue where found there
> >=20
> > So one of my colleague had the idea to limit with "tc" the bandwidth on=
 the interface the migration was done, and it worked the VM didn't lose any=
 ping nor being  I/O  stuck
> > Important point : Once the Vm have been migrate (with the limitation ) =
one time, if we migrate it again right after, the migration will be done at=
 full speed (8-9Gb/s) without freezing the Vm

> Since you say you're using local storage, I assume that you're doing
> both a VM live migration and storage migration at the same time. These
> are separate connections, storage is migrated using a NBD connection.

> Did you limit the bandwith for both connections, or if it was just one
> of them, which one was it?

Yes we are doing a live migration and a storage migration (pre-copy)
We limit the bandwith for both connections but when the disk have finish to=
 migrate we can remove the bandwith limitation
for the memory transfert and it go up to the maximum speed and with no free=
ze

> > It only happen on existing VM, we tried to replicate with a fresh insta=
nce with exactly the same spec and nothing was happening
> >=20
> > We tried to replicate the workload inside the VM but there was no way t=
o replicate the case. So it was not related to the workload nor to the serv=
er that hosts the Vm
> >=20
> > So we thought about the disk of the instance : the raw file.
> >=20
> > We also tried to strace -c the process during the live-migration and it=
 was doing a lot of "lseek"
> >=20
> > and we found this :
> > https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00462.html

> This case is different in that it used qcow2 (which should behave much
> better today).

> It also used ZFS, which you didn't mention. Is the problematic image
> stored on ZFS? If not, which filesystem is it?

You are right this is not exactly the same case and we are not storing the =
problematic image on ZFS but on Ext4

> So i rebuilt Qemu with this patch and the live-migration went well, at hi=
gh speed and with no VM freeze
> ( https://github.com/qemu/qemu/blob/master/block/file-posix.c#L2601 )
>=20
> Do you have a way to avoid the "lseek" mechanism as it consumes more reso=
urces to find the holes in the disk and don't let any for the VM ?

> If you can provide the stack trace during the hang, we might be able to
> tell why we're even trying to find holes.

> Please also provide your QEMU command line.

Here the qemu command line :

/usr/bin/qemu-system-x86_64 \
-name guest=3Dinstance-0034d494,debug-threads=3Don \
-S \
-object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/do=
main-9-instance-0034d494/master-key.aes \
-machine pc-i440fx-bionic,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff \
-cpu Broadwell-IBRS,md-clear=3Don,vmx=3Don \
-m 60000 \
-overcommit mem-lock=3Doff \
-smp 16,sockets=3D16,cores=3D1,threads=3D1 \
-uuid b959a460-84b0-4280-b851-96755027622b \
-smbios 'type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenStack N=
ova,version=3D14.1.1,serial=3D5b429103-2856-154f-1caf-5ffb5694cdc3,uuid=3Db=
959a460-84b0-4280-b851-96755027622b,family=3DVirtual Machine' \
-no-user-config \
-nodefaults \
-chardev socket,id=3Dcharmonitor,fd=3D28,server,nowait \
-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
-rtc base=3Dutc,driftfix=3Dslew \
-global kvm-pit.lost_tick_policy=3Ddelay \
-no-hpet \
-no-shutdown \
-boot strict=3Don \
-device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \
-drive file=3D/home/instances/b959a460-84b0-4280-b851-96755027622b/disk,for=
mat=3Draw,if=3Dnone,id=3Ddrive-virtio-disk0,cache=3Dnone,discard=3Dunmap,ai=
o=3Dnative,throttling.iops-total=3D80000 \
-device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x3,drive=3Ddrive-virt=
io-disk0,id=3Dvirtio-disk0,bootindex=3D1,write-cache=3Don \
-add-fd set=3D1,fd=3D31 \
-chardev file,id=3Dcharserial0,path=3D/dev/fdset/1,append=3Don \
-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
-chardev pty,id=3Dcharserial1 \
-device isa-serial,chardev=3Dcharserial1,id=3Dserial1 \
-device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 \
-vnc 10.224.27.81:0 \
-device cirrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 \
-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x4 \
-s \
-sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcec=
ontrol=3Ddeny \
-msg timestamp=3Don


> At the moment, my assumption is that this is during a mirror block job
> which is migrating the disk to your destination server. Not looking for
> holes would mean that a sparse source file would become fully allocated
> on the destination, which is usually not wanted (also we would
> potentially transfer a lot more data over the networkj).

The vm disk is already fully allocated, so in this case it doesn't change.

> Can you give us a snippet from your strace that shows the individual
> lseek syscalls? Depending on which ranges are queried, maybe we could
> optimise things by caching the previous result.

Here the strace during the block migration :

strace -c -p 32571
strace: Process 32571 attached
^Cstrace: Process 32571 detached
% time    seconds usecs/call    calls   errors syscall
94.15  13.754159       2503     5495          lseek
 3.47   0.507101         91     5549          sendmsg
 1.60   0.233516         84     2769          io_submit
 0.40   0.057817         11     5496          setsockopt
 0.18   0.025747          4     5730      184 recvmsg
 0.16   0.023560          6     4259          write
 0.02   0.002575          6      408          read
 0.02   0.002425          9      266       35 futex
 0.01   0.002136         12      184          ppoll
 0.00   0.000184         12       16          poll
 0.00   0.000038         38        1          clone
 0.00   0.000032         16        2          rt_sigprocmask
 0.00   0.000013         13        1          ioctl
100.00  14.609303                30176      219 total

> Also, a final remark, I know of some cases (on XFS) where lseeks were
> slow because the image file was heavily fragmented. Defragmenting the
> file resolved the problem, so this may be another thing to try.

> On XFS, newer QEMU versions set an extent size hint on newly created
> image files (during qemu-img create), which can reduce fragmentation
> considerably.

> Kevin

> Server hosting the VM :
>     - Bi-Xeon hosts With NVME storage and 10 Go Network card
>     - Qemu 4.0 And Libvirt 5.4
>     - Kernel 4.18.0.25
>=20
> Guest having the issue :
>     - raw image with Debian 8
>=20
> Here the qemu img on the disk :
> > qemu-img info disk
> image: disk
> file format: raw
> virtual size: 400G (429496729600 bytes)
> disk size: 400G
>=20
>=20
> Quentin GROLLEAU
> =

