Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F522CA67
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 17:36:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVe9j-0004ng-TV
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 11:36:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVe8a-0004Ry-Gf
	for qemu-devel@nongnu.org; Tue, 28 May 2019 11:35:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVe8Z-0006Ey-5m
	for qemu-devel@nongnu.org; Tue, 28 May 2019 11:35:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:41576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hVe8X-00068S-G7
	for qemu-devel@nongnu.org; Tue, 28 May 2019 11:35:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hVe8V-0001EV-6w
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 15:35:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 327842E80C9
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 15:35:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 May 2019 15:29:18 -0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h nevilad
X-Launchpad-Bug-Reporter: Alex (nevilad)
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <155792850856.14868.18260779757728395853.malonedeb@gac.canonical.com>
Message-Id: <155905735840.12810.15250208449037132232.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 07670038c11e827569478e9c3d670c97661bedd5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1829242] Re: qemu on windows host exits after
 savevm command
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1829242 <1829242@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, no idea - I don't know windows build/debug.
(I know the migration code that savevm uses, which is why I looked at this =
bug)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829242

Title:
  qemu on windows host exits after savevm command

Status in QEMU:
  New

Bug description:
  I'm running qemu-system-i386.exe 3.1.0 with this command line:
  "C:\Program Files\qemu\qemu-system-i386.exe"  -L C:\user\qemu\pc-bios\ -n=
ame win7 -m 4G -uuid 564db62e-e031-b5cf-5f34-a75f8cefa98e -rtc base=3Dlocal=
time -accel hax -hdd C:\VirtualMachines\Dev\Win10x64_VS17\swap.qcow "C:\Vir=
tualMachines\qemu\qemu_win7.qcow"
  Host OS Windows 10 x64, guest OS Wondows 7 x86.

  Wait till the OS loads, go to compat_monitor0 tab and enter command:
  savevm loaded_win
  After a few seconds qemu exits, running it another time and entering comm=
and:
  info snapshots
  says "There is no snapshot available". I've tried rinning it with -accel =
tcg, with same results. I've tried less memory (1G), same results.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829242/+subscriptions

