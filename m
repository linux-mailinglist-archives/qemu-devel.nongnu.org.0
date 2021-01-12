Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7202F2716
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:30:04 +0100 (CET)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBJj-0004sv-Cx
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFj-00086X-V4
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:52068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFb-0000sb-Md
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFa-0004WB-IX
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8AA672E813C
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:13 -0000
From: Launchpad Bug Tracker <1794285@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gareth.bryan janitor th-huth
X-Launchpad-Bug-Reporter: Gareth Bryan (gareth.bryan)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153787868402.2071.3904469903390825954.malonedeb@wampee.canonical.com>
Message-Id: <161042503498.10246.5569534479478368379.malone@loganberry.canonical.com>
Subject: [Bug 1794285] Re: 100% Host CPU usage while guest idling
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 84bd4a3d0bc918ff2f334145ebf3882c388db538
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
Reply-To: Bug 1794285 <1794285@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1794285

Title:
  100% Host CPU usage while guest idling

Status in QEMU:
  Expired

Bug description:
  Hi,

  We have an appliance that runs a FreeBSD guest on a Yocto-based host via =
qemu-system-x86_64.
  Everything functions fine however the host uses n00% of the CPU (where n =
=3D #smp) and RAM allocated to it whilst the 1 guest is sat nearing idle.

  Host:
  PID     USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
  4406    root      20   0 16.7g  16g  26m S  500 53.0  17958:38 qemu-syste=
m-x86

  Guest:
  CPU 0:  0.0% user,  0.0% nice,  0.4% system,  0.0% interrupt, 99.6% idle
  CPU 1:  0.0% user,  0.0% nice,  0.4% system,  0.0% interrupt, 99.6% idle
  CPU 2:  0.0% user,  0.0% nice,  0.0% system,  0.0% interrupt,  100% idle
  CPU 3:  0.0% user,  0.0% nice,  0.0% system,  0.0% interrupt,  100% idle
  CPU 4:  0.4% user,  0.0% nice,  0.0% system,  0.0% interrupt, 99.6% idle
  Mem: 43M Active, 4783M Inact, 1530M Wired, 911M Buf, 9553M Free
  Swap: 3072M Total, 3072M Free

  I have logged this with the appliance vendor and received the response:
  "This is expected behaviour and you will see the same in any case where a=
 Guest OS runs over a Host OS.
  Host here has 5 CPUs and it has assigned all of them to Guest. =

  Since the Host is not being shared by any Guest OS; you will always see t=
he 500% (or the 5 CPUs) given to qemu-system-x86.
  I do see the same in lab and is very much expected"

  This feels fundamentally wrong to me.
  I'm somewhat limited by what can be tested due to the nature of this bein=
g an appliance rather than a mainstream distro.

  I'm looking for feedback that I can use to push the vendor into
  investigating this issue.

  Versions below.

  Many thanks,
  Gareth


  Host:
  Linux 204a-node 3.10.100-ovp-rt110-WR6.0.0.31_preempt-rt #1 SMP Fri
  Aug 3 01:59:01 PDT 2018 x86_64 x86_64 x86_64 GNU/Linux

  Qemu:
  QEMU emulator version 1.7.2, Copyright (c) 2003-2008 Fabrice Bellard

  Command:
  (Vendor identifying information has been removed)

  /usr/bin/qemu-system-x86_64 \
  -name REMOVED \
  -S \
  -machine pc-i440fx-1.7,accel=3Dkvm,usb=3Doff \
  -m 16384 \
  -realtime mlock=3Don \
  -smp 5,sockets=3D5,cores=3D1,threads=3D1 \
  -uuid 76277b29-3bd4-4dd4-a705-ed34d6449d6d \
  -nographic \
  -no-user-config \
  -nodefaults \
  -chardev socket,id=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/REMOVED.mon=
itor,server,nowait \
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
  -rtc base=3Dutc \
  -no-shutdown \
  -boot strict=3Don \
  -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \
  -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D0x17 \
  -netdev tap,fd=3D22,id=3Dhostnet0,vhost=3Don,vhostfd=3D23 \
  -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3DREMOVED,bus=3Dpc=
i.0,addr=3D0x11 \
  -netdev tap,ifname=3Dtap1,script=3D/etc/vehostd/XXX-em3-ifup,id=3Dhostnet=
1,vhost=3Don,vhostfd=3D24 \
  -device virtio-net-pci,netdev=3Dhostnet1,id=3Dnet1,mac=3DREMOVED,bus=3Dpc=
i.0,addr=3D0x12 \
  -netdev tap,ifname=3Dtap2,script=3D/etc/vehostd/REMOVED-em4-ifup-SUMMIT,i=
d=3Dhostnet2,vhost=3Don,vhostfd=3D25 \
  -device virtio-net-pci,netdev=3Dhostnet2,id=3Dnet2,mac=3DREMOVED,bus=3Dpc=
i.0,addr=3D0x1c \
  -netdev tap,ifname=3Dtap3,script=3D/etc/vehostd/REMOVED-em4-re-re-ifup,id=
=3Dhostnet3,vhost=3Don,vhostfd=3D26 \
  -device virtio-net-pci,netdev=3Dhostnet3,id=3Dnet3,mac=3DREMOVED,bus=3Dpc=
i.0,addr=3D0x1d \
  -chardev pty,id=3Dcharserial0 \
  -device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
  -chardev tty,id=3Dcharserial1,path=3D/dev/ttyS1 \
  -device isa-serial,chardev=3Dcharserial1,id=3Dserial1 \
  -chardev tty,id=3Dcharserial2,path=3D/dev/ttyS2 \
  -device isa-serial,chardev=3Dcharserial2,id=3Dserial2 \
  -chardev tty,id=3Dcharserial3,path=3D/dev/ttyS3 \
  -device isa-serial,chardev=3Dcharserial3,id=3Dserial3 \
  -device i6300esb,id=3Dwatchdog0,bus=3Dpci.0,addr=3D0x10 \
  -watchdog-action reset \
  -object rng-random,id=3Drng0,filename=3D/dev/random \
  -device virtio-rng-pci,rng=3Drng0,max-bytes=3D1024,period=3D2000,bus=3Dpc=
i.0,addr=3D0x1e \
  -smbios type=3D0,vendor=3D"INSYDE Corp.",version=3DREMOVED,date=3D11/03/2=
017,release=3D1.00 \
  -smbios type=3D1,manufacturer=3DREMOVED,product=3DREMOVED,version=3DREMOV=
ED,serial=3DVF-NET \
  -device REMOVED-pci,host=3D0000:1c:00.0 \
  -device kvm-pci-assign,host=3D0000:00:14.0 \
  -device pci-hgcommdev,vmindex=3D0,bus=3Dpci.0,addr=3D0x16 \
  -drive file=3D/REMOVED/REMOVED-current.img,if=3Dnone,id=3Ddrive-virtio-di=
sk0,format=3Draw,cache=3Ddirectsync,aio=3Dnative \
  -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x13,drive=3Ddrive-v=
irtio-disk0,id=3Dvirtio-disk0,config-wce=3Doff,x-data-plane=3Don,bootindex=
=3D1 \
  -drive file=3D/REMOVED/REMOVED-var-config.img,if=3Dnone,id=3Ddrive-virtio=
-disk1,format=3Draw,cache=3Ddirectsync,aio=3Dnative \
  -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x15,drive=3Ddrive-v=
irtio-disk1,id=3Dvirtio-disk1,config-wce=3Doff,x-data-plane=3Don,bootindex=
=3D-1 \
  -drive file=3D/REMOVED/REMOVED-aux-disk.img,if=3Dnone,id=3Ddrive-ide0-0-1=
,format=3Draw,cache=3Ddirectsync,discard=3Dunmap \
  -device ide-hd,bus=3Dide.0,unit=3D1,drive=3Ddrive-ide0-0-1,id=3Dide0-0-1,=
bootindex=3D-1 \
  -drive file=3D/REMOVED/images/0/REMOVED-platform.img,if=3Dnone,id=3Ddrive=
-ide1-0-1,format=3Draw,cache=3Ddirectsync,discard=3Dunmap \
  -device ide-hd,bus=3Dide.1,unit=3D1,drive=3Ddrive-ide1-0-1,id=3Dide1-0-1,=
bootindex=3D-1 \
  -msg timestamp=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1794285/+subscriptions

