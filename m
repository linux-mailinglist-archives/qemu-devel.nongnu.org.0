Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CBA2C9E4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 17:13:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVdmi-0003G3-7J
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 11:13:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVdlB-0002Vf-KR
	for qemu-devel@nongnu.org; Tue, 28 May 2019 11:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVdl8-0000AY-0I
	for qemu-devel@nongnu.org; Tue, 28 May 2019 11:11:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:35084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hVdl2-0008UU-BV
	for qemu-devel@nongnu.org; Tue, 28 May 2019 11:11:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hVdkj-0005vP-DJ
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 15:11:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 621F12E80C7
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 15:11:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 May 2019 14:58:07 -0000
From: Alex <1829242@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h nevilad
X-Launchpad-Bug-Reporter: Alex (nevilad)
X-Launchpad-Bug-Modifier: Alex (nevilad)
References: <155792850856.14868.18260779757728395853.malonedeb@gac.canonical.com>
Message-Id: <155905548765.24947.1963288155704131133.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: f315de43997dd420df060ddc080812041d25d860
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

To do this I must crosscompile qemu on a linux host and debug on a
windows host. Is there a gdb for 64-bit windows, since windows debuggers
don't understand DWARF debugging info, and is it possible to give him
paths to source files, since paths on the build machine and the
debugging machine will be different?

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

