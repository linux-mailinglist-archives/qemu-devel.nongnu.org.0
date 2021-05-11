Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7137B2C1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 01:46:42 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgc5J-0006nM-G9
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 19:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgc4Q-00064z-6y
 for qemu-devel@nongnu.org; Tue, 11 May 2021 19:45:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:46078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgc4O-0001Et-7g
 for qemu-devel@nongnu.org; Tue, 11 May 2021 19:45:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgc4K-0002Az-Ta
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 23:45:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DF0BC2E8186
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 23:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 23:37:13 -0000
From: p kirkham <1899539@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pkirk08 th-huth
X-Launchpad-Bug-Reporter: p kirkham (pkirk08)
X-Launchpad-Bug-Modifier: p kirkham (pkirk08)
References: <160254104097.31568.12578553334917554127.malonedeb@wampee.canonical.com>
Message-Id: <162077623313.7868.11758187492903639505.malone@wampee.canonical.com>
Subject: [Bug 1899539] Re: keyboard errors in DOS,
 found links to similar errors for reference
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: e8d5e79092bb1e0c805d6acd87f8b2f776d75398
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1899539 <1899539@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which source version should I be applying that patch to? It's partially
failing on 4.1.0, 5.0.0, and 6.0.0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1899539

Title:
  keyboard errors in DOS, found links to similar errors for reference

Status in QEMU:
  Incomplete

Bug description:
  OS: slackware 14.2, updated. qemu version: 4.1.0 (from slackbuild
  script)

  command line: qemu-system-i386 -hda msdos.vhd

  Description of problem: MSDOS 6.22 disk image running gwbasic 3.23.
  Cursor keys and sometimes letter keys are repeated. Cursor keys
  seemingly always, letter keys seem to happen when typing too fast.
  Numpad arrows are not affected.  Also insert key doesnt seem to work
  at all.

  Have found one similar current bug, Bug #1574246 Drunken keyboard in
  go32v2 programs
  https://bugs.launchpad.net/qemu/+bug/1574246?comments=3Dall and a much
  older vbox bug report that seems very similar,
  https://www.virtualbox.org/ticket/58 , and for some reason mentions a
  qemu patch.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1899539/+subscriptions

