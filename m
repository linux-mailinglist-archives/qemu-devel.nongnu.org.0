Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259382BC2AC
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 00:41:32 +0100 (CET)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgcVX-0001gY-7s
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 18:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcTt-00018W-2a
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:39:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:56430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcTm-0004dO-RN
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:39:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgcTl-0001AJ-II
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:39:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 87D832E813B
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:39:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 23:29:55 -0000
From: Peter Maydell <917645@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=helenos; status=Confirmed; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: enhancement ia64 ia64-softmmu itanium qemu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz jakub pmaydell
X-Launchpad-Bug-Reporter: Jakub Jermar (jakub)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20120117134021.32382.93820.malonedeb@gac.canonical.com>
Message-Id: <160600139525.22046.3142118023616219459.malone@gac.canonical.com>
Subject: [Bug 917645] Re: [Feature request] ia64-softmmu wanted
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 7b583449cf18bb83375a37f34638d18ef6de8794
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
Reply-To: Bug 917645 <917645@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project doesn't implement new target architectures or board
models on demand based on wishlist requests; they're a lot of work to
do. Instead we simply code-review and incorporate board models and
architectures as and when people decide to write them and submit the
patches. So there's really no point in having a 'wishlist' bug in the
bug tracker saying "support for board X would be nice", because it will
never happen, unless by the coincidence that somebody happened to
implement and submit it to us anyway.

So I'm going to close this bug as "Won't Fix"; if anybody happens to
want to work with upstream on implementing this board model they are
welcome to do so -- the mechanism for that is to email qemu-devel (with
plans, requests for advice or patches).


** Changed in: qemu
       Status: New =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/917645

Title:
  [Feature request] ia64-softmmu wanted

Status in HelenOS branches:
  Confirmed
Status in QEMU:
  Won't Fix

Bug description:
  Qemu is missing support for full system emulation of the Itanium
  architecture, which is one of the main non-x86 server architectures
  today (despite the alleged decline in popularity). It would be really
  nice if someone had interest in adding full ia64 support to Qemu. Many
  OS projects could then use Qemu as the universal machine emulator for
  development and testing.

  Note that there is an open source Ski simulator which can emulate an
  ia64 CPU, memory and a couple of Ski-specific devices, but the project
  seems inactive and the simulated machine is too simplified (no real
  devices, no real firmware). Moreover, it'd be better to have one tool
  such as Qemu for all architectures of interest rather than one per
  each architecture.

To manage notifications about this bug go to:
https://bugs.launchpad.net/helenos/+bug/917645/+subscriptions

