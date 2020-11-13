Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992142B2071
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:28:30 +0100 (CET)
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbw5-0005kR-7u
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbu7-0003U0-Ig
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:26:29 -0500
Received: from indium.canonical.com ([91.189.90.7]:53434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbtt-0002jm-7c
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:26:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdbtq-0008I9-5x
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 16:26:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B109C2E8132
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 16:26:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2020 16:11:18 -0000
From: Thomas Huth <1759338@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mike-papersolve th-huth
X-Launchpad-Bug-Reporter: mike@papersolve.com (mike-papersolve)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152217198529.30594.10454069952660679046.malonedeb@gac.canonical.com>
Message-Id: <160528387846.19309.997018144110163328.malone@soybean.canonical.com>
Subject: [Bug 1759338] Re: qemu-system-sparc w/ SS-20 ROM does not add
 processors
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: 8a6691332c524ab69f5e421244f071d5b215d164
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 09:15:41
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
Reply-To: Bug 1759338 <1759338@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1759338

Title:
  qemu-system-sparc w/ SS-20 ROM does not add processors

Status in QEMU:
  Incomplete

Bug description:
  When booting a SPARCstation-20 with the original ROM, qemu does not
  set the number of processors in a way that this ROM can understand it,
  and the ROM always reports only 1 processor installed:

  =

   ~/qemu =EE=82=B0 /usr/local/bin/qemu-system-sparc -bios ./ss20_v2.25_rom=
 -M SS-20 -cpu "TI SuperSparc 60" -smp 2 -nographic

  Power-ON Reset


  =

             SMCC SPARCstation 10/20 UP/MP POST version VRV3.45 (09/11/95)

  =

  CPU_#0       TI, TMS390Z50(3.x)       0Mb External cache

  CPU_#1       ******* NOT installed *******
  CPU_#2       ******* NOT installed *******
  CPU_#3       ******* NOT installed *******

      <<< CPU_00000000 on MBus Slot_00000000 >>> IS RUNNING (MID =3D
  00000008)

  =

  ...

  Cpu #0 TI,TMS390Z50 =

  Cpu #1 Nothing there =

  Cpu #2 Nothing there =

  Cpu #3 Nothing there =


  ...

  SPARCstation 20 (1 X 390Z50), No Keyboard
  ROM Rev. 2.25, 128 MB memory installed, Serial #1193046.
  Ethernet address 52:54:0:12:34:56, Host ID: 72123456.


  =

  (It is necessary use SS-20 since it is the only sun4m model that supports=
 512MB RAM, and I can't get Solaris to install on the SS-20 using OpenBIOS.=
) =


  When booting with OpenBIOS I can't seem to boot any version of Solaris
  though I had heard this did work.  Solaris 8 and 9 do work nicely with
  this ROM, but I am opening this to see if it is possible to fix this
  to allow the original OBP ROM to see multiple processors.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1759338/+subscriptions

