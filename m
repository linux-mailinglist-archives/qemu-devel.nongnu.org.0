Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400F370E9B
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:45:31 +0200 (CEST)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldH5u-0002bL-9i
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGmz-0008DC-LR
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:45568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGmr-0008LU-F6
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:25:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGmp-0000pE-6o
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:25:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E55F52E815F
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:25:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:19:43 -0000
From: Thomas Huth <1858046@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: raito-bezarius th-huth
X-Launchpad-Bug-Reporter: Ryan Lahfa (raito-bezarius)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157791695959.3198.15546015289430538780.malonedeb@soybean.canonical.com>
Message-Id: <161997958379.12516.13999500880856736880.malone@soybean.canonical.com>
Subject: [Bug 1858046] Re: qemu-aarch64 hangs on cptofs during a build of
 NixOS SD card image
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 9881da6c978b816d6ec6b79df77706ec091c5408
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
Reply-To: Bug 1858046 <1858046@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1858046

Title:
  qemu-aarch64 hangs on cptofs during a build of NixOS SD card image

Status in QEMU:
  Incomplete

Bug description:
  First, thank you for this incredible project.

  While following this guide to build my own image of NixOS:
  https://nixos.wiki/wiki/NixOS_on_ARM#Compiling_through_QEMU on ARM
  Aarch64.

  I encountered a very strange behavior, qemu is correctly used and
  build most of the binaries until it executes this exact line over
  qemu: https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/make-
  ext4-fs.nix#L55

  At this step, the qemu process goes to 100 % of CPU, hangs in a
  certain syscall I don't know which one (according to strace & gdb
  which has no symbols so breaking and looking the backtrace was
  useless).

  According to iotop, no I/O was done.

  And it spent all its time in this syscall during more than 10 hours,
  which looks anomalous to me.

  I attach some of my CPU info:

  model		: 142
  model name	: Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz
  stepping	: 10
  microcode	: 0x96
  cpu MHz		: 3107.071
  cache size	: 8192 KB

  I'm using a ThinkPad T480 to perform those builds, I'm uncertain of
  how to debug further this issue, I discussed this with some people
  over #nixos-aarch64 and they told me they didn't know how to debug it
  further too.

  I tried all with this package: https://aur.archlinux.org/packages
  /qemu-arm-static/ =E2=80=94=C2=A0I'm currently compiling qemu-git to see =
if it
  happens on upstream too. Will comment when it's done.

  Thank you in advance!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1858046/+subscriptions

