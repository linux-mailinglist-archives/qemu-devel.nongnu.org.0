Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED942C47B5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 19:36:52 +0100 (CET)
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khzet-0004hD-5d
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 13:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khzdf-0003Hw-Lb
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:35:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khzdd-0002Vf-8t
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:35:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khzdc-0001G4-5b
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 18:35:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 254EE2E813B
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 18:35:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2020 18:30:09 -0000
From: Thomas Huth <1820247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paelzer premysl-kouril th-huth
X-Launchpad-Bug-Reporter: Premysl Kouril (premysl-kouril)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155264640750.14328.9388423276905279806.malonedeb@soybean.canonical.com>
Message-Id: <160632900994.9859.12336403696012443828.malone@soybean.canonical.com>
Subject: [Bug 1820247] Re: QEMU random crash caused by libspice-server
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: adefdaa8dd6568727ea345a29388940c66bb02f6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1820247 <1820247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1820247

Title:
  QEMU random crash caused by libspice-server

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  One of our OpenStack instances crashed. It seems there was some
  problem related to SPICE. Attaching what we had in qemu log. Also
  sending our versions:

  Linux pre-node1 4.18.0-13-generic #14~18.04.1-Ubuntu SMP Thu Dec 6
  14:09:52 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

  QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.9)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  =

  root@pre-node1:~# cat /var/log/libvirt/qemu/instance-00000038.log =

  2019-03-10 20:39:36.510+0000: starting up libvirt version: 4.0.0, package=
: 1ubuntu8.6 (Christian Ehrhardt <christian.ehrhardt@canonical.com> Fri, 09=
 Nov 2018 07:42:01 +0100), qemu version: 2.11.1(Debian 1:2.11+dfsg-1ubuntu7=
.9), hostname: pre-node1
  LC_ALL=3DC PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin QEMU_AUDIO_DRV=3Dspice /usr/bin/kvm-spice -name guest=3Dinstance-0000=
0038,debug-threads=3Don -S -object secret,id=3DmasterKey0,format=3Draw,file=
=3D/var/lib/libvirt/qemu/domain-5-instance-00000038/master-key.aes -machine=
 pc-i440fx-bionic,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff,mem-merge=3Do=
ff -cpu Skylake-Server-IBRS,ss=3Don,hypervisor=3Don,tsc_adjust=3Don,clflush=
opt=3Don,pku=3Don,ssbd=3Don,xsaves=3Don -m 2048 -realtime mlock=3Don -smp 2=
,sockets=3D1,cores=3D1,threads=3D2 -object memory-backend-file,id=3Dram-nod=
e0,prealloc=3Dyes,mem-path=3D/dev/hugepages/libvirt/qemu/5-instance-0000003=
8,share=3Dyes,size=3D2147483648,host-nodes=3D0,policy=3Dbind -numa node,nod=
eid=3D0,cpus=3D0-1,memdev=3Dram-node0 -uuid 3c3d04f3-4b25-4ea5-8836-0e06eef=
9dcb7 -smbios 'type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenS=
tack Nova,version=3D18.1.1,serial=3D93fa1a55-ba3a-4a99-80b3-3a7bb4e964af,uu=
id=3D3c3d04f3-4b25-4ea5-8836-0e06eef9dcb7,family=3DVirtual Machine' -no-use=
r-config -nodefaults -chardev socket,id=3Dcharmonitor,path=3D/var/lib/libvi=
rt/qemu/domain-5-instance-00000038/monitor.sock,server,nowait -mon chardev=
=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc,driftfix=3Dslew =
-global kvm-pit.lost_tick_policy=3Ddelay -no-hpet -no-shutdown -boot strict=
=3Don -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 -device vi=
rtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x3 -drive file=3D/v=
ar/lib/nova/instances/3c3d04f3-4b25-4ea5-8836-0e06eef9dcb7/disk,format=3Dqc=
ow2,if=3Dnone,id=3Ddrive-virtio-disk0,cache=3Dnone,discard=3Dignore,throttl=
ing.iops-read=3D5000,throttling.iops-write=3D5000 -device virtio-blk-pci,sc=
si=3Doff,bus=3Dpci.0,addr=3D0x4,drive=3Ddrive-virtio-disk0,id=3Dvirtio-disk=
0,bootindex=3D1 -add-fd set=3D0,fd=3D29 -chardev pty,id=3Dcharserial0,logfi=
le=3D/dev/fdset/0,logappend=3Don -device isa-serial,chardev=3Dcharserial0,i=
d=3Dserial0 -chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent -device virt=
serialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0,id=3Dchanne=
l0,name=3Dcom.redhat.spice.0 -spice port=3D5900,addr=3D10.252.0.101,disable=
-ticketing,seamless-migration=3Don -device qxl-vga,id=3Dvideo0,ram_size=3D6=
7108864,vram_size=3D67108864,vram64_size_mb=3D0,vgamem_mb=3D16,max_outputs=
=3D1,bus=3Dpci.0,addr=3D0x2 -device vfio-pci,host=3D25:04.1,id=3Dhostdev0,b=
us=3Dpci.0,addr=3D0x5 -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,=
addr=3D0x6 -msg timestamp=3Don
  2019-03-10T20:39:36.568276Z qemu-system-x86_64: -chardev pty,id=3Dcharser=
ial0,logfile=3D/dev/fdset/0,logappend=3Don: char device redirected to /dev/=
pts/2 (label charserial0)
  inputs_channel_detach_tablet: =

  main_channel_link: add main channel client
  main_channel_client_handle_pong: net test: latency 32.760000 ms, bitrate =
33384953 bps (31.838372 Mbps)
  red_qxl_set_cursor_peer: =

  inputs_connect: inputs channel client create

  (process:65324): Spice-WARNING **: 16:35:23.769: Failed to create channel=
 client: Client 0x55e7c157e970: duplicate channel type 2 id 0
  red_qxl_set_cursor_peer: =


  (process:65324): Spice-WARNING **: 16:35:24.142: Failed to create
  channel client: Client 0x55e7c157e970: duplicate channel type 4 id 0

  (process:65324): Spice-CRITICAL **: 16:35:24.142: cursor-channel.c:353:cu=
rsor_channel_connect: condition `ccc !=3D NULL' failed
  2019-03-13 15:35:31.785+0000: shutting down, reason=3Dcrashed


  =

  I am also attaching some gdb information extracted from qemu crash dump f=
ile. These are backtraces of particular threads within the crashed QEMU pro=
cess.

  =

  Thread 9 (Thread 0x7f69649ea5c0 (LWP 65324)):
  #0  0x00007f695f02d2b7 in __libc_write (fd=3D26, buf=3D0x7ffc33f5b330, nb=
ytes=3D56) at ../sysdeps/unix/sysv/linux/write.c:27
  #1  0x00007f695ff30ed3 in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #2  0x00007f695ff316ce in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #3  0x00007f695ff52db6 in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #4  0x00007f695ff58e38 in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #5  0x00007f695ff5f463 in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #6  0x00007f695ff5f7bb in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #7  0x000055e7bec94584 in  ()
  #8  0x000055e7bec94e58 in aio_dispatch ()
  #9  0x000055e7bec91e3e in  ()
  #10 0x00007f695fa45387 in g_main_context_dispatch () at /usr/lib/x86_64-l=
inux-gnu/libglib-2.0.so.0
  #11 0x000055e7bec940a7 in main_loop_wait ()
  #12 0x000055e7be8b8486 in main ()

  Thread 8 (Thread 0x7f68b78fc700 (LWP 61873)):
  #0  0x00007f695f02c8c2 in futex_abstimed_wait_cancelable (private=3D0, ab=
stime=3D0x7f68b78fb900, expected=3D0, futex_word=3D0x55e7c1531d78)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:205
  #1  0x00007f695f02c8c2 in do_futex_wait (sem=3Dsem@entry=3D0x55e7c1531d78=
, abstime=3Dabstime@entry=3D0x7f68b78fb900) at sem_waitcommon.c:111
  #2  0x00007f695f02c9d3 in __new_sem_wait_slow (sem=3D0x55e7c1531d78, abst=
ime=3D0x7f68b78fb900) at sem_waitcommon.c:181
  #3  0x000055e7bec976cf in qemu_sem_timedwait ()
  #4  0x000055e7bec928bc in  ()
  #5  0x00007f695f0236db in start_thread (arg=3D0x7f68b78fc700) at pthread_=
create.c:463
  #6  0x00007f695ed4c88f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Thread 7 (Thread 0x7f688f7fe700 (LWP 61366)):
  #0  0x00007f695f02c8c2 in futex_abstimed_wait_cancelable (private=3D0, ab=
stime=3D0x7f688f7fd900, expected=3D0, futex_word=3D0x55e7c1531d78)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:205
  #1  0x00007f695f02c8c2 in do_futex_wait (sem=3Dsem@entry=3D0x55e7c1531d78=
, abstime=3Dabstime@entry=3D0x7f688f7fd900) at sem_waitcommon.c:111
  #2  0x00007f695f02c9d3 in __new_sem_wait_slow (sem=3D0x55e7c1531d78, abst=
ime=3D0x7f688f7fd900) at sem_waitcommon.c:181
  #3  0x000055e7bec976cf in qemu_sem_timedwait ()
  #4  0x000055e7bec928bc in  ()
  #5  0x00007f695f0236db in start_thread (arg=3D0x7f688f7fe700) at pthread_=
create.c:463
  #6  0x00007f695ed4c88f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Thread 6 (Thread 0x7f687effd700 (LWP 61362)):
  #0  0x00007f695f02c8c2 in futex_abstimed_wait_cancelable (private=3D0, ab=
stime=3D0x7f687effc900, expected=3D0, futex_word=3D0x55e7c1531d78)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:205
  #1  0x00007f695f02c8c2 in do_futex_wait (sem=3Dsem@entry=3D0x55e7c1531d78=
, abstime=3Dabstime@entry=3D0x7f687effc900) at sem_waitcommon.c:111
  #2  0x00007f695f02c9d3 in __new_sem_wait_slow (sem=3D0x55e7c1531d78, abst=
ime=3D0x7f687effc900) at sem_waitcommon.c:181
  #3  0x000055e7bec976cf in qemu_sem_timedwait ()
  #4  0x000055e7bec928bc in  ()
  #5  0x00007f695f0236db in start_thread (arg=3D0x7f687effd700) at pthread_=
create.c:463
  #6  0x00007f695ed4c88f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Thread 5 (Thread 0x7f68b58f1700 (LWP 60991)):
  #0  0x00007f695f02c8c2 in futex_abstimed_wait_cancelable (private=3D0, ab=
stime=3D0x7f68b58f0900, expected=3D0, futex_word=3D0x55e7c1531d78)
      at ../sysdeps/unix/sysv/linux/futex-internal.h:205
  #1  0x00007f695f02c8c2 in do_futex_wait (sem=3Dsem@entry=3D0x55e7c1531d78=
, abstime=3Dabstime@entry=3D0x7f68b58f0900) at sem_waitcommon.c:111
  #2  0x00007f695f02c9d3 in __new_sem_wait_slow (sem=3D0x55e7c1531d78, abst=
ime=3D0x7f68b58f0900) at sem_waitcommon.c:181
  #3  0x000055e7bec976cf in qemu_sem_timedwait ()
  #4  0x000055e7bec928bc in  ()
  #5  0x00007f695f0236db in start_thread (arg=3D0x7f68b58f1700) at pthread_=
create.c:463
  #6  0x00007f695ed4c88f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Thread 4 (Thread 0x7f69564a2700 (LWP 65331)):
  #0  0x00007f695ed46839 in syscall () at ../sysdeps/unix/sysv/linux/x86_64=
/syscall.S:38
  #1  0x000055e7bec9790b in qemu_event_wait ()
  #2  0x000055e7beca7ebe in  ()
  #3  0x00007f695f0236db in start_thread (arg=3D0x7f69564a2700) at pthread_=
create.c:463
  #4  0x00007f695ed4c88f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Thread 3 (Thread 0x7f695449d700 (LWP 65363)):
  #0  0x00007f695ed415d7 in ioctl () at ../sysdeps/unix/syscall-template.S:=
78
  #1  0x000055e7be910547 in kvm_vcpu_ioctl ()
  #2  0x000055e7be910684 in kvm_cpu_exec ()
  #3  0x000055e7be8ed3f4 in  ()
  #4  0x00007f695f0236db in start_thread (arg=3D0x7f695449d700) at pthread_=
create.c:463
  #5  0x00007f695ed4c88f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Thread 2 (Thread 0x7f6952b4f700 (LWP 65366)):
  #0  0x00007f695ed415d7 in ioctl () at ../sysdeps/unix/syscall-template.S:=
78
  #1  0x000055e7be910547 in kvm_vcpu_ioctl ()
  ---Type <return> to continue, or q <return> to quit---
  #2  0x000055e7be910684 in kvm_cpu_exec ()
  #3  0x000055e7be8ed3f4 in  ()
  #4  0x00007f695f0236db in start_thread (arg=3D0x7f6952b4f700) at pthread_=
create.c:463
  #5  0x00007f695ed4c88f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Thread 1 (Thread 0x7f6951a40700 (LWP 65368)):
  #0  0x00007f695ec69e97 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/sysv/linux/raise.c:51
  #1  0x00007f695ec6b801 in __GI_abort () at abort.c:79
  #2  0x00007f695ff81cc9 in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #3  0x00007f695ff63929 in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #4  0x00007f695ff314f1 in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #5  0x00007f695ff37d7b in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #6  0x00007f695fa451f5 in g_main_context_dispatch () at /usr/lib/x86_64-l=
inux-gnu/libglib-2.0.so.0
  #7  0x00007f695fa455c0 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so=
.0
  #8  0x00007f695fa458d2 in g_main_loop_run () at /usr/lib/x86_64-linux-gnu=
/libglib-2.0.so.0
  #9  0x00007f695ff63b3a in  () at /usr/lib/x86_64-linux-gnu/libspice-serve=
r.so.1
  #10 0x00007f695f0236db in start_thread (arg=3D0x7f6951a40700) at pthread_=
create.c:463
  #11 0x00007f695ed4c88f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Regards,
  Premysl

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1820247/+subscriptions

