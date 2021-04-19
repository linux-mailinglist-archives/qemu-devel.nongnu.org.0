Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB32364813
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:17:59 +0200 (CEST)
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWb0-0007Ww-Ed
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYWYs-0005pL-4u
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:15:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:37070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYWYp-0006NN-5H
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:15:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYWYm-0001KS-3o
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 16:15:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1B6202E8073
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 16:15:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 16:06:45 -0000
From: Thomas Huth <1817268@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h mathieucorbin th-huth
X-Launchpad-Bug-Reporter: Mathieu Corbin (mathieucorbin)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155082367008.22773.11895376561017991070.malonedeb@wampee.canonical.com>
Message-Id: <161884840604.6084.12906421233418901680.malone@soybean.canonical.com>
Subject: [Bug 1817268] Re: Input/output error during migration
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: dc7402b55ef4e9405b9f96f95263fd5ad3807ee5
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
Reply-To: Bug 1817268 <1817268@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... can you still reproduce this issue
with the latest version of QEMU? Or could we close this ticket nowadays?


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1817268

Title:
  Input/output error during migration

Status in QEMU:
  Incomplete

Bug description:
  Operating system: Ubuntu 18.04.2 LTS
  qemu version: 2.11.1, but also reproduced with 3.1.0 (compiled manually).
  virsh --version: 4.0.0

  Hello,

  I am having an issue with migration of UEFI virtual machines. If the
  --copy-storage-inc and the --tunnelled libvirt flags are used
  together, the migration fails. The same command for non-uefi virtual
  machines (e.g the same libvirt xml without the <nvram> and <loader>
  tags) works.

  The command/output error is:

  virsh migrate --verbose --live --p2p --tunnelled --copy-storage-inc --cha=
nge-protection --abort-on-error testuefi qemu+tcp://<ip>/system
  error: internal error: qemu unexpectedly closed the monitor: Receiving bl=
ock device images
  2019-02-21T16:20:15.263261Z qemu-system-x86_64: error while loading state=
 section id 2(block)
  2019-02-21T16:20:15.263996Z qemu-system-x86_64: load of migration failed:=
 Input/output error

  If I remove one of the --tunnelled or the --copy-storage-inc flag, it
  works, for example:

  virsh migrate --verbose --live --p2p --copy-storage-inc --change-protecti=
on --abort-on-error testuefi qemu+tcp://<ip>/system
  Migration: [100 %]

  virsh migrate --verbose --live --p2p --tunnelled --change-protection --ab=
ort-on-error testuefi qemu+tcp://<ip>/system
  Migration: [100 %]

  I have no idea why those two flags combined together produce an error,
  and only for UEFI virtual machines.

  here is the libvirt xml definition:

  <domain type=3D'kvm' id=3D'4'>
    <name>testuefi</name>
    <uuid>ce12de05-ec09-4b4b-a27a-47003a511bda</uuid>
    <description>CentOS 4.5 (32-bit)</description>
    <memory unit=3D'KiB'>2097152</memory>
    <currentMemory unit=3D'KiB'>1048576</currentMemory>
    <vcpu placement=3D'static'>2</vcpu>
    <cputune>
      <shares>878</shares>
    </cputune>
    <resource>
      <partition>/machine</partition>
    </resource>
    <sysinfo type=3D'smbios'>
      <system>
        <entry name=3D'manufacturer'>Apache Software Foundation</entry>
        <entry name=3D'product'>CloudStack KVM Hypervisor</entry>
        <entry name=3D'uuid'>ce12de05-ec09-4b4b-a27a-47003a511bda</entry>
      </system>
    </sysinfo>
    <os>
      <type arch=3D'x86_64' machine=3D'pc-i440fx-2.11'>hvm</type>
      <loader readonly=3D'yes' type=3D'pflash'>/usr/share/OVMF/OVMF_CODE.fd=
</loader>
      <nvram>/var/lib/libvirt/qemu/nvram/testuefi_VARS.fd</nvram>
      <boot dev=3D'cdrom'/>
      <boot dev=3D'hd'/>
      <smbios mode=3D'sysinfo'/>
    </os>
    <features>
      <acpi/>
      <apic/>
      <pae/>
    </features>
    <cpu mode=3D'custom' match=3D'exact' check=3D'full'>
      <model fallback=3D'forbid'>Westmere</model>
      <feature policy=3D'require' name=3D'vmx'/>
      <feature policy=3D'require' name=3D'vme'/>
      <feature policy=3D'require' name=3D'pclmuldq'/>
      <feature policy=3D'require' name=3D'x2apic'/>
      <feature policy=3D'require' name=3D'hypervisor'/>
      <feature policy=3D'require' name=3D'arat'/>
    </cpu>
    <clock offset=3D'utc'/>
    <on_poweroff>destroy</on_poweroff>
    <on_reboot>restart</on_reboot>
    <on_crash>destroy</on_crash>
    <devices>
      <emulator>/usr/bin/kvm-spice</emulator>
      <disk type=3D'file' device=3D'disk'>
        <driver name=3D'qemu' type=3D'qcow2' cache=3D'none'/>
        <source file=3D'/var/lib/libvirt/images/testmigration.qcow2'/>
        <backingStore type=3D'file' index=3D'1'>
          <format type=3D'raw'/>
          <source file=3D'/var/lib/libvirt/images/b3e4b880-0611-43bc-9d71-9=
cdac138f6e2'/>
          <backingStore/>
        </backingStore>
        <target dev=3D'vda' bus=3D'virtio'/>
        <alias name=3D'virtio-disk0'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x04' =
function=3D'0x0'/>
      </disk>
      <disk type=3D'file' device=3D'cdrom'>
        <driver cache=3D'none'/>
        <target dev=3D'hdc' bus=3D'ide'/>
        <readonly/>
        <alias name=3D'ide0-1-0'/>
        <address type=3D'drive' controller=3D'0' bus=3D'1' target=3D'0' uni=
t=3D'0'/>
      </disk>
      <controller type=3D'usb' index=3D'0' model=3D'piix3-uhci'>
        <alias name=3D'usb'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01' =
function=3D'0x2'/>
      </controller>
      <controller type=3D'pci' index=3D'0' model=3D'pci-root'>
  	    <alias name=3D'pci.0'/>
      </controller>
      <controller type=3D'ide' index=3D'0'>
        <alias name=3D'ide'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01' =
function=3D'0x1'/>
      </controller>
      <interface type=3D'bridge'>
        <mac address=3D'06:6a:20:00:00:55'/>
        <source bridge=3D'public'/>
        <target dev=3D'vnet4'/>
        <model type=3D'virtio'/>
        <driver queues=3D'2'/>
        <alias name=3D'net0'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x03' =
function=3D'0x0'/>
      </interface>
      <serial type=3D'pty'>
        <source path=3D'/dev/pts/2'/>
        <target type=3D'isa-serial' port=3D'0'>
          <model name=3D'isa-serial'/>
        </target>
        <alias name=3D'serial0'/>
      </serial>
      <console type=3D'pty' tty=3D'/dev/pts/2'>
        <source path=3D'/dev/pts/2'/>
        <target type=3D'serial' port=3D'0'/>
        <alias name=3D'serial0'/>
      </console>
      <input type=3D'tablet' bus=3D'usb'>
        <alias name=3D'input0'/>
        <address type=3D'usb' bus=3D'0' port=3D'1'/>
      </input>
      <input type=3D'mouse' bus=3D'ps2'>
        <alias name=3D'input1'/>
      </input>
      <input type=3D'keyboard' bus=3D'ps2'>
        <alias name=3D'input2'/>
      </input>
      <video>
        <model type=3D'cirrus' vram=3D'16384' heads=3D'1' primary=3D'yes'/>
        <alias name=3D'video0'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x02' =
function=3D'0x0'/>
      </video>
      <memballoon model=3D'virtio'>
        <alias name=3D'balloon0'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x0'/>
      </memballoon>
    </devices>
  </domain>

  Here is the qemu command on the destination host:

  LC_ALL=3DC
  PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
  QEMU_AUDIO_DRV=3Dnone /usr/bin/kvm-spice -name guest=3Dtestuefi-VM,debug-
  threads=3Don -S -object
  secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-14
  -testuefi-VM/master-key.aes -machine pc-i440fx-2.11,accel=3Dkvm,usb=3Doff
  ,dump-guest-core=3Doff -cpu Skylake-
  Server,vmx=3Don,pcid=3Don,ssbd=3Don,hypervisor=3Don -drive
  file=3D/usr/share/OVMF/OVMF_CODE.fd,if=3Dpflash,format=3Draw,unit=3D0,rea=
donly=3Don
  -drive file=3D/var/lib/libvirt/qemu/nvram/testuefi-
  VM_VARS.fd,if=3Dpflash,format=3Draw,unit=3D1 -m 1024 -realtime mlock=3Doff
  -smp 1,sockets=3D1,cores=3D1,threads=3D1 -uuid b340b117-1704-4ccf-
  93a7-21303b12dd7f -smbios 'type=3D1,manufacturer=3DApache Software
  Foundation,product=3DCloudStack KVM Hypervisor,uuid=3Db340b117-1704-4ccf-
  93a7-21303b12dd7f' -no-user-config -nodefaults -chardev
  socket,id=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/domain-14-testuefi-
  VM/monitor.sock,server,nowait -mon
  chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc -no-shu=
tdown
  -boot strict=3Don -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.=
0x2
  -drive
  file=3D/var/lib/libvirt/images/testmigration.qcow2,format=3Dqcow2,if=3Dno=
ne,id
  =3Ddrive-virtio-disk0,cache=3Dnone -device virtio-blk-
  pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x5,drive=3Ddrive-virtio-disk0,id=3Dvir=
tio-
  disk0,bootindex=3D2 -drive if=3Dnone,id=3Ddrive-
  ide0-1-0,readonly=3Don,cache=3Dnone -device ide-cd,bus=3Dide.1,unit=3D0,d=
rive
  =3Ddrive-ide0-1-0,id=3Dide0-1-0,bootindex=3D1 -netdev
  tap,fd=3D35,id=3Dhostnet0,vhost=3Don,vhostfd=3D37 -device virtio-net-
  pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D06:a0:66:00:00:0c,bus=3Dpci.0,addr=
=3D0x3
  -chardev pty,id=3Dcharserial0 -device isa-
  serial,chardev=3Dcharserial0,id=3Dserial0 -device usb-
  tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 -vnc
  vnc=3Dunix:/var/run/qemu/b340b117-1704-4ccf-93a7-21303b12dd7f.sock
  -device cirrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D0x2 -incoming defer -msg
  timestamp=3Don

  Thanks,

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1817268/+subscriptions

