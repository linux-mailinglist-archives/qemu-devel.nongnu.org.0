Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269DA2C0308
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:12:32 +0100 (CET)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8pj-00033S-6h
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kh8oJ-0002GW-BT
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:11:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kh8oH-00022C-8j
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:11:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kh8oF-0003iZ-Au
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 10:10:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 477C02E813C
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 10:10:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 09:56:04 -0000
From: Thomas Huth <1748612@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arnaudalies-py pmaydell th-huth
X-Launchpad-Bug-Reporter: mou (arnaudalies-py)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151826550949.29267.10613371512725916399.malonedeb@chaenomeles.canonical.com>
Message-Id: <160612536432.22566.12221202671533272544.malone@gac.canonical.com>
Subject: [Bug 1748612] Re: qemu-user option -strace -D <file> doesn't work
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 0f37517ba1771cabae48f4ceb749158e71fb1e6a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1748612 <1748612@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this has been fixed here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D4b25a50674de41e72f6b3=
003

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1748612

Title:
  qemu-user option -strace -D <file> doesn't work

Status in QEMU:
  Fix Released

Bug description:
  I have been trying to access qemu -strace output from a script
  The main problem was it was on stderr, the strace output was merged with =
my program's stderr output.
  Then I tried to use the -D option, to log the output to a file.
  This didn't work even if the log file was created, but it was empty.

  I have looked at the source code and found the print function was not
  qemu_log with -strace but gemu_log (to be clear it was GEMU NOT QEMU)

  =

  I have then replaced all gemu_log by qemu_log removed declaration of gemu=
_log and recompiled, it seems to works just fine right now.

  removed declaration here and here:
  https://github.com/qemu/qemu/blob/master/linux-user/main.c#L108
  https://github.com/qemu/qemu/blob/master/linux-user/qemu.h#L203

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1748612/+subscriptions

