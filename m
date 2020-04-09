Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D0F1A340E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 14:36:48 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMWQH-0007xU-Pd
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 08:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jMWPG-0007XT-Nd
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:35:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jMWPF-0004oe-IA
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:35:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:58162)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jMWPF-0004l4-CI
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 08:35:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jMWPC-0005Fu-KF
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 12:35:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 964FC2E8107
 for <qemu-devel@nongnu.org>; Thu,  9 Apr 2020 12:35:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2020 12:24:22 -0000
From: Russell Morris <ubuntu@rkmorris.us>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h chewi
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Russell Morris (6-u3untu-h)
References: <158621521246.22866.8297146941622716788.malonedeb@wampee.canonical.com>
Message-Id: <158643506217.11855.10812002473391831794.malone@soybean.canonical.com>
Subject: [Bug 1871250] Re: Failed to create HAX VM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f06a7ac3ec8badc8e6252d147439e4ab2b6ad1e7
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
Reply-To: Bug 1871250 <1871250@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No worries! And my apologies for some confusion too - I was trying
v4.2.0 from the official (recent) downloads, and I think something
wasn't quite right ... so I went back, manually built a clean v4.2.0. It
worked, as you suspected.

Good news is - seems we know the fix. Fast, and quite minor ... doesn't
get better than that. LOL! How to get this in the formal / official
code?

Thanks!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871250

Title:
  Failed to create HAX VM

Status in QEMU:
  New

Bug description:
  Hi,

  I'm running the latest (master) of QEMU, though the version doesn't
  seem to matter - I also checked back to v4.2.0, exactly the same
  issue. And this isn't about the VM (guest), if I even just try to run,

  > "c:\Program Files\qemu\qemu-system-x86_64.exe" -accel hax

  Basically, just get a window to open, with acceleration enabled ... I get,
  Open the vm device error:/dev/hax_vm/vm00, ec:3
  Failed to open vm 0
  Failed to create HAX VM
  No accelerator found.

  But I checked - I have installed Intel HAXM, and verified it's running,
  > sc query intelhaxm
  SERVICE_NAME: intelhaxm
          TYPE               : 1  KERNEL_DRIVER
          STATE              : 4  RUNNING
                                  (STOPPABLE, NOT_PAUSABLE, IGNORES_SHUTDOW=
N)
          WIN32_EXIT_CODE    : 0  (0x0)
          SERVICE_EXIT_CODE  : 0  (0x0)
          CHECKPOINT         : 0x0
          WAIT_HINT          : 0x0

  Just remove the accelerator (-accel hax), and I get a window - so this
  is related to QEMU being able to contact / use the accelerator.

  Help!?!?

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1871250/+subscriptions

