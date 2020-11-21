Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451C2BC029
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 16:10:43 +0100 (CET)
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgUXC-0005E1-1O
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 10:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgUWP-0004gC-UM
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:09:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:58416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgUWL-00035Q-A9
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:09:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgUWH-0007D1-Om
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 15:09:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A56562E813F
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 15:09:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 14:55:59 -0000
From: Peter Maydell <1453613@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: krichter722 pmaydell
X-Launchpad-Bug-Reporter: Karl-Philipp Richter (krichter722)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20150510212848.16381.19321.malonedeb@gac.canonical.com>
Message-Id: <160597055954.24390.5693633376474578638.malone@wampee.canonical.com>
Subject: [Bug 1453613] Re: the help message of the set_password subcommand of
 the qemu monitor isn't usable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: c29536788274982aea1820020b800a8fee6b91cc
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
Reply-To: Bug 1453613 <1453613@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think the 'help' text in the monitor is only really intended as a
brief usage summary reminder (in particular "help" on its own prints the
concatenation of all the "help foo" command help, so having "help foo"
print a long bit of documentation makes "help" output look weird). The
full documentation of each command is in the QEMU documentation proper,
which is now at
https://www.qemu.org/docs/master/system/monitor.html#commands and where
the 'set_password' documentation describes the behaviour more fully.

To make this work in general we'd have to somehow support rendering the
rST-format documentation that ends up in the manual as a user response
in the monitor, which feels like it would be tricky.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1453613

Title:
  the help message of the set_password subcommand of the qemu monitor
  isn't usable

Status in QEMU:
  New

Bug description:
  `help set_password` in qemu monitor prints `set_password protocol
  password action-if-connected -- set spice/vnc password` which doesn't
  allow to figure out how to use this subcommand.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1453613/+subscriptions

