Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CAEC98EE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 09:21:41 +0200 (CEST)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFvQi-0004s1-Q5
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 03:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iFvPq-0004RU-0b
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 03:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iFvPo-0008Kl-So
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 03:20:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:59240)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iFvPo-0008KQ-NK
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 03:20:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iFvPn-0005VD-7X
 for <qemu-devel@nongnu.org>; Thu, 03 Oct 2019 07:20:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 30B9A2E8048
 for <qemu-devel@nongnu.org>; Thu,  3 Oct 2019 07:20:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Oct 2019 07:12:48 -0000
From: Rokas Kupstys <1846451@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rokups
X-Launchpad-Bug-Reporter: Rokas Kupstys (rokups)
X-Launchpad-Bug-Modifier: Rokas Kupstys (rokups)
Message-Id: <157008676845.21009.5220720197845563324.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1846451] [NEW] K800 keyboard no longer works when attached to a
 VM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19066";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 655af833445c407cc45811ad0e958279bd0c1ef2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1846451 <1846451@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I use Logitech K800 keyboard which is connected to a PC through Logitech
unifying receiver. In order to control my windows VM i attach unifying
receiver USB device to a VM using "virsh attach-device VM-Name
./device.xml". Device ID as seen in lsusb is 046d:c52b.

As of v4.1.0 keyboard no longer works when attached to a windows VM.
When attached receiver is still at least partially functional. Logitech
pairing utility properly displays paired keyboard, pressing buttons on
the keyboard shows changing indicator icon in pairing utility. Pairing
and unpairing works. Pressing keys however fails to register any key
presses.

Downgrading to v4.0.0 fixes the issue.

device.xml used to attach USB device:
```
<hostdev mode=3D'subsystem' type=3D'usb'>
        <source>
                <vendor id=3D'0x046d'/>
                <product id=3D'0xc52b'/>
        </source>
</hostdev>

```

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "VM xml"
   https://bugs.launchpad.net/bugs/1846451/+attachment/5293902/+files/win10=
.xml

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1846451

Title:
  K800 keyboard no longer works when attached to a VM

Status in QEMU:
  New

Bug description:
  I use Logitech K800 keyboard which is connected to a PC through
  Logitech unifying receiver. In order to control my windows VM i attach
  unifying receiver USB device to a VM using "virsh attach-device VM-
  Name ./device.xml". Device ID as seen in lsusb is 046d:c52b.

  As of v4.1.0 keyboard no longer works when attached to a windows VM.
  When attached receiver is still at least partially functional.
  Logitech pairing utility properly displays paired keyboard, pressing
  buttons on the keyboard shows changing indicator icon in pairing
  utility. Pairing and unpairing works. Pressing keys however fails to
  register any key presses.

  Downgrading to v4.0.0 fixes the issue.

  device.xml used to attach USB device:
  ```
  <hostdev mode=3D'subsystem' type=3D'usb'>
          <source>
                  <vendor id=3D'0x046d'/>
                  <product id=3D'0xc52b'/>
          </source>
  </hostdev>

  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1846451/+subscriptions

