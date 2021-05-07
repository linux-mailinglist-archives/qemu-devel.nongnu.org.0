Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF137620F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 10:32:38 +0200 (CEST)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1levuX-0007Uo-K2
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 04:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1levt8-0006IP-OC
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:31:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:36120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1levt5-0007md-8b
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:31:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1levt1-00012K-PJ
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:31:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0CD822E8203
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 08:30:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 08:22:29 -0000
From: Thomas Huth <1889945@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: marco-s98 th-huth
X-Launchpad-Bug-Reporter: Marco Steiger (marco-s98)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159623027392.16310.13493846221319224291.malonedeb@wampee.canonical.com>
Message-Id: <162037574929.454.14698396193886686983.malone@chaenomeles.canonical.com>
Subject: [Bug 1889945] Re: virtiofsd exits when iommu_platform is enabled
 after virtiofs driver is loaded
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 39ff8d735d4485e4c11c536720a92b71add64bdc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1889945 <1889945@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1889945

Title:
  virtiofsd exits when iommu_platform is enabled after virtiofs driver
  is loaded

Status in QEMU:
  Incomplete

Bug description:
  Bug in QEMU 5.0.0:

  virtiofsd exits when iommu_platform is enabled after virtiofs driver is l=
oaded.
  If iommu_platform is disabled the guest immediately locks up as a result =
of the configured PCIe-Passthrough.

  Host system:
  - Arch Linux amd64
  - AMD Ryzen Platform
  - QEMU 5.0.0

  Guest system:
  - Windows Server 2019 (also happens in linux installations)
  - PCIe GPU hostdev
  - virtiofs passthrough

  Many thanks for any advice.

  QEMU LOG:
  2020-07-28 19:20:07.197+0000: Starting external device: virtiofsd
  /usr/lib/qemu/virtiofsd --fd=3D29 -o source=3D/viofstest
  2020-07-28 19:20:07.207+0000: starting up libvirt version: 6.5.0, qemu ve=
rsion: 5.0.0, kernel: 5.7.10-arch1-1, hostname: mspc
  LC_ALL=3DC \
  PATH=3D/usr/local/sbin:/usr/local/bin:/usr/bin \
  HOME=3D/var/lib/libvirt/qemu/domain-7-win \
  XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-7-win/.local/share \
  XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-7-win/.cache \
  XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-7-win/.config \
  QEMU_AUDIO_DRV=3Dnone \
  /usr/bin/qemu-system-x86_64 \
  -name guest=3Dwin,debug-threads=3Don \
  -S \
  -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/=
domain-7-win/master-key.aes \
  -blockdev '{"driver":"file","filename":"/usr/share/ovmf/x64/OVMF_CODE.fd"=
,"node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unm=
ap"}' \
  -blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"driver=
":"raw","file":"libvirt-pflash0-storage"}' \
  -blockdev '{"driver":"file","filename":"/var/lib/libvirt/qemu/nvram/win_V=
ARS.fd","node-name":"libvirt-pflash1-storage","auto-read-only":true,"discar=
d":"unmap"}' \
  -blockdev '{"node-name":"libvirt-pflash1-format","read-only":false,"drive=
r":"raw","file":"libvirt-pflash1-storage"}' \
  -machine pc-q35-5.0,accel=3Dkvm,usb=3Doff,vmport=3Doff,dump-guest-core=3D=
off,kernel_irqchip=3Don,pflash0=3Dlibvirt-pflash0-format,pflash1=3Dlibvirt-=
pflash1-format \
  -cpu host,migratable=3Don,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=3D0x1f=
ff,hv-vendor-id=3Dwhatever,kvm=3Doff \
  -m 2048 \
  -overcommit mem-lock=3Doff \
  -smp 8,sockets=3D8,cores=3D1,threads=3D1 \
  -object memory-backend-file,id=3Dram-node0,prealloc=3Dyes,mem-path=3D/dev=
/hugepages/libvirt/qemu/7-win,share=3Dyes,size=3D2147483648 \
  -numa node,nodeid=3D0,cpus=3D0-7,memdev=3Dram-node0 \
  -uuid c8efa194-52f8-4526-a0f8-29a254839b55 \
  -display none \
  -no-user-config \
  -nodefaults \
  -chardev socket,id=3Dcharmonitor,fd=3D29,server,nowait \
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
  -rtc base=3Dlocaltime,driftfix=3Dslew \
  -global kvm-pit.lost_tick_policy=3Ddelay \
  -no-hpet \
  -no-shutdown \
  -global ICH9-LPC.disable_s3=3D1 \
  -global ICH9-LPC.disable_s4=3D1 \
  -boot menu=3Doff,strict=3Don \
  -device pcie-root-port,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,mu=
ltifunction=3Don,addr=3D0x2 \
  -device pcie-pci-bridge,id=3Dpci.2,bus=3Dpci.1,addr=3D0x0 \
  -device pcie-root-port,port=3D0x11,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,ad=
dr=3D0x2.0x1 \
  -device pcie-root-port,port=3D0x12,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,ad=
dr=3D0x2.0x2 \
  -device pcie-root-port,port=3D0x13,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,ad=
dr=3D0x2.0x3 \
  -device pcie-root-port,port=3D0x14,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0,ad=
dr=3D0x2.0x4 \
  -device pcie-root-port,port=3D0x15,chassis=3D7,id=3Dpci.7,bus=3Dpcie.0,ad=
dr=3D0x2.0x5 \
  -device pcie-root-port,port=3D0x16,chassis=3D8,id=3Dpci.8,bus=3Dpcie.0,ad=
dr=3D0x2.0x6 \
  -device pcie-root-port,port=3D0x17,chassis=3D9,id=3Dpci.9,bus=3Dpcie.0,ad=
dr=3D0x2.0x7 \
  -device pcie-root-port,port=3D0x18,chassis=3D10,id=3Dpci.10,bus=3Dpcie.0,=
multifunction=3Don,addr=3D0x3 \
  -device pcie-root-port,port=3D0x19,chassis=3D11,id=3Dpci.11,bus=3Dpcie.0,=
addr=3D0x3.0x1 \
  -device pcie-root-port,port=3D0x1a,chassis=3D12,id=3Dpci.12,bus=3Dpcie.0,=
addr=3D0x3.0x2 \
  -device pcie-root-port,port=3D0x8,chassis=3D13,id=3Dpci.13,bus=3Dpcie.0,m=
ultifunction=3Don,addr=3D0x1 \
  -device pcie-root-port,port=3D0x9,chassis=3D14,id=3Dpci.14,bus=3Dpcie.0,a=
ddr=3D0x1.0x1 \
  -device pcie-root-port,port=3D0xa,chassis=3D15,id=3Dpci.15,bus=3Dpcie.0,a=
ddr=3D0x1.0x2 \
  -device pcie-root-port,port=3D0xb,chassis=3D16,id=3Dpci.16,bus=3Dpcie.0,a=
ddr=3D0x1.0x3 \
  -device nec-usb-xhci,id=3Dusb,bus=3Dpci.7,addr=3D0x0 \
  -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.14,addr=3D0x0 \
  -blockdev '{"driver":"host_device","filename":"/dev/zvol/ssd/windows","ai=
o":"threads","node-name":"libvirt-3-storage","cache":{"direct":true,"no-flu=
sh":false},"auto-read-only":true,"discard":"unmap"}' \
  -blockdev '{"node-name":"libvirt-3-format","read-only":false,"cache":{"di=
rect":true,"no-flush":false},"driver":"raw","file":"libvirt-3-storage"}' \
  -device virtio-blk-pci,bus=3Dpci.3,addr=3D0x0,drive=3Dlibvirt-3-format,id=
=3Dvirtio-disk0,bootindex=3D1,write-cache=3Don \
  -blockdev '{"driver":"host_device","filename":"/dev/zvol/ssd/windows-ssdg=
ames1","aio":"threads","node-name":"libvirt-2-storage","cache":{"direct":tr=
ue,"no-flush":false},"auto-read-only":true,"discard":"unmap"}' \
  -blockdev '{"node-name":"libvirt-2-format","read-only":false,"cache":{"di=
rect":true,"no-flush":false},"driver":"raw","file":"libvirt-2-storage"}' \
  -device virtio-blk-pci,bus=3Dpci.9,addr=3D0x0,drive=3Dlibvirt-2-format,id=
=3Dvirtio-disk1,write-cache=3Don \
  -blockdev '{"driver":"host_device","filename":"/dev/zvol/hdd/win-games1",=
"aio":"threads","node-name":"libvirt-1-storage","cache":{"direct":true,"no-=
flush":false},"auto-read-only":true,"discard":"unmap"}' \
  -blockdev '{"node-name":"libvirt-1-format","read-only":false,"cache":{"di=
rect":true,"no-flush":false},"driver":"raw","file":"libvirt-1-storage"}' \
  -device virtio-blk-pci,bus=3Dpci.13,addr=3D0x0,drive=3Dlibvirt-1-format,i=
d=3Dvirtio-disk2,write-cache=3Don \
  -chardev socket,id=3Dchr-vu-fs0,path=3D/var/lib/libvirt/qemu/domain-7-win=
/fs0-fs.sock \
  -device vhost-user-fs-pci,chardev=3Dchr-vu-fs0,tag=3Dviofstest,iommu_plat=
form=3Don,ats=3Don,bus=3Dpci.15,addr=3D0x0 \
  -netdev tap,fd=3D32,id=3Dhostnet0,vhost=3Don,vhostfd=3D34 \
  -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:fb:0c:2=
8,bus=3Dpci.10,addr=3D0x0 \
  -chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent \
  -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchanne=
l0,id=3Dchannel0,name=3Dcom.redhat.spice.0 \
  -device virtio-keyboard-pci,id=3Dinput0,bus=3Dpci.12,addr=3D0x0 \
  -device virtio-tablet-pci,id=3Dinput1,bus=3Dpci.8,addr=3D0x0 \
  -device virtio-mouse-pci,id=3Dinput2,bus=3Dpci.11,addr=3D0x0 \
  -device ich9-intel-hda,id=3Dsound0,bus=3Dpci.2,addr=3D0x1 \
  -device hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 \
  -device vfio-pci,host=3D0000:08:00.0,id=3Dhostdev0,bus=3Dpci.5,addr=3D0x0=
,rombar=3D1 \
  -device vfio-pci,host=3D0000:08:00.1,id=3Dhostdev1,bus=3Dpci.6,addr=3D0x0=
,rombar=3D1 \
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.4,addr=3D0x0 \
  -object input-linux,id=3Dkbd1,evdev=3D/dev/input/by-path/pci-0000:0a:00.3=
-usb-0:3:1.0-event-kbd,grab_all=3Don,repeat=3Don \
  -object input-linux,id=3Dmouse1,evdev=3D/dev/input/by-path/pci-0000:0a:00=
.3-usb-0:4:1.0-event-mouse \
  -sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourc=
econtrol=3Ddeny \
  -msg timestamp=3Don
  2020-07-28 19:20:07.207+0000: Domain id=3D7 is tainted: high-privileges
  2020-07-28 19:20:07.207+0000: Domain id=3D7 is tainted: custom-argv
  2020-07-28 19:20:07.207+0000: Domain id=3D7 is tainted: host-cpu
  <--- VIOFS DRIVER GETS LOADED HERE --->
  2020-07-28T19:20:57.568089Z qemu-system-x86_64: Failed to read msg header=
. Read -1 instead of 12. Original request 1566376224.
  2020-07-28T19:20:57.568120Z qemu-system-x86_64: Fail to update device iot=
lb
  2020-07-28T19:20:57.568147Z qemu-system-x86_64: Failed to read msg header=
. Read 0 instead of 12. Original request 1566376528.
  2020-07-28T19:20:57.568151Z qemu-system-x86_64: Fail to update device iot=
lb
  2020-07-28T19:20:57.568153Z qemu-system-x86_64: Failed to set msg fds.
  2020-07-28T19:20:57.568156Z qemu-system-x86_64: vhost_set_vring_call fail=
ed: Invalid argument (22)
  2020-07-28T19:20:57.568160Z qemu-system-x86_64: Failed to set msg fds.
  2020-07-28T19:20:57.568162Z qemu-system-x86_64: vhost_set_vring_call fail=
ed: Invalid argument (22)
  2020-07-28T19:20:57.568296Z qemu-system-x86_64: Failed to read from slave.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1889945/+subscriptions

