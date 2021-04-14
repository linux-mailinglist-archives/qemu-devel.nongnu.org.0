Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71BB35ED61
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 08:43:47 +0200 (CEST)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWZFZ-0007wq-NM
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 02:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWZDW-0007Vx-Gl
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 02:41:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWZDH-0003d8-4r
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 02:41:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWZDA-0003tr-6L
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 06:41:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2CF5A2E8041
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 06:41:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Apr 2021 06:24:54 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1921664@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Low; assignee=None; 
X-Launchpad-Bug-Tags: apport-bug arm64 hirsute uec-images
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paelzer tommy-ubuntuone
X-Launchpad-Bug-Reporter: Tommy Thorn (tommy-ubuntuone)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <161698578843.25105.11508850027610231738.malonedeb@wampee.canonical.com>
Message-Id: <161838149423.14903.5252102679309413713.malone@chaenomeles.canonical.com>
Subject: [Bug 1921664] Re: Recent update broke qemu-system-riscv64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9327c982b35e4a485a3c716663ed8345e279c16e"; Instance="production"
X-Launchpad-Hash: 0fc15b6657331c726982a57fbd316027b708f343
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1921664 <1921664@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also I've rebuilt the most recent master c1e90def01 about ~55 commits newer=
 than 6.0-rc2.
As in the experiments of Tommy I was unable to reproduce it there.
But with the data from the tests before it is very likely that this is more
likely an accident by having a slightly different timing than a fix (to be
clear I'd appreciate if there is a fix, I'm just unable to derive from this
being good I could e.g. bisect).

export CFLAGS=3D"-O0 -g -fPIC"
../configure --enable-system --disable-xen --disable-werror --disable-docs =
--disable-libudev --disable-guest-agent --disable-sdl --disable-gtk --disab=
le-vnc --disable-xen --disable-brlapi  --disable-hax --disable-vde --disabl=
e-netmap --disable-rbd --disable-libiscsi --disable-libnfs --disable-smartc=
ard --disable-libusb --disable-usb-redir --disable-seccomp --disable-gluste=
rfs --disable-tpm --disable-numa --disable-opengl --disable-virglrenderer -=
-disable-xfsctl --disable-slirp --disable-blobs --disable-rdma --disable-pv=
rdma --disable-attr --disable-vhost-net --disable-vhost-vsock --disable-vho=
st-scsi --disable-vhost-crypto --disable-vhost-user --disable-spice --disab=
le-qom-cast-debug --disable-bochs --disable-cloop --disable-dmg --disable-q=
cow1 --disable-vdi --disable-vvfat --disable-qed --disable-parallels --disa=
ble-sheepdog --disable-avx2 --disable-nettle --disable-gnutls --disable-cap=
stone --enable-tools --disable-libssh --disable-libpmem --disable-cap-ng --=
disable-vte --disable-iconv --disable-curses --disable-linux-aio --disable-=
linux-io-uring --disable-kvm --disable-replication --audio-drv-list=3D"" --=
disable-vhost-kernel --disable-vhost-vdpa --disable-live-block-migration --=
disable-keyring --disable-auth-pam --disable-curl --disable-strip --enable-=
fdt --target-list=3D"riscv64-softmmu"
make -j10

Just like the package build that configures as
   coroutine backend: ucontext
   coroutine pool: YES

5/5 runs with that were ok
But since we know it is racy I'm unsure if that implies much :-/

P.S. I have not yet went into a build-option bisect, but chances are it cou=
ld be
related. But that is too much stabbing in the dark, maybe someone experienc=
ed
in the coroutines code can already make sense of all the info we have gathe=
red so
far.
I'll update the bug description and add an upstream task to have all the in=
fo we have get mirrored to the qemu mailing lists.

** Summary changed:

- Recent update broke qemu-system-riscv64
+ Coroutines are racy for risc64 emu on arm64 - crash on Assertion

** Description changed:

+ Note: this could as well be "riscv64 on arm64" for being slow@slow and af=
fect
+ other architectures as well.
+ =

+ The following case triggers on a Raspberry Pi4 running with arm64 on
+ Ubuntu 21.04 [1][2]. It might trigger on other environments as well,
+ but that is what we have seen it so far.
+ =

+    $ wget https://github.com/carlosedp/riscv-bringup/releases/download/v1=
.0/UbuntuFocal-riscv64-QemuVM.tar.gz
+    $ tar xzf UbuntuFocal-riscv64-QemuVM.tar.gz
+    $ ./run_riscvVM.sh
+ (wait ~2 minutes)
+    [ OK ] Reached target Local File Systems (Pre).
+    [ OK ] Reached target Local File Systems.
+             Starting udev Kernel Device Manager...
+ qemu-system-riscv64: ../../util/qemu-coroutine-lock.c:57: qemu_co_queue_w=
ait_impl: Assertion `qemu_in_coroutine()' failed.
+ =

+ This is often, but not 100% reproducible and the cases differ slightly we
+ see either of:
+ - qemu-system-riscv64: ../../util/qemu-coroutine-lock.c:57: qemu_co_queue=
_wait_impl: Assertion `qemu_in_coroutine()' failed.
+ - qemu-system-riscv64: ../../block/aio_task.c:64: aio_task_pool_wait_one:=
 Assertion `qemu_coroutine_self() =3D=3D pool->main_co' failed.
+ =

+ Rebuilding working cases has shown to make them fail, as well as rebulding
+ (or even reinstalling) bad cases has made them work. Also the same builds=
 on
+ different arm64 CPUs behave differently. TL;DR: The full list of conditio=
ns
+ influencing good/bad case here are not yet known.
+ =

+ [1]: https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry=
-pi#1-overview
+ [2]: http://cdimage.ubuntu.com/daily-preinstalled/pending/hirsute-preinst=
alled-desktop-arm64+raspi.img.xz
+ =

+ =

+ --- --- original report --- ---
+ =

  I regularly run a RISC-V (RV64GC) QEMU VM, but an update a few days ago
  broke it.  Now when I launch it, it hits an assertion:
  =

-                                                                          =
         =

- OpenSBI v0.6                                                             =
         =

-    ____                    _____ ____ _____                             =

-   / __ \                  / ____|  _ \_   _|                             =
         =

-  | |  | |_ __   ___ _ __ | (___ | |_) || |                               =
         =

-  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |                               =
                                                                           =
                 =

-  | |__| | |_) |  __/ | | |____) | |_) || |_                              =
                                                                           =
                 =

-   \____/| .__/ \___|_| |_|_____/|____/_____|                             =
         =

-         | |                                                              =
                                                                           =
                 =

-         |_|                                                              =
         =

-                                                                          =
         =

+ OpenSBI v0.6
+ =C2=A0=C2=A0=C2=A0____                    _____ ____ _____
+ =C2=A0=C2=A0/ __ \                  / ____|  _ \_   _|
+ =C2=A0| |  | |_ __   ___ _ __ | (___ | |_) || |
+ =C2=A0| |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
+ =C2=A0| |__| | |_) |  __/ | | |____) | |_) || |_
+ =C2=A0=C2=A0\____/| .__/ \___|_| |_|_____/|____/_____|
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| |
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|_|
+ =

  ...
- Found /boot/extlinux/extlinux.conf                                       =
                                                                           =
                 =

- Retrieving file: /boot/extlinux/extlinux.conf                            =
                                                                           =
                 =

- 618 bytes read in 2 ms (301.8 KiB/s)                                     =
         =

- RISC-V Qemu Boot Options                                                 =
         =

- 1:      Linux kernel-5.5.0-dirty         =

- 2:      Linux kernel-5.5.0-dirty (recovery mode)                         =
   =

- Enter choice: 1:        Linux kernel-5.5.0-dirty                         =
         =

- Retrieving file: /boot/initrd.img-5.5.0-dirty                            =
                                                                           =
                 =

- qemu-system-riscv64: ../../block/aio_task.c:64: aio_task_pool_wait_one: A=
ssertion `qemu_coroutine_self() =3D=3D pool->main_co' failed.              =
                     =

+ Found /boot/extlinux/extlinux.conf
+ Retrieving file: /boot/extlinux/extlinux.conf
+ 618 bytes read in 2 ms (301.8 KiB/s)
+ RISC-V Qemu Boot Options
+ 1:      Linux kernel-5.5.0-dirty
+ 2:      Linux kernel-5.5.0-dirty (recovery mode)
+ Enter choice: 1:        Linux kernel-5.5.0-dirty
+ Retrieving file: /boot/initrd.img-5.5.0-dirty
+ qemu-system-riscv64: ../../block/aio_task.c:64: aio_task_pool_wait_one: A=
ssertion `qemu_coroutine_self() =3D=3D pool->main_co' failed.
  ./run.sh: line 31:  1604 Aborted                 (core dumped) qemu-syste=
m-riscv64 -machine virt -nographic -smp 8 -m 8G -bios fw_payload.bin -devic=
e virtio-blk-devi
  ce,drive=3Dhd0 -object rng-random,filename=3D/dev/urandom,id=3Drng0 -devi=
ce virtio-rng-device,rng=3Drng0 -drive file=3Driscv64-UbuntuFocal-qemu.qcow=
2,format=3Dqcow2,id=3Dhd0 -devi
- ce virtio-net-device,netdev=3Dusernet -netdev user,id=3Dusernet,$ports   =
             =

+ ce virtio-net-device,netdev=3Dusernet -netdev user,id=3Dusernet,$ports
  =

  Interestingly this doesn't happen on the AMD64 version of Ubuntu 21.04
  (fully updated).
- =

  =

  Think you have everything already, but just in case:
  =

  $ lsb_release -rd
  Description:    Ubuntu Hirsute Hippo (development branch)
  Release:        21.04
  =

  $ uname -a
  Linux minimacvm 5.11.0-11-generic #12-Ubuntu SMP Mon Mar 1 19:27:36 UTC 2=
021 aarch64 aarch64 aarch64 GNU/Linux
  (note this is a VM running on macOS/M1)
  =

  $ apt-cache policy qemu
  qemu:
-   Installed: 1:5.2+dfsg-9ubuntu1
-   Candidate: 1:5.2+dfsg-9ubuntu1
-   Version table:
-  *** 1:5.2+dfsg-9ubuntu1 500
-         500 http://ports.ubuntu.com/ubuntu-ports hirsute/universe arm64 P=
ackages
-         100 /var/lib/dpkg/status
+ =C2=A0=C2=A0Installed: 1:5.2+dfsg-9ubuntu1
+ =C2=A0=C2=A0Candidate: 1:5.2+dfsg-9ubuntu1
+ =C2=A0=C2=A0Version table:
+ =C2=A0*** 1:5.2+dfsg-9ubuntu1 500
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0500 http://ports.ubuntu.c=
om/ubuntu-ports hirsute/universe arm64 Packages
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0100 /var/lib/dpkg/status
  =

  ProblemType: Bug
  DistroRelease: Ubuntu 21.04
  Package: qemu 1:5.2+dfsg-9ubuntu1
  ProcVersionSignature: Ubuntu 5.11.0-11.12-generic 5.11.0
  Uname: Linux 5.11.0-11-generic aarch64
  ApportVersion: 2.20.11-0ubuntu61
  Architecture: arm64
  CasperMD5CheckResult: unknown
  CurrentDmesg:
-  Error: command ['pkexec', 'dmesg'] failed with exit code 127: polkit-age=
nt-helper-1: error response to PolicyKit daemon: GDBus.Error:org.freedeskto=
p.PolicyKit1.Error.Failed: No session for cookie
-  Error executing command as another user: Not authorized
-  =

-  This incident has been reported.
+ =C2=A0Error: command ['pkexec', 'dmesg'] failed with exit code 127: polki=
t-agent-helper-1: error response to PolicyKit daemon: GDBus.Error:org.freed=
esktop.PolicyKit1.Error.Failed: No session for cookie
+ =C2=A0Error executing command as another user: Not authorized
+ =

+ =C2=A0This incident has been reported.
  Date: Mon Mar 29 02:33:25 2021
  Dependencies:
-  =

+ =

  KvmCmdLine: COMMAND         STAT  EUID  RUID     PID    PPID %CPU COMMAND
  Lspci-vt:
-  -[0000:00]-+-00.0  Apple Inc. Device f020
-             +-01.0  Red Hat, Inc. Virtio network device
-             +-05.0  Red Hat, Inc. Virtio console
-             +-06.0  Red Hat, Inc. Virtio block device
-             \-07.0  Red Hat, Inc. Virtio RNG
+ =C2=A0-[0000:00]-+-00.0  Apple Inc. Device f020
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-01.0  Red Hat, Inc. Virtio network device
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-05.0  Red Hat, Inc. Virtio console
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-06.0  Red Hat, Inc. Virtio block device
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\=
-07.0  Red Hat, Inc. Virtio RNG
  Lsusb: Error: command ['lsusb'] failed with exit code 1:
  Lsusb-t:
-  =

+ =

  Lsusb-v: Error: command ['lsusb', '-v'] failed with exit code 1:
  ProcEnviron:
-  TERM=3Dscreen
-  PATH=3D(custom, no user)
-  XDG_RUNTIME_DIR=3D<set>
-  LANG=3DC.UTF-8
-  SHELL=3D/bin/bash
+ =C2=A0TERM=3Dscreen
+ =C2=A0PATH=3D(custom, no user)
+ =C2=A0XDG_RUNTIME_DIR=3D<set>
+ =C2=A0LANG=3DC.UTF-8
+ =C2=A0SHELL=3D/bin/bash
  ProcKernelCmdLine: console=3Dhvc0 root=3D/dev/vda
  SourcePackage: qemu
  UpgradeStatus: Upgraded to hirsute on 2020-12-30 (88 days ago)
  acpidump:
-  Error: command ['pkexec', '/usr/share/apport/dump_acpi_tables.py'] faile=
d with exit code 127: polkit-agent-helper-1: error response to PolicyKit da=
emon: GDBus.Error:org.freedesktop.PolicyKit1.Error.Failed: No session for c=
ookie
-  Error executing command as another user: Not authorized
-  =

-  This incident has been reported.
+ =C2=A0Error: command ['pkexec', '/usr/share/apport/dump_acpi_tables.py'] =
failed with exit code 127: polkit-agent-helper-1: error response to PolicyK=
it daemon: GDBus.Error:org.freedesktop.PolicyKit1.Error.Failed: No session =
for cookie
+ =C2=A0Error executing command as another user: Not authorized
+ =

+ =C2=A0This incident has been reported.

** Also affects: qemu
   Importance: Undecided
       Status: New

** Changed in: qemu (Ubuntu)
   Importance: Undecided =3D> Low

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921664

Title:
  Coroutines are racy for risc64 emu on arm64 - crash on Assertion

Status in QEMU:
  New
Status in qemu package in Ubuntu:
  Confirmed

Bug description:
  Note: this could as well be "riscv64 on arm64" for being slow@slow and af=
fect
  other architectures as well.

  The following case triggers on a Raspberry Pi4 running with arm64 on
  Ubuntu 21.04 [1][2]. It might trigger on other environments as well,
  but that is what we have seen it so far.

     $ wget https://github.com/carlosedp/riscv-bringup/releases/download/v1=
.0/UbuntuFocal-riscv64-QemuVM.tar.gz
     $ tar xzf UbuntuFocal-riscv64-QemuVM.tar.gz
     $ ./run_riscvVM.sh
  (wait ~2 minutes)
     [ OK ] Reached target Local File Systems (Pre).
     [ OK ] Reached target Local File Systems.
              Starting udev Kernel Device Manager...
  qemu-system-riscv64: ../../util/qemu-coroutine-lock.c:57: qemu_co_queue_w=
ait_impl: Assertion `qemu_in_coroutine()' failed.

  This is often, but not 100% reproducible and the cases differ slightly we
  see either of:
  - qemu-system-riscv64: ../../util/qemu-coroutine-lock.c:57: qemu_co_queue=
_wait_impl: Assertion `qemu_in_coroutine()' failed.
  - qemu-system-riscv64: ../../block/aio_task.c:64: aio_task_pool_wait_one:=
 Assertion `qemu_coroutine_self() =3D=3D pool->main_co' failed.

  Rebuilding working cases has shown to make them fail, as well as rebulding
  (or even reinstalling) bad cases has made them work. Also the same builds=
 on
  different arm64 CPUs behave differently. TL;DR: The full list of conditio=
ns
  influencing good/bad case here are not yet known.

  [1]: https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry=
-pi#1-overview
  [2]: http://cdimage.ubuntu.com/daily-preinstalled/pending/hirsute-preinst=
alled-desktop-arm64+raspi.img.xz

  =

  --- --- original report --- ---

  I regularly run a RISC-V (RV64GC) QEMU VM, but an update a few days
  ago broke it.  Now when I launch it, it hits an assertion:

  OpenSBI v0.6
  =C2=A0=C2=A0=C2=A0____                    _____ ____ _____
  =C2=A0=C2=A0/ __ \                  / ____|  _ \_   _|
  =C2=A0| |  | |_ __   ___ _ __ | (___ | |_) || |
  =C2=A0| |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
  =C2=A0| |__| | |_) |  __/ | | |____) | |_) || |_
  =C2=A0=C2=A0\____/| .__/ \___|_| |_|_____/|____/_____|
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| |
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|_|

  ...
  Found /boot/extlinux/extlinux.conf
  Retrieving file: /boot/extlinux/extlinux.conf
  618 bytes read in 2 ms (301.8 KiB/s)
  RISC-V Qemu Boot Options
  1:      Linux kernel-5.5.0-dirty
  2:      Linux kernel-5.5.0-dirty (recovery mode)
  Enter choice: 1:        Linux kernel-5.5.0-dirty
  Retrieving file: /boot/initrd.img-5.5.0-dirty
  qemu-system-riscv64: ../../block/aio_task.c:64: aio_task_pool_wait_one: A=
ssertion `qemu_coroutine_self() =3D=3D pool->main_co' failed.
  ./run.sh: line 31:  1604 Aborted                 (core dumped) qemu-syste=
m-riscv64 -machine virt -nographic -smp 8 -m 8G -bios fw_payload.bin -devic=
e virtio-blk-devi
  ce,drive=3Dhd0 -object rng-random,filename=3D/dev/urandom,id=3Drng0 -devi=
ce virtio-rng-device,rng=3Drng0 -drive file=3Driscv64-UbuntuFocal-qemu.qcow=
2,format=3Dqcow2,id=3Dhd0 -devi
  ce virtio-net-device,netdev=3Dusernet -netdev user,id=3Dusernet,$ports

  Interestingly this doesn't happen on the AMD64 version of Ubuntu 21.04
  (fully updated).

  Think you have everything already, but just in case:

  $ lsb_release -rd
  Description:    Ubuntu Hirsute Hippo (development branch)
  Release:        21.04

  $ uname -a
  Linux minimacvm 5.11.0-11-generic #12-Ubuntu SMP Mon Mar 1 19:27:36 UTC 2=
021 aarch64 aarch64 aarch64 GNU/Linux
  (note this is a VM running on macOS/M1)

  $ apt-cache policy qemu
  qemu:
  =C2=A0=C2=A0Installed: 1:5.2+dfsg-9ubuntu1
  =C2=A0=C2=A0Candidate: 1:5.2+dfsg-9ubuntu1
  =C2=A0=C2=A0Version table:
  =C2=A0*** 1:5.2+dfsg-9ubuntu1 500
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0500 http://ports.ubuntu.c=
om/ubuntu-ports hirsute/universe arm64 Packages
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0100 /var/lib/dpkg/status

  ProblemType: Bug
  DistroRelease: Ubuntu 21.04
  Package: qemu 1:5.2+dfsg-9ubuntu1
  ProcVersionSignature: Ubuntu 5.11.0-11.12-generic 5.11.0
  Uname: Linux 5.11.0-11-generic aarch64
  ApportVersion: 2.20.11-0ubuntu61
  Architecture: arm64
  CasperMD5CheckResult: unknown
  CurrentDmesg:
  =C2=A0Error: command ['pkexec', 'dmesg'] failed with exit code 127: polki=
t-agent-helper-1: error response to PolicyKit daemon: GDBus.Error:org.freed=
esktop.PolicyKit1.Error.Failed: No session for cookie
  =C2=A0Error executing command as another user: Not authorized

  =C2=A0This incident has been reported.
  Date: Mon Mar 29 02:33:25 2021
  Dependencies:

  KvmCmdLine: COMMAND         STAT  EUID  RUID     PID    PPID %CPU COMMAND
  Lspci-vt:
  =C2=A0-[0000:00]-+-00.0  Apple Inc. Device f020
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-01.0  Red Hat, Inc. Virtio network device
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-05.0  Red Hat, Inc. Virtio console
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-06.0  Red Hat, Inc. Virtio block device
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\=
-07.0  Red Hat, Inc. Virtio RNG
  Lsusb: Error: command ['lsusb'] failed with exit code 1:
  Lsusb-t:

  Lsusb-v: Error: command ['lsusb', '-v'] failed with exit code 1:
  ProcEnviron:
  =C2=A0TERM=3Dscreen
  =C2=A0PATH=3D(custom, no user)
  =C2=A0XDG_RUNTIME_DIR=3D<set>
  =C2=A0LANG=3DC.UTF-8
  =C2=A0SHELL=3D/bin/bash
  ProcKernelCmdLine: console=3Dhvc0 root=3D/dev/vda
  SourcePackage: qemu
  UpgradeStatus: Upgraded to hirsute on 2020-12-30 (88 days ago)
  acpidump:
  =C2=A0Error: command ['pkexec', '/usr/share/apport/dump_acpi_tables.py'] =
failed with exit code 127: polkit-agent-helper-1: error response to PolicyK=
it daemon: GDBus.Error:org.freedesktop.PolicyKit1.Error.Failed: No session =
for cookie
  =C2=A0Error executing command as another user: Not authorized

  =C2=A0This incident has been reported.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921664/+subscriptions

