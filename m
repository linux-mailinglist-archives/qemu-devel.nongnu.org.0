Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF63609D4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:53:39 +0200 (CEST)
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1V4-0008B4-60
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lX1TK-000703-7H
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:51:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:47740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lX1TI-0002l0-5H
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:51:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lX1TE-0004ou-JR
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 12:51:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 90C032E8161
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 12:51:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Apr 2021 12:36:12 -0000
From: Peter Maydell <1923663@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awilliamson kashyapc pmaydell
X-Launchpad-Bug-Reporter: Adam Williamson (awilliamson)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161834460731.13851.12350778402155141357.malonedeb@chaenomeles.canonical.com>
Message-Id: <CAFEAcA-=85_YdVpQMURN6TVJ67MRbj4NCx8fAPrWWUFYBWG5aQ@mail.gmail.com>
Subject: Re: [Bug 1923663] [NEW] Can't(?) disable default floppy drive any
 more in qemu 6.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="929bdb49da44562d032228b8f93c5c598dae8678"; Instance="production"
X-Launchpad-Hash: 04da5ca6cfc36461c13ea2cf90323070705909a7
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
Reply-To: Bug 1923663 <1923663@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 at 08:07, Markus Armbruster <armbru@redhat.com> wrote:
> In my opinion, management applications are better off with -nodefaults.
> It's easier to understand than the complicated mess I'm going to
> describe under "Long answer" below.

Is there a mechanism to get QEMU to tell me "what are all the
long options I need to specify explicitly now to get the same
behaviour that I had before I started passing -nodefaults" ?
Otherwise it's a pretty painful route to suggest that people
go down (though I agree that for a management app as opposed to
an individual user it's probably a worthwhile route in the long
term).

-- PMM

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923663

Title:
  Can't(?) disable default floppy drive any more in qemu 6.0

Status in QEMU:
  New

Bug description:
  There's a documented change in qemu 6.0:

  https://qemu-project.gitlab.io/qemu/system/removed-features.html
  #floppy-controllers-drive-properties-removed-in-6-0

  where you can't configure floppy controller device properties with
  -global any more. However, there's a thing you could do with the old
  parameter which I can't figure out a way to do with the documented
  replacement. openQA passed exactly this argument:

  -global isa-fdc.driveA=3D

  and that has the effect of removing/disabling the default floppy
  drive/controller. If you just run `qemu-system-i686` (no other args)
  you'll see the VM briefly try to boot from a floppy drive; if you run
  `qemu-system-i686 -global isa-fdc.driveA=3D` (with an earlier version of
  qemu, obviously) you'll see it does not do so.

  I can't see a way to do this with `-device floppy`. Going by the docs,
  the equivalent should be:

  -device floppy,unit=3D0,drive=3D

  but that does not seem to have the same effect. If you run `qemu-
  system-i686 -device floppy,unit=3D0,drive=3D`, it still tries to boot from
  a floppy drive.

  I see there's a -nodefaults option that disables *all* default
  devices, but I don't think that's what we want here either. We might
  want the other default devices, we just don't want the floppy drive.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923663/+subscriptions

