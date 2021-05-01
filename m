Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE25370678
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:51:05 +0200 (CEST)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lclL6-000818-Ld
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lclJh-0007b5-2H
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:49:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:45898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lclJf-00060L-5M
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:49:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lclJe-0006FK-13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 08:49:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EB4642E8165
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 08:49:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 08:36:20 -0000
From: Thomas Huth <823733@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: happykvm michal-nowak-b podlipnik sledge-sulaweyo
 th-huth
X-Launchpad-Bug-Reporter: showrun (happykvm)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110810053253.11269.76752.malonedeb@gac.canonical.com>
Message-Id: <161985818076.11402.6895429097079788222.malone@soybean.canonical.com>
Subject: [Bug 823733] Re: Solaris can't be powered off with ACPI
 shutdown/poweroff
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: e1a24250e94bad7ccb171e5fea019219be3c213e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 823733 <823733@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug report has been moved to QEMU's new bug tracker on gitlab.com
and thus gets now closed in Launchpad. Please continue with the
discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/68

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #68
   https://gitlab.com/qemu-project/qemu/-/issues/68

** Changed in: qemu
       Status: Triaged =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/823733

Title:
  Solaris can't be powered off with ACPI shutdown/poweroff

Status in QEMU:
  Invalid

Bug description:
  Thank you forgive my poor English.

  It seems KVM can=E2=80=99t poweroff solairs 10 or sloalrs 11 VM.
  I have created solaris 10 and 11 as usual. Everything in VM is running OK=
, but finally I use shell command =E2=80=98poweroff=E2=80=99 or =E2=80=98in=
it 5=E2=80=99, the solaris VM (both 10 & 11) system could=E2=80=99t be powe=
roff but with promoting me the message: perss any key to reboot =E2=80=A6..=
  ,I pressed any key in vnc client, solaris VM reboot immediately. Endless =
reboot loop above.

  the solaris 10 & 11 from oracle iso file name :
  sol-10-u9-ga-x86-dvd.iso
  sol-11-exp-201011-text-x86.iso

  the solaris 10 & 11 from oracle iso file name :
  sol-10-u9-ga-x86-dvd.iso
  sol-11-exp-201011-text-x86.iso

  1. On my real physical machine,the solaris can be poweroff
  2. On vmware ,the solaris can be poweroff
  3. On my real physical machine,I have try to disbale the ACPI opiton in B=
OIS, then the solaris can't be poweroff,Like the problem I have described a=
bove
  so ,I doubt the KVM has a little problem in ACPI =


  I have try the suggestion as follows, but I can=E2=80=99t solve the probl=
em.
  7.2 Solaris reboot all the time on grub menu
  =E2=80=A2	Run through the installer as usual =

  =E2=80=A2	On completion and reboot, the VM will perpetually reboot. "Stop=
" the VM. =

  =E2=80=A2	Start it up again, and immediately open a vnc console and selec=
t the Safe Boot from the options screen =

  =E2=80=A2	When prompted if you want to try and recover the boot block, sa=
y yes =

  =E2=80=A2	You should now have a Bourne terminal with your existing filesy=
stem mounted on /a =

  =E2=80=A2	Run /a/usr/bin/bash (my preferred shell) =

  =E2=80=A2	export TERM=3Dxterm =

  =E2=80=A2	vi /a/boot/grub/menu.1st (editing the bootloader on your mounte=
d filesystem), to add "kernel/unix" to the kernel options for the non-safe-=
mode boot. Ex : =

  Config File : /a/boot/grub/menu.lst =

  kernel$ /platform/i86pc/multiboot -B $ZFS-BOOTFS kernel/unix

  According to KVM requirements, I collected the following information:
  CPU model name
  model name      : Intel(R) Xeon(R) CPU           X3450  @ 2.67GHz

  kvm -version
  QEMU PC emulator version 0.12.3 (qemu-kvm-0.12.3), Copyright (c) 2003-200=
8 Fabrice Bellard

  Host kernel version
  Ubuntu 10.04.1 LTS   2.6.32-25-server =


  What host kernel arch you are using (i386 or x86_64)
  X86_64

  Guest OS
  Solaris 10 and Solaris 11=EF=BC=8Cboth can not shutdown

  The qemu command line you are using to start the guest

  First, I used the command line as follows:
  kvm -m 1024 -drive file=3Dsolaris10.img,cache=3Dwriteback -net nic -net u=
ser -nographic -vnc :1
  then I try to use -no-kvm-irqchip or -no-kvm ,but the problem also appear=
s!

  Secondly, have created and run solaris 10&11 by using Virsh, still solari=
s can't be poweroff, the XML file content is :
  <domain type=3D'kvm'>
      <name>solairs</name>
      <uuid>85badf15-244d-4719-a2da-8c3de064137d</uuid>
      <memory>1677721</memory>
      <currentMemory>1677721</currentMemory>
      <vcpu>1</vcpu>
      <os>
      <type arch=3D'i686' machine=3D'pc-0.12'>hvm</type>
        <boot dev=3D'hd'/>
     </os>
     <features>
      <acpi/>
      <apic/>
     </features>
    <clock offset=3D'utc'/>
     <on_poweroff>destroy</on_poweroff>
    <on_reboot>restart</on_reboot>
     <on_crash>destroy</on_crash>
     <devices>
       <emulator>/usr/bin/kvm</emulator>
       <disk type=3D'file' device=3D'disk'>
        <driver name=3D'qemu' type=3D'qcow2' cache=3D'writeback'/>
         <source file=3D'/opt/GuestOS/solaris10.img'/>
         <target dev=3D'hda' bus=3D'ide'/>
       </disk>
      <interface type=3D'bridge'>
        <mac address=3D'00:0c:29:d0:36:c3'/>
        <source bridge=3D'br1'/>
        <target dev=3D'vnet0'/>
       </interface>
       <input type=3D'mouse' bus=3D'ps2'/>
       <graphics type=3D'vnc' port=3D'5901' autoport=3D'no' keymap=3D'en-us=
'/>
      <video>
        <model type=3D'vga' vram=3D'65536' heads=3D'1'/>
      </video>
    </devices>
    <seclabel type=3D'dynamic' model=3D'apparmor'>
      <label>libvirt-f36f5289-692e-6f1c-fe71-c6ed19453e2f</label>
      <imagelabel>libvirt-f36f5289-692e-6f1c-fe71-c6ed19453e2f</imagelabel>
    </seclabel>
   </domain>

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/823733/+subscriptions

