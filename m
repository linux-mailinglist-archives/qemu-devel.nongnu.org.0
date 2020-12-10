Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCAF2D5774
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:44:29 +0100 (CET)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIUu-0008Pk-Fh
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knICa-00082o-HT
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:25:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:36528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knICW-0008Qf-1G
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:25:32 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knICT-00086f-MY
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:25:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6D3602E813C
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:25:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:15:02 -0000
From: Thomas Huth <1598612@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jschwart th-huth
X-Launchpad-Bug-Reporter: Julius Schwartzenberg (jschwart)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160703192444.23593.70037.malonedeb@gac.canonical.com>
Message-Id: <160759170257.31319.12120746421786097195.malone@soybean.canonical.com>
Subject: [Bug 1598612] Re: Windows for Workgroups 3.11 installer crashes with
 a general protection fault
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 71524259a16b955803058d0253236100103d07f5
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
Reply-To: Bug 1598612 <1598612@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has be

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1598612

Title:
  Windows for Workgroups 3.11 installer crashes with a general
  protection fault

Status in QEMU:
  Incomplete

Bug description:
  I used only disk images from here:
  http://ia801606.us.archive.org/zipview.php?zip=3D/22/items/IBM_PC_Compati=
bles_TOSEC_2012_04_23/IBM_PC_Compatibles_TOSEC_2012_04_23.zip

  When I try to install Windows for Workgroups 3.11 on either PC DOS
  2000 or MS-DOS 6.22, the installer crashes after entering the
  graphical part with two dialogs containing:

  Application Error
  WINSETUP caused a General Protection Fault in module <unknown>0EDF:7011WI=
NSETUP will close.

  Application Error
  WINSETUP caused a General Protection Fault in module USER.EXE at 0001:40B=
6.

  And then:
  Standard Mode: Bad Fault in MS-DOS Extender.
  Fault: 000D Stack Dump: 0000 0000 0070
  Raw fault frame: EC=3D0000 IP=3D5EF7 CS=3D037F FL=3D3087 SP=3DFFEE SS=3D0=
2DF

  This happens both with and without KVM. I tested with QEMU from Ubuntu
  14.04 and 16.04 and recent GIT
  (ef8757f1fe8095a256ee617e4dbac69d3b33ae94).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1598612/+subscriptions

