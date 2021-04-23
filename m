Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DC0368C2D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 06:27:24 +0200 (CEST)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZnPW-00073h-T9
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 00:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZnO3-0006E3-32
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:25:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:60678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZnNx-0000VN-FK
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:25:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZnNu-0000Ng-B8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:25:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 532AD2E815F
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Apr 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1879425@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cliffchen janitor th-huth
X-Launchpad-Bug-Reporter: cliff chen (cliffchen)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158985197617.30924.14122012304587735670.malonedeb@chaenomeles.canonical.com>
Message-Id: <161915143720.2122.18332112008256389892.malone@loganberry.canonical.com>
Subject: [Bug 1879425] Re: The thread of "CPU 0 /KVM" keeping 99.9%CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: ee5169482ce2da81eba0355199fe6af5508d0cc5
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
Reply-To: Bug 1879425 <1879425@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879425

Title:
  The thread of "CPU 0 /KVM" keeping 99.9%CPU

Status in QEMU:
  Expired

Bug description:
  Hi Expert:

  The VM is hung here after (2, or 3, or 5 and the longest time is 10 hours=
) by qemu-kvm.
  Notes:
  for VM:
  =C2=A0=C2=A0OS: RHEL8.1
  =C2=A0=C2=A0CPU: 1
  =C2=A0=C2=A0MEM:4G
  For qemu-kvm(host kernel RHEL7):
  =C2=A0=C2=A01) version:
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/usr/libexec/qemu-kvm -version
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0QEMU emulator version 2.10.0(qemu-kvm-ev-2.=
10.0-21.el7_5.4.1)
  =C2=A0=C2=A02) once the issue is occurred, the CPU of "CPU0 /KVM" is more=
 than 99% by com "top -p VM_pro_ID"
  =C2=A0=C2=A0=C2=A0=C2=A0PID  UDER   PR NI RES   S  % CPU %MEM  TIME+    C=
OMMAND
  872067   qemu   20 0  1.6g  R   99.9  0.6  37:08.87 CPU 0/KVM
  =C2=A0=C2=A03) use "pstack 493307" and below is function trace
  Thread 1 (Thread 0x7f2572e73040 (LWP 872067)):
  #0  0x00007f256cad8fcf in ppoll () from /lib64/libc.so.6
  #1  0x000055ff34bdf4a9 in qemu_poll_ns ()
  #2  0x000055ff34be02a8 in main_loop_wait ()
  #3  0x000055ff348bfb1a in main ()
  =C2=A0=C2=A04) use strace "strace -tt -ff -p 872067 -o cfx" and below log=
 keep printing
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
  =C2=A0=C2=A05) use reset can recover this issue. however, it will reoccur=
red again.
  Current work around is increase one CPU for this VM, then issue is gone.

  thanks
  Cliff

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879425/+subscriptions

