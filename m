Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A43AFC01
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:35:02 +0200 (CEST)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvY7p-0000ba-OB
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzG-0005mO-K1
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:55438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXz9-0004hn-MQ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXz5-00014w-H3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E8AF02E819B
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:46 -0000
From: Launchpad Bug Tracker <1854878@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ben321 janitor th-huth
X-Launchpad-Bug-Reporter: Ben321 (ben321)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157533223880.21849.7736454567189329387.malonedeb@soybean.canonical.com>
Message-Id: <162433552695.20423.3766836714994054687.malone@loganberry.canonical.com>
Subject: [Bug 1854878] Re: Physical USB thumbdrive treated as read-only
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 3f602d82f471e4af7dca11693bc163037c22e8c1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1854878 <1854878@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1854878

Title:
  Physical USB thumbdrive treated as read-only

Status in QEMU:
  Expired

Bug description:
  So I have installed FreeDOS on my USB thumbdrive, by using Rufus.
  Everything goes as expected so far. That's good.

  When I run QEMU with this command line:
  qemu-system-x86_64.exe -drive file=3D\\.\PhysicalDrive1

  it of course is read-only, just like the resulting console message says:
  WARNING: Image format was not specified for '\\.\PhysicalDrive1' and prob=
ing guessed raw.
           Automatically detecting the format is dangerous for raw images, =
write operations on block 0 will be restricted.
           Specify the 'raw' format explicitly to remove the restrictions.

  =

  So what I then did, was I ran QEMU with this command line:
  qemu-system-x86_64.exe -drive file=3D\\.\PhysicalDrive1,format=3Draw

  As expected, the above mentioned console message no longer appears.
  However, beyond that, QEMU doesn't behave as it should regarding read-onl=
y status. When I try any operation that involves writing to the drive, it b=
ecomes quite clear that the drive is still read-only. Any writing operation=
s to the drive result in FreeDOS giving me the error message:
  Error writing to drive C: DOS area: sector not found.

  The above situation is clearly a bug. QEMU should not be treating it
  as read-only once I specify format=3Draw.

  Note that drive C is how the guest OS refers to the USB thumbdrive
  (it's drive E in my host OS, and drive C in my host OS is the actual
  system drive).

  And yes, it is a QEMU bug. It's not a FreeDOS bug I tested it with this c=
ommand line, so that all changes would be written to a temporary snapshot f=
ile:
  qemu-system-x86_64.exe -drive file=3D\\.\PhysicalDrive1,format=3Draw,snap=
shot
  That last drive option "snapshot" tells QEMU to create a temporary snapsh=
ot file, and to write all changes to that. When I do that, all write operat=
ions are successful. So it seems that there is a bug in QEMU where it keeps=
 read-only mode in place for a physical drive, even when format=3Draw is sp=
ecified. Please fix this bug. Thanks in advance.

  Here's my current setup.
  Host OS: Windows 10 (64bit)
  Guest OS: FreeDOS
  QEMU version: 4.1.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1854878/+subscriptions

