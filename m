Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74CB2B9817
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:38:47 +0100 (CET)
Received: from localhost ([::1]:48776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmxK-0006Us-Ne
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfmuQ-0004jI-EN
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:35:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:34654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfmuJ-0004jx-4I
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:35:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfmuG-0006Q0-8S
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:35:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3D3E82E8041
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:35:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 16:17:26 -0000
From: Thomas Huth <1563152@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Incomplete; importance=Low; assignee=None; 
X-Launchpad-Bug-Tags: needs-upstream-report
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor rhansen th-huth
X-Launchpad-Bug-Reporter: Richard Hansen (rhansen)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160329015831.30307.69405.malonedeb@gac.canonical.com>
Message-Id: <160580264643.17847.10883553066361479402.malone@gac.canonical.com>
Subject: [Bug 1563152] Re: general protection fault running VirtualBox in KVM
 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: f9d77143cd7cbdf9f1c002f65c5674e4d3fd76a1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 09:30:48
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
Reply-To: Bug 1563152 <1563152@bugs.launchpad.net>
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

** Changed in: qemu (Ubuntu)
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1563152

Title:
  general protection fault running VirtualBox in KVM guest

Status in QEMU:
  Incomplete
Status in qemu package in Ubuntu:
  Incomplete

Bug description:
  I'm trying to run nested VMs using qemu-kvm on the physical host and Virt=
ualBox on the guest host:
  =C2=A0=C2=A0* physical host: Ubuntu 14.04 running Linux 4.2.0, qemu-kvm 2=
.0.0
  =C2=A0=C2=A0* guest host: Ubuntu 16.04 beta 2 running Linux 4.4.0, Virtua=
lBox 5.0.16

  When I try to start up a VirtualBox VM in the guest host, I get a
  general protection fault (see below for dmesg output).  According to
  https://www.virtualbox.org/ticket/14965 this is caused by a bug in
  QEMU/KVM:

  =C2=A0=C2=A0=C2=A0=C2=A0The problem in more detail:  As written above, Vi=
rtualBox tries to
  =C2=A0=C2=A0=C2=A0=C2=A0read the MSR 0x9B (IA32_SMM_MONITOR_CTL).  This i=
s an
  =C2=A0=C2=A0=C2=A0=C2=A0architectural MSR which is present if CPUID.01 / =
ECX bit 5 or bit
  =C2=A0=C2=A0=C2=A0=C2=A06 are set (VMX or SMX).  As KVM has nested virtua=
lization enabled
  =C2=A0=C2=A0=C2=A0=C2=A0and therefore pretends to support VT-x, this MSR =
must be
  =C2=A0=C2=A0=C2=A0=C2=A0accessible and reading from this MSR must not rai=
se a
  =C2=A0=C2=A0=C2=A0=C2=A0#GP.  KVM/QEmu does not behave like real hardware=
 in this case.

  dmesg output:

  SUPR0GipMap: fGetGipCpu=3D0x3
  general protection fault: 0000 [#1] SMP
  Modules linked in: pci_stub vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vbo=
xdrv(OE) xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 i=
ptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack=
 xt_tcpudp bridge stp llc iptable_filter ip_tables x_tables ppdev kvm_intel=
 kvm irqbypass snd_hda_codec_generic snd_hda_intel snd_hda_codec snd_hda_co=
re snd_hwdep snd_pcm snd_timer i2c_piix4 snd input_leds soundcore joydev 82=
50_fintek mac_hid serio_raw pvpanic parport_pc parport ib_iser rdma_cm iw_c=
m ib_cm ib_sa ib_mad ib_core ib_addr iscsi_tcp libiscsi_tcp libiscsi scsi_t=
ransport_iscsi autofs4 btrfs raid10 raid456 async_raid6_recov async_memcpy =
async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath li=
near crct10dif_pclmul crc32_pclmul qxl ttm drm_kms_helper syscopyarea sysfi=
llrect aesni_intel sysimgblt fb_sys_fops aes_x86_64 lrw gf128mul glue_helpe=
r ablk_helper cryptd psmouse floppy drm pata_acpi
  CPU: 0 PID: 31507 Comm: EMT Tainted: G           OE   4.4.0-15-generic #3=
1-Ubuntu
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01/01/2=
011
  task: ffff880034c0a580 ti: ffff880002e00000 task.ti: ffff880002e00000
  RIP: 0010:[<ffffffffc067e506>]  [<ffffffffc067e506>] 0xffffffffc067e506
  RSP: 0018:ffff880002e03d70  EFLAGS: 00010206
  RAX: 00000000000006f0 RBX: 00000000ffffffdb RCX: 000000000000009b
  RDX: 0000000000000000 RSI: ffff880002e03d00 RDI: ffff880002e03cc8
  RBP: ffff880002e03d90 R08: 0000000000000004 R09: 00000000000006f0
  R10: 0000000049656e69 R11: 000000000f8bfbff R12: 0000000000000020
  R13: 0000000000000000 R14: ffffc9000057407c R15: ffffffffc0645260
  FS:  00007f89b8f6b700(0000) GS:ffff88007fc00000(0000) knlGS:0000000000000=
000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 00007f89b8d10000 CR3: 0000000035ae1000 CR4: 00000000000006f0
  Stack:
  =C2=A00000000000000000 ffffffff00000000 0000000000000000 0000000000000000
  =C2=A0ffff880002e03db0 ffffffffc0693e93 ffffc90000574010 ffff880035aae550
  =C2=A0ffff880002e03e30 ffffffffc060a3e7 ffff880002e03e10 0000000000000282
  Call Trace:
  =C2=A0[<ffffffffc060a3e7>] ? supdrvIOCtl+0x2de7/0x3250 [vboxdrv]
  =C2=A0[<ffffffffc06035b0>] ? VBoxDrvLinuxIOCtl_5_0_16+0x150/0x250 [vboxdr=
v]
  =C2=A0[<ffffffff8121e7df>] ? do_vfs_ioctl+0x29f/0x490
  =C2=A0[<ffffffff8106a554>] ? __do_page_fault+0x1b4/0x400
  =C2=A0[<ffffffff8121ea49>] ? SyS_ioctl+0x79/0x90
  =C2=A0[<ffffffff81821ff2>] ? entry_SYSCALL_64_fastpath+0x16/0x71
  Code: 88 e4 fc ff ff b9 3a 00 00 00 0f 32 48 c1 e2 20 89 c0 48 09 d0 48 8=
9 05 f9 db 0e 00 0f 20 e0 b9 9b 00 00 00 48 89 05 d2 db 0e 00 <0f> 32 48 c1=
 e2 20 89 c0 b9 80 00 00 c0 48 09 d0 48 89 05 cb db
  RIP  [<ffffffffc067e506>] 0xffffffffc067e506
  =C2=A0RSP <ffff880002e03d70>
  ---[ end trace b3284b6520f49e0d ]---

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1563152/+subscriptions

