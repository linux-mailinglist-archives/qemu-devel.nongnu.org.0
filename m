Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B4C3652AD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 08:58:05 +0200 (CEST)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkKi-0004kZ-Px
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 02:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYkIf-0003CB-HK
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:55:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:44434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYkIY-0005ZI-RF
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 02:55:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYkIX-0001yG-Bz
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:55:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 576952E8071
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:55:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 06:49:34 -0000
From: Thomas Huth <1807052@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: schu-schu th-huth
X-Launchpad-Bug-Reporter: Matthew Schumacher (schu-schu)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154405409659.26070.18150716654904137665.malonedeb@gac.canonical.com>
Message-Id: <161890137477.6431.4624401075848827044.malone@soybean.canonical.com>
Subject: [Bug 1807052] Re: Qemu hangs during migration
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 082c516afd502922c30b78952b4f2c1a13caf31c
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
Reply-To: Bug 1807052 <1807052@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1807052

Title:
  Qemu hangs during migration

Status in QEMU:
  Incomplete

Bug description:
  Source server: linux 4.19.5 qemu-3.0.0 from source, libvirt 4.9
  Dest server: linux 4.18.19 qemu-3.0.0 from source, libvirt 4.9

  When this VM is running on source server:

  /usr/bin/qemu-system-x86_64 -name guest=3Dtestvm,debug-threads=3Don -S
  -object
  secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-1=
3-testvm
  /master-key.aes -machine pc-q35-3.0,accel=3Dkvm,usb=3Doff,dump-guest-
  core=3Doff -cpu Skylake-Server-
  IBRS,ss=3Don,hypervisor=3Don,tsc_adjust=3Don,clflushopt=3Don,umip=3Don,pk=
u=3Don,ssbd=3Don,xsaves=3Don,topoext=3Don,hv_time,hv_relaxed,hv_vapic,hv_sp=
inlocks=3D0x1fff,hv_vpindex,hv_runtime,hv_synic,hv_stimer,hv_reset,hv_vendo=
r_id=3DKVM
  Hv -m 4096 -realtime mlock=3Doff -smp 2,sockets=3D2,cores=3D1,threads=3D1
  -object iothread,id=3Diothread1 -uuid
  3b00b788-ee91-4e45-80a6-c7319da71225 -no-user-config -nodefaults
  -chardev socket,id=3Dcharmonitor,fd=3D23,server,nowait -mon
  chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc
  base=3Dlocaltime,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddelay
  -no-hpet -no-shutdown -boot strict=3Don -device pcie-root-
  port,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunction=3Don,a=
ddr=3D0x2
  -device pcie-root-
  port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,addr=3D0x2.0x1 -devi=
ce
  pcie-pci-bridge,id=3Dpci.3,bus=3Dpci.1,addr=3D0x0 -device pcie-root-
  port,port=3D0x12,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x2.0x2 -devi=
ce
  pcie-root-port,port=3D0x13,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=3D0x2=
.0x3
  -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.3,addr=3D0x1 -device virtio-scs=
i-
  pci,iothread=3Diothread1,id=3Dscsi0,bus=3Dpci.4,addr=3D0x0 -drive
  file=3D/dev/zvol/datastore/vm/testvm-vda,format=3Draw,if=3Dnone,id=3Ddriv=
e-
  scsi0-0-0-0,cache=3Dwriteback,aio=3Dthreads -device scsi-
  hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-
  scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2,write-cache=3Don -drive
  if=3Dnone,id=3Ddrive-sata0-0-4,media=3Dcdrom,readonly=3Don -device ide-
  cd,bus=3Dide.4,drive=3Ddrive-sata0-0-4,id=3Dsata0-0-4,bootindex=3D1 -netd=
ev
  tap,fd=3D25,id=3Dhostnet0,vhost=3Don,vhostfd=3D26 -device virtio-net-
  pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:a2:b7:a1,bus=3Dpci.2,addr=
=3D0x0
  -device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 -vnc 127.0.0.1:0 -dev=
ice
  cirrus-vga,id=3Dvideo0,bus=3Dpcie.0,addr=3D0x1 -s -sandbox
  on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=
=3Ddeny
  -msg timestamp=3Don

  I try to migrate it and the disks to the other side:

  virsh migrate --live --undefinesource --persistent --verbose --copy-
  storage-all testvm qemu+ssh://wasvirt1/system

  We get to 99% then hang with both sides in the pause state.

  Source server is stuck here:
  (gdb) bt full
  #0  0x00007f327994f3c1 in ppoll () at /lib64/libc.so.6
  #1  0x000000000086167b in qemu_poll_ns (fds=3D<optimized out>, nfds=3Dnfd=
s@entry=3D1, timeout=3D<optimized out>) at util/qemu-timer.c:322
  #2  0x0000000000863302 in aio_poll (ctx=3D0x21044e0, blocking=3Dblocking@=
entry=3Dtrue) at util/aio-posix.c:629
          node =3D <optimized out>
          i =3D <optimized out>
          ret =3D 0
          progress =3D <optimized out>
          timeout =3D <optimized out>
          start =3D <optimized out>
          __PRETTY_FUNCTION__ =3D "aio_poll"
  #3  0x00000000007e0d52 in nbd_client_close (bs=3D0x2ba2400) at block/nbd-=
client.c:62
          waited_ =3D <optimized out>
          wait_ =3D 0x2ba563c
          ctx_ =3D 0x2109bb0
          bs_ =3D 0x2ba2400
          client =3D 0x31287e0
          client =3D <optimized out>
          request =3D {handle =3D 0, from =3D 0, len =3D 0, flags =3D 0, ty=
pe =3D 2}
  #4  0x00000000007e0d52 in nbd_client_close (bs=3D0x2ba2400) at block/nbd-=
client.c:965
          client =3D <optimized out>
          request =3D {handle =3D 0, from =3D 0, len =3D 0, flags =3D 0, ty=
pe =3D 2}
  #5  0x00000000007de5ca in nbd_close (bs=3D<optimized out>) at block/nbd.c=
:491
          s =3D 0x31287e0
  #6  0x00000000007823d6 in bdrv_unref (bs=3D0x2ba2400) at block.c:3352
          ban =3D <optimized out>
          ban_next =3D <optimized out>
          child =3D <optimized out>
          next =3D <optimized out>
  #7  0x00000000007823d6 in bdrv_unref (bs=3D0x2ba2400) at block.c:3560
  #8  0x00000000007823d6 in bdrv_unref (bs=3D0x2ba2400) at block.c:4616
  #9  0x0000000000782403 in bdrv_unref (bs=3D0x2af96f0) at block.c:3359
          ban =3D <optimized out>
          ban_next =3D <optimized out>
          child =3D <optimized out>
          next =3D <optimized out>
  #10 0x0000000000782403 in bdrv_unref (bs=3D0x2af96f0) at block.c:3560
  #11 0x0000000000782403 in bdrv_unref (bs=3D0x2af96f0) at block.c:4616
  #12 0x0000000000785784 in block_job_remove_all_bdrv (job=3Djob@entry=3D0x=
2f32570) at blockjob.c:200
          c =3D 0x23bac30
          l =3D 0x20dd330 =3D {0x23bac30, 0x2b89410}
  #13 0x00000000007ceb5f in mirror_exit (job=3D0x2f32570, opaque=3D0x7f3264=
07a350) at block/mirror.c:700
          s =3D 0x2f32570
          bjob =3D 0x2f32570
          data =3D 0x7f326407a350
          bs_opaque =3D 0x30d5600
          replace_aio_context =3D <optimized out>
          src =3D 0x2131080
          target_bs =3D 0x2af96f0
          mirror_top_bs =3D 0x210eb70
          local_err =3D 0x0
  #14 0x0000000000786452 in job_defer_to_main_loop_bh (opaque=3D0x7f3264078=
6a0) at job.c:973
          data =3D 0x7f32640786a0
          job =3D <optimized out>
          aio_context =3D 0x2109bb0
  #15 0x000000000085fd3f in aio_bh_poll (ctx=3Dctx@entry=3D0x21044e0) at ut=
il/async.c:118
  ---Type <return> to continue, or q <return> to quit---
          bh =3D <optimized out>
          bhp =3D <optimized out>
          next =3D 0x2ea86e0
          ret =3D 1
          deleted =3D false
  #16 0x00000000008631b0 in aio_dispatch (ctx=3D0x21044e0) at util/aio-posi=
x.c:436
  #17 0x000000000085fc1e in aio_ctx_dispatch (source=3D<optimized out>, cal=
lback=3D<optimized out>, user_data=3D<optimized out>) at util/async.c:261
          ctx =3D <optimized out>
  #18 0x00007f327f17d797 in g_main_context_dispatch () at /usr/lib64/libgli=
b-2.0.so.0
  #19 0x00000000008622ed in main_loop_wait () at util/main-loop.c:215
          context =3D 0x2104900
          pfds =3D <optimized out>
          context =3D 0x2104900
          ret =3D 1
          ret =3D 1
          timeout =3D 4294967295
          timeout_ns =3D <optimized out>
  #20 0x00000000008622ed in main_loop_wait (timeout=3D<optimized out>) at u=
til/main-loop.c:238
          context =3D 0x2104900
          ret =3D 1
          ret =3D 1
          timeout =3D 4294967295
          timeout_ns =3D <optimized out>
  #21 0x00000000008622ed in main_loop_wait (nonblocking=3Dnonblocking@entry=
=3D0) at util/main-loop.c:497
          ret =3D 1
          timeout =3D 4294967295
          timeout_ns =3D <optimized out>
  #22 0x0000000000595dee in main_loop () at vl.c:1866
  #23 0x000000000041f35d in main (argc=3D<optimized out>, argv=3D<optimized=
 out>, envp=3D<optimized out>) at vl.c:4644
          i =3D <optimized out>
          snapshot =3D 0
          linux_boot =3D <optimized out>
          initrd_filename =3D 0x0
          kernel_filename =3D <optimized out>
          kernel_cmdline =3D <optimized out>
          boot_order =3D 0x918f44 "cad"
          boot_once =3D 0x0
          ds =3D <optimized out>
          opts =3D <optimized out>
          machine_opts =3D <optimized out>
          icount_opts =3D <optimized out>
          accel_opts =3D 0x0
          olist =3D <optimized out>
          optind =3D 71
          optarg =3D 0x7ffdfc94df69 "timestamp=3Don"
          loadvm =3D 0x0
          machine_class =3D 0x0
          cpu_model =3D 0x7ffdfc94d864 "Skylake-Server-IBRS,ss=3Don,hypervi=
sor=3Don,tsc_adjust=3Don,clflushopt=3Don,umip=3Don,pku=3Don,ssbd=3Don,xsave=
s=3Don,topoext=3Don,hv_time,hv_relaxed,hv_vapic,hv_spinlocks=3D0x1fff,hv_vp=
index,hv_runtime,hv_synic,hv_stimer"...
          vga_model =3D 0x0
          qtest_chrdev =3D 0x0
          qtest_log =3D 0x0
          pid_file =3D <optimized out>
          incoming =3D 0x0
          userconfig =3D <optimized out>
  ---Type <return> to continue, or q <return> to quit---
          nographic =3D false
          display_remote =3D <optimized out>
          log_mask =3D <optimized out>
          log_file =3D <optimized out>
          trace_file =3D <optimized out>
          maxram_size =3D 4294967296
          ram_slots =3D 0
          vmstate_dump_file =3D 0x0
          main_loop_err =3D 0x0
          err =3D 0x0
          list_data_dirs =3D false
          dir =3D <optimized out>
          dirs =3D <optimized out>
          bdo_queue =3D {sqh_first =3D 0x0, sqh_last =3D 0x7ffdfc94c170}
          __func__ =3D "main"

  Strace shows:
  ppoll([{fd=3D9, events=3DPOLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8

  Which points to this:

  ls -al /proc/2286/fd/9
  lrwx------    1 root     users           64 Dec  5 13:04 /proc/2286/fd/9 =
-> anon_inode:[eventfd]

  The dest side is stuck here:

  (gdb) bt full
  #0  0x00007f21f070d3c1 in ppoll () at /lib64/libc.so.6
  #1  0x0000000000861659 in qemu_poll_ns (fds=3D<optimized out>, nfds=3D<op=
timized out>, timeout=3Dtimeout@entry=3D2999926258) at util/qemu-timer.c:334
          ts =3D {tv_sec =3D 2, tv_nsec =3D 999926258}
  Python Exception <class 'gdb.error'> That operation is not available on i=
ntegers of more than 8 bytes.:
  #2  0x00000000008622a4 in main_loop_wait (timeout=3D<optimized out>) at u=
til/main-loop.c:233
          context =3D 0x2142900
          ret =3D <optimized out>
          ret =3D -1295041038
          timeout =3D 4294967295
          timeout_ns =3D <optimized out>
  #3  0x00000000008622a4 in main_loop_wait (nonblocking=3Dnonblocking@entry=
=3D0) at util/main-loop.c:497
          ret =3D -1295041038
          timeout =3D 4294967295
          timeout_ns =3D <optimized out>
  #4  0x0000000000595dee in main_loop () at vl.c:1866
  #5  0x000000000041f35d in main (argc=3D<optimized out>, argv=3D<optimized=
 out>, envp=3D<optimized out>) at vl.c:4644
          i =3D <optimized out>
          snapshot =3D 0
          linux_boot =3D <optimized out>
          initrd_filename =3D 0x0
          kernel_filename =3D <optimized out>
          kernel_cmdline =3D <optimized out>
          boot_order =3D 0x918f44 "cad"
          boot_once =3D 0x0
          ds =3D <optimized out>
          opts =3D <optimized out>
          machine_opts =3D <optimized out>
          icount_opts =3D <optimized out>
          accel_opts =3D 0x0
          olist =3D <optimized out>
          optind =3D 73
          optarg =3D 0x7ffdd6ee8f69 "timestamp=3Don"
          loadvm =3D 0x0
          machine_class =3D 0x0
          cpu_model =3D 0x7ffdd6ee8854 "Skylake-Server-IBRS,ss=3Don,hypervi=
sor=3Don,tsc_adjust=3Don,clflushopt=3Don,umip=3Don,pku=3Don,ssbd=3Don,xsave=
s=3Don,topoext=3Don,hv_time,hv_relaxed,hv_vapic,hv_spinlocks=3D0x1fff,hv_vp=
index,hv_runtime,hv_synic,hv_stimer"...
          vga_model =3D 0x0
          qtest_chrdev =3D 0x0
          qtest_log =3D 0x0
          pid_file =3D <optimized out>
          incoming =3D 0x7ffdd6ee8f0a "defer"
          userconfig =3D <optimized out>
          nographic =3D false
          display_remote =3D <optimized out>
          log_mask =3D <optimized out>
          log_file =3D <optimized out>
          trace_file =3D <optimized out>
          maxram_size =3D 4294967296
          ram_slots =3D 0
          vmstate_dump_file =3D 0x0
          main_loop_err =3D 0x0
          err =3D 0x0
          list_data_dirs =3D false
          dir =3D <optimized out>
          dirs =3D <optimized out>
          bdo_queue =3D {sqh_first =3D 0x0, sqh_last =3D 0x7ffdd6ee6630}
  ---Type <return> to continue, or q <return> to quit---
          __func__ =3D "main"

  Strace show this over and over
  ppoll([{fd=3D6, events=3DPOLLIN}, {fd=3D7, events=3DPOLLIN}, {fd=3D9, eve=
nts=3DPOLLIN}, {fd=3D10, events=3DPOLLIN}, {fd=3D21, events=3DPOLLIN}, {fd=
=3D22, events=3DPOLLIN}, {fd=3D23, events=3DPOLLIN}, {fd=3D24, events=3DPOL=
LIN}, {fd=3D27, events=3DPOLLIN}], 9, {0, 594527977}, NULL, 8) =3D 0 (Timeo=
ut)

  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/1=
0 -> anon_inode:[eventfd]
  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/2=
1 -> socket:[42631161]
  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/2=
2 -> socket:[42631165]
  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/2=
3 -> socket:[42631167]
  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/2=
4 -> socket:[42631168]
  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/2=
7 -> socket:[42690422]
  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/6=
 -> anon_inode:[eventfd]
  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/7=
 -> anon_inode:[signalfd]
  lrwx------    1 root     users           64 Dec  5 13:15 /proc/20170/fd/9=
 -> anon_inode:[eventfd]

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1807052/+subscriptions

