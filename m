Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B82CC070
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:13:01 +0100 (CET)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkToS-0006Z3-BD
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quentin.grolleau@ovhcloud.com>)
 id 1kkTlj-0004iy-Fa
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:10:11 -0500
Received: from 2.mo302.mail-out.ovh.net ([137.74.110.75]:53775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quentin.grolleau@ovhcloud.com>)
 id 1kkTlZ-0001SR-HI
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:10:11 -0500
Received: from EX2.OVH.local (gw2.corp.ovh.com [51.255.55.227])
 by mo302.mail-out.ovh.net (Postfix) with ESMTPS id 7344D5FE73;
 Wed,  2 Dec 2020 16:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ovhcloud.com;
 s=mailout; t=1606921790;
 bh=WfftBkfb6jSDb0miZQHs0N4Me1QmNND6zgMKqso9f34=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jsKmVrU+rXXWHZ/PKzic8IEU3JyrpQtnrBzwgXsiif35MgTjLpysxVEeikl8AeJvu
 5fM5zl9auSFJg6/V2+bB4CridlbB1al5rPh3j/jyEVEiv4Zw/blsImInYTwxKsaiCT
 cg+2MNqJbemd78xtomIlBN7W9uuM9pvPKa2ZQPNA=
Received: from DAGFR7EX2.OVH.local (172.16.2.21) by EX2.OVH.local (172.16.2.2)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Wed, 2 Dec
 2020 16:09:50 +0100
Received: from DAGFR7EX2.OVH.local (172.16.2.21) by DAGFR7EX2.OVH.local
 (172.16.2.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.721.2; Wed, 2 Dec 2020
 16:09:49 +0100
Received: from DAGFR7EX2.OVH.local ([fe80::81c3:c718:13b4:fd11]) by
 DAGFR7EX2.OVH.local ([fe80::81c3:c718:13b4:fd11%3]) with mapi id
 15.02.0721.003; Wed, 2 Dec 2020 16:09:49 +0100
From: Quentin Grolleau <quentin.grolleau@ovhcloud.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: RE: [raw] Guest stuck during live live-migration
Thread-Topic: [raw] Guest stuck during live live-migration
Thread-Index: AQHWwXs6AGfiafuLa06oUseJIin6S6nVk7cAgAAij72ADj8gVg==
Date: Wed, 2 Dec 2020 15:09:49 +0000
Message-ID: <5ac227512b50444bbb47f85404673c32@ovhcloud.com>
References: <e6f25c7e67ce4cfea5e01e4e46f0a3d8@ovhcloud.com>,
 <20201123122526.GC5317@merkur.fritz.box>,
 <7113e11c65da4711969c178c5b425bbe@ovhcloud.com>
In-Reply-To: <7113e11c65da4711969c178c5b425bbe@ovhcloud.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [109.190.254.58]
x-ovh-corplimit-skip: true
Content-Type: multipart/alternative;
 boundary="_000_5ac227512b50444bbb47f85404673c32ovhcloudcom_"
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12555472814054424072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeigedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufhtfffkfhgjihgtggesrgdtjhertddtudenucfhrhhomhepsfhuvghnthhinhcuifhrohhllhgvrghuuceoqhhuvghnthhinhdrghhrohhllhgvrghusehovhhhtghlohhuugdrtghomheqnecuggftrfgrthhtvghrnhepleeiudeufffgheekffdvleektdfffeeludeufefhfeeggeffjeeutdetudeitdelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhnuhdrohhrghenucfkpheptddrtddrtddrtddpuddtledrudeltddrvdehgedrheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepgfgivddrqfggjfdrlhhotggrlhdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepqhhuvghnthhinhdrghhrohhllhgvrghusehovhhhtghlohhuugdrtghomhdprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=137.74.110.75;
 envelope-from=quentin.grolleau@ovhcloud.com; helo=2.mo302.mail-out.ovh.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--_000_5ac227512b50444bbb47f85404673c32ovhcloudcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Do you think that, applying this patch ( replacing by "#if 0" there : https=
://github.com/qemu/qemu/blob/master/block/file-posix.c#L2601 ), could affec=
t for any reason the customer data ?

As we are on full NVME and 10G networks it should fix our vm which complete=
ly freeze.

Quentin


________________________________
De : Qemu-devel <qemu-devel-bounces+quentin.grolleau=3Dovhcloud.com@nongnu.=
org> de la part de Quentin Grolleau <quentin.grolleau@ovhcloud.com>
Envoy=E9 : mardi 24 novembre 2020 13:58:53
=C0 : Kevin Wolf
Cc : qemu-devel@nongnu.org; qemu-block@nongnu.org
Objet : RE: [raw] Guest stuck during live live-migration

Thanks Kevin,

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

(gdb) thread apply all bt

Thread 20 (Thread 0x7f8a0effd700 (LWP 201248)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at ../sysdeps/unix/sysv/linux/x86_64/=
pthread_cond_wait.S:185
#1  0x000056520139878b in qemu_cond_wait_impl (cond=3D0x5652020f27b0, mutex=
=3D0x5652020f27e8, file=3D0x5652014e4178 "/root/qemu_debug_LSEEK/qemu_debug=
/qemu/ui/vnc-jobs.c", line=3D214) at /root/qemu_debug_LSEEK/qemu_debug/qemu=
/util/qemu-thread-posix.c:161
#2  0x00005652012a264d in vnc_worker_thread_loop (queue=3Dqueue@entry=3D0x5=
652020f27b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c:214
#3  0x00005652012a2c18 in vnc_worker_thread (arg=3Darg@entry=3D0x5652020f27=
b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c:324
#4  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#5  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a0effd700) at pthread_cr=
eate.c:333
#6  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 19 (Thread 0x7f8a0ffff700 (LWP 201222)):
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
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2354480) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a0ffff700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 18 (Thread 0x7f8a2cff9700 (LWP 201221)):
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
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2331320) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2cff9700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 17 (Thread 0x7f8a2d7fa700 (LWP 201220)):
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
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
#5  0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
230e1c0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281
#6  0x0000565201398116 in qemu_thread_start (args=3D<optimized out>) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
#7  0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2d7fa700) at pthread_cr=
eate.c:333
#8  0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109

Thread 16 (Thread 0x7f8a2dffb700 (LWP 201219)):
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
#4  0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652022ea870) a=
t /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
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
> >
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
> >
> > We tried to replicate the workload inside the VM but there was no way t=
o replicate the case. So it was not related to the workload nor to the serv=
er that hosts the Vm
> >
> > So we thought about the disk of the instance : the raw file.
> >
> > We also tried to strace -c the process during the live-migration and it=
 was doing a lot of "lseek"
> >
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
>
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
>
> Guest having the issue :
>     - raw image with Debian 8
>
> Here the qemu img on the disk :
> > qemu-img info disk
> image: disk
> file format: raw
> virtual size: 400G (429496729600 bytes)
> disk size: 400G
>
>
> Quentin GROLLEAU
>

--_000_5ac227512b50444bbb47f85404673c32ovhcloudcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p></p>
<div><span>Do you think that, applying this patch ( replacing by &quot;#if =
0&quot; there :&nbsp;<a href=3D"https://github.com/qemu/qemu/blob/master/bl=
ock/file-posix.c#L2601" class=3D"x_OWAAutoLink" id=3D"LPlnk466463">https://=
github.com/qemu/qemu/blob/master/block/file-posix.c#L2601</a>
 ), could affect for any reason the customer data ?</span>
<p>As we are on full NVME and 10G networks it should fix our vm which compl=
etely freeze.</p>
<br>
</div>
<div>Quentin</div>
<br>
<p></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>De :</b> Qemu-devel &lt;qemu-=
devel-bounces&#43;quentin.grolleau=3Dovhcloud.com@nongnu.org&gt; de la part=
 de Quentin Grolleau &lt;quentin.grolleau@ovhcloud.com&gt;<br>
<b>Envoy=E9 :</b> mardi 24 novembre 2020 13:58:53<br>
<b>=C0 :</b> Kevin Wolf<br>
<b>Cc&nbsp;:</b> qemu-devel@nongnu.org; qemu-block@nongnu.org<br>
<b>Objet :</b> RE: [raw] Guest stuck during live live-migration</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Thanks Kevin, <br>
<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; In our company, we are hosting a large number of Vm, hosted behin=
d Openstack (so libvirt/qemu).<br>
&gt; &gt; A large majority of our Vms are runnign with local data only, sto=
red on NVME, and most of them are RAW disks.<br>
&gt; &gt;<br>
&gt; &gt; With Qemu 4.0 (can be even with older version) we see strange&nbs=
p; live-migration comportement:<br>
<br>
&gt; First of all, 4.0 is relatively old. Generally it is worth retrying wi=
th<br>
&gt; the most recent code (git master or 5.2.0-rc2) before having a closer<=
br>
&gt; look at problems, because it is frustrating to spend considerable time=
<br>
&gt; debugging an issue and then find out it has already been fixed a year<=
br>
&gt; ago.<br>
<br>
&gt; I will try to build it the most recent code<br>
<br>
<br>
I will try to build with the most recent code, but it will take me some tim=
e to do it<br>
<br>
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - some Vms live migrate at very high spee=
d without issue (&gt; 6 Gbps)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - some Vms are running correctly, but mig=
rating at a strange low speed (3Gbps)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - some Vms are migrating at a very low sp=
eed (1Gbps, sometime less) and during the migration the guest is completely=
 I/O stuck<br>
&gt; &gt;<br>
&gt; &gt; When this issue happen the VM is completly block, iostat in the V=
m show us a latency of 30 secs<br>
<br>
&gt; Can you get the stack backtraces of all QEMU threads while the VM is<b=
r>
&gt; blocked (e.g. with gdb or pstack)?<br>
<br>
(gdb) thread apply all bt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
<br>
Thread 20 (Thread 0x7f8a0effd700 (LWP 201248)):&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#0&nbsp; pthread_cond_wait@@GLIBC_2.3.2 () at ../sysdeps/unix/sysv/linux/x8=
6_64/pthread_cond_wait.S:185&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#1&nbsp; 0x000056520139878b in qemu_cond_wait_impl (cond=3D0x5652020f27b0, =
mutex=3D0x5652020f27e8, file=3D0x5652014e4178 &quot;/root/qemu_debug_LSEEK/=
qemu_debug/qemu/ui/vnc-jobs.c&quot;, line=3D214) at /root/qemu_debug_LSEEK/=
qemu_debug/qemu/util/qemu-thread-posix.c:161<br>
#2&nbsp; 0x00005652012a264d in vnc_worker_thread_loop (queue=3Dqueue@entry=
=3D0x5652020f27b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c:=
214&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#3&nbsp; 0x00005652012a2c18 in vnc_worker_thread (arg=3Darg@entry=3D0x56520=
20f27b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/ui/vnc-jobs.c:324&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
<br>
#4&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#5&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a0effd700) at pthre=
ad_create.c:333&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
<br>
#6&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
Thread 19 (Thread 0x7f8a0ffff700 (LWP 201222)):&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652023544=
80) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
565202354480) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a0ffff700) at pthre=
ad_create.c:333&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
Thread 18 (Thread 0x7f8a2cff9700 (LWP 201221)):&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652023313=
20) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
565202331320) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2cff9700) at pthre=
ad_create.c:333&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
Thread 17 (Thread 0x7f8a2d7fa700 (LWP 201220)):&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x56520230e1=
c0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
56520230e1c0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2d7fa700) at pthre=
ad_create.c:333&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 16 (Thread 0x7f8a2dffb700 (LWP 201219)):&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652022ea8=
70) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089
<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
5652022ea870) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2dffb700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 15 (Thread 0x7f8a2e7fc700 (LWP 201218)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652022c77=
10) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
5652022c7710) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2e7fc700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 14 (Thread 0x7f8a2effd700 (LWP 201217)):<br>
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652022a45=
b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
5652022a45b0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2effd700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 13 (Thread 0x7f8a2f7fe700 (LWP 201216)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652022814=
50) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
565202281450) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2f7fe700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 12 (Thread 0x7f8a2ffff700 (LWP 201214)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x56520225e2=
f0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
56520225e2f0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a2ffff700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 11 (Thread 0x7f8a50ff9700 (LWP 201213)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013c54c0 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/exec.c&quot;, line=3D3243) at /root/qemu_debug_LSEEK/qe=
mu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013c54c0 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c&q=
uot;, line=3Dline@entry=3D3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/c=
pus.c:1850<br>
#4&nbsp; 0x0000565200f3a9a1 in prepare_mmio_access (mr=3D0x565202db4c10, mr=
=3D0x565202db4c10) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3243<br=
>
#5&nbsp; 0x0000565200f3fe0f in flatview_read_continue (fv=3Dfv@entry=3D0x7f=
8a34034250, addr=3Daddr@entry=3D49222, attrs=3Dattrs@entry=3D..., buf=3D&lt=
;optimized out&gt;, buf@entry=3D0x7f8a6329a000 &quot;&quot;, len=3Dlen@entr=
y=3D2, addr1=3D6, l=3D2, mr=3D0x565202db4c10)<br>
&nbsp;&nbsp;&nbsp; at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3338<br=
>
#6&nbsp; 0x0000565200f40003 in flatview_read (fv=3D0x7f8a34034250, addr=3D4=
9222, attrs=3D..., buf=3D0x7f8a6329a000 &quot;&quot;, len=3D2) at /root/qem=
u_debug_LSEEK/qemu_debug/qemu/exec.c:3378<br>
#7&nbsp; 0x0000565200f4011b in address_space_read_full (as=3D&lt;optimized =
out&gt;, addr=3Daddr@entry=3D49222, attrs=3D..., buf=3Dbuf@entry=3D0x7f8a63=
29a000 &quot;&quot;, len=3Dlen@entry=3D2) at /root/qemu_debug_LSEEK/qemu_de=
bug/qemu/exec.c:3391<br>
#8&nbsp; 0x0000565200f4023a in address_space_rw (as=3D&lt;optimized out&gt;=
, addr=3Daddr@entry=3D49222, attrs=3D..., attrs@entry=3D..., buf=3Dbuf@entr=
y=3D0x7f8a6329a000 &quot;&quot;, len=3Dlen@entry=3D2, is_write=3Dis_write@e=
ntry=3Dfalse) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3421<br>
#9&nbsp; 0x0000565200fa7d9b in kvm_handle_io (count=3D1, size=3D2, directio=
n=3D&lt;optimized out&gt;, data=3D&lt;optimized out&gt;, attrs=3D..., port=
=3D49222) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:177=
8<br>
#10 kvm_cpu_exec (cpu=3Dcpu@entry=3D0x56520223b1d0) at /root/qemu_debug_LSE=
EK/qemu_debug/qemu/accel/kvm/kvm-all.c:2024<br>
#11 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
223b1d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#12 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&gt;) =
at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502<br>
#13 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a50ff9700) at pthread_cr=
eate.c:333<br>
#14 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109<br>
<br>
Thread 10 (Thread 0x7f8a517fa700 (LWP 201212)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x565202217c=
30) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
565202217c30) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a517fa700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 9 (Thread 0x7f8a51ffb700 (LWP 201211)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652021f4a=
d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
5652021f4ad0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a51ffb700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 8 (Thread 0x7f8a527fc700 (LWP 201210)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652021d19=
70) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
5652021d1970) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a527fc700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 7 (Thread 0x7f8a52ffd700 (LWP 201208)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652021ae6=
30) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
5652021ae630) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a52ffd700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 6 (Thread 0x7f8a537fe700 (LWP 201207)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x56520218b4=
d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
56520218b4d0) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a537fe700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 5 (Thread 0x7f8a53fff700 (LWP 201206)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013d7c68 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/accel/kvm/kvm-all.c&quot;, line=3D2089) at /root/qemu_d=
ebug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013d7c68 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kv=
m/kvm-all.c&quot;, line=3Dline@entry=3D2089) at /root/qemu_debug_LSEEK/qemu=
_debug/qemu/cpus.c:1850<br>
#4&nbsp; 0x0000565200fa7ca8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x565202167a=
50) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2089<br>
#5&nbsp; 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x=
565202167a50) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#6&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#7&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a53fff700) at pthre=
ad_create.c:333<br>
#8&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 4 (Thread 0x7f8a58fc0700 (LWP 201204)):<br>
#0&nbsp; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevello=
ck.S:135<br>
#1&nbsp; 0x00007f8a5e24cdbd in __GI___pthread_mutex_lock (mutex=3Dmutex@ent=
ry=3D0x565201adb680 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mutex_loc=
k.c:80<br>
#2&nbsp; 0x0000565201398263 in qemu_mutex_lock_impl (mutex=3D0x565201adb680=
 &lt;qemu_global_mutex&gt;, file=3D0x5652013c54c0 &quot;/root/qemu_debug_LS=
EEK/qemu_debug/qemu/exec.c&quot;, line=3D3243) at /root/qemu_debug_LSEEK/qe=
mu_debug/qemu/util/qemu-thread-posix.c:66<br>
#3&nbsp; 0x0000565200f7d00e in qemu_mutex_lock_iothread_impl (file=3Dfile@e=
ntry=3D0x5652013c54c0 &quot;/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c&q=
uot;, line=3Dline@entry=3D3243) at /root/qemu_debug_LSEEK/qemu_debug/qemu/c=
pus.c:1850<br>
#4&nbsp; 0x0000565200f3a9a1 in prepare_mmio_access (mr=3D0x56520307d930, mr=
=3D0x56520307d930) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3243<br=
>
#5&nbsp; 0x0000565200f3fe0f in flatview_read_continue (fv=3Dfv@entry=3D0x7f=
8a34075e00, addr=3Daddr@entry=3D4261433344, attrs=3Dattrs@entry=3D..., buf=
=3D&lt;optimized out&gt;, buf@entry=3D0x7f8a633ee028 &quot;\002&quot;, len=
=3Dlen@entry=3D1, addr1=3D0, l=3D1, mr=3D0x56520307d930)<br>
&nbsp;&nbsp;&nbsp; at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3338<br=
>
#6&nbsp; 0x0000565200f40003 in flatview_read (fv=3D0x7f8a34075e00, addr=3D4=
261433344, attrs=3D..., buf=3D0x7f8a633ee028 &quot;\002&quot;, len=3D1) at =
/root/qemu_debug_LSEEK/qemu_debug/qemu/exec.c:3378<br>
#7&nbsp; 0x0000565200f4011b in address_space_read_full (as=3D&lt;optimized =
out&gt;, addr=3D&lt;optimized out&gt;, attrs=3D..., buf=3Dbuf@entry=3D0x7f8=
a633ee028 &quot;\002&quot;, len=3D&lt;optimized out&gt;) at /root/qemu_debu=
g_LSEEK/qemu_debug/qemu/exec.c:3391<br>
#8&nbsp; 0x0000565200f4023a in address_space_rw (as=3D&lt;optimized out&gt;=
, addr=3D&lt;optimized out&gt;, attrs=3D..., attrs@entry=3D..., buf=3Dbuf@e=
ntry=3D0x7f8a633ee028 &quot;\002&quot;, len=3D&lt;optimized out&gt;, is_wri=
te=3D&lt;optimized out&gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/exec.=
c:3421<br>
#9&nbsp; 0x0000565200fa7cf8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x5652021191=
00) at /root/qemu_debug_LSEEK/qemu_debug/qemu/accel/kvm/kvm-all.c:2034<br>
#10 0x0000565200f7d1ce in qemu_kvm_cpu_thread_fn (arg=3Darg@entry=3D0x56520=
2119100) at /root/qemu_debug_LSEEK/qemu_debug/qemu/cpus.c:1281<br>
#11 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&gt;) =
at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502<br>
#12 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a58fc0700) at pthread_cr=
eate.c:333<br>
#13 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:109<br>
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---<br>
<br>
Thread 3 (Thread 0x7f8a597c1700 (LWP 201203)):<br>
#0&nbsp; 0x00007f8a5df7474d in poll () at ../sysdeps/unix/syscall-template.=
S:84<br>
#1&nbsp; 0x00007f8a6234138c in ?? () from /lib/x86_64-linux-gnu/libglib-2.0=
.so.0<br>
#2&nbsp; 0x00007f8a62341712 in g_main_loop_run () from /lib/x86_64-linux-gn=
u/libglib-2.0.so.0<br>
#3&nbsp; 0x00005652010aa3b1 in iothread_run (opaque=3Dopaque@entry=3D0x5652=
02108420) at /root/qemu_debug_LSEEK/qemu_debug/qemu/iothread.c:82<br>
#4&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#5&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a597c1700) at pthre=
ad_create.c:333<br>
#6&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 2 (Thread 0x7f8a5a903700 (LWP 201196)):<br>
#0&nbsp; syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38<br>
#1&nbsp; 0x0000565201398caf in qemu_futex_wait (val=3D&lt;optimized out&gt;=
, f=3D&lt;optimized out&gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/incl=
ude/qemu/futex.h:29<br>
#2&nbsp; qemu_event_wait (ev=3Dev@entry=3D0x565201b2da88 &lt;rcu_call_ready=
_event&gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posi=
x.c:442<br>
#3&nbsp; 0x00005652013a9868 in call_rcu_thread (opaque=3Dopaque@entry=3D0x0=
) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/rcu.c:261<br>
#4&nbsp; 0x0000565201398116 in qemu_thread_start (args=3D&lt;optimized out&=
gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util/qemu-thread-posix.c:502=
<br>
#5&nbsp; 0x00007f8a5e24a6ba in start_thread (arg=3D0x7f8a5a903700) at pthre=
ad_create.c:333<br>
#6&nbsp; 0x00007f8a5df8041d in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:109<br>
<br>
Thread 1 (Thread 0x7f8a633acbc0 (LWP 201184)):<br>
#0&nbsp; 0x00007f8a5e253b67 in lseek64 () at ../sysdeps/unix/syscall-templa=
te.S:84<br>
#1&nbsp; 0x0000565201301278 in find_allocation (bs=3D0x565202109ca0, hole=
=3D&lt;synthetic pointer&gt;, data=3D&lt;synthetic pointer&gt;, start=3D573=
8856448) at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/file-posix.c:2427<=
br>
#2&nbsp; raw_co_block_status (bs=3D0x565202109ca0, want_zero=3D&lt;optimize=
d out&gt;, offset=3D5738856448, bytes=3D15728640, pnum=3D0x7f7b529e9f20, ma=
p=3D0x7f7b529e9ca0, file=3D0x7f7b529e9ca8) at /root/qemu_debug_LSEEK/qemu_d=
ebug/qemu/block/file-posix.c:2490<br>
#3&nbsp; 0x00005652013078b3 in bdrv_co_block_status (bs=3D0x565202109ca0, w=
ant_zero=3Dwant_zero@entry=3Dtrue, offset=3D5738856448, bytes=3D15728640, p=
num=3Dpnum@entry=3D0x7f7b529e9f20, map=3Dmap@entry=3D0x7f7b529e9d50, file=
=3D0x7f7b529e9d58)<br>
&nbsp;&nbsp;&nbsp; at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:211=
0<br>
#4&nbsp; 0x00005652013079c7 in bdrv_co_block_status (bs=3Dbs@entry=3D0x5652=
02102640, want_zero=3Dwant_zero@entry=3Dtrue, offset=3Doffset@entry=3D57388=
56448, bytes=3Dbytes@entry=3D15728640, pnum=3Dpnum@entry=3D0x7f7b529e9f20, =
map=3Dmap@entry=3D0x0, file=3D0x0)<br>
&nbsp;&nbsp;&nbsp; at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:213=
4<br>
#5&nbsp; 0x0000565201307c14 in bdrv_co_block_status_above (file=3D0x0, map=
=3D0x0, pnum=3D0x7f7b529e9f20, bytes=3D15728640, offset=3D5738856448, want_=
zero=3Dtrue, base=3D0x0, bs=3D&lt;optimized out&gt;) at /root/qemu_debug_LS=
EEK/qemu_debug/qemu/block/io.c:2212<br>
#6&nbsp; bdrv_block_status_above_co_entry (opaque=3D0x7f7b529e9e20) at /roo=
t/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:2242<br>
#7&nbsp; 0x0000565201308198 in bdrv_common_block_status_above (bs=3Dbs@entr=
y=3D0x565202102640, base=3Dbase@entry=3D0x0, want_zero=3Dwant_zero@entry=3D=
true, offset=3Doffset@entry=3D5738856448, bytes=3D&lt;optimized out&gt;, pn=
um=3Dpnum@entry=3D0x7f7b529e9f20, map=3D0x0, file=3D0x0)<br>
&nbsp;&nbsp;&nbsp; at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:227=
7<br>
#8&nbsp; 0x000056520130918d in bdrv_block_status_above (bs=3Dbs@entry=3D0x5=
65202102640, base=3Dbase@entry=3D0x0, offset=3Doffset@entry=3D5738856448, b=
ytes=3D&lt;optimized out&gt;, pnum=3Dpnum@entry=3D0x7f7b529e9f20, map=3Dmap=
@entry=3D0x0, file=3D0x0)<br>
&nbsp;&nbsp;&nbsp; at /root/qemu_debug_LSEEK/qemu_debug/qemu/block/io.c:229=
0<br>
#9&nbsp; 0x00005652013057c0 in mirror_iteration (s=3D0x565202fd66a0) at /ro=
ot/qemu_debug_LSEEK/qemu_debug/qemu/block/mirror.c:526<br>
#10 mirror_run (job=3D0x565202fd66a0, errp=3D&lt;optimized out&gt;) at /roo=
t/qemu_debug_LSEEK/qemu_debug/qemu/block/mirror.c:968<br>
#11 0x00005652012b913f in job_co_entry (opaque=3D0x565202fd66a0) at /root/q=
emu_debug_LSEEK/qemu_debug/qemu/job.c:889<br>
#12 0x00005652013aafca in coroutine_trampoline (i0=3D&lt;optimized out&gt;,=
 i1=3D&lt;optimized out&gt;) at /root/qemu_debug_LSEEK/qemu_debug/qemu/util=
/coroutine-ucontext.c:116<br>
#13 0x00007f8a5dec35d0 in ?? () from /lib/x86_64-linux-gnu/libc.so.6<br>
#14 0x00007ffff4114730 in ?? ()<br>
#15 0x0000000000000000 in ?? ()<br>
<br>
<br>
&gt; &gt; First we thought it was related to an hardware issue we check it,=
 we comparing different hardware, but no issue where found there<br>
&gt; &gt; <br>
&gt; &gt; So one of my colleague had the idea to limit with &quot;tc&quot; =
the bandwidth on the interface the migration was done, and it worked the VM=
 didn't lose any ping nor being&nbsp; I/O&nbsp; stuck<br>
&gt; &gt; Important point : Once the Vm have been migrate (with the limitat=
ion ) one time, if we migrate it again right after, the migration will be d=
one at full speed (8-9Gb/s) without freezing the Vm<br>
<br>
&gt; Since you say you're using local storage, I assume that you're doing<b=
r>
&gt; both a VM live migration and storage migration at the same time. These=
<br>
&gt; are separate connections, storage is migrated using a NBD connection.<=
br>
<br>
&gt; Did you limit the bandwith for both connections, or if it was just one=
<br>
&gt; of them, which one was it?<br>
<br>
Yes we are doing a live migration and a storage migration (pre-copy)<br>
We limit the bandwith for both connections but when the disk have finish to=
 migrate we can remove the bandwith limitation<br>
for the memory transfert and it go up to the maximum speed and with no free=
ze<br>
<br>
&gt; &gt; It only happen on existing VM, we tried to replicate with a fresh=
 instance with exactly the same spec and nothing was happening<br>
&gt; &gt; <br>
&gt; &gt; We tried to replicate the workload inside the VM but there was no=
 way to replicate the case. So it was not related to the workload nor to th=
e server that hosts the Vm<br>
&gt; &gt; <br>
&gt; &gt; So we thought about the disk of the instance : the raw file.<br>
&gt; &gt; <br>
&gt; &gt; We also tried to strace -c the process during the live-migration =
and it was doing a lot of &quot;lseek&quot;<br>
&gt; &gt; <br>
&gt; &gt; and we found this :<br>
&gt; &gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2017-02/=
msg00462.html">
https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00462.html</a><br>
<br>
&gt; This case is different in that it used qcow2 (which should behave much=
<br>
&gt; better today).<br>
<br>
&gt; It also used ZFS, which you didn't mention. Is the problematic image<b=
r>
&gt; stored on ZFS? If not, which filesystem is it?<br>
<br>
You are right this is not exactly the same case and we are not storing the =
problematic image on ZFS but on Ext4<br>
<br>
&gt; So i rebuilt Qemu with this patch and the live-migration went well, at=
 high speed and with no VM freeze<br>
&gt; ( <a href=3D"https://github.com/qemu/qemu/blob/master/block/file-posix=
.c#L2601">https://github.com/qemu/qemu/blob/master/block/file-posix.c#L2601=
</a> )<br>
&gt; <br>
&gt; Do you have a way to avoid the &quot;lseek&quot; mechanism as it consu=
mes more resources to find the holes in the disk and don't let any for the =
VM ?<br>
<br>
&gt; If you can provide the stack trace during the hang, we might be able t=
o<br>
&gt; tell why we're even trying to find holes.<br>
<br>
&gt; Please also provide your QEMU command line.<br>
<br>
Here the qemu command line :<br>
<br>
/usr/bin/qemu-system-x86_64 \<br>
-name guest=3Dinstance-0034d494,debug-threads=3Don \<br>
-S \<br>
-object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/do=
main-9-instance-0034d494/master-key.aes \<br>
-machine pc-i440fx-bionic,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff \<br>
-cpu Broadwell-IBRS,md-clear=3Don,vmx=3Don \<br>
-m 60000 \<br>
-overcommit mem-lock=3Doff \<br>
-smp 16,sockets=3D16,cores=3D1,threads=3D1 \<br>
-uuid b959a460-84b0-4280-b851-96755027622b \<br>
-smbios 'type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenStack N=
ova,version=3D14.1.1,serial=3D5b429103-2856-154f-1caf-5ffb5694cdc3,uuid=3Db=
959a460-84b0-4280-b851-96755027622b,family=3DVirtual Machine' \<br>
-no-user-config \<br>
-nodefaults \<br>
-chardev socket,id=3Dcharmonitor,fd=3D28,server,nowait \<br>
-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \<br>
-rtc base=3Dutc,driftfix=3Dslew \<br>
-global kvm-pit.lost_tick_policy=3Ddelay \<br>
-no-hpet \<br>
-no-shutdown \<br>
-boot strict=3Don \<br>
-device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \<br>
-drive file=3D/home/instances/b959a460-84b0-4280-b851-96755027622b/disk,for=
mat=3Draw,if=3Dnone,id=3Ddrive-virtio-disk0,cache=3Dnone,discard=3Dunmap,ai=
o=3Dnative,throttling.iops-total=3D80000 \<br>
-device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x3,drive=3Ddrive-virt=
io-disk0,id=3Dvirtio-disk0,bootindex=3D1,write-cache=3Don \<br>
-add-fd set=3D1,fd=3D31 \<br>
-chardev file,id=3Dcharserial0,path=3D/dev/fdset/1,append=3Don \<br>
-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \<br>
-chardev pty,id=3Dcharserial1 \<br>
-device isa-serial,chardev=3Dcharserial1,id=3Dserial1 \<br>
-device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 \<br>
-vnc 10.224.27.81:0 \<br>
-device cirrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 \<br>
-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x4 \<br>
-s \<br>
-sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcec=
ontrol=3Ddeny \<br>
-msg timestamp=3Don<br>
<br>
<br>
&gt; At the moment, my assumption is that this is during a mirror block job=
<br>
&gt; which is migrating the disk to your destination server. Not looking fo=
r<br>
&gt; holes would mean that a sparse source file would become fully allocate=
d<br>
&gt; on the destination, which is usually not wanted (also we would<br>
&gt; potentially transfer a lot more data over the networkj).<br>
<br>
The vm disk is already fully allocated, so in this case it doesn't change.<=
br>
<br>
&gt; Can you give us a snippet from your strace that shows the individual<b=
r>
&gt; lseek syscalls? Depending on which ranges are queried, maybe we could<=
br>
&gt; optimise things by caching the previous result.<br>
<br>
Here the strace during the block migration :<br>
<br>
strace -c -p 32571<br>
strace: Process 32571 attached<br>
^Cstrace: Process 32571 detached<br>
% time&nbsp;&nbsp;&nbsp; seconds usecs/call&nbsp;&nbsp;&nbsp; calls&nbsp;&n=
bsp; errors syscall<br>
94.15&nbsp; 13.754159&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2503&nbsp;&nbsp;&=
nbsp;&nbsp; 5495&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lsee=
k<br>
&nbsp;3.47&nbsp;&nbsp; 0.507101&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 91&nbsp;&nbsp;&nbsp;&nbsp; 5549&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; sendmsg<br>
&nbsp;1.60&nbsp;&nbsp; 0.233516&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 84&nbsp;&nbsp;&nbsp;&nbsp; 2769&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; io_submit<br>
&nbsp;0.40&nbsp;&nbsp; 0.057817&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 11&nbsp;&nbsp;&nbsp;&nbsp; 5496&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; setsockopt<br>
&nbsp;0.18&nbsp;&nbsp; 0.025747&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp; 5730&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 184=
 recvmsg<br>
&nbsp;0.16&nbsp;&nbsp; 0.023560&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 6&nbsp;&nbsp;&nbsp;&nbsp; 4259&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; write<br>
&nbsp;0.02&nbsp;&nbsp; 0.002575&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 408&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; read<br>
&nbsp;0.02&nbsp;&nbsp; 0.002425&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 266&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 35 futex<br>
&nbsp;0.01&nbsp;&nbsp; 0.002136&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 184&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ppoll<br>
&nbsp;0.00&nbsp;&nbsp; 0.000184&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; poll<br>
&nbsp;0.00&nbsp;&nbsp; 0.000038&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 38&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clone<br>
&nbsp;0.00&nbsp;&nbsp; 0.000032&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rt_sigprocmask<br>
&nbsp;0.00&nbsp;&nbsp; 0.000013&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ioctl<br>
100.00&nbsp; 14.609303&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 30176&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2=
19 total<br>
<br>
&gt; Also, a final remark, I know of some cases (on XFS) where lseeks were<=
br>
&gt; slow because the image file was heavily fragmented. Defragmenting the<=
br>
&gt; file resolved the problem, so this may be another thing to try.<br>
<br>
&gt; On XFS, newer QEMU versions set an extent size hint on newly created<b=
r>
&gt; image files (during qemu-img create), which can reduce fragmentation<b=
r>
&gt; considerably.<br>
<br>
&gt; Kevin<br>
<br>
&gt; Server hosting the VM :<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Bi-Xeon hosts With NVME storage and 10 Go Ne=
twork card<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Qemu 4.0 And Libvirt 5.4<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Kernel 4.18.0.25<br>
&gt; <br>
&gt; Guest having the issue :<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - raw image with Debian 8<br>
&gt; <br>
&gt; Here the qemu img on the disk :<br>
&gt; &gt; qemu-img info disk<br>
&gt; image: disk<br>
&gt; file format: raw<br>
&gt; virtual size: 400G (429496729600 bytes)<br>
&gt; disk size: 400G<br>
&gt; <br>
&gt; <br>
&gt; Quentin GROLLEAU<br>
&gt; <br>
</div>
</span></font>
</body>
</html>

--_000_5ac227512b50444bbb47f85404673c32ovhcloudcom_--

