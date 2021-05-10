Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376C6377B53
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 06:52:48 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfxuR-0004et-7l
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 00:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxsT-0001yy-Ku
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:50:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:51840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxsP-0002sN-JZ
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:50:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfxsN-00017z-G4
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 78A862E8187
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 04:42:52 -0000
From: Thomas Huth <1905562@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jamespharvey20 th-huth
X-Launchpad-Bug-Reporter: James Harvey (jamespharvey20)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160630934472.9591.9894580742878185011.malonedeb@soybean.canonical.com>
Message-Id: <162062177220.2870.16240502805937575165.malone@wampee.canonical.com>
Subject: [Bug 1905562] Re: Guest seems suspended after host freed memory for
 it using oom-killer
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 97c59255509d2c1783ddcd0f5b56beac6f6c177f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1905562 <1905562@bugs.launchpad.net>
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

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905562

Title:
  Guest seems suspended after host freed memory for it using oom-killer

Status in QEMU:
  Incomplete

Bug description:
  Host: qemu 5.1.0, linux 5.5.13
  Guest: Windows 7 64-bit

  This guest ran a memory intensive process, and triggered oom-killer on
  host.  Luckily, it killed chromium.  My understanding is this should
  mean qemu should have continued running unharmed.  But, the spice
  connection shows the host system clock is stuck at the exact time oom-
  killer was triggered.  The host is completely unresponsive.

  I can telnet to the qemu monitor.  "info status" shows "running".
  But, multiple times running "info registers -a" and saving the output
  to text files shows the registers are 100% unchanged, so it's not
  really running.

  On the host, top shows around 4% CPU usage by qemu.  strace shows
  about 1,000 times a second, these 6 lines repeat:

  0.000698 ioctl(18, KVM_IRQ_LINE_STATUS, 0x7fff1f030c10) =3D 0 <0.000010>
  0.000034 ioctl(18, KVM_IRQ_LINE_STATUS, 0x7fff1f030c60) =3D 0 <0.000009>
  0.000031 ioctl(18, KVM_IRQ_LINE_STATUS, 0x7fff1f030c20) =3D 0 <0.000007>
  0.000028 ioctl(18, KVM_IRQ_LINE_STATUS, 0x7fff1f030c70) =3D 0 <0.000007>
  0.000030 ppoll([{fd=3D4, events=3DPOLLIN}, {fd=3D6, events=3DPOLLIN}, {fd=
=3D7, events=3DPOLLIN}, {fd=3D8, events=3DPOLLIN}, {fd=3D9, events=3DPOLLIN=
}, {fd=3D11, events         =3DPOLLIN}, {fd=3D16, events=3DPOLLIN}, {fd=3D3=
2, events=3DPOLLIN}, {fd=3D34, events=3DPOLLIN}, {fd=3D39, events=3DPOLLIN}=
, {fd=3D40, events=3DPOLLIN}, {fd=3D41, events=3DPOLLI         N}, {fd=3D42=
, events=3DPOLLIN}, {fd=3D43, events=3DPOLLIN}, {fd=3D44, events=3DPOLLIN},=
 {fd=3D45, events=3DPOLLIN}], 16, {tv_sec=3D0, tv_nsec=3D0}, NULL, 8) =3D 0=
 (Timeout)          <0.000009>
  0.000043 ppoll([{fd=3D4, events=3DPOLLIN}, {fd=3D6, events=3DPOLLIN}, {fd=
=3D7, events=3DPOLLIN}, {fd=3D8, events=3DPOLLIN}, {fd=3D9, events=3DPOLLIN=
}, {fd=3D11, events         =3DPOLLIN}, {fd=3D16, events=3DPOLLIN}, {fd=3D3=
2, events=3DPOLLIN}, {fd=3D34, events=3DPOLLIN}, {fd=3D39, events=3DPOLLIN}=
, {fd=3D40, events=3DPOLLIN}, {fd=3D41, events=3DPOLLI         N}, {fd=3D42=
, events=3DPOLLIN}, {fd=3D43, events=3DPOLLIN}, {fd=3D44, events=3DPOLLIN},=
 {fd=3D45, events=3DPOLLIN}], 16, {tv_sec=3D0, tv_nsec=3D769662}, NULL, 8) =
=3D 0 (Tim         eout) <0.000788>

  In the monitor, "info irq" shows IRQ 0 is increasing about 1,000 times
  a second.  IRQ 0 seems to be for the system clock, and 1,000 times a
  second seems to be the frequency a windows 7 guest might have the
  clock at.

  Those fd's are for: (9) [eventfd]; [signalfd], type=3DSTREAM, 4 x the
  spice socket file, and "TCP localhost:ftnmtp->localhost:36566
  (ESTABLISHED)".

  Because the guest's registers aren't changing, it seems to me like
  monitor thinks the VM is running, but it's actually effectively in a
  paused state.  I think all the strace activity shown above must be
  generated by the host.  Perhaps it's repeatedly trying to contact the
  guest to inject a new clock, and communicate with it on the various
  eventfd's, spice socket, etc.  So, I'm thinking the strace doesn't
  give any information about the real reason why the VM is acting as if
  it's paused.

  I've checked "info block", and there's nothing showing that a device
  is paused, or that there's any issues with them.  (Can't remember what
  term can be there, but a paused/blocked/etc block device I think
  caused a VM to act like this for me in the past.)

  =

  Is there something I can provide to help fix the bug here?

  Is there something I can do, to try to get the VM running again?  (I
  sadly have unsaved work in it.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905562/+subscriptions

