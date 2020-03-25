Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770D192423
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 10:33:10 +0100 (CET)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH2PM-0001we-H6
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 05:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jH2NS-0000yF-BA
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 05:31:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jH2NQ-0008H9-Pf
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 05:31:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:40040)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jH2NQ-0008G2-KF
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 05:31:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jH2NP-0008GD-0H
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 09:31:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F05AA2E80C3
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 09:31:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Mar 2020 09:25:36 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1868116@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Triaged; importance=High; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=vte2.91; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: amd64 apport-bug champagne focal rls-ee-incoming
 server-next
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: egmont-gmail leozinho29-eu paelzer
X-Launchpad-Bug-Reporter: =?utf-8?q?Leonardo_M=C3=BCller_=28leozinho29-eu?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <158463145822.18899.10972607578883935283.malonedeb@chaenomeles.canonical.com>
Message-Id: <158512833618.16008.3084489727309273836.malone@gac.canonical.com>
Subject: [Bug 1868116] Re: QEMU monitor no longer works
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 96ed93164c17ba08020065e81ffba5a8676748a8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1868116 <1868116@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not really a UI guy, so I was checking what I might have lost by disabl=
ing VTE and found the very old [1]. That list of features really seems to m=
ake disabling VTE not an real option:
  "It's also screen reader accessible, supports copy/paste, proper scrollin=
g and
   most of the other features you would expect from a terminal widget."

After seeing that Cole authored the "drop PTY" [3] patch I have
subscribed him here as well.

I have tried to answer and ask a few questions on the VTE issue [2] to
get it make progress, but it would really benefit getting the attention
of Gerhard and Cole (or anyone else who feels the UI-power).

[1]: https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dd861def367b516055dc4=
c46dc1305143ee653c84
[2]: https://gitlab.gnome.org/GNOME/vte/issues/222
[3]: https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dd4370741402a97b8b6d0=
c38fef18ab38bf25ab22

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868116

Title:
  QEMU monitor no longer works

Status in QEMU:
  New
Status in qemu package in Ubuntu:
  Triaged
Status in vte2.91 package in Ubuntu:
  New

Bug description:
  Repro:
  VTE
  $ meson _build && ninja -C _build && ninja -C _build install

  qemu:
  $ ../configure --python=3D/usr/bin/python3 --disable-werror --disable-use=
r --disable-linux-user --disable-docs --disable-guest-agent --disable-sdl -=
-enable-gtk --disable-vnc --disable-xen --disable-brlapi --disable-fdt --di=
sable-hax --disable-vde --disable-netmap --disable-rbd --disable-libiscsi -=
-disable-libnfs --disable-smartcard --disable-libusb --disable-usb-redir --=
disable-seccomp --disable-glusterfs --disable-tpm --disable-numa --disable-=
opengl --disable-virglrenderer --disable-xfsctl --disable-vxhs --disable-sl=
irp --disable-blobs --target-list=3Dx86_64-softmmu --disable-rdma --disable=
-pvrdma --disable-attr --disable-vhost-net --disable-vhost-vsock --disable-=
vhost-scsi --disable-vhost-crypto --disable-vhost-user --disable-spice --di=
sable-qom-cast-debug --disable-vxhs --disable-bochs --disable-cloop --disab=
le-dmg --disable-qcow1 --disable-vdi --disable-vvfat --disable-qed --disabl=
e-parallels --disable-sheepdog --disable-avx2 --disable-nettle --disable-gn=
utls --disable-capstone --disable-tools --disable-libpmem --disable-iconv -=
-disable-cap-ng
  $ make

  Test:
  $ LD_LIBRARY_PATH=3D/usr/local/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH ./b=
uild/x86_64-softmmu/qemu-system-x86_64 -enable-kvm --drive media=3Dcdrom,fi=
le=3Dhttp://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/cur=
rent/images/netboot/mini.iso
  - switch to monitor with CTRL+ALT+2
  - try to enter something

  Affects head of both usptream git repos.

  =

  --- original bug ---

  It was observed that the QEMU console (normally accessible using
  Ctrl+Alt+2) accepts no input, so it can't be used. This is being
  problematic because there are cases where it's required to send
  commands to the guest, or key combinations that the host would grab
  (as Ctrl-Alt-F1 or Alt-F4).

  ProblemType: Bug
  DistroRelease: Ubuntu 20.04
  Package: qemu 1:4.2-3ubuntu2
  Uname: Linux 5.6.0-rc6+ x86_64
  ApportVersion: 2.20.11-0ubuntu20
  Architecture: amd64
  CurrentDesktop: XFCE
  Date: Thu Mar 19 12:16:31 2020
  Dependencies:

  InstallationDate: Installed on 2017-06-13 (1009 days ago)
  InstallationMedia: Xubuntu 17.04 "Zesty Zapus" - Release amd64 (20170412)
  KvmCmdLine:
  =C2=A0COMMAND         STAT  EUID  RUID     PID    PPID %CPU COMMAND
  =C2=A0qemu-system-x86 Sl+   1000  1000   34275   25235 29.2 qemu-system-x=
86_64 -m 4G -cpu Skylake-Client -device virtio-vga,virgl=3Dtrue,xres=3D1280=
,yres=3D720 -accel kvm -device nec-usb-xhci -serial vc -serial stdio -hda /=
home/usuario/Sistemas/androidx86.img -display gtk,gl=3Don -device usb-audio
  =C2=A0kvm-nx-lpage-re S        0     0   34284       2  0.0 [kvm-nx-lpage=
-re]
  =C2=A0kvm-pit/34275   S        0     0   34286       2  0.0 [kvm-pit/3427=
5]
  MachineType: LENOVO 80UG
  ProcKernelCmdLine: BOOT_IMAGE=3D/boot/vmlinuz-5.6.0-rc6+ root=3DUUID=3D6b=
4ae5c0-c78c-49a6-a1ba-029192618a7a ro quiet ro kvm.ignore_msrs=3D1 kvm.repo=
rt_ignored_msrs=3D0 kvm.halt_poll_ns=3D0 kvm.halt_poll_ns_grow=3D0 i915.ena=
ble_gvt=3D1 i915.fastboot=3D1 cgroup_enable=3Dmemory swapaccount=3D1 zswap.=
enabled=3D1 zswap.zpool=3Dz3fold resume=3DUUID=3Da82e38a0-8d20-49dd-9cbd-de=
7216b589fc log_buf_len=3D16M usbhid.quirks=3D0x0079:0x0006:0x100000 config_=
scsi_mq_default=3Dy scsi_mod.use_blk_mq=3D1 mtrr_gran_size=3D64M mtrr_chunk=
_size=3D64M nbd.nbds_max=3D2 nbd.max_part=3D63
  SourcePackage: qemu
  UpgradeStatus: Upgraded to focal on 2019-12-22 (87 days ago)
  dmi.bios.date: 08/09/2018
  dmi.bios.vendor: LENOVO
  dmi.bios.version: 0XCN45WW
  dmi.board.asset.tag: NO Asset Tag
  dmi.board.name: Toronto 4A2
  dmi.board.vendor: LENOVO
  dmi.board.version: SDK0J40679 WIN
  dmi.chassis.asset.tag: NO Asset Tag
  dmi.chassis.type: 10
  dmi.chassis.vendor: LENOVO
  dmi.chassis.version: Lenovo ideapad 310-14ISK
  dmi.modalias: dmi:bvnLENOVO:bvr0XCN45WW:bd08/09/2018:svnLENOVO:pn80UG:pvr=
Lenovoideapad310-14ISK:rvnLENOVO:rnToronto4A2:rvrSDK0J40679WIN:cvnLENOVO:ct=
10:cvrLenovoideapad310-14ISK:
  dmi.product.family: IDEAPAD
  dmi.product.name: 80UG
  dmi.product.sku: LENOVO_MT_80UG_BU_idea_FM_Lenovo ideapad 310-14ISK
  dmi.product.version: Lenovo ideapad 310-14ISK
  dmi.sys.vendor: LENOVO
  mtime.conffile..etc.apport.crashdb.conf: 2019-08-29T08:39:36.787240

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1868116/+subscriptions

