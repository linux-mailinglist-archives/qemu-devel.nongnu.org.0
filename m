Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFD2B00EE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 09:12:41 +0100 (CET)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd7ii-0007kY-Av
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 03:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd7hI-0007Gp-6u
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 03:11:12 -0500
Received: from indium.canonical.com ([91.189.90.7]:35012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd7hF-0007JE-U1
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 03:11:11 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kd7hD-0002Iq-VD
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 08:11:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EA3202E800F
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 08:11:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 07:57:15 -0000
From: Thomas Huth <1793608@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth vectorchiefrocks
X-Launchpad-Bug-Reporter: Sergey Evlashev (vectorchiefrocks)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153748074011.25030.16967898413781929774.malonedeb@gac.canonical.com>
Message-Id: <160516783541.24713.13621316649842407633.malone@wampee.canonical.com>
Subject: [Bug 1793608] Re: qemu doesn't seem to support lxvwsx for POWER9
 target
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: e255aafbf695ff0cfef741cc02746b51a3e0e6f7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 01:35:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1793608 <1793608@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A patch has been posted here:
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02218.html
("ppc/translate: Implement lxvwsx opcode")

** Changed in: qemu
       Status: New =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793608

Title:
  qemu doesn't seem to support lxvwsx for POWER9 target

Status in QEMU:
  In Progress

Bug description:
  When running a simple program built for POWER9 on QEMU 3.0.0 in linux-
  user mode, it crashes with a message: "illegal instruction". It turns
  out that lxvwsx instruction "Load Word and Splat Indexed" is not
  supported. If workaround is implemented by issuing two separate
  instructions (first load then splat) then all tests pass correctly.

  Operating system: Ubuntu Mate 16.04.2 64-bit (or Linux Mint 18 64-bit).
  Cross-compiler for gcc-powerpc64le-linux-gnu is installed (gcc-5 series).
  QEMU 3.0.0 is built from source and installed with: sudo make install

  The program in question: https://github.com/VectorChief/UniSIMD-assembler
  Turn off the workaround: RT_ELEM_COMPAT_PW9 should be set to 1 in the fol=
lowing file:
  https://github.com/VectorChief/UniSIMD-assembler/blob/master/core/config/=
rtarch_p32_128x1v2.h

  Change to the "test" directory and type "make -f simd_make_p64.mk".
  powerpc64le-linux-gnu-objdump -d simd_test.p64_32Lp9 > simd_test_p64_32Lp=
9.txt
  Open newly created text file simd_test_p64_32Lp9.txt and search for lxvws=
x (in s_test01, ...)
  The instruction shows up in objdump correctly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1793608/+subscriptions

