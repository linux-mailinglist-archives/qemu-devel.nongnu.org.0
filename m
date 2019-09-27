Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04CC092B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 18:07:11 +0200 (CEST)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDslx-00088W-Fq
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 12:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iDr6z-0004A2-Gv
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iDr6y-00040r-5Z
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:20:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:38290)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iDr6x-00040n-WF
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:20:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iDr6w-000369-4a
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 14:20:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1F18D2E80C7
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 14:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Sep 2019 14:10:20 -0000
From: Chris Schneider <1845580@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell shift838
X-Launchpad-Bug-Reporter: Chris Schneider (shift838)
X-Launchpad-Bug-Modifier: Chris Schneider (shift838)
References: <156954986411.15692.14551657231977154875.malonedeb@gac.canonical.com>
Message-Id: <156959342061.19168.16030856373037838591.malone@wampee.canonical.com>
Subject: [Bug 1845580] Re: issue with QEMU on Raspberry Pi failing to access
 CDROM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19056";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 27a6094511901a71b5939bd3198e7cc0d2f7eec6
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
Reply-To: Bug 1845580 <1845580@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command line I am using is:

qemu-system-i386 -hda freedos.hd -cdrom FD12CD.iso -boot order=3Dd

The above command works on a x86 Linux Ubuntu 18.04LTS system without
issues.

1. I downloaded FreeDOS1.2 iso
2. created a blank image with 'qemu-img create freedos.hd 200M' command
3. Started qemu with:

qemu-system-i386 -hda freedos.hd -cdrom FD12CD.iso -boot order=3Dd

Will boot from the ISO but when going through the setup QEMU no longer
has access to the CDROM when needing to copy the packages over.  I drop
exit out of the setup program to a MSDOS prompt and that's when I see
the error when trying to display a directory from the CDROM.


** Attachment added: "Capture1.PNG"
   https://bugs.launchpad.net/qemu/+bug/1845580/+attachment/5291787/+files/=
Capture1.PNG

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1845580

Title:
  issue with QEMU on Raspberry Pi failing to access CDROM

Status in QEMU:
  New

Bug description:
  I am trying to access the CDROM (iso) from QEMU using FreeDOS and I
  get an error when doing a directory for:

  i can boot from the iso but if i exit to access the files from the
  CDROM ISO i get the attached error.

  I believe there is an issue with the QEMU for the Raspberry Pi.

  I am using a Raspberry Pi3 with the latest full Raspbian Buster load

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1845580/+subscriptions

