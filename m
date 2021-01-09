Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F52EFDBA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:35:49 +0100 (CET)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5ye-00037E-Dc
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pl-0008I2-EO
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:37 -0500
Received: from indium.canonical.com ([91.189.90.7]:46730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5ph-0006wb-2D
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:37 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pb-0006xP-Uv
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 037EA2E817A
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:55 -0000
From: Launchpad Bug Tracker <1723731@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: 2.10.1 black ovmf windows7
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mastersplinter777 th-huth
X-Launchpad-Bug-Reporter: Alexander Kuzmin (mastersplinter777)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150806672066.15534.12058555571151449517.malonedeb@soybean.canonical.com>
Message-Id: <161016587546.8490.7613321139855943902.malone@loganberry.canonical.com>
Subject: [Bug 1723731] Re: Qemu turns to black screen while starting to copy
 installation files of Windows 7
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: d345601e62669f5ef08b377f3b30121e86cb836b
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
Reply-To: Bug 1723731 <1723731@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1723731

Title:
  Qemu turns to black screen while starting to copy installation files
  of Windows 7

Status in QEMU:
  Expired

Bug description:
  Distribution: Arch Linux, Kernel: linux-4.13.5, Qemu: 2.10.1, OVMF: git (=
built 06.10.17).
  Steps to reproduce: create Qemu VM with such config:

  QEMU_VM_NAME=3D$(basename $(dirname "$0")) #Qemu virtual machine name (ta=
ken from working directory)
  QEMU_WORKING_DIR=3D"$(dirname "$0")" #Qemu current working directory
  DIF=3D12 #set 2-digit number here
  QEMU_MONITOR_PORT=3D370${DIF} #Qemu monitor port
  QEMU_SERIAL_PORT=3D371${DIF} #Qemu serial port
  QEMU_PARALLEL_PORT=3D372${DIF} #Qemu parallel port

  qemu-system-x86_64 -daemonize -display gtk -boot menu=3Don -monitor telne=
t:127.0.0.1:${QEMU_MONITOR_PORT},server,nowait -serial telnet:127.0.0.1:${Q=
EMU_SERIAL_PORT},server,nowait -uuid fafafafa-1234-bcbc-5678-11112222ff${DI=
F} -name ${QEMU_VM_NAME},process=3DQEMU-${QEMU_VM_NAME} -parallel none -net=
 none -nodefconfig -nodefaults -no-user-config -rtc base=3Dlocaltime,clock=
=3Dvm,driftfix=3Dslew -realtime mlock=3Doff -machine type=3Dq35,accel=3Dkvm=
,usb=3Doff,dump-guest-core=3Doff -smp 2,sockets=3D1,cores=3D2,threads=3D1 -=
object iothread,id=3Diothread1 -object iothread,id=3Diothread2 -cpu Penryn,=
kvm=3Doff,check,vendor=3DGenuineIntel,+vmx -m 2G -device qxl-vga,id=3Dvideo=
0,ram_size=3D67108864,vram_size=3D67108864,vram64_size_mb=3D0,vgamem_mb=3D1=
6,max_outputs=3D1,addr=3D0x1b.0x0 -global qxl-vga.revision=3D4 -device ich9=
-intel-hda,addr=3D0x11.0x0,id=3Dsound0 -device hda-duplex,id=3Dsound0-codec=
0,bus=3Dsound0.0,cad=3D0 -device ich9-usb-ehci1,id=3Dehci1,addr=3D0x12.0x7 =
-device ich9-usb-uhci1,id=3Duhci1,masterbus=3Dehci1.0,firstport=3D0,multifu=
nction=3Don,addr=3D0x12.0x0 -device ich9-usb-uhci2,id=3Duhci2,masterbus=3De=
hci1.0,firstport=3D2,addr=3D0x12.0x1 -device ich9-usb-uhci3,id=3Duhci3,mast=
erbus=3Dehci1.0,firstport=3D4,addr=3D0x12.0x2 -device ide-hd,bus=3Dide.0,dr=
ive=3Ddrive-sata0-0-0,id=3Dsata0-0-0 -drive file=3D"${QEMU_WORKING_DIR}"/${=
QEMU_VM_NAME}.qcow2,if=3Dnone,media=3Ddisk,id=3Ddrive-sata0-0-0,format=3Dqc=
ow2 -device ide-cd,bus=3Dide.1,drive=3Ddrive-sata0-0-1,id=3Dsata0-0-1 -driv=
e if=3Dnone,media=3Dcdrom,readonly=3Don,id=3Ddrive-sata0-0-1 -device usb-ta=
blet,id=3Dtbl0,bus=3Dehci1.0,port=3D2,usb_version=3D2,serial=3D1123,display=
=3Dtbl0
  -device usb-kbd,id=3Dkbd0,bus=3Dehci1.0,port=3D1,usb_version=3D1,serial=
=3D1122,display=3Dkbd0 -drive if=3Dpflash,format=3Draw,unit=3D1,file=3D${QE=
MU_WORKING_DIR}/ovmf_vars_x64.bin -drive if=3Dpflash,format=3Draw,unit=3D0,=
readonly,file=3D${QEMU_WORKING_DIR}/ovmf_code_x64.bin

  After that connect to Qemu console, insert Windows 7 installation
  media and start installation. You can successfully choose language,
  keyboard layout and partition your harddrive but after 2-3 seconds
  after beginning of copying installation files the graphical console
  screen turns to black and 1 CPU core on the host raises to 100%
  permanently and nothing happens. But if you installed Windows 7 before
  - there is no problems with VM. Tested on GTK, SDL types of screen.

  Qemu was installed from official repo and also I tried with built by
  myself version. Other OSes: Windows 8, 8.1, 10, Arch Linux, Debian,
  FreeBSD installed successfully.

  It happens only in OVMF-mode. I've just tested BIOS mode with no
  problems.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1723731/+subscriptions

