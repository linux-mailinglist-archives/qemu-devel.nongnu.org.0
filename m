Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A8B1DA784
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 03:51:41 +0200 (CEST)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbDtU-0001ti-L9
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 21:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jbDsY-0001Bu-Fy
 for qemu-devel@nongnu.org; Tue, 19 May 2020 21:50:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jbDsW-0000xx-TV
 for qemu-devel@nongnu.org; Tue, 19 May 2020 21:50:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jbDsU-0005Hg-Rl
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 01:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CFF702E806D
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 01:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2020 01:41:07 -0000
From: cliff chen <1879425@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cliffchen
X-Launchpad-Bug-Reporter: cliff chen (cliffchen)
X-Launchpad-Bug-Modifier: cliff chen (cliffchen)
References: <158985197617.30924.14122012304587735670.malonedeb@chaenomeles.canonical.com>
Message-Id: <158993886758.31351.13131516430257538828.malone@chaenomeles.canonical.com>
Subject: [Bug 1879425] Re: The thread of "CPU 0 /KVM" keeping 99.9%CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 420ea351ed718eb7ae8f587eb38abe090fd73f6b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 20:30:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1879425 <1879425@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

one changes:
Guest VM is Red Hat Enterprise Linux 8.1 (Ootpa).
there is no issue once guest VM is RHEL7.6.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879425

Title:
  The thread of "CPU 0 /KVM" keeping 99.9%CPU

Status in QEMU:
  New

Bug description:
  Hi Expert:

  The VM is hung here after (2, or 3, or 5 and the longest time is 10 hours=
) by qemu-kvm.
  Notes: =

  for VM:
    OS: RHEL 7.6
    CPU: 1
    MEM:4G
  For qemu-kvm:
    1) version:
       /usr/libexec/qemu-kvm -version
       QEMU emulator version 2.10.0(qemu-kvm-ev-2.10.0-21.el7_5.4.1)
    2) once the issue is occurred, the CPU of "CPU0 /KVM" is more than 99% =
by com "top -p VM_pro_ID"
      PID  UDER   PR NI RES   S  % CPU %MEM  TIME+    COMMAND
  872067   qemu   20 0  1.6g  R   99.9  0.6  37:08.87 CPU 0/KVM
    3) use "pstack 493307" and below is function trace
  Thread 1 (Thread 0x7f2572e73040 (LWP 872067)):
  #0  0x00007f256cad8fcf in ppoll () from /lib64/libc.so.6
  #1  0x000055ff34bdf4a9 in qemu_poll_ns ()
  #2  0x000055ff34be02a8 in main_loop_wait ()
  #3  0x000055ff348bfb1a in main ()
    4) use strace "strace -tt -ff -p 872067 -o cfx" and below log keep prin=
ting
  21:24:02.977833 ppoll([{fd=3D4, events=3DPOLLIN}, {fd=3D6, events=3DPOLLI=
N}, {fd=3D8, events=3DPOLLIN}, {fd=3D9, events=3DPOLLIN}, {fd=3D80, events=
=3DPOLLIN}, {fd=3D82, events=3DPOLLIN}, {fd=3D84, events=3DPOLLIN}, {fd=3D1=
15, events=3DPOLLIN}, {fd=3D121, events=3DPOLLIN}], 9, {0, 0}, NULL, 8) =3D=
 0 (Timeout)
  21:24:02.977918 ppoll([{fd=3D4, events=3DPOLLIN}, {fd=3D6, events=3DPOLLI=
N}, {fd=3D8, events=3DPOLLIN}, {fd=3D9, events=3DPOLLIN}, {fd=3D80, events=
=3DPOLLIN}, {fd=3D82, events=3DPOLLIN}, {fd=3D84, events=3DPOLLIN}, {fd=3D1=
15, events=3DPOLLIN}, {fd=3D121, events=3DPOLLIN}], 9, {0, 911447}, NULL, 8=
) =3D 0 (Timeout)
  21:24:02.978945 ppoll([{fd=3D4, events=3DPOLLIN}, {fd=3D6, events=3DPOLLI=
N}, {fd=3D8, events=3DPOLLIN}, {fd=3D9, events=3DPOLLIN}, {fd=3D80, events=
=3DPOLLIN}, {fd=3D82, events=3DPOLLIN}, {fd=3D84, events=3DPOLLIN}, {fd=3D1=
15, events=3DPOLLIN}, {fd=3D121, events=3DPOLLIN}], 9, {0, 0}, NULL, 8) =3D=
 0 (Timeout)
  Therefore, I think the thread "CPU 0/KVM" is in tight loop.
    5) use reset can recover this issue. however, it will reoccurred again.
  Current work around is increase one CPU for this VM, then issue is gone.

  thanks
  Cliff

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879425/+subscriptions

