Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C778037F75A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:03:31 +0200 (CEST)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhA3p-0004Ih-Ls
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lh9x5-00038J-OX
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:56:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:38916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lh9wz-0004DB-Fn
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:56:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lh9ww-00011Y-DZ
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:56:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0822B2E81A8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:56:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 11:48:47 -0000
From: Thomas Huth <1917565@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: acpi boot inaccessible windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: imammedo nick-kvmhv th-huth
X-Launchpad-Bug-Reporter: Nick (nick-kvmhv)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161474788220.8516.15014999465847517073.malonedeb@gac.canonical.com>
Message-Id: <162090652731.1649.323539297011007308.malone@wampee.canonical.com>
Subject: [Bug 1917565] Re: Windows 10 fails with "Boot device inaccessible"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: fd169dc2fcdb821c092eda830966ce3fb054cbd7
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
Reply-To: Bug 1917565 <1917565@bugs.launchpad.net>
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
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

** Tags removed: 10 device
** Tags added: acpi

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917565

Title:
  Windows 10 fails with "Boot device inaccessible"

Status in QEMU:
  Incomplete

Bug description:
  The issue is happening on all versions I tried after the following
  commit. I can also remove this individual change from master and it
  starts to work.

  OVMF_CODE.fd is what comes with Ubuntu 20.04 through package manager.

  =

  git diff af1b80ae56c9495999e8ccf7b70ef894378de642~ af1b80ae56c9495999e8cc=
f7b70ef894378de642
  diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
  index b7bcbbbb2a..7a5a8b3521 100644
  --- a/hw/i386/acpi-build.c
  +++ b/hw/i386/acpi-build.c
  @@ -1497,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev =3D aml_device(=
"PCI0");
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, aml=
_name_decl("_HID", aml_eisaid("PNP0A03")));
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, aml=
_name_decl("_ADR", aml_int(0)));
  -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
  +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(sb_scope=
, dev);
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dsdt, sb=
_scope);

  @@ -1512,7 +1512,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, aml=
_name_decl("_HID", aml_eisaid("PNP0A08")));
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, aml=
_name_decl("_CID", aml_eisaid("PNP0A03")));
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, aml=
_name_decl("_ADR", aml_int(0)));
  -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
  +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, bui=
ld_q35_osc_method());
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(sb_scope=
, dev);
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dsdt, sb=
_scope);

  The virtual machine start command:
  x86_64-softmmu/qemu-system-x86_64 -name guest=3Dwin10-dev,debug-threads=
=3Don -blockdev '{"driver":"file","filename":"/usr/share/OVMF/OVMF_CODE.fd"=
,"node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unm=
ap"}' -blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"dr=
iver":"raw","file":"libvirt-pflash0-storage"}' -blockdev '{"driver":"file",=
"filename":"/var/lib/libvirt/qemu/nvram/win10-dev_VARS.fd","node-name":"lib=
virt-pflash1-storage","auto-read-only":true,"discard":"unmap"}' -blockdev '=
{"node-name":"libvirt-pflash1-format","read-only":false,"driver":"raw","fil=
e":"libvirt-pflash1-storage"}' -machine pc-q35-4.2,accel=3Dkvm,usb=3Doff,vm=
port=3Doff,dump-guest-core=3Doff,pflash0=3Dlibvirt-pflash0-format,pflash1=
=3Dlibvirt-pflash1-format -cpu Skylake-Client-IBRS,ss=3Don,vmx=3Don,pdcm=3D=
on,hypervisor=3Don,tsc-adjust=3Don,clflushopt=3Don,umip=3Don,md-clear=3Don,=
stibp=3Don,arch-capabilities=3Don,ssbd=3Don,xsaves=3Don,pdpe1gb=3Don,ibpb=
=3Don,amd-ssbd=3Don,skip-l1dfl-vmentry=3Don,pschange-mc-no=3Don,hv-time,hv-=
relaxed,hv-vapic,hv-spinlocks=3D0x1fff -m 6144 -overcommit mem-lock=3Doff -=
smp 4,sockets=3D4,cores=3D1,threads=3D1 -uuid 5646e540-5022-4ace-8d6a-d7c4b=
61a6d3d -no-user-config -nodefaults -rtc base=3Dlocaltime,driftfix=3Dslew -=
global kvm-pit.lost_tick_policy=3Ddelay -no-hpet -global ICH9-LPC.disable_s=
3=3D1 -global ICH9-LPC.disable_s4=3D1 -boot strict=3Don -device pcie-root-p=
ort,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunction=3Don,addr=
=3D0x2 -device pcie-root-port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpcie=
.0,addr=3D0x2.0x1 -device pcie-root-port,port=3D0x12,chassis=3D3,id=3Dpci.3=
,bus=3Dpcie.0,addr=3D0x2.0x2 -device pcie-root-port,port=3D0x13,chassis=3D4=
,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x2.0x3 -device pcie-root-port,port=3D0x14,=
chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=3D0x2.0x4 -device qemu-xhci,p2=3D1=
5,p3=3D15,id=3Dusb,bus=3Dpci.2,addr=3D0x0 -device virtio-serial-pci,id=3Dvi=
rtio-serial0,bus=3Dpci.3,addr=3D0x0 -blockdev '{"driver":"host_device","fil=
ename":"/dev/disk/by-id/scsi-1SanDisk_Extreme_SSD_20072F404043","aio":"nati=
ve","node-name":"libvirt-2-storage","cache":{"direct":true,"no-flush":false=
},"auto-read-only":true,"discard":"unmap"}' -blockdev '{"node-name":"libvir=
t-2-format","read-only":false,"cache":{"direct":true,"no-flush":false},"dri=
ver":"raw","file":"libvirt-2-storage"}' -device ide-hd,bus=3Dide.0,drive=3D=
libvirt-2-format,id=3Dsata0-0-0,bootindex=3D1,write-cache=3Don -device ide-=
cd,bus=3Dide.1,id=3Dsata0-0-1 -netdev user,id=3Dhostnet0 -device e1000e,net=
dev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:10:5b:55,bus=3Dpci.1,addr=3D0x0 -ch=
ardev pty,id=3Dcharserial0 -device isa-serial,chardev=3Dcharserial0,id=3Dse=
rial0 -chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent -device virtserial=
port,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0,id=3Dchannel0,nam=
e=3Dcom.redhat.spice.0 -device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 =
-spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don,image-compressio=
n=3Doff,seamless-migration=3Don -device qxl-vga,id=3Dvideo0,ram_size=3D6710=
8864,vram_size=3D67108864,vram64_size_mb=3D0,vgamem_mb=3D16,max_outputs=3D1=
,bus=3Dpcie.0,addr=3D0x1 -device ich9-intel-hda,id=3Dsound0,bus=3Dpcie.0,ad=
dr=3D0x1b -device hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 -cha=
rdev spicevmc,id=3Dcharredir0,name=3Dusbredir -device usb-redir,chardev=3Dc=
harredir0,id=3Dredir0,bus=3Dusb.0,port=3D2 -chardev spicevmc,id=3Dcharredir=
1,name=3Dusbredir -device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3D=
usb.0,port=3D3 -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.4,addr=3D=
0x0 -msg timestamp=3Don -D ./log.txt -monitor stdio -d

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917565/+subscriptions

