Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B5D2AD90F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 15:42:53 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcUrE-0002d9-UO
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 09:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcUpa-00016W-KZ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:41:10 -0500
Received: from indium.canonical.com ([91.189.90.7]:55332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcUpV-00014Y-Pg
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:41:10 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcUpU-0001mY-CN
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 14:41:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 56B892E8041
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 14:41:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 14:25:42 -0000
From: "mike@papersolve.com" <1670175@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: sparc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mark-cave-ayland michal-nowak-b mike-papersolve
 th-huth wzis
X-Launchpad-Bug-Reporter: Michal Nowak (michal-nowak-b)
X-Launchpad-Bug-Modifier: mike@papersolve.com (mike-papersolve)
References: <20170305190118.21996.2136.malonedeb@gac.canonical.com>
Message-Id: <160501834222.28021.17740594365165000097.malone@chaenomeles.canonical.com>
Subject: [Bug 1670175] Re: qemu-system-sparc64 with tribblix-sparc-0m16.iso
 ends with "panic - kernel: no nucleus hblk8 to allocate"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 85be4ac326d7d6b7d9e87fe9c1f2744799247b99
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NAME_EMAIL_DIFF=0.725, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1670175 <1670175@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is still valid, setting to Confirmed.  With the latest qemu as of
today, it fails in a slightly different way, but still does not accept
any keyboard input:

\
\ You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
\ or http://www.opensolaris.org/os/licensing.
\ See the License for WARNING: add_spec: No major number for sf
unix-tte:interpret: exception -13 caught
interpret ' unix-tte is va>tte-data failed with error ffffffffffffffed
WARNING: consconfig: cannot find driver for screen device /pci@1fe,0/pci@1,=
1/QEMU,VGA@2
Hostname: tribblix
Remounting root read/write
Probing for device nodes ...
WARNING: Interrupt not seen after set_features
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
WARNING: ebus0 assigning default interrupt level 1 for device i80420
Preparing image for use
Done mounting /usr filesystem
USB keyboard
 1. Albanian                      25. Latin-American                =

 2. Arabic                        26. Lithuanian                    =

 3. Belarusian                    27. Latvian                       =

 4. Belgian                       28. Macedonian                    =

 5. Brazilian                     29. Malta_UK                      =

 6. Bulgarian                     30. Malta_US                      =

 7. Canadian-Bilingual            31. Norwegian                     =

 8. Croatian                      32. Polish                        =

 9. Czech                         33. Portuguese                    =

10. Danish                        34. Romanian                      =

11. Dutch                         35. Russian                       =

12. Dvorak                        36. Serbia-And-Montenegro         =

13. Estonian                      37. Slovak                        =

14. Finnish                       38. Slovenian                     =

15. French                        39. Spanish                       =

16. French-Canadian               40. Swedish                       =

17. Hungarian                     41. Swiss-French                  =

18. German                        42. Swiss-German                  =

19. Greek                         43. Traditional-Chinese           =

20. Icelandic                     44. TurkishF                      =

21. Italian                       45. TurkishQ                      =

22. Japanese-type6                46. UK-English                    =

23. Japanese                      47. US-English                    =

24. Korean                        =

To select the keyboard layout, enter a number [default 47]:


** Changed in: qemu
       Status: Incomplete =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1670175

Title:
  qemu-system-sparc64 with tribblix-sparc-0m16.iso ends with "panic -
  kernel: no nucleus hblk8 to allocate"

Status in QEMU:
  Confirmed

Bug description:
  > qemu-system-sparc64 -m 1024 -cdrom Downloads/tribblix-sparc-0m16.iso -b=
oot d -nographic
  OpenBIOS for Sparc64
  Configuration device id QEMU version 1 machine id 0
  kernel cmdline =

  CPUs: 1 x SUNW,UltraSPARC-IIi
  UUID: 00000000-0000-0000-0000-000000000000
  Welcome to OpenBIOS v1.1 built on Nov 24 2016 21:23
    Type 'help' for detailed information
  Trying cdrom:f...
  Not a bootable ELF image
  Not a bootable a.out image

  Loading FCode image...
  Loaded 7120 bytes
  entry point is 0x4000
  Evaluating FCode...
  Evaluating FCode...
  Ignoring failed claim for va 10a96a0 memsz 19!
  Ignoring failed claim for va 1000000 memsz d1fb6!
  Ignoring failed claim for va 1402000 memsz 32518!
  Ignoring failed claim for va 1800000 memsz 52ac8!
  SunOS Release 5.11 Version tribblix-m16 64-bit
  Copyright (c) 1983, 2010, Oracle and/or its affiliates. All rights reserv=
ed.
  could not find debugger-vocabulary-hook>threads:interpret: exception -13 =
caught
  interpret \ ident	"%Z%%M%	%I%	%E% SMI"
  \ Copyright 2005 Sun Microsystems, Inc.  All rights reserved.
  \ Use is subject to license terms.
  \
  \ CDDL HEADER START
  \
  \ The contents of this file are subject to the terms of the
  \ Common Development and Distribution License, Version 1.0 only
  \ (the "License").  You may not use this file except in compliance
  \ with the License.
  \
  \ You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
  \ or http://www.opensolaris.org/os/licensing.
  \ See the License for =

  WARNING: add_spec: No major number for sf
  panic - kernel: no nucleus hblk8 to allocate
  EXIT

  QEMU keeps running (CPU is on 100 % all the time), I can interact with
  the prompt:

  0 > boot
  Not a Linux kernel image
  Not a bootable ELF image
  Not a bootable a.out image

  Loading FCode image...
  Unhandled Exception 0x0000000000000018
  PC =3D 0x00000000ffd25310 NPC =3D 0x00000000ffd25314
  Stopping execution

  > qemu-system-sparc64 -version
  QEMU emulator version 2.8.0(Virtualization:Staging / SLE_12_SP2)

  from
  https://build.opensuse.org/package/show/Virtualization:Staging/qemu on
  openSUSE Leap 42.2.

  ISO: http://pkgs.tribblix.org/iso/tribblix-sparc-0m16.iso.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1670175/+subscriptions

