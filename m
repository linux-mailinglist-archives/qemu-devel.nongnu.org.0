Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D7C2BB5AB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:40:44 +0100 (CET)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgCGy-0001lM-15
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgCFs-0001J8-Gh
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:39:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:44754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgCFp-0005Mb-IE
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:39:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgCFn-0004vT-R1
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 19:39:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C1E372E813F
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 19:39:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2020 19:30:19 -0000
From: Thomas Huth <1619991@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: multiseat passthrough passthru vfio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth x-bqian-u
X-Launchpad-Bug-Reporter: Brian Yglesias (x-bqian-u)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160903230715.3952.42494.malonedeb@wampee.canonical.com>
Message-Id: <160590061932.16820.12872892466628679470.malone@chaenomeles.canonical.com>
Subject: [Bug 1619991] Re: Concurrent VMs crash w/ GPU passthrough and
 multiple disks
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 79315bcef712f6c26a5505a6ff4d83910f051717
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
Reply-To: Bug 1619991 <1619991@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1619991

Title:
  Concurrent VMs crash w/ GPU passthrough and multiple disks

Status in QEMU:
  Incomplete

Bug description:
  When running multiple VMs with GPU passthrugh, both VMs will crash
  unless all virtual disks are on the same physical volume as root,
  likely on all X58 chipset motherboards.  I've tested with 3.

  Expected Behavior:  No Crash
  Result:  Both VMs GPU drivers fail and the guest OS are unrecoverable, us=
ually within seconds, though the degree of "fickleness" of it depends on th=
e multidisk setup.
  Reproducibility:  100%

  Steps to reproduce:

  *  Install OS (In my case Debian Jessie/Proxmox), and update to latest
  *  Setup VMs
  *  Setup up GPU passthrough with 1 GPU per VM, and one for host, as per h=
ttps://pve.proxmox.com/wiki/Pci_passthrough
  *  Setup up USB passthrough
  *  Launch both VM
  *  Observe "everything is working"
  *  Stop VMs
  *  Add a second disk to one of the VMs, which exists on a separate physic=
al disk from Host OS /
  *  Observe both VMs crash when the virtual disk which exists on separate =
physical media is used (i.e. copy files to the disk)
  *  Stop VMs
  *  Remove new disk, and move Guest OS virtual root disk to separate physi=
cal media.
  *  Observe both VMs crash around the time GPU driver is loaded on one

  As I mentioned earlier, there is some degree of difference in how
  difficult it is to trigger a crash, depending on the multidisk setup.
  For instance, when / is ZFS, and the virtual disks exist on a separate
  ZFS raid-z volume, both VMs must be doing some relatively intensive HW
  3d acceleration in order to trigger the crash.

  Passing two GPU to one VM works fine all the time, and running either
  VM on its in general will not trigger a crash.

  There are many variables I have yet to test, such as using sata
  instead of virtio for the virtual disks, however unfortunately I do
  not have anything from std err or logs to indicate what the problem
  could be.

  kernel verion:  Linux test-ve 4.4.15-1-pve  (other versions >=3D 4.2.1 an=
d <=3D 4.7.? tested)
  qemu version:  2.6.0 pve-qemu-kvm_2.6-1
  motherboards tested:  rampage iii, ga-ex58-ud5, asus Psomething
  CPUs tested:  i7 920, X5670

  KVM invocation 1:

  /usr/bin/kvm \
  -id 101 \
  -chardev socket,id=3Dqmp,path=3D/var/run/qemu-server/101.qmp,server,nowai=
t \
  -mon chardev=3Dqmp,mode=3Dcontrol \
  -pidfile /var/run/qemu-server/101.pid \
  -daemonize \
  -smbios type=3D1,uuid=3D450e337e-244c-429b-9aa8-afb7aee037e8 \
  -drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/kvm/OVMF-pure-=
efi.fd \
  -drive if=3Dpflash,format=3Draw,file=3D/root/101-OVMF_VARS-pure-efi.fd \
  -name Madzia-PC \
  -smp 12,sockets=3D1,cores=3D12,maxcpus=3D12 \
  -nodefaults \
  -boot menu=3Don,strict=3Don,reboot-timeout=3D1000 \
  -vga none \
  -nographic \
  -no-hpet \
  -cpu host,hv_vendor_id=3DNvidia43FIX,hv_spinlocks=3D0x1fff,hv_vapic,hv_ti=
me,hv_reset,hv_vpindex,hv_runtime,hv_relaxed,+kvm_pv_unhalt,+kvm_pv_eoi,kvm=
=3Doff \
  -m 8192 \
  -object memory-backend-ram,id=3Dram-node0,size=3D8192M \
  -numa node,nodeid=3D0,cpus=3D0-11,memdev=3Dram-node0 \
  -k en-us -readconfig /usr/share/qemu-server/pve-q35.cfg \
  -device usb-tablet,id=3Dtablet,bus=3Dehci.0,port=3D1 \
  -device vfio-pci,host=3D04:00.0,id=3Dhostpci0,bus=3Dich9-pcie-port-1,addr=
=3D0x0 \
  -device vfio-pci,host=3D04:00.1,id=3Dhostpci1,bus=3Dich9-pcie-port-2,addr=
=3D0x0 \
  -device usb-host,hostbus=3D1,hostport=3D6.1,id=3Dusb0 \
  -device usb-host,hostbus=3D1,hostport=3D6.2.1,id=3Dusb1 \
  -device usb-host,hostbus=3D1,hostport=3D6.2.2,id=3Dusb2 \
  -device usb-host,hostbus=3D1,hostport=3D6.2.3,id=3Dusb3 \
  -device usb-host,hostbus=3D1,hostport=3D6.2,id=3Dusb4 \
  -device usb-host,hostbus=3D1,hostport=3D6.3,id=3Dusb5 \
  -device usb-host,hostbus=3D1,hostport=3D6.4,id=3Dusb6 \
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x3 \
  -iscsi initiator-name=3Diqn.1993-08.org.debian:01:3f3df5515b13 \
  -drive file=3D/dev/pve/vm-101-disk-1,if=3Dnone,id=3Ddrive-virtio0,cache=
=3Dwriteback,format=3Draw,aio=3Dthreads,detect-zeroes=3Don \
  -device virtio-blk-pci,drive=3Ddrive-virtio0,id=3Dvirtio0,bus=3Dpci.0,add=
r=3D0xa,bootindex=3D100 \
  -netdev type=3Dtap,id=3Dnet0,ifname=3Dtap101i0,script=3D/var/lib/qemu-ser=
ver/pve-bridge,downscript=3D/var/lib/qemu-server/pve-bridgedown,vhost=3Don \
  -device virtio-net-pci,mac=3D4E:DD:47:D7:DF:C9,netdev=3Dnet0,bus=3Dpci.0,=
addr=3D0x12,id=3Dnet0 \
  -rtc driftfix=3Dslew,base=3Dlocaltime \
  -machine type=3Dq35 \
  -global kvm-pit.lost_tick_policy=3Ddiscard

  KVM invocation 2:

  /usr/bin/kvm \
  -id 102 \
  -chardev socket,id=3Dqmp,path=3D/var/run/qemu-server/102.qmp,server,nowai=
t \
  -mon chardev=3Dqmp,mode=3Dcontrol \
  -pidfile /var/run/qemu-server/102.pid \
  -daemonize \
  -smbios type=3D1,uuid=3D450e337e-244c-429b-9aa8-afb7aee037e8 \
  -drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/kvm/OVMF-pure-=
efi.fd \
  -drive if=3Dpflash,format=3Draw,file=3D/root/102-OVMF_VARS-pure-efi.fd \
  -name Madzia-PC \
  -smp 12,sockets=3D1,cores=3D12,maxcpus=3D12 \
  -nodefaults \
  -boot menu=3Don,strict=3Don,reboot-timeout=3D1000 \
  -vga none \
  -nographic \
  -no-hpet \
  -cpu host,hv_vendor_id=3DNvidia43FIX,hv_spinlocks=3D0x1fff,hv_vapic,hv_ti=
me,hv_reset,hv_vpindex,hv_runtime,hv_relaxed,+kvm_pv_unhalt,+kvm_pv_eoi,kvm=
=3Doff \
  -m 512 \
  -object memory-backend-ram,id=3Dram-node0,size=3D512M \
  -numa node,nodeid=3D0,cpus=3D0-11,memdev=3Dram-node0 \
  -k en-us \
  -readconfig /usr/share/qemu-server/pve-q35.cfg \
  -device usb-tablet,id=3Dtablet,bus=3Dehci.0,port=3D1 \
  -device vfio-pci,host=3D05:00.0,id=3Dhostpci2,bus=3Dich9-pcie-port-3,addr=
=3D0x0 \
  -device vfio-pci,host=3D05:00.1,id=3Dhostpci3,bus=3Dich9-pcie-port-4,addr=
=3D0x0 \
  -device usb-host,hostbus=3D2,hostport=3D2.1,id=3Dusb0 \
  -device usb-host,hostbus=3D2,hostport=3D2.2,id=3Dusb1 \
  -device usb-host,hostbus=3D2,hostport=3D2.3,id=3Dusb2 \
  -device usb-host,hostbus=3D2,hostport=3D2.4,id=3Dusb3 \
  -device usb-host,hostbus=3D2,hostport=3D2.5,id=3Dusb4 \
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x3 \
  -iscsi initiator-name=3Diqn.1993-08.org.debian:01:3f3df5515b13 \
  -drive file=3D/dev/pve/vm-102-disk-1,if=3Dnone,id=3Ddrive-virtio0,cache=
=3Dwriteback,format=3Draw,aio=3Dthreads,detect-zeroes=3Don \
  -device virtio-blk-pci,drive=3Ddrive-virtio0,id=3Dvirtio0,bus=3Dpci.0,add=
r=3D0xa,bootindex=3D100 \
  -netdev type=3Dtap,id=3Dnet0,ifname=3Dtap102i0,script=3D/var/lib/qemu-ser=
ver/pve-bridge,downscript=3D/var/lib/qemu-server/pve-bridgedown,vhost=3Don \
  -device virtio-net-pci,mac=3D4E:DD:47:D7:DF:C9,netdev=3Dnet0,bus=3Dpci.0,=
addr=3D0x12,id=3Dnet0 \
  -rtc driftfix=3Dslew,base=3Dlocaltime \
  -machine type=3Dq35 \
  -global kvm-pit.lost_tick_policy=3Ddiscard

  Please let me know what additional information may be helpful, or how
  I can be of any assistance.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1619991/+subscriptions

