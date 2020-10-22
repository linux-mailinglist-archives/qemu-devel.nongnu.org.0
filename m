Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C0296083
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 15:58:20 +0200 (CEST)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVb6h-0006vo-60
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 09:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kVauZ-0004Ym-HJ
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 09:45:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:48900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kVauT-0006KN-UJ
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 09:45:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kVauR-0000Ok-1G
 for <qemu-devel@nongnu.org>; Thu, 22 Oct 2020 13:45:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 07FAE2E8132
 for <qemu-devel@nongnu.org>; Thu, 22 Oct 2020 13:45:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2020 13:38:32 -0000
From: Peter Maydell <1900779@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: bytes disassembly mixes
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dennis-restle pmaydell
X-Launchpad-Bug-Reporter: Chaoscode (dennis-restle)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160324353545.18570.15111142462284405315.malonedeb@chaenomeles.canonical.com>
Message-Id: <160337391257.31600.16105620749858959285.malone@gac.canonical.com>
Subject: [Bug 1900779] Re: xp /16i on arm mixes DWords
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bc5a16cfdc4ba776ecdf84a052201ef8fb1f3321"; Instance="production"
X-Launchpad-Hash: f9676154382f17f6018e8cb1f28a09f0b18e80b7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:20:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1900779 <1900779@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the bug report; I've just posted a patch which should fix it:
https://patchew.org/QEMU/20201022132445.25039-1-peter.maydell@linaro.org/

** Changed in: qemu
       Status: Confirmed =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1900779

Title:
  xp /16i on arm mixes DWords

Status in QEMU:
  In Progress

Bug description:
  I was working with qemuand wanted to understag ATAG structure.
  In Monitor mode I used xp /16i 0x100 and I got really confused.
  with xp /16i 0x100:
  At address 0x120 the DWords are 0x00000000, 0x00000004, 0x54410009, 0x747=
36574
  with xp /16x 0x100:
  At address 0x120 the DWords are 0x54410001, 0x00000001, 0x00000001, 0x000=
00000

  from my Terminal:

  (qemu) xp /16x 0x100
  0000000000000100: 0x00000005 0x54410001 0x00000001 0x00001000
  0000000000000110: 0x00000000 0x00000004 0x54410002 0x3c000000
  0000000000000120: 0x00000000 0x00000004 0x54410009 0x74736574
  0000000000000130: 0x00000000 0x00000000 0x00000000 0x00000000
  (qemu) xp /16i 0x100
  0x00000100:  00000005  andeq    r0, r0, r5
  0x00000104:  54410001  strbpl   r0, [r1], #-1
  0x00000108:  00000001  andeq    r0, r0, r1
  0x0000010c:  00001000  andeq    r1, r0, r0
  0x00000110:  00000000  andeq    r0, r0, r0
  0x00000114:  00000004  andeq    r0, r0, r4
  0x00000118:  54410002  strbpl   r0, [r1], #-2
  0x0000011c:  3c000000  .byte    0x00, 0x00, 0x00, 0x3c
  0x00000120:  54410001  strbpl   r0, [r1], #-1
  0x00000124:  00000001  andeq    r0, r0, r1
  0x00000128:  00001000  andeq    r1, r0, r0
  0x0000012c:  00000000  andeq    r0, r0, r0
  0x00000130:  00000004  andeq    r0, r0, r4
  0x00000134:  54410002  strbpl   r0, [r1], #-2
  0x00000138:  3c000000  .byte    0x00, 0x00, 0x00, 0x3c
  0x0000013c:  00000000  andeq    r0, r0, r0
  (increasing length only results in more 00000000  andeq    r0, r0, r0 Lin=
es)

  Version:
  4.2.1Debian 1:4.2-3ubuntu6.6
  Commandline:
  qemu-system-arm -machine raspi2 --nographic -S -s -kernel ./vmlinuz --app=
end "test"
  ./vmlinuz is a x64 linux kernel. I didn't care about architecture because=
 i just wanted to see ATAG structure.
  I also tried
  qemu-system-arm -machine raspi2 --nographic -S -s -kernel ./overview.pdf =
--append "test"
  same result.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1900779/+subscriptions

