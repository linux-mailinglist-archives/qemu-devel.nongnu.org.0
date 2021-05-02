Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCCA370E94
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:43:04 +0200 (CEST)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldH3X-0000c7-Re
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGmv-0008Cy-Vy
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:25:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:45566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGms-0008LT-Pk
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGmp-0000oA-DW
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:25:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 61BDC2E8163
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:25:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:19:09 -0000
From: Thomas Huth <1857449@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cirosantilli philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?Q2lybyBTYW50aWxsaSDlha3lm5vkuovku7Yg?=
 =?utf-8?b?5rOV6L2u5YqfIChjaXJvc2FudGlsbGkp?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157719032956.5393.6667899255989227451.malonedeb@gac.canonical.com>
Message-Id: <161997954926.4732.4166105790632665138.malone@chaenomeles.canonical.com>
Subject: [Bug 1857449] Re: QEMU x86_64 -nographic full system breaks host Bash
 terminal line wrapping state after simulation ends,
 requires reset or "tput smam" to fix it
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 68e09def56d5706e65e1bb2bf35a25de5b179bd7
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
Reply-To: Bug 1857449 <1857449@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857449

Title:
  QEMU x86_64 -nographic full system breaks host Bash terminal line
  wrapping state after simulation ends, requires reset or "tput smam" to
  fix it

Status in QEMU:
  Incomplete

Bug description:
  QEMU 4.2.0 compiled from source, Ubuntu 19.10, open a fresh new gnome
  terminal.

  If you print 1000 =3D chars on the host terminal, then they do wrap
  around the end of the terminal:

  printf "=3D%.0s" {0..1000}

  However, if you first run QEMU:

  x86_64-softmmu/qemu-system-x86_64 -nographic

  and then quit it in any way, e.g. with Ctrl + A, and then re-run on
  the host terminal:

  printf "=3D%.0s" {0..1000}

  then the signs don't wrap around anymore, they just go "off the
  terminal to the right".

  This can be fixed with either:

  reset
  tpam smam

  but unfortunately those don't work in tmux for some reason:
  https://github.com/tmux/tmux/issues/969

  I consider this buggy behavior, QEMU should restore the original
  terminal state if possible.

  Related: https://github.com/cirosantilli/linux-kernel-module-
  cheat/issues/110

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857449/+subscriptions

