Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2B174571
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Feb 2020 07:46:37 +0100 (CET)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7vtT-0004BF-VT
	for lists+qemu-devel@lfdr.de; Sat, 29 Feb 2020 01:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j7vsa-0003hl-Qu
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 01:45:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j7vsZ-0008Fh-8V
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 01:45:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:48962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j7vsZ-0008FL-3B
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 01:45:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j7vsX-0007vx-Fl
 for <qemu-devel@nongnu.org>; Sat, 29 Feb 2020 06:45:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C6D12E80C7
 for <qemu-devel@nongnu.org>; Sat, 29 Feb 2020 06:45:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Feb 2020 06:38:37 -0000
From: Patrick Schleizer <adrelanos@riseup.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrelanos
X-Launchpad-Bug-Reporter: Patrick Schleizer (adrelanos)
X-Launchpad-Bug-Modifier: Patrick Schleizer (adrelanos)
Message-Id: <158295831762.11832.17275327924748594060.malonedeb@wampee.canonical.com>
Subject: [Bug 1865252] [NEW] QEMU Windows Portable Version (with HAXM
 accelerator and QEMU GUI)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0e8422b362f115ebd89f9051fe2779c7b402c0fc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1865252 <1865252@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Please consider providing a QEMU Windows portable [1] [2] [3] version on
official qemu.org.

Reasons:

* This would improve usability, the out of the box user experience of layme=
n (non-technical) users.
* Linux distributions could add the QEMU Windows portable to their installe=
r / live ISO images (and the DVD's autorun.inf). Users who are still runnin=
g on the Windows platform could be having an easy path to try out a Linux d=
istribution by running int inside QEMU. I've seen that in many some years a=
go. Was running Windows. Just open the DVD drive in Windows explorer, doubl=
e click and QEMU (shipped with the ISO) booted the ISO.

Ideally EMU Windows portable version would be bundled with:

* the [QEMU HAXM accelerator] by default. Related ticket: [5]
* a QEMU GUI by default. Related ticket: [6]


[1] When I say "Windows Portable" I mean "USB portable". [4]

[2] A compress archive (zip or so) which after extraction can be
executed without further installation / setup required. As far I know
[https://portableapps.com portableapps.com] is the most popular project
of that kind.

[3] QEMU might already be portable or mostly portable. See:

* https://portableapps.com/search/node/QEMU
* https://www.google.com/search?hl=3Den&q=3Dsite%3Aportableapps.com%20QEMU%=
20portable
* https://www.portablefreeware.com/?id=3D640
* https://willhaley.com/blog/simple-portable-linux-qemu-vm-usb/

But not sure above projects are still maintained. Would be certainly
better if official qemu.org would be providing a QEMU Windows portable
version.

[4] Or more generally "can be run on any external storage medium on any
Windows [10] computer.

[5] https://bugs.launchpad.net/qemu/+bug/1864955

[6] https://bugs.launchpad.net/qemu/+bug/1865248

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865252

Title:
  QEMU Windows Portable Version (with HAXM accelerator and QEMU GUI)

Status in QEMU:
  New

Bug description:
  Please consider providing a QEMU Windows portable [1] [2] [3] version
  on official qemu.org.

  Reasons:

  * This would improve usability, the out of the box user experience of lay=
men (non-technical) users.
  * Linux distributions could add the QEMU Windows portable to their instal=
ler / live ISO images (and the DVD's autorun.inf). Users who are still runn=
ing on the Windows platform could be having an easy path to try out a Linux=
 distribution by running int inside QEMU. I've seen that in many some years=
 ago. Was running Windows. Just open the DVD drive in Windows explorer, dou=
ble click and QEMU (shipped with the ISO) booted the ISO.

  Ideally EMU Windows portable version would be bundled with:

  * the [QEMU HAXM accelerator] by default. Related ticket: [5]
  * a QEMU GUI by default. Related ticket: [6]

  =

  [1] When I say "Windows Portable" I mean "USB portable". [4]

  [2] A compress archive (zip or so) which after extraction can be
  executed without further installation / setup required. As far I know
  [https://portableapps.com portableapps.com] is the most popular
  project of that kind.

  [3] QEMU might already be portable or mostly portable. See:

  * https://portableapps.com/search/node/QEMU
  * https://www.google.com/search?hl=3Den&q=3Dsite%3Aportableapps.com%20QEM=
U%20portable
  * https://www.portablefreeware.com/?id=3D640
  * https://willhaley.com/blog/simple-portable-linux-qemu-vm-usb/

  But not sure above projects are still maintained. Would be certainly
  better if official qemu.org would be providing a QEMU Windows portable
  version.

  [4] Or more generally "can be run on any external storage medium on
  any Windows [10] computer.

  [5] https://bugs.launchpad.net/qemu/+bug/1864955

  [6] https://bugs.launchpad.net/qemu/+bug/1865248

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865252/+subscriptions

