Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71786372614
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:59:17 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldp1Y-0005rC-HL
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldo1C-0006tj-I5
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:54:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:49258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldo16-0005RS-Af
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:54:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldo12-0002a6-NP
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 05:54:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 70BF32E8199
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 05:54:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 05:44:28 -0000
From: Thomas Huth <1423528@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mbiebl mjt+launchpad-tls th-huth
X-Launchpad-Bug-Reporter: Michael Biebl (mbiebl)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150219122612.20987.32403.malonedeb@gac.canonical.com>
Message-Id: <162010706863.4396.12428369422687355881.malone@chaenomeles.canonical.com>
Subject: [Bug 1423528] Re: setting unsupported timeout for i6300esb watchdog
 causes hw reset
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: dfff1b34b40f11398646f9e86eda40da44aae2e7
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
Reply-To: Bug 1423528 <1423528@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/112


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #112
   https://gitlab.com/qemu-project/qemu/-/issues/112

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1423528

Title:
   setting unsupported timeout for i6300esb watchdog causes hw reset

Status in QEMU:
  Expired

Bug description:
  Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D778291
  Version: 2.1

  systemd utilizes existing watchdog hardware and set's a 10min timer on re=
boot.
  The i6300esb under qemu doesn't like such a timeout, and immediately rese=
ts the hardware:

  The last message one gets is
  [    9.402243] i6300esb: Unexpected close, not stopping watchdog!

  =

  The linked bug report contains information how this bug can easily be rep=
roduced.
  With any image using a recent enough systemd as PID 1 you should be able =
to reproduce it by running

  qemu-system-x86_64 -curses -enable-kvm -device i6300esb -watchdog-
  action reset -hda <image with systemd>

  =

  I'm uncertain if this is a qemu or kernel/driver bug. If the latter, plea=
se re-assign the bug as necessary.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1423528/+subscriptions

