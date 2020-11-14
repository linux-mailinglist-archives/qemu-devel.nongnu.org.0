Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C92B2BCC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 07:51:46 +0100 (CET)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdpPV-0008Cz-Q4
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 01:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdpOX-0007lf-5U
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 01:50:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdpOU-0005fe-K3
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 01:50:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdpOS-0007CC-FW
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 06:50:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6E4E72E80E8
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 06:50:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2020 06:38:19 -0000
From: Thomas Huth <1770724@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ihar-hrachyshka th-huth
X-Launchpad-Bug-Reporter: Ihar Hrachyshka (ihar-hrachyshka)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152606337380.25547.9159144751315221757.malonedeb@soybean.canonical.com>
Message-Id: <160533589917.32677.16728552245763385746.malone@gac.canonical.com>
Subject: [Bug 1770724] Re: e1000 takes a long time (2 seconds) to set link
 ready
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: 2a2de82ad22e8a7b33f2923cd30aab4939f5264a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 22:45:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1770724 <1770724@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1770724

Title:
  e1000 takes a long time (2 seconds) to set link ready

Status in QEMU:
  Incomplete

Bug description:
  When a VM is booted with e1000 NIC, it takes a long time (2 seconds)
  for the guest to bring up the link. This can be seen in the following
  dmesg messages:

  [    4.899773] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
  [    6.889165] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Con=
trol: RX
  [    6.891372] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

  The first message happens when the guest calls to ifup eth0; ifup does
  not hold control until the link is established. The guest I am using
  (cirros 0.4.0) then starts udhcpc DHCP client that issues a DHCP
  request, then waits for 60 seconds for reply, then repeats the DHCP
  request. When the first request is sent, the link is not ready yet, so
  the frame is lost; when the second request is sent, the link is up and
  DHCP lease is received.

  If I use different NICs (e1000e, virtio, rtl*), there are no dmesg
  messages, and the very first DHCP request correctly reaches outside
  and results in a lease acquired.

  The qemu version I am using is 2.10.1 from Fedora 27. I tried to
  reproduce with runtime from Fedora 29 that includes 2.12 but I have
  different issues there that block me from reproducing the original
  issue (there, I get kernel traces, irq interrupt errors, and no
  network link at all).

  For the record, the qemu in question is started by kubevirt inside a
  docker container with Fedora 27 based image.

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

  The command line of qemu is as follows:

  27404 ?        Sl     0:10 /usr/bin/qemu-system-x86_64 -machine
  accel=3Dkvm -name guest=3Ddefault_ovm-cirros,debug-threads=3Don -S -object
  secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-1
  -default_ovm-cirros/master-key.aes -machine
  pc-q35-2.10,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff -m 62 -realtime
  mlock=3Doff -smp 1,sockets=3D1,cores=3D1,threads=3D1 -uuid
  8769fdbe-d957-5567-bd71-114ba0eb4811 -no-user-config -nodefaults
  -chardev socket,id=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/domain-1
  -default_ovm-cirros/monitor.sock,server,nowait -mon
  chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc -no-shu=
tdown
  -no-acpi -boot strict=3Don -device
  i82801b11-bridge,id=3Dpci.1,bus=3Dpcie.0,addr=3D0x1e -device pci-
  bridge,chassis_nr=3D2,id=3Dpci.2,bus=3Dpci.1,addr=3D0x0 -device pcie-root-
  port,port=3D0x10,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,multifunction=3Don,a=
ddr=3D0x2
  -device pcie-root-
  port,port=3D0x11,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x2.0x1 -devi=
ce
  pcie-root-port,port=3D0x12,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=3D0x2=
.0x2
  -device pcie-root-
  port,port=3D0x13,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0,addr=3D0x2.0x3 -devi=
ce
  pcie-root-port,port=3D0x14,chassis=3D7,id=3Dpci.7,bus=3Dpcie.0,addr=3D0x2=
.0x4
  -device nec-usb-xhci,id=3Dusb,bus=3Dpci.3,addr=3D0x0 -drive
  file=3D/var/run/libvirt/kubevirt-ephemeral-disk/registry-disk-
  data/default/ovm-cirros/disk_registryvolume/disk-
  image.raw,format=3Draw,if=3Dnone,id=3Ddrive-virtio-disk0 -device virtio-b=
lk-
  pci,scsi=3Doff,bus=3Dpci.4,addr=3D0x0,drive=3Ddrive-virtio-disk0,id=3Dvir=
tio-
  disk0,bootindex=3D1 -drive file=3D/var/run/libvirt/kubevirt-ephemeral-disk
  /cloud-init-data/default/ovm-cirros/noCloud.iso,format=3Draw,if=3Dnone,id
  =3Ddrive-virtio-disk1 -device virtio-blk-
  pci,scsi=3Doff,bus=3Dpci.5,addr=3D0x0,drive=3Ddrive-virtio-disk1,id=3Dvir=
tio-
  disk1 -netdev tap,fd=3D23,id=3Dhostnet0 -device
  e1000,netdev=3Dhostnet0,id=3Dnet0,mac=3D0a:58:0a:f4:01:e1,bus=3Dpci.2,add=
r=3D0x1
  -chardev socket,id=3Dcharserial0,path=3D/var/run/kubevirt-private/default
  /ovm-cirros/virt-serial0,server,nowait -device isa-
  serial,chardev=3Dcharserial0,id=3Dserial0 -vnc vnc=3Dunix:/var/run/kubevi=
rt-
  private/default/ovm-cirros/virt-vnc -device
  VGA,id=3Dvideo0,vgamem_mb=3D16,bus=3Dpcie.0,addr=3D0x1 -device virtio-bal=
loon-
  pci,id=3Dballoon0,bus=3Dpci.6,addr=3D0x0 -msg timestamp=3Don

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

  Hypervisor versions of interest:

  [vagrant@node02 ~]$ sudo docker exec -it $(sudo docker ps | grep virt-lau=
ncher-ovm-cirros | grep entrypoint | awk -e '{print $1}') rpm -qa | grep 'q=
emu\|libvirt'
  qemu-block-curl-2.10.1-2.fc27.x86_64
  qemu-block-ssh-2.10.1-2.fc27.x86_64
  qemu-block-nfs-2.10.1-2.fc27.x86_64
  qemu-system-x86-core-2.10.1-2.fc27.x86_64
  libvirt-daemon-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-disk-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-mpath-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-zfs-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-nwfilter-3.7.0-4.fc27.x86_64
  qemu-img-2.10.1-2.fc27.x86_64
  qemu-common-2.10.1-2.fc27.x86_64
  qemu-block-dmg-2.10.1-2.fc27.x86_64
  qemu-block-rbd-2.10.1-2.fc27.x86_64
  qemu-system-x86-2.10.1-2.fc27.x86_64
  libvirt-libs-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-core-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-qemu-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-gluster-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-logical-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-rbd-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-sheepdog-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-nodedev-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-secret-3.7.0-4.fc27.x86_64
  libvirt-client-3.7.0-4.fc27.x86_64
  ipxe-roms-qemu-20161108-2.gitb991c67.fc26.noarch
  qemu-block-gluster-2.10.1-2.fc27.x86_64
  qemu-block-iscsi-2.10.1-2.fc27.x86_64
  qemu-kvm-2.10.1-2.fc27.x86_64
  libvirt-daemon-driver-network-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-iscsi-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-storage-scsi-3.7.0-4.fc27.x86_64
  libvirt-daemon-driver-interface-3.7.0-4.fc27.x86_64
  libvirt-daemon-kvm-3.7.0-4.fc27.x86_64

  [vagrant@node02 ~]$ uname -a
  Linux node02 3.10.0-693.17.1.el7.x86_64 #1 SMP Thu Jan 25 20:13:58 UTC 20=
18 x86_64 x86_64 x86_64 GNU/Linux

  [vagrant@node02 ~]$ cat /etc/redhat-release
  CentOS Linux release 7.4.1708 (Core)

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

  Guest:

  $ uname -a
  Linux ovm-cirros 4.4.0-28-generic #47-Ubuntu SMP Fri Jun 24 10:09:13 UTC =
2016 x86_64 GNU/Linux

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

  Bug trackers for other projects:
  - cirros: https://bugs.launchpad.net/cirros/+bug/1768955
  - kubevirt: https://github.com/kubevirt/kubevirt/issues/936

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1770724/+subscriptions

