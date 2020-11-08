Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001A2AAA65
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Nov 2020 10:39:03 +0100 (CET)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbhA7-000134-2o
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 04:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kbh6k-0006ay-Oz
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 04:35:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:56942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kbh6i-0006Ui-Fo
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 04:35:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kbh6g-0008Lb-Bd
 for <qemu-devel@nongnu.org>; Sun, 08 Nov 2020 09:35:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 557DC2E8025
 for <qemu-devel@nongnu.org>; Sun,  8 Nov 2020 09:35:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2020 09:26:39 -0000
From: Thomas Huth <1639983@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: keegean paulduf th-huth
X-Launchpad-Bug-Reporter: Paul Dufresne (paulduf)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20161108002106.20066.99780.malonedeb@soybean.canonical.com>
Message-Id: <160482759903.12391.8715147712018202810.malone@gac.canonical.com>
Subject: [Bug 1639983] Re: e1000 EEPROM have bad checksum
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 6e51c138c3f849e1f7ea6e0a93a26b37c2152a71
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 04:10:58
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
Reply-To: Bug 1639983 <1639983@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting all older bugs to
"Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1639983

Title:
  e1000 EEPROM have bad checksum

Status in QEMU:
  Incomplete

Bug description:
  I am using qemu-system-i386 to emulate FreeDOS with e1000 nic card.

  I am using Intel PRODOS v.19.0 (latest version with E1000ODI.COM file).
  E1000ODI.COM v.5.07 (140116)

  http://pclosmag.com/html/issues/201208/page11.html
  Suggest that v.4.75 (120212) was/is working.
  Oldest PRODOS available version seems now 18.5 (June 2013) which I have n=
ot tested yet.

  When running it, it detect: Slot 18, IRQ 11, Port C000.

  But complains:
  EEPROM checksum was incorrect.

  Contact your services network supplier for a replacement.

  paul@paul89473:~$ qemu-system-i386 --version
  QEMU emulator version 2.6.1 (Debian 1:2.6.1+dfsg-0ubuntu5), Copyright (c)=
 2003-2008 Fabrice Bellard
  paul@paul89473:~$

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1639983/+subscriptions

