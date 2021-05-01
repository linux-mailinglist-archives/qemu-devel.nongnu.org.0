Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9013705D3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 08:06:54 +0200 (CEST)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcimD-0000CD-Dl
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 02:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcil5-0008DA-AW
 for qemu-devel@nongnu.org; Sat, 01 May 2021 02:05:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:59050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcil3-0003ki-49
 for qemu-devel@nongnu.org; Sat, 01 May 2021 02:05:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcil1-0000fk-Cv
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 06:05:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C4172E8157
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 06:05:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 05:57:53 -0000
From: Thomas Huth <1840777@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm raspi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156630611054.27013.17194308047826699430.malonedeb@soybean.canonical.com>
Message-Id: <161984867313.12215.2807576124049539320.malone@soybean.canonical.com>
Subject: [Bug 1840777] Re: raspi3 machine can not shutdown
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 2f24180092d5f495a3f29c6bd7333810b16f4c27
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
Reply-To: Bug 1840777 <1840777@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/64


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Changed in: qemu
     Assignee: Philippe Mathieu-Daud=C3=A9 (philmd) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #64
   https://gitlab.com/qemu-project/qemu/-/issues/64

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840777

Title:
  raspi3 machine can not shutdown

Status in QEMU:
  Expired

Bug description:
  tag v4.1.0

  Running "shutdown" within a raspi3 image leads to kernel panic:

           Starting Power-Off...
  [   39.719617] systemd-shutdow: 39 output lines suppressed due to ratelim=
iting
  [   39.922997] systemd-shutdown[1]: Syncing filesystems and block devices.
  [   39.962415] systemd-shutdown[1]: Sending SIGTERM to remaining processe=
s...
  [   40.006842] systemd-journald[186]: Received SIGTERM from PID 1 (system=
d-shutdow).
  [   40.060745] systemd-shutdown[1]: Sending SIGKILL to remaining processe=
s...
  [   40.098318] systemd-shutdown[1]: Unmounting file systems.
  [   40.108351] systemd-shutdown[455]: Remounting '/' read-only in with op=
tions 'data=3Dordered'.
  [   40.128919] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=3Dordered
  [   40.152844] systemd-shutdown[1]: All filesystems unmounted.
  [   40.153239] systemd-shutdown[1]: Deactivating swaps.
  [   40.154701] systemd-shutdown[1]: All swaps deactivated.
  [   40.155062] systemd-shutdown[1]: Detaching loop devices.
  [   40.159792] systemd-shutdown[1]: All loop devices detached.
  [   40.201746] kvm: exiting hardware virtualization
  [   40.207628] reboot: Power down
  bcm2835-pm: unimplemented device read (size 4, offset 0x20)
  bcm2835-pm: unimplemented device write (size 4, value 0x5a000555, offset =
0x20)
  bcm2835-pm: unimplemented device write (size 4, value 0x5a00000a, offset =
0x24)
  bcm2835-pm: unimplemented device read (size 4, offset 0x1c)
  bcm2835-pm: unimplemented device write (size 4, value 0x5a000020, offset =
0x1c)
  [   40.229604] systemd-shutdow: 4 output lines suppressed due to ratelimi=
ting
  [   40.230849] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x00000000
  [   40.230849] =

  [   40.231781] CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 4.14.0-3-a=
rm64 #1 Debian 4.14.12-2
  [   40.232470] Hardware name: Raspberry Pi 3 Model B (DT)
  [   40.233206] Call trace:
  [   40.234096] [<ffff00000808a708>] dump_backtrace+0x0/0x280
  [   40.234519] [<ffff00000808a9ac>] show_stack+0x24/0x30
  [   40.234972] [<ffff00000885bb7c>] dump_stack+0x9c/0xc0
  [   40.235378] [<ffff0000080d1bd4>] panic+0x138/0x2b4
  [   40.235805] [<ffff0000080d72d4>] do_exit+0xa04/0xa08
  [   40.236260] [<ffff0000080fa9d8>] SyS_reboot+0x178/0x260
  [   40.236915] Exception stack(0xffff00000802bec0 to 0xffff00000802c000)
  [   40.237487] bec0: fffffffffee1dead 0000000028121969 000000004321fedc a=
dc576109fd73c00
  [   40.237949] bee0: 0000000000000028 8080800000000000 0000ffffad2392f8 7=
f7f7f7f7f7f7f7f
  [   40.238376] bf00: 000000000000008e 0000000000000000 0000000000000069 0=
000000000000000
  [   40.238744] bf20: 0000000000000000 0000000000000020 0000000000000000 0=
000000000000000
  [   40.239101] bf40: 0000aaaabeb9bf10 0000ffffad3030a8 0000000000000001 0=
000000000000000
  [   40.239462] bf60: 0000000000000000 0000aaaaeb6e0040 0000aaaabeb8a008 0=
000fffff7ce8d30
  [   40.239802] bf80: 0000001b00000004 0000aaaabeb8a000 0000fffff7ce8fa8 0=
000000000000000
  [   40.240134] bfa0: 0000aaaabeb9b000 0000fffff7ce8ac0 0000aaaabeb8741c 0=
000fffff7ce8aa0
  [   40.240468] bfc0: 0000ffffad3030c4 0000000000000000 fffffffffee1dead 0=
00000000000008e
  [   40.240809] bfe0: 0000000000000000 0000000000000000 0000000000000000 0=
000000000000000
  [   40.241194] [<ffff0000080837b0>] el0_svc_naked+0x24/0x28
  [   40.241930] Kernel Offset: disabled
  [   40.242197] CPU features: 0x002004
  [   40.242450] Memory Limit: none
  [   40.243063] ---[ end Kernel panic - not syncing: Attempted to kill ini=
t! exitcode=3D0x00000000
  [   40.243063] =

  qemu-system-aarch64: terminating on signal 2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840777/+subscriptions

