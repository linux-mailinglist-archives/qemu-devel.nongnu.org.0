Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BCF1AAF11
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 19:05:16 +0200 (CEST)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOlTP-0003IC-AT
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 13:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jOl0l-000181-0c
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 12:35:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jOl0j-0003ZH-QT
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 12:35:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:54692)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jOl0j-0003Z9-Lc
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 12:35:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jOl0i-00056N-Av
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 16:35:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4D85A2E8104
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 16:35:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Apr 2020 16:25:44 -0000
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mikegav
X-Launchpad-Bug-Reporter: Mikhail Gavrilov (mikegav)
X-Launchpad-Bug-Modifier: Mikhail Gavrilov (mikegav)
Message-Id: <158696794416.12296.17436515324844466583.malonedeb@soybean.canonical.com>
Subject: [Bug 1873032] [NEW] After upgrade qemu to 5.0.0-0.3.rc2.fc33 the
 virtual machine with Windows 10 after a while starts to work very slowly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e60e734822e607365317cc2b265dc2e4f578a819
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Wed, 15 Apr 2020 13:03:53 -0400
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
Reply-To: Bug 1873032 <1873032@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Description of problem:

After upgrade qemu to 5.0.0-0.3.rc2.fc33 the virtual machine with
Windows 10 after a while starts to work very slowly

I created the virtual machine with Windows 10 with the following config:
- 1 CPU
- 2GB RAM
- With network access

I launch there a web browser there with flash content. =

And usually, the system (Windows 10) does not work there for more than an h=
our.
When the system starts to work very slowly it doesn't respond to "Reboot" a=
nd "Shut Down" commands. Only works "Force Reset" and "Force Off". But when=
 I reboot the system with "Force Reset" it usually stuck at boot at the Win=
dows splash screen. https://imgur.com/yGyacDG

The last version of qemu which not contain this issue is
5.0.0-0.2.rc0.fc33

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "win10.log"
   https://bugs.launchpad.net/bugs/1873032/+attachment/5354690/+files/win10=
.log

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873032

Title:
  After upgrade qemu to 5.0.0-0.3.rc2.fc33 the virtual machine with
  Windows 10 after a while starts to work very slowly

Status in QEMU:
  New

Bug description:
  Description of problem:

  After upgrade qemu to 5.0.0-0.3.rc2.fc33 the virtual machine with
  Windows 10 after a while starts to work very slowly

  I created the virtual machine with Windows 10 with the following config:
  - 1 CPU
  - 2GB RAM
  - With network access

  I launch there a web browser there with flash content. =

  And usually, the system (Windows 10) does not work there for more than an=
 hour.
  When the system starts to work very slowly it doesn't respond to "Reboot"=
 and "Shut Down" commands. Only works "Force Reset" and "Force Off". But wh=
en I reboot the system with "Force Reset" it usually stuck at boot at the W=
indows splash screen. https://imgur.com/yGyacDG

  The last version of qemu which not contain this issue is
  5.0.0-0.2.rc0.fc33

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873032/+subscriptions

