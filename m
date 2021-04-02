Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14623526BD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 08:52:53 +0200 (CEST)
Received: from localhost ([::1]:42676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSDfo-00035U-MZ
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 02:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lSDeI-0002D5-JT
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 02:51:18 -0400
Received: from indium.canonical.com ([91.189.90.7]:41206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lSDeG-0000GG-Q4
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 02:51:18 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lSDeE-0008QR-A7
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 06:51:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4A3C72E8165
 for <qemu-devel@nongnu.org>; Fri,  2 Apr 2021 06:51:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Apr 2021 06:33:56 -0000
From: promeneur <1873335@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: epistemepromeneur ruthan
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: promeneur (epistemepromeneur)
References: <158706530687.6368.4226982042682182002.malonedeb@chaenomeles.canonical.com>
Message-Id: <161734523674.24005.16087728315758916331.malone@chaenomeles.canonical.com>
Subject: [Bug 1873335] Re: Dos Keypad is not working for numbers - numlock is
 not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 8f5e35ff664d6be1c614d61fe88b7347e494235f
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
Reply-To: Bug 1873335 <1873335@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I made the following experiments

openSuse 15.2
kde environment
qemu 4.2.1 and 5.2.0

VM: android-x86-7.1-r5 (www.android-x86.org)

1.

i add a standard 102 keys PC keyboard with "-device usb-kbd"

for host numlock is "on"
i launch the VM
for host numlock is on. We can use the numeric keypad.
for guest numlock is off! We can't use the numeric keypad.

Now to add the keyboard instead of "-device usb-kbd" I use "-device usb-
host, vendorid=3D<hex number>,productid=3D <hex number>

for host numlock is "on"
I launch the VM
for host numlock is on. We can use the numeric keypad.
for guest numlock is on. We can use the numeric keypad.

2.

I add a standard 102 keys PC keyboard with "-device usb-kbd"

for the host the keyboard is in state "numlock on"
launch the VM
wait for launching is finished

for the host the keyboard is in state "numlock on". We see that the numlock=
 ligh is on. We can use the numeric keypad.
but for the guest the keyboard is in state "numlock off" ! We can't use the=
 numeric keypad.

type the key "numlock". the numlock light is switched off.

for the host the keyboard is in the state "numlock off". We can't use the n=
umeric keypad to write 0...9, "."
for the guest the keyboard is in the state "numlock on" ! We can use the nu=
meric keypad to write 0...9, "."

retype the key "numlock"

this time the numeric keypad is in state "numlock on" for the host and
the guest. We can use the numeric keypad for the host and for the guest
!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873335

Title:
  Dos Keypad is not working for numbers - numlock is not working

Status in QEMU:
  New

Bug description:
  Hello,
  i tried to use Qemu 4.2 for Dos, but there is problem what in Dos is not =
possible turn on Numlock for input numbers, so games need it.. Numlock only=
 working as arrow keys.
  =C2=A0=C2=A0I tested bough Windows and Linux builds.

  With same setting, when i use Windows 98 or later os, numlock is
  working fine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873335/+subscriptions

