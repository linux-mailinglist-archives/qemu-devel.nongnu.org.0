Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A066A37178A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:08:26 +0200 (CEST)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaBN-0002kd-Oa
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lda81-00076P-A2
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:04:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lda7y-0001iF-Qm
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:04:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lda7w-0007Md-L9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 15:04:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9F2662E805D
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 15:04:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 14:51:05 -0000
From: Thomas Huth <1258626@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: curses keymaps scancode
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jrtc27 th-huth
X-Launchpad-Bug-Reporter: Jessica Clarke (jrtc27)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20131206191703.25702.91020.malonedeb@wampee.canonical.com>
Message-Id: <162005346536.14537.2857536716717622098.malone@wampee.canonical.com>
Subject: [Bug 1258626] Re: Curses Keyboard Broken On OS X
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 005db32350d334d1a784892931be5a987504b1ed
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
Reply-To: Bug 1258626 <1258626@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/98


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #98
   https://gitlab.com/qemu-project/qemu/-/issues/98

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1258626

Title:
  Curses Keyboard Broken On OS X

Status in QEMU:
  Expired

Bug description:
  Whenever I run ``qemu-system-i386 -curses ...'' (with or without a
  ``-k en-gb'') on OS X 10.9, the keyboard does not work properly. For
  example, when attempting to switch to the QEMU console with Alt+2, I
  get:

  ``Warning: no scancode found for keysym 226
  Warning: no scancode found for keysym 130
  Warning: no scancode found for keysym 172''

  I have checked and these scancodes are not mentioned in
  ``share/qemu/keymaps/''. This is using QEMU 1.6.1, but the problem
  also occurs with 1.3.1. Also, in case it makes a difference, I
  installed QEMU using Homebrew.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1258626/+subscriptions

