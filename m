Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE091007B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 21:58:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLYtA-0006Q6-OB
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 15:58:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hLYrA-0005Qo-NJ
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 15:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hLYqR-0006Zv-2r
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 15:55:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:49446)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hLYqQ-0006YA-T6
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 15:55:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hLYqN-00086g-8x
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 19:55:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 0AFC42E807C
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 19:55:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Apr 2019 19:41:26 -0000
From: kjonca <1618301@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 3u-mail kjonca
X-Launchpad-Bug-Reporter: nivekuil (3u-mail)
X-Launchpad-Bug-Modifier: kjonca (kjonca)
References: <20160830031518.12252.40741.malonedeb@chaenomeles.canonical.com>
Message-Id: <155665328671.13263.4987420655838984732.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18928";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 75fa8a9514076d7db1760b92c8512aeb6641ad9a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1618301] Re: qemu-input: Mouse stops working in
 Windows guest
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
Reply-To: Bug 1618301 <1618301@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same with:
 4.19.0-4-amd64 #1 SMP Debian 4.19.28-2 (2019-03-15) x86_64 GNU/Linux
QEMU emulator version 3.1.0 (Debian 1:3.1+dfsg-7)
and =


Windows 4.0 sp6 workstation.

This guest worked in virtualbox without issues.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1618301

Title:
  qemu-input: Mouse stops working in Windows guest

Status in QEMU:
  New

Bug description:
  ROCCAT Kone XTD mouse will randomly stop working in the guest until
  it's restarted.  Windows Event Viewer shows an error in i8042prt, with
  the message "Could not set the mouse resolution". The XML log:

  - <Event xmlns=3D"http://schemas.microsoft.com/win/2004/08/events/event">
  - <System>
    <Provider Name=3D"i8042prt" /> =

    <EventID Qualifiers=3D"49157">23</EventID> =

    <Level>2</Level> =

    <Task>0</Task> =

    <Keywords>0x80000000000000</Keywords> =

    <TimeCreated SystemTime=3D"2016-08-30T02:52:00.354536300Z" /> =

    <EventRecordID>5708</EventRecordID> =

    <Channel>System</Channel> =

    <Computer>cronus</Computer> =

    <Security /> =

    </System>
  - <EventData>
    <Data /> =

    <Binary>000008000100000000000000170005C03205000000000000000000000000000=
000000000000000000000000000000000</Binary> =

    </EventData>
    </Event>

  Host is running Linux 4.7.2 with QEMU 2.6.1.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1618301/+subscriptions

